Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB607738A76
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0271C10E16C;
	Wed, 21 Jun 2023 16:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE7310E16C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:07:45 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qC0Mr-0006r6-MP; Wed, 21 Jun 2023 18:07:37 +0200
Message-ID: <87deb46db35b028da74c94f5496b721e14db4745.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <18949883232@163.com>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 18:07:36 +0200
In-Reply-To: <3911d448-5613-23a8-cfcb-5ae418677338@loongson.cn>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <2249b895-84b9-adea-531b-bf190e9c866f@loongson.cn>
 <030d44e2753b9b2eea0107cdee6c20e2bc2d3efe.camel@pengutronix.de>
 <3911d448-5613-23a8-cfcb-5ae418677338@loongson.cn>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 21.06.2023 um 23:54 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
> On 2023/6/21 23:33, Lucas Stach wrote:
> > Am Mittwoch, dem 21.06.2023 um 23:00 +0800 schrieb Sui Jingfeng:
> > > On 2023/6/21 18:00, Lucas Stach wrote:
> > > > >    static inline enum dma_data_direction etnaviv_op_to_dma_dir(u3=
2 op)
> > > > > @@ -369,6 +381,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_objec=
t *obj, u32 op,
> > > > >    {
> > > > >    	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj)=
;
> > > > >    	struct drm_device *dev =3D obj->dev;
> > > > > +	struct etnaviv_drm_private *priv =3D dev->dev_private;
> > > > >    	bool write =3D !!(op & ETNA_PREP_WRITE);
> > > > >    	int ret;
> > > > >   =20
> > > > > @@ -395,7 +408,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_objec=
t *obj, u32 op,
> > > > >    			return ret =3D=3D 0 ? -ETIMEDOUT : ret;
> > > > >    	}
> > > > >   =20
> > > > > -	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
> > > > > +	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED)=
 {
> > > > Why do you need this? Isn't dma_sync_sgtable_for_cpu a no-op on you=
r
> > > > platform when the device is coherent?
> > > >=20
> > > I need this to show that our hardware is truly dma-coherent!
> > >=20
> > > I have tested that the driver still works like a charm without adding
> > > this code '!priv->dma_coherent'.
> > >=20
> > >=20
> > > But I'm expressing the idea that a truly dma-coherent just device don=
't
> > > need this.
> > >=20
> > > I don't care if it is a no-op.
> > >=20
> > > It is now, it may not in the future.
> > And that's exactly the point. If it ever turns into something more than
> > a no-op on your platform, then that's probably for a good reason and a
> > driver should not assume that it knows better than the DMA API
> > implementation what is or is not required on a specific platform to
> > make DMA work.
> >=20
> > > Even it is, the overhead of function call itself still get involved.
> > >=20
> > cpu_prep/fini aren't total fast paths, you already synchronized with
> > the GPU here, potentially waiting for jobs to finish, etc. If your
> > platform no-ops this then the function call will be in the noise.
> >  =20
> > > Also, we want to try flush the write buffer with the CPU manually.
> > >=20
> > >=20
> > > Currently, we want the absolute correctness in the concept,
> > >=20
> > > not only the rendering results.
> > And if you want absolute correctness then calling dma_sync_sgtable_* is
> > the right thing to do, as it can do much more than just manage caches.
>=20
> For our hardware, cached mapping don't need calling dma_sync_sgtable_*.
>=20
> This is the the right thing to do. The hardware already guarantee it for=
=20
> use.
>=20
And as the HW guarantees it on your platform, your platform
implementation makes this function effectively a no-op. Skipping the
call to this function is breaking the DMA API abstraction, as now the
driver is second guessing the DMA API implementation. I really see no
reason to do this.

>=20
> We may only want to call it for WC mapping BO,=C2=A0 please don't tangle =
all=20
> of this together.
>=20
> We simply want to do the right thing.
>=20
> > Right now it also provides SWIOTLB translation if needed.
>=20
> SWIOTLB introduce the bounce buffer, slower the performance.
>=20
> We don't need it. It should be avoid.

Sure. If your platform doesn't need it, that's totally fine. But you
can't guarantee that all platforms with coherent Vivante GPUs don't
need this. If it isn't needed the DMA API implementation will skip it
just fine at almost no cost, so the driver really shouldn't try to be
more clever than the platform DMA API implementation.

Regards,
Lucas
