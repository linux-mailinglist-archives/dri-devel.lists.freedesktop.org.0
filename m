Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586751811C
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 11:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9633510FD8E;
	Tue,  3 May 2022 09:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4810FD82;
 Tue,  3 May 2022 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651570619; x=1683106619;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JqAREk8vnvLu8bKhdmebDQaF1iMe+9wlfQ11DH7NkhU=;
 b=iYcpYaGtPjwJHpl6S09jZd04tTUPTEbEXA81D8HrC6Ay3Lh9pbEXJ4yq
 +lscQpoAWYykWpwFeLN9MDDYmwQmcv9vPPUcPR9ozlE/vHRH2QzXD7bvw
 q4D0bRJFETa7UV3ZBzolbdvcceZ8eqigciTlmgz55N6aGM6m3DrMeZ0lu
 Y6K31Xk+Jg3rsgmeVvKe6gqHGveSA9tWBx+E8Sdfv2aHer56lH5UIYpxs
 CyGPjqFEvX9LkDJtpYLuVmBm5CrAQGaCp4E/fnmonCpYzUFxiBHp2NoO6
 qhmfC0nLjfavLqcOCHLxikYofLKMmSL2vjvlYMJY9G5ScKewLEnQfttSX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254900359"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="254900359"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:36:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="562145028"
Received: from doshaugh-mobl.ger.corp.intel.com (HELO [10.213.236.211])
 ([10.213.236.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:36:57 -0700
Message-ID: <4e3525db-5aa4-fec8-a496-749e08b5f257@linux.intel.com>
Date: Tue, 3 May 2022 10:36:55 +0100
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

Fix looks correct to me. In which case it seems breakage was introduced 
with:

Fixes: 155ab8836caa ("drm/i915: Move object close under its own lock")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v5.3+

AFAICT at least. I will add these tags and pull it in unless someone 
shouts a correction.

Regards,

Tvrtko

> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5732
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
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
