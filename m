Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B96FF623
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 17:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA9210E50C;
	Thu, 11 May 2023 15:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3247310E4F7;
 Thu, 11 May 2023 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683819498; x=1715355498;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0QtX4To5eUZwZmm0QMZDGkxR5XnmPer6TWPmN4PKHVM=;
 b=Qb2o0SPB+0MhWKaZa2zVjQ+Dnki4sxp5QqDnIalHxgphkr71WalbLYlo
 ZM7NyXe124DqbULNKfeCDmtX+cXflkFBUEp+X2ckg1U6Cw0BeT6rV1eU2
 4DFkpiP1Sm8n9+KS+/UAewf1nezds3v2B0tVTDaz6jyOiEXIuFOX0GJE3
 N+L1lwJ/fGfkytifh+0TxrCe1UlBBc7riB3R1V6fpmyrFzbh3/PNtJchg
 3BTJaMFlcn1y9E0xHCUADi3yCXjqmF4GMtdFuUidWVwmqb7ml3Hy2POTi
 RQWB0KIlhbVCPmSS60l2q8SjNQ6RH2ujN1x0GVO7j5M8riLH1nwEskFS1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="436869887"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="436869887"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 08:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811663046"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="811663046"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 08:38:14 -0700
Message-ID: <503087d4-694d-fe7e-17a0-ee5a5ec80011@linux.intel.com>
Date: Thu, 11 May 2023 17:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Properly remove the vma from the
 vm::notifer::rebind_list when destroyed
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
 <20230510141932.413348-3-thomas.hellstrom@linux.intel.com>
 <ZF0BoLJBupaVg+t4@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZF0BoLJBupaVg+t4@DUT025-TGLU.fm.intel.com>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/11/23 16:54, Matthew Brost wrote:
> On Wed, May 10, 2023 at 04:19:32PM +0200, Thomas Hellström wrote:
>> If a vma was destroyed with the bo evicted, it might happen that we forget
>> to remove it from the notifer::rebind_list. Fix to make sure that really
>> happens.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 5f93d78c2e58..f54b3b7566c9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -978,6 +978,15 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>   	} else {
>>   		xe_bo_assert_held(vma->bo);
>>   		list_del(&vma->bo_link);
>> +		/*
>> +		 * TODO: We can do an advisory check for list link empty here,
>> +		 * if this lock becomes too costly. Nobody can re-add to the
>> +		 * bo to the vm::notifier::rebind_list at this point since we
>> +		 * have the bo lock.
>> +		 */
> IMO grab isn't a big deal, not sure this is worth such a lengthly comment.

Ok, I'll remove it.


>
>> +		 spin_lock(&vm->notifier.list_lock);
>> +		 list_del(&vma->notifier.rebind_link);
> Can you safe call list_del on an empty list? I thought that call blows
> up hence we have a bunch of if (!list_empty()) checks before calling
> list_del all over the driver.

Good question. Looking at the implementation it definitely looks 
possible, and I have LIST_DEBUG turned on when testing, so I assume it 
would have blown up otherwise.

/Thomas


>
> Matt
>
>> +		 spin_unlock(&vm->notifier.list_lock);
>>   		if (!vma->bo->vm)
>>   			vm_remove_extobj(vma);
>>   	}
>> -- 
>> 2.39.2
>>
