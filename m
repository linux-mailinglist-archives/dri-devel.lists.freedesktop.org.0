Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082487DF5F8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524C210E922;
	Thu,  2 Nov 2023 15:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BA910E912;
 Thu,  2 Nov 2023 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937960; x=1730473960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5TnJD8mZT4XCWRMm2D4HqLq+7mmDEPFtEmjmsmEvVE=;
 b=Gh73aP8fs9fibSwPBN2LsVf5UVxU7K29lXJpv6nUyR+tBQESm4gJ9dGX
 jpazhz6GtxXDJPiQjpcJxwJqdlNfsLlS4LFwjoInM0/tycsc5XrOkJZ97
 RAyDophNY1aihFz5N2hWBxvdDZcHmIs4FUaoDYUUaQcZDOSjFE3Q0BLn/
 0LEemMTNdJZnNCpqOEMg1u8z8kLb5bdefu5eV8CWXEqd6e8onVZwzaesa
 Ylz2nZT/cLz6Pws87EClcDGhOKNKt4nbSaoxtAGivv/nQvozFbX3jnQ+l
 ENvea/y8017lmRGB5dQa1aFW7MTI0Gr+964d+UbkpbEO1gzQ/+vyrRQ1m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373773481"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="373773481"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711174074"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711174074"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:12:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 03C84690; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/15] drm/i915/dsi: Remove GPIO lookup table at the end of
 intel_dsi_vbt_gpio_init()
Date: Thu,  2 Nov 2023 17:12:22 +0200
Message-Id: <20231102151228.668842-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

To properly deal with GPIOs used in MIPI panel sequences a temporary
GPIO lookup will be used. Since there can only be 1 GPIO lookup table
for the "0000:00:02.0" device this will not work if the GPIO lookup
table used by intel_dsi_vbt_gpio_init() is still registered.

After getting the "backlight" and "panel" GPIOs the lookup table
registered by intel_dsi_vbt_gpio_init() is no longer necessary,
remove it so that another temporary lookup-table for the "0000:00:02.0"
device can be added.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 25 +++++++-------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index d270437217b3..8e6beef90e5e 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -955,6 +955,7 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
 	enum gpiod_flags flags = panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+	struct gpiod_lookup_table *gpiod_lookup_table = NULL;
 	bool want_backlight_gpio = false;
 	bool want_panel_gpio = false;
 	struct pinctrl *pinctrl;
@@ -962,12 +963,12 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    mipi_config->pwm_blc == PPS_BLC_PMIC) {
-		gpiod_add_lookup_table(&pmic_panel_gpio_table);
+		gpiod_lookup_table = &pmic_panel_gpio_table;
 		want_panel_gpio = true;
 	}
 
 	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc == PPS_BLC_SOC) {
-		gpiod_add_lookup_table(&soc_panel_gpio_table);
+		gpiod_lookup_table = &soc_panel_gpio_table;
 		want_panel_gpio = true;
 		want_backlight_gpio = true;
 
@@ -984,6 +985,9 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 				"Failed to set pinmux to PWM\n");
 	}
 
+	if (gpiod_lookup_table)
+		gpiod_add_lookup_table(gpiod_lookup_table);
+
 	if (want_panel_gpio) {
 		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
@@ -1002,15 +1006,13 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 			intel_dsi->gpio_backlight = NULL;
 		}
 	}
+
+	if (gpiod_lookup_table)
+		gpiod_remove_lookup_table(gpiod_lookup_table);
 }
 
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 {
-	struct drm_device *dev = intel_dsi->base.base.dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct intel_connector *connector = intel_dsi->attached_connector;
-	struct mipi_config *mipi_config = connector->panel.vbt.dsi.config;
-
 	if (intel_dsi->gpio_panel) {
 		gpiod_put(intel_dsi->gpio_panel);
 		intel_dsi->gpio_panel = NULL;
@@ -1020,13 +1022,4 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 		gpiod_put(intel_dsi->gpio_backlight);
 		intel_dsi->gpio_backlight = NULL;
 	}
-
-	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
-	    mipi_config->pwm_blc == PPS_BLC_PMIC)
-		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
-
-	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc == PPS_BLC_SOC) {
-		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
-		gpiod_remove_lookup_table(&soc_panel_gpio_table);
-	}
 }
-- 
2.40.0.1.gaa8946217a0b

