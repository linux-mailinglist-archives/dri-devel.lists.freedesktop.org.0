Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149CC3697B5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FF76EC17;
	Fri, 23 Apr 2021 16:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715B46EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:50 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p16so21558438plf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0BQt98cg9Cmzb0ViPALeB+8PlK22LbbXMDR3e5Py7w=;
 b=EHh1L6ZZLLN3kyZ24Iqh3VsuPfebCKg4a0AJ39BFCP3pcHw0c8vHwl+6MBIPCV/aO3
 6sDLvBBnpftNhra5Jq5x+ew4v+13y7oVbWKvfcJPMkxtkEuJ2D+kpjce9xvBqdYYCTzf
 2+ljvFe4sVngtc/SulDVnIjoUpjPNVJv0orL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0BQt98cg9Cmzb0ViPALeB+8PlK22LbbXMDR3e5Py7w=;
 b=p7QZob9UZfpnMUmjmvV82aoqWWTei7+1pUp2luHuBvzEQKyjOSCDTWIp5X8DCvjwa+
 CQpDBK1+eTmwg/yIR98jCZI5Zq0UsUdZCGOV7iXU5xR4Fz88JmmFQup5xbIJ4tOzeAzq
 TA3kD1cBMR4sNA/GvgvrCfOImXJcIDiCvhc54fPK88p18UfPT/gNQLse5A9Dwt74ZF40
 sfJxzvCc3qpiBwyXwtqUwGWhmEL/TURsp9B25Hjmruh8CFoiJCYDDFPzWbmc5ymKgv4A
 xgJszgfSa7Ia/xg2vEYjxf5vThylbpMfhwR210zF+zBBzF6DEkRn7CeMl/KxIy4ejx0Z
 n6QA==
X-Gm-Message-State: AOAM532LqKr+1/nqQ2WdXVvpQ1SJatJl4lxpuzP+EVGJ/l34gmrmrzXh
 Fo6t73sUOPMfvKe0fKSoRqONIA==
X-Google-Smtp-Source: ABdhPJxKpa65FeJ2WN5GIGAJlE31Vyr1YzGQAjtTaDIV8yYTuKu6Ch2PrCQz5mo6UGrmPYEYJc6Hqw==
X-Received: by 2002:a17:903:2490:b029:e6:faf5:86df with SMTP id
 p16-20020a1709032490b02900e6faf586dfmr4839937plw.69.1619197190226; 
 Fri, 23 Apr 2021 09:59:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 09/20] drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP
 bridge into sub-drivers
Date: Fri, 23 Apr 2021 09:58:55 -0700
Message-Id: <20210423095743.v5.9.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
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

Changes in v5:
- Fix module compile problems (Bjorn + kbuild bot)
- Remove useless MODULE_DEVICE_TABLE (Bjorn).

 drivers/gpu/drm/bridge/Kconfig        |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 252 ++++++++++++++++++++------
 2 files changed, 200 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index d907a91a2ee8..bdec664f27ec 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -275,6 +275,7 @@ config DRM_TI_SN65DSI86
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select AUXILIARY_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 68673f736b23..0bd1a1d1453e 100644
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
@@ -1136,8 +1143,10 @@ static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
 	"GPIO1", "GPIO2", "GPIO3", "GPIO4"
 };
 
-static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
+static int ti_sn_gpio_probe(struct auxiliary_device *adev,
+			    const struct auxiliary_device_id *id)
 {
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 	int ret;
 
 	/* Only init if someone is going to use us as a GPIO controller */
@@ -1159,20 +1168,41 @@ static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
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
 
-static inline int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
+MODULE_DEVICE_TABLE(auxiliary, ti_sn_gpio_id_table);
+
+static struct auxiliary_driver ti_sn_gpio_driver = {
+	.name = "gpio",
+	.probe = ti_sn_gpio_probe,
+	.id_table = ti_sn_gpio_id_table,
+};
+
+static int __init ti_sn_gpio_register(void)
 {
-	return 0;
+	return auxiliary_driver_register(&ti_sn_gpio_driver);
 }
 
+static void __exit ti_sn_gpio_unregister(void)
+{
+	auxiliary_driver_unregister(&ti_sn_gpio_driver);
+}
+
+#else
+
+static inline int ti_sn_gpio_register(void) { return 0; }
+static inline void ti_sn_gpio_unregister(void) {}
+
 #endif
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
@@ -1224,11 +1254,124 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
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
+static struct auxiliary_driver ti_sn_bridge_driver = {
+	.name = "bridge",
+	.probe = ti_sn_bridge_probe,
+	.remove = ti_sn_bridge_remove,
+	.id_table = ti_sn_bridge_id_table,
+};
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
@@ -1278,54 +1421,24 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 
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
@@ -1347,10 +1460,43 @@ static struct i2c_driver ti_sn65dsi86_driver = {
 		.pm = &ti_sn65dsi86_pm_ops,
 	},
 	.probe = ti_sn65dsi86_probe,
-	.remove = ti_sn65dsi86_remove,
 	.id_table = ti_sn65dsi86_id,
 };
-module_i2c_driver(ti_sn65dsi86_driver);
+
+static int __init ti_sn65dsi86_init(void)
+{
+	int ret;
+
+	ret = i2c_add_driver(&ti_sn65dsi86_driver);
+	if (ret)
+		return ret;
+
+	ret = ti_sn_gpio_register();
+	if (ret)
+		goto err_main_was_registered;
+
+	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
+	if (ret)
+		goto err_gpio_was_registered;
+
+	return 0;
+
+err_gpio_was_registered:
+	ti_sn_gpio_unregister();
+err_main_was_registered:
+	i2c_del_driver(&ti_sn65dsi86_driver);
+
+	return ret;
+}
+module_init(ti_sn65dsi86_init);
+
+static void __exit ti_sn65dsi86_exit(void)
+{
+	auxiliary_driver_unregister(&ti_sn_bridge_driver);
+	ti_sn_gpio_unregister();
+	i2c_del_driver(&ti_sn65dsi86_driver);
+}
+module_exit(ti_sn65dsi86_exit);
 
 MODULE_AUTHOR("Sandeep Panda <spanda@codeaurora.org>");
 MODULE_DESCRIPTION("sn65dsi86 DSI to eDP bridge driver");
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
