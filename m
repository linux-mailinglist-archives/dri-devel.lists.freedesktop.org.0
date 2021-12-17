Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A4C478CE4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A915D11237C;
	Fri, 17 Dec 2021 13:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0311112378;
 Fri, 17 Dec 2021 13:56:01 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id t6so2153322qkg.1;
 Fri, 17 Dec 2021 05:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eNUBcNoRkTQ4avlDkmVvaeE4yQJazFgqJFJ0/5Pgrfo=;
 b=T5kdMKmvxLMKba3uw05OLzIPNClRIGckzevrqrMftk94goptV0/UDwNodnp3hBdah/
 9ONQhqT6o8LIBrfQa0+unP88atcVf7y51p5N6S/S7xpDqMRmVEiXLAB9+fo9hhrPSO9n
 lrGBMcGpA8QfOF8ILwxZDruND32/Kb7ceM1bCyf5FRgNwqFRUZNkRAubB62tBJqBknkm
 ufQcS57+CAMRX1xJTSCOzwcrbCgYIq+SVbops1e1skfwDwAAhE9zNqWBjJFAWHojIeiN
 ifzHv8AaP3zWNUe6IFLElZhabHb/4hHUEBS3MWLvYMEQd/5/nS51ZQqn7FD6w6Jdjg9k
 cIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eNUBcNoRkTQ4avlDkmVvaeE4yQJazFgqJFJ0/5Pgrfo=;
 b=3sd+SiccwWCxeRdN3zFe7ALY5am6M4QjVQUwcQXaCkOQpU01/4wc9n79mOus7ENEz/
 T67xA0Cf/Q563yBsMwgQl+fjqyOUfK7aH6GX6orypChR0Jw4WjTp+4/zOMK78ReTg3xX
 O96o7Z0EI4Isw9ai9J4aJM7ZXiFPAp/DUlk0/xRquapL4xNnEt1oHmYjHijGN4j35gQX
 1GJIpvWNvfiTHULnugKq/Njhi1+3DL3xZsVTtrZKelS8BAAJUyFA4rGZ5iOVByNJIjde
 IO0gyP92yLFPCTvVXAZG11amzR4NyMZa2AcS2X78BAUZGcNTgeEphF8ZRPzovzqaueEW
 4Hvw==
X-Gm-Message-State: AOAM532LHHcC40XJyM5JSNUGwC0pSA0ujQuvVcfYsSZU8rOXJv9xX1Yi
 9sz2rMy8evOjeoCnA9gtD7t/6tBAySQacdkuDA18szmwXHhbiw==
X-Google-Smtp-Source: ABdhPJzcowsO6VM8H/0vv5tm6LkJMBGAK2mR0CO60ysdMXXt3vBux6jO6tf0gZFuXc3J48oj/xIq2b7qaHao5TTv6Bg=
X-Received: by 2002:a05:620a:4244:: with SMTP id
 w4mr1650330qko.569.1639749360523; 
 Fri, 17 Dec 2021 05:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-14-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-14-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 13:55:33 +0000
Message-ID: <CAM0jSHMyN6YtBG-==7G-SYO5HJOE1MrxyfNtJLveGTndX9QuAQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 13/17] drm/i915: Add object locking to
 i915_gem_evict_for_node and i915_gem_evict_something
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Dec 2021 at 14:28, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Because we will start to require the obj->resv lock for unbinding,
> ensure these shrinker functions also take the lock.
>
> This requires some function signature changes, to ensure that the
> ww context is passed around, but is mostly straightforward.

Do we even need this? We aren't handling the shared dma-resv for these
ones, right? Or more just to have a consistent-ish interface?

>
> Previously this was split up into several patches, but reworking
> should allow for easier bisection.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
>  drivers/gpu/drm/i915/gvt/aperture_gm.c        |  2 +-
>  drivers/gpu/drm/i915/i915_drv.h               |  2 ++
>  drivers/gpu/drm/i915/i915_gem_evict.c         | 34 +++++++++++++++----
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |  8 +++--
>  drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 ++
>  drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
>  drivers/gpu/drm/i915/i915_vma.c               |  9 ++---
>  .../gpu/drm/i915/selftests/i915_gem_evict.c   | 17 +++++-----
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 14 ++++----
>  11 files changed, 63 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index a287c9186ec9..ed43e9c80aaa 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -504,7 +504,7 @@ static int ggtt_reserve_guc_top(struct i915_ggtt *ggtt)
>         GEM_BUG_ON(ggtt->vm.total <= GUC_GGTT_TOP);
>         size = ggtt->vm.total - GUC_GGTT_TOP;
>
> -       ret = i915_gem_gtt_reserve(&ggtt->vm, &ggtt->uc_fw, size,
> +       ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, &ggtt->uc_fw, size,
>                                    GUC_GGTT_TOP, I915_COLOR_UNEVICTABLE,
>                                    PIN_NOEVICT);
>         if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index e5ad4d5a91c0..a3597a6bb805 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -1382,7 +1382,7 @@ static int evict_vma(void *data)
>         complete(&arg->completion);
>
>         mutex_lock(&vm->mutex);
> -       err = i915_gem_evict_for_node(vm, &evict, 0);
> +       err = i915_gem_evict_for_node(vm, NULL, &evict, 0);
>         mutex_unlock(&vm->mutex);
>
>         return err;
> diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> index 0d6d59871308..c08098a167e9 100644
> --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> @@ -63,7 +63,7 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
>
>         mutex_lock(&gt->ggtt->vm.mutex);
>         mmio_hw_access_pre(gt);
> -       ret = i915_gem_gtt_insert(&gt->ggtt->vm, node,
> +       ret = i915_gem_gtt_insert(&gt->ggtt->vm, NULL, node,
>                                   size, I915_GTT_PAGE_SIZE,
>                                   I915_COLOR_UNEVICTABLE,
>                                   start, end, flags);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index c180019c607f..2a98192a89c1 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1718,11 +1718,13 @@ i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
>
>  /* i915_gem_evict.c */
>  int __must_check i915_gem_evict_something(struct i915_address_space *vm,
> +                                         struct i915_gem_ww_ctx *ww,
>                                           u64 min_size, u64 alignment,
>                                           unsigned long color,
>                                           u64 start, u64 end,
>                                           unsigned flags);
>  int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
> +                                        struct i915_gem_ww_ctx *ww,
>                                          struct drm_mm_node *node,
>                                          unsigned int flags);
>  int i915_gem_evict_vm(struct i915_address_space *vm,
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index bfd66f539fc1..f502a617b35c 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -51,6 +51,7 @@ static int ggtt_flush(struct intel_gt *gt)
>
>  static bool
>  mark_free(struct drm_mm_scan *scan,
> +         struct i915_gem_ww_ctx *ww,
>           struct i915_vma *vma,
>           unsigned int flags,
>           struct list_head *unwind)
> @@ -58,6 +59,9 @@ mark_free(struct drm_mm_scan *scan,
>         if (i915_vma_is_pinned(vma))
>                 return false;
>
> +       if (!i915_gem_object_trylock(vma->obj, ww))
> +               return false;
> +
>         list_add(&vma->evict_link, unwind);
>         return drm_mm_scan_add_block(scan, &vma->node);
>  }
> @@ -98,6 +102,7 @@ static bool defer_evict(struct i915_vma *vma)
>   */
>  int
>  i915_gem_evict_something(struct i915_address_space *vm,
> +                        struct i915_gem_ww_ctx *ww,
>                          u64 min_size, u64 alignment,
>                          unsigned long color,
>                          u64 start, u64 end,
> @@ -170,7 +175,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>                         continue;
>                 }
>
> -               if (mark_free(&scan, vma, flags, &eviction_list))
> +               if (mark_free(&scan, ww, vma, flags, &eviction_list))
>                         goto found;
>         }
>
> @@ -178,6 +183,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>         list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
>                 ret = drm_mm_scan_remove_block(&scan, &vma->node);
>                 BUG_ON(ret);
> +               i915_gem_object_unlock(vma->obj);
>         }
>
>         /*
> @@ -222,10 +228,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
>          * of any of our objects, thus corrupting the list).
>          */
>         list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
> -               if (drm_mm_scan_remove_block(&scan, &vma->node))
> +               if (drm_mm_scan_remove_block(&scan, &vma->node)) {
>                         __i915_vma_pin(vma);
> -               else
> +               } else {
>                         list_del(&vma->evict_link);
> +                       i915_gem_object_unlock(vma->obj);
> +               }
>         }
>
>         /* Unbinding will emit any required flushes */
> @@ -234,16 +242,22 @@ i915_gem_evict_something(struct i915_address_space *vm,
>                 __i915_vma_unpin(vma);
>                 if (ret == 0)
>                         ret = __i915_vma_unbind(vma);
> +
> +               i915_gem_object_unlock(vma->obj);
>         }
>
>         while (ret == 0 && (node = drm_mm_scan_color_evict(&scan))) {
>                 vma = container_of(node, struct i915_vma, node);
>
> +

Spurious new line.

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>                 /* If we find any non-objects (!vma), we cannot evict them */
> -               if (vma->node.color != I915_COLOR_UNEVICTABLE)
> +               if (vma->node.color != I915_COLOR_UNEVICTABLE &&
> +                   i915_gem_object_trylock(vma->obj, ww)) {
>                         ret = __i915_vma_unbind(vma);
> -               else
> -                       ret = -ENOSPC; /* XXX search failed, try again? */
> +                       i915_gem_object_unlock(vma->obj);
> +               } else {
> +                       ret = -ENOSPC;
> +               }
>         }
>
>         return ret;
> @@ -261,6 +275,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>   * memory in e.g. the shrinker.
>   */
>  int i915_gem_evict_for_node(struct i915_address_space *vm,
> +                           struct i915_gem_ww_ctx *ww,
>                             struct drm_mm_node *target,
>                             unsigned int flags)
>  {
> @@ -333,6 +348,11 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>                         break;
>                 }
>
> +               if (!i915_gem_object_trylock(vma->obj, ww)) {
> +                       ret = -ENOSPC;
> +                       break;
> +               }
> +
>                 /*
>                  * Never show fear in the face of dragons!
>                  *
> @@ -350,6 +370,8 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>                 __i915_vma_unpin(vma);
>                 if (ret == 0)
>                         ret = __i915_vma_unbind(vma);
> +
> +               i915_gem_object_unlock(vma->obj);
>         }
>
>         return ret;
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index cd5f2348a187..c810da476c2b 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -93,6 +93,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>   * asked to wait for eviction and interrupted.
>   */
>  int i915_gem_gtt_reserve(struct i915_address_space *vm,
> +                        struct i915_gem_ww_ctx *ww,
>                          struct drm_mm_node *node,
>                          u64 size, u64 offset, unsigned long color,
>                          unsigned int flags)
> @@ -117,7 +118,7 @@ int i915_gem_gtt_reserve(struct i915_address_space *vm,
>         if (flags & PIN_NOEVICT)
>                 return -ENOSPC;
>
> -       err = i915_gem_evict_for_node(vm, node, flags);
> +       err = i915_gem_evict_for_node(vm, ww, node, flags);
>         if (err == 0)
>                 err = drm_mm_reserve_node(&vm->mm, node);
>
> @@ -184,6 +185,7 @@ static u64 random_offset(u64 start, u64 end, u64 len, u64 align)
>   * asked to wait for eviction and interrupted.
>   */
>  int i915_gem_gtt_insert(struct i915_address_space *vm,
> +                       struct i915_gem_ww_ctx *ww,
>                         struct drm_mm_node *node,
>                         u64 size, u64 alignment, unsigned long color,
>                         u64 start, u64 end, unsigned int flags)
> @@ -269,7 +271,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
>          */
>         offset = random_offset(start, end,
>                                size, alignment ?: I915_GTT_MIN_ALIGNMENT);
> -       err = i915_gem_gtt_reserve(vm, node, size, offset, color, flags);
> +       err = i915_gem_gtt_reserve(vm, ww, node, size, offset, color, flags);
>         if (err != -ENOSPC)
>                 return err;
>
> @@ -277,7 +279,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
>                 return -ENOSPC;
>
>         /* Randomly selected placement is pinned, do a search */
> -       err = i915_gem_evict_something(vm, size, alignment, color,
> +       err = i915_gem_evict_something(vm, ww, size, alignment, color,
>                                        start, end, flags);
>         if (err)
>                 return err;
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
> index c9b0ee5e1d23..e4938aba3fe9 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.h
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
> @@ -16,6 +16,7 @@
>
>  struct drm_i915_gem_object;
>  struct i915_address_space;
> +struct i915_gem_ww_ctx;
>
>  int __must_check i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>                                             struct sg_table *pages);
> @@ -23,11 +24,13 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>                                struct sg_table *pages);
>
>  int i915_gem_gtt_reserve(struct i915_address_space *vm,
> +                        struct i915_gem_ww_ctx *ww,
>                          struct drm_mm_node *node,
>                          u64 size, u64 offset, unsigned long color,
>                          unsigned int flags);
>
>  int i915_gem_gtt_insert(struct i915_address_space *vm,
> +                       struct i915_gem_ww_ctx *ww,
>                         struct drm_mm_node *node,
>                         u64 size, u64 alignment, unsigned long color,
>                         u64 start, u64 end, unsigned int flags);
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
> index 31a105bc1792..c97323973f9b 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -197,7 +197,7 @@ static int vgt_balloon_space(struct i915_ggtt *ggtt,
>         drm_info(&dev_priv->drm,
>                  "balloon space: range [ 0x%lx - 0x%lx ] %lu KiB.\n",
>                  start, end, size / 1024);
> -       ret = i915_gem_gtt_reserve(&ggtt->vm, node,
> +       ret = i915_gem_gtt_reserve(&ggtt->vm, NULL, node,
>                                    size, start, I915_COLOR_UNEVICTABLE,
>                                    0);
>         if (!ret)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index d24e90eac948..83df1290df5e 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -650,7 +650,8 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
>   * 0 on success, negative error code otherwise.
>   */
>  static int
> -i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
> +i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> +               u64 size, u64 alignment, u64 flags)
>  {
>         unsigned long color;
>         u64 start, end;
> @@ -702,7 +703,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>                     range_overflows(offset, size, end))
>                         return -EINVAL;
>
> -               ret = i915_gem_gtt_reserve(vma->vm, &vma->node,
> +               ret = i915_gem_gtt_reserve(vma->vm, ww, &vma->node,
>                                            size, offset, color,
>                                            flags);
>                 if (ret)
> @@ -741,7 +742,7 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>                                 size = round_up(size, I915_GTT_PAGE_SIZE_2M);
>                 }
>
> -               ret = i915_gem_gtt_insert(vma->vm, &vma->node,
> +               ret = i915_gem_gtt_insert(vma->vm, ww, &vma->node,
>                                           size, alignment, color,
>                                           start, end, flags);
>                 if (ret)
> @@ -1382,7 +1383,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>                 goto err_unlock;
>
>         if (!(bound & I915_VMA_BIND_MASK)) {
> -               err = i915_vma_insert(vma, size, alignment, flags);
> +               err = i915_vma_insert(vma, ww, size, alignment, flags);
>                 if (err)
>                         goto err_active;
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> index 7178811366af..c80e1483d603 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> @@ -117,7 +117,7 @@ static int igt_evict_something(void *arg)
>
>         /* Everything is pinned, nothing should happen */
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_something(&ggtt->vm,
> +       err = i915_gem_evict_something(&ggtt->vm, NULL,
>                                        I915_GTT_PAGE_SIZE, 0, 0,
>                                        0, U64_MAX,
>                                        0);
> @@ -132,11 +132,12 @@ static int igt_evict_something(void *arg)
>
>         /* Everything is unpinned, we should be able to evict something */
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_something(&ggtt->vm,
> +       err = i915_gem_evict_something(&ggtt->vm, NULL,
>                                        I915_GTT_PAGE_SIZE, 0, 0,
>                                        0, U64_MAX,
>                                        0);
>         mutex_unlock(&ggtt->vm.mutex);
> +
>         if (err) {
>                 pr_err("i915_gem_evict_something failed on a full GGTT with err=%d\n",
>                        err);
> @@ -204,7 +205,7 @@ static int igt_evict_for_vma(void *arg)
>
>         /* Everything is pinned, nothing should happen */
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
> +       err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
>         mutex_unlock(&ggtt->vm.mutex);
>         if (err != -ENOSPC) {
>                 pr_err("i915_gem_evict_for_node on a full GGTT returned err=%d\n",
> @@ -216,7 +217,7 @@ static int igt_evict_for_vma(void *arg)
>
>         /* Everything is unpinned, we should be able to evict the node */
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
> +       err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
>         mutex_unlock(&ggtt->vm.mutex);
>         if (err) {
>                 pr_err("i915_gem_evict_for_node returned err=%d\n",
> @@ -297,7 +298,7 @@ static int igt_evict_for_cache_color(void *arg)
>
>         /* Remove just the second vma */
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
> +       err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
>         mutex_unlock(&ggtt->vm.mutex);
>         if (err) {
>                 pr_err("[0]i915_gem_evict_for_node returned err=%d\n", err);
> @@ -310,7 +311,7 @@ static int igt_evict_for_cache_color(void *arg)
>         target.color = I915_CACHE_L3_LLC;
>
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_for_node(&ggtt->vm, &target, 0);
> +       err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
>         mutex_unlock(&ggtt->vm.mutex);
>         if (!err) {
>                 pr_err("[1]i915_gem_evict_for_node returned err=%d\n", err);
> @@ -408,7 +409,7 @@ static int igt_evict_contexts(void *arg)
>         /* Reserve a block so that we know we have enough to fit a few rq */
>         memset(&hole, 0, sizeof(hole));
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_gtt_insert(&ggtt->vm, &hole,
> +       err = i915_gem_gtt_insert(&ggtt->vm, NULL, &hole,
>                                   PRETEND_GGTT_SIZE, 0, I915_COLOR_UNEVICTABLE,
>                                   0, ggtt->vm.total,
>                                   PIN_NOEVICT);
> @@ -428,7 +429,7 @@ static int igt_evict_contexts(void *arg)
>                         goto out_locked;
>                 }
>
> -               if (i915_gem_gtt_insert(&ggtt->vm, &r->node,
> +               if (i915_gem_gtt_insert(&ggtt->vm, NULL, &r->node,
>                                         1ul << 20, 0, I915_COLOR_UNEVICTABLE,
>                                         0, ggtt->vm.total,
>                                         PIN_NOEVICT)) {
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 88b3a4d9e27e..169e2330b386 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1378,7 +1378,7 @@ static int igt_gtt_reserve(void *arg)
>                 }
>
>                 mutex_lock(&ggtt->vm.mutex);
> -               err = i915_gem_gtt_reserve(&ggtt->vm, &vma->node,
> +               err = i915_gem_gtt_reserve(&ggtt->vm, NULL, &vma->node,
>                                            obj->base.size,
>                                            total,
>                                            obj->cache_level,
> @@ -1430,7 +1430,7 @@ static int igt_gtt_reserve(void *arg)
>                 }
>
>                 mutex_lock(&ggtt->vm.mutex);
> -               err = i915_gem_gtt_reserve(&ggtt->vm, &vma->node,
> +               err = i915_gem_gtt_reserve(&ggtt->vm, NULL, &vma->node,
>                                            obj->base.size,
>                                            total,
>                                            obj->cache_level,
> @@ -1477,7 +1477,7 @@ static int igt_gtt_reserve(void *arg)
>                                            I915_GTT_MIN_ALIGNMENT);
>
>                 mutex_lock(&ggtt->vm.mutex);
> -               err = i915_gem_gtt_reserve(&ggtt->vm, &vma->node,
> +               err = i915_gem_gtt_reserve(&ggtt->vm, NULL, &vma->node,
>                                            obj->base.size,
>                                            offset,
>                                            obj->cache_level,
> @@ -1552,7 +1552,7 @@ static int igt_gtt_insert(void *arg)
>         /* Check a couple of obviously invalid requests */
>         for (ii = invalid_insert; ii->size; ii++) {
>                 mutex_lock(&ggtt->vm.mutex);
> -               err = i915_gem_gtt_insert(&ggtt->vm, &tmp,
> +               err = i915_gem_gtt_insert(&ggtt->vm, NULL, &tmp,
>                                           ii->size, ii->alignment,
>                                           I915_COLOR_UNEVICTABLE,
>                                           ii->start, ii->end,
> @@ -1594,7 +1594,7 @@ static int igt_gtt_insert(void *arg)
>                 }
>
>                 mutex_lock(&ggtt->vm.mutex);
> -               err = i915_gem_gtt_insert(&ggtt->vm, &vma->node,
> +               err = i915_gem_gtt_insert(&ggtt->vm, NULL, &vma->node,
>                                           obj->base.size, 0, obj->cache_level,
>                                           0, ggtt->vm.total,
>                                           0);
> @@ -1654,7 +1654,7 @@ static int igt_gtt_insert(void *arg)
>                 }
>
>                 mutex_lock(&ggtt->vm.mutex);
> -               err = i915_gem_gtt_insert(&ggtt->vm, &vma->node,
> +               err = i915_gem_gtt_insert(&ggtt->vm, NULL, &vma->node,
>                                           obj->base.size, 0, obj->cache_level,
>                                           0, ggtt->vm.total,
>                                           0);
> @@ -1703,7 +1703,7 @@ static int igt_gtt_insert(void *arg)
>                 }
>
>                 mutex_lock(&ggtt->vm.mutex);
> -               err = i915_gem_gtt_insert(&ggtt->vm, &vma->node,
> +               err = i915_gem_gtt_insert(&ggtt->vm, NULL, &vma->node,
>                                           obj->base.size, 0, obj->cache_level,
>                                           0, ggtt->vm.total,
>                                           0);
> --
> 2.34.1
>
