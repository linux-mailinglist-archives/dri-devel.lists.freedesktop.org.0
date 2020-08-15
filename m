Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F024516E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 18:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D380F6E3B8;
	Sat, 15 Aug 2020 16:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506E66E3B8
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 16:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 609DCFB04;
 Sat, 15 Aug 2020 18:26:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdXwEJTZCE2k; Sat, 15 Aug 2020 18:25:59 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id AD998457CD; Sat, 15 Aug 2020 18:25:58 +0200 (CEST)
Date: Sat, 15 Aug 2020 18:25:58 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200815162558.GA2744@bogon.m.sigxcpu.org>
References: <cover.1597412076.git.agx@sigxcpu.org>
 <0a7539135cc46eec5636ca89f52695f4a1197841.1597412076.git.agx@sigxcpu.org>
 <20200815100230.GA1002374@ravnborg.org>
 <20200815104022.GA5641@bogon.m.sigxcpu.org>
 <20200815104651.GA1005928@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815104651.GA1005928@ravnborg.org>
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

Hi,
On Sat, Aug 15, 2020 at 12:46:51PM +0200, Sam Ravnborg wrote:
> On Sat, Aug 15, 2020 at 12:40:22PM +0200, Guido G=FCnther wrote:
> > Hi Sam,
> > On Sat, Aug 15, 2020 at 12:02:30PM +0200, Sam Ravnborg wrote:
> > > Hi Guido.
> > > =

> > > > +static int mantix_probe(struct mipi_dsi_device *dsi)
> > > > +{
> > > > +	struct device *dev =3D &dsi->dev;
> > > > +	struct mantix *ctx;
> > > > +	int ret;
> > > > +
> > > > +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > > > +	if (!ctx)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > > +	if (IS_ERR(ctx->reset_gpio)) {
> > > > +		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
> > > > +		return PTR_ERR(ctx->reset_gpio);
> > > > +	}
> > > > +
> > > > +	mipi_dsi_set_drvdata(dsi, ctx);
> > > > +	ctx->dev =3D dev;
> > > > +
> > > > +	dsi->lanes =3D 4;
> > > > +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> > > > +	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> > > > +		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> > > > +
> > > > +	ctx->avdd =3D devm_regulator_get(dev, "avdd");
> > > > +	if (IS_ERR(ctx->avdd)) {
> > > > +		ret =3D PTR_ERR(ctx->avdd);
> > > > +		if (ret !=3D -EPROBE_DEFER)
> > > > +			DRM_DEV_ERROR(dev,
> > > > +				      "Failed to request avdd regulator: %d\n",
> > > > +				      ret);
> > > > +		return ret;
> > > > +	}
> > > =

> > > Consider to use the recently added dev_err_probe() here and below.
> > > Note: Not part of drm-misc-next yet - but hopefully after -rc1
> > > when a backmerge is done.
> > =

> > In fact I did decided against it since i was told that missing dev_* and
> > DRM_* logging shouldn't be done. So is that o.k. nowadays?
> s/missing/mixing/
> =

> I often request that logging is consistent - so I recognize the
> argument.
> =

> For panel/* I have not made up my mind what I think is the best
> approach. The DRM_DEV_* and DRM_* logging do not add much value.
> So I have been tempted several times to convert all logging in
> panel/ to dev_* and pr_* (when no struct device * is available).
> That would also avoid that we mix up logging.
> =

> We have drm_* logging - but they require a valid drm_device * which we
> do not have in the the panel drivers. So they are ruled out here.
> =

> Do you have any opinions/comments on this?

I think for panel drivers DRM_* does not give any bonus so moving to
{dev,pr}_* sounds good. I just wonder if other drm parts don't need
`dev_drm_err_probe()` (or similar) anyway. But then maybe dyn_debug
is enough nowadays to not need DRM_DEV_DEBUG_* either?
Cheers,
 -- Guido

> =

> 	Sam
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
