Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B728E51A3BE
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 17:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AABA10EAB1;
	Wed,  4 May 2022 15:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBD410EAB1;
 Wed,  4 May 2022 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651677641; x=1683213641;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dJIYLg7h/Q2ldxRvg4MeqMb9Yi/SXMhu0fJoO84kF6w=;
 b=Fy+HDdZINDqe2jGtJtCb4r/ZN8vZ8T7T0ZIjiAcn7YexeZRB7XUtDvLr
 zl9fJWrg9cIl3ZQJj3fnJNkesJdPirZpjcBqst3b6faH4lNeTRGMm4UAB
 G6faqaJmNkVora2vWr1JF1VJO8DuZ7rtJqHxKO2AX+58Q+5P7GMzn+rrf
 zm2BpR6nI66Qve8Ds+jIFMghrhE4PFqKalFi6DBA6wQaHdLMWszQyftM+
 qAxlPOCoxANcmZ29w5sP6FY4K1xsadyv1zyVFL7e577bILXmKsD+e7h4G
 JFcEltXNynl31ufY6xY6iY0FRodNkGkCLip4MgbbeHicgZsyf24M+K8Pd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267392787"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="267392787"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 08:20:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="664511899"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO [10.213.236.183])
 ([10.213.236.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 08:20:38 -0700
Message-ID: <1ff8137a-7ae6-5162-525d-70373a7170db@linux.intel.com>
Date: Wed, 4 May 2022 16:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Fix race in
 __i915_vma_remove_closed
Content-Language: en-US
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
References: <20220420095720.3331609-1-kherbst@redhat.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220420095720.3331609-1-kherbst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/04/2022 10:57, Karol Herbst wrote:
> i915_vma_reopen checked if the vma is closed before without taking the
> lock. So multiple threads could attempt removing the vma.
> 
> Instead the lock needs to be taken before actually checking.
> 
> v2: move struct declaration
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5732
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/i915_vma.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 162e8d83691b..2efdad2b43fa 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1615,17 +1615,17 @@ void i915_vma_close(struct i915_vma *vma)
>   
>   static void __i915_vma_remove_closed(struct i915_vma *vma)
>   {
> -	struct intel_gt *gt = vma->vm->gt;
> -
> -	spin_lock_irq(&gt->closed_lock);
>   	list_del_init(&vma->closed_link);
> -	spin_unlock_irq(&gt->closed_lock);
>   }
>   
>   void i915_vma_reopen(struct i915_vma *vma)
>   {
> +	struct intel_gt *gt = vma->vm->gt;
> +
> +	spin_lock_irq(&gt->closed_lock);
>   	if (i915_vma_is_closed(vma))
>   		__i915_vma_remove_closed(vma);
> +	spin_unlock_irq(&gt->closed_lock);
>   }
>   
>   static void force_unbind(struct i915_vma *vma)
> @@ -1641,6 +1641,7 @@ static void force_unbind(struct i915_vma *vma)
>   static void release_references(struct i915_vma *vma, bool vm_ddestroy)
>   {
>   	struct drm_i915_gem_object *obj = vma->obj;
> +	struct intel_gt *gt = vma->vm->gt;
>   
>   	GEM_BUG_ON(i915_vma_is_active(vma));
>   
> @@ -1651,7 +1652,9 @@ static void release_references(struct i915_vma *vma, bool vm_ddestroy)
>   
>   	spin_unlock(&obj->vma.lock);
>   
> +	spin_lock_irq(&gt->closed_lock);
>   	__i915_vma_remove_closed(vma);
> +	spin_unlock_irq(&gt->closed_lock);
>   
>   	if (vm_ddestroy)
>   		i915_vm_resv_put(vma->vm);
