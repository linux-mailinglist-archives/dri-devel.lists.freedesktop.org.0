Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA053AE77D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 12:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CA189CC1;
	Mon, 21 Jun 2021 10:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49E1E892BD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:45:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8FD8D6E;
 Mon, 21 Jun 2021 03:45:22 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A09A3F718;
 Mon, 21 Jun 2021 03:45:21 -0700 (PDT)
Subject: Re: [PATCH v2] drm/panfrost:report the full raw fault information
 instead
To: Chunyou Tang <tangchunyou@163.com>
References: <20210617062054.1864-1-tangchunyou@163.com>
 <2dcbb36a-b550-4c9d-cff8-73ca4b5abb11@arm.com>
 <20210619111852.00003e52@163.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <23f675e9-698d-840d-104f-33aa594dcb96@arm.com>
Date: Mon, 21 Jun 2021 11:45:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210619111852.00003e52@163.com>
Content-Type: text/plain; charset=gb18030
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/06/2021 04:18, Chunyou Tang wrote:
> Hi Steve,
> 	1,Now I know how to write the subject
> 	2,the low 8 bits is the exception type in spec.
> 
> and you can see prnfrost_exception_name()
> 
> switch (exception_code) {
>                 /* Non-Fault Status code */
> case 0x00: return "NOT_STARTED/IDLE/OK";
> case 0x01: return "DONE";
> case 0x02: return "INTERRUPTED";
> case 0x03: return "STOPPED";
> case 0x04: return "TERMINATED";
> case 0x08: return "ACTIVE";
> ........
> ........
> case 0xD8: return "ACCESS_FLAG";
> case 0xD9 ... 0xDF: return "ACCESS_FLAG";
> case 0xE0 ... 0xE7: return "ADDRESS_SIZE_FAULT";
> case 0xE8 ... 0xEF: return "MEMORY_ATTRIBUTES_FAULT";
> }
> return "UNKNOWN";
> }
> 
> the exception_code in case is only 8 bits,so if fault_status
> in panfrost_gpu_irq_handler() don't & 0xFF,it can't get correct
> exception reason,it will be always UNKNOWN.

Yes, I'm happy with the change - I just need a patch that I can apply.
At the moment this patch only changes the first '0x%08x' output rather
than the call to panfrost_exception_name() as well. So we just need a
patch which does:

- fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status),
+ fault_status, panfrost_exception_name(pfdev, fault_status & 0xFF),

along with a suitable subject/commit message describing the change. If
you can send me that I can apply it.

Thanks,

Steve

PS. Sorry for going round in circles here - I'm trying to help you get
setup so you'll be able to contribute patches easily in future. An
important part of that is ensuring you can send a properly formatted
patch to the list.

PPS. I'm still not receiving your emails directly. I don't think it's a
problem at my end because I'm receiving other emails, but if you can
somehow fix the problem you're likely to receive a faster response.

> ÓÚ Fri, 18 Jun 2021 13:43:24 +0100
> Steven Price <steven.price@arm.com> Ð´µÀ:
> 
>> On 17/06/2021 07:20, ChunyouTang wrote:
>>> From: ChunyouTang <tangchunyou@icubecorp.cn>
>>>
>>> of the low 8 bits.
>>
>> Please don't split the subject like this. The first line of the commit
>> should be a (very short) summary of the patch. Then a blank line and
>> then a longer description of what the purpose of the patch is and why
>> it's needed.
>>
>> Also you previously had this as part of a series (the first part
>> adding the "& 0xFF" in the panfrost_exception_name() call). I'm not
>> sure we need two patches for the single line, but as it stands this
>> patch doesn't apply.
>>
>> Also I'm still not receiving any emails from you directly (only via
>> the list), so it's possible I might have missed something you sent.
>>
>> Steve
>>
>>>
>>> Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
>>> ---
>>>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c index
>>> 1fffb6a0b24f..d2d287bbf4e7 100644 ---
>>> a/drivers/gpu/drm/panfrost/panfrost_gpu.c +++
>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c @@ -33,7 +33,7 @@ static
>>> irqreturn_t panfrost_gpu_irq_handler(int irq, void *data) address
>>> |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO); 
>>>  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
>>> 0x%016llx\n",
>>> -			 fault_status & 0xFF,
>>> panfrost_exception_name(pfdev, fault_status & 0xFF),
>>> +			 fault_status,
>>> panfrost_exception_name(pfdev, fault_status & 0xFF), address);
>>>  
>>>  		if (state & GPU_IRQ_MULTIPLE_FAULT)
>>>
> 
> 

