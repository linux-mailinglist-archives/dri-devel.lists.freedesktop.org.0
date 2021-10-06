Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF5B423603
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 04:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6B86ECCB;
	Wed,  6 Oct 2021 02:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052F6ECCB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 02:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633488098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLcuTWM1V8pAKjbl7UlEU8IOujwzq7wQYWPMZrjYNf0=;
 b=Viv4Farz3lXMoVSL3ZH27UonUjEoAvmN3NHveiejFKEPvrrSbOXttfsU8nQjaepdXMCeNB
 9S0X6PlVPiB7OWWMXaGdrL3ttXijipHjPl0ApcpZcmVizZ8bJjbiyA8c3LdeLaOcZr3KT1
 elh+Fo/pPtFxwqb1gEa/NiDBrXf7uho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-U5MOBpBxP7eNgg1ON1AdpA-1; Tue, 05 Oct 2021 22:41:37 -0400
X-MC-Unique: U5MOBpBxP7eNgg1ON1AdpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19DB518D6A25;
 Wed,  6 Oct 2021 02:41:35 +0000 (UTC)
Received: from Ruby.lyude.net (unknown [10.22.16.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50BA79AA20;
 Wed,  6 Oct 2021 02:41:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Rajeev Nandan <rajeevny@codeaurora.org>,
 Doug Anderson <dianders@chromium.org>,
 Satadru Pramanik <satadru@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/5] drm/dp,
 drm/i915: Add support for VESA backlights using PWM for brightness
 control
Date: Tue,  5 Oct 2021 22:40:17 -0400
Message-Id: <20211006024018.320394-5-lyude@redhat.com>
In-Reply-To: <20211006024018.320394-1-lyude@redhat.com>
References: <20211006024018.320394-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Note however that we still don't enable using this by default on i915 when
it's not needed, primarily because I haven't yet had a chance to confirm if
it's safe to do this on the one machine in Intel's CI that had an issue
with this: samus-fi-bdw. I have done basic testing of this on other
machines though, by manually patching i915 to force it into PWM-only mode
on some of my laptops.

v2:
* Correct documentation (thanks Doug!)
* Get rid of backlight caps

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Rajeev Nandan <rajeevny@codeaurora.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Satadru Pramanik <satadru@gmail.com>
---
 drivers/gpu/drm/drm_dp_helper.c               | 76 +++++++++++++------
 .../drm/i915/display/intel_dp_aux_backlight.c | 48 +++++++++---
 include/drm/drm_dp_helper.h                   |  7 +-
 3 files changed, 94 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index d9a7f07f42fd..9bef21613370 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -3173,6 +3173,10 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 	int ret;
 	u8 buf[2] = { 0 };
 
+	/* The panel uses the PWM for controlling brightness levels */
+	if (!bl->aux_set)
+		return 0;
+
 	if (bl->lsb_reg_used) {
 		buf[0] = (level & 0xff00) >> 8;
 		buf[1] = (level & 0x00ff);
@@ -3199,7 +3203,7 @@ drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	int ret;
 	u8 buf;
 
-	/* The panel uses something other then DPCD for enabling its backlight */
+	/* This panel uses the EDP_BL_PWR GPIO for enablement */
 	if (!bl->aux_enable)
 		return 0;
 
@@ -3234,11 +3238,11 @@ drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
  * restoring any important backlight state such as the given backlight level, the brightness byte
  * count, backlight frequency, etc.
  *
- * Note that certain panels, while supporting brightness level controls over DPCD, may not support
- * having their backlights enabled via the standard %DP_EDP_DISPLAY_CONTROL_REGISTER. On such panels
- * &drm_edp_backlight_info.aux_enable will be set to %false, this function will skip the step of
- * programming the %DP_EDP_DISPLAY_CONTROL_REGISTER, and the driver must perform the required
- * implementation specific step for enabling the backlight after calling this function.
+ * Note that certain panels do not support being enabled or disabled via DPCD, but instead require
+ * that the driver handle enabling/disabling the panel through implementation-specific means using
+ * the EDP_BL_PWR GPIO. For such panels, &drm_edp_backlight_info.aux_enable will be set to %false,
+ * this function becomes a no-op, and the driver is expected to handle powering the panel on using
+ * the EDP_BL_PWR GPIO.
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
@@ -3259,9 +3263,14 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	new_dpcd_buf = dpcd_buf & (DP_EDP_BACKLIGHT_CONTROL_MODE_MASK |
 				   DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE);
 
-	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
+	if (bl->aux_set)
+		new_mode = DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
+	else
+		new_mode = DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
+
+	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != new_mode) {
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
-		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
+		new_dpcd_buf |= new_mode;
 
 		if (bl->pwmgen_bit_count) {
 			ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
@@ -3308,12 +3317,13 @@ EXPORT_SYMBOL(drm_edp_backlight_enable);
  * @aux: The DP AUX channel to use
  * @bl: Backlight capability info from drm_edp_backlight_init()
  *
- * This function handles disabling DPCD backlight controls on a panel over AUX. Note that some
- * panels have backlights that are enabled/disabled by other means, despite having their brightness
- * values controlled through DPCD. On such panels &drm_edp_backlight_info.aux_enable will be set to
- * %false, this function will become a no-op (and we will skip updating
- * %DP_EDP_DISPLAY_CONTROL_REGISTER), and the driver must take care to perform it's own
- * implementation specific step for disabling the backlight.
+ * This function handles disabling DPCD backlight controls on a panel over AUX.
+ *
+ * Note that certain panels do not support being enabled or disabled via DPCD, but instead require
+ * that the driver handle enabling/disabling the panel through implementation-specific means using
+ * the EDP_BL_PWR GPIO. For such panels, &drm_edp_backlight_info.aux_enable will be set to %false,
+ * this function becomes a no-op, and the driver is expected to handle powering the panel off using
+ * the EDP_BL_PWR GPIO.
  *
  * Returns: %0 on success or no-op, negative error code on failure.
  */
@@ -3337,6 +3347,9 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	int ret;
 	u8 pn, pn_min, pn_max;
 
+	if (!bl->aux_set)
+		return 0;
+
 	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
 	if (ret != 1) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap: %d\n",
@@ -3422,7 +3435,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 }
 
 static inline int
-drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
+drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
 			      u8 *current_mode)
 {
 	int ret;
@@ -3437,6 +3450,9 @@ drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
+	if (!bl->aux_set)
+		return 0;
+
 	if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		int size = 1 + bl->lsb_reg_used;
 
@@ -3467,7 +3483,7 @@ drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  * @bl: The &drm_edp_backlight_info struct to fill out with information on the backlight
  * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
  * @edp_dpcd: A cached copy of the eDP DPCD
- * @current_level: Where to store the probed brightness level
+ * @current_level: Where to store the probed brightness level, if any
  * @current_mode: Where to store the currently set backlight control mode
  *
  * Initializes a &drm_edp_backlight_info struct by probing @aux for it's backlight capabilities,
@@ -3487,24 +3503,38 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 
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
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 594fdc7453ca..91daf9ab50e8 100644
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
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index b52df4db3e8f..c8898a3a0c27 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1851,7 +1851,7 @@ drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
  *
  * Note that currently this function will return %false for panels which support various DPCD
  * backlight features but which require the brightness be set through PWM, and don't support setting
- * the brightness level via the DPCD. This is a TODO.
+ * the brightness level via the DPCD.
  *
  * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
  * otherwise
@@ -1859,8 +1859,7 @@ drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 static inline bool
 drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
 {
-	return (edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP) &&
-		(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP);
+	return !!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP);
 }
 
 /*
@@ -2221,6 +2220,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
  * @max: The maximum backlight level that may be set
  * @lsb_reg_used: Do we also write values to the DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
  * @aux_enable: Does the panel support the AUX enable cap?
+ * @aux_set: Does the panel support setting the brightness through AUX?
  *
  * This structure contains various data about an eDP backlight, which can be populated by using
  * drm_edp_backlight_init().
@@ -2232,6 +2232,7 @@ struct drm_edp_backlight_info {
 
 	bool lsb_reg_used : 1;
 	bool aux_enable : 1;
+	bool aux_set : 1;
 };
 
 int
-- 
2.31.1

