Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CF11F916
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 17:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6814F6E10A;
	Sun, 15 Dec 2019 16:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F9C6E10F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576427906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFEQpUKCZvVGNm/j6RT5DPYIcAJP2SXI+ApwKUaxUjI=;
 b=Cwi+11AaRE9bhYgkwihE9lK+kSzpzST+Fy1CYtNRM7mPJD7fy9JtJ9FwtCDCS4ABFFFNtg
 K2s1HUUs3gjnJ5OcA+97WEJt/lmeF4viTKY+ZIMvTo/Yt8mSJ4EIH2ZPa0zi6bWZcWP6cy
 FFGCedDAbRUOlILW4/jp/nwqNbgpXZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-b_OVAx7tMp-MFliJL0HIrA-1; Sun, 15 Dec 2019 11:38:25 -0500
X-MC-Unique: b_OVAx7tMp-MFliJL0HIrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 543EE1800D63;
 Sun, 15 Dec 2019 16:38:23 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC2D5D9C9;
 Sun, 15 Dec 2019 16:38:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO lookup
 from mfd to the i915 driver
Date: Sun, 15 Dec 2019 17:38:09 +0100
Message-Id: <20191215163810.52356-5-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the Crystal Cove PMIC panel GPIO lookup-table from
drivers/mfd/intel_soc_pmic_core.c to the i915 driver.

The moved looked-up table is adding a GPIO lookup to the i915 PCI
device and the GPIO subsys allows only one lookup table per device,

The intel_soc_pmic_core.c code only adds lookup-table entries for the
PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
able to access some GPIOs on the SoC itself, which requires entries for
these GPIOs in the lookup-table.

Since the lookup-table is attached to the i915 PCI device it really
should be part of the i915 driver, this will also allow us to extend
it with GPIOs from other sources when necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 23 +++++++++++++++++++-
 drivers/mfd/intel_soc_pmic_core.c            | 19 ----------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 027970348b22..847f04eec2a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -25,6 +25,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/mfd/intel_soc_pmic.h>
 #include <linux/slab.h>
 
@@ -686,8 +687,18 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 
 /*
  * On some BYT/CHT devs some sequences are incomplete and we need to manually
- * control some GPIOs.
+ * control some GPIOs. We need to add a GPIO lookup table before we get these.
  */
+static struct gpiod_lookup_table pmic_panel_gpio_table = {
+	/* Intel GFX is consumer */
+	.dev_id = "0000:00:02.0",
+	.table = {
+		/* Panel EN/DISABLE */
+		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 {
 	struct drm_device *dev = intel_dsi->base.base.dev;
@@ -697,6 +708,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
+		gpiod_add_lookup_table(&pmic_panel_gpio_table);
+
 		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
 			DRM_ERROR("Failed to own gpio for panel control\n");
@@ -707,8 +720,16 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 {
+	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
+
 	if (intel_dsi->gpio_panel) {
 		gpiod_put(intel_dsi->gpio_panel);
 		intel_dsi->gpio_panel = NULL;
 	}
+
+	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
+	    (mipi_config->pwm_blc == PPS_BLC_PMIC))
+		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
 }
diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
index 47188df3080d..ddd64f9e3341 100644
--- a/drivers/mfd/intel_soc_pmic_core.c
+++ b/drivers/mfd/intel_soc_pmic_core.c
@@ -9,8 +9,6 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -25,17 +23,6 @@
 #define BYT_CRC_HRV		2
 #define CHT_CRC_HRV		3
 
-/* Lookup table for the Panel Enable/Disable line as GPIO signals */
-static struct gpiod_lookup_table panel_gpio_table = {
-	/* Intel GFX is consumer */
-	.dev_id = "0000:00:02.0",
-	.table = {
-		/* Panel EN/DISABLE */
-		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
 /* PWM consumed by the Intel GFX */
 static struct pwm_lookup crc_pwm_lookup[] = {
 	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight", 0, PWM_POLARITY_NORMAL),
@@ -96,9 +83,6 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
 	if (ret)
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
 
-	/* Add lookup table binding for Panel Control to the GPIO Chip */
-	gpiod_add_lookup_table(&panel_gpio_table);
-
 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
 
@@ -121,9 +105,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_client *i2c)
 
 	regmap_del_irq_chip(pmic->irq, pmic->irq_chip_data);
 
-	/* Remove lookup table for Panel Control from the GPIO Chip */
-	gpiod_remove_lookup_table(&panel_gpio_table);
-
 	/* remove crc-pwm lookup table */
 	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
