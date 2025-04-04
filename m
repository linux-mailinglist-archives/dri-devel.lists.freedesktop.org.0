Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E3A7B8AF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCC910E341;
	Fri,  4 Apr 2025 08:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtKYCcQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B9010E33D;
 Fri,  4 Apr 2025 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743754778; x=1775290778;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R4vaMDtg08GBucOZMuiVsV/TD1ZSgjUQmVHtZS2Qx4Q=;
 b=KtKYCcQUq8y7MPlOlwWp9memaUjpyt2/9ItaPd5BwSMzBkbtjOwQlma2
 lPKJS3CnnbP4qhH1uUklgfSMdCiUsPJQVeRskG388CfvqtX5ZlLuJohne
 BycLpt+IcbDbBsXrgGrGWEcQer1ue7IjUKMfaqeI7lao0S1NsQFiw+a1Z
 n46p0elKQLfQ0nxzlZrP511WvBSNUuy6ceVGioeNcPkVln6OMC1Mozlpl
 8JHDz7ZyqlrQq/MjbtiTZldBmmmHuQHGK2BRnLpNBPUDDiWZH/b+kiAwN
 8OvmM3NrgBlHfK3mFZWL/qxasgz/7ekmtxKIPyzyOIteN2NNfT+QMSPjs A==;
X-CSE-ConnectionGUID: gN2JHPmkRIq5KsDWs8j+fg==
X-CSE-MsgGUID: ie5l8QFKRSiE3/V/Q2T+pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44905157"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="44905157"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:19:38 -0700
X-CSE-ConnectionGUID: Vyvjln09QBmt1j55uM6QQg==
X-CSE-MsgGUID: XeYKGux/StCdVX3IsFepwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132372923"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.34])
 ([10.245.245.34])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:19:36 -0700
Message-ID: <bd0476de-fd5b-4ea6-806f-ca49b33b9404@intel.com>
Date: Fri, 4 Apr 2025 09:19:34 +0100
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
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z+78wBNpgGG+D7h9@lstrano-desk.jf.intel.com>
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

On 03/04/2025 22:25, Matthew Brost wrote:
> On Fri, Mar 28, 2025 at 06:10:36PM +0000, Matthew Auld wrote:
>> We now use the same notifier lock for SVM and userptr, with that we can
>> combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 95 +++++++++++++-------------------------
>>   1 file changed, 33 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index b097c91e2e02..947b82aa19a6 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -1396,7 +1396,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>>   	return err;
>>   }
>>   
>> -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>> +static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   {
>>   	struct xe_vm *vm = pt_update->vops->vm;
>>   	struct xe_vma_ops *vops = pt_update->vops;
>> @@ -1409,55 +1409,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	if (err)
>>   		return err;
>>   
>> -	down_read(&vm->svm.gpusvm.notifier_lock);
>> +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> 
> Also any reason not use xe_svm_notifier_lock / xe_svm_notifier_unlock wrappers?

Just that those are hidden behind CONFIG_DRM_XE_GPUSVM, so looks 
possible to disable svm, but then I think we should still have working 
userptr. Should I pull xe_svm_notifier_lock out of CONFIG_DRM_XE_GPUSVM?

> 
> Matt
> 
>>   
>>   	list_for_each_entry(op, &vops->list, link) {
>> -		err = op_check_userptr(vm, op, pt_update_ops);
>> -		if (err) {
>> -			up_read(&vm->svm.gpusvm.notifier_lock);
>> -			break;
>> +		if (pt_update_ops->needs_svm_lock) {
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>> +			struct xe_svm_range *range = op->map_range.range;
>> +
>> +			if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>> +				continue;
>> +
>> +			xe_svm_range_debug(range, "PRE-COMMIT");
>> +
>> +			xe_assert(vm->xe,
>> +				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +
>> +			if (!xe_svm_range_pages_valid(range)) {
>> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>> +				return -EAGAIN;
>> +			}
>> +#endif
>> +		} else {
>> +			err = op_check_userptr(vm, op, pt_update_ops);
>> +			if (err) {
>> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>> +				break;
>> +			}
>>   		}
>>   	}
>>   
>>   	return err;
>>   }
>>   
>> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>> -static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>> -{
>> -	struct xe_vm *vm = pt_update->vops->vm;
>> -	struct xe_vma_ops *vops = pt_update->vops;
>> -	struct xe_vma_op *op;
>> -	int err;
>> -
>> -	err = xe_pt_pre_commit(pt_update);
>> -	if (err)
>> -		return err;
>> -
>> -	xe_svm_notifier_lock(vm);
>> -
>> -	list_for_each_entry(op, &vops->list, link) {
>> -		struct xe_svm_range *range = op->map_range.range;
>> -
>> -		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>> -			continue;
>> -
>> -		xe_svm_range_debug(range, "PRE-COMMIT");
>> -
>> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> -
>> -		if (!xe_svm_range_pages_valid(range)) {
>> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> -			xe_svm_notifier_unlock(vm);
>> -			return -EAGAIN;
>> -		}
>> -	}
>> -
>> -	return 0;
>> -}
>> -#endif
>> -
>>   struct invalidation_fence {
>>   	struct xe_gt_tlb_invalidation_fence base;
>>   	struct xe_gt *gt;
>> @@ -2255,22 +2240,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
>>   	.pre_commit = xe_pt_pre_commit,
>>   };
>>   
>> -static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
>> +static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
>>   	.populate = xe_vm_populate_pgtable,
>>   	.clear = xe_migrate_clear_pgtable_callback,
>> -	.pre_commit = xe_pt_userptr_pre_commit,
>> +	.pre_commit = xe_pt_svm_userptr_pre_commit,
>>   };
>>   
>> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>> -static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
>> -	.populate = xe_vm_populate_pgtable,
>> -	.clear = xe_migrate_clear_pgtable_callback,
>> -	.pre_commit = xe_pt_svm_pre_commit,
>> -};
>> -#else
>> -static const struct xe_migrate_pt_update_ops svm_migrate_ops;
>> -#endif
>> -
>>   /**
>>    * xe_pt_update_ops_run() - Run PT update operations
>>    * @tile: Tile of PT update operations
>> @@ -2296,10 +2271,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>   	struct xe_vma_op *op;
>>   	int err = 0, i;
>>   	struct xe_migrate_pt_update update = {
>> -		.ops = pt_update_ops->needs_svm_lock ?
>> -			&svm_migrate_ops :
>> -			pt_update_ops->needs_userptr_lock ?
>> -			&userptr_migrate_ops :
>> +		.ops = pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock ?
>> +			&svm_userptr_migrate_ops :
>>   			&migrate_ops,
>>   		.vops = vops,
>>   		.tile_id = tile->id,
>> @@ -2419,10 +2392,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>>   				  &ifence->base.base, &mfence->base.base);
>>   	}
>>   
>> -	if (pt_update_ops->needs_svm_lock)
>> -		xe_svm_notifier_unlock(vm);
>> -	if (pt_update_ops->needs_userptr_lock)
>> -		up_read(&vm->svm.gpusvm.notifier_lock);
>> +	if (pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock)
>> +		drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>>   
>>   	return fence;
>>   
>> -- 
>> 2.48.1
>>

