Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EBB4A03B0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 23:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC7010E1BB;
	Fri, 28 Jan 2022 22:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DDB10E1BB;
 Fri, 28 Jan 2022 22:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643409147; x=1674945147;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=T3rkzIVMJI5c8OF4SUmtfynsxKFzJhNdjY7pH4Z2aoA=;
 b=ed/Hmk9o2gDl2tPMSZgX2lDSxiIJxQ8DhFz50JZ+dST2ua70G1kWHPMn
 4D9/dphoaz+f4lO9MM8NlQe4nbZYZ1cqGzb0EcesAGOEkLBGo4ifLadEd
 jfPQHZLK2f/IYU7kP4elHEFP6BJyR1W0BxhJH5IO9U2tjwMnSgkIGSEco
 KajrMUzjwfeLajqmSZ3FG7sKtQvpgYUhevRqmcEAsPBbuyQlBibsPULZT
 jHcOXR2P4BqmfDYwVn4ez5I4IT4R5eXh5RI8zTKsKex9OWsLEh7xd0Zs7
 jaUqv03bpz8XDWPSDiRbcKPNXM0ZbZNMEYa5sAvqoqRq3QOssES8Pl5N9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227186608"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; d="scan'208";a="227186608"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 14:32:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; d="scan'208";a="521875302"
Received: from mcummins-mobl1.ger.corp.intel.com (HELO [10.213.196.43])
 ([10.213.196.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 14:32:26 -0800
Message-ID: <8ca7bd99-06a7-3142-c375-1bf93cb23287@linux.intel.com>
Date: Fri, 28 Jan 2022 22:32:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix a race between vma / object
 destruction and unbinding
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220127115622.302970-1-thomas.hellstrom@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220127115622.302970-1-thomas.hellstrom@linux.intel.com>
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


On 27/01/2022 11:56, Thomas Hellström wrote:
> The vma destruction code was using an unlocked advisory check for
> drm_mm_node_allocated() to avoid racing with eviction code unbinding
> the vma.
> 
> This is very fragile and prohibits the dereference of non-refcounted
> pointers of dying vmas after a call to __i915_vma_unbind(). It also
> prohibits the dereference of vma->obj of refcounted pointers of
> dying vmas after a call to __i915_vma_unbind(), since even if a
> refcount is held on the vma, that won't guarantee that its backing
> object doesn't get destroyed.
> 
> So introduce an unbind under the vm mutex at object destroy time,
> removing all weak references of the vma and its object from the
> object vma list and from the vm bound list.

Maarten suggested this fixes an oops like seen in 
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_22133/shard-snb6/igt@gem_softpin@softpin.html. 
If that is so, what would be the Fixes: tag to put here? Although it is 
too late now so hopefully bug was introduced in something yet unreleased.

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 1a9e1f940a7d..e03e362d320b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -280,6 +280,12 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
>   			GEM_BUG_ON(vma->obj != obj);
>   			spin_unlock(&obj->vma.lock);
>   
> +			/* Verify that the vma is unbound under the vm mutex. */
> +			mutex_lock(&vma->vm->mutex);
> +			atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
> +			__i915_vma_unbind(vma);
> +			mutex_unlock(&vma->vm->mutex);

Hm I am not up to speed with the latest design, but how does the verb 
verify and absence of conditionals reconcile here? Does the comment need 
improving?

Regards,

Tvrtko

> +
>   			__i915_vma_put(vma);
>   
>   			spin_lock(&obj->vma.lock);
> 
