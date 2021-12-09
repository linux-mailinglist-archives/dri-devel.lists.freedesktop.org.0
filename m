Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0E46EEB4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B277610E436;
	Thu,  9 Dec 2021 16:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192C589F8E;
 Thu,  9 Dec 2021 12:17:47 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id g9so4945180qvd.2;
 Thu, 09 Dec 2021 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/k9GrWcJhYBbsArhqmJxhaaL7EILnJZ2YfN/ur/nf4=;
 b=PtdpzwH78vDhD2gEztbjxqCf9UB3B8B8vlUNyVCxyNiNfwbvWnX6xFtZRCjAM03VVg
 /Ze51a8ZkRm/4nEiFRxbYmU2E646zYpayz/cXWqE2yc8nSDloDxJr77x8nCPcmAcCEC1
 T3uhQwvsBUlTsgXO6GYw5VVUmml+zSB/9oFjouAtp/K5UhZhaZZ85XMi/hJp7I5hRUEL
 CbYQzX2t0NKGJmSGmYigc9ilgJ0NEybUfvM0vC7yklqgaN/bJeA01Xj5OMMAW9PZR0u/
 o9Tr1s7d3naUPCkz5TxjRuRHWIyveT9xjGWfzXLLAK4YXJS4YlngnAU7O6YhexKnJulx
 CskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/k9GrWcJhYBbsArhqmJxhaaL7EILnJZ2YfN/ur/nf4=;
 b=L4IHwXeeGmtNY6ef3PnCmHoZBbXh2zCmg/Nt4gHwPQTgSewrMK5LPebv9zSeEMfbxc
 zwoPIjwoIceb+eAIAxSsieY29YoILsmKU45ybi0eXepzqpWf03azThsmylgrvsHAHFXT
 VECBmtwDc+V/Yfvc4rjd/crZq1SdaPQ1zPTwyXBsosp/ZipYTRwRNXAl+RxIyE2fqSzN
 2CvS2w6T+o/2+EbpUTb/o8qXbrLq6c1ZSfCx78CWzWYsf39adlaKfetg9QIVdozrOcuJ
 YRgKW4Z5vXrSKtsbbVoN0PmztGl+dM5Q9rqtidIQL3+5pOZugoKSq0Hnp2YVNrkGxuQq
 CYxA==
X-Gm-Message-State: AOAM533dNqusD5JbsTlXce2haamTjbwcmmQIUXAAU9OiUdsl2wd/bno5
 bJaKFvA13K0nvJQ3IZSbP4I1pEsEVFhbeRVlpdKKijhH5GQ=
X-Google-Smtp-Source: ABdhPJzrtDos8G2oSo0VYPeqb3mNT2Axpi8umu2/b8zB5beVl4AXjh9e7aOWhOaYPw9UJcP/1sKxEULBzxn0mTF9P6A=
X-Received: by 2002:ad4:5ce8:: with SMTP id iv8mr15719025qvb.21.1639052265909; 
 Thu, 09 Dec 2021 04:17:45 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-12-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-12-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Dec 2021 12:17:19 +0000
Message-ID: <CAM0jSHOH4JACquBQc0rTBbNTuo7x6FznZ6FEaEJfr9DDDF1crQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 11/16] drm/i915: Call i915_gem_evict_vm in
 vm_fault_gtt to prevent new ENOSPC errors
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
> Now that we cannot unbind kill the currently locked object directly

Can this be reworded slightly? Not sure what is meant by "unbind kill" here.

> because we're removing short term pinning, we may have to unbind the
> object from gtt manually, using a i915_gem_evict_vm() call.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 65fc6ff5f59d..6d557bb9926f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -357,8 +357,22 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
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
> +                               ret = i915_gem_evict_vm(&ggtt->vm, &ww);

Would it make sense to pass an extra flag for the above ggtt_pin(maybe
PIN_EVICT_SHARED)? Such that evict_for_something can handle the
already locked object and then also any vma sharing the same dma-resv
object here? Or at least trying to nuke the entire vm, just for the
mappable portion seems maybe overkill? Or perhaps we never expect to
hit this in the real world?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +                               mutex_unlock(&ggtt->vm.mutex);
> +                       }
> +                       if (ret)
> +                               goto err_reset;
> +                       vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
> +               }
> +               GEM_WARN_ON(vma == ERR_PTR(-ENOSPC));
>         }
>         if (IS_ERR(vma)) {
>                 ret = PTR_ERR(vma);
> --
> 2.34.0
>
