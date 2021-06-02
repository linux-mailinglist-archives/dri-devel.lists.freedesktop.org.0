Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27039943B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936106EE58;
	Wed,  2 Jun 2021 20:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9656EE58
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:05:09 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id z38so5552613ybh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tNoDdiQ4octjJpL149UGlAdDRBxzKbcmyJEOZeKCExQ=;
 b=AgQu7U9nvU7w2NnqfREkL1sOWHuDDIeeFDXXjLUetaZIeDAEvuz/eObFdyRyqAIi+m
 VCC/lbV/JjPkpVTCPadNvKQT0eTf0nKOYAU/yPEG9uR7eye3magtd3b3gJrLmXqHkWIJ
 O8zPXQpwF46D9E/TdbJvdAk8N1/7tETcdJg87how21YxLxXtvhsGUh1cMSgdmaGUTR9O
 L+kPZlUDW81SPuBlimWaI2DmI/3rfWwnTUU/euWR5Q96hDuuUQSfUIYnhI58wrjFu1on
 ZvtJOROzbQAdF8niJ6JxcsVoz1JqDTdv+f+mbZzypZfc1B8LYTy0/NGoPudE277iAScA
 Hd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tNoDdiQ4octjJpL149UGlAdDRBxzKbcmyJEOZeKCExQ=;
 b=nYx6jSBXDt5dfHmnBr6QfN/d+d9utCyLTItQArvYFb+Z8V9bGOqAJi4geRk2CPfvPf
 gHFJHYwyRvKLu1NJr3MX4eLoFjIWW96tBUguwWD8DKMFQ2Hh6LAjAp2goZpfPHzBe7sW
 698mXi8iR2CPsaxVIbkpGlPxOLvgHrxGK6g8uBTOFVr/tVJHPiHZ2XV4ekcTIxz+2UxZ
 3ILjFpMd6vj4Vi/1oJdaUPQOuq/3gDZ1fAI0OK7rrAK73F/v4sInZ5e2HHmb6HiKBHzo
 EkGFQYDPwYcLz+Oaesy6Bc+G2dPfhwtRpqhRINH0fFJjvG1zl+A12cltoUXIUjcmtA3P
 c5Rg==
X-Gm-Message-State: AOAM531KD0EzyJTw+P8aYunvfDmOZZw4FxKkcz4onUynwchvZ3bnhNCb
 sin056gzCFiJ3RVIUGzUWL5MuyhuZr+713Ss9Xf6nQ==
X-Google-Smtp-Source: ABdhPJzH1NbVljOfTpHGAOIv/SVkwE4XXuyKpR01AD1Sr8BzzqDZLrzHZ0iECI/1OUEgimD7R0B17fttiuSjRgcNKV4=
X-Received: by 2002:a25:3415:: with SMTP id b21mr13005134yba.241.1622664308483; 
 Wed, 02 Jun 2021 13:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-4-christian.koenig@amd.com>
 <YLd9AEupJZMeiG7L@phenom.ffwll.local>
In-Reply-To: <YLd9AEupJZMeiG7L@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 2 Jun 2021 15:04:57 -0500
Message-ID: <CAOFGe94Vpky6snj3THEqRbYmq2bqKp_kKG5mZLz80Mhii1M8jw@mail.gmail.com>
Subject: Re: [PATCH 4/7] dma-buf: rename and cleanup dma_resv_get_excl
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 7:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 02, 2021 at 01:17:11PM +0200, Christian K=C3=B6nig wrote:
> > When the comment needs to state explicitly that this
> > doesn't get a reference to the object then the function
> > is named rather badly.
> >
> > Rename the function and use rcu_dereference_check(), this
> > way it can be used from both rcu as well as lock protected
> > critical sections.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> I'd call this dma_resv_exlusive_fence, since without that it's a bit clos=
e

Or, if we want to keep it shorter, dma_resv_excl_fence().  I don't
care much either way

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

> to dma_resv_make_exclusive or something like that. But this is definitely
> better than the previous pointer deref in a "I'm totally getting you a
> full reference" trenchcoat thing.
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> > ---
> >  drivers/dma-buf/dma-buf.c                |  4 ++--
> >  drivers/dma-buf/dma-resv.c               | 10 +++++-----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c |  2 +-
> >  drivers/gpu/drm/etnaviv/etnaviv_gem.c    |  2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_busy.c |  3 +--
> >  drivers/gpu/drm/msm/msm_gem.c            |  4 ++--
> >  drivers/gpu/drm/nouveau/nouveau_bo.c     |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_fence.c  |  2 +-
> >  drivers/gpu/drm/radeon/radeon_display.c  |  2 +-
> >  drivers/gpu/drm/radeon/radeon_sync.c     |  2 +-
> >  drivers/gpu/drm/radeon/radeon_uvd.c      |  2 +-
> >  drivers/gpu/drm/ttm/ttm_bo.c             |  2 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  2 +-
> >  include/linux/dma-resv.h                 | 13 +++++--------
> >  15 files changed, 25 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index d3b4e370dbc1..4d0ddc712f1e 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -234,7 +234,7 @@ static __poll_t dma_buf_poll(struct file *file, pol=
l_table *poll)
> >               shared_count =3D fobj->shared_count;
> >       else
> >               shared_count =3D 0;
> > -     fence_excl =3D rcu_dereference(resv->fence_excl);
> > +     fence_excl =3D dma_resv_exclusive(resv);
> >       if (read_seqcount_retry(&resv->seq, seq)) {
> >               rcu_read_unlock();
> >               goto retry;
> > @@ -1385,7 +1385,7 @@ static int dma_buf_debug_show(struct seq_file *s,=
 void *unused)
> >               robj =3D buf_obj->resv;
> >               seq =3D read_seqcount_begin(&robj->seq);
> >               rcu_read_lock();
> > -             fence =3D rcu_dereference(robj->fence_excl);
> > +             fence =3D dma_resv_exclusive(robj);
> >               if (fence)
> >                       seq_printf(s, "\tExclusive fence: %s %s %ssignall=
ed\n",
> >                                  fence->ops->get_driver_name(fence),
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 6c6195315e9f..81b032b43457 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -281,7 +281,7 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
> >   */
> >  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *f=
ence)
> >  {
> > -     struct dma_fence *old_fence =3D dma_resv_get_excl(obj);
> > +     struct dma_fence *old_fence =3D dma_resv_exclusive(obj);
> >       struct dma_resv_list *old;
> >       u32 i =3D 0;
> >
> > @@ -377,7 +377,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, stru=
ct dma_resv *src)
> >       rcu_read_unlock();
> >
> >       src_list =3D dma_resv_get_list(dst);
> > -     old =3D dma_resv_get_excl(dst);
> > +     old =3D dma_resv_exclusive(dst);
> >
> >       write_seqcount_begin(&dst->seq);
> >       /* write_seqcount_begin provides the necessary memory barrier */
> > @@ -425,7 +425,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
> >               rcu_read_lock();
> >               seq =3D read_seqcount_begin(&obj->seq);
> >
> > -             fence_excl =3D rcu_dereference(obj->fence_excl);
> > +             fence_excl =3D dma_resv_exclusive(obj);
> >               if (fence_excl && !dma_fence_get_rcu(fence_excl))
> >                       goto unlock;
> >
> > @@ -520,7 +520,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj=
,
> >       rcu_read_lock();
> >       i =3D -1;
> >
> > -     fence =3D rcu_dereference(obj->fence_excl);
> > +     fence =3D dma_resv_exclusive(obj);
> >       if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags=
)) {
> >               if (!dma_fence_get_rcu(fence))
> >                       goto unlock_retry;
> > @@ -642,7 +642,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *ob=
j, bool test_all)
> >       }
> >
> >       if (!shared_count) {
> > -             struct dma_fence *fence_excl =3D rcu_dereference(obj->fen=
ce_excl);
> > +             struct dma_fence *fence_excl =3D dma_resv_exclusive(obj);
> >
> >               if (fence_excl) {
> >                       ret =3D dma_resv_test_signaled_single(fence_excl)=
;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gem.c
> > index 73c76a3e2b12..cd5146fa6fb6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -226,7 +226,7 @@ static void amdgpu_gem_object_close(struct drm_gem_=
object *obj,
> >       if (!amdgpu_vm_ready(vm))
> >               goto out_unlock;
> >
> > -     fence =3D dma_resv_get_excl(bo->tbo.base.resv);
> > +     fence =3D dma_resv_exclusive(bo->tbo.base.resv);
> >       if (fence) {
> >               amdgpu_bo_fence(bo, fence, true);
> >               fence =3D NULL;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_sync.c
> > index 4e558632a5d2..c84d5b843985 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > @@ -210,7 +210,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, st=
ruct amdgpu_sync *sync,
> >               return -EINVAL;
> >
> >       /* always sync to the exclusive fence */
> > -     f =3D dma_resv_get_excl(resv);
> > +     f =3D dma_resv_exclusive(resv);
> >       r =3D amdgpu_sync_fence(sync, f);
> >
> >       flist =3D dma_resv_get_list(resv);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/et=
naviv/etnaviv_gem.c
> > index db69f19ab5bc..d4f54dea8ac1 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > @@ -471,7 +471,7 @@ static void etnaviv_gem_describe(struct drm_gem_obj=
ect *obj, struct seq_file *m)
> >               }
> >       }
> >
> > -     fence =3D rcu_dereference(robj->fence_excl);
> > +     fence =3D dma_resv_exclusive(robj);
> >       if (fence)
> >               etnaviv_gem_describe_fence(fence, "Exclusive", m);
> >       rcu_read_unlock();
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm=
/i915/gem/i915_gem_busy.c
> > index 25235ef630c1..02312a0c3a36 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > @@ -113,8 +113,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *d=
ata,
> >       seq =3D raw_read_seqcount(&obj->base.resv->seq);
> >
> >       /* Translate the exclusive fence to the READ *and* WRITE engine *=
/
> > -     args->busy =3D
> > -             busy_check_writer(rcu_dereference(obj->base.resv->fence_e=
xcl));
> > +     args->busy =3D busy_check_writer(dma_resv_exclusive(obj->base.res=
v));
> >
> >       /* Translate shared fences to READ set of engines */
> >       list =3D rcu_dereference(obj->base.resv->fence);
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 56df86e5f740..54c1b53426d6 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -819,7 +819,7 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
> >
> >       fobj =3D dma_resv_get_list(obj->resv);
> >       if (!fobj || (fobj->shared_count =3D=3D 0)) {
> > -             fence =3D dma_resv_get_excl(obj->resv);
> > +             fence =3D dma_resv_exclusive(obj->resv);
> >               /* don't need to wait on our own fences, since ring is fi=
fo */
> >               if (fence && (fence->context !=3D fctx->context)) {
> >                       ret =3D dma_fence_wait(fence, true);
> > @@ -1035,7 +1035,7 @@ void msm_gem_describe(struct drm_gem_object *obj,=
 struct seq_file *m,
> >               }
> >       }
> >
> > -     fence =3D rcu_dereference(robj->fence_excl);
> > +     fence =3D dma_resv_exclusive(robj);
> >       if (fence)
> >               describe_fence(fence, "Exclusive", m);
> >       rcu_read_unlock();
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index e688ca77483d..ac0ebcc4ebb7 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -955,7 +955,7 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
> >  {
> >       struct nouveau_drm *drm =3D nouveau_bdev(bo->bdev);
> >       struct drm_device *dev =3D drm->dev;
> > -     struct dma_fence *fence =3D dma_resv_get_excl(bo->base.resv);
> > +     struct dma_fence *fence =3D dma_resv_exclusive(bo->base.resv);
> >
> >       nv10_bo_put_tile_region(dev, *old_tile, fence);
> >       *old_tile =3D new_tile;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/=
nouveau/nouveau_fence.c
> > index e5dcbf67de7e..a6cb35181aee 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -356,7 +356,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct =
nouveau_channel *chan, bool e
> >       }
> >
> >       fobj =3D dma_resv_get_list(resv);
> > -     fence =3D dma_resv_get_excl(resv);
> > +     fence =3D dma_resv_exclusive(resv);
> >
> >       if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
> >               struct nouveau_channel *prev =3D NULL;
> > diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/=
radeon/radeon_display.c
> > index 652af7a134bd..57c910e5ae77 100644
> > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > @@ -533,7 +533,7 @@ static int radeon_crtc_page_flip_target(struct drm_=
crtc *crtc,
> >               DRM_ERROR("failed to pin new rbo buffer before flip\n");
> >               goto cleanup;
> >       }
> > -     work->fence =3D dma_fence_get(dma_resv_get_excl(new_rbo->tbo.base=
.resv));
> > +     work->fence =3D dma_fence_get(dma_resv_exclusive(new_rbo->tbo.bas=
e.resv));
> >       radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
> >       radeon_bo_unreserve(new_rbo);
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/rad=
eon/radeon_sync.c
> > index 5d3302945076..e476f90ef1c1 100644
> > --- a/drivers/gpu/drm/radeon/radeon_sync.c
> > +++ b/drivers/gpu/drm/radeon/radeon_sync.c
> > @@ -98,7 +98,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
> >       int r =3D 0;
> >
> >       /* always sync to the exclusive fence */
> > -     f =3D dma_resv_get_excl(resv);
> > +     f =3D dma_resv_exclusive(resv);
> >       fence =3D f ? to_radeon_fence(f) : NULL;
> >       if (fence && fence->rdev =3D=3D rdev)
> >               radeon_sync_fence(sync, fence);
> > diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/rade=
on/radeon_uvd.c
> > index dfa9fdbe98da..02d4bbdc9111 100644
> > --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> > +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> > @@ -477,7 +477,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parse=
r *p, struct radeon_bo *bo,
> >               return -EINVAL;
> >       }
> >
> > -     f =3D dma_resv_get_excl(bo->tbo.base.resv);
> > +     f =3D dma_resv_exclusive(bo->tbo.base.resv);
> >       if (f) {
> >               r =3D radeon_fence_wait((struct radeon_fence *)f, false);
> >               if (r) {
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> > index 5a7ab4b35b2d..92361556bf0b 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -262,7 +262,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buff=
er_object *bo)
> >
> >       rcu_read_lock();
> >       fobj =3D rcu_dereference(resv->fence);
> > -     fence =3D rcu_dereference(resv->fence_excl);
> > +     fence =3D dma_resv_exclusive(resv);
> >       if (fence && !fence->ops->signaled)
> >               dma_fence_enable_sw_signaling(fence);
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_resource.c
> > index 62ea920addc3..c78f38ee1c20 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> > @@ -1166,7 +1166,7 @@ int vmw_resources_clean(struct vmw_buffer_object =
*vbo, pgoff_t start,
> >               if (bo->moving)
> >                       dma_fence_put(bo->moving);
> >               bo->moving =3D dma_fence_get
> > -                     (dma_resv_get_excl(bo->base.resv));
> > +                     (dma_resv_exclusive(bo->base.resv));
> >       }
> >
> >       return 0;
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index f32a3d176513..7549ec5eb35c 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -226,22 +226,19 @@ static inline void dma_resv_unlock(struct dma_res=
v *obj)
> >  }
> >
> >  /**
> > - * dma_resv_get_excl - get the reservation object's
> > - * exclusive fence, with update-side lock held
> > + * dma_resv_exclusive - return the object's exclusive fence
> >   * @obj: the reservation object
> >   *
> > - * Returns the exclusive fence (if any).  Does NOT take a
> > - * reference. Writers must hold obj->lock, readers may only
> > - * hold a RCU read side lock.
> > + * Returns the exclusive fence (if any). Caller must either hold the o=
bjects
> > + * lock or the rcu read side lock.
> >   *
> >   * RETURNS
> >   * The exclusive fence or NULL
> >   */
> >  static inline struct dma_fence *
> > -dma_resv_get_excl(struct dma_resv *obj)
> > +dma_resv_exclusive(struct dma_resv *obj)
> >  {
> > -     return rcu_dereference_protected(obj->fence_excl,
> > -                                      dma_resv_held(obj));
> > +     return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj))=
;
> >  }
> >
> >  /**
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
