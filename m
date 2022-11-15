Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C076F629E4D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 16:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86EB10E41C;
	Tue, 15 Nov 2022 15:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F5C10E41B;
 Tue, 15 Nov 2022 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668527931; x=1700063931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qEPShEiYCrkrgSGHecWabfF+GnwGLymC6/D/EowVA9E=;
 b=k10aFX4I5valHV/bTGJHKwjM003VusZdJrdhZfkQWylURxrePh50mUg3
 UdLihttxCeBYv8wnCgUjK/DTQsfo2Q+8WkE1Ae3xFXTSGXkg4RQtdVvmZ
 vvaFFzrre41voYYOWbmPs2KAp0H22CbJ5PGALpY43ZmIlQUDVQpdI03mk
 zaOo9gb1Pwj9jrqJ22EGE59OG0J7Znyover//18OI3WjV0smW3fvaEmEk
 Jw+cR9RzzN8NBO0RLCN/CUzFjCLbNtMvl6BPc2mQ0tKVy2Q9uydSuiMjr
 JHoWCuHVZOBgKk/XhcgD9rxReryPIrX7rBDcj7zSRjjZ9J4PXtmnXc0kd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292681570"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="292681570"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:58:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="638988576"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="638988576"
Received: from sneubaue-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.220.98])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:58:45 -0800
Date: Tue, 15 Nov 2022 16:58:42 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y3O3Murna92s7iKL@ashyti-mobl2.lan>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Sat, Nov 12, 2022 at 11:57:32PM -0800, Niranjana Vishwanathapura wrote:
> Asynchronously unbind the vma upon vm_unbind call.
> Fall back to synchronous unbind if backend doesn't support
> async unbind or if async unbind fails.
> 
> No need for vm_unbind out fence support as i915 will internally
> handle all sequencing and user need not try to sequence any
> operation with the unbind completion.
> 
> v2: use i915_vma_destroy_async in vm_unbind ioctl
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>  drivers/gpu/drm/i915/i915_vma.c               | 51 +++++++++++++++++--
>  drivers/gpu/drm/i915/i915_vma.h               |  1 +
>  include/uapi/drm/i915_drm.h                   |  3 +-
>  4 files changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index d87d1210365b..36651b447966 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>  	 */
>  	obj = vma->obj;
>  	i915_gem_object_lock(obj, NULL);
> -	i915_vma_destroy(vma);
> +	i915_vma_destroy_async(vma);
>  	i915_gem_object_unlock(obj);
>  
>  	i915_gem_object_put(obj);
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 7cf77c67d755..483d25f2425c 100644
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
>  	/*
> @@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>  	spin_unlock_irq(&gt->closed_lock);
>  }
>  
> -static void force_unbind(struct i915_vma *vma)
> +static void force_unbind(struct i915_vma *vma, bool async)

I still like the defines on this, they look cleaner, but it's a
matter of taste.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
