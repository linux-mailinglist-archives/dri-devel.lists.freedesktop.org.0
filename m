Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE4362B4D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5996ECF2;
	Fri, 16 Apr 2021 22:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF426ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:05 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id o16so1125573plg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32p094LtRE8x040PHsq/D9b0lJvFmgmtHOiczhPHLkI=;
 b=mbCuYJdiKgPkF/CPplBgMnb3Krv4cGbiF3vuaKImMCZXEQsuoXJ957LjtXuzS1bi05
 F+HzOIBlOMxl4xnus1oxHjlZK4oJ4sD1DyuQTPEJ5JQNlSFAi3kYTMX+1QjdU9F0/KtK
 sHTlRc7eN8ZHvBzO2zC7F0nWCbhwG50zX1Z60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32p094LtRE8x040PHsq/D9b0lJvFmgmtHOiczhPHLkI=;
 b=EsfmVqpJHks5Xd4RvYx4mCSxTti1s2KTPcBt/1V6PzJGNdZqP/4eEfnrP5S7dBBOYB
 HzGB/K9omjizVjMhGtbhUl3uwIG5J4lrdiXMThd8vpO+513pIXlwxd8HEj3Y4Y7i1pBI
 lvsdboD6SfaAxcUK3bkwZXJDME0M329upnQHsF0tPXGSNsCGZTXJEOUpzZKo+7TzNDIr
 zTXhEUyAOqej06hGfzKMss9sCfMu1pPoTxOP4s5NA3GAzXS1OSh7Nrxz3Cw9t7k/1wzS
 1IQMg3Jg2krlHOgc/6YtjLjRJ9jtgqxxXwppKdYzTEHrH3/XE32H6LqQb1OJV4s3MkY2
 TSFg==
X-Gm-Message-State: AOAM533PBNEwWLoOop7bGg8hncXYLf9iJruZkSIt3UrhD6ywtzHVuzVB
 dAT53/rL9nbwkvEmK/00m2euHw==
X-Google-Smtp-Source: ABdhPJxMbXAapu0TxRByFMq7luqQ62DNwvt6G+J0rYjukq/QqPSwlVzXLxZIrHIHCidO1WejrhKd3Q==
X-Received: by 2002:a17:90a:a789:: with SMTP id
 f9mr12416874pjq.192.1618612865378; 
 Fri, 16 Apr 2021 15:41:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 11/27] drm/bridge: ti-sn65dsi86: Add local var for "dev" to
 simplify probe
Date: Fri, 16 Apr 2021 15:39:34 -0700
Message-Id: <20210416153909.v4.11.I83925d8ca228bdc5f55b17854c90754efc6a470e@changeid>
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

Tiny cleanup for probe so we don't keep having to specify
"&client->dev" or "pdata->dev". No functional changes intended.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 0c6aa99ddc99..2cbf619fbd27 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1226,6 +1226,7 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct ti_sn65dsi86 *pdata;
 	int ret;
 
@@ -1234,8 +1235,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	pdata = devm_kzalloc(&client->dev, sizeof(struct ti_sn65dsi86),
-			     GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
@@ -1246,26 +1246,24 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return PTR_ERR(pdata->regmap);
 	}
 
-	pdata->dev = &client->dev;
+	pdata->dev = dev;
 
-	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
-					  &pdata->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
 		return ret;
 	}
 
-	dev_set_drvdata(&client->dev, pdata);
+	dev_set_drvdata(dev, pdata);
 
-	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
-					    GPIOD_OUT_LOW);
+	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
 		ret = PTR_ERR(pdata->enable_gpio);
 		return ret;
 	}
 
-	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
+	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
 
 	ret = ti_sn65dsi86_parse_regulators(pdata);
 	if (ret) {
@@ -1273,7 +1271,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
+	pdata->refclk = devm_clk_get_optional(dev, "refclk");
 	if (IS_ERR(pdata->refclk))
 		return PTR_ERR(pdata->refclk);
 
@@ -1281,23 +1279,23 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(pdata->dev);
+	pm_runtime_enable(dev);
 
 	ret = ti_sn_setup_gpio_controller(pdata);
 	if (ret) {
-		pm_runtime_disable(pdata->dev);
+		pm_runtime_disable(dev);
 		return ret;
 	}
 
 	i2c_set_clientdata(client, pdata);
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = pdata->dev;
+	pdata->aux.dev = dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_init(&pdata->aux);
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
-	pdata->bridge.of_node = client->dev.of_node;
+	pdata->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
