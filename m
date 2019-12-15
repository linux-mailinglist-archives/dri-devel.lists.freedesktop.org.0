Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BC11F911
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 17:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2AD6E105;
	Sun, 15 Dec 2019 16:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC2D6E103
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576427903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdgN+bSwsf7iwrrVgFICT+X6bGsqP0dSoNkgexmb0Xw=;
 b=D2UqdiiH/EN5FzctvBhO5hdiD4VOgHZJOs6KiaSR7GlmoX9TVlLxv5I/jDOGVH03fOm9GP
 ZAbYgUaxAcK8rus3FNKWnrR8laykBSOxxCzks4yYM9wFFhTwUuLzjmluG4y38mDCMqf+ES
 zid6hzhhC5uqUmX6P9xbZtt8ybE5d7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-9inXzyAJPUCULcljvJeZPA-1; Sun, 15 Dec 2019 11:38:20 -0500
X-MC-Unique: 9inXzyAJPUCULcljvJeZPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BADE1800D50;
 Sun, 15 Dec 2019 16:38:18 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC9395D9C9;
 Sun, 15 Dec 2019 16:38:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/5] drm/i915/dsi: Move poking of panel-enable GPIO to
 intel_dsi_vbt.c
Date: Sun, 15 Dec 2019 17:38:07 +0100
Message-Id: <20191215163810.52356-3-hdegoede@redhat.com>
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

On some older devices (BYT, CHT) which may use v2 VBT MIPI-sequences,
we need to manually control the panel enable GPIO as v2 sequences do
not do this.

So far we have been carrying the code to do this on BYT/CHT devices
with a Crystal Cove PMIC in vlv_dsi.c, but as this really is a shortcoming
of the VBT MIPI-sequences, intel_dsi_vbt.c is a better place for this,
so move it there.

This is a preparation patch for adding panel-enable and backlight-enable
GPIO support for BYT devices where instead of the PMIC the SoC is used
for backlight control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     |  2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 46 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/vlv_dsi.c       | 27 +-----------
 3 files changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
index b15be5814599..de7e51cd3460 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -203,6 +203,8 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port);
 
 /* intel_dsi_vbt.c */
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
+void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
 void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 				 enum mipi_seq seq_id);
 void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec);
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index f90946c912ee..5352e8c9eca5 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -453,8 +453,8 @@ static const char *sequence_name(enum mipi_seq seq_id)
 		return "(unknown)";
 }
 
-void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
-				 enum mipi_seq seq_id)
+static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
+			       enum mipi_seq seq_id)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
 	const u8 *data;
@@ -519,6 +519,18 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 	}
 }
 
+void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
+				 enum mipi_seq seq_id)
+{
+	if (seq_id == MIPI_SEQ_POWER_ON && intel_dsi->gpio_panel)
+		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
+
+	intel_dsi_vbt_exec(intel_dsi, seq_id);
+
+	if (seq_id == MIPI_SEQ_POWER_OFF && intel_dsi->gpio_panel)
+		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
+}
+
 void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
@@ -671,3 +683,33 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
 
 	return true;
 }
+
+/*
+ * On some BYT/CHT devs some sequences are incomplete and we need to manually
+ * control some GPIOs.
+ */
+void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
+{
+	struct drm_device *dev = intel_dsi->base.base.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
+
+	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
+	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
+		intel_dsi->gpio_panel =
+			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
+
+		if (IS_ERR(intel_dsi->gpio_panel)) {
+			DRM_ERROR("Failed to own gpio for panel control\n");
+			intel_dsi->gpio_panel = NULL;
+		}
+	}
+}
+
+void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
+{
+	if (intel_dsi->gpio_panel) {
+		gpiod_put(intel_dsi->gpio_panel);
+		intel_dsi->gpio_panel = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 6865fd4b5883..178d0fffba5b 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -23,7 +23,6 @@
  * Author: Jani Nikula <jani.nikula@intel.com>
  */
 
-#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -797,9 +796,6 @@ static void intel_dsi_pre_enable(struct intel_encoder *encoder,
 	if (!IS_GEMINILAKE(dev_priv))
 		intel_dsi_prepare(encoder, pipe_config);
 
-	/* Power on, try both CRC pmic gpio and VBT */
-	if (intel_dsi->gpio_panel)
-		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_ON);
 	intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
 
@@ -943,11 +939,8 @@ static void intel_dsi_post_disable(struct intel_encoder *encoder,
 	/* Assert reset */
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_ASSERT_RESET);
 
-	/* Power off, try both CRC pmic gpio and VBT */
 	intel_dsi_msleep(intel_dsi, intel_dsi->panel_off_delay);
 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_OFF);
-	if (intel_dsi->gpio_panel)
-		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
 
 	/*
 	 * FIXME As we do with eDP, just make a note of the time here
@@ -1539,10 +1532,7 @@ static void intel_dsi_encoder_destroy(struct drm_encoder *encoder)
 {
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 
-	/* dispose of the gpios */
-	if (intel_dsi->gpio_panel)
-		gpiod_put(intel_dsi->gpio_panel);
-
+	intel_dsi_vbt_gpio_cleanup(intel_dsi);
 	intel_encoder_destroy(encoder);
 }
 
@@ -1920,20 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 
 	vlv_dphy_param_init(intel_dsi);
 
-	/*
-	 * In case of BYT with CRC PMIC, we need to use GPIO for
-	 * Panel control.
-	 */
-	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
-	    (dev_priv->vbt.dsi.config->pwm_blc == PPS_BLC_PMIC)) {
-		intel_dsi->gpio_panel =
-			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
-
-		if (IS_ERR(intel_dsi->gpio_panel)) {
-			DRM_ERROR("Failed to own gpio for panel control\n");
-			intel_dsi->gpio_panel = NULL;
-		}
-	}
+	intel_dsi_vbt_gpio_init(intel_dsi);
 
 	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
 			   DRM_MODE_CONNECTOR_DSI);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
