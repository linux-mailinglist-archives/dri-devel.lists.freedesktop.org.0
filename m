Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C7D30DE78
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 16:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5441A6EB18;
	Wed,  3 Feb 2021 15:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 892D56EB18
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 15:43:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA81B11FB;
 Wed,  3 Feb 2021 07:43:07 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1643F73B;
 Wed,  3 Feb 2021 07:43:06 -0800 (PST)
Subject: Re: [PATCH 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
To: Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20210201082116.267208-1-boris.brezillon@collabora.com>
 <20210201082116.267208-4-boris.brezillon@collabora.com>
 <CAL_JsqLGfjbu1AmuqHtSCqFpkWFdZ7qPb4BWAr3d5eHzq55+0g@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <170de1a4-94f3-1cb2-cc72-6766509eebcc@arm.com>
Date: Wed, 3 Feb 2021 15:43:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLGfjbu1AmuqHtSCqFpkWFdZ7qPb4BWAr3d5eHzq55+0g@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2021 14:45, Rob Herring wrote:
> On Mon, Feb 1, 2021 at 2:21 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
>>
>> Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
>> in the threaded irq handler as long as we can.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 21e552d1ac71..65bc20628c4e 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -580,6 +580,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>>          u32 status = mmu_read(pfdev, MMU_INT_RAWSTAT);
>>          int i, ret;
>>
>> +again:
>> +
>>          for (i = 0; status; i++) {
>>                  u32 mask = BIT(i) | BIT(i + 16);
>>                  u64 addr;
>> @@ -628,6 +630,11 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>>                  status &= ~mask;
>>          }
>>
>> +       /* If we received new MMU interrupts, process them before returning. */
>> +       status = mmu_read(pfdev, MMU_INT_RAWSTAT);
>> +       if (status)
>> +               goto again;
>> +
> 
> Can't we avoid the goto? Change the for loop like this:
> 
> i = 0;
> while (status = mmu_read(pfdev, MMU_INT_RAWSTAT)) {
>      ...
> 
>      i++;
>      if (i == 16)
>          i = 0;
> }

Well that reads from the RAWSTAT register excessively (which could be 
expensive at low GPU clock speeds), but we could do:

for(i = 0; status; i++) {
	...

	if (!status) {
		i = 0;
		status = mmu_read(pfdev, MMU_INT_RAWSTAT);
	}
}

(or similar with a while() if you prefer). Of course we could even get 
rid of the 'i' loop altogether:

status = mmu_read(pfdev, MMU_INT_RAWSTAT);
while (status) {
	int i = ffs(status | (status >> 16)) - 1;

	... existing code ...

	status &= ~mask;
	if (!status)
		status = mmu_read(pfdev, MMU_INT_RAWSTAT);
}

Steve

>>          mmu_write(pfdev, MMU_INT_MASK, ~0);
>>          return IRQ_HANDLED;
>>   };
>> --
>> 2.26.2
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
