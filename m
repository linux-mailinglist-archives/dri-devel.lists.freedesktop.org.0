Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816662450E1
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 12:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF0F6E0BC;
	Sat, 15 Aug 2020 10:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046356E0BC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 10:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id F0763FB03;
 Sat, 15 Aug 2020 12:40:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OX_34ocNZaCv; Sat, 15 Aug 2020 12:40:23 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 60AF4457CC; Sat, 15 Aug 2020 12:40:22 +0200 (CEST)
Date: Sat, 15 Aug 2020 12:40:22 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200815104022.GA5641@bogon.m.sigxcpu.org>
References: <cover.1597412076.git.agx@sigxcpu.org>
 <0a7539135cc46eec5636ca89f52695f4a1197841.1597412076.git.agx@sigxcpu.org>
 <20200815100230.GA1002374@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815100230.GA1002374@ravnborg.org>
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

Hi Sam,
On Sat, Aug 15, 2020 at 12:02:30PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> > +static int mantix_probe(struct mipi_dsi_device *dsi)
> > +{
> > +	struct device *dev =3D &dsi->dev;
> > +	struct mantix *ctx;
> > +	int ret;
> > +
> > +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(ctx->reset_gpio)) {
> > +		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
> > +		return PTR_ERR(ctx->reset_gpio);
> > +	}
> > +
> > +	mipi_dsi_set_drvdata(dsi, ctx);
> > +	ctx->dev =3D dev;
> > +
> > +	dsi->lanes =3D 4;
> > +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> > +		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> > +
> > +	ctx->avdd =3D devm_regulator_get(dev, "avdd");
> > +	if (IS_ERR(ctx->avdd)) {
> > +		ret =3D PTR_ERR(ctx->avdd);
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dev,
> > +				      "Failed to request avdd regulator: %d\n",
> > +				      ret);
> > +		return ret;
> > +	}
> =

> Consider to use the recently added dev_err_probe() here and below.
> Note: Not part of drm-misc-next yet - but hopefully after -rc1
> when a backmerge is done.

In fact I did decided against it since i was told that missing dev_* and
DRM_* logging shouldn't be done. So is that o.k. nowadays?
Cheers,
 -- Guido

> =

> 	Sam
> =

> > +	ctx->avee =3D devm_regulator_get(dev, "avee");
> > +	if (IS_ERR(ctx->avee)) {
> > +		ret =3D PTR_ERR(ctx->avee);
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dev,
> > +				      "Failed to request avee regulator: %d\n",
> > +				      ret);
> > +		return ret;
> > +	}
> > +	ctx->vddi =3D devm_regulator_get(dev, "vddi");
> > +	if (IS_ERR(ctx->vddi)) {
> > +		ret =3D PTR_ERR(ctx->vddi);
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dev,
> > +				      "Failed to request vddi regulator: %d\n",
> > +				      ret);
> > +		return ret;
> > +	}
> > +
> > +	drm_panel_init(&ctx->panel, dev, &mantix_drm_funcs,
> > +		       DRM_MODE_CONNECTOR_DSI);
> > +
> > +	ret =3D drm_panel_of_backlight(&ctx->panel);
> > +	if (ret)
> > +		return ret;
> > +	drm_panel_add(&ctx->panel);
> > +
> > +	ret =3D mipi_dsi_attach(dsi);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev,
> > +			      "mipi_dsi_attach failed (%d). Is host ready?\n",
> > +			      ret);
> > +		drm_panel_remove(&ctx->panel);
> > +		return ret;
> > +	}
> > +
> > +	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
> > +		     default_mode.hdisplay, default_mode.vdisplay,
> > +		     drm_mode_vrefresh(&default_mode),
> > +		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mantix_shutdown(struct mipi_dsi_device *dsi)
> > +{
> > +	struct mantix *ctx =3D mipi_dsi_get_drvdata(dsi);
> > +	int ret;
> > +
> > +	ret =3D drm_panel_unprepare(&ctx->panel);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(&dsi->dev, "Failed to unprepare panel: %d\n",
> > +			      ret);
> > +
> > +	ret =3D drm_panel_disable(&ctx->panel);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(&dsi->dev, "Failed to disable panel: %d\n",
> > +			      ret);
> > +}
> > +
> > +static int mantix_remove(struct mipi_dsi_device *dsi)
> > +{
> > +	struct mantix *ctx =3D mipi_dsi_get_drvdata(dsi);
> > +	int ret;
> > +
> > +	mantix_shutdown(dsi);
> > +
> > +	ret =3D mipi_dsi_detach(dsi);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(&dsi->dev, "Failed to detach from DSI host: %d\n",
> > +			      ret);
> > +
> > +	drm_panel_remove(&ctx->panel);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id mantix_of_match[] =3D {
> > +	{ .compatible =3D "mantix,mlaf057we51-x" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, mantix_of_match);
> > +
> > +static struct mipi_dsi_driver mantix_driver =3D {
> > +	.probe	=3D mantix_probe,
> > +	.remove =3D mantix_remove,
> > +	.shutdown =3D mantix_shutdown,
> > +	.driver =3D {
> > +		.name =3D DRV_NAME,
> > +		.of_match_table =3D mantix_of_match,
> > +	},
> > +};
> > +module_mipi_dsi_driver(mantix_driver);
> > +
> > +MODULE_AUTHOR("Guido G=FCnther <agx@sigxcpu.org>");
> > +MODULE_DESCRIPTION("DRM driver for Mantix MLAF057WE51-X MIPI DSI panel=
");
> > +MODULE_LICENSE("GPL v2");
> > -- =

> > 2.26.2
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
