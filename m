Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2004F195E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C32010E8C7;
	Mon,  4 Apr 2022 16:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FA110E8C7;
 Mon,  4 Apr 2022 16:35:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 160B8B8185A;
 Mon,  4 Apr 2022 16:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D90BC34110;
 Mon,  4 Apr 2022 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649090151;
 bh=47jA1Ev4IsrYaM1Gs1b3o0JyHpaOmmzhpkTOzLXnPfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D9VzfeBhCzkblhtFKUarLZIHTKNpC6ACVcRSsTcLYflUQRAMhPjCVHVVPrhzAKnOA
 Up4KaXd8YC2DfTBgfwsIZQh+2Uzc5chVqPk2HJABC5nH1jFYN+u4QVEhssRA8woG5F
 McjrVJEtSVrHqypJi/UWj9KDR/oHBgWqHTIlpL1duMTHo0RAizmordAvh6cngr3frk
 1wRU1zgTR4WJWdy9YuPgfkfSPHVxU408X0kl35CZT0VXYyksMNTpn8ZeRmzJxrtpG5
 eflMQxottua0/Y4eck35tuiVCHQAtitsAulicC34GXU/Hz09PLLDhWI6up4s8h7ruG
 A27E3jSPOZkgg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v6 14/14] drm/msm/dsi: Add support for DSC configuration
Date: Mon,  4 Apr 2022 22:04:36 +0530
Message-Id: <20220404163436.956875-15-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220404163436.956875-1-vkoul@kernel.org>
References: <20220404163436.956875-1-vkoul@kernel.org>
MIME-Version: 1.0
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DSC is enabled, we need to configure DSI registers accordingly and
configure the respective stream compression registers.

Add support to calculate the register setting based on DSC params and
timing information and configure these registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 98 +++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index eb0be34add45..f3ed6c40b9e1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -912,6 +912,65 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
 }
 
+static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
+{
+	struct msm_display_dsc_config *dsc = msm_host->dsc;
+	u32 reg, intf_width, reg_ctrl, reg_ctrl2;
+	u32 slice_per_intf, total_bytes_per_intf;
+	u32 pkt_per_line;
+	u32 bytes_in_slice;
+	u32 eol_byte_num;
+
+	/* first calculate dsc parameters and then program
+	 * compress mode registers
+	 */
+	intf_width = hdisplay;
+	slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
+
+	/* If slice_per_pkt is greater than slice_per_intf
+	 * then default to 1. This can happen during partial
+	 * update.
+	 */
+	if (slice_per_intf > dsc->drm->slice_count)
+		dsc->drm->slice_count = 1;
+
+	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
+	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * dsc->drm->bits_per_pixel, 8);
+
+	dsc->drm->slice_chunk_size = bytes_in_slice;
+
+	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
+
+	eol_byte_num = total_bytes_per_intf % 3;
+	pkt_per_line = slice_per_intf / dsc->drm->slice_count;
+
+	if (is_cmd_mode) /* packet data type */
+		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
+	else
+		reg = DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE(MIPI_DSI_COMPRESSED_PIXEL_STREAM);
+
+	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
+	 * registers have similar offsets, so for below common code use
+	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 */
+	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
+	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
+	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;
+
+	if (is_cmd_mode) {
+		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
+		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
+
+		reg_ctrl |= reg;
+		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
+
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
+	} else {
+		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
+	}
+}
+
 static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
@@ -944,7 +1003,38 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		hdisplay /= 2;
 	}
 
+	if (msm_host->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		/* update dsc params with timing params */
+		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
+			pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n",
+			       mode->hdisplay, mode->vdisplay);
+			return;
+		}
+
+		dsc->drm->pic_width = mode->hdisplay;
+		dsc->drm->pic_height = mode->vdisplay;
+		DBG("Mode %dx%d\n", dsc->drm->pic_width, dsc->drm->pic_height);
+
+		/* we do the calculations for dsc parameters here so that
+		 * panel can use these parameters
+		 */
+		dsi_populate_dsc_params(dsc);
+
+		/* Divide the display by 3 but keep back/font porch and
+		 * pulse width same
+		 */
+		h_total -= hdisplay;
+		hdisplay /= 3;
+		h_total += hdisplay;
+		ha_end = ha_start + hdisplay;
+	}
+
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		if (msm_host->dsc)
+			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
+
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
 			DSI_ACTIVE_H_END(ha_end));
@@ -963,8 +1053,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
+		if (msm_host->dsc)
+			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
+
 		/* image data and 1 byte write_memory_start cmd */
-		wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+		if (!msm_host->dsc)
+			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+		else
+			wc = mode->hdisplay / 2 + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
-- 
2.34.1

