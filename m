Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0384369B2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115546E471;
	Thu, 21 Oct 2021 17:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C66E471;
 Thu, 21 Oct 2021 17:48:31 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id g14so941865qvb.0;
 Thu, 21 Oct 2021 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qDWTHyy75fUmTy/5nYWBlXI97/PUjvunHLAf/D9j1I=;
 b=TJjjeSK8ncb+AdeLxILY/fSFaippjcabvRVafiAWiedi2BUziYisQV0C4pHKNnECox
 rtQdm1o+ym4QXlnx1MF7TPEW3NzvV5demeNDnglp4DHUSltv23OCpPHVB+x2tlDAAWGD
 SqAnHoEWlKLkwwAHI0kKsC3VfFkpl4hqtobrr1jIKiQVl4qoxCRrtP3Je7k7Id/JTEEM
 H/B1KZpq62gBuSYo7w7mZHMxWsq0bZh+AyCa8f3Ng/MULJaTwHd/Tw6R56m0QfyC01ty
 TjvM2YIS89e2zCGnoGSPtjdnzBe0fYfp1Saxp2JaDzwccos0VcEZOAHHG5Myfnn1t1c9
 OGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qDWTHyy75fUmTy/5nYWBlXI97/PUjvunHLAf/D9j1I=;
 b=mbMZwUvwJ7g4/akD9WT++8lTsX+WOZVTyD+BaBdjARGd52AaNjJHyh5hghGoGJ5PtJ
 4qTWvkSns35TRwr/5FsmTaZUl2brKhHFA2rscpmBxsukpWhxHcVXGPU496Uvu3oXosfz
 5PYzWLGXHtOL+3jDqJ2Efbnjtd4rHob2yPpHpzK5d17JCBy8YK3e+ML/b+fJ04HGKxA9
 8b4ectMyZGIn1xJnPBMGRBF4vy2UMk/K2g7olOBMxZtmO1FHxfwbbhWG14k4cES1N+A4
 1Apxy3Y7N1UmtQ0Okh0+HA0lnp6L4gdwZb79BGdcuGKX3oeVvcKifMv96fGVARr0AQUE
 hfeA==
X-Gm-Message-State: AOAM5327I6LvBS1aqzOxhWylPpWEGJWQAQAkG3nAyTNo8SBemnrL1ARy
 4iW1yqv58zn4oPZr5h1hfQfnK9IPOL/PY7DsesFqnRh7Bqw=
X-Google-Smtp-Source: ABdhPJxVTocx2sRqYxkM1CJkH873GuSi4cAwjoOS5VbxZ6NX8O88ecbi8H7MUQLGzqybizXOsSknD8xGIwE7HY1yb4I=
X-Received: by 2002:ad4:5948:: with SMTP id eo8mr6916569qvb.1.1634838510729;
 Thu, 21 Oct 2021 10:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-15-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-15-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 18:48:03 +0100
Message-ID: <CAM0jSHPq1s9hV2gFmGK0Y9PPbgyTYKiaxzR-+xojbFNzU9EW-A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 15/28] drm/i915: Add lock for unbinding to
 i915_gem_object_ggtt_pin_ww
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Needs a proper commit message.

> ---
>  drivers/gpu/drm/i915/i915_gem.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 981e383d1a5d..6aa9e465b48e 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -931,7 +931,14 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>                         goto new_vma;
>                 }
>
> -               ret = i915_vma_unbind(vma);
> +               ret = 0;
> +               if (!ww)
> +                       ret = i915_gem_object_lock_interruptible(obj, NULL);
> +               if (!ret) {
> +                       ret = i915_vma_unbind(vma);
> +                       if (!ww)
> +                               i915_gem_object_unlock(obj);
> +               }

There is also a wait_for_bind below. Do we need the lock for that also?

>                 if (ret)
>                         return ERR_PTR(ret);
>         }
> --
> 2.33.0
>
