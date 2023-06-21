Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E045B7389EA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4AC10E4B5;
	Wed, 21 Jun 2023 15:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13F4F10E4B5;
 Wed, 21 Jun 2023 15:41:22 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx5cQhGpNkGS0AAA--.330S3;
 Wed, 21 Jun 2023 23:41:21 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxF80hGpNkvN4AAA--.2969S3; 
 Wed, 21 Jun 2023 23:41:21 +0800 (CST)
Message-ID: <9c8afcb4-70c0-a920-2a78-78a9ac884c80@loongson.cn>
Date: Wed, 21 Jun 2023 23:41:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Sui Jingfeng <18949883232@163.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <aa73348d-5ec8-4ac0-2ec0-0cce24756c63@loongson.cn>
 <87c9576e6ca1b58fa94e0bc1a2f4be3847f0518c.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <87c9576e6ca1b58fa94e0bc1a2f4be3847f0518c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxF80hGpNkvN4AAA--.2969S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrWkuw48tF43Ww15AF1fGrX_yoW8WryDpF
 4UGFyFyrWUXr10grnFqw45XF13Kw13XFWI9wnrJwn0v3s0yryUtrn5Kr45CF9Yqw1fGr1a
 va90gFyxZF92yFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
 14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
 xVAFwI0_Wrv_ZF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
 Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JbIYCTnIWIevJa73UjIFyTuYvjxU7NtxDUUUU
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/21 23:23, Lucas Stach wrote:
> Am Mittwoch, dem 21.06.2023 um 22:44 +0800 schrieb Sui Jingfeng:
>> Hi,
>>
>> On 2023/6/21 18:00, Lucas Stach wrote:
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>> index 9cd72948cfad..644e5712c050 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>> @@ -46,6 +46,12 @@ struct etnaviv_drm_private {
>>>>    	struct xarray active_contexts;
>>>>    	u32 next_context_id;
>>>>    
>>>> +	/*
>>>> +	 * If true, the GPU is capable of snooping cpu cache. Here, it
>>>> +	 * also means that cache coherency is enforced by the hardware.
>>>> +	 */
>>>> +	bool dma_coherent;
>>>> +
>>> No need for this, I think. Just use dev_is_dma_coherent() where you
>>> need to know this.
>>>
>> No, we want this value cached by the driver.
>>
> Why? dev_is_dma_coherent() is a header-only function with a single
> pointer chasing operation. Your cache is also a single pointer chasing
> access, just that we now need storage for this information in both
> struct device and struct etnaviv_gpu.


You don't need store it in struct etnaviv_gpu.

As this variable is shared across the device, so it is better to be put 
in the struct etnaviv_drm_private.

I don't think another 4 bytes allocation is something what we can't pay for.


My patch doesn't mentioned that it need to store it inside of struct 
etnaviv_gpu, do I?

> Regards,
> Lucas
>
>> We only need call  dev_is_dma_coherent() once!
>>
>> We need to reuse this variable on other places.
>>
-- 
Jingfeng

