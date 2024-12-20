Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112B89F90EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EC310EF8B;
	Fri, 20 Dec 2024 11:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5065910EF86
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:08:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0461480;
 Fri, 20 Dec 2024 03:09:16 -0800 (PST)
Received: from [10.1.31.19] (e122027.cambridge.arm.com [10.1.31.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13C863F58B;
 Fri, 20 Dec 2024 03:08:45 -0800 (PST)
Message-ID: <cf8ea27a-f7de-4518-afb1-61fcf5bbb981@arm.com>
Date: Fri, 20 Dec 2024 11:08:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
To: Mihail Atanassov <mihail.atanassov@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Mart=C3=ADnez_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-2-adrian.larumbe@collabora.com>
 <2a7c5a0b-af3f-4f1c-8c77-ab6233afcc76@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <2a7c5a0b-af3f-4f1c-8c77-ab6233afcc76@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 19/12/2024 16:30, Mihail Atanassov wrote:
> 
> 
> On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>>
>> This will display the sizes of kenrel BO's bound to an open file,
>> which are
>> otherwise not exposed to UM through a handle.
>>
>> The sizes recorded are as follows:
>>   - Per group: suspend buffer, protm-suspend buffer, syncobjcs
>>   - Per queue: ringbuffer, profiling slots, firmware interface
>>   - For all heaps in all heap pools across all VM's bound to an open
>> file,
>>   record size of all heap chuks, and for each pool the gpu_context BO
>> too.
>>
>> This does not record the size of FW regions, as these aren't bound to a
>> specific open file and remain active through the whole life of the
>> driver.
>>
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---

[...]

>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/
>> panthor/panthor_mmu.c
>> index c39e3eb1c15d..51f6e66df3f5 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -1941,6 +1941,41 @@ struct panthor_heap_pool
>> *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>>       return pool;
>>   }
>>   +/**
>> + * panthor_vm_heaps_size() - Calculate size of all heap chunks across
>> all
>> + * heaps over all the heap pools in a VM
>> + * @pfile: File.
>> + * @status: Memory status to be updated.
>> + *
>> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If
>> the VM
>> + * is active, record the size as active as well.
>> + */
>> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct
>> drm_memory_stats *status)
>> +{
>> +    struct panthor_vm *vm;
>> +    unsigned long i;
>> +
>> +    if (!pfile->vms)
>> +        return;
>> +
>> +    xa_for_each(&pfile->vms->xa, i, vm) {
>> +        size_t size;
>> +
>> +        mutex_lock(&vm->heaps.lock);
> 
> Use `scoped_guard` instead?
> 
> #include <linux/cleanup.h>
> 
> /* ... */
> 
>     xa_for_each(...) {
>         size_t size;
> 
>         scoped_guard(mutex, &vm->heaps.lock) {
>             if (!vm->heaps.pool)
>                 continue;
> 
>             size = panthor_heap_pool_size(vm->heaps.pool);
>         }
>         /* ... */

I don't believe this actually works. The implementation of scoped_guard
uses a for() loop. So the "continue" will be applied to this (hidden)
internal loop rather than the xa_for_each() loop intended.

An alternative would be:

	xa_for_each(&pfile->vms->xa, i, vm) {
		size_t size = 0;

		mutex_lock(&vm->heaps.lock);
		if (vm->heaps.pool)
			size = panthor_heap_pool_size(vm->heaps.pool);
		mutex_unlock(&vm->heaps.lock);

		status->resident += size;
		status->private += size;
		if (vm->as.id >= 0)
			status->active += size;
	}

(relying on size=0 being a no-op for the additions). Although I was
personally also happy with the original - but perhaps that's just
because I'm old and still feel anxious when I see scoped_guard() ;)

Steve

