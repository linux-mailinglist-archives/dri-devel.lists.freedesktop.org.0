Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582A94B0ACF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0C010E7DE;
	Thu, 10 Feb 2022 10:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283BC10E7EE;
 Thu, 10 Feb 2022 10:35:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 753D261B95;
 Thu, 10 Feb 2022 10:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E33C340ED;
 Thu, 10 Feb 2022 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644489327;
 bh=V51Yokz4/nkM1sMfLkFe6kYA28/O+8VdwI6w+UCjRAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YuvRJ/S5/gM9RYyhZlZDo4wB6utxyms2LUhvWKrcUCQBpYwZWk/9JAVZQ6Zn9gwop
 Ix/p3cdy2s0fxMMAognN4PJTrYov+rd+GXN6Q6Ok54widzxyDNVSRCFcAnBhcFSe1x
 HlzSq57BHclhTc4ED0XPOp1u+HPA4B7Qwh2/SZoVVmM+MEhCdSlSu1CIQwuKPgwtTQ
 Wq8EhUMK5G4rKYL8mmAmY5qenvJmLVtLhUsCM6I3Ps1eWb9oCgmvNMqBGHIDYZm3FL
 JXHjsvkyivJIFsRMTdkHjm+8bPBH6roYbc2eFtNqMlDN8zqu8VgZh9vaPeeMz1PL8V
 S7FD6Nq4Q22Tw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [REPOST PATCH v4 13/13] drm/msm/dsi: Add support for DSC configuration
Date: Thu, 10 Feb 2022 16:04:23 +0530
Message-Id: <20220210103423.271016-14-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210103423.271016-1-vkoul@kernel.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DSC is enabled, we need to configure DSI registers accordingly and
configure the respective stream compression registers.

Add support to calculate the register setting based on DSC params and
timing information and configure these registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
 drivers/gpu/drm/msm/dsi/dsi_host.c | 109 ++++++++++++++++++++++++++++-
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 49b551ad1bff..c1c85df58c4b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -706,4 +706,14 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
 #define REG_DSI_CPHY_MODE_CTRL					0x000002d4
 
 
+#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL			0x0000029c
+
+#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL2			0x000002a0
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL			0x000002a4
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2			0x000002a8
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL3			0x000002ac
+
 #endif /* DSI_XML */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 438c80750682..3d8d5a1daaa3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -908,6 +908,20 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
 }
 
+static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
+				  int pic_width, int pic_height)
+{
+	if (!dsc || !pic_width || !pic_height) {
+		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
+		return -EINVAL;
+	}
+
+	dsc->drm->pic_width = pic_width;
+	dsc->drm->pic_height = pic_height;
+
+	return 0;
+}
+
 static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
@@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		hdisplay /= 2;
 	}
 
+	if (msm_host->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		/* update dsc params with timing params */
+		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
+		DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, dsc->drm->pic_height);
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
+		if (msm_host->dsc) {
+			struct msm_display_dsc_config *dsc = msm_host->dsc;
+			u32 reg, intf_width, slice_per_intf;
+			u32 total_bytes_per_intf;
+
+			/* first calculate dsc parameters and then program
+			 * compress mode registers
+			 */
+			intf_width = hdisplay;
+			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
+
+			dsc->drm->slice_count = 1;
+			dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * 8, 8);
+			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
+
+			dsc->eol_byte_num = total_bytes_per_intf % 3;
+			dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
+			dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->drm->slice_count;
+			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
+
+			reg = dsc->bytes_per_pkt << 16;
+			reg |= (0x0b << 8);    /* dtype of compressed image */
+
+			/* pkt_per_line:
+			 * 0 == 1 pkt
+			 * 1 == 2 pkt
+			 * 2 == 4 pkt
+			 * 3 pkt is not supported
+			 * above translates to ffs() - 1
+			 */
+			reg |= (ffs(dsc->pkt_per_line) - 1) << 6;
+
+			dsc->eol_byte_num = total_bytes_per_intf % 3;
+			reg |= dsc->eol_byte_num << 4;
+			reg |= 1;
+
+			dsi_write(msm_host,
+				  REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
+		}
+
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
 			DSI_ACTIVE_H_END(ha_end));
@@ -959,8 +1034,40 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
+		if (msm_host->dsc) {
+			struct msm_display_dsc_config *dsc = msm_host->dsc;
+			u32 reg, reg_ctrl, reg_ctrl2;
+			u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
+
+			reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
+			reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
+
+			slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
+			bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
+						      dsc->drm->bits_per_pixel, 8);
+			dsc->drm->slice_chunk_size = bytes_in_slice;
+			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
+			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
+
+			reg = 0x39 << 8;
+			reg |= ffs(dsc->pkt_per_line) << 6;
+
+			dsc->eol_byte_num = total_bytes_per_intf % 3;
+			reg |= dsc->eol_byte_num << 4;
+			reg |= 1;
+
+			reg_ctrl |= reg;
+			reg_ctrl2 |= bytes_in_slice;
+
+			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
+		}
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
2.31.1

