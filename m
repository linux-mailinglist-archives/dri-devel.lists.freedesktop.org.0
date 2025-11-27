Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9539C8DD3A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327EC10E6F5;
	Thu, 27 Nov 2025 10:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VH7PKWYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2110E6F5;
 Thu, 27 Nov 2025 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764240284;
 bh=PdtChZR9KU0Y81WLE7uesI/C9IGUKSHZ+hKlnWO004I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VH7PKWYnSC110A/88rYT+awv3+oIFCOLcY0bPlfv/V0xZVMd7OZrxvYhgM3gP6G6J
 smjxm6xpNrw31361yCVDF766HTHHIRboFK1ARSh0oGfEyVaxSWVto+BuUi6zqHQIeN
 NDxOa3ISl7AfNWH8smh2ZYFEs+S/uRBgGea5TbCp5WdvhU+Rr3B9Cwp0dBjFUBJ/Gf
 lou8YJXixkWo7WGbWtXMq56DjSLt2D9JzqJBkJFJ88EGYQORAat2CtVfQi8uDDGGQm
 jw1Hi53ii800NmR8KKhDopoM0QoHhItKipzPpQafxjCTFD4tz/TCvssevuKaM+MHLE
 WsragkGJnuNsw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A516517E0360;
 Thu, 27 Nov 2025 11:44:43 +0100 (CET)
Date: Thu, 27 Nov 2025 11:44:40 +0100
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
Message-ID: <20251127114440.7a1d9e16@fedora>
In-Reply-To: <0d1fe2cf-dbda-4e64-bc3b-a2c9c0887820@suse.de>
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
 <20251126124455.3656651-2-boris.brezillon@collabora.com>
 <2e789ff6-b79f-4577-bc69-f74dfed6acfa@suse.de>
 <daaf256e-8662-4f9a-b702-1a6656117448@suse.de>
 <0d1fe2cf-dbda-4e64-bc3b-a2c9c0887820@suse.de>
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

On Thu, 27 Nov 2025 09:58:55 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 27.11.25 um 09:42 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 27.11.25 um 09:34 schrieb Thomas Zimmermann: =20
> >> Hi
> >>
> >> Am 26.11.25 um 13:44 schrieb Boris Brezillon: =20
> >>> drm_gem_is_prime_exported_dma_buf() checks the dma_buf->ops against
> >>> drm_gem_prime_dmabuf_ops, which makes it impossible to use if the
> >>> driver implements custom dma_buf_ops. Instead of duplicating a bunch
> >>> of helpers to work around it, let's provide a way for drivers to
> >>> expose their custom dma_buf_ops so the core prime helpers can rely on
> >>> that instead of hardcoding &drm_gem_prime_dmabuf_ops. =20
> >>
> >> This can't go in as-is. I've spent an awful amount of patches on=20
> >> removing buffer callbacks from struct drm_driver. Let's please not go=
=20
> >> back to that.
> >> =20
> >>>
> >>> v5:
> >>> - New patch
> >>>
> >>> v6:
> >>> - Pass custom dma_buf_ops directly instead of through a getter
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>> =C2=A0 drivers/gpu/drm/drm_prime.c | 10 ++++++++--
> >>> =C2=A0 include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 ++++++++
> >>> =C2=A0 2 files changed, 16 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >>> index 21809a82187b..86fd95f0c105 100644
> >>> --- a/drivers/gpu/drm/drm_prime.c
> >>> +++ b/drivers/gpu/drm/drm_prime.c
> >>> @@ -904,6 +904,12 @@ unsigned long=20
> >>> drm_prime_get_contiguous_size(struct sg_table *sgt)
> >>> =C2=A0 }
> >>> =C2=A0 EXPORT_SYMBOL(drm_prime_get_contiguous_size);
> >>> =C2=A0 +static const struct dma_buf_ops *
> >>> +drm_gem_prime_get_dma_buf_ops(struct drm_device *dev)
> >>> +{
> >>> +=C2=A0=C2=A0=C2=A0 return dev->driver->dma_buf_ops ?: &drm_gem_prime=
_dmabuf_ops;
> >>> +}
> >>> +
> >>> =C2=A0 /**
> >>> =C2=A0=C2=A0 * drm_gem_prime_export - helper library implementation o=
f the=20
> >>> export callback
> >>> =C2=A0=C2=A0 * @obj: GEM object to export
> >>> @@ -920,7 +926,7 @@ struct dma_buf *drm_gem_prime_export(struct=20
> >>> drm_gem_object *obj,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_export_info exp_info =
=3D {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .exp_name =3D =
KBUILD_MODNAME, /* white lie for debug */
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .owner =3D dev=
->driver->fops->owner,
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ops =3D &drm_gem_prime_d=
mabuf_ops,
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ops =3D drm_gem_prime_ge=
t_dma_buf_ops(dev), =20
> >>
> >> Rather provide a new function drm_gem_prime_export_with_ops() that=20
> >> takes an additional dma_ops instance. The current=20
> >> drm_gem_prime_export() would call it with &drm_gem_prime_dmabuf_ops.
> >>
> >> If this really does not work, you could add a pointer to dma_buf_ops=20
> >> to drm_gem_object_funcs and fetch that from drm_gem_prime_export().=20
> >> We already vm_ops there.
> >>
> >> Other drivers, such as amdgpu, would also benefit from such a change
> >> =20
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D obj-=
>size,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D fla=
gs,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .priv =3D obj,
> >>> @@ -947,7 +953,7 @@ bool drm_gem_is_prime_exported_dma_buf(struct=20
> >>> drm_device *dev,
> >>> =C2=A0 {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj =3D dma_buf=
->priv;
> >>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return (dma_buf->ops =3D=3D &drm_gem_prime=
_dmabuf_ops) &&=20
> >>> (obj->dev =3D=3D dev);
> >>> +=C2=A0=C2=A0=C2=A0 return dma_buf->ops =3D=3D drm_gem_prime_get_dma_=
buf_ops(dev) &&=20
> >>> obj->dev =3D=3D dev; =20
> >
> > On a second thought, we probably cannot be sure that dma_buf->priv=20
> > really is a GEM object until we tested the ops field. :/=C2=A0 IIRC tha=
t's=20
> > why the ops test goes first and the test for obj->dev goes second. So=20
> > neither solution works. =20
>=20
> I think, instead of looking at the ops field, the test could look at=20
> dma_buf->owner =3D=3D dev->driver->fops->owner.=C2=A0 This will tell if t=
he=20
> dma_buf comes from the same driver and hence is a GEM object. In the=20
> next step, do obj->dev =3D=3D dev as before.=C2=A0 This will also allow d=
rivers=20
> like amdgpu to use the helper for testing. See [1].

Except this doesn't work when the driver is linked statically (not
enabled as a module), because THIS_MODULE is NULL in that case.
