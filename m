Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B90380F81
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFD36F3F0;
	Fri, 14 May 2021 18:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFBA6F3EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621016141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BRIpi+u5w7+IcMV4egi4y2reGA+g2xOvrb+SvyeAtf8=;
 b=QJ9UHdNN2g7bEoXLNvtNvJbKpk3qujliVb2g7Xgh8O9aIuGra1d8g3e2j+AWv5VC+1gRmD
 lW+BRHe+ErXXYDPj7QCVsZTIeUPZAFBowDJETJ6dWqiLRcYfgG99sYZNRcco4+tjOhLT3y
 va94YYVI2HDBegeuDY83j/R7DjXkIVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-ru5N9jJENUOkHfs770PuDw-1; Fri, 14 May 2021 14:15:36 -0400
X-MC-Unique: ru5N9jJENUOkHfs770PuDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB671107ACC7;
 Fri, 14 May 2021 18:15:33 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-140.rdu2.redhat.com
 [10.10.118.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 252731971B;
 Fri, 14 May 2021 18:15:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v6 1/9] drm/i915/dpcd_bl: Remove redundant AUX backlight
 frequency calculations
Date: Fri, 14 May 2021 14:14:55 -0400
Message-Id: <20210514181504.565252-2-lyude@redhat.com>
In-Reply-To: <20210514181504.565252-1-lyude@redhat.com>
References: <20210514181504.565252-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Rajeev Nandan <rajeevny@codeaurora.org>, greg.depoire@gmail.com,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this while moving all of the VESA backlight code in i915 over to
DRM helpers: it would appear that we calculate the frequency value we want
to write to DP_EDP_BACKLIGHT_FREQ_SET twice even though this value never
actually changes during runtime. So, let's simplify things by just caching
this value in intel_panel.backlight, and re-writing it as-needed.

Changes since v1:
* Wrap panel->backlight.edp.vesa.pwm_freq_pre_divider in
  DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP check - Jani

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: greg.depoire@gmail.com
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 .../drm/i915/display/intel_dp_aux_backlight.c | 65 ++++++-------------
 2 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9c0adfc60c6f..7054a37363fb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -311,6 +311,7 @@ struct intel_panel {
 		union {
 			struct {
 				u8 pwmgen_bit_count;
+				u8 pwm_freq_pre_divider;
 			} vesa;
 			struct {
 				bool sdr_uses_aux;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 8e9ac9ba1d38..68bfe50ada59 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -373,50 +373,6 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
 	}
 }
 
-/*
- * Set PWM Frequency divider to match desired frequency in vbt.
- * The PWM Frequency is calculated as 27Mhz / (F x P).
- * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
- *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
- * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
- *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
- */
-static bool intel_dp_aux_vesa_set_pwm_freq(struct intel_connector *connector)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	const u8 pn = connector->panel.backlight.edp.vesa.pwmgen_bit_count;
-	int freq, fxp, f, fxp_actual, fxp_min, fxp_max;
-
-	freq = dev_priv->vbt.backlight.pwm_freq_hz;
-	if (!freq) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "Use panel default backlight frequency\n");
-		return false;
-	}
-
-	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
-	f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
-	fxp_actual = f << pn;
-
-	/* Ensure frequency is within 25% of desired value */
-	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
-	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
-
-	if (fxp_min > fxp_actual || fxp_actual > fxp_max) {
-		drm_dbg_kms(&dev_priv->drm, "Actual frequency out of range\n");
-		return false;
-	}
-
-	if (drm_dp_dpcd_writeb(&intel_dp->aux,
-			       DP_EDP_BACKLIGHT_FREQ_SET, (u8) f) < 0) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "Failed to write aux backlight freq\n");
-		return false;
-	}
-	return true;
-}
-
 static void
 intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 				   const struct drm_connector_state *conn_state, u32 level)
@@ -459,9 +415,13 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 		break;
 	}
 
-	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
-		if (intel_dp_aux_vesa_set_pwm_freq(connector))
+	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
+		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_FREQ_SET,
+				       panel->backlight.edp.vesa.pwm_freq_pre_divider) == 1)
 			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
+		else
+			drm_dbg_kms(&i915->drm, "Failed to write aux backlight frequency\n");
+	}
 
 	if (new_dpcd_buf != dpcd_buf) {
 		if (drm_dp_dpcd_writeb(&intel_dp->aux,
@@ -482,6 +442,14 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 				  false);
 }
 
+/*
+ * Compute PWM frequency divider value based off the frequency provided to us by the vbt.
+ * The PWM Frequency is calculated as 27Mhz / (F x P).
+ * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
+ *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
+ * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
+ *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
+ */
 static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
@@ -533,8 +501,10 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
 	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
 
+	/* Ensure frequency is within 25% of desired value */
 	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
 	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
+
 	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
 		drm_dbg_kms(&i915->drm,
 			    "VBT defined backlight frequency out of range\n");
@@ -555,7 +525,10 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 			    "Failed to write aux pwmgen bit count\n");
 		return max_backlight;
 	}
+
 	panel->backlight.edp.vesa.pwmgen_bit_count = pn;
+	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
+		panel->backlight.edp.vesa.pwm_freq_pre_divider = f;
 
 	max_backlight = (1 << pn) - 1;
 
-- 
2.31.1

