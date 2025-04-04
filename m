Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BFEA7B8B1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B21010EB87;
	Fri,  4 Apr 2025 08:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzOAUZnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0778810E334;
 Fri,  4 Apr 2025 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743754842; x=1775290842;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dlLJ5y6yJapKHTeBcp9iPvnta+v8NdI6OGfUolbA1ck=;
 b=FzOAUZnYo6ty+v9xmId9GfGK3Sz4ZHbMPlP8fdyU7J9xGVP4noFKNk6t
 g7JYibTKSlwd3Bg+sLLC9KP+hot8vhfBr0Z9iVhMoYjM91qXKH5lLtE8p
 z/gcBF9Pch2Ei3t/+I1EU9QOvu0UY6zxd0kWQpUWNiA/o0ZM25H9ajKWC
 lr7kSis4TQYgnL8buSRQFm3q9OVIxdINO6hT0jKP6EcRvQ91TBCdCZJ77
 rRy8EC1SwonKHeNLCzzpVgQMwbLQcmbtSX3ccVUtQMwKXnfOjRB4ZgK8P
 PXvhOad3JnXC3Tp0u2nF9i07Zp02QYDUW0G2wKUbGxiZ6vB44pw1C5gTR Q==;
X-CSE-ConnectionGUID: urQtpjrTS/aIsP6GGEONxg==
X-CSE-MsgGUID: NS38oQXDQzCUI2QjyVWeDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44905205"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="44905205"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:20:42 -0700
X-CSE-ConnectionGUID: qobaTLXNQHCRESjqjdOkXw==
X-CSE-MsgGUID: lykQPJY3R1GWMOAUuFscjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132373146"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.34])
 ([10.245.245.34])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 01:20:40 -0700
Message-ID: <5377fe99-426e-460e-8b57-1d29abe85be6@intel.com>
Date: Fri, 4 Apr 2025 09:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
 <20250328181028.288312-16-matthew.auld@intel.com>
 <Z+78XPpZP8UOB4sq@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z+78XPpZP8UOB4sq@lstrano-desk.jf.intel.com>
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

On 03/04/2025 22:23, Matthew Brost wrote:
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
> 
> I think it would be better to combine needs_svm_lock into a single
> variable, rename op_check_userptr to op_check_svm_userptr, and then add
> the code in the above if statement to op_check_svm_userptr. Yes, the way
> have it coded now works but when Himal's code for SVM prefetch lands a
> VM operation list could have both userptr binds and binds SVM within
> single list. Changing it per my suggestion should make that work too.

Will try this. Thanks for the comments.

> 
> Matt
> 
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

