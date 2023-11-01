Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10C7DE4D7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 17:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168B10E741;
	Wed,  1 Nov 2023 16:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EC510E741
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 16:50:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso2286166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698857411; x=1699462211; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeL4k8689m96l5Y4ms3ueSfun611lvzf6vVo9VUnw9g=;
 b=Fc0CrWTgRaA/xes0lgUT3BsKKXDGvPLnvPd0lxmabySZOmdXDR3pjVQ8w3vTUTXDvv
 cG+oSEoM+hlimW1eq4ECYkpGtViNx7CzT4Ze/hrl7JNdwqC4SwwOssoR1C2xUD/VKuLW
 aHcyTPX3SYQha2my3OERGzkIpqshyJvK0wKgifXDq89i+Ox71iLXGcfZJ/6VZwa9Qa+t
 MvEKfO8gj2YKw2u43m2JpQ/PGXcTd2K0ieiV1FGAcSlyV3gGBegTUqTqBeFIfkywhZ/2
 z/eTr7c1FzrgeOw/LzUGWlR/mX0IfT+9OzXs7O+x60NIfWwGDZYk4Pn8D3VBCx++PJbt
 DGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698857411; x=1699462211;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LeL4k8689m96l5Y4ms3ueSfun611lvzf6vVo9VUnw9g=;
 b=reZlCKsc/ZJ9RpPfyO+f8Enpxqm6gFuR/qSBgYFcmJmL+kaSSzfAZeGY3nCqKTK486
 GJnUmSy30ItqLzKz0cSyR81kbzcygtYqAZnXvPBPac/j5q2MGE0hERC0C+opeb7Is6Lw
 2hmfWtk014HP6t0FfAU55J9vvifgPg0vi/ezxCfejAsbmK/uM7BSomEqhAjEVWn096X8
 PFa9CImZuvQdXvBbokg6gvoei9ItxcExkfro7EZLzAFLnvTnVvWaf1yTEjSTIggkuHS3
 GvTBPHT22i8RxC195qlhHbWbQdGkMvZv8p8AIQ0RiOfEuxnsdHYcAOOozcY015M17lg7
 N+Pg==
X-Gm-Message-State: AOJu0YyfYer+a7YfwzwOu5/Gw4HtSRfpBJ3MA1CDDgy9ImqpefYns+KK
 tjz71XT7UYeiDSerdugCwGs=
X-Google-Smtp-Source: AGHT+IEzNJlj3njEpQ05m3lSiJ0Hxu6OgY2H/VIIqTbfltvKMwc9SdIzP6dHFJ4m+vh0ksnIDovDFA==
X-Received: by 2002:a17:906:fe41:b0:9ad:f60c:7287 with SMTP id
 wz1-20020a170906fe4100b009adf60c7287mr2445108ejb.28.1698857411190; 
 Wed, 01 Nov 2023 09:50:11 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170906560700b0099cc36c4681sm126524ejq.157.2023.11.01.09.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 09:50:10 -0700 (PDT)
Date: Wed, 1 Nov 2023 17:50:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] fbdev/simplefb: Add support for generic power-domains
Message-ID: <ZUKBwZ3axCKQDXfz@orome.fritz.box>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
 <20231011143809.1108034-3-thierry.reding@gmail.com>
 <0bc4aac4-817a-4a6d-8e7c-d19269c47a40@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+/xFpIUyBUk/gF1c"
Content-Disposition: inline
In-Reply-To: <0bc4aac4-817a-4a6d-8e7c-d19269c47a40@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: Helge Deller <deller@gmx.de>, Robert Foss <rfoss@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+/xFpIUyBUk/gF1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 02:50:27PM +0200, Hans de Goede wrote:
> Hi,
>=20
> Thank you for your patches.
>=20
> On 10/11/23 16:38, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The simple-framebuffer device tree bindings document the power-domains
> > property, so make sure that simplefb supports it. This ensures that the
> > power domains remain enabled as long as simplefb is active.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/video/fbdev/simplefb.c | 93 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 91 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simpl=
efb.c
> > index 18025f34fde7..e69fb0ad2d54 100644
> > --- a/drivers/video/fbdev/simplefb.c
> > +++ b/drivers/video/fbdev/simplefb.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/of_clk.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/parser.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/regulator/consumer.h>
> > =20
> >  static const struct fb_fix_screeninfo simplefb_fix =3D {
> > @@ -78,6 +79,11 @@ struct simplefb_par {
> >  	unsigned int clk_count;
> >  	struct clk **clks;
> >  #endif
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +	unsigned int num_genpds;
> > +	struct device **genpds;
> > +	struct device_link **genpd_links;
> > +#endif
> >  #if defined CONFIG_OF && defined CONFIG_REGULATOR
> >  	bool regulators_enabled;
> >  	u32 regulator_count;
> > @@ -432,6 +438,83 @@ static void simplefb_regulators_enable(struct simp=
lefb_par *par,
> >  static void simplefb_regulators_destroy(struct simplefb_par *par) { }
> >  #endif
> > =20
> > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > +static void simplefb_detach_genpds(void *res)
> > +{
> > +	struct simplefb_par *par =3D res;
> > +	unsigned int i =3D par->num_genpds;
> > +
> > +	if (par->num_genpds <=3D 1)
> > +		return;
> > +
> > +	while (i--) {
> > +		if (par->genpd_links[i])
> > +			device_link_del(par->genpd_links[i]);
> > +
> > +		if (!IS_ERR_OR_NULL(par->genpds[i]))
> > +			dev_pm_domain_detach(par->genpds[i], true);
> > +	}
>=20
> Using this i-- construct means that genpd at index 0 will
> not be cleaned up.

This is actually a common variant to clean up in reverse order. You'll
find this used a lot in core code and so on. It has the advantage that
you can use it to unwind (not the case here) because i will already be
set to the right value, typically. It's also nice because it works for
unsigned integers.

Note that this uses the postfix decrement, so evaluation happens before
the decrement and therefore the last iteration of the loop will run with
i =3D=3D 0. For unsigned integers this also means that after the loop the
variable will actually have wrapped around, but that's usually not a
problem since it isn't used after this point anymore.

> >  static int simplefb_probe(struct platform_device *pdev)
> >  {
> >  	int ret;
> > @@ -518,6 +601,10 @@ static int simplefb_probe(struct platform_device *=
pdev)
> >  	if (ret < 0)
> >  		goto error_clocks;
> > =20
> > +	ret =3D simplefb_attach_genpd(par, pdev);
> > +	if (ret < 0)
> > +		goto error_regulators;
> > +
> >  	simplefb_clocks_enable(par, pdev);
> >  	simplefb_regulators_enable(par, pdev);
> > =20
> > @@ -534,18 +621,20 @@ static int simplefb_probe(struct platform_device =
*pdev)
> >  	ret =3D devm_aperture_acquire_for_platform_device(pdev, par->base, pa=
r->size);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "Unable to acquire aperture: %d\n", ret);
> > -		goto error_regulators;
> > +		goto error_genpds;
>=20
> This is not necessary since simplefb_attach_genpd() ends with:
>=20
> 	devm_add_action_or_reset(dev, simplefb_detach_genpds, par)
>=20
> Which causes simplefb_detach_genpds() to run when probe() fails.

Yes, you're right. I've removed all these explicit cleanup paths since
they are not needed.

>=20
> >  	}
> >  	ret =3D register_framebuffer(info);
> >  	if (ret < 0) {
> >  		dev_err(&pdev->dev, "Unable to register simplefb: %d\n", ret);
> > -		goto error_regulators;
> > +		goto error_genpds;
> >  	}
> > =20
> >  	dev_info(&pdev->dev, "fb%d: simplefb registered!\n", info->node);
> > =20
> >  	return 0;
> > =20
> > +error_genpds:
> > +	simplefb_detach_genpds(par);
>=20
> As the kernel test robot (LKP) already pointed out this is causing
> compile errors when #if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DO=
MAINS
> evaluates as false.
>=20
> Since there is no simplefb_detach_genpds() stub in the #else, but as
> mentioned above this is not necessary so just remove it.

Yep, done.

Thanks,
Thierry

--+/xFpIUyBUk/gF1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVCgb4ACgkQ3SOs138+
s6EM3w/9FP7lqs9ZyGWbUDEYUymUwki1/1KqaUBA4DAQYrzllhGmvJSnNWSJz+p5
zjDxpvJ0tVhrwsVe5OHgluyWKLi5ck1QJVZOo9IyXObSBlx7Ecr0BtgTUxJda2MJ
YZ2nJemJVl2DCHKozdx/Raq8HK8wVE88jIkB6arXi8xRGjFBQ9IKvbelGP9YvI8i
VISMZYhPcKcvdotj0DrKQL4tcLL7XpM9Fup8Gt7CWPwjieH90PXf2EOgSlwqSYnX
V/HM3y9QVccQBhawXfmpvvKK80Ez+E8dPjjlsKhTEHG64ngqn7ulaVtVmdmgAYtu
LyKForoeboswYv/p+14n+O2ngEFt4FLNjYrMSCI7EcdMUADdpqgG03Fe4ex8ke/S
A13OQT4jXXaKecaSykJJYjE38LX1MQu+GxVotkxPD/k4urHV50XKuhk70Ai2I/dR
WI3tZysyPV5hXYltQdlz/h/wT901ApWCQZa2TLZmH4vjKHdMQJoqFYVQQnUvEKr9
Kaiv/8sVSNAMNvhYyfpmtInXhXEVGBgg50aWuOlhtnIx/M56ghmZ4BSb5tAhF6RW
8x6aAwwF5vLT7PUVFzI81hF40dWtq8GKWYwV85szjvW6dOoyKeEaouUbV+8FbEeV
VMdG5Dgi/XdnRmKUm2dbM9SltkUelVixE5baAymhLEyZiqXdRzw=
=pXpM
-----END PGP SIGNATURE-----

--+/xFpIUyBUk/gF1c--
