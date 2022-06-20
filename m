Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D90551AC6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 15:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462B610F1F9;
	Mon, 20 Jun 2022 13:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B679910F1A7;
 Mon, 20 Jun 2022 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655732108; x=1687268108;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lx5Y9Hs03xGzjGGSIRhuRXbuP0Fzw9qF8L77dtcsMBQ=;
 b=PjKC+XDEsDWoP3vx9Bl3c4Bt/8o97WkWbU/Mgo/MwDGoxasKw0kjc5me
 XMuMkOOgeogASrAFyGZHRoPLNxHnERPxDrIdX635OrVZbZJlugOT5vyQa
 ArBxz+gGWm7QbYUiFl+Ic+0f+0ZIRqlSe5GUvBabmB0Sm8zgjP/2ELS3f
 Pxh9Pg5SVMOC5ivepkabjajsWx/OaESHtgMjuuzvnolHltl4uL9+AQNoT
 ph4LXbAUGsZVKW7S6L77CZ+VQ5hEsumJ4fI3g3E7U7SVCkJ+VemCWQl/V
 tyAPOK1tQ09W59FxzJPlBLgRqWqo8hqzaJBUf7fwmfLZOhHs52nDnpWcn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341578623"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341578623"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 06:35:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="591180461"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.57.219])
 ([10.252.57.219])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 06:33:37 -0700
Message-ID: <f4070e64-dcb1-28aa-50ef-fb266511d071@linux.intel.com>
Date: Mon, 20 Jun 2022 15:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm/i915: Fix vm use-after-free in vma destruction
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220620123659.381772-1-thomas.hellstrom@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
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
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Nirmoy Das <nirmoy.das@intel.con>

On 6/20/2022 2:36 PM, Thomas Hellström wrote:
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
>   }
>   
>   void i915_vma_parked(struct intel_gt *gt)
