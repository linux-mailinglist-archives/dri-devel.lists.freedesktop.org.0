Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E793E643
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62D610E233;
	Sun, 28 Jul 2024 15:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TN5WD+D1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A8B10E233;
 Sun, 28 Jul 2024 15:46:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E4226118E;
 Sun, 28 Jul 2024 15:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A84CC116B1;
 Sun, 28 Jul 2024 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181569;
 bh=1tqp+nHZwq+qAriXubdvFO4dlxKzItGsCHYebadlLso=;
 h=From:To:Cc:Subject:Date:From;
 b=TN5WD+D1VgNrjYz8/ckw6q7HWgnH8BSfub7wWxsPFMA9+k6ObkqJ8ji1MGFQZDNJc
 oJgyXF0YOnMR7T1B/Dpfgj+4hpfZE7qcHKl2xdt16MX9ViE7ATT5dzZKHSIXa0Mbp/
 v+oAncPxnb1i5qs99QnfcW7DU/s40AgFs3uZVPAUsQYlCoqTqQEWPXgVl/k2aRR6uc
 oLZPduOdKc7Ri/XVZFEjo/JrK5U7FAQADTx6SCWqHVM27Lcx0r6CLa+I06SfskwXVM
 jISa7uwawzj+OPe0sOwQwDRkENMfSSKcx17uVaKpCpSxd5mcqqLtPqJBl0gpJWCQJw
 XZqiPiMQxFNkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Strauss <michael.strauss@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, stylon.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 01/20] drm/amd/display: Add delay to improve LTTPR
 UHBR interop
Date: Sun, 28 Jul 2024 11:44:59 -0400
Message-ID: <20240728154605.2048490-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Strauss <michael.strauss@amd.com>

[ Upstream commit 10839ee6a977ed1f7d0f4deb29f2d7e5d1f2a9dd ]

[WHY]
Avoid race condition which puts LTTPR into bad state during UHBR LT.

[HOW]
Delay 30ms between starting UHBR TPS1 PHY output and sending TPS1 via DPCD.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
index b621b97711b61..a7f5b0f6272ce 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
@@ -162,7 +162,12 @@ static void set_hpo_fixed_vs_pe_retimer_dp_link_test_pattern(struct dc_link *lin
 		link_res->hpo_dp_link_enc->funcs->set_link_test_pattern(
 				link_res->hpo_dp_link_enc, tp_params);
 	}
+
 	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
+
+	// Give retimer extra time to lock before updating DP_TRAINING_PATTERN_SET to TPS1
+	if (tp_params->dp_phy_pattern == DP_TEST_PATTERN_128b_132b_TPS1_TRAINING_MODE)
+		msleep(30);
 }
 
 static void set_hpo_fixed_vs_pe_retimer_dp_lane_settings(struct dc_link *link,
-- 
2.43.0

