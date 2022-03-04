Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2E4CDB3E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA93112C09;
	Fri,  4 Mar 2022 17:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC343112C07;
 Fri,  4 Mar 2022 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646416034; x=1677952034;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WwYCsmGdii4uIdENmdZGozG7FHzVrJro2nJEiTUpn+4=;
 b=IJXe9CTipM3W8+P+3CVFHskZfetFix+oO+Sz1qZ1EdVW0LwEsMe9WPFp
 DSSndSogiySCDQ5kSYU6vkHJdmnKryZWq55b3txHAs2f9OcLwCjxff+sv
 C68sJci7SCiD+fjJEoMABMkRUjKeg2fvNwNxLrgAaGJMHyrgvpXuAqMgt
 XkEVakTvSOERliZbRsKPVSV+Wq+cmYE/yk/uAshqGjA2VySjwWMB6+Qd0
 lrfwa8Brfj8wjS1dN3w5JGKVq36BGpuNEfJGEqaUd+ChxcoVjVho4oWC8
 5PyTfd4Y5A+9UZ2EJ03kzbbiM5DBIQFBoCXipFutmj2WM9WPYn3KZ4pTG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="233984431"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233984431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:47:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="494396023"
Received: from mmazarel-mobl.ger.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:47:12 -0800
Message-ID: <5c0043cbf8debcda7cd16b5fcc5f5e8b358795ba.camel@linux.intel.com>
Subject: Re: [PATCH] drm/i915: stop checking for NULL vma->obj
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 04 Mar 2022 18:47:09 +0100
In-Reply-To: <20220304174252.1000238-1-matthew.auld@intel.com>
References: <20220304174252.1000238-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-03-04 at 17:42 +0000, Matthew Auld wrote:
> This is no longer possible since e6e1a304d759 ("drm/i915: vma is
> always
> backed by an object.").
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

LGTM. 
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/i915_vma.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c
> b/drivers/gpu/drm/i915/i915_vma.c
> index 94fcdb7bd21d..7acfbbc63d17 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -515,21 +515,18 @@ int i915_vma_bind(struct i915_vma *vma,
>                 if (!work->vma_res->bi.pages_rsgt)
>                         work->pinned = i915_gem_object_get(vma->obj);
>         } else {
> -               if (vma->obj) {
> -                       ret = i915_gem_object_wait_moving_fence(vma-
> >obj, true);
> -                       if (ret) {
> -                               i915_vma_resource_free(vma-
> >resource);
> -                               vma->resource = NULL;
> +               ret = i915_gem_object_wait_moving_fence(vma->obj,
> true);
> +               if (ret) {
> +                       i915_vma_resource_free(vma->resource);
> +                       vma->resource = NULL;
>  
> -                               return ret;
> -                       }
> +                       return ret;
>                 }
>                 vma->ops->bind_vma(vma->vm, NULL, vma->resource,
> cache_level,
>                                    bind_flags);
>         }
>  
> -       if (vma->obj)
> -               set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
> +       set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
>  
>         atomic_or(bind_flags, &vma->flags);
>         return 0;
> @@ -1360,7 +1357,7 @@ int i915_vma_pin_ww(struct i915_vma *vma,
> struct i915_gem_ww_ctx *ww,
>         if (flags & PIN_GLOBAL)
>                 wakeref = intel_runtime_pm_get(&vma->vm->i915-
> >runtime_pm);
>  
> -       moving = vma->obj ? i915_gem_object_get_moving_fence(vma-
> >obj) : NULL;
> +       moving = i915_gem_object_get_moving_fence(vma->obj);
>         if (flags & vma->vm->bind_async_flags || moving) {
>                 /* lock VM */
>                 err = i915_vm_lock_objects(vma->vm, ww);


