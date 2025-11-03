Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F4C2D641
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AE510E448;
	Mon,  3 Nov 2025 17:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EKS+VWSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C244910E07A;
 Mon,  3 Nov 2025 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762190014;
 bh=pMHpbvKkzgBOKYrXcj0pG/y52F9XZhDJrkdB+EH6s6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EKS+VWSciJkiugKLd93WX1ZEuW2WqOCCb4cmoFgxvY6hzaDDbEvniLessJpH5LLRR
 ib6IOf/KqOVKlhzJjKNoMJk9pwZQDOyZqceM6D8aadSyPLv2MEPcYXxUupp3XkKqrM
 5PasJmaA94VoUbN17eqiCfXEfJi0RnPQhefvV2NFwdLlU68GkRoVc9GgVL4D+PATPJ
 J0V0y+3GZePpQfsPN4NfoBjY31eY1O3Sjfi8miKEin7HdYffCo+X5g5C/RewDOVwPu
 my3GTID6mh4myiCo4qXJTAm4RJYqrRO7T2US0QHIBIRCUqD7G3kY5yH8pQnJwzKquy
 IX2OhDQO/I6lw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B43617E10F4;
 Mon,  3 Nov 2025 18:13:33 +0100 (CET)
Date: Mon, 3 Nov 2025 18:13:29 +0100
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
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, =?UTF-8?B?TG8=?=
 =?UTF-8?B?w69j?= Molinari <loic.molinari@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v5 09/16] drm/panthor: Add flag to map GEM object
 Write-Back Cacheable
Message-ID: <20251103181329.21822c2d@fedora>
In-Reply-To: <d4695588-9371-4a75-9521-6d4cfc173608@arm.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-10-boris.brezillon@collabora.com>
 <d4695588-9371-4a75-9521-6d4cfc173608@arm.com>
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

On Mon, 3 Nov 2025 16:43:12 +0000
Akash Goel <akash.goel@arm.com> wrote:

> On 10/30/25 14:05, Boris Brezillon wrote:
> > From: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> >
> > Will be used by the UMD to optimize CPU accesses to buffers
> > that are frequently read by the CPU, or on which the access
> > pattern makes non-cacheable mappings inefficient.
> >
> > Mapping buffers CPU-cached implies taking care of the CPU
> > cache maintenance in the UMD, unless the GPU is IO coherent.
> >
> > v2:
> > - Add more to the commit message
> > - Tweak the doc
> > - Make sure we sync the section of the BO pointing to the CS
> >    syncobj before we read its seqno
> >
> > v3:
> > - Fix formatting/spelling issues
> >
> > v4:
> > - Add Steve's R-b
> >
> > v5:
> > - Drop Steve's R-b (changes in the ioctl semantics requiring
> >    new review)
> >
> > Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/panthor/panthor_drv.c   |  7 ++++-
> >   drivers/gpu/drm/panthor/panthor_gem.c   | 37 +++++++++++++++++++++++--
> >   drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++--
> >   include/uapi/drm/panthor_drm.h          | 12 ++++++++
> >   4 files changed, 69 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pa=
nthor/panthor_drv.c
> > index c07fc5dcd4a1..4e915f5ef3fa 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -900,7 +900,8 @@ static int panthor_ioctl_vm_destroy(struct drm_devi=
ce *ddev, void *data,
> >       return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
> >   }
> >
> > -#define PANTHOR_BO_FLAGS             DRM_PANTHOR_BO_NO_MMAP
> > +#define PANTHOR_BO_FLAGS             (DRM_PANTHOR_BO_NO_MMAP | \
> > +                                      DRM_PANTHOR_BO_WB_MMAP)
> >
> >   static int panthor_ioctl_bo_create(struct drm_device *ddev, void *dat=
a,
> >                                  struct drm_file *file)
> > @@ -919,6 +920,10 @@ static int panthor_ioctl_bo_create(struct drm_devi=
ce *ddev, void *data,
> >               goto out_dev_exit;
> >       }
> >
> > +     if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
> > +         (args->flags & DRM_PANTHOR_BO_WB_MMAP))
> > +             return -EINVAL;
> > +
> >       if (args->exclusive_vm_id) {
> >               vm =3D panthor_vm_pool_get_vm(pfile->vms, args->exclusive=
_vm_id);
> >               if (!vm) {
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pa=
nthor/panthor_gem.c
> > index 1b1e98c61b8c..479a779ee59d 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -58,6 +58,39 @@ static void panthor_gem_debugfs_set_usage_flags(stru=
ct panthor_gem_object *bo, u
> >   static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo=
) {}
> >   #endif
> >
> > +static bool
> > +should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclus=
ive_vm)
> > +{
> > +     struct panthor_device *ptdev =3D container_of(bo->base.base.dev, =
struct panthor_device, base);
> > +
> > +     /* We can't do uncached mappings if the device is coherent,
> > +      * because the zeroing done by the shmem layer at page allocation
> > +      * time happens on a cached mapping which isn't CPU-flushed (at l=
east
> > +      * not on Arm64 where the flush is deferred to PTE setup time, and
> > +      * only done conditionally based on the mapping permissions). We =
can't
> > +      * rely on dma_map_sgtable()/dma_sync_sgtable_for_xxx() either to=
 flush
> > +      * those, because they are NOPed if dma_dev_coherent() returns tr=
ue.
> > +      *
> > +      * FIXME: Note that this problem is going to pop up again when we
> > +      * decide to support mapping buffers with the NO_MMAP flag as
> > +      * non-shareable (AKA buffers accessed only by the GPU), because =
we
> > +      * need the same CPU flush to happen after page allocation, other=
wise
> > +      * there's a risk of data leak or late corruption caused by a dir=
ty
> > +      * cacheline being evicted. At this point we'll need a way to for=
ce
> > +      * CPU cache maintenance regardless of whether the device is cohe=
rent
> > +      * or not.
> > +      */
> > +     if (ptdev->coherent)
> > +             return false;
> > +
> > +     /* Cached mappings are explicitly requested, so no write-combine.=
 */
> > +     if (bo->flags & DRM_PANTHOR_BO_WB_MMAP)
> > +             return false;
> > +
> > +     /* The default is write-combine. */
> > +     return true;
> > +}
> > +
> >   static void panthor_gem_free_object(struct drm_gem_object *obj)
> >   {
> >       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> > @@ -152,6 +185,7 @@ panthor_kernel_bo_create(struct panthor_device *ptd=
ev, struct panthor_vm *vm,
> >       bo =3D to_panthor_bo(&obj->base);
> >       kbo->obj =3D &obj->base;
> >       bo->flags =3D bo_flags;
> > +     bo->base.map_wc =3D should_map_wc(bo, vm);
> >
> >       if (vm =3D=3D panthor_fw_vm(ptdev))
> >               debug_flags |=3D PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
> > @@ -255,7 +289,6 @@ static const struct drm_gem_object_funcs panthor_ge=
m_funcs =3D {
> >    */
> >   struct drm_gem_object *panthor_gem_create_object(struct drm_device *d=
dev, size_t size)
> >   {
> > -     struct panthor_device *ptdev =3D container_of(ddev, struct pantho=
r_device, base);
> >       struct panthor_gem_object *obj;
> >
> >       obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> > @@ -263,7 +296,6 @@ struct drm_gem_object *panthor_gem_create_object(st=
ruct drm_device *ddev, size_t
> >               return ERR_PTR(-ENOMEM);
> >
> >       obj->base.base.funcs =3D &panthor_gem_funcs;
> > -     obj->base.map_wc =3D !ptdev->coherent;
> >       mutex_init(&obj->label.lock);
> >
> >       panthor_gem_debugfs_bo_init(obj);
> > @@ -298,6 +330,7 @@ panthor_gem_create_with_handle(struct drm_file *fil=
e,
> >
> >       bo =3D to_panthor_bo(&shmem->base);
> >       bo->flags =3D flags;
> > +     bo->base.map_wc =3D should_map_wc(bo, exclusive_vm);
> >
> >       if (exclusive_vm) {
> >               bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(exclusi=
ve_vm);
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index f5e01cb16cfc..7d5da5717de2 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -868,8 +868,11 @@ panthor_queue_get_syncwait_obj(struct panthor_grou=
p *group, struct panthor_queue
> >       struct iosys_map map;
> >       int ret;
> >
> > -     if (queue->syncwait.kmap)
> > -             return queue->syncwait.kmap + queue->syncwait.offset;
> > +     if (queue->syncwait.kmap) {
> > +             bo =3D container_of(queue->syncwait.obj,
> > +                               struct panthor_gem_object, base.base);
> > +             goto out_sync;
> > +     }
> >
> >       bo =3D panthor_vm_get_bo_for_va(group->vm,
> >                                     queue->syncwait.gpu_va,
> > @@ -886,6 +889,17 @@ panthor_queue_get_syncwait_obj(struct panthor_grou=
p *group, struct panthor_queue
> >       if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
> >               goto err_put_syncwait_obj;
> >
> > +out_sync:
> > +     /* Make sure the CPU caches are invalidated before the seqno is r=
ead.
> > +      * drm_gem_shmem_sync() is a NOP if map_wc=3Dfalse, so no need to=
 check =20
>=20
> Sorry nitpick.
>=20
> IIUC, drm_gem_shmem_sync() would be a NOP if 'map_wc' is true.

Oops, will fix that.

>=20
>=20
>=20
> > +      * it here.
> > +      */
> > +     drm_gem_shmem_sync(&bo->base, queue->syncwait.offset,
> > +                        queue->syncwait.sync64 ?
> > +                                sizeof(struct panthor_syncobj_64b) :
> > +                                sizeof(struct panthor_syncobj_32b),
> > +                        DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALID=
ATE);
> > +
> >       return queue->syncwait.kmap + queue->syncwait.offset;
> >
> >   err_put_syncwait_obj:
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_=
drm.h
> > index 7eec9f922183..57e2f5ffa03c 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -681,6 +681,18 @@ struct drm_panthor_vm_get_state {
> >   enum drm_panthor_bo_flags {
> >       /** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-=
mapped in userspace. */
> >       DRM_PANTHOR_BO_NO_MMAP =3D (1 << 0),
> > +
> > +     /**
> > +      * @DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mapp=
ing.
> > +      *
> > +      * CPU map the buffer object in userspace by forcing the "Write-B=
ack
> > +      * Cacheable" cacheability attribute. The mapping otherwise uses =
the
> > +      * "Non-Cacheable" attribute if the GPU is not IO coherent.
> > +      *
> > +      * Can't be set if exclusive_vm_id=3D0 (only private BOs can be m=
apped
> > +      * cacheable). =20
>=20
> Sorry Boris, I may have misinterpreted the code.
>=20
> As per the comment, DRM_PANTHOR_BO_WB_MMAP flag should be rejected if
> 'exclusive_vm' is NULL. But I don't see any check for 'exclusive_vm'
> pointer inside should_map_wc().

You're right, I had this behavior enforced at some point, and dropped
it after adding {begin,end}_cpu_access() implementations to panthor.
I'll revisit the comment or re-introduce the check in v6 based on how
the review process goes.
