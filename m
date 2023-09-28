Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608697B1122
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 05:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B6810E021;
	Thu, 28 Sep 2023 03:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C06210E021;
 Thu, 28 Sep 2023 03:19:09 +0000 (UTC)
Received: from beaker.gfxstrand.net
 (2603-8080-2102-63d7-019e-342e-5881-a163.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:19e:342e:5881:a163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gfxstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AED7D66072B4;
 Thu, 28 Sep 2023 04:19:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695871147;
 bh=5BEscn0ws4QNDcrG5BtZVdJagVL1kgCG2aPdT960IP8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=GFiQsVKiM/cI4x5d0NxaafRppRDbgJnYa2RsfIKOrr0SK8pB45ElEk/eM3rabXyki
 VeiP8UdciUYeJxaPSVBYGSlq1Rgy3LFQt4/6QjgnIk5yG/76mbubqBPFZ9t4JOH7/r
 m5Ws965JBkJxweEsaP6Cf/15n70RE8eHQ6d9kt0MFUnJCKM8OrebA5KwTpDpKXbtlD
 7kbfE/rq90toCDRzvHcblCAXK/Jd7hDan4X9ZqSY3LiE+yxlPmH9x03exNW6wREFsb
 qsdyogRAXmS7zSaQOfSA9RhjHtKwpVTglD9pWtqzHLvGPlsknKdR96ZZexXhc5y9oc
 vNm4ZUQfvMR6g==
Message-ID: <d560fbac130608a78921d11688a85a9a299d92f6.camel@collabora.com>
Subject: Re: [PATCH 3/3] drm/nouveau: exec: report max pushs through getparam
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: Dave Airlie <airlied@gmail.com>
Date: Wed, 27 Sep 2023 22:19:01 -0500
In-Reply-To: <CAPM=9twT+Kvmyv2GxnZ=Y6FPnwc9xzTcWyeykL0rjGmOu4FONA@mail.gmail.com>
References: <20230927012303.23525-1-dakr@redhat.com>
 <20230927012303.23525-3-dakr@redhat.com>
 <75bef0bd769c139b647335ba2e3c341928442740.camel@collabora.com>
 <CAPM=9twT+Kvmyv2GxnZ=Y6FPnwc9xzTcWyeykL0rjGmOu4FONA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, kherbst@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-09-28 at 11:12 +1000, Dave Airlie wrote:
> On Thu, 28 Sept 2023 at 07:55, Faith Ekstrand
> <faith.ekstrand@collabora.com> wrote:
> >=20
> > On Wed, 2023-09-27 at 03:22 +0200, Danilo Krummrich wrote:
> > > Report the maximum number of IBs that can be pushed with a single
> > > DRM_IOCTL_NOUVEAU_EXEC through DRM_IOCTL_NOUVEAU_GETPARAM.
> > >=20
> > > While the maximum number of IBs per ring might vary between
> > > chipsets,
> > > the kernel will make sure that userspace can only push a fraction
> > > of
> > > the
> > > maximum number of IBs per ring per job, such that we avoid a
> > > situation
> > > where there's only a single job occupying the ring, which could
> > > potentially lead to the ring run dry.
> > >=20
> > > Using DRM_IOCTL_NOUVEAU_GETPARAM to report the maximum number of
> > > IBs
> > > that can be pushed with a single DRM_IOCTL_NOUVEAU_EXEC implies
> > > that
> > > all channels of a given device have the same ring size.
> >=20
> > There's a bunch of nouveau kernel details I don't know here but the
> > interface looks good and I prefer it to a #define in the header.
> >=20
> > Acked-by: Faith Ekstrand <faith.ekstrand@collabora.com>
>=20
> For the series
>=20
> Reviewed-by: Dave Airlie <airlied@redhat.com>
>=20
> we should probably land this in drm-misc-fixes, since it would be
> good
> to have in 6.6

Agreed.  My Mesa patch should handle both the case where we have the
getparam and when we don't.  However, I'd rather just make it part of
the new UAPI from the start and have a hard requirement on it since it
may reduce the current maximum in the header.

~Faith


> Dave.
>=20
> >=20
> >=20
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 19 ++++++++++++++++++=
+
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_chan.c=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_dma.h=C2=A0=C2=A0 |=C2=A0 3 +++
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_exec.c=C2=A0 |=C2=A0 7 ++++---
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_exec.h=C2=A0 |=C2=A0 5 +++++
> > > =C2=A0include/uapi/drm/nouveau_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
> > > =C2=A06 files changed, 42 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > index 30afbec9e3b1..1a198689b391 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > @@ -31,6 +31,7 @@
> > >=20
> > > =C2=A0#include "nouveau_drv.h"
> > > =C2=A0#include "nouveau_dma.h"
> > > +#include "nouveau_exec.h"
> > > =C2=A0#include "nouveau_gem.h"
> > > =C2=A0#include "nouveau_chan.h"
> > > =C2=A0#include "nouveau_abi16.h"
> > > @@ -183,6 +184,20 @@ nouveau_abi16_fini(struct nouveau_abi16
> > > *abi16)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cli->abi16 =3D NULL;
> > > =C2=A0}
> > >=20
> > > +static inline unsigned int
> > > +getparam_dma_ib_max(struct nvif_device *device)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct nvif_mclass dmas[]=
 =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 { NV03_CHANNEL_DMA, 0 },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 { NV10_CHANNEL_DMA, 0 },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 { NV17_CHANNEL_DMA, 0 },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 { NV40_CHANNEL_DMA, 0 },
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 {}
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return nvif_mclass(&device->obj=
ect, dmas) < 0 ?
> > > NV50_DMA_IB_MAX : 0;
> > > +}
> > > +
> > > =C2=A0int
> > > =C2=A0nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> > > =C2=A0{
> > > @@ -247,6 +262,10 @@
> > > nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case NOUVEAU_GETPARAM_GRAP=
H_UNITS:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 getparam->value =3D nvkm_gr_units(gr);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case NOUVEAU_GETPARAM_EXEC_PUSH=
_MAX:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 getparam->value =3D getparam_dma_ib_max(device) /
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_EXEC_PUSH_MAX_D=
IV;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 NV_PRINTK(dbg, cli, "unknown parameter %lld\n",
> > > getparam->param);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > index ac56f4689ee3..c3c2ab887978 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > > @@ -456,7 +456,7 @@ nouveau_channel_init(struct nouveau_channel
> > > *chan, u32 vram, u32 gart)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 chan->user_get =3D 0x44;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 chan->user_get_hi =3D 0x60;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 chan->dma.ib_base =3D=C2=A0 0x10000 / 4;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 chan->dma.ib_max=C2=A0 =3D (0x02000 / 8) - 1;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 chan->dma.ib_max=C2=A0 =3D NV50_DMA_IB_MAX;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 chan->dma.ib_put=C2=A0 =3D 0;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 chan->dma.ib_free =3D chan->dma.ib_max - chan-
> > > > dma.ib_put;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 chan->dma.max =3D chan->dma.ib_base;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h
> > > b/drivers/gpu/drm/nouveau/nouveau_dma.h
> > > index 1744d95b233e..c52cda82353e 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_dma.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
> > > @@ -49,6 +49,9 @@ void nv50_dma_push(struct nouveau_channel *,
> > > u64
> > > addr, u32 length,
> > > =C2=A0/* Maximum push buffer size. */
> > > =C2=A0#define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
> > >=20
> > > +/* Maximum IBs per ring. */
> > > +#define NV50_DMA_IB_MAX ((0x02000 / 8) - 1)
> > > +
> > > =C2=A0/* Object handles - for stuff that's doesn't use handle =3D=3D
> > > oclass.
> > > */
> > > =C2=A0enum {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvDmaFB=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x80000002,
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c
> > > b/drivers/gpu/drm/nouveau/nouveau_exec.c
> > > index ba6913a3efb6..5b5c4a77b8e6 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> > > @@ -346,7 +346,7 @@ nouveau_exec_ioctl_exec(struct drm_device
> > > *dev,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_channel *ch=
an =3D NULL;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_exec_job_ar=
gs args =3D {};
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_nouveau_exec *r=
eq =3D data;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int push_max, ret =3D 0;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(!abi16))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > > @@ -371,9 +371,10 @@ nouveau_exec_ioctl_exec(struct drm_device
> > > *dev,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!chan->dma.ib_max)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return nouveau_abi16_put(abi16, -ENOSYS);
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(req->push_count > =
NOUVEAU_GEM_MAX_PUSH)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 push_max =3D chan->dma.ib_max /=
 NOUVEAU_EXEC_PUSH_MAX_DIV;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(req->push_count > =
push_max)) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 NV_PRINTK(err, cli, "pushbuf push count exceeds
> > > limit: %d max %d\n",
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
q->push_count, NOUVEAU_GEM_MAX_PUSH);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 req->push_count, push_max);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return nouveau_abi16_put(abi16, -EINVAL);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h
> > > b/drivers/gpu/drm/nouveau/nouveau_exec.h
> > > index b815de2428f3..c6270452e4b5 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_exec.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
> > > @@ -6,6 +6,11 @@
> > > =C2=A0#include "nouveau_drv.h"
> > > =C2=A0#include "nouveau_sched.h"
> > >=20
> > > +/* Divider to limit the number of IBs per job to half the size
> > > of
> > > the ring in
> > > + * order to avoid the ring running dry between submissions.
> > > + */
> > > +#define NOUVEAU_EXEC_PUSH_MAX_DIV 2
> > > +
> > > =C2=A0struct nouveau_exec_job_args {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv=
;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_sched_entit=
y *sched_entity;
> > > diff --git a/include/uapi/drm/nouveau_drm.h
> > > b/include/uapi/drm/nouveau_drm.h
> > > index 8d7402c13e56..eaf9f248619f 100644
> > > --- a/include/uapi/drm/nouveau_drm.h
> > > +++ b/include/uapi/drm/nouveau_drm.h
> > > @@ -44,6 +44,16 @@ extern "C" {
> > > =C2=A0#define NOUVEAU_GETPARAM_PTIMER_TIME=C2=A0=C2=A0=C2=A0=C2=A0 14
> > > =C2=A0#define NOUVEAU_GETPARAM_HAS_BO_USAGE=C2=A0=C2=A0=C2=A0 15
> > > =C2=A0#define NOUVEAU_GETPARAM_HAS_PAGEFLIP=C2=A0=C2=A0=C2=A0 16
> > > +
> > > +/**
> > > + * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
> > > + *
> > > + * Query the maximum amount of IBs that can be pushed through a
> > > single
> > > + * &drm_nouveau_exec structure and hence a single
> > > &DRM_IOCTL_NOUVEAU_EXEC
> > > + * ioctl().
> > > + */
> > > +#define NOUVEAU_GETPARAM_EXEC_PUSH_MAX=C2=A0=C2=A0 17
> > > +
> > > =C2=A0struct drm_nouveau_getparam {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 param;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 value;
> >=20

