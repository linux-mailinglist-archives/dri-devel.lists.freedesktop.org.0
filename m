Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D93A443F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 16:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A516E24D;
	Fri, 11 Jun 2021 14:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F166E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 14:41:09 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso3329273otu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h0BOS5/BPRM3idDKmXs++kRy94BzHENijqdesrYa0HE=;
 b=F4nxb6iUB3PYe1CNvZriDioNs6TbhUrnNLV/ATUnEXUukerisCu87I15ZzBY4dQMDM
 b3OrGpFjQJq5VKlX8cHh78f7xGqRif81vCjoD+HqBkylPydreMJ54NXJB7J+qv7w1M32
 /X3+f5OlYiT5yrEf1gT+WHnbWBAk5xR3VOx/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h0BOS5/BPRM3idDKmXs++kRy94BzHENijqdesrYa0HE=;
 b=KusOLB9RmGjhaIKjYdE+oAx8HCzWZrUjutO8BOcauQUsGylGWyM/6wDwR/AB7QV8c+
 ESjEoVxN/NmKD3pYewwnF3inl4fjc/YO2d08NyqhxVR21G1I7JHFUwIW6TvE/InCC22N
 eaTX3Xm1apf5GijvIdLBeKAN4QGVGgpdCZuz8lEkqJrxi/JdodLDNu6GVyhuUERjZQ9D
 cHP4kH4pedPfrdSrtyNjQpsrTHlF0LLrfUhipKo9onO8QA6nQHI/K8L6Uy1olXvCvWn9
 jywxrY1R8Pa5NnXMYFvHunRWX9qAHdLTC41bkVj5RHDwjy+PNwmXwdKhcJATNUR/FXGq
 rNYQ==
X-Gm-Message-State: AOAM531oraHZLue7ezS/ZvJ3Zxa7SKX0a1E9KrVBfEKetD1q+wZDbPby
 CfJ6wcDynql/Tmus/a9lmh1KU7SOwb9hQFyPYrfgXg==
X-Google-Smtp-Source: ABdhPJzN5G/oBNB1eBQfnN6titf6aMN6LGAVPuNLYK7W7fjGAvPMOCmq49Y0V/0mSjJUs07NyLyxZUq10wZMFZZo8+w=
X-Received: by 2002:a05:6830:2370:: with SMTP id
 r16mr3432173oth.188.1623422469012; 
 Fri, 11 Jun 2021 07:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-3-christian.koenig@amd.com>
 <YMMW0ROMlgJQyTdU@phenom.ffwll.local>
 <43177627-bc11-74b0-f88c-6475dd2904ff@gmail.com>
In-Reply-To: <43177627-bc11-74b0-f88c-6475dd2904ff@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Jun 2021 16:40:58 +0200
Message-ID: <CAKMK7uEiYxNju-g+ChduY6-ZQZwqrU4kgOz_5tyz96qcqzb--w@mail.gmail.com>
Subject: Re: [PATCH 2/7] dma-buf: add dma_fence_chain_alloc/free
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 1:48 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 11.06.21 um 09:54 schrieb Daniel Vetter:
> > On Thu, Jun 10, 2021 at 11:17:55AM +0200, Christian K=C3=B6nig wrote:
> >> Add a common allocation helper. Cleaning up the mix of kzalloc/kmalloc
> >> and some unused code in the selftest.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/dma-buf/st-dma-fence-chain.c          | 16 ++++----------
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 ++--
> >>   drivers/gpu/drm/drm_syncobj.c                 |  6 ++---
> >>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++---
> >>   drivers/gpu/drm/msm/msm_gem_submit.c          |  6 ++---
> >>   include/linux/dma-fence-chain.h               | 22 +++++++++++++++++=
++
> >>   6 files changed, 35 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st=
-dma-fence-chain.c
> >> index 9525f7f56119..8ce1ea59d31b 100644
> >> --- a/drivers/dma-buf/st-dma-fence-chain.c
> >> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> >> @@ -58,28 +58,20 @@ static struct dma_fence *mock_fence(void)
> >>      return &f->base;
> >>   }
> >>
> >> -static inline struct mock_chain {
> >> -    struct dma_fence_chain base;
> >> -} *to_mock_chain(struct dma_fence *f) {
> >> -    return container_of(f, struct mock_chain, base.base);
> >> -}
> >> -
> >>   static struct dma_fence *mock_chain(struct dma_fence *prev,
> >>                                  struct dma_fence *fence,
> >>                                  u64 seqno)
> >>   {
> >> -    struct mock_chain *f;
> >> +    struct dma_fence_chain *f;
> >>
> >> -    f =3D kmalloc(sizeof(*f), GFP_KERNEL);
> >> +    f =3D dma_fence_chain_alloc();
> >>      if (!f)
> >>              return NULL;
> >>
> >> -    dma_fence_chain_init(&f->base,
> >> -                         dma_fence_get(prev),
> >> -                         dma_fence_get(fence),
> >> +    dma_fence_chain_init(f, dma_fence_get(prev), dma_fence_get(fence)=
,
> >>                           seqno);
> >>
> >> -    return &f->base.base;
> >> +    return &f->base;
> >>   }
> >>
> >>   static int sanitycheck(void *arg)
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_cs.c
> >> index 90136f9dedd6..325e82621467 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >> @@ -1124,7 +1124,7 @@ static int amdgpu_cs_process_syncobj_timeline_ou=
t_dep(struct amdgpu_cs_parser *p
> >>
> >>              dep->chain =3D NULL;
> >>              if (syncobj_deps[i].point) {
> >> -                    dep->chain =3D kmalloc(sizeof(*dep->chain), GFP_K=
ERNEL);
> >> +                    dep->chain =3D dma_fence_chain_alloc();
> >>                      if (!dep->chain)
> >>                              return -ENOMEM;
> >>              }
> >> @@ -1132,7 +1132,7 @@ static int amdgpu_cs_process_syncobj_timeline_ou=
t_dep(struct amdgpu_cs_parser *p
> >>              dep->syncobj =3D drm_syncobj_find(p->filp,
> >>                                              syncobj_deps[i].handle);
> >>              if (!dep->syncobj) {
> >> -                    kfree(dep->chain);
> >> +                    dma_fence_chain_free(dep->chain);
> >>                      return -EINVAL;
> >>              }
> >>              dep->point =3D syncobj_deps[i].point;
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_synco=
bj.c
> >> index fdd2ec87cdd1..1c5b9ef6da37 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -861,7 +861,7 @@ static int drm_syncobj_transfer_to_timeline(struct=
 drm_file *file_private,
> >>                                   &fence);
> >>      if (ret)
> >>              goto err;
> >> -    chain =3D kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> >> +    chain =3D dma_fence_chain_alloc();
> >>      if (!chain) {
> >>              ret =3D -ENOMEM;
> >>              goto err1;
> >> @@ -1402,10 +1402,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_d=
evice *dev, void *data,
> >>              goto err_points;
> >>      }
> >>      for (i =3D 0; i < args->count_handles; i++) {
> >> -            chains[i] =3D kzalloc(sizeof(struct dma_fence_chain), GFP=
_KERNEL);
> >> +            chains[i] =3D dma_fence_chain_alloc();
> >>              if (!chains[i]) {
> >>                      for (j =3D 0; j < i; j++)
> >> -                            kfree(chains[j]);
> >> +                            dma_fence_chain_free(chains[j]);
> >>                      ret =3D -ENOMEM;
> >>                      goto err_chains;
> >>              }
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/=
gpu/drm/i915/gem/i915_gem_execbuffer.c
> >> index 66789111a24b..a22cb86730b3 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >> @@ -2983,7 +2983,7 @@ __free_fence_array(struct eb_fence *fences, unsi=
gned int n)
> >>      while (n--) {
> >>              drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
> >>              dma_fence_put(fences[n].dma_fence);
> >> -            kfree(fences[n].chain_fence);
> >> +            dma_fence_chain_free(fences[n].chain_fence);
> >>      }
> >>      kvfree(fences);
> >>   }
> >> @@ -3097,9 +3097,7 @@ add_timeline_fence_array(struct i915_execbuffer =
*eb,
> >>                              return -EINVAL;
> >>                      }
> >>
> >> -                    f->chain_fence =3D
> >> -                            kmalloc(sizeof(*f->chain_fence),
> >> -                                    GFP_KERNEL);
> >> +                    f->chain_fence =3D dma_fence_chain_alloc();
> >>                      if (!f->chain_fence) {
> >>                              drm_syncobj_put(syncobj);
> >>                              dma_fence_put(fence);
> >> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/ms=
m/msm_gem_submit.c
> >> index 5480852bdeda..6ff6df6c4791 100644
> >> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> >> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> >> @@ -586,9 +586,7 @@ static struct msm_submit_post_dep *msm_parse_post_=
deps(struct drm_device *dev,
> >>                              break;
> >>                      }
> >>
> >> -                    post_deps[i].chain =3D
> >> -                            kmalloc(sizeof(*post_deps[i].chain),
> >> -                                    GFP_KERNEL);
> >> +                    post_deps[i].chain =3D dma_fence_chain_alloc();
> >>                      if (!post_deps[i].chain) {
> >>                              ret =3D -ENOMEM;
> >>                              break;
> >> @@ -605,7 +603,7 @@ static struct msm_submit_post_dep *msm_parse_post_=
deps(struct drm_device *dev,
> >>
> >>      if (ret) {
> >>              for (j =3D 0; j <=3D i; ++j) {
> >> -                    kfree(post_deps[j].chain);
> >> +                    dma_fence_chain_free(post_deps[j].chain);
> >>                      if (post_deps[j].syncobj)
> >>                              drm_syncobj_put(post_deps[j].syncobj);
> >>              }
> >> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence=
-chain.h
> >> index 9d6a062be640..5f45689a6d2e 100644
> >> --- a/include/linux/dma-fence-chain.h
> >> +++ b/include/linux/dma-fence-chain.h
> >> @@ -12,6 +12,7 @@
> >>
> >>   #include <linux/dma-fence.h>
> >>   #include <linux/irq_work.h>
> >> +#include <linux/slab.h>
> >>
> >>   /**
> >>    * struct dma_fence_chain - fence to represent an node of a fence ch=
ain
> >> @@ -53,6 +54,27 @@ to_dma_fence_chain(struct dma_fence *fence)
> >>      return container_of(fence, struct dma_fence_chain, base);
> >>   }
> >>
> >> +/**
> >> + * dma_fence_chain_alloc
> >> + *
> >> + * Returns a new dma_fence_chain object
> > ... or NULL on failure.
> >
> >> + */
> >> +static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
> >> +{
> >> +    return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> >> +};
> >> +
> >> +/**
> >> + * dma_fence_chain_free
> >> + * @chain: chain node to free
> >> + *
> >> + * Frees up an allocated but not used dma_fence_chain node.
> >> + */
> >> +static inline void dma_fence_chain_free(struct dma_fence_chain *chain=
)
> >> +{
> >> +    kfree(chain);
> > kfree_rcu, and I guess this means this patch here should be cc: stable.
>
> Nope, kfree() is correct here.
>
> This is to free up fences which never been initialized, so an RCU grace
> period isn't necessary because nobody could potentially have a reference.

Hah I got tricked. I see you have the next revision out there already,
I'll drop some suggestions on the kerneldoc so it's clearer what this
does and why.
-Daniel
> Christian.
>
> > This is kinda why I'm questioning whether this "dma_fence are protected=
 by
> > rcu" cross driver api is really a good idea. We largely get it wrong in
> > the details in a _ton_ of places.
> >
> > With the details fixed:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> >> +
> >>   /**
> >>    * dma_fence_chain_for_each - iterate over all fences in chain
> >>    * @iter: current fence
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
