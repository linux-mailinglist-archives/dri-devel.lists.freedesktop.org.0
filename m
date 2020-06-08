Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ABA1F2280
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3144789C9C;
	Mon,  8 Jun 2020 23:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91E789C46;
 Mon,  8 Jun 2020 23:08:57 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AADB420890;
 Mon,  8 Jun 2020 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657737;
 bh=56mqz//yRO8dwLkzCXAUJh+8sRp/R6L45fiWOsiVU5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DYpRls70DT4exOyzW+8GaI0GVzFWbv2pKHTt5a+m25+SLHp8YsO8cPVyYD5c3s8gB
 Jh0BSj/JxBiZpizdeZlrg6zphDUI7DWpI28QbJScrGjoI3P2rrPNjLvqjb8swpnHVu
 i2vE6sLJ8XephzYekPp7lc47qIbxi/4kXbh1f/LY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 127/274] drm/amd/display: Do not disable pipe
 split if mode is not supported
Date: Mon,  8 Jun 2020 19:03:40 -0400
Message-Id: <20200608230607.3361041-127-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Sung Lee <sung.lee@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sung Lee <sung.lee@amd.com>

[ Upstream commit 1dfedb39d38f813357885e19badd1971c17f79a7 ]

[WHY]
If mode is not supported, pipe split should not be disabled.
This may cause more modes to fail.

[HOW]
Check for mode support before disabling pipe split.

This commit was previously reverted as it was thought to
have problems, but those issues have been resolved.

Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Yongqiang Sun <yongqiang.sun@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index e4348e3b6389..2719cdecc1cb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2597,19 +2597,24 @@ int dcn20_validate_apply_pipe_split_flags(
 
 	/* Avoid split loop looks for lowest voltage level that allows most unsplit pipes possible */
 	if (avoid_split) {
+		int max_mpc_comb = context->bw_ctx.dml.vba.maxMpcComb;
+
 		for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
 			if (!context->res_ctx.pipe_ctx[i].stream)
 				continue;
 
 			for (vlevel_split = vlevel; vlevel <= context->bw_ctx.dml.soc.num_states; vlevel++)
-				if (context->bw_ctx.dml.vba.NoOfDPP[vlevel][0][pipe_idx] == 1)
+				if (context->bw_ctx.dml.vba.NoOfDPP[vlevel][0][pipe_idx] == 1 &&
+						context->bw_ctx.dml.vba.ModeSupport[vlevel][0])
 					break;
 			/* Impossible to not split this pipe */
 			if (vlevel > context->bw_ctx.dml.soc.num_states)
 				vlevel = vlevel_split;
+			else
+				max_mpc_comb = 0;
 			pipe_idx++;
 		}
-		context->bw_ctx.dml.vba.maxMpcComb = 0;
+		context->bw_ctx.dml.vba.maxMpcComb = max_mpc_comb;
 	}
 
 	/* Split loop sets which pipe should be split based on dml outputs and dc flags */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
