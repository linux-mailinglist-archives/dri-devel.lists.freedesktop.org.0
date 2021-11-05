Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150044686C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 19:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3EF6EC80;
	Fri,  5 Nov 2021 18:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219BE6EB6E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636137254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hS6tBGYZHTz8qEkqN34aySXE2+1TJTDCOkNXUTamhYI=;
 b=SV7WtISjF4O4glEYZGDseh0OFkyr+Btb7vufsET5ctMHIAjoDx2QuxX+ca2XkUcOrcjM3U
 H7KOy8QQb2kFY10+KpUx4hvvNhEhqCwS/dVeL2I4XejtIK7UQr4E4XCQo3StTzuO5MGqXD
 sHLtymDKNLUHjpK3utR5EFhVuDO3UiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-FxEfksKWNuuw1RhKaaOTpw-1; Fri, 05 Nov 2021 14:34:08 -0400
X-MC-Unique: FxEfksKWNuuw1RhKaaOTpw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8573587D54A;
 Fri,  5 Nov 2021 18:34:06 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.16.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A59F5FC13;
 Fri,  5 Nov 2021 18:33:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 1/5] drm/i915: Add support for panels with VESA backlights
 with PWM enable/disable
Date: Fri,  5 Nov 2021 14:33:38 -0400
Message-Id: <20211105183342.130810-2-lyude@redhat.com>
In-Reply-To: <20211105183342.130810-1-lyude@redhat.com>
References: <20211105183342.130810-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This simply adds proper support for panel backlights that can be controlled
via VESA's backlight control protocol, but which also require that we
enable and disable the backlight via PWM instead of via the DPCD interface.
We also enable this by default, in order to fix some people's backlights
that were broken by not having this enabled.

For reference, backlights that require this and use VESA's backlight
interface tend to be laptops with hybrid GPUs, but this very well may
change in the future.

v4:
* Make sure that we call intel_backlight_level_to_pwm() in
  intel_dp_aux_vesa_enable_backlight() - vsyrjala

Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/3680
Fixes: fe7d52bccab6 ("drm/i915/dp: Don't use DPCD backlights that need PWM enable/disable")
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.12+
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 569d17b4d00f..f05b71c01b8e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -293,6 +293,13 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	if (!panel->backlight.edp.vesa.info.aux_enable) {
+		u32 pwm_level = intel_backlight_invert_pwm_level(connector,
+								 panel->backlight.pwm_level_max);
+
+		panel->backlight.pwm_funcs->enable(crtc_state, conn_state, pwm_level);
+	}
+
 	drm_edp_backlight_enable(&intel_dp->aux, &panel->backlight.edp.vesa.info, level);
 }
 
@@ -304,6 +311,10 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
 	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
+
+	if (!panel->backlight.edp.vesa.info.aux_enable)
+		panel->backlight.pwm_funcs->disable(old_conn_state,
+						    intel_backlight_invert_pwm_level(connector, 0));
 }
 
 static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector, enum pipe pipe)
@@ -321,6 +332,15 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 	if (ret < 0)
 		return ret;
 
+	if (!panel->backlight.edp.vesa.info.aux_enable) {
+		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
+		if (ret < 0) {
+			drm_err(&i915->drm,
+				"Failed to setup PWM backlight controls for eDP backlight: %d\n",
+				ret);
+			return ret;
+		}
+	}
 	panel->backlight.max = panel->backlight.edp.vesa.info.max;
 	panel->backlight.min = 0;
 	if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
@@ -340,12 +360,7 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
-	/* TODO: We currently only support AUX only backlight configurations, not backlights which
-	 * require a mix of PWM and AUX controls to work. In the mean time, these machines typically
-	 * work just fine using normal PWM controls anyway.
-	 */
-	if ((intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
-	    drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
+	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
 		drm_dbg_kms(&i915->drm, "AUX Backlight Control Supported!\n");
 		return true;
 	}
-- 
2.31.1

