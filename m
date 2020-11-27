Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410DF2C6785
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F286EDDA;
	Fri, 27 Nov 2020 14:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C856EDDA;
 Fri, 27 Nov 2020 14:11:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23134046-1500050 for multiple; Fri, 27 Nov 2020 14:11:01 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-135-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-135-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 134/162] drm/i915/dg1: Measure swap in/out
 timing stats
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:11:01 +0000
Message-ID: <160648626145.2925.9047512326060437476@build.alporthouse.com>
User-Agent: alot/0.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:50)
> From: Sudeep Dutt <sudeep.dutt@intel.com>
> 
> Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_region.c | 16 ++++++++++++++--
>  drivers/gpu/drm/i915/i915_debugfs.c        |  3 +++
>  drivers/gpu/drm/i915/i915_drv.h            |  2 ++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index ed108dbcb34e..4fab9f6b4bee 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -15,6 +15,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
>  {
>         struct drm_i915_private *i915 = to_i915(obj->base.dev);
>         struct drm_i915_gem_object *dst, *src;
> +       unsigned long start, diff, msec;
>         int err;
>  
>         GEM_BUG_ON(obj->swapto);
> @@ -24,6 +25,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
>         GEM_BUG_ON(!i915->params.enable_eviction);
>  
>         assert_object_held(obj);
> +       start = jiffies;
>  
>         /* create a shadow object on smem region */
>         dst = i915_gem_object_create_shmem(i915, obj->base.size);
> @@ -64,8 +66,12 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
>         else
>                 i915_gem_object_put(dst);
>  
> -       if (!err)
> +       if (!err) {
> +               diff = jiffies - start;
> +               msec = diff * 1000 / HZ;
> +               atomic_long_add(msec, &i915->time_swap_out_ms);
>                 atomic_long_add(sizes, &i915->num_bytes_swapped_out);
> +       }

This can be done using a kprobe, and with prettier statistics as builtin
functionality.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
