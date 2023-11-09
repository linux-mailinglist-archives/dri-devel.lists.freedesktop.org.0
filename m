Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6157E66B4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A960110E204;
	Thu,  9 Nov 2023 09:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A9010E204
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79oS6SROvXpCpQUIKTIu8G6jCPD4MHyWI02n7A5dIu0=; b=GXNJqn1pnFv6PlzOpfV2kzJPYq
 gGFImiqnyWp1gjHwZ3CXCGvTfeFqOpHobR3NfKVGldGmExPXsmgbSHMeIHMMSFwbxvkK3HxEpftP9
 MDHz7ePZZd7WekUWilzAvR581OD4Ya6R6dMZzAsPejy5RJTZmnzfnHqwelExaIsAk0qrCf9eymKqY
 lUUy+FinVQfqILvsVeIzq3L0DYr5D85YfbvRRNGKH/Pw0ZRFoQWoFcoeswyKibFmwxQTy7p0ntWD6
 GdZwSxdF5ohRjc5baJBOtxqoevUdORTalDYFGvIZqFxbjgNhOd55atvyPaMxCnGthY4++YAwdTSGw
 xjHKkLbg==;
Received: from [192.168.12.229] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r11II-001BR6-22; Thu, 09 Nov 2023 10:25:46 +0100
Message-ID: <45f97994b37bd1de70e4322badebfa99cd0e2456.camel@igalia.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
From: Iago Toral <itoral@igalia.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Date: Thu, 09 Nov 2023 10:25:45 +0100
In-Reply-To: <20231109074545.148149-2-contact@emersion.fr>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
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
Cc: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

thanks for looking into this! I few comments below inline...

El jue, 09-11-2023 a las 07:45 +0000, Simon Ser escribi=C3=B3:
> User-space sometimes needs to allocate scanout-capable memory for
> GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> is achieved via DRM dumb buffers: the v3d user-space driver opens
> the primary vc4 node, allocates a DRM dumb buffer there, exports it
> as a DMA-BUF, imports it into the v3d render node, and renders to it.
>=20
> However, DRM dumb buffers are only meant for CPU rendering, they are
> not intended to be used for GPU rendering. Primary nodes should only
> be used for mode-setting purposes, other programs should not attempt
> to open it. Moreover, opening the primary node is already broken on
> some setups: systemd grants permission to open primary nodes to
> physically logged in users, but this breaks when the user is not
> physically logged in (e.g. headless setup) and when the distribution
> is using a different init (e.g. Alpine Linux uses openrc).
>=20
> We need an alternate way for v3d to allocate scanout-capable memory.
> Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
> Preliminary testing has been done with wlroots [1].
>=20
> This is still an RFC. Open questions:

I think Maxime is the right person to answer about vc4 but I'll answer
a few of these questions from my perspective:

>=20
> - Does this approach make sense to y'all in general?

Yeah, this sounds sensible to me.

> - What would be a good name for the heap? "vc4" is maybe a bit naive
> and
> =C2=A0 not precise enough. Something with "cma"? Do we need to plan a
> naming
> =C2=A0 scheme to accomodate for multiple vc4 devices?
> - Right now root privileges are necessary to open the heap. Should we
> =C2=A0 allow everybody to open the heap by default (after all, user-space
> can
> =C2=A0 already allocate arbitrary amounts of GPU memory)? Should we leave
> it
> =C2=A0 up to user-space to solve this issue (via logind/seatd or a Waylan=
d
> =C2=A0 protocol or something else)?

I think so, yes, after all, the main user of this will be the Mesa
driver, so root only would not be great I think.

>=20
> TODO:
>=20
> - Need to add !vc5 support.

I believe that would be models before Raspberry Pi 4, which don't have
v3d, so maybe we don't need this there?

Iago

> - Need to the extend DMA heaps API to allow vc4 to unregister the
> heap
> =C2=A0 on unload.
>=20
> [1]:
> https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4414
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> =C2=A0drivers/gpu/drm/vc4/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/vc4/vc4_dma_heap.c | 51
> ++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/vc4/vc4_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 6 ++++
> =C2=A0drivers/gpu/drm/vc4/vc4_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 +++
> =C2=A04 files changed, 64 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/vc4/vc4_dma_heap.c
>=20
> diff --git a/drivers/gpu/drm/vc4/Makefile
> b/drivers/gpu/drm/vc4/Makefile
> index c41f89a15a55..e4048870cec7 100644
> --- a/drivers/gpu/drm/vc4/Makefile
> +++ b/drivers/gpu/drm/vc4/Makefile
> @@ -34,4 +34,6 @@ vc4-$(CONFIG_DRM_VC4_KUNIT_TEST) +=3D \
> =C2=A0
> =C2=A0vc4-$(CONFIG_DEBUG_FS) +=3D vc4_debugfs.o
> =C2=A0
> +vc4-$(CONFIG_DMABUF_HEAPS) +=3D vc4_dma_heap.o
> +
> =C2=A0obj-$(CONFIG_DRM_VC4)=C2=A0 +=3D vc4.o
> diff --git a/drivers/gpu/drm/vc4/vc4_dma_heap.c
> b/drivers/gpu/drm/vc4/vc4_dma_heap.c
> new file mode 100644
> index 000000000000..010d0a88f3fa
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/vc4_dma_heap.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *=C2=A0 Copyright =C2=A9 2023 Simon Ser
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +
> +#include "vc4_drv.h"
> +
> +static struct dma_buf *vc4_dma_heap_allocate(struct dma_heap *heap,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long fd_flags,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> heap_flags)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct vc4_dev *vc4 =3D dma_he=
ap_get_drvdata(heap);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0//DEFINE_DMA_BUF_EXPORT_INFO(e=
xp_info);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gem_dma_object *dma=
_obj;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_buf *dmabuf;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(!vc4->is_vc5)=
)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ERR_PTR(-ENODEV);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_obj =3D drm_gem_dma_create=
(&vc4->base, size);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(dma_obj))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ERR_CAST(dma_obj);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dmabuf =3D drm_gem_prime_expor=
t(&dma_obj->base, fd_flags);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_put(&dma_obj->b=
ase);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return dmabuf;
> +}
> +
> +static const struct dma_heap_ops vc4_dma_heap_ops =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.allocate =3D vc4_dma_heap_all=
ocate,
> +};
> +
> +int vc4_dma_heap_create(struct vc4_dev *vc4)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_heap_export_info ex=
p_info;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_heap *heap;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exp_info.name =3D "vc4"; /* TO=
DO: allow multiple? */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exp_info.ops =3D &vc4_dma_heap=
_ops;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exp_info.priv =3D vc4; /* TODO=
: unregister when unloading */
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0heap =3D dma_heap_add(&exp_inf=
o);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(heap))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(heap);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c
> b/drivers/gpu/drm/vc4/vc4_drv.c
> index c133e96b8aca..c7297dd7d9d5 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -391,6 +391,12 @@ static int vc4_drm_bind(struct device *dev)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fbdev_dma_setup(drm, =
16);
> =C2=A0
> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D vc4_dma_heap_create(vc=
4);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0goto err;
> +#endif
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0
> =C2=A0err:
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h
> b/drivers/gpu/drm/vc4/vc4_drv.h
> index ab61e96e7e14..d5c5dd18815c 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -1078,4 +1078,9 @@ int vc4_perfmon_destroy_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
> =C2=A0
> +/* vc4_dma_heap.c */
> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
> +int vc4_dma_heap_create(struct vc4_dev *vc4);
> +#endif
> +
> =C2=A0#endif /* _VC4_DRV_H_ */

