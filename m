Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952CF3DA59A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 16:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1F6ECD0;
	Thu, 29 Jul 2021 14:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5646EDAA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:06:43 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 i39-20020a9d17270000b02904cf73f54f4bso5996318ota.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQQzsyH/f6URg61tofzTvzb4mIeJR5g7C3j0V5QBWwQ=;
 b=ccbwg/bqYjVhkbLdaxvR8EM6zEzvGcGu7jr7OUsCCGSCnUW09Z3Opg1lve/8/IKAwN
 8Fou8bwC9ssQMTDHd+l/VrFCF1mWwf+/KDB/03XJ3iP/eyXi47/rABfdm0EE4PW8oIJk
 fhKCnfC0U6DV4w+RwR/ndawzv56yVxsss6w0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQQzsyH/f6URg61tofzTvzb4mIeJR5g7C3j0V5QBWwQ=;
 b=FqjVdUqFzMlY3m7/mpR8Fki+x+EuROEYCNWGEyOxHuq97bPSMWffzxlpAqUzYgzjpg
 29IDEtt/OjzS8Yf1F1NKmbEVSIWzpWn1OsZC6lBQHUou/kvxAY1683ek23IohY/d+Ggu
 tZ1qUJI2eLS9TEmGIxdCGOAfRQ4HqrLkoyVTsNJRAfTHEQp7C72DoExbj0QP7kjKWyg8
 3ZPTOedlT0puSq8tzHOfTxI57+v+RJb91CMWACfGKxo4VkPnuEUaxBk7RdwwYaJrE+Yr
 eEUGKxMvazE14gveu5s8xfQhRno737fGz1rlqeIOwAfiR+obBii295V89A9d+Z6C5Ywh
 b1tw==
X-Gm-Message-State: AOAM533hwo37ORCFTkZ0jgqN8Y9JUcbUic8U5a6jnwJb0O8LoHPeHYc/
 0UPlaMpOA0kWTuz0AmLHkE72vJ7slRCAYRtU/UFqdQ==
X-Google-Smtp-Source: ABdhPJxbrM2UdOJP5RHayc+aBxFznHhjSEsliI4VDpONNANw9FR5U/edlulFU7nITKOLjQcHXMH3SpVmt5O6OM8J/RI=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr3642364otb.281.1627567602332; 
 Thu, 29 Jul 2021 07:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210729133420.770672-1-tvrtko.ursulin@linux.intel.com>
 <20210729133420.770672-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210729133420.770672-2-tvrtko.ursulin@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Jul 2021 16:06:31 +0200
Message-ID: <CAKMK7uE412nf5RisGBR2GrNsvgPH+omHv4K+m5McJv1t55DQMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915: Use Transparent Hugepages when IOMMU is
 enabled
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 intel-gfx <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 3:34 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Usage of Transparent Hugepages was disabled in 9987da4b5dcf
> ("drm/i915: Disable THP until we have a GPU read BW W/A"), but since it
> appears majority of performance regressions reported with an enabled IOMMU
> can be almost eliminated by turning them on, lets just do that.
>
> To err on the side of safety we keep the current default in cases where
> IOMMU is not active, and only when it is default to the "huge=within_size"
> mode. Although there probably would be wins to enable them throughout,
> more extensive testing across benchmarks and platforms would need to be
> done.
>
> With the patch and IOMMU enabled my local testing on a small Skylake part
> shows OglVSTangent regression being reduced from ~14% (IOMMU on versus
> IOMMU off) to ~2% (same comparison but with THP on).
>
> v2:
>  * Add Kconfig dependency to transparent hugepages and some help text.
>  * Move to helper for easier handling of kernel build options.
>
> v3:
>  * Drop Kconfig. (Daniel)
>
> References: b901bb89324a ("drm/i915/gemfs: enable THP")
> References: 9987da4b5dcf ("drm/i915: Disable THP until we have a GPU read BW W/A")
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Eero Tamminen <eero.t.tamminen@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1

On both patches: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gemfs.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> index 5e6e8c91ab38..dbdbdc344d87 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> @@ -6,7 +6,6 @@
>
>  #include <linux/fs.h>
>  #include <linux/mount.h>
> -#include <linux/pagemap.h>
>
>  #include "i915_drv.h"
>  #include "i915_gemfs.h"
> @@ -15,6 +14,7 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>  {
>         struct file_system_type *type;
>         struct vfsmount *gemfs;
> +       char *opts;
>
>         type = get_fs_type("tmpfs");
>         if (!type)
> @@ -26,10 +26,26 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>          *
>          * One example, although it is probably better with a per-file
>          * control, is selecting huge page allocations ("huge=within_size").
> -        * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
> +        * However, we only do so to offset the overhead of iommu lookups
> +        * due to bandwidth issues (slow reads) on Broadwell+.
>          */
>
> -       gemfs = kern_mount(type);
> +       opts = NULL;
> +       if (intel_vtd_active()) {
> +               if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> +                       static char huge_opt[] = "huge=within_size"; /* r/w */
> +
> +                       opts = huge_opt;
> +                       drm_info(&i915->drm,
> +                                "Transparent Hugepage mode '%s'\n",
> +                                opts);
> +               } else {
> +                       drm_notice(&i915->drm,
> +                                  "Transparent Hugepage support is recommended for optimal performance when IOMMU is enabled!\n");
> +               }
> +       }
> +
> +       gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, opts);
>         if (IS_ERR(gemfs))
>                 return PTR_ERR(gemfs);
>
> --
> 2.30.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
