Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBA362B4F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6066ECF4;
	Fri, 16 Apr 2021 22:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D5E6ECF6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:09 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id o16so1125638plg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TfdQWFl/GoS3SyVWXUyaCu0I5LYHAoYYTy0F0R/N7I=;
 b=KC+y3xzRhS+X/rKZ15rIW4pEI1MW29ewtrDZxu7DafgnyJrjFb9FWXIbWOHANWF0x1
 vVZ0SZM3ZYRh143LLCJa8fUSCelalVSJcKQWs6Mksb5AJsJrfYvd0cYg5QfQJmzuDaFg
 RYDQ3caUQ1iIm+Jxqnn/NT9yM1kGPbpKfpbuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TfdQWFl/GoS3SyVWXUyaCu0I5LYHAoYYTy0F0R/N7I=;
 b=C4bW1L+byaLecs78ahC1Lthvh3Z8hxfIpKbFT9BjzZo4Pj9wthwPb7A6YNUxuMhpt+
 wRja78ZLuSDmqCG5kX/s4GuFvhZb7OeT2QyaaQHgh+9xiNSdAzp87Lk8ch/74y6sk4oi
 IGcLdA+oAWezBdmIAvapc5hJ3b1LZCT4OoU9qVijscZeyYwmp3s66pAYUnmay0dtCMvO
 OiJbNhozrcCEkI8+fStKo8YeHfOJNiVDXlcIlZSw0HGrtKug6jtSwe2Pa3YgamWw51UX
 S/HVTtpRjXtr9oryDrDNOAURKpTmKzFWR09v7HyoU5uUX7XpGjbDKSwbeFUrc4ij9jJO
 1UiQ==
X-Gm-Message-State: AOAM5327TL05bqmvE9e8yLy1pI9YViillk3Q601J8w+Aldk94uXNV/qe
 s+icYmspWxdFEjAslg6yqz05Ug==
X-Google-Smtp-Source: ABdhPJz1v1yI8QJVBD9fxNVbddtpqR88tsNeNszut4FCyxJRUZFJXEyzl6lMEDk5Bp9nwfB0z2Qk+Q==
X-Received: by 2002:a17:90a:6b84:: with SMTP id
 w4mr11893127pjj.134.1618612869618; 
 Fri, 16 Apr 2021 15:41:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 15/27] drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP
 bridge into sub-drivers
Date: Fri, 16 Apr 2021 15:39:38 -0700
Message-Id: <20210416153909.v4.15.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's use the newly minted aux bus to break up the driver into sub
drivers. We're not doing a full breakup here: all the code is still in
the same file and remains largely untouched. The big goal here of
using sub-drivers is to allow part of our code to finish probing even
if some other code needs to defer. This can solve some chicken-and-egg
problems. Specifically:
- In commit 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for
  delaying prepare()") we had to add a bit of a hack to simpel-panel
  to support HPD showing up late. We can get rid of that hack now
  since the GPIO part of our driver can finish probing early.
- We have a desire to expose our DDC bus to simple-panel (and perhaps
  to a backlight driver?). That will end up with the same
  chicken-and-egg problem. A future patch to move this to a sub-driver
  will fix it.
- If/when we support the PWM functionality present in the bridge chip
  for a backlight we'll end up with another chicken-and-egg
  problem. If we allow the PWM to be a sub-driver too then it solves
  this problem.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/Kconfig        |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 211 +++++++++++++++++++-------
 2 files changed, 158 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 22a467abd3e9..6868050961a2 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -267,6 +267,7 @@ config DRM_TI_SN65DSI86
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select AUXILIARY_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 57bc489a0412..44edcf6f5744 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -4,6 +4,7 @@
  * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
@@ -113,7 +114,10 @@
 
 /**
  * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
- * @dev:          Pointer to our device.
+ * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
+ * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
+ *
+ * @dev:          Pointer to the top level (i2c) device.
  * @regmap:       Regmap for accessing i2c.
  * @aux:          Our aux channel.
  * @bridge:       Our bridge.
@@ -140,6 +144,9 @@
  *                each other's read-modify-write.
  */
 struct ti_sn65dsi86 {
+	struct auxiliary_device		bridge_aux;
+	struct auxiliary_device		gpio_aux;
+
 	struct device			*dev;
 	struct regmap			*regmap;
 	struct drm_dp_aux		aux;
@@ -1135,8 +1142,10 @@ static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
 	"GPIO1", "GPIO2", "GPIO3", "GPIO4"
 };
 
-static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
+static int ti_sn_gpio_probe(struct auxiliary_device *adev,
+			    const struct auxiliary_device_id *id)
 {
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 	int ret;
 
 	/* Only init if someone is going to use us as a GPIO controller */
@@ -1158,19 +1167,27 @@ static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
 	pdata->gchip.names = ti_sn_bridge_gpio_names;
 	pdata->gchip.ngpio = SN_NUM_GPIOS;
 	pdata->gchip.base = -1;
-	ret = devm_gpiochip_add_data(pdata->dev, &pdata->gchip, pdata);
+	ret = devm_gpiochip_add_data(&adev->dev, &pdata->gchip, pdata);
 	if (ret)
 		dev_err(pdata->dev, "can't add gpio chip\n");
 
 	return ret;
 }
 
-#else
+static const struct auxiliary_device_id ti_sn_gpio_id_table[] = {
+	{ .name = "ti_sn65dsi86.gpio", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, ti_sn_gpio_id_table);
 
-static inline int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
-{
-	return 0;
-}
+static struct auxiliary_driver ti_sn_gpio_driver = {
+	.name = "gpio",
+	.probe = ti_sn_gpio_probe,
+	.id_table = ti_sn_gpio_id_table,
+};
+
+module_auxiliary_driver(ti_sn_gpio_driver);
 
 #endif
 
@@ -1223,11 +1240,128 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 	pdata->ln_polrs = ln_polrs;
 }
 
+static int ti_sn_bridge_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	struct device_node *np = pdata->dev->of_node;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, &pdata->panel, NULL);
+	if (ret) {
+		DRM_ERROR("could not find any panel node\n");
+		return ret;
+	}
+
+	ti_sn_bridge_parse_lanes(pdata, np);
+
+	ret = ti_sn_bridge_parse_dsi_host(pdata);
+	if (ret)
+		return ret;
+
+	pdata->aux.name = "ti-sn65dsi86-aux";
+	pdata->aux.dev = pdata->dev;
+	pdata->aux.transfer = ti_sn_aux_transfer;
+	drm_dp_aux_init(&pdata->aux);
+
+	pdata->bridge.funcs = &ti_sn_bridge_funcs;
+	pdata->bridge.of_node = np;
+
+	drm_bridge_add(&pdata->bridge);
+
+	return 0;
+}
+
+static void ti_sn_bridge_remove(struct auxiliary_device *adev)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	if (!pdata)
+		return;
+
+	if (pdata->dsi) {
+		mipi_dsi_detach(pdata->dsi);
+		mipi_dsi_device_unregister(pdata->dsi);
+	}
+
+	kfree(pdata->edid);
+
+	drm_bridge_remove(&pdata->bridge);
+
+	of_node_put(pdata->host_node);
+}
+
+static const struct auxiliary_device_id ti_sn_bridge_id_table[] = {
+	{ .name = "ti_sn65dsi86.bridge", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, ti_sn_bridge_id_table);
+
+static struct auxiliary_driver ti_sn_bridge_driver = {
+	.name = "bridge",
+	.probe = ti_sn_bridge_probe,
+	.remove = ti_sn_bridge_remove,
+	.id_table = ti_sn_bridge_id_table,
+};
+
+module_auxiliary_driver(ti_sn_bridge_driver);
+
 static void ti_sn65dsi86_runtime_disable(void *data)
 {
 	pm_runtime_disable(data);
 }
 
+static void ti_sn65dsi86_uninit_aux(void *data)
+{
+	auxiliary_device_uninit(data);
+}
+
+static void ti_sn65dsi86_delete_aux(void *data)
+{
+	auxiliary_device_delete(data);
+}
+
+/*
+ * AUX bus docs say that a non-NULL release is mandatory, but it makes no
+ * sense for the model used here where all of the aux devices are allocated
+ * in the single shared structure. We'll use this noop as a workaround.
+ */
+static void ti_sn65dsi86_noop(struct device *dev) {}
+
+static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
+				       struct auxiliary_device *aux,
+				       const char *name)
+{
+	struct device *dev = pdata->dev;
+	int ret;
+
+	/*
+	 * NOTE: It would be nice to set the "of_node" of our children to be
+	 * the same "of_node"" that the top-level component has. That doesn't
+	 * work, though, since pinctrl will try (and fail) to reserve the
+	 * pins again. Until that gets sorted out the children will just need
+	 * to look at the of_node of the main device.
+	 */
+
+	aux->name = name;
+	aux->dev.parent = dev;
+	aux->dev.release = ti_sn65dsi86_noop;
+	ret = auxiliary_device_init(aux);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(aux);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
+
+	return ret;
+}
+
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1277,54 +1411,24 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 
 	ti_sn65dsi86_debugfs_init(pdata);
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
-	if (ret) {
-		DRM_ERROR("could not find any panel node\n");
-		return ret;
-	}
-
-	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
-
-	ret = ti_sn_bridge_parse_dsi_host(pdata);
-	if (ret)
-		return ret;
-
-	ret = ti_sn_setup_gpio_controller(pdata);
-	if (ret)
-		return ret;
-
-	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = dev;
-	pdata->aux.transfer = ti_sn_aux_transfer;
-	drm_dp_aux_init(&pdata->aux);
-
-	pdata->bridge.funcs = &ti_sn_bridge_funcs;
-	pdata->bridge.of_node = dev->of_node;
-
-	drm_bridge_add(&pdata->bridge);
-
-	return 0;
-}
-
-static int ti_sn65dsi86_remove(struct i2c_client *client)
-{
-	struct ti_sn65dsi86 *pdata = i2c_get_clientdata(client);
-
-	if (!pdata)
-		return -EINVAL;
+	/*
+	 * Break ourselves up into a collection of aux devices. The only real
+	 * motiviation here is to solve the chicken-and-egg problem of probe
+	 * ordering. The bridge wants the panel to be there when it probes.
+	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
+	 * when it probes. There will soon be other devices (DDC I2C bus, PWM)
+	 * that have the same problem. Having sub-devices allows the some sub
+	 * devices to finish probing even if others return -EPROBE_DEFER and
+	 * gets us around the problems.
+	 */
 
-	if (pdata->dsi) {
-		mipi_dsi_detach(pdata->dsi);
-		mipi_dsi_device_unregister(pdata->dsi);
+	if (IS_ENABLED(CONFIG_OF_GPIO)) {
+		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->gpio_aux, "gpio");
+		if (ret)
+			return ret;
 	}
 
-	kfree(pdata->edid);
-
-	drm_bridge_remove(&pdata->bridge);
-
-	of_node_put(pdata->host_node);
-
-	return 0;
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
 }
 
 static struct i2c_device_id ti_sn65dsi86_id[] = {
@@ -1346,7 +1450,6 @@ static struct i2c_driver ti_sn65dsi86_driver = {
 		.pm = &ti_sn65dsi86_pm_ops,
 	},
 	.probe = ti_sn65dsi86_probe,
-	.remove = ti_sn65dsi86_remove,
 	.id_table = ti_sn65dsi86_id,
 };
 module_i2c_driver(ti_sn65dsi86_driver);
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
