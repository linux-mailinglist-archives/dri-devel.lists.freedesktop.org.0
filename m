Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E163826EAF3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 04:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE44A6E438;
	Fri, 18 Sep 2020 02:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3A86E436
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 02:03:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 425AB21734;
 Fri, 18 Sep 2020 02:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394585;
 bh=OzleeDIta0QfHtPpyIbCwpHJnZGHsVVa7sJkl6FetZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a8HSnMpOPpULYEQxr9atXQSMeKJ4+WZ4xoL9sQykVS56016Fo7qdpkC6QIh1aniJe
 WuDYwzOPU9TIFPbOENkg6cG3FOHEtbj9ACaGGWCFlMwNxy8sVx787RFrdcZmVaQ6lI
 kD/QJ/geDgHm6V85+ISLj581WovOTByq4THFYH4E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 094/330] drm/amd/display: Initialize DSC PPS
 variables to 0
Date: Thu, 17 Sep 2020 21:57:14 -0400
Message-Id: <20200918020110.2063155-94-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Francis <David.Francis@amd.com>

[ Upstream commit b6adc57cff616da18ff8cff028d2ddf585c97334 ]

For DSC MST, sometimes monitors would break out
in full-screen static. The issue traced back to the
PPS generation code, where these variables were being used
uninitialized and were picking up garbage.

memset to 0 to avoid this

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c | 3 +++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index a519dbc5ecb65..5d6cbaebebc03 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -496,6 +496,9 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable)
 		struct dsc_config dsc_cfg;
 		uint8_t dsc_packed_pps[128];
 
+		memset(&dsc_cfg, 0, sizeof(dsc_cfg));
+		memset(dsc_packed_pps, 0, 128);
+
 		/* Enable DSC hw block */
 		dsc_cfg.pic_width = stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right;
 		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
index 1b419407af942..01040501d40e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
@@ -207,6 +207,9 @@ static bool dsc2_get_packed_pps(struct display_stream_compressor *dsc, const str
 	struct dsc_reg_values dsc_reg_vals;
 	struct dsc_optc_config dsc_optc_cfg;
 
+	memset(&dsc_reg_vals, 0, sizeof(dsc_reg_vals));
+	memset(&dsc_optc_cfg, 0, sizeof(dsc_optc_cfg));
+
 	DC_LOG_DSC("Getting packed DSC PPS for DSC Config:");
 	dsc_config_log(dsc, dsc_cfg);
 	DC_LOG_DSC("DSC Picture Parameter Set (PPS):");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
