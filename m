Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6234478C19
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777EE10FBB6;
	Fri, 17 Dec 2021 13:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E870C10FBB1;
 Fri, 17 Dec 2021 13:19:54 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id t6so2042861qkg.1;
 Fri, 17 Dec 2021 05:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HpE4CEjIgyhJJ+x0rL1tFgTKFJk1ap47g1VZbGoBCw=;
 b=awWtsrUqggbqaT5ZjGjR4Z6rT+Cg3aR2MqQyOfoVD12c8z+Q8xHrEtzC9Dptw0Hbat
 tmy5zl1PbHZEUKjDXz9dxowjIP8k+YW+9BlbZNtAgRDFt/eQ6R0G1hbtF0wbN483OaXn
 GdqPImBZ96RjFUiixj/MXRA19zJqbCrpvAxANTTW1i6sIklSBhEkHxh5grBCKscX2Cll
 MEO3KsWippCqp3B5Y00giMPpyfq2chKvfYrnLbirh1k90l9l5yfKANY3p+Zc7IIeIWYC
 s5zIGw+2apdvmO3V3n1UOFBXV5JtF4ZoeaCfKrKV8X5r0IvdD0hTmvt/gUO79fyuCiZc
 gRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HpE4CEjIgyhJJ+x0rL1tFgTKFJk1ap47g1VZbGoBCw=;
 b=j1vBUGpjp4VIcCaJAA4T7swur0JDNmxhpZFWlSFl9dW4TZ/G5CpeeW815gTjPuUKIt
 5aYuSq7xqOM161RNi5VbltwfQfATl2AZ7VZLJ+yks9KEdtVcB9zKKxbTLUtXxvXvZsJg
 8+cPM/DBhl/D0fEx0oDymG8OttauAZ6TlyanEOb6mEA0PVnBQ0tJWyJHfUgfnIZROHnF
 6Qya4oLPhFwEoYOI8H3Ke1Sj6JdqAyGmK6B+YOQGaxvg5SaVNA4GJjhbyTfsp+jYy8cn
 jkHsiyXCCwmW55KhdogwoxiUFRDGkzkP0Mjd2DGyq8zyfd/htiVQCJacPG3PmnK+vCvG
 AnKw==
X-Gm-Message-State: AOAM530eew6dPcVx8F9FdTOFKbKHmFq5mHrhqj2jv3bD85hvxy3CXITf
 gtOR4ltTPqZM2eZxscgvK/G3hUq71pp+FrxGkq7Py7t4cmA=
X-Google-Smtp-Source: ABdhPJyPZZVyq+WzDCJ6BRHYvDgMjWCl56B7QsAk4cSs0B/SNIPIY1Liq+m/IsZpH4JNxSEvNyk3TdIIpq8hITcTUfE=
X-Received: by 2002:a37:a353:: with SMTP id m80mr1623904qke.7.1639747193744;
 Fri, 17 Dec 2021 05:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-13-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-13-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 13:19:27 +0000
Message-ID: <CAM0jSHMFF7x-FJjSPi3V3WiLuVwjd4QzfG=hWeYfhZEtWddn5w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 12/17] drm/i915: Add locking to
 i915_gem_evict_vm()
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
> i915_gem_evict_vm will need to be able to evict objects that are
> locked by the current ctx. By testing if the current context already
> locked the object, we can do this correctly. This allows us to
> evict the entire vm even if we already hold some objects' locks.
>
> Previously, this was spread over several commits, but it makes
> more sense to commit the changes to i915_gem_evict_vm separately
> from the changes to i915_gem_evict_something() and
> i915_gem_evict_for_node().
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
>  drivers/gpu/drm/i915/i915_drv.h               |  3 +-
>  drivers/gpu/drm/i915/i915_gem_evict.c         | 30 +++++++++++++++++--
>  drivers/gpu/drm/i915/i915_vma.c               |  7 ++++-
>  .../gpu/drm/i915/selftests/i915_gem_evict.c   | 10 +++++--
>  6 files changed, 46 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 2213f7b613da..eb3649e844ff 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -766,7 +766,7 @@ static int eb_reserve(struct i915_execbuffer *eb)
>                 case 1:
>                         /* Too fragmented, unbind everything and retry */
>                         mutex_lock(&eb->context->vm->mutex);
> -                       err = i915_gem_evict_vm(eb->context->vm);
> +                       err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
>                         mutex_unlock(&eb->context->vm->mutex);
>                         if (err)
>                                 return err;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 00cd9642669a..2856098cb449 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -366,7 +366,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>                 if (vma == ERR_PTR(-ENOSPC)) {
>                         ret = mutex_lock_interruptible(&ggtt->vm.mutex);
>                         if (!ret) {
> -                               ret = i915_gem_evict_vm(&ggtt->vm);
> +                               ret = i915_gem_evict_vm(&ggtt->vm, &ww);
>                                 mutex_unlock(&ggtt->vm.mutex);
>                         }
>                         if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d51628d10f9d..c180019c607f 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1725,7 +1725,8 @@ int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>  int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
>                                          struct drm_mm_node *node,
>                                          unsigned int flags);
> -int i915_gem_evict_vm(struct i915_address_space *vm);
> +int i915_gem_evict_vm(struct i915_address_space *vm,
> +                     struct i915_gem_ww_ctx *ww);
>
>  /* i915_gem_internal.c */
>  struct drm_i915_gem_object *
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index 2b73ddb11c66..bfd66f539fc1 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -367,7 +367,7 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>   * To clarify: This is for freeing up virtual address space, not for freeing
>   * memory in e.g. the shrinker.
>   */
> -int i915_gem_evict_vm(struct i915_address_space *vm)
> +int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>  {
>         int ret = 0;
>
> @@ -388,24 +388,50 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
>         do {
>                 struct i915_vma *vma, *vn;
>                 LIST_HEAD(eviction_list);
> +               LIST_HEAD(locked_eviction_list);
>
>                 list_for_each_entry(vma, &vm->bound_list, vm_link) {
>                         if (i915_vma_is_pinned(vma))
>                                 continue;
>
> +                       /*
> +                        * If we already own the lock, trylock fails. In case the resv
> +                        * is shared among multiple objects, we still need the object ref.

What is "object ref" here? I assume it's just leftovers...

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +                        */
> +                       if (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx)) {
> +                               __i915_vma_pin(vma);
> +                               list_add(&vma->evict_link, &locked_eviction_list);
> +                               continue;
> +                       }
> +
> +                       if (!i915_gem_object_trylock(vma->obj, ww))
> +                               continue;
> +
>                         __i915_vma_pin(vma);
>                         list_add(&vma->evict_link, &eviction_list);
>                 }
> -               if (list_empty(&eviction_list))
> +               if (list_empty(&eviction_list) && list_empty(&locked_eviction_list))
>                         break;
>
>                 ret = 0;
> +               /* Unbind locked objects first, before unlocking the eviction_list */
> +               list_for_each_entry_safe(vma, vn, &locked_eviction_list, evict_link) {
> +                       __i915_vma_unpin(vma);
> +
> +                       if (ret == 0)
> +                               ret = __i915_vma_unbind(vma);
> +                       if (ret != -EINTR) /* "Get me out of here!" */
> +                               ret = 0;
> +               }
> +
>                 list_for_each_entry_safe(vma, vn, &eviction_list, evict_link) {
>                         __i915_vma_unpin(vma);
>                         if (ret == 0)
>                                 ret = __i915_vma_unbind(vma);
>                         if (ret != -EINTR) /* "Get me out of here!" */
>                                 ret = 0;
> +
> +                       i915_gem_object_unlock(vma->obj);
>                 }
>         } while (ret == 0);
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index de24e4b3b19b..d24e90eac948 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1462,7 +1462,12 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>                 /* Unlike i915_vma_pin, we don't take no for an answer! */
>                 flush_idle_contexts(vm->gt);
>                 if (mutex_lock_interruptible(&vm->mutex) == 0) {
> -                       i915_gem_evict_vm(vm);
> +                       /*
> +                        * We pass NULL ww here, as we don't want to unbind
> +                        * locked objects when called from execbuf when pinning
> +                        * is removed. This would probably regress badly.
> +                        */
> +                       i915_gem_evict_vm(vm, NULL);
>                         mutex_unlock(&vm->mutex);
>                 }
>         } while (1);
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> index 7e0658a77659..7178811366af 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> @@ -331,6 +331,7 @@ static int igt_evict_vm(void *arg)
>  {
>         struct intel_gt *gt = arg;
>         struct i915_ggtt *ggtt = gt->ggtt;
> +       struct i915_gem_ww_ctx ww;
>         LIST_HEAD(objects);
>         int err;
>
> @@ -342,7 +343,7 @@ static int igt_evict_vm(void *arg)
>
>         /* Everything is pinned, nothing should happen */
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_vm(&ggtt->vm);
> +       err = i915_gem_evict_vm(&ggtt->vm, NULL);
>         mutex_unlock(&ggtt->vm.mutex);
>         if (err) {
>                 pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
> @@ -352,9 +353,14 @@ static int igt_evict_vm(void *arg)
>
>         unpin_ggtt(ggtt);
>
> +       i915_gem_ww_ctx_init(&ww, false);
>         mutex_lock(&ggtt->vm.mutex);
> -       err = i915_gem_evict_vm(&ggtt->vm);
> +       err = i915_gem_evict_vm(&ggtt->vm, &ww);
>         mutex_unlock(&ggtt->vm.mutex);
> +
> +       /* no -EDEADLK handling; can't happen with vm.mutex in place */
> +       i915_gem_ww_ctx_fini(&ww);
> +
>         if (err) {
>                 pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
>                        err);
> --
> 2.34.1
>
