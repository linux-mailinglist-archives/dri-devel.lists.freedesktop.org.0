Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551546D2F5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 13:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE5472DE3;
	Wed,  8 Dec 2021 12:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B6C72DE5;
 Wed,  8 Dec 2021 12:08:12 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id de30so1799847qkb.0;
 Wed, 08 Dec 2021 04:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUWyCuH1GjHTizo9OL3sty+WXQ/L+4z/cJ7qo785EO8=;
 b=pd237NZ86Wp5VgcSfQFafztqzdNeKZCnZJqysyV1ntNc2gf0Hyh4tUS9WnatV4ujQ7
 g4Wd3R+3BER26FKzFg89aMBAaT/pC2k8T9tnxOwWOFsh2SPlb2xZjIr6FGSmS4GcW44t
 tZrPrIEVmUx3jd7tUlPZ8jW9DUKdr9Ley5s+VHO1Nl0NNHYHvtC+AsPo85bydLRjOUYX
 5UFOlF1MyrGq2i5tJo75NbhoimcxuMYqD9NHTkJhZFxoD45iZWyrVFE5ac5UuSRSKqaO
 z6QRXdQVaP7bMVKpR2ZrC9d162BFM0qW11Xbaswmb7AdSHINVd9YgAQ8Z5+k6CoHnD10
 zonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUWyCuH1GjHTizo9OL3sty+WXQ/L+4z/cJ7qo785EO8=;
 b=PgIqDznxRdteFWDc30tjYPeVWR2jpUJnnufLVTD1R5CzaS49k3A75K7MaxYEqIMwNT
 bj3Ej7fyc9cHN5xVmEVGFrzwfM2/JR2nNvnAlXoA/9/YnA8wtOXiSMaIaT3q+bIWeN2M
 tLJWT0n1xnlq4GRD0KJfcWH3bpTgv5Upglvv9DIX+WDMVQXjL4T524CnpaEM+XaLj4pf
 IF8z1m1mQz5YOEngIWb3YKyGRqMUFCW89SrZg8De7BWyH5Xv9ldcjOsJo6FAwAupM5oF
 4llL4LV8m0hUG4FVzvCZhWcqoJh58iDuaef3MaNw5AM5iAlrC9agclJB1eV95PrbDlhp
 ow2Q==
X-Gm-Message-State: AOAM532qziZkjPK5uTb2tQvj6bhYb5b0IHS3t6nNguq/Ht8ecVImxSF0
 io8ET8+FE1WQzEuVvDwiiWhwJPp/noo+Xt2EVxv7VFiMB7E=
X-Google-Smtp-Source: ABdhPJy8LHHkVgx+4+lMSJcULNW/LIL2PwL+ZKo8SQl+ajim2skUh145u3S4SmnEFo41rMJ7UxGQCS8sdqzX7isMInU=
X-Received: by 2002:a05:620a:2413:: with SMTP id
 d19mr6208161qkn.82.1638965291460; 
 Wed, 08 Dec 2021 04:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-11-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-11-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 8 Dec 2021 12:07:45 +0000
Message-ID: <CAM0jSHPrBmKN+o27ZYvYxHj9BvM3y3tF4ZVh2HCH_AZtPboPbg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 10/16] drm/i915: Make i915_gem_evict_vm
 work correctly for already locked objects
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

On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> i915_gem_execbuf will call i915_gem_evict_vm() after failing to pin
> all objects in the first round. We are about to remove those short-term
> pins, but even without those the objects are still locked. Add a special
> case to allow i915_gem_evict_vm to evict locked objects as well.
>
> This might also allow multiple objects sharing the same resv to be evicted.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Do we need similar treatment for stuff like evict_for_node etc?

> ---
>  drivers/gpu/drm/i915/i915_gem_evict.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index 24f5e3345e43..f502a617b35c 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -410,21 +410,42 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
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
> +                        */
> +                       if (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx)) {
> +                               __i915_vma_pin(vma);
> +                               list_add(&vma->evict_link, &locked_eviction_list);
> +                               continue;
> +                       }
> +
>                         if (!i915_gem_object_trylock(vma->obj, ww))
>                                 continue;
>
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
> --
> 2.34.0
>
