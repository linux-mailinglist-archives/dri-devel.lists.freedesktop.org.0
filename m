Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA03DB2814D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C4D10E963;
	Fri, 15 Aug 2025 14:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18DDF10E963
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:10:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EACE1691;
 Fri, 15 Aug 2025 07:09:58 -0700 (PDT)
Received: from [10.1.29.14] (e122027.cambridge.arm.com [10.1.29.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7241A3F738;
 Fri, 15 Aug 2025 07:10:04 -0700 (PDT)
Message-ID: <7e495e8f-26a0-4a82-8888-b8f1e512ebef@arm.com>
Date: Fri, 15 Aug 2025 15:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Simplify mmu_hw_do_operation_locked
To: Karunika Choo <karunika.choo@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>, nd@arm.com
References: <20250815134226.57703-1-steven.price@arm.com>
 <ee996a62-bcbf-4702-837e-85f93feb7240@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ee996a62-bcbf-4702-837e-85f93feb7240@arm.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/08/2025 15:01, Karunika Choo wrote:
> On 15/08/2025 14:42, Steven Price wrote:
>> The only callers to mmu_hw_do_operation_locked() pass an 'op' of either
>> AS_COMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT. This means the code paths
>> after that are dead. Removing those paths means the
>> mmu_hw_do_flush_on_gpu_ctrl() function might has well be inlined.
>>
>> Simplify everything by having a switch statement for the type of 'op'
>> (warning if we get an unexpected value) and removing the dead cases.
>>
>> Suggested-by: Daniel Stone <daniel@fooishbar.org>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v1:
>>  * As well as removing dead code, inline mmu_hw_do_flush_on_gpu_ctrl
>>
>>  drivers/gpu/drm/panthor/panthor_mmu.c | 57 ++++++++++++---------------
>>  1 file changed, 26 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index 367c89aca558..9d77e7c16ed2 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -569,15 +569,37 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>>  }
>>  
>> -static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
>> -				       u32 op)
>> +static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>> +				      u64 iova, u64 size, u32 op)
>>  {
>>  	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
>> -	u32 lsc_flush_op = 0;
>> +	u32 lsc_flush_op;
>>  	int ret;
>>  
>> -	if (op == AS_COMMAND_FLUSH_MEM)
>> +	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>> +
>> +	switch (op) {
>> +	case AS_COMMAND_FLUSH_MEM:
>>  		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
>> +		break;
>> +	case AS_COMMAND_FLUSH_PT:
>> +		lsc_flush_op = 0;
>> +		break;
>> +	default:
>> +		drm_WARN(&ptdev->base, 1, "Unexpected AS_COMMAND: %d", op);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (as_nr < 0)
>> +		return 0;
>> +
> 
> Hi Steve,
> 
> Thanks for pushing this patch. I was planning to address Daniel's
> comment next week.
> 
> One small nit, would it be better to move the (as_nr < 0) check just
> after the lockdep_assert_held() (above the switch case)?

I'm not sure it makes much difference, but there was a minor reason for
my ordering:

By having it after the switch statement then if someone adds a call with
an invalid op value it will always fail (with a warning). Whereas if we
move the (as_nr < 0) check earlier then there's a chance they won't
notice if their testing doesn't trigger that case.

Obviously there might be a (theoretical) performance impact, but I don't
think the one extra check would be noticeable - this isn't exactly a
major fast path. Is there something else I've missed which would justify
switching it around?

Thanks,
Steve

> Looks good to me otherwise.
> 
> Kind regards,
> Karunika
> 
>> +	/*
>> +	 * If the AS number is greater than zero, then we can be sure
>> +	 * the device is up and running, so we don't need to explicitly
>> +	 * power it up
>> +	 */
>> +
>> +	lock_region(ptdev, as_nr, iova, size);
>>  
>>  	ret = wait_ready(ptdev, as_nr);
>>  	if (ret)
>> @@ -598,33 +620,6 @@ static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
>>  	return wait_ready(ptdev, as_nr);
>>  }
>>  
>> -static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>> -				      u64 iova, u64 size, u32 op)
>> -{
>> -	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>> -
>> -	if (as_nr < 0)
>> -		return 0;
>> -
>> -	/*
>> -	 * If the AS number is greater than zero, then we can be sure
>> -	 * the device is up and running, so we don't need to explicitly
>> -	 * power it up
>> -	 */
>> -
>> -	if (op != AS_COMMAND_UNLOCK)
>> -		lock_region(ptdev, as_nr, iova, size);
>> -
>> -	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
>> -		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
>> -
>> -	/* Run the MMU operation */
>> -	write_cmd(ptdev, as_nr, op);
>> -
>> -	/* Wait for the flush to complete */
>> -	return wait_ready(ptdev, as_nr);
>> -}
>> -
>>  static int mmu_hw_do_operation(struct panthor_vm *vm,
>>  			       u64 iova, u64 size, u32 op)
>>  {
> 

