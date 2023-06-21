Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8F3737F84
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 12:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7928979D;
	Wed, 21 Jun 2023 10:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688858979D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 10:23:45 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qBuzx-0005ua-T0; Wed, 21 Jun 2023 12:23:37 +0200
Message-ID: <6d287bbb1733814009dfeb7d48f08cb6f44dc56c.camel@pengutronix.de>
Subject: Re: [PATCH v10 03/11] drm/etnaviv: Add dedicated functions to
 create and destroy platform device
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <18949883232@163.com>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 12:23:35 +0200
In-Reply-To: <1c7596fd-7e63-6719-2574-7d7820687832@loongson.cn>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-4-18949883232@163.com>
 <0daa7182d6600a24988d1c81cf8fe3c0c9487f52.camel@pengutronix.de>
 <1c7596fd-7e63-6719-2574-7d7820687832@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 21.06.2023 um 17:49 +0800 schrieb Sui Jingfeng:
> Hi
>=20
> On 2023/6/21 17:15, Lucas Stach wrote:
> > Am Dienstag, dem 20.06.2023 um 17:47 +0800 schrieb Sui Jingfeng:
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > >=20
> > > Also rename the virtual master platform device as etnaviv_platform_de=
vice,
> > > for better reflection that it is a platform device, not a DRM device.
> > >=20
> > > Another benefit is that we no longer need to call of_node_put() for t=
hree
> > > different cases, Instead, we only need to call it once.
> > >=20
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > ---
> > >   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 56 +++++++++++++++++++-----=
---
> > >   1 file changed, 39 insertions(+), 17 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/=
etnaviv/etnaviv_drv.c
> > > index 31a7f59ccb49..cec005035d0e 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > > @@ -656,12 +656,44 @@ static struct platform_driver etnaviv_platform_=
driver =3D {
> > >   	},
> > >   };
> > >  =20
> > > -static struct platform_device *etnaviv_drm;
> > > +static struct platform_device *etnaviv_platform_device;
> > >  =20
> > > -static int __init etnaviv_init(void)
> > > +static int etnaviv_create_platform_device(const char *name,
> > > +					  struct platform_device **ppdev)
> > As the platform device is a global static variable, there is no need to
> > push it through the parameters of this function. Just use the global
> > variable directly in this function.
>=20
> A function reference a global static variable is *NOT* a *pure* fucntion,
>=20
That's right, but all you do with those indirections through the
parameter list is move which of the functions is non-pure, in your case
it's etnaviv_init/etnaviv_exit, with the indirection dropped it's
etnaviv_create_platform_device/etnaviv_destroy_platform_device.

> it degenerate as a procedure,
>=20
>=20
> The function is perfect in the sense that it does not reference any=20
> global variable.
>=20
>=20
> etnaviv_create_platform_device() is NOT intended to used by one function,
>=20
> a specific purpose only, but when create this function, I want to create =
other
>=20
> platform device with this function.
>=20
> Say, You want to create a dummy platform device, targeting to bind to the=
 real master
>=20
> (the single GPU core) . To verify the idea that we choose the first 3D gp=
u core as master,
>=20
> other 2D or VG gpu core is not as important as the 3D one.
>=20
> The should bind to the 3D GPU core (master).
>=20
Sorry, I'm not following what you are trying to tell me here. Could you
please rephrase?

>=20
> While back to the question you ask, I want etnaviv_create_platform_device=
() to be generic,
>=20
> can be used by multiple place for multiple purpose.
>=20
> I have successfully copy this to a another drm driver by simply renaming.
>=20
> The body of the function itself does not need to change.

But it isn't shared, in this compilation unit this function is specific
to the etnaviv driver and I don't see why we shouldn't have etnaviv
specifics in there if it makes the code of this driver easier to
follow.

Regards,
Lucas

>=20
> > >   {
> > >   	struct platform_device *pdev;
> > >   	int ret;
> > > +
> > > +	pdev =3D platform_device_alloc(name, PLATFORM_DEVID_NONE);
> > > +	if (!pdev)
> > > +		return -ENOMEM;
> > > +
> > > +	ret =3D platform_device_add(pdev);
> > > +	if (ret) {
> > > +		platform_device_put(pdev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	*ppdev =3D pdev;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void etnaviv_destroy_platform_device(struct platform_device *=
*ppdev)
> > > +{
> > > +	struct platform_device *pdev =3D *ppdev;
> > Same here, just use the global variable directly.
> >=20
> > Regards,
> > Lucas
> >=20
> > > +
> > > +	if (!pdev)
> > > +		return;
> > > +
> > > +	platform_device_unregister(pdev);
> > > +
> > > +	*ppdev =3D NULL;
> > > +}
> > > +
> > > +static int __init etnaviv_init(void)
> > > +{
> > > +	int ret;
> > >   	struct device_node *np;
> > >  =20
> > >   	etnaviv_validate_init();
> > > @@ -681,23 +713,13 @@ static int __init etnaviv_init(void)
> > >   	for_each_compatible_node(np, NULL, "vivante,gc") {
> > >   		if (!of_device_is_available(np))
> > >   			continue;
> > > +		of_node_put(np);
> > >  =20
> > > -		pdev =3D platform_device_alloc("etnaviv", PLATFORM_DEVID_NONE);
> > > -		if (!pdev) {
> > > -			ret =3D -ENOMEM;
> > > -			of_node_put(np);
> > > -			goto unregister_platform_driver;
> > > -		}
> > > -
> > > -		ret =3D platform_device_add(pdev);
> > > -		if (ret) {
> > > -			platform_device_put(pdev);
> > > -			of_node_put(np);
> > > +		ret =3D etnaviv_create_platform_device("etnaviv",
> > > +						     &etnaviv_platform_device);
> > > +		if (ret)
> > >   			goto unregister_platform_driver;
> > > -		}
> > >  =20
> > > -		etnaviv_drm =3D pdev;
> > > -		of_node_put(np);
> > >   		break;
> > >   	}
> > >  =20
> > > @@ -713,7 +735,7 @@ module_init(etnaviv_init);
> > >  =20
> > >   static void __exit etnaviv_exit(void)
> > >   {
> > > -	platform_device_unregister(etnaviv_drm);
> > > +	etnaviv_destroy_platform_device(&etnaviv_platform_device);
> > >   	platform_driver_unregister(&etnaviv_platform_driver);
> > >   	platform_driver_unregister(&etnaviv_gpu_driver);
> > >   }
>=20

