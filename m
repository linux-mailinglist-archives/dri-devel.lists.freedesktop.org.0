Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21972485637
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1D010FC00;
	Wed,  5 Jan 2022 15:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4995A10E697;
 Wed,  5 Jan 2022 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641397928; x=1672933928;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=POGd7xtVu4AmgMvU/thTz8ZdSZj3snnoM1H8jja/e0k=;
 b=ZHxi8yNAwkQx/EWFkdUmWXEwxaAG+4JeUh1XKUaHkm9FDPTUFghUMTzY
 CaRzik+DwBOP7vsh+Ci9cgFj/aCL4NWBDigIn+iP96FBUcZj7B+1Q9dxm
 46EJZgXGttqDS0QQRzpR3INLDMMhMSz+i8bQwnB+7dfF8CvQ+j/8qxiLX
 og0pgW2XDIjDGPK+fx+HQS3uLc8SLHbMcWE8sIDMgW7uR6gA+jXAH87l+
 QI7Tun7TrhSaBGhS15WPQ7tEx1DQk3JKvcdT+rXy9iphqtul1UhHFtdSS
 fCrJ6G102sY5AsdYmjhunYCWYl0m7Z+qRTeRk9t8mrKkX0fwPSZ5Tc3op A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242675716"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="242675716"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:52:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="621084231"
Received: from unknown (HELO [10.252.26.67]) ([10.252.26.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:52:05 -0800
Message-ID: <f022f46f-555f-ec83-49a9-df771e46127c@intel.com>
Date: Wed, 5 Jan 2022 15:52:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 4/6] drm/i915: Use vma resources for async unbinding
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220104125132.35179-1-thomas.hellstrom@linux.intel.com>
 <20220104125132.35179-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220104125132.35179-5-thomas.hellstrom@linux.intel.com>
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

On 04/01/2022 12:51, Thomas Hellström wrote:
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
> v4:
> - Take cache coloring into account when searching for vma resources
>    pending unbind. (Matthew Auld)
> v5:
> - Fix timeout and error check in i915_vma_resource_bind_dep_await().
> - Avoid taking a reference on the object for async binding if
>    async unbind capable.
> - Fix braces around a single-line if statement.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

<snip>

> @@ -434,12 +439,30 @@ int i915_vma_bind(struct i915_vma *vma,
>   
>   	bind_flags &= ~vma_flags;
>   	if (bind_flags == 0) {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>   		return 0;
>   	}
>   
>   	GEM_BUG_ON(!atomic_read(&vma->pages_count));
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
> +	if (ret) {
> +		i915_vma_resource_free(vma_res);
> +		return ret;
> +	}
> +
>   	if (vma->resource || !vma_res) {
>   		/* Rebinding with an additional I915_VMA_*_BIND */
>   		GEM_WARN_ON(!vma_flags);
> @@ -452,9 +475,11 @@ int i915_vma_bind(struct i915_vma *vma,
>   	if (work && bind_flags & vma->vm->bind_async_flags) {
>   		struct dma_fence *prev;
>   
> -		work->vma = vma;
> +		work->vma_res = i915_vma_resource_get(vma->resource);
>   		work->cache_level = cache_level;
>   		work->flags = bind_flags;
> +		if (vma->obj->mm.rsgt)
> +			work->rsgt = i915_refct_sgt_get(vma->obj->mm.rsgt);

Hmmm, at a glance I would have expected this to use the vma->pages. I 
think with the GGTT the vma will often create its own sg layout which != 
obj->mm.sgt. IIUC the async unbind will still call vma_unbind_pages 
which might nuke the vma sgt? Or is something else going on here?

