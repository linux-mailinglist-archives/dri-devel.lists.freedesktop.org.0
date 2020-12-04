Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED872CF6D8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73116EC8B;
	Fri,  4 Dec 2020 22:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB4F6EC87
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607121398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/yr57CiMhJxlxyK9sOEojrvjURZwwHKawM1RyGGn4k=;
 b=dt4VlMMjlsaWsjaiDSU1462ls4Pw/C/gQC5PIqO7bjoWOcqtoAlJzSkqinva6+SoJEtOvW
 zdNf0airSiZ5ry217+iAe6VESNcUqcAeQuZoJ79a5QgFtYcu/DGe66qlz6prG9YAvzaHER
 frs7qKbLQwMfVKJYYJbSSIp/zQj0iks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-bd2hi_CiNN2OWHU0vz36Rg-1; Fri, 04 Dec 2020 17:36:33 -0500
X-MC-Unique: bd2hi_CiNN2OWHU0vz36Rg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C524D1005513;
 Fri,  4 Dec 2020 22:36:30 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-159.rdu2.redhat.com
 [10.10.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFAC51349A;
 Fri,  4 Dec 2020 22:36:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm/i915: Pass down brightness values to
 enable/disable backlight callbacks
Date: Fri,  4 Dec 2020 17:35:57 -0500
Message-Id: <20201204223603.249878-4-lyude@redhat.com>
In-Reply-To: <20201204223603.249878-1-lyude@redhat.com>
References: <20201204223603.249878-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Hans de Goede <hdegoede@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of using intel_panel->backlight.level, have the caller provide us
with the current panel backlight value. We'll need this for when we
separate PWM-related backlight callbacks from other means of backlight
control (like DPCD backlight controls), as the caller of each PWM callback
will be responsible for converting the current brightness value to it's
respective PWM level.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/i915/display/intel_display_types.h    |  4 +-
 .../drm/i915/display/intel_dp_aux_backlight.c |  8 +--
 .../i915/display/intel_dsi_dcs_backlight.c    |  7 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 67 +++++++++----------
 4 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 1fa0246b3a82..a70d1bf29aa5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -230,9 +230,9 @@ struct intel_panel_bl_funcs {
 	int (*setup)(struct intel_connector *connector, enum pipe pipe);
 	u32 (*get)(struct intel_connector *connector);
 	void (*set)(const struct drm_connector_state *conn_state, u32 level);
-	void (*disable)(const struct drm_connector_state *conn_state);
+	void (*disable)(const struct drm_connector_state *conn_state, u32 level);
 	void (*enable)(const struct intel_crtc_state *crtc_state,
-		       const struct drm_connector_state *conn_state);
+		       const struct drm_connector_state *conn_state, u32 level);
 	u32 (*hz_to_pwm)(struct intel_connector *connector, u32 hz);
 };
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 4fd536801b14..c76287e9e91e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -174,7 +174,7 @@ static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
 }
 
 static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_state,
-					  const struct drm_connector_state *conn_state)
+					  const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -225,12 +225,12 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 		}
 	}
 
-	intel_dp_aux_set_backlight(conn_state,
-				   connector->panel.backlight.level);
+	intel_dp_aux_set_backlight(conn_state, level);
 	set_aux_backlight_enable(intel_dp, true);
 }
 
-static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state,
+					   u32 level)
 {
 	set_aux_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
 				 false);
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index 5c508d51f526..88628764956d 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -77,7 +77,7 @@ static void dcs_set_backlight(const struct drm_connector_state *conn_state, u32
 	}
 }
 
-static void dcs_disable_backlight(const struct drm_connector_state *conn_state)
+static void dcs_disable_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(to_intel_encoder(conn_state->best_encoder));
 	struct mipi_dsi_device *dsi_device;
@@ -111,10 +111,9 @@ static void dcs_disable_backlight(const struct drm_connector_state *conn_state)
 }
 
 static void dcs_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(to_intel_encoder(conn_state->best_encoder));
-	struct intel_panel *panel = &to_intel_connector(conn_state->connector)->panel;
 	struct mipi_dsi_device *dsi_device;
 	enum port port;
 
@@ -142,7 +141,7 @@ static void dcs_enable_backlight(const struct intel_crtc_state *crtc_state,
 				   &cabc, sizeof(cabc));
 	}
 
-	dcs_set_backlight(conn_state, panel->backlight.level);
+	dcs_set_backlight(conn_state, level);
 }
 
 static int dcs_setup_backlight(struct intel_connector *connector,
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index da8f7c12ae22..67f81ae995c4 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -726,13 +726,13 @@ void intel_panel_set_backlight_acpi(const struct drm_connector_state *conn_state
 	mutex_unlock(&dev_priv->backlight_lock);
 }
 
-static void lpt_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void lpt_disable_backlight(const struct drm_connector_state *old_conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_actually_set_backlight(old_conn_state, level);
 
 	/*
 	 * Although we don't support or enable CPU PWM with LPT/SPT based
@@ -754,13 +754,13 @@ static void lpt_disable_backlight(const struct drm_connector_state *old_conn_sta
 	intel_de_write(dev_priv, BLC_PWM_PCH_CTL1, tmp & ~BLM_PCH_PWM_ENABLE);
 }
 
-static void pch_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void pch_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_actually_set_backlight(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
 	intel_de_write(dev_priv, BLC_PWM_CPU_CTL2, tmp & ~BLM_PWM_ENABLE);
@@ -769,44 +769,44 @@ static void pch_disable_backlight(const struct drm_connector_state *old_conn_sta
 	intel_de_write(dev_priv, BLC_PWM_PCH_CTL1, tmp & ~BLM_PCH_PWM_ENABLE);
 }
 
-static void i9xx_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void i9xx_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_actually_set_backlight(old_conn_state, val);
 }
 
-static void i965_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void i965_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct drm_i915_private *dev_priv = to_i915(old_conn_state->connector->dev);
 	u32 tmp;
 
-	intel_panel_actually_set_backlight(old_conn_state, 0);
+	intel_panel_actually_set_backlight(old_conn_state, val);
 
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
+	intel_panel_actually_set_backlight(old_conn_state, val);
 
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
+	intel_panel_actually_set_backlight(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv,
 			    BXT_BLC_PWM_CTL(panel->backlight.controller));
@@ -820,14 +820,14 @@ static void bxt_disable_backlight(const struct drm_connector_state *old_conn_sta
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
+	intel_panel_actually_set_backlight(old_conn_state, val);
 
 	tmp = intel_de_read(dev_priv,
 			    BXT_BLC_PWM_CTL(panel->backlight.controller));
@@ -835,7 +835,7 @@ static void cnp_disable_backlight(const struct drm_connector_state *old_conn_sta
 		       tmp & ~BXT_BLC_PWM_ENABLE);
 }
 
-static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
@@ -870,13 +870,13 @@ void intel_panel_disable_backlight(const struct drm_connector_state *old_conn_st
 	if (panel->backlight.device)
 		panel->backlight.device->props.power = FB_BLANK_POWERDOWN;
 	panel->backlight.enabled = false;
-	panel->backlight.funcs->disable(old_conn_state);
+	panel->backlight.funcs->disable(old_conn_state, 0);
 
 	mutex_unlock(&dev_priv->backlight_lock);
 }
 
 static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -923,11 +923,11 @@ static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
 		       pch_ctl1 | BLM_PCH_PWM_ENABLE);
 
 	/* This won't stick until the above enable. */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_actually_set_backlight(conn_state, level);
 }
 
 static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -958,7 +958,7 @@ static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_de_write(dev_priv, BLC_PWM_CPU_CTL2, cpu_ctl2 | BLM_PWM_ENABLE);
 
 	/* This won't stick until the above enable. */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_actually_set_backlight(conn_state, level);
 
 	pch_ctl2 = panel->backlight.max << 16;
 	intel_de_write(dev_priv, BLC_PWM_PCH_CTL2, pch_ctl2);
@@ -974,7 +974,7 @@ static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
+				  const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1001,7 +1001,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_de_posting_read(dev_priv, BLC_PWM_CTL);
 
 	/* XXX: combine this into above write? */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_actually_set_backlight(conn_state, level);
 
 	/*
 	 * Needed to enable backlight on some 855gm models. BLC_HIST_CTL is
@@ -1013,7 +1013,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
+				  const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1044,11 +1044,11 @@ static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_de_posting_read(dev_priv, BLC_PWM_CTL2);
 	intel_de_write(dev_priv, BLC_PWM_CTL2, ctl2 | BLM_PWM_ENABLE);
 
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_actually_set_backlight(conn_state, level);
 }
 
 static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1067,7 +1067,7 @@ static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_de_write(dev_priv, VLV_BLC_PWM_CTL(pipe), ctl);
 
 	/* XXX: combine this into above write? */
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_actually_set_backlight(conn_state, level);
 
 	ctl2 = 0;
 	if (panel->backlight.active_low_pwm)
@@ -1079,7 +1079,7 @@ static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1118,7 +1118,7 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
 		       BXT_BLC_PWM_FREQ(panel->backlight.controller),
 		       panel->backlight.max);
 
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_actually_set_backlight(conn_state, level);
 
 	pwm_ctl = 0;
 	if (panel->backlight.active_low_pwm)
@@ -1133,7 +1133,7 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -1154,7 +1154,7 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
 		       BXT_BLC_PWM_FREQ(panel->backlight.controller),
 		       panel->backlight.max);
 
-	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
+	intel_panel_actually_set_backlight(conn_state, level);
 
 	pwm_ctl = 0;
 	if (panel->backlight.active_low_pwm)
@@ -1169,11 +1169,10 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
 }
 
 static void ext_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
-				     const struct drm_connector_state *conn_state)
+				     const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
-	int level = panel->backlight.level;
 
 	level = intel_panel_compute_brightness(connector, level);
 	pwm_set_relative_duty_cycle(&panel->backlight.pwm_state, level, 100);
@@ -1198,7 +1197,7 @@ static void __intel_panel_enable_backlight(const struct intel_crtc_state *crtc_s
 						 panel->backlight.device->props.max_brightness);
 	}
 
-	panel->backlight.funcs->enable(crtc_state, conn_state);
+	panel->backlight.funcs->enable(crtc_state, conn_state, panel->backlight.level);
 	panel->backlight.enabled = true;
 	if (panel->backlight.device)
 		panel->backlight.device->props.power = FB_BLANK_UNBLANK;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
