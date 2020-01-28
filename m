Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141A14BFC9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 19:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C936F377;
	Tue, 28 Jan 2020 18:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821CF6F371;
 Tue, 28 Jan 2020 18:29:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310821894"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:29:02 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [Intel-gfx] [PATCH v5 15/21] drm/i915/display/panel: Make WARN* drm
 specific where drm_priv ptr is available
Date: Tue, 28 Jan 2020 23:45:57 +0530
Message-Id: <20200128181603.27767-16-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index c03afcef85ae..7b035f44fce7 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -423,7 +423,8 @@ void intel_gmch_panel_fitting(struct intel_crtc *intel_crtc,
 		}
 		break;
 	default:
-		WARN(1, "bad panel fit mode: %d\n", fitting_mode);
+		drm_WARN(&dev_priv->drm, 1, "bad panel fit mode: %d\n",
+			 fitting_mode);
 		return;
 	}
 
@@ -520,7 +521,7 @@ static u32 intel_panel_compute_brightness(struct intel_connector *connector,
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	if (i915_modparams.invert_brightness < 0)
 		return val;
@@ -569,7 +570,7 @@ static u32 i9xx_get_backlight(struct intel_connector *connector)
 
 static u32 _vlv_get_backlight(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return 0;
 
 	return intel_de_read(dev_priv, VLV_BLC_PWM_CTL(pipe)) & BACKLIGHT_DUTY_CYCLE_MASK;
@@ -627,7 +628,7 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 	struct intel_panel *panel = &connector->panel;
 	u32 tmp, mask;
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	if (panel->backlight.combination_mode) {
 		u8 lbpc;
@@ -711,7 +712,7 @@ void intel_panel_set_backlight_acpi(const struct drm_connector_state *conn_state
 
 	mutex_lock(&dev_priv->backlight_lock);
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	hw_level = clamp_user_to_hw(connector, user_level, user_max);
 	panel->backlight.level = hw_level;
@@ -1256,7 +1257,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
 
 	mutex_lock(&dev_priv->backlight_lock);
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	hw_level = scale_user_to_hw(connector, user_level, user_max);
 	panel->backlight.level = hw_level;
@@ -1565,7 +1566,7 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
 	struct intel_panel *panel = &connector->panel;
 	int min;
 
-	WARN_ON(panel->backlight.max == 0);
+	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
 
 	/*
 	 * XXX: If the vbt value is 255, it makes min equal to max, which leads
@@ -1752,7 +1753,7 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
 	struct intel_panel *panel = &connector->panel;
 	u32 ctl, ctl2, val;
 
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return -ENODEV;
 
 	ctl2 = intel_de_read(dev_priv, VLV_BLC_PWM_CTL2(pipe));
@@ -1946,7 +1947,7 @@ int intel_panel_setup_backlight(struct drm_connector *connector, enum pipe pipe)
 	}
 
 	/* ensure intel_panel has been initialized first */
-	if (WARN_ON(!panel->backlight.setup))
+	if (drm_WARN_ON(&dev_priv->drm, !panel->backlight.setup))
 		return -ENODEV;
 
 	/* set level and max in panel struct */
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
