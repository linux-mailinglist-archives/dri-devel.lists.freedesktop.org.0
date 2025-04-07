Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14048A7D5C7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 09:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9381910E2CB;
	Mon,  7 Apr 2025 07:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUf5sVvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EB210E2B2;
 Mon,  7 Apr 2025 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744010955; x=1775546955;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZT0eZ5+pXc5YVylbNfm1LPvGjVlPsjRPsUDx/guXTpQ=;
 b=PUf5sVvEYBSeecEhasZM6Hfowi9tXW7rRM2Pdg2TcJ1TqLO4x+hw3OLL
 lBFKdLofb9mxeCQJBlC5twZkHVWZw6dWT9vHqJTqUiedHyElQo6J0ZpeV
 mmqx0tAf1riD1tcrR837jsFXqPfuUgqJCq8bgEVkNxWnjwbL79q/BMGMb
 ke5Dz0BSeGqTQ3TmElnPDOb1Jqv9a7yeZH7BoJ6L2rPfb6r6lAiABzCS1
 OJEKXDSeQHRBCRIbMxSDJtuuR98zRkj1Rpw85XcjL6xpcX5JXbQsK9bBj
 f6Lt2/S43e5BHkvdCCvzUoRbjHYBz7iV3eudtMTI4Jv1bN4ZC6hOPvVVx g==;
X-CSE-ConnectionGUID: LoE8sz0tQw+Nx4FGGXl+qQ==
X-CSE-MsgGUID: ZzCyVZSLT6a/xktSpkD56g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56360631"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56360631"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 00:29:15 -0700
X-CSE-ConnectionGUID: OJ2p0GXzSH+BpOOsW/Gn3g==
X-CSE-MsgGUID: 0VDJfIFoTva0CDtynT/cjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128799406"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.196])
 ([10.245.245.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 00:29:14 -0700
Message-ID: <2f6914f1-161b-473e-be7e-603540a8eb8f@intel.com>
Date: Mon, 7 Apr 2025 08:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
 <20250328181028.288312-16-matthew.auld@intel.com>
 <Z+78wBNpgGG+D7h9@lstrano-desk.jf.intel.com>
 <bd0476de-fd5b-4ea6-806f-ca49b33b9404@intel.com>
 <Z/AQk2fRiIfNRF1I@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z/AQk2fRiIfNRF1I@lstrano-desk.jf.intel.com>
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

On 04/04/2025 18:02, Matthew Brost wrote:
> On Fri, Apr 04, 2025 at 09:19:34AM +0100, Matthew Auld wrote:
>> On 03/04/2025 22:25, Matthew Brost wrote:
>>> On Fri, Mar 28, 2025 at 06:10:36PM +0000, Matthew Auld wrote:
>>>> We now use the same notifier lock for SVM and userptr, with that we can
>>>> combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
>>>>
>>>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c | 95 +++++++++++++-------------------------
>>>>    1 file changed, 33 insertions(+), 62 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index b097c91e2e02..947b82aa19a6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -1396,7 +1396,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>>>>    	return err;
>>>>    }
>>>> -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>>> +static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>>>    {
>>>>    	struct xe_vm *vm = pt_update->vops->vm;
>>>>    	struct xe_vma_ops *vops = pt_update->vops;
>>>> @@ -1409,55 +1409,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>>>    	if (err)
>>>>    		return err;
>>>> -	down_read(&vm->svm.gpusvm.notifier_lock);
>>>> +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
>>>
>>> Also any reason not use xe_svm_notifier_lock / xe_svm_notifier_unlock wrappers?
>>
>> Just that those are hidden behind CONFIG_DRM_XE_GPUSVM, so looks possible to
>> disable svm, but then I think we should still have working userptr. Should I
>> pull xe_svm_notifier_lock out of CONFIG_DRM_XE_GPUSVM?
>>
> 
> How would userptr work without GPU SVM if we building it on top of it?

Here I mean CONFIG_DRM_*XE*_GPUSVM, which looks to be specific to 
everything around xe_svm.c AFAICT, which useptr doesn't touch. We do now 
ofc require DRM_GPUSVM by default, but that's a different config.

> 
> Matt
> 
>>>
>>> Matt
>>>
>>>>    	list_for_each_entry(op, &vops->list, link) {
>>>> -		err = op_check_userptr(vm, op, pt_update_ops);
>>>> -		if (err) {
>>>> -			up_read(&vm->svm.gpusvm.notifier_lock);
>>>> -			break;
>>>> +		if (pt_update_ops->needs_svm_lock) {
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>>>> +			struct xe_svm_range *range = op->map_range.range;
>>>> +
>>>> +			if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>>> +				continue;
>>>> +
>>>> +			xe_svm_range_debug(range, "PRE-COMMIT");
>>>> +
>>>> +			xe_assert(vm->xe,
>>>> +				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>>>> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>>>> +
>>>> +			if (!xe_svm_range_pages_valid(range)) {
>>>> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>>>> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>>>> +				return -EAGAIN;
>>>> +			}
>>>> +#endif
>>>> +		} else {
>>>> +			err = op_check_userptr(vm, op, pt_update_ops);
>>>> +			if (err) {
>>>> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>>>> +				break;
>>>> +			}
>>>>    		}
>>>>    	}
>>>>    	return err;
>>>>    }
>>>> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>>>> -static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>>> -{
>>>> -	struct xe_vm *vm = pt_update->vops->vm;
>>>> -	struct xe_vma_ops *vops = pt_update->vops;
>>>> -	struct xe_vma_op *op;
>>>> -	int err;
>>>> -
>>>> -	err = xe_pt_pre_commit(pt_update);
>>>> -	if (err)
>>>> -		return err;
>>>> -
>>>> -	xe_svm_notifier_lock(vm);
>>>> -
>>>> -	list_for_each_entry(op, &vops->list, link) {
>>>> -		struct xe_svm_range *range = op->map_range.range;
>>>> -
>>>> -		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>>> -			continue;
>>>> -
>>>> -		xe_svm_range_debug(range, "PRE-COMMIT");
>>>> -
>>>> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>>>> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>>>> -
>>>> -		if (!xe_svm_range_pages_valid(range)) {
>>>> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>>>> -			xe_svm_notifier_unlock(vm);
>>>> -			return -EAGAIN;
>>>> -		}
>>>> -	}
>>>> -
>>>> -	return 0;
>>>> -}
>>>> -#endif
>>>> -
>>>>    struct invalidation_fence {
>>>>    	struct xe_gt_tlb_invalidation_fence base;
>>>>    	struct xe_gt *gt;
>>>> @@ -2255,22 +2240,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
>>>>    	.pre_commit = xe_pt_pre_commit,
>>>>    };
>>>> -static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
>>>> +static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
>>>>    	.populate = xe_vm_populate_pgtable,
>>>>    	.clear = xe_migrate_clear_pgtable_callback,
>>>> -	.pre_commit = xe_pt_userptr_pre_commit,
>>>> +	.pre_commit = xe_pt_svm_userptr_pre_commit,
>>>>    };
>>>> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>>>> -static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
>>>> -	.populate = xe_vm_populate_pgtable,
>>>> -	.clear = xe_migrate_clear_pgtable_callback,
>>>> -	.pre_commit = xe_pt_svm_pre_commit,
>>>> -};
>>>> -#else
>>>> -static const struct xe_migrate_pt_update_ops svm_migrate_ops;
>>>> -#endif
>>>> -
>>>>    /**
>>>>     * xe_pt_update_ops_run() - Run PT update operations
>>>>     * @tile: Tile of PT update operations
>>>> @@ -2296,10 +2271,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>>    	struct xe_vma_op *op;
>>>>    	int err = 0, i;
>>>>    	struct xe_migrate_pt_update update = {
>>>> -		.ops = pt_update_ops->needs_svm_lock ?
>>>> -			&svm_migrate_ops :
>>>> -			pt_update_ops->needs_userptr_lock ?
>>>> -			&userptr_migrate_ops :
>>>> +		.ops = pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock ?
>>>> +			&svm_userptr_migrate_ops :
>>>>    			&migrate_ops,
>>>>    		.vops = vops,
>>>>    		.tile_id = tile->id,
>>>> @@ -2419,10 +2392,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>>>    				  &ifence->base.base, &mfence->base.base);
>>>>    	}
>>>> -	if (pt_update_ops->needs_svm_lock)
>>>> -		xe_svm_notifier_unlock(vm);
>>>> -	if (pt_update_ops->needs_userptr_lock)
>>>> -		up_read(&vm->svm.gpusvm.notifier_lock);
>>>> +	if (pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock)
>>>> +		drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>>>>    	return fence;
>>>> -- 
>>>> 2.48.1
>>>>
>>

