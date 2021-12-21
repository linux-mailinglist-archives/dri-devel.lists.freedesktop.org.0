Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C11147C11F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 15:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC8810EC34;
	Tue, 21 Dec 2021 14:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D1E10EC34;
 Tue, 21 Dec 2021 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640095357; x=1671631357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lGxCgcaqq0/X41h2j0rex5Tk1fmUh0JHmuplW+VUPpc=;
 b=N81KfkvXGYxpNocJrU6M8nVit3UuLld7sP8D37DpiiH5fZ1Movg3OIWf
 CbVSzwEO6BNN46HeAWi2GLP+6ZU00KlweY4+PcZVyLtP9lfSiJcNSSIlc
 qZMzLxvSDUo7W/qdDqkXqA3V9s2ia+i6w8TcsEMvyRl3coLSPiiZGS3oG
 LtEns4/ENO1Rr8VXMwkDXeF7U2pPEJAWXgV1iQP6IilqjRLXjL805hvHp
 u6z1v0HXtmX2dJ0b35iTxmckPWyG1WRbfe4Am+MhMq+/8e0gF5aopUhNp
 QsGNpLlB3KHB7FhqVHIeu0te/YcWAifKijQKk+p5fDMnn72wfbC+IWur7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227247684"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="227247684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:02:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="607066875"
Received: from pjordan-mobl.ger.corp.intel.com (HELO [10.252.23.37])
 ([10.252.23.37])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 06:02:34 -0800
Message-ID: <a617dbed-be44-4617-1bab-e3cc298450b6@intel.com>
Date: Tue, 21 Dec 2021 14:02:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 6/7] drm/i915: Use vma resources for async unbinding
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
 <20211217145228.10987-7-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211217145228.10987-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/12/2021 14:52, Thomas Hellström wrote:
> Implement async (non-blocking) unbinding by not syncing the vma before
> calling unbind on the vma_resource.
> Add the resulting unbind fence to the object's dma_resv from where it is
> picked up by the ttm migration code.
> Ideally these unbind fences should be coalesced with the migration blit
> fence to avoid stalling the migration blit waiting for unbind, as they
> can certainly go on in parallel, but since we don't yet have a
> reasonable data structure to use to coalesce fences and attach the
> resulting fence to a timeline, we defer that for now.
> 
> Note that with async unbinding, even while the unbind waits for the
> preceding bind to complete before unbinding, the vma itself might have been
> destroyed in the process, clearing the vma pages. Therefore we can
> only allow async unbinding if we have a refcounted sg-list and keep a
> refcount on that for the vma resource pages to stay intact until
> binding occurs. If this condition is not met, a request for an async
> unbind is diverted to a sync unbind.
> 
> v2:
> - Use a separate kmem_cache for vma resources for now to isolate their
>    memory allocation and aid debugging.
> - Move the check for vm closed to the actual unbinding thread. Regardless
>    of whether the vm is closed, we need the unbind fence to properly wait
>    for capture.
> - Clear vma_res::vm on unbind and update its documentation.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

<snip>

> @@ -416,6 +420,7 @@ int i915_vma_bind(struct i915_vma *vma,
>   {
>   	u32 bind_flags;
>   	u32 vma_flags;
> +	int ret;
>   
>   	lockdep_assert_held(&vma->vm->mutex);
>   	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> @@ -424,12 +429,12 @@ int i915_vma_bind(struct i915_vma *vma,
>   	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
>   					      vma->node.size,
>   					      vma->vm->total))) {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>   		return -ENODEV;
>   	}
>   
>   	if (GEM_DEBUG_WARN_ON(!flags)) {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>   		return -EINVAL;
>   	}
>   
> @@ -441,12 +446,30 @@ int i915_vma_bind(struct i915_vma *vma,
>   
>   	bind_flags &= ~vma_flags;
>   	if (bind_flags == 0) {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>   		return 0;
>   	}
>   
>   	GEM_BUG_ON(!vma->pages);
>   
> +	/* Wait for or await async unbinds touching our range */
> +	if (work && bind_flags & vma->vm->bind_async_flags)
> +		ret = i915_vma_resource_bind_dep_await(vma->vm,
> +						       &work->base.chain,
> +						       vma->node.start,
> +						       vma->node.size,
> +						       true,
> +						       GFP_NOWAIT |
> +						       __GFP_RETRY_MAYFAIL |
> +						       __GFP_NOWARN);
> +	else
> +		ret = i915_vma_resource_bind_dep_sync(vma->vm, vma->node.start,
> +						      vma->node.size, true);

Is there nothing scary here with coloring? Say with cache coloring, to 
ensure we unbind the neighbouring nodes(if they are conflicting) before 
doing the bind, or is async unbinding only ever going to be used for the 
ppGTT?

And then I guess there might also be memory coloring where we likely 
need to ensure that all the unbinds within the overlapping PT(s) have 
been completed before doing the bind, since the bind will also increment 
the usage count of the PT, potentially preventing it from being 
destroyed, which will skip nuking the PDE state, AFAIK. Previously the 
drm_mm node(s) would still be present, which would trigger the eviction. 
Although it might be that we just end up aligning everything to 2M, and 
so drop the memory coloring anyway, so maybe no need to worry about this 
yet...
