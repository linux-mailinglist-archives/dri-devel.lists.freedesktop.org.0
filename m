Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1F153FFD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09AA6FA08;
	Thu,  6 Feb 2020 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99716F9D7;
 Thu,  6 Feb 2020 08:01:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z7so5885579wrl.13;
 Thu, 06 Feb 2020 00:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/QYFlC52BlMbss6DGreAcGqKCH0YNjaAJ5VSicpbkoM=;
 b=SIPhArX0RCWCz7c9N1pGJkps7xtlVejgELUbzuI8c7JXCst3CdghYooEcicIkSjP5f
 FVtnJsBzO5mTUeEBy0xEdzPztQMxLNK9qRY2YNlhkh7Riw9T9a1+JPpxq5lTk1GiAOI/
 XWEVQTU6B40OYzlL4LM2cwbGrzi63OBZaJWDk4cyQ02OuA1EWDJvnjOI+8O9IbSQn2b7
 Z/eP0cBXlXPCGrG/w8e+Ji1bU4KcWMTRxIQ1CZZpcXcnIMRBeq/feQ0lA+AhOEMSj/p0
 tpHS5T8bK5puLeIai+tsNH/ViTjGdlfAQxLfWWnXmdpEI0qpc0/7x0Ou7fPrgrf3G35a
 of9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/QYFlC52BlMbss6DGreAcGqKCH0YNjaAJ5VSicpbkoM=;
 b=D+FFBry2o7cPKkxQmLqVUxe8bKhFiB7qKrLRrVqBnlOUPlAdfvtm2c9UbIKdXjIcZw
 AAd1Q3hGAkqRaGWHV5rDeHo5ASvOwfRXn8l1L0xEtiFENfoW2sLsX30/LpfuUefD/kGB
 0nuPRxAZhftRISLVxUdbsViB8g6Oj0NXseeGZW4kMyt9CLN/qBwK2dPJV8V5Fb/u7uFI
 3b5S4c14tgF0ymSwUsRPW0CixetOgHLWj6N1zYpzFRGiHhL/jaXfHhz04p8WI8Uy60zD
 S1UBhU0U9XHeVKoMEOnJxvW7y0QT9aw04IGkACZ7JCASKQHCbzWUpJsB3raIULoAwYia
 YhlA==
X-Gm-Message-State: APjAAAXOUMNrUX4x26GZ/cUCOgoCRiwIqbaabYJE5Yk7aDfFlSUb5qlb
 iQSOX17CmrOWu0bp7fBPfClks0rqakI=
X-Google-Smtp-Source: APXvYqwsLCZNrDYQpJ7dH7x8OBNilm4/xqiGFZV38DBRQhl1wzJ0TNR6ewu71fKvu72MVD+Lh9D1XQ==
X-Received: by 2002:adf:f288:: with SMTP id k8mr2446057wro.301.1580976060257; 
 Thu, 06 Feb 2020 00:01:00 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:59 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 10/12] drm/i915/dsi_vbt: convert to drm_device based
 logging macros.
Date: Thu,  6 Feb 2020 11:00:11 +0300
Message-Id: <20200206080014.13759-11-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert various instances of the printk based drm logging macros to the
struct drm_device based logging macros in i915/display/intel_dsi_vbt.c.
This also involves extracting the drm_i915_private device from the
intel_dsi type for use in the logging macros.

This converts DRM_DEBUG/DRM_DEBUG_DRIVER to drm_dbg().

References: https://lists.freedesktop.org/archives/dri-devel/2020-January/253381.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 162 +++++++++++--------
 1 file changed, 99 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 3914cfdab511..694498f4b719 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -136,7 +136,7 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 	u16 len;
 	enum port port;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	flags = *data++;
 	type = *data++;
@@ -158,7 +158,8 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 
 	dsi_device = intel_dsi->dsi_hosts[port]->device;
 	if (!dsi_device) {
-		DRM_DEBUG_KMS("no dsi device for port %c\n", port_name(port));
+		drm_dbg_kms(&dev_priv->drm, "no dsi device for port %c\n",
+			    port_name(port));
 		goto out;
 	}
 
@@ -182,7 +183,8 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
-		DRM_DEBUG_DRIVER("Generic Read not yet implemented or used\n");
+		drm_dbg(&dev_priv->drm,
+			"Generic Read not yet implemented or used\n");
 		break;
 	case MIPI_DSI_GENERIC_LONG_WRITE:
 		mipi_dsi_generic_write(dsi_device, data, len);
@@ -194,7 +196,8 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 		mipi_dsi_dcs_write_buffer(dsi_device, data, 2);
 		break;
 	case MIPI_DSI_DCS_READ:
-		DRM_DEBUG_DRIVER("DCS Read not yet implemented or used\n");
+		drm_dbg(&dev_priv->drm,
+			"DCS Read not yet implemented or used\n");
 		break;
 	case MIPI_DSI_DCS_LONG_WRITE:
 		mipi_dsi_dcs_write_buffer(dsi_device, data, len);
@@ -212,9 +215,10 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 
 static const u8 *mipi_exec_delay(struct intel_dsi *intel_dsi, const u8 *data)
 {
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
 	u32 delay = *((const u32 *) data);
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&i915->drm, "\n");
 
 	usleep_range(delay, delay + 10);
 	data += 4;
@@ -231,7 +235,8 @@ static void vlv_exec_gpio(struct drm_i915_private *dev_priv,
 	u8 port;
 
 	if (gpio_index >= ARRAY_SIZE(vlv_gpio_table)) {
-		DRM_DEBUG_KMS("unknown gpio index %u\n", gpio_index);
+		drm_dbg_kms(&dev_priv->drm, "unknown gpio index %u\n",
+			    gpio_index);
 		return;
 	}
 
@@ -244,10 +249,11 @@ static void vlv_exec_gpio(struct drm_i915_private *dev_priv,
 		if (gpio_source == 0) {
 			port = IOSF_PORT_GPIO_NC;
 		} else if (gpio_source == 1) {
-			DRM_DEBUG_KMS("SC gpio not supported\n");
+			drm_dbg_kms(&dev_priv->drm, "SC gpio not supported\n");
 			return;
 		} else {
-			DRM_DEBUG_KMS("unknown gpio source %u\n", gpio_source);
+			drm_dbg_kms(&dev_priv->drm,
+				    "unknown gpio source %u\n", gpio_source);
 			return;
 		}
 	}
@@ -291,13 +297,15 @@ static void chv_exec_gpio(struct drm_i915_private *dev_priv,
 	} else {
 		/* XXX: The spec is unclear about CHV GPIO on seq v2 */
 		if (gpio_source != 0) {
-			DRM_DEBUG_KMS("unknown gpio source %u\n", gpio_source);
+			drm_dbg_kms(&dev_priv->drm,
+				    "unknown gpio source %u\n", gpio_source);
 			return;
 		}
 
 		if (gpio_index >= CHV_GPIO_IDX_START_E) {
-			DRM_DEBUG_KMS("invalid gpio index %u for GPIO N\n",
-				      gpio_index);
+			drm_dbg_kms(&dev_priv->drm,
+				    "invalid gpio index %u for GPIO N\n",
+				    gpio_index);
 			return;
 		}
 
@@ -332,8 +340,9 @@ static void bxt_exec_gpio(struct drm_i915_private *dev_priv,
 						 GPIOD_OUT_HIGH);
 
 		if (IS_ERR_OR_NULL(gpio_desc)) {
-			DRM_ERROR("GPIO index %u request failed (%ld)\n",
-				  gpio_index, PTR_ERR(gpio_desc));
+			drm_err(&dev_priv->drm,
+				"GPIO index %u request failed (%ld)\n",
+				gpio_index, PTR_ERR(gpio_desc));
 			return;
 		}
 
@@ -346,7 +355,7 @@ static void bxt_exec_gpio(struct drm_i915_private *dev_priv,
 static void icl_exec_gpio(struct drm_i915_private *dev_priv,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
-	DRM_DEBUG_KMS("Skipping ICL GPIO element execution\n");
+	drm_dbg_kms(&dev_priv->drm, "Skipping ICL GPIO element execution\n");
 }
 
 static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
@@ -356,7 +365,7 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 	u8 gpio_source, gpio_index = 0, gpio_number;
 	bool value;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	if (dev_priv->vbt.dsi.seq_version >= 3)
 		gpio_index = *data++;
@@ -494,13 +503,16 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 
 static const u8 *mipi_exec_spi(struct intel_dsi *intel_dsi, const u8 *data)
 {
-	DRM_DEBUG_KMS("Skipping SPI element execution\n");
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+
+	drm_dbg_kms(&i915->drm, "Skipping SPI element execution\n");
 
 	return data + *(data + 5) + 6;
 }
 
 static const u8 *mipi_exec_pmic(struct intel_dsi *intel_dsi, const u8 *data)
 {
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
 #ifdef CONFIG_PMIC_OPREGION
 	u32 value, mask, reg_address;
 	u16 i2c_address;
@@ -516,9 +528,10 @@ static const u8 *mipi_exec_pmic(struct intel_dsi *intel_dsi, const u8 *data)
 							reg_address,
 							value, mask);
 	if (ret)
-		DRM_ERROR("%s failed, error: %d\n", __func__, ret);
+		drm_err(&i915->drm, "%s failed, error: %d\n", __func__, ret);
 #else
-	DRM_ERROR("Your hardware requires CONFIG_PMIC_OPREGION and it is not set\n");
+	drm_err(&i915->drm,
+		"Your hardware requires CONFIG_PMIC_OPREGION and it is not set\n");
 #endif
 
 	return data + 15;
@@ -580,8 +593,8 @@ static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
 
 	drm_WARN_ON(&dev_priv->drm, *data != seq_id);
 
-	DRM_DEBUG_KMS("Starting MIPI sequence %d - %s\n",
-		      seq_id, sequence_name(seq_id));
+	drm_dbg_kms(&dev_priv->drm, "Starting MIPI sequence %d - %s\n",
+		    seq_id, sequence_name(seq_id));
 
 	/* Skip Sequence Byte. */
 	data++;
@@ -613,18 +626,21 @@ static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
 
 			/* Consistency check if we have size. */
 			if (operation_size && data != next) {
-				DRM_ERROR("Inconsistent operation size\n");
+				drm_err(&dev_priv->drm,
+					"Inconsistent operation size\n");
 				return;
 			}
 		} else if (operation_size) {
 			/* We have size, skip. */
-			DRM_DEBUG_KMS("Unsupported MIPI operation byte %u\n",
-				      operation_byte);
+			drm_dbg_kms(&dev_priv->drm,
+				    "Unsupported MIPI operation byte %u\n",
+				    operation_byte);
 			data += operation_size;
 		} else {
 			/* No size, can't skip without parsing. */
-			DRM_ERROR("Unsupported MIPI operation byte %u\n",
-				  operation_byte);
+			drm_err(&dev_priv->drm,
+				"Unsupported MIPI operation byte %u\n",
+				operation_byte);
 			return;
 		}
 	}
@@ -659,40 +675,54 @@ void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
 
 void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 {
-	DRM_DEBUG_KMS("Pclk %d\n", intel_dsi->pclk);
-	DRM_DEBUG_KMS("Pixel overlap %d\n", intel_dsi->pixel_overlap);
-	DRM_DEBUG_KMS("Lane count %d\n", intel_dsi->lane_count);
-	DRM_DEBUG_KMS("DPHY param reg 0x%x\n", intel_dsi->dphy_reg);
-	DRM_DEBUG_KMS("Video mode format %s\n",
-		      intel_dsi->video_mode_format == VIDEO_MODE_NON_BURST_WITH_SYNC_PULSE ?
-		      "non-burst with sync pulse" :
-		      intel_dsi->video_mode_format == VIDEO_MODE_NON_BURST_WITH_SYNC_EVENTS ?
-		      "non-burst with sync events" :
-		      intel_dsi->video_mode_format == VIDEO_MODE_BURST ?
-		      "burst" : "<unknown>");
-	DRM_DEBUG_KMS("Burst mode ratio %d\n", intel_dsi->burst_mode_ratio);
-	DRM_DEBUG_KMS("Reset timer %d\n", intel_dsi->rst_timer_val);
-	DRM_DEBUG_KMS("Eot %s\n", enableddisabled(intel_dsi->eotp_pkt));
-	DRM_DEBUG_KMS("Clockstop %s\n", enableddisabled(!intel_dsi->clock_stop));
-	DRM_DEBUG_KMS("Mode %s\n", intel_dsi->operation_mode ? "command" : "video");
+	struct drm_i915_private *i915 = to_i915(intel_dsi->base.base.dev);
+
+	drm_dbg_kms(&i915->drm, "Pclk %d\n", intel_dsi->pclk);
+	drm_dbg_kms(&i915->drm, "Pixel overlap %d\n",
+		    intel_dsi->pixel_overlap);
+	drm_dbg_kms(&i915->drm, "Lane count %d\n", intel_dsi->lane_count);
+	drm_dbg_kms(&i915->drm, "DPHY param reg 0x%x\n", intel_dsi->dphy_reg);
+	drm_dbg_kms(&i915->drm, "Video mode format %s\n",
+		    intel_dsi->video_mode_format == VIDEO_MODE_NON_BURST_WITH_SYNC_PULSE ?
+		    "non-burst with sync pulse" :
+		    intel_dsi->video_mode_format == VIDEO_MODE_NON_BURST_WITH_SYNC_EVENTS ?
+		    "non-burst with sync events" :
+		    intel_dsi->video_mode_format == VIDEO_MODE_BURST ?
+		    "burst" : "<unknown>");
+	drm_dbg_kms(&i915->drm, "Burst mode ratio %d\n",
+		    intel_dsi->burst_mode_ratio);
+	drm_dbg_kms(&i915->drm, "Reset timer %d\n", intel_dsi->rst_timer_val);
+	drm_dbg_kms(&i915->drm, "Eot %s\n",
+		    enableddisabled(intel_dsi->eotp_pkt));
+	drm_dbg_kms(&i915->drm, "Clockstop %s\n",
+		    enableddisabled(!intel_dsi->clock_stop));
+	drm_dbg_kms(&i915->drm, "Mode %s\n",
+		    intel_dsi->operation_mode ? "command" : "video");
 	if (intel_dsi->dual_link == DSI_DUAL_LINK_FRONT_BACK)
-		DRM_DEBUG_KMS("Dual link: DSI_DUAL_LINK_FRONT_BACK\n");
+		drm_dbg_kms(&i915->drm,
+			    "Dual link: DSI_DUAL_LINK_FRONT_BACK\n");
 	else if (intel_dsi->dual_link == DSI_DUAL_LINK_PIXEL_ALT)
-		DRM_DEBUG_KMS("Dual link: DSI_DUAL_LINK_PIXEL_ALT\n");
+		drm_dbg_kms(&i915->drm,
+			    "Dual link: DSI_DUAL_LINK_PIXEL_ALT\n");
 	else
-		DRM_DEBUG_KMS("Dual link: NONE\n");
-	DRM_DEBUG_KMS("Pixel Format %d\n", intel_dsi->pixel_format);
-	DRM_DEBUG_KMS("TLPX %d\n", intel_dsi->escape_clk_div);
-	DRM_DEBUG_KMS("LP RX Timeout 0x%x\n", intel_dsi->lp_rx_timeout);
-	DRM_DEBUG_KMS("Turnaround Timeout 0x%x\n", intel_dsi->turn_arnd_val);
-	DRM_DEBUG_KMS("Init Count 0x%x\n", intel_dsi->init_count);
-	DRM_DEBUG_KMS("HS to LP Count 0x%x\n", intel_dsi->hs_to_lp_count);
-	DRM_DEBUG_KMS("LP Byte Clock %d\n", intel_dsi->lp_byte_clk);
-	DRM_DEBUG_KMS("DBI BW Timer 0x%x\n", intel_dsi->bw_timer);
-	DRM_DEBUG_KMS("LP to HS Clock Count 0x%x\n", intel_dsi->clk_lp_to_hs_count);
-	DRM_DEBUG_KMS("HS to LP Clock Count 0x%x\n", intel_dsi->clk_hs_to_lp_count);
-	DRM_DEBUG_KMS("BTA %s\n",
-			enableddisabled(!(intel_dsi->video_frmt_cfg_bits & DISABLE_VIDEO_BTA)));
+		drm_dbg_kms(&i915->drm, "Dual link: NONE\n");
+	drm_dbg_kms(&i915->drm, "Pixel Format %d\n", intel_dsi->pixel_format);
+	drm_dbg_kms(&i915->drm, "TLPX %d\n", intel_dsi->escape_clk_div);
+	drm_dbg_kms(&i915->drm, "LP RX Timeout 0x%x\n",
+		    intel_dsi->lp_rx_timeout);
+	drm_dbg_kms(&i915->drm, "Turnaround Timeout 0x%x\n",
+		    intel_dsi->turn_arnd_val);
+	drm_dbg_kms(&i915->drm, "Init Count 0x%x\n", intel_dsi->init_count);
+	drm_dbg_kms(&i915->drm, "HS to LP Count 0x%x\n",
+		    intel_dsi->hs_to_lp_count);
+	drm_dbg_kms(&i915->drm, "LP Byte Clock %d\n", intel_dsi->lp_byte_clk);
+	drm_dbg_kms(&i915->drm, "DBI BW Timer 0x%x\n", intel_dsi->bw_timer);
+	drm_dbg_kms(&i915->drm, "LP to HS Clock Count 0x%x\n",
+		    intel_dsi->clk_lp_to_hs_count);
+	drm_dbg_kms(&i915->drm, "HS to LP Clock Count 0x%x\n",
+		    intel_dsi->clk_hs_to_lp_count);
+	drm_dbg_kms(&i915->drm, "BTA %s\n",
+		    enableddisabled(!(intel_dsi->video_frmt_cfg_bits & DISABLE_VIDEO_BTA)));
 }
 
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
@@ -705,7 +735,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 	u16 burst_mode_ratio;
 	enum port port;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	intel_dsi->eotp_pkt = mipi_config->eot_pkt_disabled ? 0 : 1;
 	intel_dsi->clock_stop = mipi_config->enable_clk_stop ? 1 : 0;
@@ -764,7 +794,8 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 				mipi_config->target_burst_mode_freq = bitrate;
 
 			if (mipi_config->target_burst_mode_freq < bitrate) {
-				DRM_ERROR("Burst mode freq is less than computed\n");
+				drm_err(&dev_priv->drm,
+					"Burst mode freq is less than computed\n");
 				return false;
 			}
 
@@ -774,7 +805,8 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 
 			intel_dsi->pclk = DIV_ROUND_UP(intel_dsi->pclk * burst_mode_ratio, 100);
 		} else {
-			DRM_ERROR("Burst mode target is not set\n");
+			drm_err(&dev_priv->drm,
+				"Burst mode target is not set\n");
 			return false;
 		}
 	} else
@@ -857,17 +889,20 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 		ret = pinctrl_register_mappings(soc_pwm_pinctrl_map,
 					     ARRAY_SIZE(soc_pwm_pinctrl_map));
 		if (ret)
-			DRM_ERROR("Failed to register pwm0 pinmux mapping\n");
+			drm_err(&dev_priv->drm,
+				"Failed to register pwm0 pinmux mapping\n");
 
 		pinctrl = devm_pinctrl_get_select(dev->dev, "soc_pwm0");
 		if (IS_ERR(pinctrl))
-			DRM_ERROR("Failed to set pinmux to PWM\n");
+			drm_err(&dev_priv->drm,
+				"Failed to set pinmux to PWM\n");
 	}
 
 	if (want_panel_gpio) {
 		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
-			DRM_ERROR("Failed to own gpio for panel control\n");
+			drm_err(&dev_priv->drm,
+				"Failed to own gpio for panel control\n");
 			intel_dsi->gpio_panel = NULL;
 		}
 	}
@@ -876,7 +911,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 		intel_dsi->gpio_backlight =
 			gpiod_get(dev->dev, "backlight", flags);
 		if (IS_ERR(intel_dsi->gpio_backlight)) {
-			DRM_ERROR("Failed to own gpio for backlight control\n");
+			drm_err(&dev_priv->drm,
+				"Failed to own gpio for backlight control\n");
 			intel_dsi->gpio_backlight = NULL;
 		}
 	}
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
