Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FC31441B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 00:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BE56EA4E;
	Mon,  8 Feb 2021 23:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9916EA4E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 23:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612827579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SnJNtBAcJ5gSVMqfbmSC2VGgqnqgqClFRY2D8geGls=;
 b=N9COdTHnVDHl9I0hNKteNA5cIQYtQTk6t5UicvzonTQtSej367GClYeGZ7NdAh468L/opP
 8VGqutsHKXFFB1x18ZDf8Y76WCdJiPVp/yY56gQLZGZ06xNKobeHqmLxDm5huRszVfGaCS
 1zJCI/iWgwFWBnjbEubonjvMm2qPRAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-3ycnnAXCNX2cOM1olstM6w-1; Mon, 08 Feb 2021 18:39:35 -0500
X-MC-Unique: 3ycnnAXCNX2cOM1olstM6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 586CC804023;
 Mon,  8 Feb 2021 23:39:33 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-114-219.rdu2.redhat.com
 [10.10.114.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D7AF608DB;
 Mon,  8 Feb 2021 23:39:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC v4 09/11] drm/i915/dpcd_bl: Print return codes for VESA
 backlight failures
Date: Mon,  8 Feb 2021 18:38:59 -0500
Message-Id: <20210208233902.1289693-10-lyude@redhat.com>
In-Reply-To: <20210208233902.1289693-1-lyude@redhat.com>
References: <20210208233902.1289693-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also, stop printing the DPCD register that failed, and just describe it
instead. Saves us from having to look up each register offset when reading
through kernel logs (plus, DPCD dumping with drm.debug |= 0x100 will give
us that anyway).

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 101 +++++++++---------
 1 file changed, 52 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index a139f0e08839..a98d9bd4b0ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -274,14 +274,12 @@ static bool intel_dp_aux_vesa_backlight_dpcd_mode(struct intel_connector *connec
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int ret;
 	u8 mode_reg;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux,
-			      DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
-			      &mode_reg) != 1) {
-		drm_dbg_kms(&i915->drm,
-			    "Failed to read the DPCD register 0x%x\n",
-			    DP_EDP_BACKLIGHT_MODE_SET_REGISTER);
+	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to read backlight mode: %d\n", ret);
 		return false;
 	}
 
@@ -297,6 +295,7 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int ret;
 	u8 read_val[2] = { 0x0 };
 	u16 level = 0;
 
@@ -307,10 +306,10 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 	if (!intel_dp_aux_vesa_backlight_dpcd_mode(connector))
 		return connector->panel.backlight.max;
 
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, &read_val,
-			     sizeof(read_val)) != sizeof(read_val)) {
-		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
-			    DP_EDP_BACKLIGHT_BRIGHTNESS_MSB);
+	ret = drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, &read_val,
+			       sizeof(read_val));
+	if (ret != sizeof(read_val)) {
+		drm_dbg_kms(&i915->drm, "Failed to read brightness level: %d\n", ret);
 		return 0;
 	}
 
@@ -333,6 +332,7 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int ret;
 	u8 vals[2] = { 0x0 };
 
 	/* Write the MSB and/or LSB */
@@ -343,10 +343,10 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
 		vals[0] = level;
 	}
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, vals,
-			      sizeof(vals)) != sizeof(vals)) {
-		drm_dbg_kms(&i915->drm,
-			    "Failed to write aux backlight level\n");
+	ret = drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, vals,
+				sizeof(vals));
+	if (ret != sizeof(vals)) {
+		drm_dbg_kms(&i915->drm, "Failed to write aux backlight level: %d\n", ret);
 		return;
 	}
 }
@@ -355,26 +355,28 @@ static void set_vesa_backlight_enable(struct intel_connector *connector, bool en
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	int ret;
 	u8 reg_val = 0;
 
 	/* Early return when display use other mechanism to enable backlight. */
 	if (!connector->panel.backlight.edp.vesa.aux_enable)
 		return;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val) != 1) {
-		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
-			    DP_EDP_DISPLAY_CONTROL_REGISTER);
+	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to read eDP display control register: %d\n", ret);
 		return;
 	}
+
 	if (enable)
 		reg_val |= DP_EDP_BACKLIGHT_ENABLE;
 	else
 		reg_val &= ~(DP_EDP_BACKLIGHT_ENABLE);
 
-	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
-			       reg_val) != 1) {
-		drm_dbg_kms(&i915->drm, "Failed to %s aux backlight\n",
-			    enable ? "enable" : "disable");
+	ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, reg_val);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to %s aux backlight: %d\n",
+			    enable ? "enable" : "disable", ret);
 	}
 }
 
@@ -386,13 +388,13 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_panel *panel = &connector->panel;
+	int ret;
 	u8 dpcd_buf, new_dpcd_buf;
 	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux,
-			DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf) != 1) {
-		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
-			    DP_EDP_BACKLIGHT_MODE_SET_REGISTER);
+	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to read backlight mode: %d\n", ret);
 		return;
 	}
 
@@ -402,24 +404,26 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
 
-		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT,
-				       pwmgen_bit_count) != 1)
-			drm_dbg_kms(&i915->drm,
-				    "Failed to write aux pwmgen bit count\n");
+		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, pwmgen_bit_count);
+		if (ret != 1)
+			drm_dbg_kms(&i915->drm, "Failed to write aux pwmgen bit count: %d\n", ret);
 	}
 
 	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
-		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_FREQ_SET,
-				       panel->backlight.edp.vesa.pwm_freq_pre_divider) == 1)
+		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_FREQ_SET,
+					 panel->backlight.edp.vesa.pwm_freq_pre_divider);
+		if (ret == 1)
 			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
 		else
-			drm_dbg_kms(&i915->drm, "Failed to write aux backlight frequency\n");
+			drm_dbg_kms(&i915->drm, "Failed to write aux backlight frequency: %d\n",
+				    ret);
 	}
 
 	if (new_dpcd_buf != dpcd_buf) {
-		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
-				       new_dpcd_buf) != 1)
-			drm_dbg_kms(&i915->drm, "Failed to write aux backlight mode\n");
+		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
+					 new_dpcd_buf);
+		if (ret != 1)
+			drm_dbg_kms(&i915->drm, "Failed to write aux backlight mode: %d\n", ret);
 	}
 
 	intel_dp_aux_vesa_set_backlight(conn_state, level);
@@ -446,11 +450,12 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_panel *panel = &connector->panel;
 	u32 max_backlight = 0;
-	int freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
+	int ret, freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
 	u8 pn, pn_min, pn_max;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn) != 1) {
-		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap\n");
+	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap: %d\n", ret);
 		return 0;
 	}
 
@@ -479,16 +484,14 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 	 * - FxP is within 25% of desired value.
 	 *   Note: 25% is arbitrary value and may need some tweak.
 	 */
-	if (drm_dp_dpcd_readb(&intel_dp->aux,
-			      DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min) != 1) {
-		drm_dbg_kms(&i915->drm,
-			    "Failed to read pwmgen bit count cap min\n");
+	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap min: %d\n", ret);
 		return max_backlight;
 	}
-	if (drm_dp_dpcd_readb(&intel_dp->aux,
-			      DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max) != 1) {
-		drm_dbg_kms(&i915->drm,
-			    "Failed to read pwmgen bit count cap max\n");
+	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap max: %d\n", ret);
 		return max_backlight;
 	}
 	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
@@ -512,9 +515,9 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 	}
 
 	drm_dbg_kms(&i915->drm, "Using eDP pwmgen bit count of %d\n", pn);
-	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, pn) != 1) {
-		drm_dbg_kms(&i915->drm,
-			    "Failed to write aux pwmgen bit count\n");
+	ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm, "Failed to write aux pwmgen bit count: %d\n", ret);
 		return max_backlight;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
