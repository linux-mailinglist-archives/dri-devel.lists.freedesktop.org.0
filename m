Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594626C5C7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 19:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C096EAA4;
	Wed, 16 Sep 2020 17:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690056EA9C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600276786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0xwIk7lKnCRLrrofuWlymcxdV+GmG+BgGXMdXU+vRY=;
 b=aNOAGGxXSKRUv7WmN2i1o+nh1WYvU/gbenqm+4jzKUhWbCFwB2PfVanDNvhFu1o9J/F4Wc
 WYK6Q0YsU6vGt455DSwfXwPk0gtWtx/NPkajYsWkzXk2qgPsMMe/vJX9PwdDAbTFD/bIAc
 3DDfRvz0b+t3TlS/w/Iz8k1ajgSfA1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-6y3ULLu5M8aUD9CIaU_oMw-1; Wed, 16 Sep 2020 13:19:41 -0400
X-MC-Unique: 6y3ULLu5M8aUD9CIaU_oMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0698256BE2;
 Wed, 16 Sep 2020 17:19:39 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-66.rdu2.redhat.com
 [10.10.120.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1CCD7E46E;
 Wed, 16 Sep 2020 17:19:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 3/8] drm/i915: Keep track of pwm-related backlight hooks
 separately
Date: Wed, 16 Sep 2020 13:18:50 -0400
Message-Id: <20200916171855.129511-4-lyude@redhat.com>
In-Reply-To: <20200916171855.129511-1-lyude@redhat.com>
References: <20200916171855.129511-1-lyude@redhat.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, thaytan@noraisin.net,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, every different type of backlight hook that i915 supports is
pretty straight forward - you have a backlight, probably through PWM
(but maybe DPCD), with a single set of platform-specific hooks that are
used for controlling it.

HDR backlights, in particular VESA and Intel's HDR backlight
implementations, can end up being more complicated. With Intel's
proprietary interface, HDR backlight controls always run through the
DPCD. When the backlight is in SDR backlight mode however, the driver
may need to bypass the TCON and control the backlight directly through
PWM.

So, in order to support this we'll need to split our backlight callbacks
into two groups: a set of high-level backlight control callbacks in
intel_panel, and an additional set of pwm-specific backlight control
callbacks. This also implies a functional changes for how these
callbacks are used:

* We now keep track of two separate backlight level ranges, one for the
  high-level backlight, and one for the pwm backlight range
* We also keep track of backlight enablement and PWM backlight
  enablement separately
* Since the currently set backlight level might not be the same as the
  currently programmed PWM backlight level, we stop setting
  panel->backlight.level with the currently programmed PWM backlight
  level in panel->backlight.pwm_funcs.setup(). Instead, we rely
  on the higher level backlight control functions to retrieve the
  current PWM backlight level (in this case, intel_pwm_get_backlight()).
  Note that there are still a few PWM backlight setup callbacks that
  do actually need to retrieve the current PWM backlight level, although
  we no longer save this value in panel->backlight.level like before.
* panel->backlight.pwm_funcs.enable()/disable() both accept a PWM
  brightness level, unlike their siblings
  panel->backlight.enable()/disable(). This is so we can calculate the
  actual PWM brightness level we want to set on disable/enable in the
  higher level backlight enable()/disable() functions, since this value
  might be scaled from a brightness level that doesn't come from PWM.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../drm/i915/display/intel_display_types.h    |  14 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 436 ++++++++++--------
 2 files changed, 246 insertions(+), 204 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b2d0edacc58c9..52a6543df842a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -221,6 +221,9 @@ struct intel_panel {
 		bool alternate_pwm_increment;	/* lpt+ */
 
 		/* PWM chip */
+		u32 pwm_min;
+		u32 pwm_max;
+		bool pwm_enabled;
 		bool util_pin_active_low;	/* bxt+ */
 		u8 controller;		/* bxt+ only */
 		struct pwm_device *pwm;
@@ -229,6 +232,16 @@ struct intel_panel {
 		/* DPCD backlight */
 		u8 pwmgen_bit_count;
 
+		struct {
+			int (*setup)(struct intel_connector *connector, enum pipe pipe);
+			u32 (*get)(struct intel_connector *connector);
+			void (*set)(const struct drm_connector_state *conn_state, u32 level);
+			void (*disable)(const struct drm_connector_state *conn_state, u32 level);
+			void (*enable)(const struct intel_crtc_state *crtc_state,
+				       const struct drm_connector_state *conn_state, u32 level);
+			u32 (*hz_to_pwm)(struct intel_connector *connector, u32 hz);
+		} pwm_funcs;
+
 		struct backlight_device *device;
 
 		/* Connector and platform specific backlight functions */
@@ -238,7 +251,6 @@ struct intel_panel {
 		void (*disable)(const struct drm_connector_state *conn_state);
 		void (*enable)(const struct intel_crtc_state *crtc_state,
 			       const struct drm_connector_state *conn_state);
-		u32 (*hz_to_pwm)(struct intel_connector *connector, u32 hz);
 		void (*power)(struct intel_connector *, bool enable);
 	} backlight;
 };
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index c0e36244bb07d..6d3e9d51d069c 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -511,25 +511,34 @@ static u32 scale_hw_to_user(struct intel_connector *connector,
 		     0, user_max);
 }
 
-static u32 intel_panel_compute_brightness(struct intel_connector *connector,
-					  u32 val)
+static u32 intel_panel_sanitize_pwm_level(struct intel_connector *connector, u32 val)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
 
-	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.pwm_max == 0);
 
 	if (dev_priv->params.invert_brightness < 0)
 		return val;
 
 	if (dev_priv->params.invert_brightness > 0 ||
 	    dev_priv->quirks & QUIRK_INVERT_BRIGHTNESS) {
-		return panel->backlight.max - val + panel->backlight.min;
+		return panel->backlight.pwm_max - val + panel->backlight.pwm_min;
 	}
 
 	return val;
 }
 
+static void intel_panel_set_pwm_level(const struct drm_connector_state *conn_state, u32 val)
+{
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct intel_panel *panel = &connector->panel;
+
+	drm_dbg_kms(&i915->drm, "set backlight PWM = %d\n", val);
+	panel->backlight.pwm_funcs.set(conn_state, val);
+}
+
 static u32 lpt_get_backlight(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -624,12 +633,12 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 	struct intel_panel *panel = &connector->panel;
 	u32 tmp, mask;
 
-	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.pwm_max == 0);
 
 	if (panel->backlight.combination_mode) {
 		u8 lbpc;
 
-		lbpc = level * 0xfe / panel->backlight.max + 1;
+		lbpc = level * 0xfe / panel->backlight.pwm_max + 1;
 		level /= lbpc;
 		pci_write_config_byte(dev_priv->drm.pdev, LBPC, lbpc);
 	}
@@ -681,9 +690,8 @@ intel_panel_actually_set_backlight(const struct drm_connector_state *conn_state,
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
 
-	drm_dbg_kms(&i915->drm, "set backlight PWM = %d\n", level);
+	drm_dbg_kms(&i915->drm, "set backlight level = %d\n", level);
 
-	level = intel_panel_compute_brightness(connector, level);
 	panel->backlight.set(conn_state, level);
 }
 
@@ -726,13 +734,13 @@ void intel_panel_set_backlight_acpi(const struct drm_connector_state *conn_state
 	mutex_unlock(&dev_priv->backlight_lock);
 }
 
-static void lpt_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void lpt_disable_backlight(const struct drm_connector_state *old_conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_set_pwm_level(old_conn_state, level);
 
 	/*
 	 * Although we don't support or enable CPU PWM with LPT/SPT based
@@ -754,13 +762,13 @@ static void lpt_disable_backlight(const struct drm_connector_state *old_conn_sta
 	intel_de_write(dev_priv, BLC_PWM_PCH_CTL1, tmp & ~BLM_PCH_PWM_ENABLE);
 }
 
-static void pch_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void pch_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_set_pwm_level(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
 	intel_de_write(dev_priv, BLC_PWM_CPU_CTL2, tmp & ~BLM_PWM_ENABLE);
@@ -769,44 +777,44 @@ static void pch_disable_backlight(const struct drm_connector_state *old_conn_sta
 	intel_de_write(dev_priv, BLC_PWM_PCH_CTL1, tmp & ~BLM_PCH_PWM_ENABLE);
 }
 
-static void i9xx_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void i9xx_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_set_pwm_level(old_conn_state, val);
 }
 
-static void i965_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void i965_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct drm_i915_private *dev_priv = to_i915(old_conn_state->connector->dev);
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_set_pwm_level(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv, BLC_PWM_CTL2);
 	intel_de_write(dev_priv, BLC_PWM_CTL2, tmp & ~BLM_PWM_ENABLE);
 }
 
-static void vlv_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void vlv_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	enum pipe pipe = to_intel_crtc(old_conn_state->crtc)->pipe;
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_set_pwm_level(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv, VLV_BLC_PWM_CTL2(pipe));
 	intel_de_write(dev_priv, VLV_BLC_PWM_CTL2(pipe),
 		       tmp & ~BLM_PWM_ENABLE);
 }
 
-static void bxt_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void bxt_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
-	u32 tmp, val;
+	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_set_pwm_level(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv,
 			    BXT_BLC_PWM_CTL(panel->backlight.controller));
@@ -820,14 +828,14 @@ static void bxt_disable_backlight(const struct drm_connector_state *old_conn_sta
 	}
 }
 
-static void cnp_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void cnp_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_set_pwm_level(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv,
 			    BXT_BLC_PWM_CTL(panel->backlight.controller));
@@ -835,7 +843,7 @@ static void cnp_disable_backlight(const struct drm_connector_state *old_conn_sta
 		       tmp & ~BXT_BLC_PWM_ENABLE);
 }
 
-static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
@@ -876,7 +884,7 @@ void intel_panel_disable_backlight(const struct drm_connector_state *old_conn_st
 }
 
 static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -906,7 +914,7 @@ static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
 		intel_de_write(dev_priv, SOUTH_CHICKEN1, schicken);
 	}
 
-	pch_ctl2 = panel->backlight.max << 16;
+	pch_ctl2 = panel->backlight.pwm_max << 16;
 	intel_de_write(dev_priv, BLC_PWM_PCH_CTL2, pch_ctl2);
 
 	pch_ctl1 = 0;
@@ -923,11 +931,11 @@ static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
 		       pch_ctl1 | BLM_PCH_PWM_ENABLE);
 
 	/* This won't stick until the above enable. */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_set_pwm_level(conn_state, level);
 }
 
 static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -958,9 +966,9 @@ static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_de_write(dev_priv, BLC_PWM_CPU_CTL2, cpu_ctl2 | BLM_PWM_ENABLE);
 
 	/* This won't stick until the above enable. */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_set_pwm_level(conn_state, level);
 
-	pch_ctl2 = panel->backlight.max << 16;
+	pch_ctl2 = panel->backlight.pwm_max << 16;
 	intel_de_write(dev_priv, BLC_PWM_PCH_CTL2, pch_ctl2);
 
 	pch_ctl1 = 0;
@@ -974,7 +982,7 @@ static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
+				  const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -987,7 +995,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
 		intel_de_write(dev_priv, BLC_PWM_CTL, 0);
 	}
 
-	freq = panel->backlight.max;
+	freq = panel->backlight.pwm_max;
 	if (panel->backlight.combination_mode)
 		freq /= 0xff;
 
@@ -1001,7 +1009,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_de_posting_read(dev_priv, BLC_PWM_CTL);
 
 	/* XXX: combine this into above write? */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_set_pwm_level(conn_state, level);
 
 	/*
 	 * Needed to enable backlight on some 855gm models. BLC_HIST_CTL is
@@ -1013,7 +1021,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
+				  const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1028,7 +1036,7 @@ static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
 		intel_de_write(dev_priv, BLC_PWM_CTL2, ctl2);
 	}
 
-	freq = panel->backlight.max;
+	freq = panel->backlight.pwm_max;
 	if (panel->backlight.combination_mode)
 		freq /= 0xff;
 
@@ -1044,11 +1052,11 @@ static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_de_posting_read(dev_priv, BLC_PWM_CTL2);
 	intel_de_write(dev_priv, BLC_PWM_CTL2, ctl2 | BLM_PWM_ENABLE);
 
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_set_pwm_level(conn_state, level);
 }
 
 static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1063,11 +1071,11 @@ static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
 		intel_de_write(dev_priv, VLV_BLC_PWM_CTL2(pipe), ctl2);
 	}
 
-	ctl = panel->backlight.max << 16;
+	ctl = panel->backlight.pwm_max << 16;
 	intel_de_write(dev_priv, VLV_BLC_PWM_CTL(pipe), ctl);
 
 	/* XXX: combine this into above write? */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_set_pwm_level(conn_state, level);
 
 	ctl2 = 0;
 	if (panel->backlight.active_low_pwm)
@@ -1079,7 +1087,7 @@ static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1116,9 +1124,9 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	intel_de_write(dev_priv,
 		       BXT_BLC_PWM_FREQ(panel->backlight.controller),
-		       panel->backlight.max);
+		       panel->backlight.pwm_max);
 
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_set_pwm_level(conn_state, level);
 
 	pwm_ctl = 0;
 	if (panel->backlight.active_low_pwm)
@@ -1133,7 +1141,7 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1152,9 +1160,9 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	intel_de_write(dev_priv,
 		       BXT_BLC_PWM_FREQ(panel->backlight.controller),
-		       panel->backlight.max);
+		       panel->backlight.pwm_max);
 
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_set_pwm_level(conn_state, level);
 
 	pwm_ctl = 0;
 	if (panel->backlight.active_low_pwm)
@@ -1169,13 +1177,11 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void ext_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
-				     const struct drm_connector_state *conn_state)
+				     const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
-	int level = panel->backlight.level;
 
-	level = intel_panel_compute_brightness(connector, level);
 	pwm_set_relative_duty_cycle(&panel->backlight.pwm_state, level, 100);
 	panel->backlight.pwm_state.enabled = true;
 	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
@@ -1233,10 +1239,8 @@ static u32 intel_panel_get_backlight(struct intel_connector *connector)
 
 	mutex_lock(&dev_priv->backlight_lock);
 
-	if (panel->backlight.enabled) {
+	if (panel->backlight.enabled)
 		val = panel->backlight.get(connector);
-		val = intel_panel_compute_brightness(connector, val);
-	}
 
 	mutex_unlock(&dev_priv->backlight_lock);
 
@@ -1567,13 +1571,13 @@ static u32 get_backlight_max_vbt(struct intel_connector *connector)
 	u16 pwm_freq_hz = get_vbt_pwm_freq(dev_priv);
 	u32 pwm;
 
-	if (!panel->backlight.hz_to_pwm) {
+	if (!panel->backlight.pwm_funcs.hz_to_pwm) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "backlight frequency conversion not supported\n");
 		return 0;
 	}
 
-	pwm = panel->backlight.hz_to_pwm(connector, pwm_freq_hz);
+	pwm = panel->backlight.pwm_funcs.hz_to_pwm(connector, pwm_freq_hz);
 	if (!pwm) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "backlight frequency conversion failed\n");
@@ -1592,7 +1596,7 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
 	struct intel_panel *panel = &connector->panel;
 	int min;
 
-	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.pwm_max == 0);
 
 	/*
 	 * XXX: If the vbt value is 255, it makes min equal to max, which leads
@@ -1609,7 +1613,7 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
 	}
 
 	/* vbt value is a coefficient in range [0..255] */
-	return scale(min, 0, 255, 0, panel->backlight.max);
+	return scale(min, 0, 255, 0, panel->backlight.pwm_max);
 }
 
 static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unused)
@@ -1629,37 +1633,32 @@ static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unus
 	panel->backlight.active_low_pwm = pch_ctl1 & BLM_PCH_POLARITY;
 
 	pch_ctl2 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL2);
-	panel->backlight.max = pch_ctl2 >> 16;
+	panel->backlight.pwm_max = pch_ctl2 >> 16;
 
 	cpu_ctl2 = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
 
-	if (!panel->backlight.max)
-		panel->backlight.max = get_backlight_max_vbt(connector);
+	if (!panel->backlight.pwm_max)
+		panel->backlight.pwm_max = get_backlight_max_vbt(connector);
 
-	if (!panel->backlight.max)
+	if (!panel->backlight.pwm_max)
 		return -ENODEV;
 
-	panel->backlight.min = get_backlight_min_vbt(connector);
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
-	panel->backlight.enabled = pch_ctl1 & BLM_PCH_PWM_ENABLE;
+	panel->backlight.pwm_enabled = pch_ctl1 & BLM_PCH_PWM_ENABLE;
 
-	cpu_mode = panel->backlight.enabled && HAS_PCH_LPT(dev_priv) &&
+	cpu_mode = panel->backlight.pwm_enabled && HAS_PCH_LPT(dev_priv) &&
 		   !(pch_ctl1 & BLM_PCH_OVERRIDE_ENABLE) &&
 		   (cpu_ctl2 & BLM_PWM_ENABLE);
-	if (cpu_mode)
-		val = pch_get_backlight(connector);
-	else
-		val = lpt_get_backlight(connector);
-	val = intel_panel_compute_brightness(connector, val);
-	panel->backlight.level = clamp(val, panel->backlight.min,
-				       panel->backlight.max);
 
 	if (cpu_mode) {
+		val = intel_panel_sanitize_pwm_level(connector, pch_get_backlight(connector));
+
 		drm_dbg_kms(&dev_priv->drm,
 			    "CPU backlight register was enabled, switching to PCH override\n");
 
 		/* Write converted CPU PWM value to PCH override register */
-		lpt_set_backlight(connector->base.state, panel->backlight.level);
+		lpt_set_backlight(connector->base.state, val);
 		intel_de_write(dev_priv, BLC_PWM_PCH_CTL1,
 			       pch_ctl1 | BLM_PCH_OVERRIDE_ENABLE);
 
@@ -1674,29 +1673,24 @@ static int pch_setup_backlight(struct intel_connector *connector, enum pipe unus
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
-	u32 cpu_ctl2, pch_ctl1, pch_ctl2, val;
+	u32 cpu_ctl2, pch_ctl1, pch_ctl2;
 
 	pch_ctl1 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL1);
 	panel->backlight.active_low_pwm = pch_ctl1 & BLM_PCH_POLARITY;
 
 	pch_ctl2 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL2);
-	panel->backlight.max = pch_ctl2 >> 16;
+	panel->backlight.pwm_max = pch_ctl2 >> 16;
 
-	if (!panel->backlight.max)
-		panel->backlight.max = get_backlight_max_vbt(connector);
+	if (!panel->backlight.pwm_max)
+		panel->backlight.pwm_max = get_backlight_max_vbt(connector);
 
-	if (!panel->backlight.max)
+	if (!panel->backlight.pwm_max)
 		return -ENODEV;
 
-	panel->backlight.min = get_backlight_min_vbt(connector);
-
-	val = pch_get_backlight(connector);
-	val = intel_panel_compute_brightness(connector, val);
-	panel->backlight.level = clamp(val, panel->backlight.min,
-				       panel->backlight.max);
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
 	cpu_ctl2 = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
-	panel->backlight.enabled = (cpu_ctl2 & BLM_PWM_ENABLE) &&
+	panel->backlight.pwm_enabled = (cpu_ctl2 & BLM_PWM_ENABLE) &&
 		(pch_ctl1 & BLM_PCH_PWM_ENABLE);
 
 	return 0;
@@ -1716,27 +1710,26 @@ static int i9xx_setup_backlight(struct intel_connector *connector, enum pipe unu
 	if (IS_PINEVIEW(dev_priv))
 		panel->backlight.active_low_pwm = ctl & BLM_POLARITY_PNV;
 
-	panel->backlight.max = ctl >> 17;
+	panel->backlight.pwm_max = ctl >> 17;
 
-	if (!panel->backlight.max) {
-		panel->backlight.max = get_backlight_max_vbt(connector);
-		panel->backlight.max >>= 1;
+	if (!panel->backlight.pwm_max) {
+		panel->backlight.pwm_max = get_backlight_max_vbt(connector);
+		panel->backlight.pwm_max >>= 1;
 	}
 
-	if (!panel->backlight.max)
+	if (!panel->backlight.pwm_max)
 		return -ENODEV;
 
 	if (panel->backlight.combination_mode)
-		panel->backlight.max *= 0xff;
+		panel->backlight.pwm_max *= 0xff;
 
-	panel->backlight.min = get_backlight_min_vbt(connector);
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
 	val = i9xx_get_backlight(connector);
-	val = intel_panel_compute_brightness(connector, val);
-	panel->backlight.level = clamp(val, panel->backlight.min,
-				       panel->backlight.max);
+	val = intel_panel_sanitize_pwm_level(connector, val);
+	val = clamp(val, panel->backlight.pwm_min, panel->backlight.pwm_max);
 
-	panel->backlight.enabled = val != 0;
+	panel->backlight.pwm_enabled = val != 0;
 
 	return 0;
 }
@@ -1745,32 +1738,27 @@ static int i965_setup_backlight(struct intel_connector *connector, enum pipe unu
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
-	u32 ctl, ctl2, val;
+	u32 ctl, ctl2;
 
 	ctl2 = intel_de_read(dev_priv, BLC_PWM_CTL2);
 	panel->backlight.combination_mode = ctl2 & BLM_COMBINATION_MODE;
 	panel->backlight.active_low_pwm = ctl2 & BLM_POLARITY_I965;
 
 	ctl = intel_de_read(dev_priv, BLC_PWM_CTL);
-	panel->backlight.max = ctl >> 16;
+	panel->backlight.pwm_max = ctl >> 16;
 
-	if (!panel->backlight.max)
-		panel->backlight.max = get_backlight_max_vbt(connector);
+	if (!panel->backlight.pwm_max)
+		panel->backlight.pwm_max = get_backlight_max_vbt(connector);
 
-	if (!panel->backlight.max)
+	if (!panel->backlight.pwm_max)
 		return -ENODEV;
 
 	if (panel->backlight.combination_mode)
-		panel->backlight.max *= 0xff;
+		panel->backlight.pwm_max *= 0xff;
 
-	panel->backlight.min = get_backlight_min_vbt(connector);
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
-	val = i9xx_get_backlight(connector);
-	val = intel_panel_compute_brightness(connector, val);
-	panel->backlight.level = clamp(val, panel->backlight.min,
-				       panel->backlight.max);
-
-	panel->backlight.enabled = ctl2 & BLM_PWM_ENABLE;
+	panel->backlight.pwm_enabled = ctl2 & BLM_PWM_ENABLE;
 
 	return 0;
 }
@@ -1779,7 +1767,7 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
-	u32 ctl, ctl2, val;
+	u32 ctl, ctl2;
 
 	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return -ENODEV;
@@ -1788,22 +1776,17 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
 	panel->backlight.active_low_pwm = ctl2 & BLM_POLARITY_I965;
 
 	ctl = intel_de_read(dev_priv, VLV_BLC_PWM_CTL(pipe));
-	panel->backlight.max = ctl >> 16;
+	panel->backlight.pwm_max = ctl >> 16;
 
-	if (!panel->backlight.max)
-		panel->backlight.max = get_backlight_max_vbt(connector);
+	if (!panel->backlight.pwm_max)
+		panel->backlight.pwm_max = get_backlight_max_vbt(connector);
 
-	if (!panel->backlight.max)
+	if (!panel->backlight.pwm_max)
 		return -ENODEV;
 
-	panel->backlight.min = get_backlight_min_vbt(connector);
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
-	val = _vlv_get_backlight(dev_priv, pipe);
-	val = intel_panel_compute_brightness(connector, val);
-	panel->backlight.level = clamp(val, panel->backlight.min,
-				       panel->backlight.max);
-
-	panel->backlight.enabled = ctl2 & BLM_PWM_ENABLE;
+	panel->backlight.pwm_enabled = ctl2 & BLM_PWM_ENABLE;
 
 	return 0;
 }
@@ -1828,24 +1811,18 @@ bxt_setup_backlight(struct intel_connector *connector, enum pipe unused)
 	}
 
 	panel->backlight.active_low_pwm = pwm_ctl & BXT_BLC_PWM_POLARITY;
-	panel->backlight.max =
-		intel_de_read(dev_priv,
-			      BXT_BLC_PWM_FREQ(panel->backlight.controller));
+	panel->backlight.pwm_max = intel_de_read(dev_priv,
+						 BXT_BLC_PWM_FREQ(panel->backlight.controller));
 
-	if (!panel->backlight.max)
-		panel->backlight.max = get_backlight_max_vbt(connector);
+	if (!panel->backlight.pwm_max)
+		panel->backlight.pwm_max = get_backlight_max_vbt(connector);
 
-	if (!panel->backlight.max)
+	if (!panel->backlight.pwm_max)
 		return -ENODEV;
 
-	panel->backlight.min = get_backlight_min_vbt(connector);
-
-	val = bxt_get_backlight(connector);
-	val = intel_panel_compute_brightness(connector, val);
-	panel->backlight.level = clamp(val, panel->backlight.min,
-				       panel->backlight.max);
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
-	panel->backlight.enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
+	panel->backlight.pwm_enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
 
 	return 0;
 }
@@ -1855,7 +1832,7 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
-	u32 pwm_ctl, val;
+	u32 pwm_ctl;
 
 	/*
 	 * CNP has the BXT implementation of backlight, but with only one
@@ -1868,24 +1845,18 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
 				BXT_BLC_PWM_CTL(panel->backlight.controller));
 
 	panel->backlight.active_low_pwm = pwm_ctl & BXT_BLC_PWM_POLARITY;
-	panel->backlight.max =
-		intel_de_read(dev_priv,
-			      BXT_BLC_PWM_FREQ(panel->backlight.controller));
+	panel->backlight.pwm_max = intel_de_read(dev_priv,
+						 BXT_BLC_PWM_FREQ(panel->backlight.controller));
 
-	if (!panel->backlight.max)
-		panel->backlight.max = get_backlight_max_vbt(connector);
+	if (!panel->backlight.pwm_max)
+		panel->backlight.pwm_max = get_backlight_max_vbt(connector);
 
-	if (!panel->backlight.max)
+	if (!panel->backlight.pwm_max)
 		return -ENODEV;
 
-	panel->backlight.min = get_backlight_min_vbt(connector);
-
-	val = bxt_get_backlight(connector);
-	val = intel_panel_compute_brightness(connector, val);
-	panel->backlight.level = clamp(val, panel->backlight.min,
-				       panel->backlight.max);
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
-	panel->backlight.enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
+	panel->backlight.pwm_enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
 
 	return 0;
 }
@@ -1915,8 +1886,8 @@ static int ext_pwm_setup_backlight(struct intel_connector *connector,
 		return -ENODEV;
 	}
 
-	panel->backlight.max = 100; /* 100% */
-	panel->backlight.min = get_backlight_min_vbt(connector);
+	panel->backlight.pwm_max = 100; /* 100% */
+	panel->backlight.pwm_min = get_backlight_min_vbt(connector);
 
 	if (pwm_is_enabled(panel->backlight.pwm)) {
 		/* PWM is already enabled, use existing settings */
@@ -1924,10 +1895,8 @@ static int ext_pwm_setup_backlight(struct intel_connector *connector,
 
 		level = pwm_get_relative_duty_cycle(&panel->backlight.pwm_state,
 						    100);
-		level = intel_panel_compute_brightness(connector, level);
-		panel->backlight.level = clamp(level, panel->backlight.min,
-					       panel->backlight.max);
-		panel->backlight.enabled = true;
+		level = intel_panel_sanitize_pwm_level(connector, level);
+		panel->backlight.pwm_enabled = true;
 
 		drm_dbg_kms(&dev_priv->drm, "PWM already enabled at freq %ld, VBT freq %d, level %d\n",
 			    NSEC_PER_SEC / (unsigned long)panel->backlight.pwm_state.period,
@@ -1943,6 +1912,60 @@ static int ext_pwm_setup_backlight(struct intel_connector *connector,
 	return 0;
 }
 
+static void intel_pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
+{
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	struct intel_panel *panel = &connector->panel;
+
+	panel->backlight.pwm_funcs.set(conn_state,
+				       intel_panel_sanitize_pwm_level(connector, level));
+}
+
+static u32 intel_pwm_get_backlight(struct intel_connector *connector)
+{
+	struct intel_panel *panel = &connector->panel;
+
+	return intel_panel_sanitize_pwm_level(connector, panel->backlight.pwm_funcs.get(connector));
+}
+
+static void intel_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
+				       const struct drm_connector_state *conn_state)
+{
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	struct intel_panel *panel = &connector->panel;
+	u32 level = intel_panel_sanitize_pwm_level(connector, panel->backlight.level);
+
+	panel->backlight.pwm_funcs.enable(crtc_state, conn_state, level);
+}
+
+static void intel_pwm_disable_backlight(const struct drm_connector_state *conn_state)
+{
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	struct intel_panel *panel = &connector->panel;
+
+	panel->backlight.pwm_funcs.disable(conn_state,
+					   intel_panel_sanitize_pwm_level(connector, 0));
+}
+
+/* The only hook PWM-only backlight setups need to override, the rest of the hooks are filled in
+ * from pwm_funcs
+ */
+static int intel_pwm_setup_backlight(struct intel_connector *connector, enum pipe pipe)
+{
+	struct intel_panel *panel = &connector->panel;
+	int ret = panel->backlight.pwm_funcs.setup(connector, pipe);
+
+	if (ret < 0)
+		return ret;
+
+	panel->backlight.min = panel->backlight.pwm_min;
+	panel->backlight.max = panel->backlight.pwm_max;
+	panel->backlight.level = panel->backlight.get(connector);
+	panel->backlight.enabled = panel->backlight.pwm_enabled;
+
+	return 0;
+}
+
 void intel_panel_update_backlight(struct intel_atomic_state *state,
 				  struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state,
@@ -2024,75 +2047,82 @@ intel_panel_init_backlight_funcs(struct intel_panel *panel)
 		container_of(panel, struct intel_connector, panel);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 
-	if (connector->base.connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    intel_dp_aux_init_backlight_funcs(connector) == 0)
-		return;
-
 	if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI &&
 	    intel_dsi_dcs_init_backlight_funcs(connector) == 0)
 		return;
 
 	if (IS_GEN9_LP(dev_priv)) {
-		panel->backlight.setup = bxt_setup_backlight;
-		panel->backlight.enable = bxt_enable_backlight;
-		panel->backlight.disable = bxt_disable_backlight;
-		panel->backlight.set = bxt_set_backlight;
-		panel->backlight.get = bxt_get_backlight;
-		panel->backlight.hz_to_pwm = bxt_hz_to_pwm;
+		panel->backlight.pwm_funcs.setup = bxt_setup_backlight;
+		panel->backlight.pwm_funcs.enable = bxt_enable_backlight;
+		panel->backlight.pwm_funcs.disable = bxt_disable_backlight;
+		panel->backlight.pwm_funcs.set = bxt_set_backlight;
+		panel->backlight.pwm_funcs.get = bxt_get_backlight;
+		panel->backlight.pwm_funcs.hz_to_pwm = bxt_hz_to_pwm;
 	} else if (INTEL_PCH_TYPE(dev_priv) >= PCH_CNP) {
-		panel->backlight.setup = cnp_setup_backlight;
-		panel->backlight.enable = cnp_enable_backlight;
-		panel->backlight.disable = cnp_disable_backlight;
-		panel->backlight.set = bxt_set_backlight;
-		panel->backlight.get = bxt_get_backlight;
-		panel->backlight.hz_to_pwm = cnp_hz_to_pwm;
+		panel->backlight.pwm_funcs.setup = cnp_setup_backlight;
+		panel->backlight.pwm_funcs.enable = cnp_enable_backlight;
+		panel->backlight.pwm_funcs.disable = cnp_disable_backlight;
+		panel->backlight.pwm_funcs.set = bxt_set_backlight;
+		panel->backlight.pwm_funcs.get = bxt_get_backlight;
+		panel->backlight.pwm_funcs.hz_to_pwm = cnp_hz_to_pwm;
 	} else if (INTEL_PCH_TYPE(dev_priv) >= PCH_LPT) {
-		panel->backlight.setup = lpt_setup_backlight;
-		panel->backlight.enable = lpt_enable_backlight;
-		panel->backlight.disable = lpt_disable_backlight;
-		panel->backlight.set = lpt_set_backlight;
-		panel->backlight.get = lpt_get_backlight;
+		panel->backlight.pwm_funcs.setup = lpt_setup_backlight;
+		panel->backlight.pwm_funcs.enable = lpt_enable_backlight;
+		panel->backlight.pwm_funcs.disable = lpt_disable_backlight;
+		panel->backlight.pwm_funcs.set = lpt_set_backlight;
+		panel->backlight.pwm_funcs.get = lpt_get_backlight;
 		if (HAS_PCH_LPT(dev_priv))
-			panel->backlight.hz_to_pwm = lpt_hz_to_pwm;
+			panel->backlight.pwm_funcs.hz_to_pwm = lpt_hz_to_pwm;
 		else
-			panel->backlight.hz_to_pwm = spt_hz_to_pwm;
+			panel->backlight.pwm_funcs.hz_to_pwm = spt_hz_to_pwm;
 	} else if (HAS_PCH_SPLIT(dev_priv)) {
-		panel->backlight.setup = pch_setup_backlight;
-		panel->backlight.enable = pch_enable_backlight;
-		panel->backlight.disable = pch_disable_backlight;
-		panel->backlight.set = pch_set_backlight;
-		panel->backlight.get = pch_get_backlight;
-		panel->backlight.hz_to_pwm = pch_hz_to_pwm;
+		panel->backlight.pwm_funcs.setup = pch_setup_backlight;
+		panel->backlight.pwm_funcs.enable = pch_enable_backlight;
+		panel->backlight.pwm_funcs.disable = pch_disable_backlight;
+		panel->backlight.pwm_funcs.set = pch_set_backlight;
+		panel->backlight.pwm_funcs.get = pch_get_backlight;
+		panel->backlight.pwm_funcs.hz_to_pwm = pch_hz_to_pwm;
 	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
 		if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI) {
-			panel->backlight.setup = ext_pwm_setup_backlight;
-			panel->backlight.enable = ext_pwm_enable_backlight;
-			panel->backlight.disable = ext_pwm_disable_backlight;
-			panel->backlight.set = ext_pwm_set_backlight;
-			panel->backlight.get = ext_pwm_get_backlight;
+			panel->backlight.pwm_funcs.setup = ext_pwm_setup_backlight;
+			panel->backlight.pwm_funcs.enable = ext_pwm_enable_backlight;
+			panel->backlight.pwm_funcs.disable = ext_pwm_disable_backlight;
+			panel->backlight.pwm_funcs.set = ext_pwm_set_backlight;
+			panel->backlight.pwm_funcs.get = ext_pwm_get_backlight;
 		} else {
-			panel->backlight.setup = vlv_setup_backlight;
-			panel->backlight.enable = vlv_enable_backlight;
-			panel->backlight.disable = vlv_disable_backlight;
-			panel->backlight.set = vlv_set_backlight;
-			panel->backlight.get = vlv_get_backlight;
-			panel->backlight.hz_to_pwm = vlv_hz_to_pwm;
+			panel->backlight.pwm_funcs.setup = vlv_setup_backlight;
+			panel->backlight.pwm_funcs.enable = vlv_enable_backlight;
+			panel->backlight.pwm_funcs.disable = vlv_disable_backlight;
+			panel->backlight.pwm_funcs.set = vlv_set_backlight;
+			panel->backlight.pwm_funcs.get = vlv_get_backlight;
+			panel->backlight.pwm_funcs.hz_to_pwm = vlv_hz_to_pwm;
 		}
 	} else if (IS_GEN(dev_priv, 4)) {
-		panel->backlight.setup = i965_setup_backlight;
-		panel->backlight.enable = i965_enable_backlight;
-		panel->backlight.disable = i965_disable_backlight;
-		panel->backlight.set = i9xx_set_backlight;
-		panel->backlight.get = i9xx_get_backlight;
-		panel->backlight.hz_to_pwm = i965_hz_to_pwm;
+		panel->backlight.pwm_funcs.setup = i965_setup_backlight;
+		panel->backlight.pwm_funcs.enable = i965_enable_backlight;
+		panel->backlight.pwm_funcs.disable = i965_disable_backlight;
+		panel->backlight.pwm_funcs.set = i9xx_set_backlight;
+		panel->backlight.pwm_funcs.get = i9xx_get_backlight;
+		panel->backlight.pwm_funcs.hz_to_pwm = i965_hz_to_pwm;
 	} else {
-		panel->backlight.setup = i9xx_setup_backlight;
-		panel->backlight.enable = i9xx_enable_backlight;
-		panel->backlight.disable = i9xx_disable_backlight;
-		panel->backlight.set = i9xx_set_backlight;
-		panel->backlight.get = i9xx_get_backlight;
-		panel->backlight.hz_to_pwm = i9xx_hz_to_pwm;
+		panel->backlight.pwm_funcs.setup = i9xx_setup_backlight;
+		panel->backlight.pwm_funcs.enable = i9xx_enable_backlight;
+		panel->backlight.pwm_funcs.disable = i9xx_disable_backlight;
+		panel->backlight.pwm_funcs.set = i9xx_set_backlight;
+		panel->backlight.pwm_funcs.get = i9xx_get_backlight;
+		panel->backlight.pwm_funcs.hz_to_pwm = i9xx_hz_to_pwm;
 	}
+
+	if (connector->base.connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    intel_dp_aux_init_backlight_funcs(connector) == 0)
+		return;
+
+	/* We're using a standard PWM backlight interface */
+	panel->backlight.setup = intel_pwm_setup_backlight;
+	panel->backlight.enable = intel_pwm_enable_backlight;
+	panel->backlight.disable = intel_pwm_disable_backlight;
+	panel->backlight.set = intel_pwm_set_backlight;
+	panel->backlight.get = intel_pwm_get_backlight;
 }
 
 enum drm_connector_status
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
