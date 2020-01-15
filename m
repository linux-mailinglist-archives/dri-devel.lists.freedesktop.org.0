Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D807313CEA7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 22:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF266EB42;
	Wed, 15 Jan 2020 21:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B75E6EB42
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 21:14:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1D865804E5;
 Wed, 15 Jan 2020 22:14:05 +0100 (CET)
Date: Wed, 15 Jan 2020 22:14:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v8 2/8] drm/panel: support for BOE tv101wum-nl6 wuxga dsi
 video mode panel
Message-ID: <20200115211404.GC28904@ravnborg.org>
References: <20200115135958.126303-1-jitao.shi@mediatek.com>
 <20200115135958.126303-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115135958.126303-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=qFe5Z7MAUKcRMEBcnwwA:9 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao.

> +
> +static int boe_panel_add(struct boe_panel *boe)
> +{
> +	struct device *dev = &boe->dsi->dev;
> +	int err;
> +
> +	boe->avdd = devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(boe->avdd))
> +		return PTR_ERR(boe->avdd);
> +
> +	boe->avee = devm_regulator_get(dev, "avee");
> +	if (IS_ERR(boe->avee))
> +		return PTR_ERR(boe->avee);
> +
> +	boe->pp1800 = devm_regulator_get(dev, "pp1800");
> +	if (IS_ERR(boe->pp1800))
> +		return PTR_ERR(boe->pp1800);
> +
> +	boe->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(boe->enable_gpio)) {
> +		dev_err(dev, "cannot get reset-gpios %ld\n",
> +			PTR_ERR(boe->enable_gpio));
> +		return PTR_ERR(boe->enable_gpio);
> +	}
> +
> +	gpiod_set_value(boe->enable_gpio, 0);
> +
> +	err = drm_panel_of_backlight(&boe->base);
> +	if (err)
> +		return err;
From the descrition of drm_panel_of_backlight():

""
drm_panel_of_backlight() must be called after the call to drm_panel_init().
""

Please do as documented.

	Sam

> +
> +	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	boe->base.funcs = &boe_panel_funcs;
> +	boe->base.dev = &boe->dsi->dev;
> +
> +	return drm_panel_add(&boe->base);
> +}
> +
> +static int boe_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct boe_panel *boe;
> +	int ret;
> +	const struct panel_desc *desc;
> +
> +	boe = devm_kzalloc(&dsi->dev, sizeof(*boe), GFP_KERNEL);
> +	if (!boe)
> +		return -ENOMEM;
> +
> +	desc = of_device_get_match_data(&dsi->dev);
> +	dsi->lanes = desc->lanes;
> +	dsi->format = desc->format;
> +	dsi->mode_flags = desc->mode_flags;
> +	boe->desc = desc;
> +	boe->dsi = dsi;
> +	ret = boe_panel_add(boe);
> +	if (ret < 0)
> +		return ret;
> +
> +	mipi_dsi_set_drvdata(dsi, boe);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		drm_panel_remove(&boe->base);
> +
> +	return ret;
> +}
> +
> +static void boe_panel_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
> +
> +	drm_panel_disable(&boe->base);
> +	drm_panel_unprepare(&boe->base);
> +}
> +
> +static int boe_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	boe_panel_shutdown(dsi);
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> +
> +	if (boe->base.dev)
> +		drm_panel_remove(&boe->base);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id boe_of_match[] = {
> +	{ .compatible = "boe,tv101wum-nl6",
> +	  .data = &boe_tv101wum_nl6_desc
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, boe_of_match);
> +
> +static struct mipi_dsi_driver boe_panel_driver = {
> +	.driver = {
> +		.name = "panel-boe-tv101wum-nl6",
> +		.of_match_table = boe_of_match,
> +	},
> +	.probe = boe_panel_probe,
> +	.remove = boe_panel_remove,
> +	.shutdown = boe_panel_shutdown,
> +};
> +module_mipi_dsi_driver(boe_panel_driver);
> +
> +MODULE_AUTHOR("Jitao Shi <jitao.shi@mediatek.com>");
> +MODULE_DESCRIPTION("BOE tv101wum-nl6 1200x1920 video mode panel driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
