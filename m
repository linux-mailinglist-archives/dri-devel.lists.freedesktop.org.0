Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D9419FE5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 22:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101476E03E;
	Mon, 27 Sep 2021 20:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4A26E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 20:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632773566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHrPinAU8/TTACKiwAThJHTGWa7ls0EXx/4m7i3yKRw=;
 b=BMPLZnfYQGqYhWE+x9HKw2fziUTSLeOpq9eW04ydBto3QdAH5OP4yZlxQMQqpArOuL+VCf
 hqEko6nl5IcAYu/Cr88EUJe3N1gpygVUXexSz+4ItS9aQAPl6hxJM2O4Kx5b9WwNUvV81i
 NtUGnZFEcCdQWbjZKzM9HrfV3Pvmy1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-D6x2SnUaNAS0uSy8lQ5Q_w-1; Mon, 27 Sep 2021 16:12:42 -0400
X-MC-Unique: D6x2SnUaNAS0uSy8lQ5Q_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCD32802C8F;
 Mon, 27 Sep 2021 20:12:40 +0000 (UTC)
Received: from Ruby.lyude.net (unknown [10.22.17.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5A70109B6EA;
 Mon, 27 Sep 2021 20:12:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Rajeev Nandan <rajeevny@codeaurora.org>,
 Doug Anderson <dianders@chromium.org>,
 Satadru Pramanik <satadru@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 linux-kernel@vger.kernel.org (open list),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS)
Subject: [PATCH 2/3] drm/dp,
 drm/i915: Add support for VESA backlights using PWM for brightness
 control
Date: Mon, 27 Sep 2021 16:12:05 -0400
Message-Id: <20210927201206.682788-3-lyude@redhat.com>
In-Reply-To: <20210927201206.682788-1-lyude@redhat.com>
References: <20210927201206.682788-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Now that we've added support to i915 for controlling panel backlights that
need PWM to be enabled/disabled, let's finalize this and add support for
controlling brightness levels via PWM as well. This should hopefully put us
towards the path of supporting _ALL_ backlights via VESA's DPCD interface
which would allow us to finally start trusting the DPCD again.

Note that for the DRM helpers for this, we change some behavior by starting
to hide all backlights that require PWM controls by default, and require
that the driver pass our new DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM flag to
drm_edp_backlight_supported(). The primary reason for doing this is that
panels requiring PWM in addition to DPCD controls will require additional
implementation on the driver's side, as there's no way for us to handle
PWM controls from the helpers in a driver-independent way.

Note however that we still don't enable using this by default when it's not
needed, primarily because I haven't yet had a chance to confirm if it's
safe to do this on the one machine in Intel's CI that had an issue with
this: samus-fi-bdw. I have done basic testing of this on other machines
though, by manually patching i915 to force it into PWM-only mode on some of
my laptops.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Rajeev Nandan <rajeevny@codeaurora.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Satadru Pramanik <satadru@gmail.com>
---
 drivers/gpu/drm/drm_dp_helper.c               | 102 ++++++++++++++----
 .../drm/i915/display/intel_dp_aux_backlight.c |  51 ++++++---
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   2 +-
 include/drm/drm_dp_helper.h                   |  46 ++++----
 4 files changed, 146 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 4d0d1e8e51fa..a1cf849fc6ed 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -3163,7 +3163,10 @@ EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
  * @level: The brightness level to set
  *
  * Sets the brightness level of an eDP panel's backlight. Note that the panel's backlight must
- * already have been enabled by the driver by calling drm_edp_backlight_enable().
+ * already have been enabled by the driver by calling drm_edp_backlight_enable(). Note that if the
+ * panel in question requires the PWM pin be used to control brightness levels (e.g.
+ * &drm_edp_backlight_info.aux_set is %false), then this function becomes a no-op and it is up to
+ * the driver to handle adjusting the brightness levels.
  *
  * Returns: %0 on success, negative error code on failure
  */
@@ -3173,6 +3176,10 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 	int ret;
 	u8 buf[2] = { 0 };
 
+	/* The panel uses PWM for controlling brightness levels */
+	if (!bl->aux_set)
+		return 0;
+
 	if (bl->lsb_reg_used) {
 		buf[0] = (level & 0xff00) >> 8;
 		buf[1] = (level & 0x00ff);
@@ -3234,11 +3241,8 @@ drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
  * restoring any important backlight state such as the given backlight level, the brightness byte
  * count, backlight frequency, etc.
  *
- * Note that certain panels, while supporting brightness level controls over DPCD, may not support
- * having their backlights enabled via the standard %DP_EDP_DISPLAY_CONTROL_REGISTER. On such panels
- * &drm_edp_backlight_info.aux_enable will be set to %false, this function will skip the step of
- * programming the %DP_EDP_DISPLAY_CONTROL_REGISTER, and the driver must perform the required
- * implementation specific step for enabling the backlight after calling this function.
+ * Drivers supporting %DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM are expected to enable the panel backlight
+ * and/or program the panel's brightness level after calling this function.
  *
  * Returns: %0 on success, negative error code on failure.
  */
@@ -3246,7 +3250,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 			     const u16 level)
 {
 	int ret;
-	u8 dpcd_buf, new_dpcd_buf;
+	u8 dpcd_buf, new_dpcd_buf, new_mode;
 
 	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf);
 	if (ret != 1) {
@@ -3256,10 +3260,14 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	}
 
 	new_dpcd_buf = dpcd_buf;
+	if (bl->aux_set)
+		new_mode = DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
+	else
+		new_mode = DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
 
-	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
+	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != new_mode) {
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
-		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
+		new_dpcd_buf |= new_mode;
 
 		if (bl->pwmgen_bit_count) {
 			ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
@@ -3305,11 +3313,10 @@ EXPORT_SYMBOL(drm_edp_backlight_enable);
  * @bl: Backlight capability info from drm_edp_backlight_init()
  *
  * This function handles disabling DPCD backlight controls on a panel over AUX. Note that some
- * panels have backlights that are enabled/disabled by other means, despite having their brightness
- * values controlled through DPCD. On such panels &drm_edp_backlight_info.aux_enable will be set to
- * %false, this function will become a no-op (and we will skip updating
- * %DP_EDP_DISPLAY_CONTROL_REGISTER), and the driver must take care to perform it's own
- * implementation specific step for disabling the backlight.
+ * panels have backlights that are enabled/disabled via PWM. On such panels
+ * &drm_edp_backlight_info.aux_enable will be set to %false, this function will become a no-op (and
+ * we will skip updating %DP_EDP_DISPLAY_CONTROL_REGISTER), and the driver must handle disabling the
+ * backlight via PWM.
  *
  * Returns: %0 on success or no-op, negative error code on failure.
  */
@@ -3333,6 +3340,9 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	int ret;
 	u8 pn, pn_min, pn_max;
 
+	if (!bl->aux_set)
+		return 0;
+
 	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
 	if (ret != 1) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap: %d\n",
@@ -3418,7 +3428,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 }
 
 static inline int
-drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
+drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 			      u8 *current_mode)
 {
 	int ret;
@@ -3433,6 +3443,9 @@ drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
+	if (!bl->aux_set)
+		return 0;
+
 	if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		int size = 1 + bl->lsb_reg_used;
 
@@ -3463,7 +3476,7 @@ drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  * @bl: The &drm_edp_backlight_info struct to fill out with information on the backlight
  * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
  * @edp_dpcd: A cached copy of the eDP DPCD
- * @current_level: Where to store the probed brightness level
+ * @current_level: Where to store the probed brightness level, if any
  * @current_mode: Where to store the currently set backlight control mode
  *
  * Initializes a &drm_edp_backlight_info struct by probing @aux for it's backlight capabilities,
@@ -3483,28 +3496,71 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 
 	if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
 		bl->aux_enable = true;
+	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
+		bl->aux_set = true;
 	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
 		bl->lsb_reg_used = true;
 
+	/* Sanity check caps */
+	if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP)) {
+		drm_dbg_kms(aux->drm_dev,
+			    "%s: Panel supports neither AUX or PWM brightness control? Aborting\n",
+			    aux->name);
+		return -EINVAL;
+	}
+
 	ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_edp_backlight_probe_level(aux, bl, current_mode);
+	ret = drm_edp_backlight_probe_state(aux, bl, current_mode);
 	if (ret < 0)
 		return ret;
 	*current_level = ret;
 
 	drm_dbg_kms(aux->drm_dev,
-		    "%s: Found backlight level=%d/%d pwm_freq_pre_divider=%d mode=%x\n",
-		    aux->name, *current_level, bl->max, bl->pwm_freq_pre_divider, *current_mode);
-	drm_dbg_kms(aux->drm_dev,
-		    "%s: Backlight caps: pwmgen_bit_count=%d lsb_reg_used=%d aux_enable=%d\n",
-		    aux->name, bl->pwmgen_bit_count, bl->lsb_reg_used, bl->aux_enable);
+		    "%s: Found backlight: aux_set=%d aux_enable=%d mode=%d\n",
+		    aux->name, bl->aux_set, bl->aux_enable, *current_mode);
+	if (bl->aux_set) {
+		drm_dbg_kms(aux->drm_dev,
+			    "%s: Backlight caps: level=%d/%d pwm_freq_pre_divider=%d lsb_reg_used=%d\n",
+			    aux->name, *current_level, bl->max, bl->pwm_freq_pre_divider,
+			    bl->lsb_reg_used);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_edp_backlight_init);
 
+/**
+ * drm_edp_backlight_supported() - Check an eDP DPCD for VESA backlight support
+ * @aux: The AUX channel, only used for debug logging
+ * @edp_dpcd: The DPCD to check
+ * @caps: The backlight capabilities this driver supports
+ *
+ * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
+ * otherwise
+ */
+bool drm_edp_backlight_supported(struct drm_dp_aux *aux,
+				 const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
+				 enum drm_edp_backlight_driver_caps caps)
+{
+	if (!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP))
+		return false;
+
+	if (!(caps & DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM) &&
+	    (!(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP) ||
+	     !(edp_dpcd[2] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))) {
+		drm_dbg_kms(aux->drm_dev,
+			    "%s: eDP backlight needs PWM support, but driver doesn't have it\n",
+			    aux->name);
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_edp_backlight_supported);
+
 #if IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
 	(IS_MODULE(CONFIG_DRM_KMS_HELPER) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE))
 
@@ -3576,7 +3632,7 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 	if (ret < 0)
 		return ret;
 
-	if (!drm_edp_backlight_supported(edp_dpcd)) {
+	if (!drm_edp_backlight_supported(aux, edp_dpcd, 0)) {
 		DRM_DEV_INFO(panel->dev, "DP AUX backlight is not supported\n");
 		return 0;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 594fdc7453ca..9b1ac02b0263 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -282,6 +282,12 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u3
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	if (!panel->backlight.edp.vesa.info.aux_set) {
+		const u32 pwm_level = intel_backlight_level_to_pwm(connector, level);
+
+		intel_backlight_set_pwm_level(conn_state, pwm_level);
+	}
+
 	drm_edp_backlight_set_level(&intel_dp->aux, &panel->backlight.edp.vesa.info, level);
 }
 
@@ -293,9 +299,16 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
-	if (!panel->backlight.edp.vesa.info.aux_enable)
-		panel->backlight.pwm_funcs->enable(crtc_state, conn_state,
-						   panel->backlight.pwm_level_max);
+	if (!panel->backlight.edp.vesa.info.aux_enable) {
+		u32 pwm_level;
+
+		if (!panel->backlight.edp.vesa.info.aux_set)
+			pwm_level = intel_backlight_level_to_pwm(connector, level);
+		else
+			pwm_level = panel->backlight.pwm_level_max;
+
+		panel->backlight.pwm_funcs->enable(crtc_state, conn_state, pwm_level);
+	}
 
 	drm_edp_backlight_enable(&intel_dp->aux, &panel->backlight.edp.vesa.info, level);
 }
@@ -329,7 +342,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 	if (ret < 0)
 		return ret;
 
-	if (!panel->backlight.edp.vesa.info.aux_enable) {
+	if (!panel->backlight.edp.vesa.info.aux_set || !panel->backlight.edp.vesa.info.aux_enable) {
 		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
 		if (ret < 0) {
 			drm_err(&i915->drm,
@@ -338,14 +351,27 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 			return ret;
 		}
 	}
-	panel->backlight.max = panel->backlight.edp.vesa.info.max;
-	panel->backlight.min = 0;
-	if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
-		panel->backlight.level = current_level;
-		panel->backlight.enabled = panel->backlight.level != 0;
+
+	if (panel->backlight.edp.vesa.info.aux_set) {
+		panel->backlight.max = panel->backlight.edp.vesa.info.max;
+		panel->backlight.min = 0;
+		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
+			panel->backlight.level = current_level;
+			panel->backlight.enabled = panel->backlight.level != 0;
+		} else {
+			panel->backlight.level = panel->backlight.max;
+			panel->backlight.enabled = false;
+		}
 	} else {
-		panel->backlight.level = panel->backlight.max;
-		panel->backlight.enabled = false;
+		panel->backlight.max = panel->backlight.pwm_level_max;
+		panel->backlight.min = panel->backlight.pwm_level_min;
+		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
+			panel->backlight.level = panel->backlight.pwm_funcs->get(connector, pipe);
+			panel->backlight.enabled = panel->backlight.pwm_enabled;
+		} else {
+			panel->backlight.level = panel->backlight.max;
+			panel->backlight.enabled = false;
+		}
 	}
 
 	return 0;
@@ -357,7 +383,8 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
-	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
+	if (drm_edp_backlight_supported(&intel_dp->aux, intel_dp->edp_dpcd,
+					DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM)) {
 		drm_dbg_kms(&i915->drm, "AUX Backlight Control Supported!\n");
 		return true;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 1cbd71abc80a..c54642c038c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -308,7 +308,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 		if (ret < 0)
 			return ret;
 
-		if (drm_edp_backlight_supported(edp_dpcd)) {
+		if (drm_edp_backlight_supported(&nv_conn->aux, edp_dpcd, 0)) {
 			NV_DEBUG(drm, "DPCD backlight controls supported on %s\n",
 				 nv_conn->base.name);
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 3ee0b3ffb8a5..74dce86946e9 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1825,24 +1825,6 @@ drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 		DP_MSA_TIMING_PAR_IGNORED;
 }
 
-/**
- * drm_edp_backlight_supported() - Check an eDP DPCD for VESA backlight support
- * @edp_dpcd: The DPCD to check
- *
- * Note that currently this function will return %false for panels which support various DPCD
- * backlight features but which require the brightness be set through PWM, and don't support setting
- * the brightness level via the DPCD. This is a TODO.
- *
- * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
- * otherwise
- */
-static inline bool
-drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
-{
-	return (edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP) &&
-		(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP);
-}
-
 /*
  * DisplayPort AUX channel
  */
@@ -2200,7 +2182,11 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
  * @pwm_freq_pre_divider: The PWM frequency pre-divider value being used for this backlight, if any
  * @max: The maximum backlight level that may be set
  * @lsb_reg_used: Do we also write values to the DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
- * @aux_enable: Does the panel support the AUX enable cap?
+ * @aux_enable: Does the panel support the AUX enable cap? Always %false when the driver doesn't
+ * support %DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM
+ * @aux_set: Does the panel support setting the brightness through AUX? Always %true when the driver
+ * doesn't support %DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM
+ * @pwm_set: Does the panel support setting the brightness through a PWM pin?
  *
  * This structure contains various data about an eDP backlight, which can be populated by using
  * drm_edp_backlight_init().
@@ -2212,8 +2198,30 @@ struct drm_edp_backlight_info {
 
 	bool lsb_reg_used : 1;
 	bool aux_enable : 1;
+	bool aux_set : 1;
+};
+
+/**
+ * enum drm_edp_backlight_driver_caps - Flags for drivers to indicate support of various eDP
+ * backlight functionality
+ *
+ * Used with DRM's eDP backlight helpers in order to indicate to the DRM core which eDP backlight
+ * capabilities the driver is capable of supporting.
+ */
+enum drm_edp_backlight_driver_caps {
+	/**
+	 * @DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM: Some eDP panels require that either panel enablement
+	 * and/or brightness level controls are controlled via PWM. Drivers which want to support
+	 * such panels should enable this cap. If this flag is omitted,
+	 * drm_edp_backlight_supported() will return %false upon encountering such panels and will
+	 * additionally print a debugging message to the kernel log.
+	 */
+	DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM = BIT(0),
 };
 
+bool drm_edp_backlight_supported(struct drm_dp_aux *aux,
+				 const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
+				 enum drm_edp_backlight_driver_caps caps);
 int
 drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
-- 
2.31.1

