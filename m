Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F605521C8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 18:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F1A10E8B6;
	Mon, 20 Jun 2022 16:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0712E10E887;
 Mon, 20 Jun 2022 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655740990; x=1687276990;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J6+few3s7kJPdNbLlI/yLzUVI/d1OSDSrhMnh1yxpjE=;
 b=I0KZXm1DEnYhg2WjJFrg+vVFcMFTC1OuGBI8o3eLMeUTmmmlDONdZgiV
 vFEdHA/Bpqwm1IfsS4+idYbKbBTgZdkMr76xK39HxCZ5taujdRbOk/7u5
 U5VYYPTIN2nuFuaYB9VVo+px/phLHBDreUxzxd0B4drfvvypWCWNKbfgO
 D999CvCEg/vn8iTFY97XVqHsdETOuyClHsLoPDE4JoiLN1wj32xjctfpn
 Niz9LCf6uSfZKQ047n5D7+cSBLr5pB1ZQE1KEaVBTmQsvHOUuMRrqS0+4
 kMVCXG9JYGbmWLMf9KBWow4LbFQ1pwhcsyVGL5/gaMLpgBQvFamo/zBKX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="366253300"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="366253300"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:03:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="643183341"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.4.50])
 ([10.213.4.50])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:03:08 -0700
Message-ID: <6e711910-2e48-d65e-ba43-0cfb121412fe@intel.com>
Date: Mon, 20 Jun 2022 18:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Fix vm use-after-free in vma
 destruction
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220620123659.381772-1-thomas.hellstrom@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220620123659.381772-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.06.2022 14:36, Thomas Hellström wrote:
> In vma destruction, the following race may occur:
> 
> Thread 1:	    		  Thread 2:
> i915_vma_destroy();
> 
>    ...
>    list_del_init(vma->vm_link);
>    ...
>    mutex_unlock(vma->vm->mutex);
> 				  __i915_vm_release();
> release_references();
> 
> And in release_reference() we dereference vma->vm to get to the
> vm gt pointer, leading to a use-after free.
> 
> However, __i915_vm_release() grabs the vm->mutex so the vm won't be
> destroyed before vma->vm->mutex is released, so extract the gt pointer
> under the vm->mutex to avoid the vma->vm dereference in
> release_references().
> 
> v2: Fix a typo in the commit message (Andi Shyti)
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5944
> Fixes: e1a7ab4fca ("drm/i915: Remove the vm open count")
> 
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/i915_vma.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 0bffb70b3c5f..04d12f278f57 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1637,10 +1637,10 @@ static void force_unbind(struct i915_vma *vma)
>   	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>   }
>   
> -static void release_references(struct i915_vma *vma, bool vm_ddestroy)
> +static void release_references(struct i915_vma *vma, struct intel_gt *gt,
> +			       bool vm_ddestroy)
>   {
>   	struct drm_i915_gem_object *obj = vma->obj;
> -	struct intel_gt *gt = vma->vm->gt;
>   
>   	GEM_BUG_ON(i915_vma_is_active(vma));
>   
> @@ -1695,11 +1695,12 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>   
>   	force_unbind(vma);
>   	list_del_init(&vma->vm_link);
> -	release_references(vma, false);
> +	release_references(vma, vma->vm->gt, false);
>   }
>   
>   void i915_vma_destroy(struct i915_vma *vma)
>   {
> +	struct intel_gt *gt;
>   	bool vm_ddestroy;
>   
>   	mutex_lock(&vma->vm->mutex);
> @@ -1707,8 +1708,11 @@ void i915_vma_destroy(struct i915_vma *vma)
>   	list_del_init(&vma->vm_link);
>   	vm_ddestroy = vma->vm_ddestroy;
>   	vma->vm_ddestroy = false;
> +
> +	/* vma->vm may be freed when releasing vma->vm->mutex. */
> +	gt = vma->vm->gt;
>   	mutex_unlock(&vma->vm->mutex);
> -	release_references(vma, vm_ddestroy);
> +	release_references(vma, gt, vm_ddestroy);


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   }
>   
>   void i915_vma_parked(struct intel_gt *gt)

