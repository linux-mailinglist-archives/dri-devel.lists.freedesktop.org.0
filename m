Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10F5738DD0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760F10E32A;
	Wed, 21 Jun 2023 17:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA32010E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 17:53:42 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qC21Q-0003sT-J1; Wed, 21 Jun 2023 19:53:36 +0200
Message-ID: <ba41b807e3af0a1cabb9ba203a401f41254cea1e.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <18949883232@163.com>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 19:53:34 +0200
In-Reply-To: <02c16e9b-0eca-caf4-b80c-53f1c7eab4e9@loongson.cn>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <2249b895-84b9-adea-531b-bf190e9c866f@loongson.cn>
 <030d44e2753b9b2eea0107cdee6c20e2bc2d3efe.camel@pengutronix.de>
 <3911d448-5613-23a8-cfcb-5ae418677338@loongson.cn>
 <87deb46db35b028da74c94f5496b721e14db4745.camel@pengutronix.de>
 <02c16e9b-0eca-caf4-b80c-53f1c7eab4e9@loongson.cn>
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

Am Donnerstag, dem 22.06.2023 um 01:31 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
> On 2023/6/22 00:07, Lucas Stach wrote:
> > And as the HW guarantees it on your platform, your platform
> > implementation makes this function effectively a no-op. Skipping the
> > call to this function is breaking the DMA API abstraction, as now the
> > driver is second guessing the DMA API implementation. I really see no
> > reason to do this.
>=20
> It is the same reason you chose the word 'effectively', not 'difinitely'.
>=20
> We don't want waste the CPU's time,
>=20
>=20
>  =C2=A0to running the dma_sync_sg_for_cpu funcion() function
>=20
>=20
> ```
>=20
> void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 int nelems, enu=
m dma_data_direction dir)
> {
>  =C2=A0=C2=A0 =C2=A0const struct dma_map_ops *ops =3D get_dma_ops(dev);
>=20
>  =C2=A0=C2=A0 =C2=A0BUG_ON(!valid_dma_direction(dir));
>  =C2=A0=C2=A0 =C2=A0if (dma_map_direct(dev, ops))
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 dma_direct_sync_sg_for_cpu(dev, sg=
, nelems, dir);
>  =C2=A0=C2=A0 =C2=A0else if (ops->sync_sg_for_cpu)
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ops->sync_sg_for_cpu(dev, sg, nele=
ms, dir);
>  =C2=A0=C2=A0 =C2=A0debug_dma_sync_sg_for_cpu(dev, sg, nelems, dir);
> }
>=20
> ```
>=20
>=20
>  =C2=A0to running the this:
>=20
>=20
> ```
>=20
> int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
> {
>  =C2=A0=C2=A0 =C2=A0struct drm_device *dev =3D obj->dev;
>  =C2=A0=C2=A0 =C2=A0struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv=
_bo(obj);
>  =C2=A0=C2=A0 =C2=A0struct etnaviv_drm_private *priv =3D dev->dev_private=
;
>=20
>  =C2=A0=C2=A0 =C2=A0if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_=
BO_CACHED) {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 /* fini without a prep is almost c=
ertainly a userspace error */
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(etnaviv_obj->last_cpu_prep=
_op =3D=3D 0);
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 dma_sync_sgtable_for_device(dev->d=
ev, etnaviv_obj->sgt,
> etnaviv_op_to_dma_dir(etnaviv_obj->last_cpu_prep_op));
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 etnaviv_obj->last_cpu_prep_op =3D =
0;
>  =C2=A0=C2=A0 =C2=A0}
>=20
>  =C2=A0=C2=A0 =C2=A0return 0;
> }
>=20
> ```
>=20
My judgment as the maintainer of this driver is that the small CPU
overhead of calling this function is very well worth it, if the
alternative is breaking the DMA API abstractions.

>=20
> But, this is acceptable, because we can kill the GEM_CPU_PREP and=20
> GEM_CPU_FINI ioctl entirely
>=20
> at userspace for cached buffer, as this is totally not needed for cached=
=20
> mapping on our platform.
>=20
And that statement isn't true either. The CPU_PREP/FINI ioctls also
provide fence synchronization between CPU and GPU. There are a few very
specific cases where skipping those ioctls is acceptable (mostly when
the userspace driver explicitly wants unsynchronized access), but in
most cases they are required for correctness.

Regards,
Lucas
