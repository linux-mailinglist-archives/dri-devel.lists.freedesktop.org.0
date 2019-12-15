Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4C11F919
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 17:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E0B6E116;
	Sun, 15 Dec 2019 16:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59B66E11C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576427910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+TqmbLQzQ/VhWvgbcbh43ilbcLxJUlh83NZxjX7V3s=;
 b=EEFAU2zA1leboDailNX4nm1ylLvv+gVPQR3MGMe4dp3+rNEUCsvE+c29PtGVl0TxfCItZ0
 nFr8q+8m0shDbBRhYy6GP2iTRmhnQN9ZglZtaJaMcBPZFp0YbxIXFkIwgVTjY+KC9vNPk4
 7m8n1kUg9CIHUNmVHm22Y237veX0zFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-blklPJ6EOpycc36DK-BbdA-1; Sun, 15 Dec 2019 11:38:27 -0500
X-MC-Unique: blklPJ6EOpycc36DK-BbdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA1E477;
 Sun, 15 Dec 2019 16:38:25 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A6EB5D9C9;
 Sun, 15 Dec 2019 16:38:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/5] drm/i915/dsi: Control panel and backlight enable GPIOs on
 BYT
Date: Sun, 15 Dec 2019 17:38:10 +0100
Message-Id: <20191215163810.52356-6-hdegoede@redhat.com>
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

On Bay Trail devices the MIPI power on/off sequences for DSI LCD panels
do not control the LCD panel- and backlight-enable GPIOs. So far, when
the VBT indicates we should use the SoC for backlight control, we have
been relying on these GPIOs being configured as output and driven high by
the Video BIOS (GOP) when it initializes the panel.

This does not work when the device is booted with a HDMI monitor connected
as then the GOP will initialize the HDMI instead of the panel, leaving the
panel black, even though the i915 driver tries to output an image to it.

Likewise on some device-models when the GOP does not initialize the DSI
panel it also leaves the mux of the PWM0 pin in generic GPIO mode instead
of muxing it to the PWM controller.

This commit makes the DSI code control the SoC GPIOs for panel- and
backlight-enable on BYT, when the VBT indicates the SoC should be used

for backlight control. It also ensures that the PWM0 pin is muxed to the
PWM controller in this case.

This fixes the LCD panel not lighting up on various devices when booted
with a HDMI monitor connected. This has been tested to fix this on the
following devices:

Peaq C1010
Point of View MOBII TAB-P800W
Point of View MOBII TAB-P1005W
Terra Pad 1061
Yours Y8W81

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     |  3 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 63 ++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
index 675771ea91aa..7481a5aa3084 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -45,8 +45,9 @@ struct intel_dsi {
 	struct intel_dsi_host *dsi_hosts[I915_MAX_PORTS];
 	intel_wakeref_t io_wakeref[I915_MAX_PORTS];
 
-	/* GPIO Desc for CRC based Panel control */
+	/* GPIO Desc for panel and backlight control */
 	struct gpio_desc *gpio_panel;
+	struct gpio_desc *gpio_backlight;
 
 	struct intel_connector *attached_connector;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 847f04eec2a1..bd007d4f86e2 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -27,6 +27,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/mfd/intel_soc_pmic.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
 #include <linux/slab.h>
 
 #include <asm/intel-mid.h>
@@ -525,11 +527,15 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 {
 	if (seq_id == MIPI_SEQ_POWER_ON && intel_dsi->gpio_panel)
 		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
+	if (seq_id == MIPI_SEQ_BACKLIGHT_ON && intel_dsi->gpio_backlight)
+		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 1);
 
 	intel_dsi_vbt_exec(intel_dsi, seq_id);
 
 	if (seq_id == MIPI_SEQ_POWER_OFF && intel_dsi->gpio_panel)
 		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
+	if (seq_id == MIPI_SEQ_BACKLIGHT_OFF && intel_dsi->gpio_backlight)
+		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 0);
 }
 
 void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
@@ -688,6 +694,8 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 /*
  * On some BYT/CHT devs some sequences are incomplete and we need to manually
  * control some GPIOs. We need to add a GPIO lookup table before we get these.
+ * If the GOP did not initialize the panel (HDMI inserted) we may need to also
+ * change the pinmux for the SoC's PWM0 pin from GPIO to PWM.
  */
 static struct gpiod_lookup_table pmic_panel_gpio_table = {
 	/* Intel GFX is consumer */
@@ -699,23 +707,68 @@ static struct gpiod_lookup_table pmic_panel_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table soc_panel_gpio_table = {
+	.dev_id = "0000:00:02.0",
+	.table = {
+	  GPIO_LOOKUP("INT33FC:01", 10, "backlight", GPIO_ACTIVE_HIGH),
+	  GPIO_LOOKUP("INT33FC:01", 11, "panel", GPIO_ACTIVE_HIGH),
+	  { },
+	},
+};
+
+static const struct pinctrl_map soc_pwm_pinctrl_map[] = {
+	PIN_MAP_MUX_GROUP("0000:00:02.0", "soc_pwm0", "INT33FC:00",
+			  "pwm0_grp", "pwm"),
+};
+
 void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 {
 	struct drm_device *dev = intel_dsi->base.base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
 	enum gpiod_flags flags = panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+	bool want_backlight_gpio = false;
+	bool want_panel_gpio = false;
+	struct pinctrl *pinctrl;
+	int ret;
 
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
 		gpiod_add_lookup_table(&pmic_panel_gpio_table);
+		want_panel_gpio = true;
+	}
+
+	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc == PPS_BLC_SOC) {
+		gpiod_add_lookup_table(&soc_panel_gpio_table);
+		want_panel_gpio = true;
+		want_backlight_gpio = true;
 
+		/* Ensure PWM0 pin is muxed as PWM instead of GPIO */
+		ret = pinctrl_register_mappings(soc_pwm_pinctrl_map, 1);
+		if (ret)
+			DRM_ERROR("Failed to register pwm0 pinmux mapping\n");
+
+		pinctrl = devm_pinctrl_get_select(dev->dev, "soc_pwm0");
+		if (IS_ERR(pinctrl))
+			DRM_ERROR("Failed to set pinmux to PWM\n");
+	}
+
+	if (want_panel_gpio) {
 		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
 		if (IS_ERR(intel_dsi->gpio_panel)) {
 			DRM_ERROR("Failed to own gpio for panel control\n");
 			intel_dsi->gpio_panel = NULL;
 		}
 	}
+
+	if (want_backlight_gpio) {
+		intel_dsi->gpio_backlight =
+			gpiod_get(dev->dev, "backlight", flags);
+		if (IS_ERR(intel_dsi->gpio_backlight)) {
+			DRM_ERROR("Failed to own gpio for backlight control\n");
+			intel_dsi->gpio_backlight = NULL;
+		}
+	}
 }
 
 void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
@@ -729,7 +782,17 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 		intel_dsi->gpio_panel = NULL;
 	}
 
+	if (intel_dsi->gpio_backlight) {
+		gpiod_put(intel_dsi->gpio_backlight);
+		intel_dsi->gpio_backlight = NULL;
+	}
+
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    (mipi_config->pwm_blc == PPS_BLC_PMIC))
 		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
+
+	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc == PPS_BLC_SOC) {
+		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
+		gpiod_remove_lookup_table(&soc_panel_gpio_table);
+	}
 }
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
