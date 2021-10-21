Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768E43675D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 18:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFB489FD1;
	Thu, 21 Oct 2021 16:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70FE89FCA;
 Thu, 21 Oct 2021 16:13:17 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id r17so922047qtx.10;
 Thu, 21 Oct 2021 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42wgC7/OJ1iZJFVTsytDh53+gbOn4bGIDLlbQmkjweE=;
 b=kJVH15q6EyB5qEPMLtvb7J+FvohGaFZmdw1oZ2632qZCzBuL5eINzWulpqbN87+RFM
 ORt352ScEJeWm5EPTAJcuTIGpkl8aJj9ZqmkpkQoTMvr+coVsP9it81W7tujfbw/CWsk
 cHTyfyJM9df0D/BFpHMKWM7O4NkFdlqdWeH39vdQMOr7wzmFxjI8dmNacZAg+bDCK8aY
 V0gldbutQHdShDilGbQ/eKSSjpG8RMkXhp9RBCPK62boFZpbfjML142XD4IL+Nzl1RPk
 9qPMNecB4TtqIAYC5p7dwalcoZY+OXqnlNLcBEkoiZ988/lMMNYDzvObJb8eXXnI66RI
 lkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42wgC7/OJ1iZJFVTsytDh53+gbOn4bGIDLlbQmkjweE=;
 b=jBExIVsXmlQh9WafK3pP4DVxmxqQC7PgVeuA+JN1KO1XSnBDYWPMtUjJpOFjRIxEjo
 CXaI2MovPLqoVRhy7vZH2zY6XygC0ltHp7kwdmoG+ixqHaVFsazp9TPIIwxyoYyb4CSB
 WGTZJBBw01zjMlvUDJMVXA6jTNiX7CziPY186B7C/yMI61VFehaCWp+IRVuZUrhpg2Tv
 4T8NejkPgvzKfJ2rixSLudKFKRNmj3oqsXRIy4lzLRToeQDq2Pc75DKaFlD2I0aaisHi
 w4d8dhq+avxtddZDTNsnFNI35kheWLYdYP+nMjB5iqIVOaFKmsMHx8hNnChKO7WP8QNP
 AJTA==
X-Gm-Message-State: AOAM533JPLZx9qPv0/oRxJvsD2UzXE6as20vbIw7wVSmtN+YTNS1j2Eh
 fmXciDiKFR54aeArHKuf8TTXmXsSV9uv4k58rwc=
X-Google-Smtp-Source: ABdhPJw7sXYwYxH67AcWbXVIvBHv+KFgeTbhoTTjkXIWbmlm7oYeZNt+RL0RvX2AVdA6FdT5OT4GeN+ZTcKrjMcrtFw=
X-Received: by 2002:ac8:7f52:: with SMTP id g18mr7028905qtk.196.1634832797083; 
 Thu, 21 Oct 2021 09:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-10-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-10-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 17:12:49 +0100
Message-ID: <CAM0jSHO+A=Ocop-xirPeWxjaYvQ8w-K76jkCWvwOwXPgAkVuYA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 10/28] drm/i915: Change shrink ordering to use
 locking around unbinding.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Call drop_pages with the gem object lock held, instead of the other
> way around. This will allow us to drop the vma bindings with the
> gem object lock held.
>
> We plan to require the object lock for unpinning in the future,
> and this is an easy target.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 42 ++++++++++----------
>  1 file changed, 22 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index af3eb7fd951d..d3f29a66cb36 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -36,8 +36,8 @@ static bool can_release_pages(struct drm_i915_gem_object *obj)
>         return swap_available() || obj->mm.madv == I915_MADV_DONTNEED;
>  }
>
> -static bool unsafe_drop_pages(struct drm_i915_gem_object *obj,
> -                             unsigned long shrink, bool trylock_vm)
> +static int drop_pages(struct drm_i915_gem_object *obj,
> +                      unsigned long shrink, bool trylock_vm)
>  {
>         unsigned long flags;
>
> @@ -208,26 +208,28 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>
>                         spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
>
> -                       err = 0;
> -                       if (unsafe_drop_pages(obj, shrink, trylock_vm)) {
> -                               /* May arrive from get_pages on another bo */
> -                               if (!ww) {
> -                                       if (!i915_gem_object_trylock(obj))
> -                                               goto skip;
> -                               } else {
> -                                       err = i915_gem_object_lock(obj, ww);
> -                                       if (err)
> -                                               goto skip;
> -                               }
> -
> -                               if (!__i915_gem_object_put_pages(obj)) {
> -                                       try_to_writeback(obj, shrink);
> -                                       count += obj->base.size >> PAGE_SHIFT;
> -                               }
> -                               if (!ww)
> -                                       i915_gem_object_unlock(obj);
> +                       /* May arrive from get_pages on another bo */
> +                       if (!ww) {
> +                               if (!i915_gem_object_trylock(obj))
> +                                       goto skip;
> +                       } else {
> +                               err = i915_gem_object_lock(obj, ww);
> +                               if (err)
> +                                       goto skip;
>                         }
>
> +                       if (drop_pages(obj, shrink, trylock_vm) &&
> +                           !__i915_gem_object_put_pages(obj)) {
> +                               try_to_writeback(obj, shrink);
> +                               count += obj->base.size >> PAGE_SHIFT;
> +                       }
> +
> +                       if (dma_resv_test_signaled(obj->base.resv, true))
> +                               dma_resv_add_excl_fence(obj->base.resv, NULL);

I assume we want to rip out resv_prune here in the series, or
something? Instead of randomly adding this back here.

> +
> +                       if (!ww)
> +                               i915_gem_object_unlock(obj);
> +
>                         scanned += obj->base.size >> PAGE_SHIFT;
>  skip:
>                         i915_gem_object_put(obj);
> --
> 2.33.0
>
