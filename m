Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ABA757652
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B011110E2EB;
	Tue, 18 Jul 2023 08:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B84310E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:12:42 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qLfos-0000Xm-7H; Tue, 18 Jul 2023 10:12:30 +0200
Message-ID: <ee96ed1a1ff12656f6e6542ae928fb526a9758fe.camel@pengutronix.de>
Subject: Re: [PATCH v1 3/8] drm/etnaviv: Drop the second argument of the
 etnaviv_gem_new_impl()
From: Lucas Stach <l.stach@pengutronix.de>
To: suijingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <sui.jingfeng@linux.dev>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Jul 2023 10:12:25 +0200
In-Reply-To: <e3a05204-61fe-2318-5f06-fd12addfe2e9@loongson.cn>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-4-sui.jingfeng@linux.dev>
 <862358e67a6f118b11ba16fb94828e9d1635cb66.camel@pengutronix.de>
 <e3a05204-61fe-2318-5f06-fd12addfe2e9@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingfeng,

Am Dienstag, dem 18.07.2023 um 02:34 +0800 schrieb suijingfeng:
> Hi,=C2=A0 Lucas
>=20
>=20
> Thanks for you guidance!
>=20
>=20
> On 2023/7/17 17:51, Lucas Stach wrote:
> > Hi Jingfeng,
> >=20
> > Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
> > > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > >=20
> > > Because it is not used by the etnaviv_gem_new_impl() function,
> > > no functional change.
> > >=20
> > I think it would make sense to move into the opposite direction: in
> > both callsites of etnaviv_gem_new_impl we immediately call
> > drm_gem_object_init with the size.
>=20
> Really?
>=20
> But there are multiple call path to the etnaviv_gem_new_impl() function.
>=20
>=20
> Code path 1 (PRIME):
>=20
> > - etnaviv_gem_prime_import_sg_table()
>=20
> > --=C2=A0 etnaviv_gem_new_private()
>=20
> > --- etnaviv_gem_new_impl(dev, size, flags, ops, &obj)
>=20
> > --- drm_gem_private_object_init(dev, obj, size)
>=20
>=20
> Code path 2 (USERPTR):
>=20
> > - etnaviv_gem_new_userptr()
>=20
> > --=C2=A0 etnaviv_gem_new_private()
>=20
> > --- etnaviv_gem_new_impl(dev, size, flags, ops, &obj)
>=20
> > --- drm_gem_private_object_init(dev, obj, size)
>=20
>=20
> Code path 3 (construct a GEM buffer object for the user-space):
>=20
> > - etnaviv_ioctl_gem_new()
>=20
> > -- etnaviv_gem_new_handle()
>=20
> > --- etnaviv_gem_new_impl(dev, size, flags, &etnaviv_gem_shmem_ops, &obj=
);
>=20
> > ---=C2=A0 drm_gem_object_init(dev, obj, size);
>=20
>=20
> If I understand this correctly:
>=20
>=20
> Code path 1 is for cross device (and cross driver) buffer-sharing,
>=20
> Code path 2 is going to share the buffer the userspace,
>=20
>=20
> *Only* the code path 3 is to construct a GEM buffer object for the=20
> user-space the userspace,
>=20
> that is say, *only* the code path 3 need to do the backing memory=20
> allocation work for the userspace.
>=20
> thus it need to call drm_gem_object_init() function, which really the=20
> shmem do the backing memory
>=20
> allocation.
>=20
>=20
> The code path 1 and the code path 2 do not need the kernel space=20
> allocate the backing memory.
>=20
> Because they are going to share the buffer already allocated by others.
>=20
> thus, code path 2 and code path 3 should call drm_gem_private_object_init=
(),
>=20
> *not* the drm_gem_object_init() function.
>=20
>=20
> When import buffer from the a specific KMS driver,
>=20
> then etnaviv_gem_prime_import_sg_table() will be called.
>=20
>=20
> I guess you means that drm_gem_private_object_init() (not the=20
> drm_gem_object_init() function)here ?
>=20
>=20
> > A better cleanup would be to make
> > use of the size parameter and move this object init call into
> > etnaviv_gem_new_impl.
>=20
> If I following you guidance, how do I differentiate the cases
>=20
> when to call drm_gem_private_object_init() not drm_gem_object_init() ?
>=20
> and when call drm_gem_object_init() not drm_gem_private_object_init()?
>=20
>=20
> I don't think you are right here.
>=20
Yes, clearly I was not taking into account the differences between
drm_gem_private_object_init and drm_gem_object_init properly. Please
disregard my comment, this patch is good as-is.

Regards,
Lucas

> >=20
> > Regards,
> > Lucas
> >=20
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > > ---
> > >   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 +++----
> > >   1 file changed, 3 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/=
etnaviv/etnaviv_gem.c
> > > index b5f73502e3dd..be2f459c66b5 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > @@ -542,7 +542,7 @@ static const struct drm_gem_object_funcs etnaviv_=
gem_object_funcs =3D {
> > >   	.vm_ops =3D &vm_ops,
> > >   };
> > >  =20
> > > -static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u3=
2 flags,
> > > +static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
> > >   	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
> > >   {
> > >   	struct etnaviv_gem_object *etnaviv_obj;
> > > @@ -591,8 +591,7 @@ int etnaviv_gem_new_handle(struct drm_device *dev=
, struct drm_file *file,
> > >  =20
> > >   	size =3D PAGE_ALIGN(size);
> > >  =20
> > > -	ret =3D etnaviv_gem_new_impl(dev, size, flags,
> > > -				   &etnaviv_gem_shmem_ops, &obj);
> > > +	ret =3D etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &o=
bj);
> > >   	if (ret)
> > >   		goto fail;
> > >  =20
> > > @@ -627,7 +626,7 @@ int etnaviv_gem_new_private(struct drm_device *de=
v, size_t size, u32 flags,
> > >   	struct drm_gem_object *obj;
> > >   	int ret;
> > >  =20
> > > -	ret =3D etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
> > > +	ret =3D etnaviv_gem_new_impl(dev, flags, ops, &obj);
> > >   	if (ret)
> > >   		return ret;
> > >  =20
>=20

