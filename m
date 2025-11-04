Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D2C2FC34
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABAD10E24B;
	Tue,  4 Nov 2025 08:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ebFi5Zxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6350110E24B;
 Tue,  4 Nov 2025 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762243714;
 bh=96JghmqqEDTGhb4Xq8jp87G9WQnebBX8RcOyfG+5Zqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ebFi5ZxvDf6AolYy13CjufLMgAEMrkH9ZLY7kaf9uY3KgqVRFaVx7nYm5InI1+KNx
 p0hc1SUT0FcLhta0Y4UduJUrcvca6QrH2oQZmCsyXlq2N/PaYgXTxLpeL6azDgqaBF
 +gaxC9v0Sn3aH15/CSxSy2ZGiwvcvBq7gRSN24DeW4msqXw82RGNELgsSB/U4YjP+X
 GlyIpUNOZ24SDf0QGeOqPMBdln9PJoeIhrWjLHUyRt1KJGTCA92v3HLXhRhc2Dgt/S
 Y4g/c6NPxRCQFETKQtGjRb13yGiQQQmunMX0Xey6KY1OPPm9bslRd4kx+q5NPGQosb
 TmjaL4fbLyCKQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E490E17E127F;
 Tue,  4 Nov 2025 09:08:33 +0100 (CET)
Date: Tue, 4 Nov 2025 09:08:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v5 02/16] drm/shmem: Provide a generic
 {begin,end}_cpu_access() implementation
Message-ID: <20251104090828.48decc16@fedora>
In-Reply-To: <abbd34de-cbbf-4188-a236-e3eccc357fab@amd.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-3-boris.brezillon@collabora.com>
 <abbd34de-cbbf-4188-a236-e3eccc357fab@amd.com>
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

On Thu, 30 Oct 2025 15:31:44 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 10/30/25 15:05, Boris Brezillon wrote:
> > The default implementation simply takes care of invalidating/flushing
> > caches around CPU accesses. It takes care of both the exporter and
> > the importers, which forces us to overload the default
> > ::[un]map_dma_buf() implementation provided by drm_gem.c to store the
> > sgt.
> >=20
> > v5:
> > - New patch
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 114 +++++++++++++++++++++++++
> >  include/drm/drm_gem_shmem_helper.h     |  10 +++
> >  2 files changed, 124 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index dc94a27710e5..e49c75739c20 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -893,6 +893,120 @@ struct drm_gem_object *drm_gem_shmem_prime_import=
_no_map(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
> > =20
> > +/**
> > + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exp=
orted buffers
> > + * @attach: attachment
> > + * @sgt: SG table to unmap
> > + * @dir: type of access done by this attachment
> > + *
> > + * Default implementation for dma_buf_ops::map_dma_buf(). This is just=
 a wrapper
> > + * around drm_gem_map_dma_buf() that lets us set the dma_buf_attachmen=
t::priv
> > + * to the sgt so that drm_gem_shmem_prime_{begin,end}_cpu_access() can=
 sync
> > + * around CPU accesses.
> > + */
> > +struct sg_table *
> > +drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
> > +				enum dma_data_direction dir)
> > +{
> > +	struct sg_table *sgt =3D drm_gem_map_dma_buf(attach, dir);
> > +
> > +	if (!IS_ERR(sgt))
> > +		attach->priv =3D sgt;
> > +
> > +	return sgt;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_map_dma_buf);
> > +
> > +/**
> > + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exp=
orted buffers
> > + * @attach: attachment
> > + * @sgt: SG table to unmap
> > + * @dir: type of access done by this attachment
> > + *
> > + * Default implementation for dma_buf_ops::unmap_dma_buf(). This is ju=
st a wrapper
> > + * around drm_gem_unmap_dma_buf() that lets us reset the dma_buf_attac=
hment::priv
> > + * field so that drm_gem_shmem_prime_{begin,end}_cpu_access() don't co=
nsider it
> > + * as a mapped attachment to sync against.
> > + */
> > +void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *atta=
ch,
> > +				       struct sg_table *sgt,
> > +				       enum dma_data_direction dir)
> > +{
> > +	attach->priv =3D NULL;
> > +	drm_gem_unmap_dma_buf(attach, sgt, dir);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_unmap_dma_buf);
> > +
> > +/**
> > + * drm_gem_shmem_prime_begin_cpu_access - Default end_cpu_access() for=
 exported buffers
> > + * @dma_buf: The exported DMA buffer this acts on
> > + * @dir: direction of the access
> > + *
> > + * Default implementation for dma_buf_ops::begin_cpu_access(). This on=
ly takes care of
> > + * cache maintenance.
> > + */
> > +int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
> > +					 enum dma_data_direction dir)
> > +{
> > +	struct drm_gem_object *obj =3D dma_buf->priv;
> > +	struct drm_device *dev =3D obj->dev;
> > +	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> > +	struct dma_buf_attachment *attach;
> > +
> > +	dma_resv_lock(obj->resv, NULL);
> > +	if (shmem->sgt)
> > +		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
> > +
> > +	if (shmem->vaddr)
> > +		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
> > + =20
>=20
>=20
> > +	list_for_each_entry(attach, &dma_buf->attachments, node) {
> > +		struct sg_table *sgt =3D attach->priv;
> > +
> > +		if (sgt)
> > +			dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
> > +	} =20
>=20
> This conflicts with the debugging hack in DMA-buf.
>=20
> I've recently send out a patch to fix that, but it hasn't been pushed yet.

I guess you're talking about [1]. I'm not sure this is a problem
actually, because we don't pass the exporter's sg_table, we allocate a
new one each time. As for the importer's sg_table we attach to
dma_buf_attach::priv, it would still be mangled, and I believe it's
fine, because the dma_sync_xxx helpers manipulate dma_addr_t not pages.
Am I missing something?

[1]https://lists.linaro.org/archives/list/linaro-mm-sig@lists.linaro.org/th=
read/HZDQ7SFOG4722BISB6BEEA34B7QESM2O/
