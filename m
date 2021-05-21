Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6C38C710
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C072D6F642;
	Fri, 21 May 2021 12:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A3D6F642;
 Fri, 21 May 2021 12:51:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F988613DE;
 Fri, 21 May 2021 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621601470;
 bh=VAT+6TRJEy5p0xfa5NF7lAjHEvfhUuINzi99UFg1nws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X8O9zxzzqcVkrceHF1QQ7lUyOOIQ3/UO3b+ofCxLgjbpBSwrJjyrYCiBsMaK1GtGy
 wqR6MB60CNfHqvN2Hn+LkUBOUeG9zHp11zOvgOM8hNKLKLB9NueARrqs/WEjW9W7c/
 xNt8gFm1l6evsvj/lRNbkieAphJ3BzcucWhL9HOBr7Ozo85EQhVsxf0UAOsujYjWa4
 CIv7rZPhk1kbYlG10oRUFMbeLYu5odGzqLQ7OMugPnLW3oFNC9CKN4Lo79WuFuioMR
 myP13sivRYBMcnrjwlhD7Aq7YnAsq3D8O14G0ecovFs5pziMtP+c+4lm5INLDlQbu0
 SN24pwojeUbSw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 12/13] drm/msm/dsi: Add support for DSC configuration
Date: Fri, 21 May 2021 18:19:45 +0530
Message-Id: <20210521124946.3617862-17-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
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

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
 drivers/gpu/drm/msm/dsi/dsi_host.c | 118 ++++++++++++++++++++++++++---
 2 files changed, 118 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 50eb4d1b8fdd..b8e9e608abfc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -2310,4 +2310,14 @@ static inline uint32_t REG_DSI_7nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x00000
 
 #define REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE			0x00000260
 
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
index 864d3c655e73..e26545fc82e0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -954,6 +954,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
 	u32 va_end = va_start + mode->vdisplay;
 	u32 hdisplay = mode->hdisplay;
 	u32 wc;
+	u32 data;
 
 	DBG("");
 
@@ -972,7 +973,69 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
 		hdisplay /= 2;
 	}
 
+	if (msm_host->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		/* update dsc params with timing params */
+		dsc->drm.pic_width = mode->hdisplay;
+		dsc->drm.pic_height = mode->vdisplay;
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
+			u32 reg, intf_width, slice_per_intf, width;
+			u32 total_bytes_per_intf;
+
+			/* first calculate dsc parameters and then program
+			 * compress mode registers
+			 */
+			intf_width = hdisplay;
+			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm.slice_width);
+
+			/* If slice_per_pkt > slice_per_intf, then use 1
+			 * This can happen during partial update
+			 */
+			if (dsc->slice_per_pkt > slice_per_intf)
+				dsc->slice_per_pkt = 1;
+
+			dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm.slice_width * 8, 8);
+			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
+
+			dsc->eol_byte_num = total_bytes_per_intf % 3;
+			dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
+			dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->slice_per_pkt;
+			dsc->pkt_per_line = slice_per_intf / dsc->slice_per_pkt;
+
+			width = dsc->pclk_per_line;
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
@@ -991,19 +1054,50 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
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
+			slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm.slice_width);
+			bytes_in_slice = DIV_ROUND_UP(dsc->drm.slice_width *
+						      dsc->drm.bits_per_pixel, 8);
+			dsc->drm.slice_chunk_size = bytes_in_slice;
+			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
+			dsc->pkt_per_line = slice_per_intf / dsc->slice_per_pkt;
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
+
+		data = DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
+		       DSI_CMD_MDP_STREAM0_CTRL_VIRTUAL_CHANNEL(msm_host->channel) |
+			DSI_CMD_MDP_STREAM0_CTRL_DATA_TYPE(MIPI_DSI_DCS_LONG_WRITE);
 
-		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
-			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
-			DSI_CMD_MDP_STREAM0_CTRL_VIRTUAL_CHANNEL(
-					msm_host->channel) |
-			DSI_CMD_MDP_STREAM0_CTRL_DATA_TYPE(
-					MIPI_DSI_DCS_LONG_WRITE));
+		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL, data);
 
-		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
-			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
-			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
+		data = DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
+			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay);
+		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL, data);
 	}
 }
 
@@ -2111,6 +2205,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	struct platform_device *pdev = msm_host->pdev;
+	struct msm_drm_private *priv;
 	int ret;
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
@@ -2130,6 +2225,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	}
 
 	msm_host->dev = dev;
+	priv = dev->dev_private;
+	priv->dsc = msm_host->dsc;
+
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
 		pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
-- 
2.26.3

