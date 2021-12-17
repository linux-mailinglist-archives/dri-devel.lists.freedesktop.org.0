Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF341478AAC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 12:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EDD10E556;
	Fri, 17 Dec 2021 11:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290FC10E526;
 Fri, 17 Dec 2021 11:58:55 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id m25so2230825qtq.13;
 Fri, 17 Dec 2021 03:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wT8ClecYdhCVdvDuMUr/1pzhtVDKCf9vH9eDundTQ/c=;
 b=SjUYfrn7sNVzlvtAc/g4OFz+BkHSyl0aBs2H7HbMsB4q0bj8aP+uGjhv4LSXL+Dduh
 5/yX0vhinUzG8Jsmu+c5OG11nPDapfB7z99LOE6DBTjFTmo6fAEB+uNXBzewd3jmOCSv
 7YSdMqdL4afOEGf+ZxR/OjJk9zVhTf+S8aP+SYU9cQA5RUlglOHArey7hwSln2psOIKM
 4jC7XwhcEGhCOYpOjgHwZHBnp3hAMtZ4tPt0aftn6dkxxQwrl1FiuIGRG2cYXpo5+/LS
 lN9ATzg/DkSOdPwkmJgz3nMe4l1GFyC2fvBYDyzlqHecemahZPUzzYv4prygX59Uq7cx
 DrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wT8ClecYdhCVdvDuMUr/1pzhtVDKCf9vH9eDundTQ/c=;
 b=115sPmbnmozrLS/DCh+ab0LX02r4bu/kVzLEf/h2j0DrWJK9o3zRCqdUb8/Za67+1O
 AiY0p2DaMcP+4e6v+OijeHcOx6i1Kgi5Ahns/z2s6uxssReM8kmwcHDA1gcjEOciN3AR
 11Xb/3vtLbcTUT72wZIvxJmvnZ9PAg/a1rooYKfW6VrbYfPjq17P2iAQWb6BabHl0n4F
 AJHfnqrzK+DQ4m9W5TsevWVddeuZOLlxFlt+uZpCmpmXorEBC9GUNVkiYpLtbJ2s/Ott
 7wL2vCWwYggROgAVhW05s39QVIxJ/4Hq0fQM3Y13nhbW53uEXI8tGQWXmVDQkRwKR1Cr
 u4CQ==
X-Gm-Message-State: AOAM530owfqvuen+CY6iV4NT2f0XJ73l3yc9pG8+bieNPEyfMKCb+TuA
 KswRNxL6lOvVv0tB0J2CrpKNN0a5Kq2qqOaIg7ZpqRwp/yw=
X-Google-Smtp-Source: ABdhPJxm+dI59V/GnTEd69bM/FbLoMtIjPaqHkRj98AkU9+w35rNd/RkhgwrN9LB9snvOX4NU1gALrk+JcmPfZIRuOs=
X-Received: by 2002:a05:622a:1990:: with SMTP id
 u16mr1862913qtc.355.1639742334189; 
 Fri, 17 Dec 2021 03:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-9-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-9-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 11:58:27 +0000
Message-ID: <CAM0jSHOL-dxs7v314p=iKDkRLDfR3Q=6bFoejydxTMd7Tbw=vQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/17] drm/i915: Call i915_gem_evict_vm in vm_fault_gtt
 to prevent new ENOSPC errors
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
> Now that we cannot unbind kill the currently locked object directly

"unbind kill"

> because we're removing short term pinning, we may have to unbind the
> object from gtt manually, using a i915_gem_evict_vm() call.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Maybe mention that this only in preparation for some future patches,
once the actual eviction is trylock and evict_for_vm can also handle
shared dma-resv? At this point in the series we shouldn't expect to
hit -ENOSPC, right?

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index af81d6c3332a..00cd9642669a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -358,8 +358,22 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>                         vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
>                 }
>
> -               /* The entire mappable GGTT is pinned? Unexpected! */
> -               GEM_BUG_ON(vma == ERR_PTR(-ENOSPC));
> +               /*
> +                * The entire mappable GGTT is pinned? Unexpected!
> +                * Try to evict the object we locked too, as normally we skip it
> +                * due to lack of short term pinning inside execbuf.
> +                */
> +               if (vma == ERR_PTR(-ENOSPC)) {
> +                       ret = mutex_lock_interruptible(&ggtt->vm.mutex);
> +                       if (!ret) {
> +                               ret = i915_gem_evict_vm(&ggtt->vm);
> +                               mutex_unlock(&ggtt->vm.mutex);
> +                       }
> +                       if (ret)
> +                               goto err_reset;
> +                       vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
> +               }
> +               GEM_WARN_ON(vma == ERR_PTR(-ENOSPC));

Looks like this is being triggered in CI, I assume because the trylock
could easily fail, due to contention? Is this expected for now? Do we
keep the WARN and track it as a known issue?

>         }
>         if (IS_ERR(vma)) {
>                 ret = PTR_ERR(vma);
> --
> 2.34.1
>
