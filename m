Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F02399480
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA186EE64;
	Wed,  2 Jun 2021 20:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118666EE75
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:22:52 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id n133so5598423ybf.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I0I9U+wng/m5Ohb4jhB0kRxv+JanGj3Wf3cxblry0nQ=;
 b=vNARSVm3ZWTKxPSoGoHeMsRTfozNRfsa/uDgp1QLYub5tJ73Il/L7doyZ8s7CsAkCx
 erFtczZCobyh6TKUvC5jKUbzgarJOmFWJcSigJ85qpNiOFqW1reOLtKGNVQlDOrnhTkD
 Dn3hVzGNLWyzKNu77225MKlnRS2s1O/97Ncf9E/cOVby00LNBxjedIg1EibvsZ1L59GZ
 RBoJh2U+rdCNLWSVwRipWiZalskfij388wLudbx/gZmiBGhgVySTLm+QXGJ6/Ik8Jnob
 rFB8UFydPdjjq39I1mDNF+vGqJWAqOfi6aagUDj7w9wnL0Os3JgGd6w6XoA2xfkcDmCF
 yGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I0I9U+wng/m5Ohb4jhB0kRxv+JanGj3Wf3cxblry0nQ=;
 b=GOepn7PB+R5c0Oi4LexIn0StdpC3MR8fyT6lc8giSTjV27Zob8wXN7uEkJCmJLpYRg
 0FX89XIk8p/MYa5i9lztKKXYuYXBEEpGw4jRfUwk23SdeU/m+PQV102skFeGh8384FVQ
 IbZaf1cL8SAwgHvKQxUmsK5hetEV+BhQt7X8pmy41ZBGLEzuuQ5atiLwmZziJSlOu55o
 cpdVaGbTviL+RK+EWQ/087tMqHlnNmt6fOwUiaqAByLmhBrjw/K11HyDe+udg3aLlQgr
 jXJuwDEZDuRsD6v/U+blQ7OzbGlAjwYrtvwjNk3dD6RIkuzTI/zHtlEtFKcQLkLn0E+L
 6EcA==
X-Gm-Message-State: AOAM533XjKIJfpUJP0Hq2t3RunCcg+dXxGD/t6ocjqsDmgSt0GsvMsH4
 glBWPXPaViCOsijUIxAPycoP5cOixh0cy6BCLQoHWA==
X-Google-Smtp-Source: ABdhPJzt18+0E9ceX8KZYlthSfNNB0JBSD1DrJCjQd/FueL3YDl74dJP51Bp46ngU7NetLNVFod7ftO3dv6oNDmpdZ4=
X-Received: by 2002:a25:8804:: with SMTP id c4mr49859931ybl.469.1622665371052; 
 Wed, 02 Jun 2021 13:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-5-christian.koenig@amd.com>
In-Reply-To: <20210602111714.212426-5-christian.koenig@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 2 Jun 2021 15:22:39 -0500
Message-ID: <CAOFGe96ZUA6JM5oJF4p6B6XB6=xyjPg13wv8X4qkAAvJUCXNbg@mail.gmail.com>
Subject: Re: [PATCH 5/7] dma-buf: rename and cleanup dma_resv_get_list
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 6:17 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> When the comment needs to state explicitly that this is doesn't get a ref=
erence
> to the object then the function is named rather badly.
>
> Rename the function and use it in even more places.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                    | 32 +++++++++----------
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                 |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_fence.c       |  2 +-
>  drivers/gpu/drm/qxl/qxl_debugfs.c             |  2 +-
>  drivers/gpu/drm/radeon/radeon_sync.c          |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
>  include/linux/dma-resv.h                      | 25 +++++++--------
>  13 files changed, 39 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 81b032b43457..b1a1a31dc009 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -149,8 +149,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, uns=
igned int num_fences)
>
>         dma_resv_assert_held(obj);
>
> -       old =3D dma_resv_get_list(obj);
> -
> +       old =3D dma_resv_shared(obj);
>         if (old && old->shared_max) {
>                 if ((old->shared_count + num_fences) <=3D old->shared_max=
)
>                         return 0;
> @@ -217,12 +216,13 @@ EXPORT_SYMBOL(dma_resv_reserve_shared);
>   */
>  void dma_resv_reset_shared_max(struct dma_resv *obj)
>  {
> -       /* Test shared fence slot reservation */
> -       if (rcu_access_pointer(obj->fence)) {
> -               struct dma_resv_list *fence =3D dma_resv_get_list(obj);
> +       struct dma_resv_list *fences =3D dma_resv_shared(obj);
>
> -               fence->shared_max =3D fence->shared_count;
> -       }
> +       dma_resv_assert_held(obj);

Does it make sense to assert we hold the lock *before* we touch it
with something that requires that we do?  Maybe it doesn't matter?

> +
> +       /* Test shared fence slot reservation */
> +       if (fences)
> +               fences->shared_max =3D fences->shared_count;
>  }
>  #endif
>
> @@ -244,7 +244,7 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, =
struct dma_fence *fence)
>
>         dma_resv_assert_held(obj);
>
> -       fobj =3D dma_resv_get_list(obj);
> +       fobj =3D dma_resv_shared(obj);
>         count =3D fobj->shared_count;
>
>         write_seqcount_begin(&obj->seq);
> @@ -287,7 +287,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, st=
ruct dma_fence *fence)
>
>         dma_resv_assert_held(obj);
>
> -       old =3D dma_resv_get_list(obj);
> +       old =3D dma_resv_shared(obj);
>         if (old)
>                 i =3D old->shared_count;
>
> @@ -326,7 +326,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct=
 dma_resv *src)
>         dma_resv_assert_held(dst);
>
>         rcu_read_lock();
> -       src_list =3D rcu_dereference(src->fence);
> +       src_list =3D dma_resv_shared(src);
>
>  retry:
>         if (src_list) {
> @@ -339,7 +339,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct=
 dma_resv *src)
>                         return -ENOMEM;
>
>                 rcu_read_lock();
> -               src_list =3D rcu_dereference(src->fence);
> +               src_list =3D dma_resv_shared(src);
>                 if (!src_list || src_list->shared_count > shared_count) {
>                         kfree(dst_list);
>                         goto retry;
> @@ -357,7 +357,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct=
 dma_resv *src)
>
>                         if (!dma_fence_get_rcu(fence)) {
>                                 dma_resv_list_free(dst_list);
> -                               src_list =3D rcu_dereference(src->fence);
> +                               src_list =3D dma_resv_shared(src);
>                                 goto retry;
>                         }
>
> @@ -376,7 +376,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct=
 dma_resv *src)
>         new =3D dma_fence_get_rcu_safe(&src->fence_excl);
>         rcu_read_unlock();
>
> -       src_list =3D dma_resv_get_list(dst);
> +       src_list =3D dma_resv_shared(dst);
>         old =3D dma_resv_exclusive(dst);
>
>         write_seqcount_begin(&dst->seq);
> @@ -429,7 +429,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>                 if (fence_excl && !dma_fence_get_rcu(fence_excl))
>                         goto unlock;
>
> -               fobj =3D rcu_dereference(obj->fence);
> +               fobj =3D dma_resv_shared(obj);
>                 if (fobj)
>                         sz +=3D sizeof(*shared) * fobj->shared_max;
>
> @@ -535,7 +535,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
>         }
>
>         if (wait_all) {
> -               struct dma_resv_list *fobj =3D rcu_dereference(obj->fence=
);
> +               struct dma_resv_list *fobj =3D dma_resv_shared(obj);
>
>                 if (fobj)
>                         shared_count =3D fobj->shared_count;
> @@ -620,7 +620,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj,=
 bool test_all)
>         seq =3D read_seqcount_begin(&obj->seq);
>
>         if (test_all) {
> -               struct dma_resv_list *fobj =3D rcu_dereference(obj->fence=
);
> +               struct dma_resv_list *fobj =3D dma_resv_shared(obj);
>                 unsigned int i;
>
>                 if (fobj)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index d5e6519bdea1..e90495ca49fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -247,7 +247,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct=
 amdgpu_bo *bo,
>         if (!ef)
>                 return -EINVAL;
>
> -       old =3D dma_resv_get_list(resv);
> +       old =3D dma_resv_shared(resv);
>         if (!old)
>                 return 0;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index 6dd0ea6e9e24..3b13c8a38c4e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -49,7 +49,7 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
>         unsigned int count;
>         int r;
>
> -       if (!dma_resv_get_list(obj)) /* no shared fences to convert */
> +       if (!dma_resv_shared(obj)) /* no shared fences to convert */
>                 return 0;
>
>         r =3D dma_resv_get_fences_rcu(obj, NULL, &count, &fences);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sync.c
> index c84d5b843985..c50d9f92a0cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -213,7 +213,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, stru=
ct amdgpu_sync *sync,
>         f =3D dma_resv_exclusive(resv);
>         r =3D amdgpu_sync_fence(sync, f);
>
> -       flist =3D dma_resv_get_list(resv);
> +       flist =3D dma_resv_shared(resv);
>         if (!flist || r)
>                 return r;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 663aa7d2e2ea..ddb6ce7d48bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1338,7 +1338,7 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct =
ttm_buffer_object *bo,
>          * If true, then return false as any KFD process needs all its BO=
s to
>          * be resident to run successfully
>          */
> -       flist =3D dma_resv_get_list(bo->base.resv);
> +       flist =3D dma_resv_shared(bo->base.resv);
>         if (flist) {
>                 for (i =3D 0; i < flist->shared_count; ++i) {
>                         f =3D rcu_dereference_protected(flist->shared[i],
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index d4f54dea8ac1..4d43b8630f0e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -461,7 +461,7 @@ static void etnaviv_gem_describe(struct drm_gem_objec=
t *obj, struct seq_file *m)
>                         off, etnaviv_obj->vaddr, obj->size);
>
>         rcu_read_lock();
> -       fobj =3D rcu_dereference(robj->fence);
> +       fobj =3D dma_resv_shared(robj);
>         if (fobj) {
>                 unsigned int i, shared_count =3D fobj->shared_count;
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i=
915/gem/i915_gem_busy.c
> index 02312a0c3a36..3f94becac541 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -116,7 +116,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *dat=
a,
>         args->busy =3D busy_check_writer(dma_resv_exclusive(obj->base.res=
v));
>
>         /* Translate shared fences to READ set of engines */
> -       list =3D rcu_dereference(obj->base.resv->fence);
> +       list =3D dma_resv_shared(obj->base.resv);
>         if (list) {
>                 unsigned int shared_count =3D list->shared_count, i;
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 54c1b53426d6..43af91df552e 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -817,7 +817,7 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>         struct dma_fence *fence;
>         int i, ret;
>
> -       fobj =3D dma_resv_get_list(obj->resv);
> +       fobj =3D dma_resv_shared(obj->resv);
>         if (!fobj || (fobj->shared_count =3D=3D 0)) {
>                 fence =3D dma_resv_exclusive(obj->resv);
>                 /* don't need to wait on our own fences, since ring is fi=
fo */
> @@ -1025,7 +1025,7 @@ void msm_gem_describe(struct drm_gem_object *obj, s=
truct seq_file *m,
>         }
>
>         rcu_read_lock();
> -       fobj =3D rcu_dereference(robj->fence);
> +       fobj =3D dma_resv_shared(robj);
>         if (fobj) {
>                 unsigned int i, shared_count =3D fobj->shared_count;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/no=
uveau/nouveau_fence.c
> index a6cb35181aee..5ce441c655ea 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -355,7 +355,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct no=
uveau_channel *chan, bool e
>                         return ret;
>         }
>
> -       fobj =3D dma_resv_get_list(resv);
> +       fobj =3D dma_resv_shared(resv);
>         fence =3D dma_resv_exclusive(resv);
>
>         if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_=
debugfs.c
> index 183d15e2cf58..0acc70a6d3dd 100644
> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
> @@ -61,7 +61,7 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data=
)
>                 int rel;
>
>                 rcu_read_lock();
> -               fobj =3D rcu_dereference(bo->tbo.base.resv->fence);
> +               fobj =3D dma_resv_shared(bo->tbo.base.resv);
>                 rel =3D fobj ? fobj->shared_count : 0;
>                 rcu_read_unlock();
>
> diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeo=
n/radeon_sync.c
> index e476f90ef1c1..a9cdb88da173 100644
> --- a/drivers/gpu/drm/radeon/radeon_sync.c
> +++ b/drivers/gpu/drm/radeon/radeon_sync.c
> @@ -105,7 +105,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
>         else if (f)
>                 r =3D dma_fence_wait(f, true);
>
> -       flist =3D dma_resv_get_list(resv);
> +       flist =3D dma_resv_shared(resv);
>         if (shared || !flist || r)
>                 return r;
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 92361556bf0b..c41ef0caa492 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -261,7 +261,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer=
_object *bo)
>         int i;
>
>         rcu_read_lock();
> -       fobj =3D rcu_dereference(resv->fence);
> +       fobj =3D dma_resv_shared(resv);
>         fence =3D dma_resv_exclusive(resv);
>         if (fence && !fence->ops->signaled)
>                 dma_fence_enable_sw_signaling(fence);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 7549ec5eb35c..98ac66fecb71 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -78,20 +78,6 @@ struct dma_resv {
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>
> -/**
> - * dma_resv_get_list - get the reservation object's
> - * shared fence list, with update-side lock held
> - * @obj: the reservation object
> - *
> - * Returns the shared fence list.  Does NOT take references to
> - * the fence.  The obj->lock must be held.
> - */
> -static inline struct dma_resv_list *dma_resv_get_list(struct dma_resv *o=
bj)
> -{
> -       return rcu_dereference_protected(obj->fence,
> -                                        dma_resv_held(obj));
> -}
> -
>  #ifdef CONFIG_DEBUG_MUTEXES
>  void dma_resv_reset_shared_max(struct dma_resv *obj);
>  #else
> @@ -267,6 +253,17 @@ dma_resv_get_excl_rcu(struct dma_resv *obj)
>         return fence;
>  }
>
> +/**
> + * dma_resv_shared - get the reservation object's shared fence list
> + * @obj: the reservation object
> + *
> + * Returns the shared fence list. The obj->lock or rcu read side must be=
 held.
> + */
> +static inline struct dma_resv_list *dma_resv_shared(struct dma_resv *obj=
)

Maybe dma_resv_shared_list() just to be a little more clear what's
being returned?

--Jason

> +{
> +       return rcu_dereference_check(obj->fence, dma_resv_held(obj));
> +}
> +
>  void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fence=
s);
> --
> 2.25.1
>
