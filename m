Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB202450D1
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 12:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A56E6E177;
	Sat, 15 Aug 2020 10:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3166E177
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 10:02:36 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 86FA780539;
 Sat, 15 Aug 2020 12:02:31 +0200 (CEST)
Date: Sat, 15 Aug 2020 12:02:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 3/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200815100230.GA1002374@ravnborg.org>
References: <cover.1597412076.git.agx@sigxcpu.org>
 <0a7539135cc46eec5636ca89f52695f4a1197841.1597412076.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a7539135cc46eec5636ca89f52695f4a1197841.1597412076.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8 a=e5mUnYsNAAAA:8
 a=2VR2e5HfQ1QhP8mth8gA:9 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido.

> +static int mantix_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev =3D &dsi->dev;
> +	struct mantix *ctx;
> +	int ret;
> +
> +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dev =3D dev;
> +
> +	dsi->lanes =3D 4;
> +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> +		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +	ctx->avdd =3D devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(ctx->avdd)) {
> +		ret =3D PTR_ERR(ctx->avdd);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request avdd regulator: %d\n",
> +				      ret);
> +		return ret;
> +	}

Consider to use the recently added dev_err_probe() here and below.
Note: Not part of drm-misc-next yet - but hopefully after -rc1
when a backmerge is done.

	Sam

> +	ctx->avee =3D devm_regulator_get(dev, "avee");
> +	if (IS_ERR(ctx->avee)) {
> +		ret =3D PTR_ERR(ctx->avee);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request avee regulator: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +	ctx->vddi =3D devm_regulator_get(dev, "vddi");
> +	if (IS_ERR(ctx->vddi)) {
> +		ret =3D PTR_ERR(ctx->vddi);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "Failed to request vddi regulator: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &mantix_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret =3D drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +	drm_panel_add(&ctx->panel);
> +
> +	ret =3D mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev,
> +			      "mipi_dsi_attach failed (%d). Is host ready?\n",
> +			      ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
> +		     default_mode.hdisplay, default_mode.vdisplay,
> +		     drm_mode_vrefresh(&default_mode),
> +		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
> +
> +	return 0;
> +}
> +
> +static void mantix_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct mantix *ctx =3D mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret =3D drm_panel_unprepare(&ctx->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to unprepare panel: %d\n",
> +			      ret);
> +
> +	ret =3D drm_panel_disable(&ctx->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to disable panel: %d\n",
> +			      ret);
> +}
> +
> +static int mantix_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct mantix *ctx =3D mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	mantix_shutdown(dsi);
> +
> +	ret =3D mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(&dsi->dev, "Failed to detach from DSI host: %d\n",
> +			      ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mantix_of_match[] =3D {
> +	{ .compatible =3D "mantix,mlaf057we51-x" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mantix_of_match);
> +
> +static struct mipi_dsi_driver mantix_driver =3D {
> +	.probe	=3D mantix_probe,
> +	.remove =3D mantix_remove,
> +	.shutdown =3D mantix_shutdown,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.of_match_table =3D mantix_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(mantix_driver);
> +
> +MODULE_AUTHOR("Guido G=FCnther <agx@sigxcpu.org>");
> +MODULE_DESCRIPTION("DRM driver for Mantix MLAF057WE51-X MIPI DSI panel");
> +MODULE_LICENSE("GPL v2");
> -- =

> 2.26.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
