Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D0C2FB00
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28E10E538;
	Tue,  4 Nov 2025 07:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VBLi5Ddz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A3C10E537;
 Tue,  4 Nov 2025 07:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762242104;
 bh=IIXgCHXAt7a2mGSdYzFS4nF38UsVyUWGw7HwJ+7LlUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VBLi5DdzAu9gdCxIoH+KE358JlapGRcXL6080/dq9FS+DfyIsZUNvjZgbDnLq6uqk
 vQq+1jvhL2QKxB0lKReyEoORKSgt3eg30NwrF42wYLKCpkNQbbFvc1F9RRnxQsVyHw
 D/pUmna8HA+sQS4ulF0D5+KKhUAdqfUi5NOWZN6vFbC+td8/nHJOG8epWF5bDH+4fe
 RLQZazyegXhFZJ5XD+sw4TvpmViwbqtdGNYeJ1U45DhoiP4nP4aGxXTJMUpHvfuul9
 Glb5rfFTAqb0Q3yrn9X+qchevK/r2v6zZH3LYlOWfeii4BaGMHHA7Apvt/91upeA5w
 X3I/AmYBWXuGw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 533C417E0927;
 Tue,  4 Nov 2025 08:41:43 +0100 (CET)
Date: Tue, 4 Nov 2025 08:41:39 +0100
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
Subject: Re: [PATCH v5 07/16] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
Message-ID: <20251104084139.728f0f00@fedora>
In-Reply-To: <a9705c1e-2377-4f50-88ee-553bbf189d6d@arm.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-8-boris.brezillon@collabora.com>
 <a9705c1e-2377-4f50-88ee-553bbf189d6d@arm.com>
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

On Mon, 3 Nov 2025 20:42:05 +0000
Akash Goel <akash.goel@arm.com> wrote:

> On 10/30/25 14:05, Boris Brezillon wrote:
> > This will be used by the UMD to synchronize CPU-cached mappings when
> > the UMD can't do it directly (no usermode cache maintenance instruction
> > on Arm32).
> >
> > v2:
> > - Change the flags so they better match the drm_gem_shmem_sync()
> >    semantics
> >
> > v3:
> > - Add Steve's R-b
> >
> > v4:
> > - No changes
> >
> > v5:
> > - Drop Steve's R-b (the semantics changes call for a new review)
> >
> > Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/panthor/panthor_drv.c | 42 +++++++++++++++++++++-
> >   drivers/gpu/drm/panthor/panthor_gem.c | 21 +++++++++++
> >   drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
> >   include/uapi/drm/panthor_drm.h        | 52 +++++++++++++++++++++++++++
> >   4 files changed, 117 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index 99a4534c0074..cad5c4270b04 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
> >                PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
> >                PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
> >                PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> > -              PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
> > +              PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> > +              PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
> >
> >   /**
> >    * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> > @@ -1394,6 +1395,44 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
> >       return 0;
> >   }
> >
> > +#define PANTHOR_BO_SYNC_OP_FLAGS                                      \
> > +     (DRM_PANTHOR_BO_SYNC_FOR_DEV | DRM_PANTHOR_BO_SYNC_FOR_READ | \
> > +      DRM_PANTHOR_BO_SYNC_FOR_WRITE)
> > +  
> 
> 
> Sorry, couldn't find where PANTHOR_BO_SYNC_OP_FLAGS and
> DRM_PANTHOR_BO_SYNC_FOR_xxx macros get used.

That's a leftover from v4, it's not supposed to be there. I'll drop
that.

> 
> 
> 
> > +static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
> > +                              struct drm_file *file)
> > +{
> > +     struct drm_panthor_bo_sync *args = data;
> > +     struct drm_panthor_bo_sync_op *ops;
> > +     struct drm_gem_object *obj;
> > +     int ret = 0;
> > +
> > +     ret = PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (u32 i = 0; i < args->ops.count; i++) {
> > +             obj = drm_gem_object_lookup(file, ops[i].handle);
> > +             if (!obj) {
> > +                     ret = -ENOENT;
> > +                     goto err_ops;
> > +             }
> > +
> > +             ret = panthor_gem_sync(obj, ops[i].type, ops[i].offset,
> > +                                    ops[i].size);
> > +
> > +             drm_gem_object_put(obj);
> > +
> > +             if (ret)
> > +                     goto err_ops;
> > +     }
> > +
> > +err_ops:
> > +     kvfree(ops);
> > +
> > +     return ret;
> > +}
> > +
> >   static int
> >   panthor_open(struct drm_device *ddev, struct drm_file *file)
> >   {
> > @@ -1468,6 +1507,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
> >       PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> >       PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
> >       PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
> > +     PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
> >   };
> >
> >   static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 160692e45f44..1b1e98c61b8c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -357,6 +357,27 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
> >       panthor_gem_bo_set_label(bo->obj, str);
> >   }
> >
> > +int
> > +panthor_gem_sync(struct drm_gem_object *obj, u32 type,
> > +              u64 offset, u64 size)
> > +{
> > +     enum drm_gem_shmem_sync_type shmem_sync_type;
> > +     struct panthor_gem_object *bo = to_panthor_bo(obj);
> > +
> > +     switch (type) {
> > +     case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH:
> > +             shmem_sync_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH;
> > +             break;
> > +     case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
> > +             shmem_sync_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return drm_gem_shmem_sync(&bo->base, offset, size, shmem_sync_type);
> > +}
> > +
> >   #ifdef CONFIG_DEBUG_FS
> >   struct gem_size_totals {
> >       size_t size;
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> > index 528088839468..8705c492c5b6 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > @@ -147,6 +147,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >   void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
> >   void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
> >
> > +int panthor_gem_sync(struct drm_gem_object *obj,
> > +                  u32 type, u64 offset, u64 size);
> > +
> >   const struct dma_buf_ops *
> >   panthor_gem_prime_get_dma_buf_ops(struct drm_device *dev);
> >
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > index f0f637e0631d..bb12760abe99 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -144,6 +144,9 @@ enum drm_panthor_ioctl_id {
> >        * pgoff_t size.
> >        */
> >       DRM_PANTHOR_SET_USER_MMIO_OFFSET,
> > +
> > +     /** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
> > +     DRM_PANTHOR_BO_SYNC,
> >   };
> >
> >   /**
> > @@ -1073,6 +1076,53 @@ struct drm_panthor_set_user_mmio_offset {
> >       __u64 offset;
> >   };
> >
> > +/**
> > + * enum drm_panthor_bo_sync_op_type - BO sync type
> > + */
> > +enum drm_panthor_bo_sync_op_type {
> > +     /** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH: Flush CPU caches. */
> > +     DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH = 0,
> > +
> > +     /** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and invalidate CPU caches. */
> > +     DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE = 1,
> > +};
> > +
> > +/**
> > + * struct drm_panthor_bo_sync_op - BO map sync op
> > + */
> > +struct drm_panthor_bo_sync_op {
> > +     /** @handle: Handle of the buffer object to sync. */
> > +     __u32 handle;
> > +
> > +     /** @type: Type of operation. */
> > +     __u32 type;
> > +
> > +     /**
> > +      * @offset: Offset into the BO at which the sync range starts.
> > +      *
> > +      * This will be rounded down to the nearest cache line as needed.
> > +      */
> > +     __u64 offset;
> > +
> > +     /**
> > +      * @size: Size of the range to sync
> > +      *
> > +      * @size + @offset will be rounded up to the nearest cache line as
> > +      * needed.
> > +      */
> > +     __u64 size;
> > +};
> > +
> > +/**
> > + * struct drm_panthor_bo_sync - BO map sync request
> > + */
> > +struct drm_panthor_bo_sync {
> > +     /**
> > +      * @ops: Array of struct drm_panthor_bo_sync_op sync operations.
> > +      */
> > +     struct drm_panthor_obj_array ops;
> > +};
> > +
> >   /**
> >    * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> >    * @__access: Access type. Must be R, W or RW.
> > @@ -1119,6 +1169,8 @@ enum {
> >               DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
> >       DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
> >               DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
> > +     DRM_IOCTL_PANTHOR_BO_SYNC =
> > +             DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
> >   };
> >
> >   #if defined(__cplusplus)  
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

