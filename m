Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AEC6231ED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA16710E0FC;
	Wed,  9 Nov 2022 17:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91AA10E02C;
 Wed,  9 Nov 2022 17:53:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j4so27009430lfk.0;
 Wed, 09 Nov 2022 09:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a/bkjmBXqyNJYxjv8IhlpFhEQhYzoGQfDrx7DN4akjY=;
 b=MDgy9B6E9HGwYm6Njha//BSnS9MHdlA5LScMRo3d878iGPkHhqcnvB4YV2jprlgd0q
 qOX8DstJD3aAi2hjOfKet2vZByO6HGAiU0wtvQq6v5PhBBGBlkxVeDDD6iUksFF+Xaeo
 br7ZSWKHUjWc1AAXEFIpR3xe2S/7pifb5/e2HE1irHZyXQHFZ1f5x++0Xh2QYaTmQKnp
 RhsjUAOHz9TEuJT/Htj2zhP9nof4YSyGVQi84wRroEGQ6P//Wrc2QazJQfWz7W9YGZVc
 97fR5TDYc976Agm4qihG0gWrinM2J2VN+d7F/q/Q5E0hKJMfGwjWXAnZnAuifN3z0gRH
 jEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a/bkjmBXqyNJYxjv8IhlpFhEQhYzoGQfDrx7DN4akjY=;
 b=40y3yPM0v/6BN7nmZ4e525W23TvhidttvJbrhKbVHvNOJCeXgsHbELmB4nwce0Bb4N
 Yt+38UZjaDI43mAv50I1sRle3mfVLORdHsGY3uSGzmVFam1m9Eyaixi1JMTECvXh3bhq
 cW2e8gVCIDHwoimYvq5eFJ+UDVvAF95QdTOSTr/E2g2WedxKUvzeSw29+UlGd4bgvwbz
 MYU2SxZiKmzENWDeAq0GxM7c1SGUxxG3QqMZYAU/4nYBAaYqLMvTA0M/WLEVQgehLGzb
 nJwtQc93a9C/0XAnul1z4o3DzXKUW+BwjyFGdHHqdWnvFIHgAv/ciFrPtMWZqiWUPKz4
 Ttaw==
X-Gm-Message-State: ACrzQf1AHJX37vMAElQ2KaTc/58mZQCoMddmcMd2IDXHXBdE/3RcMoaT
 OS04l9sNl7kv7GveCluuQX5AU2fnPuBv1qoVocE=
X-Google-Smtp-Source: AMsMyM7gObLlpJFmkKPcjRUG2lH0htds9+PCQYQFrQAh2Oi7fiUws+kTfVL4GPjPQUCmWjORyZqsQ1ehGNdkgkccoQQ=
X-Received: by 2002:a05:6512:34d2:b0:4a4:5ef8:4d16 with SMTP id
 w18-20020a05651234d200b004a45ef84d16mr20619799lfr.604.1668016401937; Wed, 09
 Nov 2022 09:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 9 Nov 2022 17:52:54 +0000
Message-ID: <CAM0jSHP6N321s4obATyEfVH1wUH2MEkU-bFy_yHShc=0M59=+w@mail.gmail.com>
Subject: Re: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Nov 2022 at 08:53, Niranjana Vishwanathapura
<niranjana.vishwanathapura@intel.com> wrote:
>
> Asynchronously unbind the vma upon vm_unbind call.
> Fall back to synchronous unbind if backend doesn't support
> async unbind or if async unbind fails.
>
> No need for vm_unbind out fence support as i915 will internally
> handle all sequencing and user need not try to sequence any
> operation with the unbind completion.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 51 ++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/i915/i915_vma.h |  1 +
>  2 files changed, 48 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 08218e3a2f12..03c966fad87b 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -42,6 +42,8 @@
>  #include "i915_vma.h"
>  #include "i915_vma_resource.h"
>
> +static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
> +
>  static inline void assert_vma_held_evict(const struct i915_vma *vma)
>  {
>         /*
> @@ -1711,7 +1713,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>         spin_unlock_irq(&gt->closed_lock);
>  }
>
> -static void force_unbind(struct i915_vma *vma)
> +static void force_unbind(struct i915_vma *vma, bool async)
>  {
>         if (!drm_mm_node_allocated(&vma->node))
>                 return;
> @@ -1725,7 +1727,21 @@ static void force_unbind(struct i915_vma *vma)
>                 i915_vma_set_purged(vma);
>
>         atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
> -       WARN_ON(__i915_vma_unbind(vma));
> +       if (async) {
> +               struct dma_fence *fence;
> +
> +               fence = __i915_vma_unbind_async(vma);
> +               if (IS_ERR_OR_NULL(fence)) {
> +                       async = false;
> +               } else {
> +                       dma_resv_add_fence(vma->obj->base.resv, fence,
> +                                          DMA_RESV_USAGE_READ);
> +                       dma_fence_put(fence);
> +               }
> +       }
> +
> +       if (!async)
> +               WARN_ON(__i915_vma_unbind(vma));
>         GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>  }
>
> @@ -1785,7 +1801,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>  {
>         lockdep_assert_held(&vma->vm->mutex);
>
> -       force_unbind(vma);
> +       force_unbind(vma, false);
>         list_del_init(&vma->vm_link);
>         release_references(vma, vma->vm->gt, false);
>  }
> @@ -1796,7 +1812,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>         bool vm_ddestroy;
>
>         mutex_lock(&vma->vm->mutex);
> -       force_unbind(vma);
> +       force_unbind(vma, false);
> +       list_del_init(&vma->vm_link);
> +       vm_ddestroy = vma->vm_ddestroy;
> +       vma->vm_ddestroy = false;
> +
> +       /* vma->vm may be freed when releasing vma->vm->mutex. */
> +       gt = vma->vm->gt;
> +       mutex_unlock(&vma->vm->mutex);
> +       release_references(vma, gt, vm_ddestroy);
> +}
> +
> +void i915_vma_destroy_async(struct i915_vma *vma)

Where are we calling this? I can't find it.

> +{
> +       bool vm_ddestroy, async = vma->obj->mm.rsgt;
> +       struct intel_gt *gt;
> +
> +       if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
> +               async = false;
> +
> +       mutex_lock(&vma->vm->mutex);
> +       /*
> +        * Ensure any asynchronous binding is complete while using
> +        * async unbind as we will be releasing the vma here.
> +        */
> +       if (async && i915_active_wait(&vma->active))
> +               async = false;
> +
> +       force_unbind(vma, async);
>         list_del_init(&vma->vm_link);
>         vm_ddestroy = vma->vm_ddestroy;
>         vma->vm_ddestroy = false;
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 737ef310d046..25f15965dab8 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>
>  void i915_vma_destroy_locked(struct i915_vma *vma);
>  void i915_vma_destroy(struct i915_vma *vma);
> +void i915_vma_destroy_async(struct i915_vma *vma);
>
>  #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
>
> --
> 2.21.0.rc0.32.g243a4c7e27
>
