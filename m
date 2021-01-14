Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB382F6E01
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 23:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA35389FA5;
	Thu, 14 Jan 2021 22:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B77B89DE3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610662666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//HMcDHOzYQI1D7GAqPgrJm4kBxJcvIRr1Wcq1EcYHU=;
 b=d9mKJAB2H9LwrGNnawPqfgm64yJIp8tKiXjNSLx9komGnLBLWzJ66lOl1PCzccIlaY9IUH
 wGP1am4Iy0vz+NcpBZeJAZCqLQr44r8mnGzDsayV0NYGMwytaSAe7ulE4YdpNKDg0/azFa
 zoEOwtUoTXor8EJp/5lvTGxgmFpujVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-XRHoEHhHNYqfh53k1UYOjg-1; Thu, 14 Jan 2021 17:17:41 -0500
X-MC-Unique: XRHoEHhHNYqfh53k1UYOjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C13B9B8101;
 Thu, 14 Jan 2021 22:17:38 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-115-182.rdu2.redhat.com
 [10.10.115.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 674CE10016FA;
 Thu, 14 Jan 2021 22:17:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/5] drm/i915: Pass port to intel_panel_bl_funcs.get()
Date: Thu, 14 Jan 2021 17:17:05 -0500
Message-Id: <20210114221709.2261452-2-lyude@redhat.com>
In-Reply-To: <20210114221709.2261452-1-lyude@redhat.com>
References: <20210114221709.2261452-1-lyude@redhat.com>
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the next commit where we split PWM related backlight functions from
higher-level backlight functions, we'll want to be able to retrieve the
backlight level for the current display panel from the
intel_panel_bl_funcs->setup() function using pwm_funcs->get(). Since
intel_panel_bl_funcs->setup() is called before we've fully read in the
current hardware state into our atomic state, we can't grab atomic
modesetting locks safely anyway in intel_panel_bl_funcs->setup(), and some
PWM backlight functions (vlv_get_backlight() in particular) require knowing
the currently used pipe we need to be able to discern the current display
pipe through other means. Luckily, we're already passing the current
display pipe to intel_panel_bl_funcs->setup() so all we have to do in order
to achieve this is pass down that parameter to intel_panel_bl_funcs->get().

So, fix this by accepting an additional pipe parameter in
intel_panel_bl_funcs->get(), and leave figuring out the current display
pipe up to the caller.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 +-
 .../drm/i915/display/intel_dp_aux_backlight.c |  4 +-
 .../i915/display/intel_dsi_dcs_backlight.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 40 ++++++++-----------
 4 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 585bb1edea04..b1f4ec144207 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -228,7 +228,7 @@ struct intel_encoder {
 struct intel_panel_bl_funcs {
 	/* Connector and platform specific backlight functions */
 	int (*setup)(struct intel_connector *connector, enum pipe pipe);
-	u32 (*get)(struct intel_connector *connector);
+	u32 (*get)(struct intel_connector *connector, enum pipe pipe);
 	void (*set)(const struct drm_connector_state *conn_state, u32 level);
 	void (*disable)(const struct drm_connector_state *conn_state, u32 level);
 	void (*enable)(const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 9775f33d1aac..de764dae1e66 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -128,7 +128,7 @@ static bool intel_dp_aux_vesa_backlight_dpcd_mode(struct intel_connector *connec
  * Read the current backlight value from DPCD register(s) based
  * on if 8-bit(MSB) or 16-bit(MSB and LSB) values are supported
  */
-static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector)
+static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -381,7 +381,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		return -ENODEV;
 
 	panel->backlight.min = 0;
-	panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector);
+	panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector, pipe);
 	panel->backlight.enabled = intel_dp_aux_vesa_backlight_dpcd_mode(connector) &&
 				   panel->backlight.level != 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index 88628764956d..584c14c4cbd0 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -43,7 +43,7 @@
 
 #define PANEL_PWM_MAX_VALUE		0xFF
 
-static u32 dcs_get_backlight(struct intel_connector *connector)
+static u32 dcs_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct intel_encoder *encoder = intel_attached_encoder(connector);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 7a4239d1c241..7587aaefc7a0 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -530,21 +530,21 @@ static u32 intel_panel_compute_brightness(struct intel_connector *connector,
 	return val;
 }
 
-static u32 lpt_get_backlight(struct intel_connector *connector)
+static u32 lpt_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 
 	return intel_de_read(dev_priv, BLC_PWM_PCH_CTL2) & BACKLIGHT_DUTY_CYCLE_MASK;
 }
 
-static u32 pch_get_backlight(struct intel_connector *connector)
+static u32 pch_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 
 	return intel_de_read(dev_priv, BLC_PWM_CPU_CTL) & BACKLIGHT_DUTY_CYCLE_MASK;
 }
 
-static u32 i9xx_get_backlight(struct intel_connector *connector)
+static u32 i9xx_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
@@ -564,23 +564,17 @@ static u32 i9xx_get_backlight(struct intel_connector *connector)
 	return val;
 }
 
-static u32 _vlv_get_backlight(struct drm_i915_private *dev_priv, enum pipe pipe)
+static u32 vlv_get_backlight(struct intel_connector *connector, enum pipe pipe)
 {
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+
 	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return 0;
 
 	return intel_de_read(dev_priv, VLV_BLC_PWM_CTL(pipe)) & BACKLIGHT_DUTY_CYCLE_MASK;
 }
 
-static u32 vlv_get_backlight(struct intel_connector *connector)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	enum pipe pipe = intel_connector_get_pipe(connector);
-
-	return _vlv_get_backlight(dev_priv, pipe);
-}
-
-static u32 bxt_get_backlight(struct intel_connector *connector)
+static u32 bxt_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
@@ -589,7 +583,7 @@ static u32 bxt_get_backlight(struct intel_connector *connector)
 			     BXT_BLC_PWM_DUTY(panel->backlight.controller));
 }
 
-static u32 ext_pwm_get_backlight(struct intel_connector *connector)
+static u32 ext_pwm_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct intel_panel *panel = &connector->panel;
 	struct pwm_state state;
@@ -1233,7 +1227,7 @@ static u32 intel_panel_get_backlight(struct intel_connector *connector)
 	mutex_lock(&dev_priv->backlight_lock);
 
 	if (panel->backlight.enabled) {
-		val = panel->backlight.funcs->get(connector);
+		val = panel->backlight.funcs->get(connector, intel_connector_get_pipe(connector));
 		val = intel_panel_compute_brightness(connector, val);
 	}
 
@@ -1646,9 +1640,9 @@ static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unus
 		   !(pch_ctl1 & BLM_PCH_OVERRIDE_ENABLE) &&
 		   (cpu_ctl2 & BLM_PWM_ENABLE);
 	if (cpu_mode)
-		val = pch_get_backlight(connector);
+		val = pch_get_backlight(connector, unused);
 	else
-		val = lpt_get_backlight(connector);
+		val = lpt_get_backlight(connector, unused);
 
 	if (cpu_mode) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -1690,7 +1684,7 @@ static int pch_setup_backlight(struct intel_connector *connector, enum pipe unus
 
 	panel->backlight.min = get_backlight_min_vbt(connector);
 
-	val = pch_get_backlight(connector);
+	val = pch_get_backlight(connector, unused);
 	val = intel_panel_compute_brightness(connector, val);
 	panel->backlight.level = clamp(val, panel->backlight.min,
 				       panel->backlight.max);
@@ -1731,7 +1725,7 @@ static int i9xx_setup_backlight(struct intel_connector *connector, enum pipe unu
 
 	panel->backlight.min = get_backlight_min_vbt(connector);
 
-	val = i9xx_get_backlight(connector);
+	val = i9xx_get_backlight(connector, unused);
 	val = intel_panel_compute_brightness(connector, val);
 	panel->backlight.level = clamp(val, panel->backlight.min,
 				       panel->backlight.max);
@@ -1765,7 +1759,7 @@ static int i965_setup_backlight(struct intel_connector *connector, enum pipe unu
 
 	panel->backlight.min = get_backlight_min_vbt(connector);
 
-	val = i9xx_get_backlight(connector);
+	val = i9xx_get_backlight(connector, unused);
 	val = intel_panel_compute_brightness(connector, val);
 	panel->backlight.level = clamp(val, panel->backlight.min,
 				       panel->backlight.max);
@@ -1798,7 +1792,7 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
 
 	panel->backlight.min = get_backlight_min_vbt(connector);
 
-	val = _vlv_get_backlight(dev_priv, pipe);
+	val = vlv_get_backlight(connector, pipe);
 	val = intel_panel_compute_brightness(connector, val);
 	panel->backlight.level = clamp(val, panel->backlight.min,
 				       panel->backlight.max);
@@ -1840,7 +1834,7 @@ bxt_setup_backlight(struct intel_connector *connector, enum pipe unused)
 
 	panel->backlight.min = get_backlight_min_vbt(connector);
 
-	val = bxt_get_backlight(connector);
+	val = bxt_get_backlight(connector, unused);
 	val = intel_panel_compute_brightness(connector, val);
 	panel->backlight.level = clamp(val, panel->backlight.min,
 				       panel->backlight.max);
@@ -1880,7 +1874,7 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
 
 	panel->backlight.min = get_backlight_min_vbt(connector);
 
-	val = bxt_get_backlight(connector);
+	val = bxt_get_backlight(connector, unused);
 	val = intel_panel_compute_brightness(connector, val);
 	panel->backlight.level = clamp(val, panel->backlight.min,
 				       panel->backlight.max);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
