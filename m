Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA298CF23
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65A710E145;
	Wed,  2 Oct 2024 08:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6DA10E145
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:44:51 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svuyO-0002Bs-80; Wed, 02 Oct 2024 10:44:40 +0200
Message-ID: <8a82131892480a6769b70a931107af09ee20acf8.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Print error message if inserting IOVA
 address range fails
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 02 Oct 2024 10:44:38 +0200
In-Reply-To: <46c64cf0-4cd5-4b6f-a224-ffe4bac5bb7a@linux.dev>
References: <20240930221706.399139-1-sui.jingfeng@linux.dev>
 <ca5e444a22bae0a834a673e41e8d5b93c08f2351.camel@pengutronix.de>
 <46c64cf0-4cd5-4b6f-a224-ffe4bac5bb7a@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 02.10.2024 um 03:26 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
> On 2024/10/1 16:27, Lucas Stach wrote:
> > Hi Sui,
> >=20
> > Am Dienstag, dem 01.10.2024 um 06:17 +0800 schrieb Sui Jingfeng:
> > > Etnaviv assumes that GPU page size is 4KiB, yet on some systems, the =
CPU
> > > page size is 16 KiB. The size of etnaviv buffer objects will be align=
ed
> > > to CPU page size on kernel side, however, userspace still assumes the
> > > page size is 4KiB and doing allocation with 4KiB page as unit. This
> > > results in softpin(userspace managed per-process address spaces) fail=
s.
> > > Because kernel side BO takes up bigger address space than user space
> > > assumes whenever the size of a BO is not CPU page size aligned.
> > >=20
> > Seems we need to track the GPU and CPU allocation sizes separately.
>=20
>=20
> The idea is cool and fancy, I have been tried.
>=20
> By adding a 'user_size' member into the struct etnaviv_gem_object,
> and use this 'user_size'; to track the actual size that user-space
> thing of. (or in other words, the actual size that potential user
> allow to use)
>=20
> Using 'user_size' is pin, this partly solve VA address space collision
> under softpin fashion. This is partly works under my hasty test. But ...
>=20
> > Userspace is correct in assuming that the GPU page size is 4K and
> > buffers are aligned to this granule.
>=20
>=20
> Vivante GPU support 4KB and 64KB GPU page size.
>=20
64k is very impractical, as it can't really be mixed freely with 4k
page size. If we ever going to support this, then it will be exposed
via a userspace queryable param, so userspace will know when we need
bigger alignment.

>=20
> >   There should be no need to waste GPU VA space
>=20
>=20
> We have nearly 4GBGPU VA space, As far as I can see it, we only use a few=
. So, is it true=20
> that we are wealthy about the VA space?
>=20
Those GPUs are used within systems that support more physical memory
than that. Especially the machines that are using larger page sizes on
the CPU are likely to support more physical memory than 4GB. I don't
see a reason why we should waste GPU VA space when we can avoid it.

It's true that workloads you would run on a GC1000 are unlikely to use
more than a fraction of the GPU VA space, but I can easily see more
capable GPU cores with compute capabilities running up against the GPU
VA space limit.

>=20
> > just because the CPU page size is larger than that and we
> > need to overallocate buffers to suit the CPU.
>=20
>=20
> A single CPU page share the same caching property, therefore, I image tha=
t
> asingle VA address  range at least should occupy entire room of a single =
CPU
> page.
>=20
> Otherwise, it possible that 4 GPUVA share a single CPU page.
> if each GPUVA  mapped with a different caching property from others.
> This get coherency requirements involved.
>=20
That won't happen. We still allocate the whole 16k page for a BO, so no
other BO with different caching flags can share the same CPU page. We
just don't map the whole page to the GPU side.

Regards,
Lucas

>=20
> > > Insert an error message to help debug when such an issue happen.
> > >=20
> > > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> > > ---
> > > For example, when running glmark2-drm:
> > >=20
> > > [kernel space debug log]
> > >=20
> > >   etnaviv 0000:03:00.0: Insert bo failed, va: fd38b000, size: 4000
> > >   etnaviv 0000:03:00.0: Insert bo failed, va: fd38a000, size: 4000
> > >=20
> > > [user space debug log]
> > >=20
> > > bo->va =3D 0xfd48c000, bo->size=3D100000
> > > bo->va =3D 0xfd38c000, bo->size=3D100000
> > > bo->va =3D 0xfd38b000, bo->size=3D1000   <-- Insert IOVA fails starte=
d at here.
> > > bo->va =3D 0xfd38a000, bo->size=3D1000
> > > bo->va =3D 0xfd389000, bo->size=3D1000
> > >=20
> > > [texture] texture-filter=3Dnearest:MESA: error: etna_cmd_stream_flush=
:238: submit failed: -28 (No space left on device)
> > > ---
> > >   drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/=
etnaviv/etnaviv_mmu.c
> > > index 1661d589bf3e..682f27b27d59 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > > @@ -310,8 +310,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_c=
ontext *context,
> > >   	else
> > >   		ret =3D etnaviv_iommu_find_iova(context, node,
> > >   					      etnaviv_obj->base.size);
> > > -	if (ret < 0)
> > > +	if (ret < 0) {
> > > +		dev_err(context->global->dev,
> > > +			"Insert iova failed, va: %llx, size: %zx\n",
> > > +			va, etnaviv_obj->base.size);
> > As this might happen for a lot of buffers in a single submit and
> > userspace might be unimpressed by the submit failure and keep pushing
> > new submits, this has a potential to spam the logs. Please use
> > dev_err_ratelimited. Other than that, this patch looks good.
> >=20
> > Regards,
> > Lucas
> >=20
> > >   		goto unlock;
> > > +	}
> > >  =20
> > >   	mapping->iova =3D node->start;
> > >   	ret =3D etnaviv_iommu_map(context, node->start, sgt,
>=20

