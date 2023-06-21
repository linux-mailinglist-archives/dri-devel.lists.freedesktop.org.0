Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9AA738B57
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D983810E23F;
	Wed, 21 Jun 2023 16:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FDEB10E24C;
 Wed, 21 Jun 2023 16:33:04 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxZ8U+JpNkxjMAAA--.344S3;
 Thu, 22 Jun 2023 00:33:02 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxvM49JpNkx+oAAA--.5470S3; 
 Thu, 22 Jun 2023 00:33:01 +0800 (CST)
Message-ID: <c8b4697d-733b-f4f0-fbf0-98ee9bb6d3e8@loongson.cn>
Date: Thu, 22 Jun 2023 00:33:01 +0800
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
 <9c8afcb4-70c0-a920-2a78-78a9ac884c80@loongson.cn>
 <737b07582ef2a4b2f134a1a931b6621ff96adb77.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <737b07582ef2a4b2f134a1a931b6621ff96adb77.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxvM49JpNkx+oAAA--.5470S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr43Zw4DAw48Jr1fGFyrKrX_yoW8Kr43pF
 WDta4YyrWUXr10gw12qw15ZFy3K34fXF929rnrGwn09390yryUKFyrKF45CF90vr18Gr12
 vFs0qryxXF9ayrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
 AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
 k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
 Gr1l4IxYO2xFxVAFwI0_ZF0_GFyUMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8CksDUUUUU==
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

Hi,

On 2023/6/22 00:12, Lucas Stach wrote:
> Am Mittwoch, dem 21.06.2023 um 23:41 +0800 schrieb Sui Jingfeng:
>> On 2023/6/21 23:23, Lucas Stach wrote:
>>> Am Mittwoch, dem 21.06.2023 um 22:44 +0800 schrieb Sui Jingfeng:
>>>> Hi,
>>>>
>>>> On 2023/6/21 18:00, Lucas Stach wrote:
>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>>>> index 9cd72948cfad..644e5712c050 100644
>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>>>> @@ -46,6 +46,12 @@ struct etnaviv_drm_private {
>>>>>>     	struct xarray active_contexts;
>>>>>>     	u32 next_context_id;
>>>>>>     
>>>>>> +	/*
>>>>>> +	 * If true, the GPU is capable of snooping cpu cache. Here, it
>>>>>> +	 * also means that cache coherency is enforced by the hardware.
>>>>>> +	 */
>>>>>> +	bool dma_coherent;
>>>>>> +
>>>>> No need for this, I think. Just use dev_is_dma_coherent() where you
>>>>> need to know this.
>>>>>
>>>> No, we want this value cached by the driver.
>>>>
>>> Why? dev_is_dma_coherent() is a header-only function with a single
>>> pointer chasing operation. Your cache is also a single pointer chasing
>>> access, just that we now need storage for this information in both
>>> struct device and struct etnaviv_gpu.
>>
>> You don't need store it in struct etnaviv_gpu.
>>
>> As this variable is shared across the device, so it is better to be put
>> in the struct etnaviv_drm_private.
>>
>> I don't think another 4 bytes allocation is something what we can't pay for.
>>
>>
>> My patch doesn't mentioned that it need to store it inside of struct
>> etnaviv_gpu, do I?
> You are right, I was mistaken about the etnaviv struct this is added
> to. However there is still the fundamental question: what's the gain of
> this cache?

Clearness and short

you approach need to de-reference the pointer struct device *dev every 
time you need to fetch its value.

my name is short, typing it is less time-consuming

>   The information is already available in struct device and
> will be accessed with the same amount of loads if you care that much
> about micro-optimization.

I don't want call it everywhere, its too long.

What if the function you recommend get expanded by some programmer someday?

> Regards,
> Lucas

-- 
Jingfeng

