Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E106202332
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 12:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72B36E0D5;
	Sat, 20 Jun 2020 10:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDAC6E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 10:31:12 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id DC51B20020;
 Sat, 20 Jun 2020 12:31:07 +0200 (CEST)
Date: Sat, 20 Jun 2020 12:31:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: Re: [PATCH v3 2/2] display/drm/bridge: TC358775 DSI/LVDS driver
Message-ID: <20200620103106.GA15379@ravnborg.org>
References: <20200618121902.16841-1-simhavcs@gmail.com>
 <20200618121902.16841-2-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618121902.16841-2-simhavcs@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Qg8_i2Z0HerwvbgKwyIA:9 a=CjuIK1q_8ugA:10
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay.

> +
> +static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct drm_panel *panel;
> +	struct tc_data *tc;
> +	int ret;
> +
> +	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
> +	if (!tc)
> +		return -ENOMEM;
> +
> +	tc->dev = dev;
> +	tc->i2c = client;
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, TC358775_LVDS_OUT0,
> +					  0, &panel, NULL);
> +	if (ret < 0)
> +		return ret;
> +	if (!panel)
> +		return -ENODEV;
> +
> +	panel->connector_type = DRM_MODE_CONNECTOR_LVDS;

The panel is responsible for specifying the connector_type.
It is wrong to let users of panel set it.

Fix the panel and not the bridge driver.


> +
> +	tc->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(tc->panel_bridge))
> +		return PTR_ERR(tc->panel_bridge);
> +
> +	ret = tc358775_parse_dt(dev->of_node, tc);
> +	if (ret)
> +		return ret;
> +
> +	tc->vddio = devm_regulator_get(dev, "vddio-supply");
> +	if (IS_ERR(tc->vddio)) {
> +		ret = PTR_ERR(tc->vddio);
> +		dev_err(dev, "vddio-supply not found\n");
> +		return ret;
> +	}
> +
> +	tc->vdd = devm_regulator_get(dev, "vdd-supply");
> +	if (IS_ERR(tc->vdd)) {
> +		ret = PTR_ERR(tc->vddio);
> +		dev_err(dev, "vdd-supply not found\n");
> +		return ret;
> +	}
> +
> +	tc->stby_gpio = devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
> +	if (IS_ERR(tc->stby_gpio)) {
> +		ret = PTR_ERR(tc->stby_gpio);
> +		dev_err(dev, "cannot get stby-gpio %d\n", ret);
> +		return ret;
> +	}
> +
> +	tc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(tc->reset_gpio)) {
> +		ret = PTR_ERR(tc->reset_gpio);
> +		dev_err(dev, "cannot get reset-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	tc->bridge.funcs = &tc_bridge_funcs;
> +	tc->bridge.of_node = dev->of_node;
> +	drm_bridge_add(&tc->bridge);
> +
> +	i2c_set_clientdata(client, tc);
> +
> +	return 0;
> +}
> +

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
