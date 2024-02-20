Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE78185B2F9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 07:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB27810E121;
	Tue, 20 Feb 2024 06:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pUOx0I2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCEC10E121
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z93VC3hsa3f14DslOTKUBdsR8q9/lVP7eWuGXhPXDlc=; b=pUOx0I2tdqm3VlcNovA+FbWWAi
 8lCWQCoq55yVDxPle5rdphJBVyLP16pBHqN5gkUB2kXIGx9xysB119IU3zR2keeourk8z7HGLUYAK
 99nqNm96zYe4SRAmn38MYSWi8KgN33aeDSd/DTLMee9DNXoTRbB3gAIjTq6b9E/+r72j16DcUGImm
 91ZIlqz6XQlp6w2+3En8a62Xwt/Ucf+wISI87yQ2jugZF1NA0F6lLjxv4PiuJMI+S6BONizJDmthm
 UiCmJvjntaCbnRJ7LrXH+QeYgTCcqY5xSzerNNGZwTiThEWZ15aU7s8EU8ZB5JrtLxJseR8v+kqrP
 2twXWZBQ==;
Received: from 72.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.72]
 helo=[192.168.0.101]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rcJj0-001VRQ-De; Tue, 20 Feb 2024 07:35:30 +0100
Message-ID: <60607fcb950b9a69f7bf1e69c5d1a7698891e67d.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Enable V3D to use different PAGE_SIZE
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Phil Elwell <phil@raspberrypi.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 20 Feb 2024 07:35:29 +0100
In-Reply-To: <4b77a870-8598-4d11-b14f-9144e84a6679@igalia.com>
References: <20240214193503.164462-1-mcanal@igalia.com>
 <66cfdb02177a5ba6419b13163df44f5c8f967232.camel@igalia.com>
 <4b77a870-8598-4d11-b14f-9144e84a6679@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El lun, 19-02-2024 a las 10:00 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Hi Iago,
>=20
> On 2/19/24 09:56, Iago Toral wrote:
> > Hi Ma=C3=ADra,
> >=20
> > El mi=C3=A9, 14-02-2024 a las 16:34 -0300, Ma=C3=ADra Canal escribi=C3=
=B3:
> > > Currently, the V3D driver uses PAGE_SHIFT over the assumption
> > > that
> > > PAGE_SHIFT =3D 12, as the PAGE_SIZE =3D 4KB. But, the RPi 5 is using
> > > PAGE_SIZE =3D 16KB, so the MMU PAGE_SHIFT is different than the
> > > system's
> > > PAGE_SHIFT.
> > >=20
> > > Enable V3D to be used in system's with any PAGE_SIZE by making
> > > sure
> > > that
> > > everything MMU-related uses the MMU page shift.
> > >=20
> > > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 12 ++++++------
> > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_debugfs.c |=C2=A0 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++
> > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_irq.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 --
> > > =C2=A0=C2=A05 files changed, 10 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/v3d/v3d_bo.c
> > > b/drivers/gpu/drm/v3d/v3d_bo.c
> > > index 1bdfac8beafd..a07ede668cc1 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_bo.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> >=20
> > I think we need the same change in v3d_get_bo_vaddr, no?
>=20
> No, that one uses the PAGE_SHIFT of the CPU, because=C2=A0
>  is in
> the CPU.

Ah, makes sense, thanks!

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> > Iago
> >=20
> > > @@ -40,7 +40,7 @@ void v3d_free_object(struct drm_gem_object
> > > *obj)
> > >=20
> > > =C2=A0=C2=A0	mutex_lock(&v3d->bo_lock);
> > > =C2=A0=C2=A0	v3d->bo_stats.num_allocated--;
> > > -	v3d->bo_stats.pages_allocated -=3D obj->size >>
> > > PAGE_SHIFT;
> > > +	v3d->bo_stats.pages_allocated -=3D obj->size >>
> > > V3D_MMU_PAGE_SHIFT;
> > > =C2=A0=C2=A0	mutex_unlock(&v3d->bo_lock);
> > >=20
> > > =C2=A0=C2=A0	spin_lock(&v3d->mm_lock);
> > > @@ -109,8 +109,8 @@ v3d_bo_create_finish(struct drm_gem_object
> > > *obj)
> > > =C2=A0=C2=A0	 * lifetime of the BO.
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	ret =3D drm_mm_insert_node_generic(&v3d->mm, &bo->node,
> > > -					 obj->size >>
> > > PAGE_SHIFT,
> > > -					 GMP_GRANULARITY >>
> > > PAGE_SHIFT, 0, 0);
> > > +					 obj->size >>
> > > V3D_MMU_PAGE_SHIFT,
> > > +					 GMP_GRANULARITY >>
> > > V3D_MMU_PAGE_SHIFT, 0, 0);
> > > =C2=A0=C2=A0	spin_unlock(&v3d->mm_lock);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		return ret;
> > > @@ -118,7 +118,7 @@ v3d_bo_create_finish(struct drm_gem_object
> > > *obj)
> > > =C2=A0=C2=A0	/* Track stats for /debug/dri/n/bo_stats. */
> > > =C2=A0=C2=A0	mutex_lock(&v3d->bo_lock);
> > > =C2=A0=C2=A0	v3d->bo_stats.num_allocated++;
> > > -	v3d->bo_stats.pages_allocated +=3D obj->size >>
> > > PAGE_SHIFT;
> > > +	v3d->bo_stats.pages_allocated +=3D obj->size >>
> > > V3D_MMU_PAGE_SHIFT;
> > > =C2=A0=C2=A0	mutex_unlock(&v3d->bo_lock);
> > >=20
> > > =C2=A0=C2=A0	v3d_mmu_insert_ptes(bo);
> > > @@ -201,7 +201,7 @@ int v3d_create_bo_ioctl(struct drm_device
> > > *dev,
> > > void *data,
> > > =C2=A0=C2=A0	if (IS_ERR(bo))
> > > =C2=A0=C2=A0		return PTR_ERR(bo);
> > >=20
> > > -	args->offset =3D bo->node.start << PAGE_SHIFT;
> > > +	args->offset =3D bo->node.start << V3D_MMU_PAGE_SHIFT;
> > >=20
> > > =C2=A0=C2=A0	ret =3D drm_gem_handle_create(file_priv, &bo->base.base,
> > > &args->handle);
> > > =C2=A0=C2=A0	drm_gem_object_put(&bo->base.base);
> > > @@ -246,7 +246,7 @@ int v3d_get_bo_offset_ioctl(struct drm_device
> > > *dev, void *data,
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0	bo =3D to_v3d_bo(gem_obj);
> > >=20
> > > -	args->offset =3D bo->node.start << PAGE_SHIFT;
> > > +	args->offset =3D bo->node.start << V3D_MMU_PAGE_SHIFT;
> > >=20
> > > =C2=A0=C2=A0	drm_gem_object_put(gem_obj);
> > > =C2=A0=C2=A0	return 0;
> > > diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c
> > > b/drivers/gpu/drm/v3d/v3d_debugfs.c
> > > index dc3cf708d02e..19e3ee7ac897 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> > > @@ -219,7 +219,7 @@ static int v3d_debugfs_bo_stats(struct
> > > seq_file
> > > *m, void *unused)
> > > =C2=A0=C2=A0	seq_printf(m, "allocated bos:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 %d\n",
> > > =C2=A0=C2=A0		=C2=A0=C2=A0 v3d->bo_stats.num_allocated);
> > > =C2=A0=C2=A0	seq_printf(m, "allocated bo size (kb): %ld\n",
> > > -		=C2=A0=C2=A0 (long)v3d->bo_stats.pages_allocated <<
> > > (PAGE_SHIFT - 10));
> > > +		=C2=A0=C2=A0 (long)v3d->bo_stats.pages_allocated <<
> > > (V3D_MMU_PAGE_SHIFT - 10));
> > > =C2=A0=C2=A0	mutex_unlock(&v3d->bo_lock);
> > >=20
> > > =C2=A0=C2=A0	return 0;
> > > diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> > > b/drivers/gpu/drm/v3d/v3d_drv.h
> > > index 3c7d58866570..1950c723dde1 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_drv.h
> > > +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> > > @@ -19,6 +19,8 @@ struct reset_control;
> > >=20
> > > =C2=A0=C2=A0#define GMP_GRANULARITY (128 * 1024)
> > >=20
> > > +#define V3D_MMU_PAGE_SHIFT 12
> > > +
> > > =C2=A0=C2=A0#define V3D_MAX_QUEUES (V3D_CPU + 1)
> > >=20
> > > =C2=A0=C2=A0static inline char *v3d_queue_to_string(enum v3d_queue qu=
eue)
> > > diff --git a/drivers/gpu/drm/v3d/v3d_irq.c
> > > b/drivers/gpu/drm/v3d/v3d_irq.c
> > > index afc76390a197..2e04f6cb661e 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_irq.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> > > @@ -70,7 +70,7 @@ v3d_overflow_mem_work(struct work_struct *work)
> > > =C2=A0=C2=A0	list_add_tail(&bo->unref_head, &v3d->bin_job->render-
> > > > unref_list);
> > > =C2=A0=C2=A0	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
> > >=20
> > > -	V3D_CORE_WRITE(0, V3D_PTB_BPOA, bo->node.start <<
> > > PAGE_SHIFT);
> > > +	V3D_CORE_WRITE(0, V3D_PTB_BPOA, bo->node.start <<
> > > V3D_MMU_PAGE_SHIFT);
> > > =C2=A0=C2=A0	V3D_CORE_WRITE(0, V3D_PTB_BPOS, obj->size);
> > >=20
> > > =C2=A0=C2=A0out:
> > > diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c
> > > b/drivers/gpu/drm/v3d/v3d_mmu.c
> > > index 5a453532901f..14f3af40d6f6 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_mmu.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
> > > @@ -21,8 +21,6 @@
> > > =C2=A0=C2=A0#include "v3d_drv.h"
> > > =C2=A0=C2=A0#include "v3d_regs.h"
> > >=20
> > > -#define V3D_MMU_PAGE_SHIFT 12
> > > -
> > > =C2=A0=C2=A0/* Note: All PTEs for the 1MB superpage must be filled wi=
th the
> > > =C2=A0=C2=A0 * superpage bit set.
> > > =C2=A0=C2=A0 */
> > > --
> > > 2.43.0
> > >=20
> > >=20
> >=20
>=20

