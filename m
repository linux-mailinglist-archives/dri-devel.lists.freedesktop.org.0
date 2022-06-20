Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E85518E3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B89710E12E;
	Mon, 20 Jun 2022 12:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C544910E12E;
 Mon, 20 Jun 2022 12:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655728172; x=1687264172;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HxnFIZ1qhK1EQpSYlB6DHWoJIa81C0a9zYF6I+iK9kk=;
 b=ObX+CmuHK6VCCIM2920cBDiGME6TXx2D4XeZBOKSmNiiTWMp/Llu33kv
 prVVbAUPJsfWoHL5698Rk2KLZ833ALVc0xyc9tgJ0pZPM2O7URPOAi2xG
 qp5apMIN3i07FgyPTeksx0aiOz5zVDDpaQ0cidQoRyxVyyxt6xHiCLalq
 PORKueo1oJq/mxf5g7segSU0ocuGBoUDx9zUM7bVSjDQQ/AfKCL4GUhLw
 Sqi2kK9AizbuNcbW+RiZEEcBjnD81hynLDVYRm6mYDNZpKC3pin1jAT1E
 Qeh3QUlwxz3EUvnEt+s/rNgtY4YcEVcig29WPJsnGKoxvNfQuflR33ZF1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341564627"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341564627"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 05:29:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="729365541"
Received: from ahashmi-mobl.ger.corp.intel.com (HELO [10.249.254.225])
 ([10.249.254.225])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 05:29:30 -0700
Message-ID: <c8401b9e-cc00-a459-7bb0-8861edb599de@linux.intel.com>
Date: Mon, 20 Jun 2022 14:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix vm use-after-free in vma
 destruction
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20220512094045.792373-1-thomas.hellstrom@linux.intel.com>
 <Yoa6vqN/BOfoF53j@intel.intel>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <Yoa6vqN/BOfoF53j@intel.intel>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Andi

On 5/19/22 23:46, Andi Shyti wrote:
> Hi Thomas,
>
> On Thu, May 12, 2022 at 11:40:45AM +0200, Thomas Hellström wrote:
>> In vma destruction, the following race may occur:
>>
>> Thread 1:	    		  Thread 2:
>> i915_vma_destroy();
>>
>>    ...
>>    list_del_init(vma->vm_link);
>>    ...
>>    mutex_unlock(vma->vm->mutex);
>> 				  __i915_vm_release();
>> release_references();
>>
>> And in release_reference() we dereference vma->vm to get to the
>> vm gt pointer, leadin go a use-after free.
> leading to
Thanks, will fix.
>
> [...]
>
>> -static void release_references(struct i915_vma *vma, bool vm_ddestroy)
>> +static void release_references(struct i915_vma *vma, struct intel_gt *gt,
>> +			       bool vm_ddestroy)
>>   {
>>   	struct drm_i915_gem_object *obj = vma->obj;
>> -	struct intel_gt *gt = vma->vm->gt;
>>   
>>   	GEM_BUG_ON(i915_vma_is_active(vma));
> but then we have
>
> 	if (vm_ddestroy)
> 		i915_vm_resv_put(vma->vm);
>
> were we reference to a freed vm, right? Do we need to check it
> here, as well?

No, it's not needed, since if vm_ddestroy is true, we keep the vm alive 
using the vm
resv_ref until i915_vm_resv_put(). This is for the rare occasions where, 
during vm destruction, we fail to grab an object reference and therefore 
vma destruction is left for the object destructor. In those cases the 
vma needs to keep the vm in memory for it to be able to grab the vm mutex.

/Thomas




>
> Andi
