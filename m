Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4443C2FB18
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4564810E53A;
	Tue,  4 Nov 2025 07:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kdsRpZgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B6610E53A;
 Tue,  4 Nov 2025 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762242152;
 bh=Y3sxHbgdsw/zK5KujxmAhyHTOwoUJceuYijGgqI1be0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kdsRpZgLocXboI8/Ies+ryE2Rytn1iYmrFeJRdco+U/6MnmlxUUbPTnFoVT6q68ol
 VIf9sCMqYD6yQZEQT+l2vtSVR/a5hO5KTilgxNRbDuUiOClTC0PEp5gJjIlxpXRA/a
 gF3TWkMw1sbNRG3hjJXAQnoI6fkUGB3hBP8BB4YWIXeWup2OXYSAr6iFYOa6vn3mOg
 SMjIyQHE/TqfR4q9Hb0TZqNQuUbGSZ9TNfR9HBKjZb4mMyC+b+KpUHQHREZOTl45x2
 SbwUfPi8xOCg6wV6JJQnzR3zckDiBNK5n9XjJB5EG6QWecl+l2uxZ66w+usZL1DGGH
 w/o9uyoR0ay5Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 675CA17E0927;
 Tue,  4 Nov 2025 08:42:31 +0100 (CET)
Date: Tue, 4 Nov 2025 08:42:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
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
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v5 02/16] drm/shmem: Provide a generic {begin,
 end}_cpu_access() implementation
Message-ID: <20251104084227.0c078eb8@fedora>
In-Reply-To: <662c54eb-1ecb-4383-9405-a2d200a0bea6@arm.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-3-boris.brezillon@collabora.com>
 <662c54eb-1ecb-4383-9405-a2d200a0bea6@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 3 Nov 2025 20:34:39 +0000
Akash Goel <akash.goel@arm.com> wrote:

> On 10/30/25 14:05, Boris Brezillon wrote:
> > The default implementation simply takes care of invalidating/flushing
> > caches around CPU accesses. It takes care of both the exporter and
> > the importers, which forces us to overload the default
> > ::[un]map_dma_buf() implementation provided by drm_gem.c to store the
> > sgt.
> >
> > v5:
> > - New patch
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/drm_gem_shmem_helper.c | 114 +++++++++++++++++++++++++
> >   include/drm/drm_gem_shmem_helper.h     |  10 +++
> >   2 files changed, 124 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index dc94a27710e5..e49c75739c20 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -893,6 +893,120 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
> >   }
> >   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
> >
> > +/**
> > + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
> > + * @attach: attachment
> > + * @sgt: SG table to unmap
> > + * @dir: type of access done by this attachment
> > + *
> > + * Default implementation for dma_buf_ops::map_dma_buf(). This is just a wrapper
> > + * around drm_gem_map_dma_buf() that lets us set the dma_buf_attachment::priv
> > + * to the sgt so that drm_gem_shmem_prime_{begin,end}_cpu_access() can sync
> > + * around CPU accesses.
> > + */
> > +struct sg_table *
> > +drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
> > +                             enum dma_data_direction dir)
> > +{
> > +     struct sg_table *sgt = drm_gem_map_dma_buf(attach, dir);
> > +
> > +     if (!IS_ERR(sgt))
> > +             attach->priv = sgt;
> > +
> > +     return sgt;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_map_dma_buf);
> > +
> > +/**
> > + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
> > + * @attach: attachment
> > + * @sgt: SG table to unmap
> > + * @dir: type of access done by this attachment
> > + *
> > + * Default implementation for dma_buf_ops::unmap_dma_buf(). This is just a wrapper
> > + * around drm_gem_unmap_dma_buf() that lets us reset the dma_buf_attachment::priv
> > + * field so that drm_gem_shmem_prime_{begin,end}_cpu_access() don't consider it
> > + * as a mapped attachment to sync against.
> > + */
> > +void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
> > +                                    struct sg_table *sgt,
> > +                                    enum dma_data_direction dir)
> > +{
> > +     attach->priv = NULL;
> > +     drm_gem_unmap_dma_buf(attach, sgt, dir);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_unmap_dma_buf);
> > +
> > +/**
> > + * drm_gem_shmem_prime_begin_cpu_access - Default end_cpu_access() for exported buffers  
> 
> 
> Sorry nitpick. There is a typo here. Should be 'Default begin_cpu_access()`.

Nice catch. Will fix in v6.
