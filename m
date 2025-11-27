Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A8C8DD13
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01F610E7C4;
	Thu, 27 Nov 2025 10:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YNNtnh2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFCB10E055;
 Thu, 27 Nov 2025 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764240055;
 bh=WqXAekQL05SeaUOuMqpj4hBN98Lol7DBHA1PulWB+CY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YNNtnh2oBq+9JO4AOjkazjOpPs43Jb/U0j55j3g2i4oCUn/g1kVGoDoHcc4nEpDRB
 Q3QBKp4CQovdhA8w76dpX3ApzpFLLTD5NNnEWStouJsuhCYNJj+qF1y4Tq6VyIUgWg
 Bb+MT2o9FWEYWc5usmDi0+5G5AFaF+bnpzetSgVATaUIdXYzXzdbYo6fEJoufC/tdD
 5v1pFqyv9vFyyUiH56PvE9XUaYQizXVqZbHrD9JNkpHOPGZIVpyXqr60uHTyUxW3iD
 BhRDdBySskxo43NPYFZ2BUnuTzB7rQQvEXcZGGNIhEDAavgB0sF8QwrZZT69fPfmJz
 wqRLjWUBK6ZxQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AE7FC17E12C1;
 Thu, 27 Nov 2025 11:40:54 +0100 (CET)
Date: Thu, 27 Nov 2025 11:40:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>, Thierry
 Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v6 01/16] drm/prime: Simplify life of drivers needing
 custom dma_buf_ops
Message-ID: <20251127114050.0407158b@fedora>
In-Reply-To: <2e789ff6-b79f-4577-bc69-f74dfed6acfa@suse.de>
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
 <20251126124455.3656651-2-boris.brezillon@collabora.com>
 <2e789ff6-b79f-4577-bc69-f74dfed6acfa@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 27 Nov 2025 09:34:43 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 26.11.25 um 13:44 schrieb Boris Brezillon:
> > drm_gem_is_prime_exported_dma_buf() checks the dma_buf->ops against
> > drm_gem_prime_dmabuf_ops, which makes it impossible to use if the
> > driver implements custom dma_buf_ops. Instead of duplicating a bunch
> > of helpers to work around it, let's provide a way for drivers to
> > expose their custom dma_buf_ops so the core prime helpers can rely on
> > that instead of hardcoding &drm_gem_prime_dmabuf_ops. =20
>=20
> This can't go in as-is. I've spent an awful amount of patches on=20
> removing buffer callbacks from struct drm_driver.

First, it's no longer a callback, but a pointer to dma_buf_ops
(joking of course, I get what you mean :P).

> Let's please not go=20
> back to that.
>=20
> >
> > v5:
> > - New patch
> >
> > v6:
> > - Pass custom dma_buf_ops directly instead of through a getter
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/drm_prime.c | 10 ++++++++--
> >   include/drm/drm_drv.h       |  8 ++++++++
> >   2 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 21809a82187b..86fd95f0c105 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -904,6 +904,12 @@ unsigned long drm_prime_get_contiguous_size(struct=
 sg_table *sgt)
> >   }
> >   EXPORT_SYMBOL(drm_prime_get_contiguous_size);
> >  =20
> > +static const struct dma_buf_ops *
> > +drm_gem_prime_get_dma_buf_ops(struct drm_device *dev)
> > +{
> > +	return dev->driver->dma_buf_ops ?: &drm_gem_prime_dmabuf_ops;
> > +}
> > +
> >   /**
> >    * drm_gem_prime_export - helper library implementation of the export=
 callback
> >    * @obj: GEM object to export
> > @@ -920,7 +926,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem=
_object *obj,
> >   	struct dma_buf_export_info exp_info =3D {
> >   		.exp_name =3D KBUILD_MODNAME, /* white lie for debug */
> >   		.owner =3D dev->driver->fops->owner,
> > -		.ops =3D &drm_gem_prime_dmabuf_ops,
> > +		.ops =3D drm_gem_prime_get_dma_buf_ops(dev), =20
>=20
> Rather provide a new function drm_gem_prime_export_with_ops() that takes=
=20
> an additional dma_ops instance. The current drm_gem_prime_export() would=
=20
> call it with &drm_gem_prime_dmabuf_ops.
>=20
> If this really does not work, you could add a pointer to dma_buf_ops to=20
> drm_gem_object_funcs and fetch that from drm_gem_prime_export(). We=20
> already vm_ops there.

It doesn't work because we need an ops to test against when a dma_buf
is imported, and that information has to be available at the
drm_{device,driver} level.

>=20
> Other drivers, such as amdgpu, would also benefit from such a change
>=20
> >   		.size =3D obj->size,
> >   		.flags =3D flags,
> >   		.priv =3D obj,
> > @@ -947,7 +953,7 @@ bool drm_gem_is_prime_exported_dma_buf(struct drm_d=
evice *dev,
> >   {
> >   	struct drm_gem_object *obj =3D dma_buf->priv;
> >  =20
> > -	return (dma_buf->ops =3D=3D &drm_gem_prime_dmabuf_ops) && (obj->dev =
=3D=3D dev);
> > +	return dma_buf->ops =3D=3D drm_gem_prime_get_dma_buf_ops(dev) && obj-=
>dev =3D=3D dev; =20
>=20
> This is a bit more complicated and the test has been a pain point=20
> before. For this case, I think we should add a GEM callback for this
>=20
> struct drm_gem_object_funcs {
>  =C2=A0 =C2=A0 bool (*exported_by)(struct drm_gem_object *obj, struct drm=
_device *dev)
> }
>=20
> next to the existing export callback.

Nope, because dma_buf::ops needs to be tested against the driver
dma_buf_ops to determine if it's a drm_gem_object that's stored in
dma_buf::priv. If we add such a callback, it has to be at the
drm_driver level.
