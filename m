Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB211E4F4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 14:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4FF6E8A6;
	Fri, 13 Dec 2019 13:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2019 13:53:52 UTC
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E921B6E8A6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 13:53:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D7411FB;
 Fri, 13 Dec 2019 05:46:46 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F6B3F52E;
 Fri, 13 Dec 2019 05:46:45 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Prefix interrupt handlers' names
To: Neil Armstrong <narmstrong@baylibre.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org
References: <20191213123942.22891-1-ezequiel@collabora.com>
 <26b59d91-f974-de29-5ca8-6fbc2db29a11@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <31fd8f77-99b3-9edf-a23b-1484d9dcf48f@arm.com>
Date: Fri, 13 Dec 2019 13:46:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <26b59d91-f974-de29-5ca8-6fbc2db29a11@baylibre.com>
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
Cc: kernel@collabora.com, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2019 1:18 pm, Neil Armstrong wrote:
> Hi,
> 
> On 13/12/2019 13:39, Ezequiel Garcia wrote:
>> Currently, the interrupt lines requested by Panfrost
>> use ambiguous names, which adds some obscurity
>> to interrupt introspection (i.e. any tool based
>> on procfs' interrupts file).
>>
>> In order to improve this, prefix each requested
>> interrupt with either the module name or the device
>> name, where possible.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
>>   drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 6 ++++--
>>   3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> index f67ed925c0ef..0355c4a78eaa 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> @@ -348,7 +348,7 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>>   		return -ENODEV;
>>   
>>   	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
>> -			       IRQF_SHARED, "gpu", pfdev);
>> +			       IRQF_SHARED, dev_name(pfdev->dev), pfdev);
>>   	if (err) {
>>   		dev_err(pfdev->dev, "failed to request gpu irq");
>>   		return err;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index 05c85f45a0de..3bd79ebb6c40 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -480,7 +480,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>   		return -ENODEV;
>>   
>>   	ret = devm_request_irq(pfdev->dev, irq, panfrost_job_irq_handler,
>> -			       IRQF_SHARED, "job", pfdev);
>> +			       IRQF_SHARED, KBUILD_MODNAME "-job", pfdev);
>>   	if (ret) {
>>   		dev_err(pfdev->dev, "failed to request job irq");
>>   		return ret;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 842bdd7cf6be..806958434726 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -612,9 +612,11 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>>   	if (irq <= 0)
>>   		return -ENODEV;
>>   
>> -	err = devm_request_threaded_irq(pfdev->dev, irq, panfrost_mmu_irq_handler,
>> +	err = devm_request_threaded_irq(pfdev->dev, irq,
>> +					panfrost_mmu_irq_handler,
>>   					panfrost_mmu_irq_handler_thread,
>> -					IRQF_SHARED, "mmu", pfdev);
>> +					IRQF_SHARED, KBUILD_MODNAME "-mmu",
>> +					pfdev);
>>   
>>   	if (err) {
>>   		dev_err(pfdev->dev, "failed to request mmu irq");
>>
> 
> Why don't you use dev_name(pfdev->dev) everywhere ?

Agreed, while the current implementation may be confusing it is at least 
self-consistent. TBH it would probably be sufficient to save the bother 
of allocating strings and just settle on "panfrost-{gpu,job,mmu}", since 
upstream users are unlikely to ever come across a system with more than 
one Mali in it ;)

And FWIW note that "GPU" really is the specific hardware name of that 
IRQ output; it's not just a generic fill-in for "the one that isn't the 
Job or MMU IRQ".

Thanks,
Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
