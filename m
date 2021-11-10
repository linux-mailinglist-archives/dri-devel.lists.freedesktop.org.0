Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1C44BF0A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EF36EE4D;
	Wed, 10 Nov 2021 10:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6286EE49;
 Wed, 10 Nov 2021 10:48:49 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id l8so1678363qtk.6;
 Wed, 10 Nov 2021 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nk2Suy6J3YiB0zzsECNTnASz9gapNF6qF2MzFjIeiJI=;
 b=Eee4hv4Z4DBmibFUQLzPLHqyo9306QED/4FNETfu6p/G9npPXvQ+IhvGwHdkfhCKC6
 3+ugW/L3QF5I6SfrY+WZaigkIqLU6L0Hq+IhmNBZXkSzWRjxjUtlF96XShIU1J53ZW2z
 q56cp1Q+d0DEk6+V8zrA1VVA9Mt6PnPnUYxXWch0r3MeFRtfQ6PqyBYtqcjqHyu6laB3
 SM9I19kWbbmOIkfCQMK1zSKPsm5MmswnM30YPg9j12X7azzU7J4bonHNLMS/gs6uG5O1
 RpuN1opbYn3HJCXBYPiogU/TVQ5T3przhJlRGrJ2wYT67WS1YvXJTGm22lMuFj2LyoI+
 7qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nk2Suy6J3YiB0zzsECNTnASz9gapNF6qF2MzFjIeiJI=;
 b=3niUu/5SUnsPlb+9qsjh6s4K2RjO9w5Lkon+0tlEYB+TSGnlahGaQ4kgU7TbpEh90F
 tswv/t+D5bObjG+S/R9fIvmy9uCgyJ50y7PT+eOb43ZO/WAN4oBUMepVZB0KlokTBQuG
 kjgSAvuYaMxfJ2M9CqTXiGlnKWHw5OEQkcERYfMcJjl9m5vgwMq5Th3mwZecn9qiAee/
 CEY3ZFjB34b5wDPBv9g1hvvw+I+t8P5t/YV3ozjw774JaYcN+qdPX/kt3sHzE9CtMGlB
 TyKT5DmnWtXuGayQgapAAMo10148JAOmqX/hHgvYJSF3RxE5M4fBobvVe7iI6PtNpV4d
 /JPg==
X-Gm-Message-State: AOAM533PqOnqfcGEK6blcseStByfX9zA2X6zMSpHwaCcvZKh4UjIItj/
 h6Uaj68wRCOWDdyffPZnL3ppvxHSgvzdUI+OLmYb1xVJW88=
X-Google-Smtp-Source: ABdhPJxDJ+BqeHH0XvqQ8TLhsnNiwHhU2UsFTgaT6VUWge6F3SdXuvUE4DmJceGgFkZVpHSzusxrmAoLlwX7qvftd8g=
X-Received: by 2002:a05:622a:1209:: with SMTP id
 y9mr16730883qtx.13.1636541328409; 
 Wed, 10 Nov 2021 02:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20211109122037.171128-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211109122037.171128-1-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 10 Nov 2021 10:48:21 +0000
Message-ID: <CAM0jSHOyj3ydgn-bZwk69RfpZLcG03Td_kxowEoJ1fg5PO=W3A@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Skip error capture when wedged on init
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Nov 2021 at 12:20, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Trying to capture uninitialised engines when we wedged on init ends in
> tears. Skip that together with uC capture, since failure to initialise the
> latter can actually be one of the reasons for wedging on init.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This fixes the issue with missing GuC wedging the GPU and then blowing
up when trying to use the driver?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_gpu_error.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 2a2d7643b551..aa2b3aad9643 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1866,10 +1866,14 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>                 }
>
>                 gt_record_info(error->gt);
> -               gt_record_engines(error->gt, engine_mask, compress);
>
> -               if (INTEL_INFO(i915)->has_gt_uc)
> -                       error->gt->uc = gt_record_uc(error->gt, compress);
> +               if (!intel_gt_has_unrecoverable_error(gt)) {
> +                       gt_record_engines(error->gt, engine_mask, compress);
> +
> +                       if (INTEL_INFO(i915)->has_gt_uc)
> +                               error->gt->uc = gt_record_uc(error->gt,
> +                                                            compress);
> +               }
>
>                 i915_vma_capture_finish(error->gt, compress);
>
> --
> 2.30.2
>
