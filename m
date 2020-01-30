Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FFF14E956
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1914C6FA9C;
	Fri, 31 Jan 2020 08:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42826F8F7;
 Thu, 30 Jan 2020 08:32:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g17so2965610wro.2;
 Thu, 30 Jan 2020 00:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73/uMYoAM6zzIbCxpLulq4KqfnaNwwH/UeeBpw7yoho=;
 b=mFffZS05fToBDojYNaGyVvJin844oYzxki7aFmyqywl25/CP7mbYw5B4Z8bkgqt1FV
 vSJvCFCyvqQXSop+FhWAk5hFs7iBzL6ZLqxrD4W5rYgVwcSguPOpagl92ICc7mkNG56Z
 UBNWNE80oaqI6Mf7+pIRZ7hXJAz75wIPiqmKgyfxPcXvCo5x9j7fvs1YDLjb2hrxnxVc
 Xkllg/WHCd1T7Z9cOXaEate1/yM0keNq+gTTwGDicQWePe2LqauuX+qxjrPMZcMaQ92Z
 GsXPhtPtL/8y0qahjDnBC5rh9AUaHBxybrsZPtK6xwqCiNEXL8xuzbzkjh3HdO9R48W6
 eVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73/uMYoAM6zzIbCxpLulq4KqfnaNwwH/UeeBpw7yoho=;
 b=fKmG6os8sAdEiiOu+s4KbXYsZDhHDrfiGe6F6SXoLdr09CMwsMAA/BNrbxkyuwaUS+
 CRD1sW3VBP+aistJElIWENrIfxni4NgzbSqpGYOeUiYb+dTAbRAZraSbBJ3ts+qK71g9
 ISIulzRGi2OoNLynJ0+VkwdutFMITJoxb4EsT4XTSpueJFlSG4scZvJxE248FJTThXx/
 cEFbFuv/N0jPqn1MhPQCfvTsLaj97QoTBkrqNDk25Mxmqxz72AQGigTq5ANGuyTnfuG3
 XkIFUrmC8EAst2VUzbOiqF5OBvdmksFQ9cu16ZJhob91GMpE+8IpBBdVCX6E2sbbw0SV
 JG1Q==
X-Gm-Message-State: APjAAAUDZuBarl3UyVql+MkPHI9Or5U/19PQ5D03OrW1RQTW/ZfjnwbR
 gFK5vQIF1CYTytTkE12lNRw=
X-Google-Smtp-Source: APXvYqyda0WPiHbEs4TMF/Y6NAl9fZwAbL19eH3x5KztEz6EzLPLPuEEdF/NG4ZjjhRNyqM5DHYAYQ==
X-Received: by 2002:adf:c3d0:: with SMTP id d16mr3825509wrg.376.1580373162107; 
 Thu, 30 Jan 2020 00:32:42 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:41 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 02/12] drm/i915/vlv_dsi: conversion to drm_device based
 logging macros.
Date: Thu, 30 Jan 2020 11:32:19 +0300
Message-Id: <20200130083229.12889-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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

Converts the printk based logging macros to the struct drm_device based
logging macros in i915/display/vlv_dsi.c.
This was done using the following coccinelle script that transforms
based on the existence of a drm_i915_private device pointer.
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 80 +++++++++++++++-----------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index a101a4513c65..279d426e89da 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -85,7 +85,7 @@ void vlv_dsi_wait_for_fifo_empty(struct intel_dsi *intel_dsi, enum port port)
 
 	if (intel_de_wait_for_set(dev_priv, MIPI_GEN_FIFO_STAT(port),
 				  mask, 100))
-		DRM_ERROR("DPI FIFOs are not empty\n");
+		drm_err(&dev_priv->drm, "DPI FIFOs are not empty\n");
 }
 
 static void write_data(struct drm_i915_private *dev_priv,
@@ -154,7 +154,8 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (packet.payload_length) {
 		if (intel_de_wait_for_clear(dev_priv, MIPI_GEN_FIFO_STAT(port),
 					    data_mask, 50))
-			DRM_ERROR("Timeout waiting for HS/LP DATA FIFO !full\n");
+			drm_err(&dev_priv->drm,
+				"Timeout waiting for HS/LP DATA FIFO !full\n");
 
 		write_data(dev_priv, data_reg, packet.payload,
 			   packet.payload_length);
@@ -167,7 +168,8 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
 
 	if (intel_de_wait_for_clear(dev_priv, MIPI_GEN_FIFO_STAT(port),
 				    ctrl_mask, 50)) {
-		DRM_ERROR("Timeout waiting for HS/LP CTRL FIFO !full\n");
+		drm_err(&dev_priv->drm,
+			"Timeout waiting for HS/LP CTRL FIFO !full\n");
 	}
 
 	intel_de_write(dev_priv, ctrl_reg,
@@ -178,7 +180,8 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
 		data_mask = GEN_READ_DATA_AVAIL;
 		if (intel_de_wait_for_set(dev_priv, MIPI_INTR_STAT(port),
 					  data_mask, 50))
-			DRM_ERROR("Timeout waiting for read data.\n");
+			drm_err(&dev_priv->drm,
+				"Timeout waiting for read data.\n");
 
 		read_data(dev_priv, data_reg, msg->rx_buf, msg->rx_len);
 	}
@@ -229,13 +232,15 @@ static int dpi_send_cmd(struct intel_dsi *intel_dsi, u32 cmd, bool hs,
 
 	/* XXX: old code skips write if control unchanged */
 	if (cmd == intel_de_read(dev_priv, MIPI_DPI_CONTROL(port)))
-		DRM_DEBUG_KMS("Same special packet %02x twice in a row.\n", cmd);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Same special packet %02x twice in a row.\n", cmd);
 
 	intel_de_write(dev_priv, MIPI_DPI_CONTROL(port), cmd);
 
 	mask = SPL_PKT_SENT_INTERRUPT;
 	if (intel_de_wait_for_set(dev_priv, MIPI_INTR_STAT(port), mask, 100))
-		DRM_ERROR("Video mode command 0x%08x send failed.\n", cmd);
+		drm_err(&dev_priv->drm,
+			"Video mode command 0x%08x send failed.\n", cmd);
 
 	return 0;
 }
@@ -267,7 +272,7 @@ static int intel_dsi_compute_config(struct intel_encoder *encoder,
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	int ret;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 
 	if (fixed_mode) {
@@ -354,7 +359,7 @@ static bool glk_dsi_enable_io(struct intel_encoder *encoder)
 	for_each_dsi_port(port, intel_dsi->ports) {
 		if (intel_de_wait_for_set(dev_priv, MIPI_CTRL(port),
 					  GLK_MIPIIO_PORT_POWERED, 20))
-			DRM_ERROR("MIPIO port is powergated\n");
+			drm_err(&dev_priv->drm, "MIPIO port is powergated\n");
 	}
 
 	/* Check for cold boot scenario */
@@ -377,7 +382,7 @@ static void glk_dsi_device_ready(struct intel_encoder *encoder)
 	for_each_dsi_port(port, intel_dsi->ports) {
 		if (intel_de_wait_for_set(dev_priv, MIPI_CTRL(port),
 					  GLK_PHY_STATUS_PORT_READY, 20))
-			DRM_ERROR("PHY is not ON\n");
+			drm_err(&dev_priv->drm, "PHY is not ON\n");
 	}
 
 	/* Get IO out of reset */
@@ -403,7 +408,7 @@ static void glk_dsi_device_ready(struct intel_encoder *encoder)
 			/* Wait for ULPS active */
 			if (intel_de_wait_for_clear(dev_priv, MIPI_CTRL(port),
 						    GLK_ULPS_NOT_ACTIVE, 20))
-				DRM_ERROR("ULPS not active\n");
+				drm_err(&dev_priv->drm, "ULPS not active\n");
 
 			/* Exit ULPS */
 			val = intel_de_read(dev_priv, MIPI_DEVICE_READY(port));
@@ -427,14 +432,16 @@ static void glk_dsi_device_ready(struct intel_encoder *encoder)
 	for_each_dsi_port(port, intel_dsi->ports) {
 		if (intel_de_wait_for_set(dev_priv, MIPI_CTRL(port),
 					  GLK_DATA_LANE_STOP_STATE, 20))
-			DRM_ERROR("Date lane not in STOP state\n");
+			drm_err(&dev_priv->drm,
+				"Date lane not in STOP state\n");
 	}
 
 	/* Wait for AFE LATCH */
 	for_each_dsi_port(port, intel_dsi->ports) {
 		if (intel_de_wait_for_set(dev_priv, BXT_MIPI_PORT_CTRL(port),
 					  AFE_LATCHOUT, 20))
-			DRM_ERROR("D-PHY not entering LP-11 state\n");
+			drm_err(&dev_priv->drm,
+				"D-PHY not entering LP-11 state\n");
 	}
 }
 
@@ -445,7 +452,7 @@ static void bxt_dsi_device_ready(struct intel_encoder *encoder)
 	enum port port;
 	u32 val;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	/* Enable MIPI PHY transparent latch */
 	for_each_dsi_port(port, intel_dsi->ports) {
@@ -473,7 +480,7 @@ static void vlv_dsi_device_ready(struct intel_encoder *encoder)
 	enum port port;
 	u32 val;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	vlv_flisdsi_get(dev_priv);
 	/* program rcomp for compliance, reduce from 50 ohms to 45 ohms
@@ -540,14 +547,15 @@ static void glk_dsi_enter_low_power_mode(struct intel_encoder *encoder)
 	for_each_dsi_port(port, intel_dsi->ports) {
 		if (intel_de_wait_for_clear(dev_priv, MIPI_CTRL(port),
 					    GLK_PHY_STATUS_PORT_READY, 20))
-			DRM_ERROR("PHY is not turning OFF\n");
+			drm_err(&dev_priv->drm, "PHY is not turning OFF\n");
 	}
 
 	/* Wait for Pwr ACK bit to unset */
 	for_each_dsi_port(port, intel_dsi->ports) {
 		if (intel_de_wait_for_clear(dev_priv, MIPI_CTRL(port),
 					    GLK_MIPIIO_PORT_POWERED, 20))
-			DRM_ERROR("MIPI IO Port is not powergated\n");
+			drm_err(&dev_priv->drm,
+				"MIPI IO Port is not powergated\n");
 	}
 }
 
@@ -567,7 +575,7 @@ static void glk_dsi_disable_mipi_io(struct intel_encoder *encoder)
 	for_each_dsi_port(port, intel_dsi->ports) {
 		if (intel_de_wait_for_clear(dev_priv, MIPI_CTRL(port),
 					    GLK_PHY_STATUS_PORT_READY, 20))
-			DRM_ERROR("PHY is not turning OFF\n");
+			drm_err(&dev_priv->drm, "PHY is not turning OFF\n");
 	}
 
 	/* Clear MIPI mode */
@@ -590,7 +598,7 @@ static void vlv_dsi_clear_device_ready(struct intel_encoder *encoder)
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	enum port port;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 	for_each_dsi_port(port, intel_dsi->ports) {
 		/* Common bit for both MIPI Port A & MIPI Port C on VLV/CHV */
 		i915_reg_t port_ctrl = IS_GEN9_LP(dev_priv) ?
@@ -616,7 +624,7 @@ static void vlv_dsi_clear_device_ready(struct intel_encoder *encoder)
 		if ((IS_GEN9_LP(dev_priv) || port == PORT_A) &&
 		    intel_de_wait_for_clear(dev_priv, port_ctrl,
 					    AFE_LATCHOUT, 30))
-			DRM_ERROR("DSI LP not going Low\n");
+			drm_err(&dev_priv->drm, "DSI LP not going Low\n");
 
 		/* Disable MIPI PHY transparent latch */
 		val = intel_de_read(dev_priv, port_ctrl);
@@ -764,7 +772,7 @@ static void intel_dsi_pre_enable(struct intel_encoder *encoder,
 	u32 val;
 	bool glk_cold_boot = false;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	intel_set_cpu_fifo_underrun_reporting(dev_priv, pipe, true);
 
@@ -898,7 +906,7 @@ static void intel_dsi_post_disable(struct intel_encoder *encoder,
 	enum port port;
 	u32 val;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	if (IS_GEN9_LP(dev_priv)) {
 		intel_crtc_vblank_off(old_crtc_state);
@@ -973,7 +981,7 @@ static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
 	enum port port;
 	bool active = false;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	wakeref = intel_display_power_get_if_enabled(dev_priv,
 						     encoder->power_domain);
@@ -1208,7 +1216,7 @@ static void intel_dsi_get_config(struct intel_encoder *encoder,
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	u32 pclk;
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	pipe_config->output_types |= BIT(INTEL_OUTPUT_DSI);
 
@@ -1342,7 +1350,7 @@ static void intel_dsi_prepare(struct intel_encoder *intel_encoder,
 	u32 val, tmp;
 	u16 mode_hdisplay;
 
-	DRM_DEBUG_KMS("pipe %c\n", pipe_name(intel_crtc->pipe));
+	drm_dbg_kms(&dev_priv->drm, "pipe %c\n", pipe_name(intel_crtc->pipe));
 
 	mode_hdisplay = adjusted_mode->crtc_hdisplay;
 
@@ -1717,7 +1725,8 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 	prepare_cnt = DIV_ROUND_UP(ths_prepare_ns * ui_den, ui_num * mul);
 
 	if (prepare_cnt > PREPARE_CNT_MAX) {
-		DRM_DEBUG_KMS("prepare count too high %u\n", prepare_cnt);
+		drm_dbg_kms(&dev_priv->drm, "prepare count too high %u\n",
+			    prepare_cnt);
 		prepare_cnt = PREPARE_CNT_MAX;
 	}
 
@@ -1737,7 +1746,8 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 		exit_zero_cnt += 1;
 
 	if (exit_zero_cnt > EXIT_ZERO_CNT_MAX) {
-		DRM_DEBUG_KMS("exit zero count too high %u\n", exit_zero_cnt);
+		drm_dbg_kms(&dev_priv->drm, "exit zero count too high %u\n",
+			    exit_zero_cnt);
 		exit_zero_cnt = EXIT_ZERO_CNT_MAX;
 	}
 
@@ -1747,7 +1757,8 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 				* ui_den, ui_num * mul);
 
 	if (clk_zero_cnt > CLK_ZERO_CNT_MAX) {
-		DRM_DEBUG_KMS("clock zero count too high %u\n", clk_zero_cnt);
+		drm_dbg_kms(&dev_priv->drm, "clock zero count too high %u\n",
+			    clk_zero_cnt);
 		clk_zero_cnt = CLK_ZERO_CNT_MAX;
 	}
 
@@ -1756,7 +1767,8 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 	trail_cnt = DIV_ROUND_UP(tclk_trail_ns * ui_den, ui_num * mul);
 
 	if (trail_cnt > TRAIL_CNT_MAX) {
-		DRM_DEBUG_KMS("trail count too high %u\n", trail_cnt);
+		drm_dbg_kms(&dev_priv->drm, "trail count too high %u\n",
+			    trail_cnt);
 		trail_cnt = TRAIL_CNT_MAX;
 	}
 
@@ -1831,7 +1843,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 	enum port port;
 	enum pipe pipe;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	/* There is no detection method for MIPI so rely on VBT */
 	if (!intel_bios_is_dsi_present(dev_priv, &port))
@@ -1908,18 +1920,18 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 	}
 
 	if (!intel_dsi_vbt_init(intel_dsi, MIPI_DSI_GENERIC_PANEL_ID)) {
-		DRM_DEBUG_KMS("no device found\n");
+		drm_dbg_kms(&dev_priv->drm, "no device found\n");
 		goto err;
 	}
 
 	/* Use clock read-back from current hw-state for fastboot */
 	current_mode = intel_encoder_current_mode(intel_encoder);
 	if (current_mode) {
-		DRM_DEBUG_KMS("Calculated pclk %d GOP %d\n",
-			      intel_dsi->pclk, current_mode->clock);
+		drm_dbg_kms(&dev_priv->drm, "Calculated pclk %d GOP %d\n",
+			    intel_dsi->pclk, current_mode->clock);
 		if (intel_fuzzy_clock_check(intel_dsi->pclk,
 					    current_mode->clock)) {
-			DRM_DEBUG_KMS("Using GOP pclk\n");
+			drm_dbg_kms(&dev_priv->drm, "Using GOP pclk\n");
 			intel_dsi->pclk = current_mode->clock;
 		}
 
@@ -1947,7 +1959,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 	mutex_unlock(&dev->mode_config.mutex);
 
 	if (!fixed_mode) {
-		DRM_DEBUG_KMS("no fixed mode\n");
+		drm_dbg_kms(&dev_priv->drm, "no fixed mode\n");
 		goto err_cleanup_connector;
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
