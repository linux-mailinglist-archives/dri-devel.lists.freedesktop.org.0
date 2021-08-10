Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C513E5CEE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 16:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2C6E044;
	Tue, 10 Aug 2021 14:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736D96E043;
 Tue, 10 Aug 2021 14:16:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5638F61052;
 Tue, 10 Aug 2021 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628604965;
 bh=mhIoMzYbjb/1U29H3wpL1LFN0+mfiljrq3FStpfedtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iHMcfMIDpGJvuYBxyhJqw5CYCUKSl9Ga43l2yy5Y0j/7H+rHy2vhdFdAtP+Qc3tce
 qPo0ed+4JIEqOy3bRXLZ+9cyGUvJq/Z75InspOfn5IcAwO8eNNmkaWHqFuOryaLhcW
 wCQIFflx5h6XGG/vDaS9oWvAtA2nVTMjSGgVb11Pmm1ACVtJCt7rhBDNLbGK6okJCE
 9AfDE2BByI+tq/yTZBAUR/k6a9VCd/qqUr6qD7ea6NVQBFciFprd0gQ2tAhDsLk7eh
 o01T087FBeREhguXKtcll2aM4ppMyYNUTmT/oQ2KU2kHR4bCwzO+W/zylDzyl+rIau
 uPryfeZ7wbBJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 20/20] drm/amd/display: workaround for hard hang
 on HPD on native DP
Date: Tue, 10 Aug 2021 10:15:38 -0400
Message-Id: <20210810141538.3117707-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141538.3117707-1-sashal@kernel.org>
References: <20210810141538.3117707-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Qingqing Zhuo <qingqing.zhuo@amd.com>

[ Upstream commit c4152b297d56d3696ad0a9003169bc5b98ad7b72 ]

[Why]
HPD disable and enable sequences are not mutually exclusive
on Linux. For HPDs that spans over 1s (i.e. HPD low = 1s),
part of the disable sequence (specifically, a request to SMU
to lower refclk) could come right before the call to PHY
enable, causing DMUB to access an unresponsive PHY
and thus a hard hang on the system.

[How]
Disable 48mhz refclk off on native DP.

Reviewed-by: Hersen Wu <hersenxs.wu@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 1c6e401dd4cc..0eba391e597f 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -66,9 +66,11 @@ int rn_get_active_display_cnt_wa(
 	for (i = 0; i < context->stream_count; i++) {
 		const struct dc_stream_state *stream = context->streams[i];
 
+		/* Extend the WA to DP for Linux*/
 		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A ||
 				stream->signal == SIGNAL_TYPE_DVI_SINGLE_LINK ||
-				stream->signal == SIGNAL_TYPE_DVI_DUAL_LINK)
+				stream->signal == SIGNAL_TYPE_DVI_DUAL_LINK ||
+				stream->signal == SIGNAL_TYPE_DISPLAY_PORT)
 			tmds_present = true;
 	}
 
-- 
2.30.2

