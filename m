Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2536F3722C5
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 23:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8310B6E917;
	Mon,  3 May 2021 21:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F566E429
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 21:59:21 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id d10so4785388pgf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 14:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W77IZHCnR8zsUGkGNcdPd69iBZZWTodBrQgHGoIvISw=;
 b=M7TZCmAyoUuDzEvPoOmNkr6tBJGvDOg1aR4s7KOllc0EReHc789CdHc4KLzYms9sUR
 5Z3DYDxMXHvWz9wnmzsO7ur2w+WrdPQ52D5E2adcrhy4EhUKeKsS24hkgcqEMF3ndr6w
 o4dBqj+CG6w1Wz63Tlq4h2sjgbhp2vayV4yfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W77IZHCnR8zsUGkGNcdPd69iBZZWTodBrQgHGoIvISw=;
 b=Zb/O7+YrBFMTA9dJEuEgFzt435gEPMCyfaTN/yVxJ1NWOkcx0MsVUew2PKRcKJhH/4
 A74bywf/pjX66L4Gj9NzPKg8x7Eic0lqQj97C7uSWSlJRALxs2n87Ww+9oQu+/J2ao1Y
 nvJ/dwKYKhoROl6zybHJtupr0TN797xENzDusW++CxZwm8CXBpCFFWu0ox1qP6OSgrOM
 H023lWa3V/OTzVb9uytVGokQcP8eNs4W3Jfx4QeTYLHKWzQ/LFLyFCFKXLt3I0RRqP8M
 wk+yyX00mwq4kCMBbyPWY162qdvApFsj/XMncNA9qJLRKrrsSWS7e53q31dzFtIQxcrv
 K2ag==
X-Gm-Message-State: AOAM53318BSQkwVftg3P8SJ0ImP1E/2Pl107HTIoMZH9tR6u6mfDxlLo
 LlHq3upJRRKyrhMj3uMs21jAMQ==
X-Google-Smtp-Source: ABdhPJwUwZpD0ml7xZSSGB8YnVak9g4AclMeV/DUQkle3+bQBr3hT0aM54E9KH7HNRBu5lUO+G4fog==
X-Received: by 2002:a17:90a:440f:: with SMTP id
 s15mr943884pjg.192.1620079161254; 
 Mon, 03 May 2021 14:59:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:a592:ac50:b17b:5c43])
 by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:59:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v6 3/5] drm/bridge: ti-sn65dsi86: Promote the AUX channel to
 its own sub-dev
Date: Mon,  3 May 2021 14:58:42 -0700
Message-Id: <20210503145750.v6.3.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503215844.2996320-1-dianders@chromium.org>
References: <20210503215844.2996320-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, linux-i2c@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'd like to be able to expose the DDC-over-AUX channel bus to our
panel. This gets into a chicken-and-egg problem because:
- The panel wants to get its DDC bus at probe time.
- The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
  bus, wants to get the panel at probe time.

By using a sub device we can fully create the AUX channel bits so that
the panel can get them. Then the panel can finish probing and the
bridge can probe.

To accomplish this, we use the new functions introduced in ("drm/dp:
Allow an early call to register DDC i2c bus") to register the i2c bus
early.

NOTE: there's a little bit of a trick here. Though the AUX channel can
run without the MIPI-to-eDP bits of the code, the MIPI-to-eDP bits
can't run without the AUX channel. We could come up a complicated
signaling scheme (have the MIPI-to-eDP bits return EPROBE_DEFER for a
while or wait on some sort of completion), but it seems simple enough
to just not even bother creating the bridge device until the AUX
channel probes. That's what we'll do.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Commit 6cba3fe43341 ("drm/dp: Add backpointer to drm_device in
drm_dp_aux") made it very explicit that it's not OK to fully register
the aux device until we have the bridge, but hopefully just getting
the i2c bits early is OK?

Changes in v6:
- Use new drm_dp_aux_register_ddc() calls.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 77 +++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index db027528febd..594aac57bdbc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -116,6 +116,7 @@
  * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
  * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
  * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
+ * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
  *
  * @dev:          Pointer to the top level (i2c) device.
  * @regmap:       Regmap for accessing i2c.
@@ -148,6 +149,7 @@
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
 	struct auxiliary_device		gpio_aux;
+	struct auxiliary_device		aux_aux;
 
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -1331,11 +1333,6 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	if (ret)
 		return ret;
 
-	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = pdata->dev;
-	pdata->aux.transfer = ti_sn_aux_transfer;
-	drm_dp_aux_init(&pdata->aux);
-
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
 
@@ -1430,6 +1427,50 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 	return ret;
 }
 
+static void ti_sn65dsi86_unregister_dp_aux_ddc(void *data)
+{
+	drm_dp_aux_unregister_ddc(data);
+}
+
+static int ti_sn_aux_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	int ret;
+
+	pdata->aux.name = "ti-sn65dsi86-aux";
+	pdata->aux.dev = pdata->dev;
+	pdata->aux.transfer = ti_sn_aux_transfer;
+	drm_dp_aux_init(&pdata->aux);
+
+	ret = drm_dp_aux_register_ddc(&pdata->aux);
+	if (ret < 0) {
+		drm_err(pdata, "Failed to register AUX DDC channel: %d\n", ret);
+		return ret;
+	}
+	ret = devm_add_action_or_reset(&adev->dev,
+				       ti_sn65dsi86_unregister_dp_aux_ddc, &pdata->aux);
+	if (ret)
+		return ret;
+
+	/*
+	 * The eDP to MIPI bridge parts don't work until the AUX channel is
+	 * setup so we don't add it in the main driver probe, we add it now.
+	 */
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+}
+
+static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
+	{ .name = "ti_sn65dsi86.aux", },
+	{},
+};
+
+static struct auxiliary_driver ti_sn_aux_driver = {
+	.name = "aux",
+	.probe = ti_sn_aux_probe,
+	.id_table = ti_sn_aux_id_table,
+};
+
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1488,10 +1529,11 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	 * motiviation here is to solve the chicken-and-egg problem of probe
 	 * ordering. The bridge wants the panel to be there when it probes.
 	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
-	 * when it probes. There will soon be other devices (DDC I2C bus, PWM)
-	 * that have the same problem. Having sub-devices allows the some sub
-	 * devices to finish probing even if others return -EPROBE_DEFER and
-	 * gets us around the problems.
+	 * when it probes. The panel and maybe backlight might want the DDC
+	 * bus. Soon the PWM provided by the bridge chip will have the same
+	 * problem. Having sub-devices allows the some sub devices to finish
+	 * probing even if others return -EPROBE_DEFER and gets us around the
+	 * problems.
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
@@ -1500,7 +1542,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+	/*
+	 * NOTE: At the end of the AUX channel probe we'll add the aux device
+	 * for the bridge. This is because the bridge can't be used until the
+	 * AUX channel is there and this is a very simple solution to the
+	 * dependency problem.
+	 */
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
 }
 
 static struct i2c_device_id ti_sn65dsi86_id[] = {
@@ -1537,12 +1585,18 @@ static int __init ti_sn65dsi86_init(void)
 	if (ret)
 		goto err_main_was_registered;
 
-	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
+	ret = auxiliary_driver_register(&ti_sn_aux_driver);
 	if (ret)
 		goto err_gpio_was_registered;
 
+	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
+	if (ret)
+		goto err_aux_was_registered;
+
 	return 0;
 
+err_aux_was_registered:
+	auxiliary_driver_unregister(&ti_sn_aux_driver);
 err_gpio_was_registered:
 	ti_sn_gpio_unregister();
 err_main_was_registered:
@@ -1555,6 +1609,7 @@ module_init(ti_sn65dsi86_init);
 static void __exit ti_sn65dsi86_exit(void)
 {
 	auxiliary_driver_unregister(&ti_sn_bridge_driver);
+	auxiliary_driver_unregister(&ti_sn_aux_driver);
 	ti_sn_gpio_unregister();
 	i2c_del_driver(&ti_sn65dsi86_driver);
 }
-- 
2.31.1.527.g47e6f16901-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
