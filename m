Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892CF62366D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 23:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7AB10E112;
	Wed,  9 Nov 2022 22:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF6910E112;
 Wed,  9 Nov 2022 22:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668032465; x=1699568465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UOQUTE9ky1mtYyZgQemBbdXN5+QGmVpX1EJc9ZoKFwY=;
 b=GsrmysfMVI+M3sce+ypgfDeoifRoPEkHRpUyEe/Zxti8JSArHq+QS6Yf
 ry4YxIodpXu/M0bU3o9gudOg1PWlRNqArHGYzsT+2Jb893JyCO28FMk/q
 NSAXjStqYA0/DPRK6cktJ8+RKTIZGALsnD5NiWZ32gBAs64bVfDKAQewP
 Qb4kjfz66Yfk95H1YwTeAQEm7QF1XJq849fQ0VE8JFZXFI62l42bVSnPv
 VuZ0QclTDgvkCV0wDEuQQW1AQOKCxyw95Kzef4hMJsBV9pTcQPMbNOn2h
 /H0HGHA96w7k+Kk/A7dXij3AIM/hzdPmFDUbbhd36hStSooMNto29s3yM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="298624713"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="298624713"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 13:13:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="670104856"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="670104856"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 13:13:39 -0800
Date: Wed, 9 Nov 2022 22:13:36 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y2wYAPW5hIQImDU4@ashyti-mobl2.lan>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
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

...

> -static void force_unbind(struct i915_vma *vma)
> +static void force_unbind(struct i915_vma *vma, bool async)
>  {
>  	if (!drm_mm_node_allocated(&vma->node))
>  		return;
> @@ -1725,7 +1727,21 @@ static void force_unbind(struct i915_vma *vma)
>  		i915_vma_set_purged(vma);
>  
>  	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
> -	WARN_ON(__i915_vma_unbind(vma));
> +	if (async) {
> +		struct dma_fence *fence;
> +
> +		fence = __i915_vma_unbind_async(vma);
> +		if (IS_ERR_OR_NULL(fence)) {
> +			async = false;
> +		} else {
> +			dma_resv_add_fence(vma->obj->base.resv, fence,
> +					   DMA_RESV_USAGE_READ);
> +			dma_fence_put(fence);
> +		}
> +	}
> +
> +	if (!async)
> +		WARN_ON(__i915_vma_unbind(vma));
>  	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>  }
>  
> @@ -1785,7 +1801,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>  {
>  	lockdep_assert_held(&vma->vm->mutex);
>  
> -	force_unbind(vma);
> +	force_unbind(vma, false);

How about:

#define force_unbind(v)		__force_unbind(v, false)
#define force_unbind_async(v)	__force_unbind(v, true)

The true/false parameters in a function is not immediately
understandable.

or

#define force_unbind_sync(v)	force_unbind(v, false)
#define force_unbind_async(v)	force_unbind(v, true)

but I prefer the first version.

Andi
