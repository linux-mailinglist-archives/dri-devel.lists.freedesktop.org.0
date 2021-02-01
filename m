Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415F530A896
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1924D6E084;
	Mon,  1 Feb 2021 13:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9ADD6E084
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:24:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B07211042;
 Mon,  1 Feb 2021 05:24:04 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAEA23F66E;
 Mon,  1 Feb 2021 05:24:03 -0800 (PST)
Subject: Re: [PATCH 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210201082116.267208-1-boris.brezillon@collabora.com>
 <20210201082116.267208-4-boris.brezillon@collabora.com>
 <ecf5fb35-fd3b-5980-5eb0-fba36d6bd83f@arm.com>
 <20210201135902.6798a203@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <e58d88f9-aabb-872c-0d54-e601f2ade011@arm.com>
Date: Mon, 1 Feb 2021 13:24:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201135902.6798a203@collabora.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2021 12:59, Boris Brezillon wrote:
> On Mon, 1 Feb 2021 12:13:49 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 01/02/2021 08:21, Boris Brezillon wrote:
>>> Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
>>> in the threaded irq handler as long as we can.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> Looks fine to me, but I'm interested to know if you actually saw a
>> performance improvement. Back-to-back MMU faults should (hopefully) be
>> fairly uncommon.
> 
> I actually didn't check the perf improvement or the actual number of
> back-to-back MMU faults, but
> dEQP-GLES31.functional.draw_indirect.compute_interop.large.drawelements_combined_grid_1000x1000_drawcount_5000
> seemed to generate a few of those, so I thought it'd be good to
> optimize that case given how trivial it is.

Fair enough! I was just a little concerned that Panfrost was somehow 
provoking enough interrupts that this was a measurable performance 
improvement.

I assume you'll push these to drm-misc-next (/fixes) as appropriate.

Thanks,

Steve

>>
>> Regardless:
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>>> ---
>>>    drivers/gpu/drm/panfrost/panfrost_mmu.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>>> index 21e552d1ac71..65bc20628c4e 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>>> @@ -580,6 +580,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>>>    	u32 status = mmu_read(pfdev, MMU_INT_RAWSTAT);
>>>    	int i, ret;
>>>    
>>> +again:
>>> +
>>>    	for (i = 0; status; i++) {
>>>    		u32 mask = BIT(i) | BIT(i + 16);
>>>    		u64 addr;
>>> @@ -628,6 +630,11 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>>>    		status &= ~mask;
>>>    	}
>>>    
>>> +	/* If we received new MMU interrupts, process them before returning. */
>>> +	status = mmu_read(pfdev, MMU_INT_RAWSTAT);
>>> +	if (status)
>>> +		goto again;
>>> +
>>>    	mmu_write(pfdev, MMU_INT_MASK, ~0);
>>>    	return IRQ_HANDLED;
>>>    };
>>>    
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
