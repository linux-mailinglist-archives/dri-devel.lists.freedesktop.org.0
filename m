Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B684BE7E08
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 11:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA7610EB97;
	Fri, 17 Oct 2025 09:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69C0510E041
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 09:46:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CED71595;
 Fri, 17 Oct 2025 02:46:46 -0700 (PDT)
Received: from [10.57.36.33] (unknown [10.57.36.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACB043F66E;
 Fri, 17 Oct 2025 02:46:51 -0700 (PDT)
Message-ID: <1849523e-fff1-40e3-9d96-ae389cca6078@arm.com>
Date: Fri, 17 Oct 2025 11:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix UAF race between device unplug and FW
 event processing
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251008105322.4077661-1-ketil.johnsen@arm.com>
 <20251009114531.0e85fa21@fedora>
Content-Language: en-US
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20251009114531.0e85fa21@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2025 11:45, Boris Brezillon wrote:
> On Wed,  8 Oct 2025 12:53:20 +0200
> Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> 
>> The function panthor_fw_unplug() will free the FW memory sections.
>> The problem is that there could still be pending FW events which are yet
>> not handled at this point. process_fw_events_work() can in this case try
>> to access said freed memory.
>>
>> The fix is to stop FW event processing after IRQs are disabled but before
>> the FW memory is freed.
>>
>> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_fw.c    |  3 +++
>>   drivers/gpu/drm/panthor/panthor_sched.c | 12 ++++++++++++
>>   drivers/gpu/drm/panthor/panthor_sched.h |  1 +
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index 9bf06e55eaee..4f393c5cd26f 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -1172,6 +1172,9 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>>   		panthor_fw_stop(ptdev);
>>   	}
>>   
>> +	/* Any pending FW event processing must stop before we free FW memory */
>> +	panthor_sched_stop_fw_events(ptdev);
>> +
>>   	list_for_each_entry(section, &ptdev->fw->sections, node)
>>   		panthor_kernel_bo_destroy(section->mem);
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>> index 0cc9055f4ee5..d150c8d99432 100644
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -1794,6 +1794,18 @@ void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events)
>>   	sched_queue_work(ptdev->scheduler, fw_events);
>>   }
>>   
>> +/**
>> + * panthor_sched_stop_fw_events() - Stop processing FW events.
>> + */
>> +void panthor_sched_stop_fw_events(struct panthor_device *ptdev)
>> +{
>> +	if (!ptdev->scheduler)
>> +		return;
>> +
>> +	atomic_set(&ptdev->scheduler->fw_events, 0);
>> +	cancel_work_sync(&ptdev->scheduler->fw_events_work);
>> +}
> 
> Hm, I'd rather have this called from sched_unplug() and then have an
> extra check in panthor_sched_report_fw_events() to bail out if the
> scheduler component is no longer functional. This way this helper stays
> private to panthor_sched.c.

A heads up on this from me:

I found a new race in the driver, somewhat similar to this one, as I was 
trying your suggested approach here. Simply put, panthor_device_unplug() 
calls drm_dev_unplug() at a time where there could be a running 
panthor_device_suspend(). This causes the suspend routine to skip a lot 
of work, for instance skip sync with running IRQ handlers, and boom, IRQ 
handlers will access a powered off GPU.

I will (most likely) push a v2 with both races fixed, as they both 
relate to interrupt processing while GPU is off.

> 
>> +
>>   static const char *fence_get_driver_name(struct dma_fence *fence)
>>   {
>>   	return "panthor";
>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
>> index f4a475aa34c0..4393599ed330 100644
>> --- a/drivers/gpu/drm/panthor/panthor_sched.h
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
>> @@ -51,6 +51,7 @@ void panthor_sched_resume(struct panthor_device *ptdev);
>>   
>>   void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
>>   void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
>> +void panthor_sched_stop_fw_events(struct panthor_device *ptdev);
>>   
>>   void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
>>   
> 

