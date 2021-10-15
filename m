Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D742F4E0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 16:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB50C6EDB0;
	Fri, 15 Oct 2021 14:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEC16EDB0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 14:11:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r10so26670290wra.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEwHt84LwZYE1hbDr92/2eorwIYYuYCOmrZ1S3m1274=;
 b=AHzWzfSbl3dPbsYpTNsEpl6QXL6j96ZS1dLTbJDlnbYRghonCqlwt5Zromhz+4M/8t
 NmDHQib8baF7Vhr/4Wt1tWeyGBKeO3ZtO8g3FaW7R6XCILuXGq7uYPFWdKuchGzLSVVa
 b/JfvY+iVMR0UCmt4faggT1UEPiFRFNvzAZngfsT3NGNt342IOf8HaS3MDL6ywOa6VsS
 hAqonfke0fmNkJdyiFOt5s49/BYyzp2YjCFJtu+sCCaCKtY301+ZQslK16SooCp5gHYa
 ToljIVH7xfFfcDQnJjUNQmeQsf1FMb/8bZezH7vOHB08Vip0WGNnWd5nai561VhgzOJI
 bdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEwHt84LwZYE1hbDr92/2eorwIYYuYCOmrZ1S3m1274=;
 b=AEf+ef80rWIvrbPaZpuSbyyelRjITYewtW7l7ARdA78jt/h5oyiI4ujr6QTrL0a4YO
 idC+0ohT8NxKQWcUvXCSKS6aBG4EWWlLzSs4QT1Eeaa32oFvEfWKC5955lVYeQfPqG3u
 onEDS3PTG4Ec4hwwbDVI+YRps2K9A2e3s7DxYuTudJgUGhZMdFQwSXnpnQqcUgyUp24m
 xe045CZmf9/l35kkm4NOQpyxKbh8nA51OGTxeCNsDfR5/arJoq0ajYHBJhjIwCAIVoar
 fssxTnlO9HKnVeU+dPsN4g9dxftNNVLTj6ELfREdn10vjYmvHacJiXePd07amagYoWiM
 PlcQ==
X-Gm-Message-State: AOAM532yVf4simjWKIBEB7bnx/LJ2+GG0qfRLOXdWe5kNn+iz6sianVy
 cWyp2pCLYkcUi+YyCp9E1GLGsw==
X-Google-Smtp-Source: ABdhPJx//A3ZPuP+0vpOI0oxw0LS4N9i+fT+AYyXe+gL0lMeogHoeVNueajjuuiurQqGDF/PFEN5Jw==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr14476127wrp.196.1634307073952; 
 Fri, 15 Oct 2021 07:11:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id f15sm4971434wrt.38.2021.10.15.07.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:11:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 3/6] drm/meson: split out encoder from meson_dw_hdmi
Date: Fri, 15 Oct 2021 16:11:04 +0200
Message-Id: <20211015141107.2430800-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015141107.2430800-1-narmstrong@baylibre.com>
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=30414; h=from:subject;
 bh=2sk4OpsGdDTaW27gDQwK4oUKIhopKWJhprchmMx4Lr8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaYolGzv3pEYKCe0kYTX+cul0Z/bX41X36nxs6Hsq
 9LHueBKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWmKJQAKCRB33NvayMhJ0QSgEA
 C6Y3dKnFlv549BtqDfj8ivRvenCz2dXIDNXEDZOYmvQ73gEdV1xlHg0fD1H4u28GFU6FxHgMBRpFHG
 kkr0QyqsveyKdd/a792WmVbcspkImsMsWF0sjL2NS4L6pABUGvcWgR00BmPpPv1+hFUmBZmOhL/gGf
 9bpTOKKZrNVO5Ax9p9hmmy74k4aO8yEeZ6XokQJpcpp+U0wth+qtvgAUewwMOLv5/zAu1h5QOBwMgt
 cCkYyuwhu0EJiUnI5PFIytT5Tr5/k9vMLXXwYOrA3D6cO5tB1Cpq0mm8FR6CyQzgQOZM0JRTFLdKZL
 /5Cz9uE7x1lpcJTOdo0C2fRasYetrSDwlGar0LMtKOaCdNXNW44aJfovoUZIpovfP14vZzcNVUdjDt
 0/djdRXCuxQAskhzAxOU9q2+Gddbv0gld0CxD/YPglyr9D4YAElfehQoXMhMR64Rvj7v5n8BvAd2nX
 NfTwnCcN6iioeLwhR5MSMQHkQYNl2+cSv66P04hEguF6tfxEv57EnH19Sr6J04xeoq6G/a+0WBad7L
 v5PI11ICseTL7Y8m3AXJjhWnN9zKhE4bTrl5BW0vTzuuDteXzCFytxtWtliHIOCVvJUJtxqQQIKnUM
 waKnxExpK5Gn0qgdKXnvQ9Dd/WJOnIKryW5pTtxKJ9OkoyZdIw29Kf9JLq1w==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

This moves all the non-DW-HDMI code where it should be:
an encoder in the drm/meson core driver.

The bridge functions are copied as-is, except:
- the encoder init uses the simple kms helper
- the mode_set has been moved to atomic_enable()
- debug prints are converted to dev_debg()

For now the bridge attach flags is 0, DRM_BRIDGE_ATTACH_NO_CONNECTOR
will be handled later.

The meson dw-hdmi glue is slighly fixed to live without the
encoder in the same driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/Makefile             |   1 +
 drivers/gpu/drm/meson/meson_drv.c          |   5 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c      | 341 ++-----------------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 375 +++++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h |  12 +
 5 files changed, 412 insertions(+), 322 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h

diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index 28a519cdf66b..523fce45f16b 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -2,6 +2,7 @@
 meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_venc_cvbs.o
 meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
 meson-drm-y += meson_rdma.o meson_osd_afbcd.o
+meson-drm-y += meson_encoder_hdmi.o
 
 obj-$(CONFIG_DRM_MESON) += meson-drm.o
 obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 97ebc07357bb..0978b440f336 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -32,6 +32,7 @@
 #include "meson_osd_afbcd.h"
 #include "meson_registers.h"
 #include "meson_venc_cvbs.h"
+#include "meson_encoder_hdmi.h"
 #include "meson_viu.h"
 #include "meson_vpp.h"
 #include "meson_rdma.h"
@@ -318,6 +319,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		}
 	}
 
+	ret = meson_encoder_hdmi_init(priv);
+	if (ret)
+		goto free_drm;
+
 	ret = meson_plane_create(priv);
 	if (ret)
 		goto free_drm;
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 0afbd1e70bfc..fb540a503efe 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -22,14 +22,11 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_print.h>
 
-#include <linux/media-bus-format.h>
 #include <linux/videodev2.h>
 
 #include "meson_drv.h"
 #include "meson_dw_hdmi.h"
 #include "meson_registers.h"
-#include "meson_vclk.h"
-#include "meson_venc.h"
 
 #define DRIVER_NAME "meson-dw-hdmi"
 #define DRIVER_DESC "Amlogic Meson HDMI-TX DRM driver"
@@ -135,8 +132,6 @@ struct meson_dw_hdmi_data {
 };
 
 struct meson_dw_hdmi {
-	struct drm_encoder encoder;
-	struct drm_bridge bridge;
 	struct dw_hdmi_plat_data dw_plat_data;
 	struct meson_drm *priv;
 	struct device *dev;
@@ -148,12 +143,8 @@ struct meson_dw_hdmi {
 	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
-	unsigned long output_bus_fmt;
+	struct drm_bridge *bridge;
 };
-#define encoder_to_meson_dw_hdmi(x) \
-	container_of(x, struct meson_dw_hdmi, encoder)
-#define bridge_to_meson_dw_hdmi(x) \
-	container_of(x, struct meson_dw_hdmi, bridge)
 
 static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
 					const char *compat)
@@ -295,14 +286,14 @@ static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
 
 /* Setup PHY bandwidth modes */
 static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
-				      const struct drm_display_mode *mode)
+				      const struct drm_display_mode *mode,
+				      bool mode_is_420)
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 	unsigned int pixel_clock = mode->clock;
 
 	/* For 420, pixel clock is half unlike venc clock */
-	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
-		pixel_clock /= 2;
+	if (mode_is_420) pixel_clock /= 2;
 
 	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
@@ -374,68 +365,25 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
 	mdelay(2);
 }
 
-static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
-			     const struct drm_display_mode *mode)
-{
-	struct meson_drm *priv = dw_hdmi->priv;
-	int vic = drm_match_cea_mode(mode);
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
-
-	vclk_freq = mode->clock;
-
-	/* For 420, pixel clock is half unlike venc clock */
-	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
-		vclk_freq /= 2;
-
-	/* TMDS clock is pixel_clock * 10 */
-	phy_freq = vclk_freq * 10;
-
-	if (!vic) {
-		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
-				 vclk_freq, vclk_freq, vclk_freq, false);
-		return;
-	}
-
-	/* 480i/576i needs global pixel doubling */
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		vclk_freq *= 2;
-
-	venc_freq = vclk_freq;
-	hdmi_freq = vclk_freq;
-
-	/* VENC double pixels for 1080i, 720p and YUV420 modes */
-	if (meson_venc_hdmi_venc_repeat(vic) ||
-	    dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
-		venc_freq *= 2;
-
-	vclk_freq = max(venc_freq, hdmi_freq);
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		venc_freq /= 2;
-
-	DRM_DEBUG_DRIVER("vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
-		phy_freq, vclk_freq, venc_freq, hdmi_freq,
-		priv->venc.hdmi_use_enci);
-
-	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
-			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
-}
-
 static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 			    const struct drm_display_info *display,
 			    const struct drm_display_mode *mode)
 {
 	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
+	bool is_hdmi2_sink = display->hdmi.scdc.supported;
 	struct meson_drm *priv = dw_hdmi->priv;
 	unsigned int wr_clk =
 		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
+	bool mode_is_420 = false;
 
 	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
 			 mode->clock > 340000 ? 40 : 10);
 
+	if (drm_mode_is_420_only(display, mode) ||
+	    (!is_hdmi2_sink &&
+	     drm_mode_is_420_also(display, mode)))
+		mode_is_420 = true;
+
 	/* Enable clocks */
 	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
 
@@ -457,8 +405,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
 
 	/* TMDS pattern setup */
-	if (mode->clock > 340000 &&
-	    dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_YUV8_1X24) {
+	if (mode->clock > 340000 && !mode_is_420) {
 		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
 				  0);
 		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
@@ -476,7 +423,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x2);
 
 	/* Setup PHY parameters */
-	meson_hdmi_phy_setup_mode(dw_hdmi, mode);
+	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
 
 	/* Setup PHY */
 	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
@@ -622,214 +569,15 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
 		dw_hdmi_setup_rx_sense(dw_hdmi->hdmi, hpd_connected,
 				       hpd_connected);
 
-		drm_helper_hpd_irq_event(dw_hdmi->encoder.dev);
+		drm_helper_hpd_irq_event(dw_hdmi->bridge->dev);
+		drm_bridge_hpd_notify(dw_hdmi->bridge,
+				      hpd_connected ? connector_status_connected
+						    : connector_status_disconnected);
 	}
 
 	return IRQ_HANDLED;
 }
 
-static enum drm_mode_status
-dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
-		   const struct drm_display_info *display_info,
-		   const struct drm_display_mode *mode)
-{
-	struct meson_dw_hdmi *dw_hdmi = data;
-	struct meson_drm *priv = dw_hdmi->priv;
-	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
-	int vic = drm_match_cea_mode(mode);
-	enum drm_mode_status status;
-
-	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
-
-	/* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
-	if (display_info->max_tmds_clock &&
-	    mode->clock > display_info->max_tmds_clock &&
-	    !drm_mode_is_420_only(display_info, mode) &&
-	    !drm_mode_is_420_also(display_info, mode))
-		return MODE_BAD;
-
-	/* Check against non-VIC supported modes */
-	if (!vic) {
-		status = meson_venc_hdmi_supported_mode(mode);
-		if (status != MODE_OK)
-			return status;
-
-		return meson_vclk_dmt_supported_freq(priv, mode->clock);
-	/* Check against supported VIC modes */
-	} else if (!meson_venc_hdmi_supported_vic(vic))
-		return MODE_BAD;
-
-	vclk_freq = mode->clock;
-
-	/* For 420, pixel clock is half unlike venc clock */
-	if (drm_mode_is_420_only(display_info, mode) ||
-	    (!is_hdmi2_sink &&
-	     drm_mode_is_420_also(display_info, mode)))
-		vclk_freq /= 2;
-
-	/* TMDS clock is pixel_clock * 10 */
-	phy_freq = vclk_freq * 10;
-
-	/* 480i/576i needs global pixel doubling */
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		vclk_freq *= 2;
-
-	venc_freq = vclk_freq;
-	hdmi_freq = vclk_freq;
-
-	/* VENC double pixels for 1080i, 720p and YUV420 modes */
-	if (meson_venc_hdmi_venc_repeat(vic) ||
-	    drm_mode_is_420_only(display_info, mode) ||
-	    (!is_hdmi2_sink &&
-	     drm_mode_is_420_also(display_info, mode)))
-		venc_freq *= 2;
-
-	vclk_freq = max(venc_freq, hdmi_freq);
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		venc_freq /= 2;
-
-	dev_dbg(dw_hdmi->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
-		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
-
-	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
-}
-
-/* Encoder */
-
-static const u32 meson_dw_hdmi_out_bus_fmts[] = {
-	MEDIA_BUS_FMT_YUV8_1X24,
-	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
-};
-
-static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
-static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
-	.destroy        = meson_venc_hdmi_encoder_destroy,
-};
-
-static u32 *
-meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
-					struct drm_bridge_state *bridge_state,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state,
-					u32 output_fmt,
-					unsigned int *num_input_fmts)
-{
-	u32 *input_fmts = NULL;
-	int i;
-
-	*num_input_fmts = 0;
-
-	for (i = 0 ; i < ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts) ; ++i) {
-		if (output_fmt == meson_dw_hdmi_out_bus_fmts[i]) {
-			*num_input_fmts = 1;
-			input_fmts = kcalloc(*num_input_fmts,
-					     sizeof(*input_fmts),
-					     GFP_KERNEL);
-			if (!input_fmts)
-				return NULL;
-
-			input_fmts[0] = output_fmt;
-
-			break;
-		}
-	}
-
-	return input_fmts;
-}
-
-static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
-					struct drm_bridge_state *bridge_state,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
-{
-	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
-
-	dw_hdmi->output_bus_fmt = bridge_state->output_bus_cfg.format;
-
-	DRM_DEBUG_DRIVER("output_bus_fmt %lx\n", dw_hdmi->output_bus_fmt);
-
-	return 0;
-}
-
-static void meson_venc_hdmi_encoder_disable(struct drm_bridge *bridge)
-{
-	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
-	struct meson_drm *priv = dw_hdmi->priv;
-
-	DRM_DEBUG_DRIVER("\n");
-
-	writel_bits_relaxed(0x3, 0,
-			    priv->io_base + _REG(VPU_HDMI_SETTING));
-
-	writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
-	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
-}
-
-static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
-{
-	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
-	struct meson_drm *priv = dw_hdmi->priv;
-
-	DRM_DEBUG_DRIVER("%s\n", priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
-
-	if (priv->venc.hdmi_use_enci)
-		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
-	else
-		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
-}
-
-static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
-				   const struct drm_display_mode *mode,
-				   const struct drm_display_mode *adjusted_mode)
-{
-	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
-	struct meson_drm *priv = dw_hdmi->priv;
-	int vic = drm_match_cea_mode(mode);
-	unsigned int ycrcb_map = VPU_HDMI_OUTPUT_CBYCR;
-	bool yuv420_mode = false;
-
-	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
-
-	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
-		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
-		yuv420_mode = true;
-	}
-
-	/* VENC + VENC-DVI Mode setup */
-	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
-
-	/* VCLK Set clock */
-	dw_hdmi_set_vclk(dw_hdmi, mode);
-
-	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
-		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
-		writel_relaxed(2 | (2 << 2),
-			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
-	else
-		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
-		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
-}
-
-static const struct drm_bridge_funcs meson_venc_hdmi_encoder_bridge_funcs = {
-	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_get_input_bus_fmts = meson_venc_hdmi_encoder_get_inp_bus_fmts,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
-	.atomic_check = meson_venc_hdmi_encoder_atomic_check,
-	.enable	= meson_venc_hdmi_encoder_enable,
-	.disable = meson_venc_hdmi_encoder_disable,
-	.mode_set = meson_venc_hdmi_encoder_mode_set,
-};
-
 /* DW HDMI Regmap */
 
 static int meson_dw_hdmi_reg_read(void *context, unsigned int reg,
@@ -876,28 +624,6 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.dwc_write = dw_hdmi_g12a_dwc_write,
 };
 
-static bool meson_hdmi_connector_is_available(struct device *dev)
-{
-	struct device_node *ep, *remote;
-
-	/* HDMI Connector is on the second port, first endpoint */
-	ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
-	if (!ep)
-		return false;
-
-	/* If the endpoint node exists, consider it enabled */
-	remote = of_graph_get_remote_port(ep);
-	if (remote) {
-		of_node_put(ep);
-		return true;
-	}
-
-	of_node_put(ep);
-	of_node_put(remote);
-
-	return false;
-}
-
 static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
@@ -976,18 +702,11 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct meson_drm *priv = drm->dev_private;
 	struct dw_hdmi_plat_data *dw_plat_data;
-	struct drm_bridge *next_bridge;
-	struct drm_encoder *encoder;
 	int irq;
 	int ret;
 
 	DRM_DEBUG_DRIVER("\n");
 
-	if (!meson_hdmi_connector_is_available(dev)) {
-		dev_info(drm->dev, "HDMI Output connector not available\n");
-		return -ENODEV;
-	}
-
 	match = of_device_get_match_data(&pdev->dev);
 	if (!match) {
 		dev_err(&pdev->dev, "failed to get match data\n");
@@ -1003,7 +722,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	meson_dw_hdmi->dev = dev;
 	meson_dw_hdmi->data = match;
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
-	encoder = &meson_dw_hdmi->encoder;
 
 	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
 	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
@@ -1074,28 +792,11 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	/* Encoder */
-
-	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
-	if (ret) {
-		dev_err(priv->dev, "Failed to init HDMI encoder\n");
-		return ret;
-	}
-
-	meson_dw_hdmi->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
-	drm_bridge_attach(encoder, &meson_dw_hdmi->bridge, NULL, 0);
-
-	encoder->possible_crtcs = BIT(0);
-
 	meson_dw_hdmi_init(meson_dw_hdmi);
 
-	DRM_DEBUG_DRIVER("encoder initialized\n");
-
 	/* Bridge / Connector */
 
 	dw_plat_data->priv_data = meson_dw_hdmi;
-	dw_plat_data->mode_valid = dw_hdmi_mode_valid;
 	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
 	dw_plat_data->phy_data = meson_dw_hdmi;
@@ -1110,15 +811,11 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	platform_set_drvdata(pdev, meson_dw_hdmi);
 
-	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev,
-					    &meson_dw_hdmi->dw_plat_data);
+	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
 	if (IS_ERR(meson_dw_hdmi->hdmi))
 		return PTR_ERR(meson_dw_hdmi->hdmi);
 
-	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
-	if (next_bridge)
-		drm_bridge_attach(encoder, next_bridge,
-				  &meson_dw_hdmi->bridge, 0);
+	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
 
 	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
new file mode 100644
index 000000000000..971da662c954
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_device.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include <linux/media-bus-format.h>
+#include <linux/videodev2.h>
+
+#include "meson_drv.h"
+#include "meson_registers.h"
+#include "meson_vclk.h"
+#include "meson_venc.h"
+
+struct meson_encoder_hdmi {
+	struct drm_encoder encoder;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct meson_drm *priv;
+	unsigned long output_bus_fmt;
+};
+
+#define bridge_to_meson_encoder_hdmi(x) \
+	container_of(x, struct meson_encoder_hdmi, bridge)
+
+static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
+				     enum drm_bridge_attach_flags flags)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, encoder_hdmi->next_bridge,
+				 &encoder_hdmi->bridge, flags);
+}
+
+static void meson_encoder_hdmi_enable(struct drm_bridge *bridge)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+	struct meson_drm *priv = encoder_hdmi->priv;
+
+	dev_dbg(priv->dev, "%s\n", priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
+
+	if (priv->venc.hdmi_use_enci)
+		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
+	else
+		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
+}
+
+static void meson_encoder_hdmi_disable(struct drm_bridge *bridge)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+	struct meson_drm *priv = encoder_hdmi->priv;
+
+	writel_bits_relaxed(0x3, 0,
+			    priv->io_base + _REG(VPU_HDMI_SETTING));
+
+	writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
+	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
+}
+
+static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
+					const struct drm_display_mode *mode)
+{
+	struct meson_drm *priv = encoder_hdmi->priv;
+	int vic = drm_match_cea_mode(mode);
+	unsigned int phy_freq;
+	unsigned int vclk_freq;
+	unsigned int venc_freq;
+	unsigned int hdmi_freq;
+
+	vclk_freq = mode->clock;
+
+	/* For 420, pixel clock is half unlike venc clock */
+	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		vclk_freq /= 2;
+
+	/* TMDS clock is pixel_clock * 10 */
+	phy_freq = vclk_freq * 10;
+
+	if (!vic) {
+		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
+				 vclk_freq, vclk_freq, vclk_freq, false);
+		return;
+	}
+
+	/* 480i/576i needs global pixel doubling */
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		vclk_freq *= 2;
+
+	venc_freq = vclk_freq;
+	hdmi_freq = vclk_freq;
+
+	/* VENC double pixels for 1080i, 720p and YUV420 modes */
+	if (meson_venc_hdmi_venc_repeat(vic) ||
+	    encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		venc_freq *= 2;
+
+	vclk_freq = max(venc_freq, hdmi_freq);
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		venc_freq /= 2;
+
+	dev_dbg(priv->dev, "vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
+		phy_freq, vclk_freq, venc_freq, hdmi_freq,
+		priv->venc.hdmi_use_enci);
+
+	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
+			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
+}
+
+static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bridge,
+					const struct drm_display_info *display_info,
+					const struct drm_display_mode *mode)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+	struct meson_drm *priv = encoder_hdmi->priv;
+	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
+	unsigned int phy_freq;
+	unsigned int vclk_freq;
+	unsigned int venc_freq;
+	unsigned int hdmi_freq;
+	int vic = drm_match_cea_mode(mode);
+	enum drm_mode_status status;
+
+	dev_dbg(priv->dev, "Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+
+	/* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
+	if (display_info->max_tmds_clock &&
+	    mode->clock > display_info->max_tmds_clock &&
+	    !drm_mode_is_420_only(display_info, mode) &&
+	    !drm_mode_is_420_also(display_info, mode))
+		return MODE_BAD;
+
+	/* Check against non-VIC supported modes */
+	if (!vic) {
+		status = meson_venc_hdmi_supported_mode(mode);
+		if (status != MODE_OK)
+			return status;
+
+		return meson_vclk_dmt_supported_freq(priv, mode->clock);
+	/* Check against supported VIC modes */
+	} else if (!meson_venc_hdmi_supported_vic(vic))
+		return MODE_BAD;
+
+	vclk_freq = mode->clock;
+
+	/* For 420, pixel clock is half unlike venc clock */
+	if (drm_mode_is_420_only(display_info, mode) ||
+	    (!is_hdmi2_sink &&
+	     drm_mode_is_420_also(display_info, mode)))
+		vclk_freq /= 2;
+
+	/* TMDS clock is pixel_clock * 10 */
+	phy_freq = vclk_freq * 10;
+
+	/* 480i/576i needs global pixel doubling */
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		vclk_freq *= 2;
+
+	venc_freq = vclk_freq;
+	hdmi_freq = vclk_freq;
+
+	/* VENC double pixels for 1080i, 720p and YUV420 modes */
+	if (meson_venc_hdmi_venc_repeat(vic) ||
+	    drm_mode_is_420_only(display_info, mode) ||
+	    (!is_hdmi2_sink &&
+	     drm_mode_is_420_also(display_info, mode)))
+		venc_freq *= 2;
+
+	vclk_freq = max(venc_freq, hdmi_freq);
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		venc_freq /= 2;
+
+	dev_dbg(priv->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
+		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
+
+	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
+}
+
+static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+	struct drm_atomic_state *state = bridge_state->base.state;
+	unsigned int ycrcb_map = VPU_HDMI_OUTPUT_CBYCR;
+	struct meson_drm *priv = encoder_hdmi->priv;
+	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+	bool yuv420_mode = false;
+	int vic;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	mode = &crtc_state->adjusted_mode;
+
+	vic = drm_match_cea_mode(mode);
+
+	dev_dbg(priv->dev, "\"%s\" vic %d\n", mode->name, vic);
+
+	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
+		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
+		yuv420_mode = true;
+	}
+
+	/* VENC + VENC-DVI Mode setup */
+	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
+
+	/* VCLK Set clock */
+	meson_encoder_hdmi_set_vclk(encoder_hdmi, mode);
+
+	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
+		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
+		writel_relaxed(2 | (2 << 2),
+			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
+	else
+		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
+		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
+}
+
+static const u32 meson_encoder_hdmi_out_bus_fmts[] = {
+	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+};
+
+static u32 *
+meson_encoder_hdmi_get_inp_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts = NULL;
+	int i;
+
+	*num_input_fmts = 0;
+
+	for (i = 0 ; i < ARRAY_SIZE(meson_encoder_hdmi_out_bus_fmts) ; ++i) {
+		if (output_fmt == meson_encoder_hdmi_out_bus_fmts[i]) {
+			*num_input_fmts = 1;
+			input_fmts = kcalloc(*num_input_fmts,
+					     sizeof(*input_fmts),
+					     GFP_KERNEL);
+			if (!input_fmts)
+				return NULL;
+
+			input_fmts[0] = output_fmt;
+
+			break;
+		}
+	}
+
+	return input_fmts;
+}
+
+static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(conn_state->state, conn_state->connector);
+	struct meson_drm *priv = encoder_hdmi->priv;
+
+	encoder_hdmi->output_bus_fmt = bridge_state->output_bus_cfg.format;
+
+	dev_dbg(priv->dev, "output_bus_fmt %lx\n", encoder_hdmi->output_bus_fmt);
+
+	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_state))
+		crtc_state->mode_changed = true;
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
+	.attach = meson_encoder_hdmi_attach,
+	.enable	= meson_encoder_hdmi_enable,
+	.disable = meson_encoder_hdmi_disable,
+	.mode_valid = meson_encoder_hdmi_mode_valid,
+	.atomic_enable = meson_encoder_hdmi_atomic_enable,
+	.atomic_get_input_bus_fmts = meson_encoder_hdmi_get_inp_bus_fmts,
+	.atomic_check = meson_encoder_hdmi_atomic_check,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+int meson_encoder_hdmi_init(struct meson_drm *priv)
+{
+	struct meson_encoder_hdmi *meson_encoder_hdmi;
+	struct device_node *remote;
+	int ret;
+
+	meson_encoder_hdmi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_hdmi), GFP_KERNEL);
+	if (!meson_encoder_hdmi)
+		return -ENOMEM;
+
+	/* HDMI Transceiver Bridge */
+	remote = of_graph_get_remote_node(priv->dev->of_node, 1, 0);
+	if (!remote) {
+		dev_err(priv->dev, "HDMI transceiver device is disabled");
+		return 0;
+	}
+
+	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
+	if (!meson_encoder_hdmi->next_bridge) {
+		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
+		return -EPROBE_DEFER;
+	}
+
+	/* HDMI Encoder Bridge */
+	meson_encoder_hdmi->bridge.funcs = &meson_encoder_hdmi_bridge_funcs;
+	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
+	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+
+	drm_bridge_add(&meson_encoder_hdmi->bridge);
+
+	meson_encoder_hdmi->priv = priv;
+
+	/* Encoder */
+	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+				      DRM_MODE_ENCODER_TMDS);
+	if (ret) {
+		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
+		return ret;
+	}
+
+	meson_encoder_hdmi->encoder.possible_crtcs = BIT(0);
+
+	/* Attach HDMI Encoder Bridge to Encoder */
+	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * We should have now in place:
+	 * encoder->[hdmi encoder bridge]->[dw-hdmi bridge]->[dw-hdmi connector]
+	 */
+
+	dev_dbg(priv->dev, "HDMI encoder initialized\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.h b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
new file mode 100644
index 000000000000..ed19494f0956
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef __MESON_ENCODER_HDMI_H
+#define __MESON_ENCODER_HDMI_H
+
+int meson_encoder_hdmi_init(struct meson_drm *priv);
+
+#endif /* __MESON_ENCODER_HDMI_H */
-- 
2.25.1

