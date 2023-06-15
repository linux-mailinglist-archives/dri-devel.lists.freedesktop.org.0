Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE0731A7D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 15:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB6010E4FD;
	Thu, 15 Jun 2023 13:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id B64DC10E18A;
 Thu, 15 Jun 2023 13:51:41 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxpOhpF4tkRJMFAA--.1463S3;
 Thu, 15 Jun 2023 21:51:38 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxNeRoF4tkZREcAA--.14342S3; 
 Thu, 15 Jun 2023 21:51:36 +0800 (CST)
Message-ID: <ca957367-5730-a01e-8181-c2af7c57ea0b@loongson.cn>
Date: Thu, 15 Jun 2023 21:51:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/etnaviv: slow down FE idle polling
To: Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
References: <20230607125932.3518547-1-l.stach@pengutronix.de>
 <8c36b8bc-5a0d-75f7-265c-b0191979165a@loongson.cn>
 <d17de4ebfd08faa23238ece2ad0b737bf271498b.camel@pengutronix.de>
 <36946504-45c3-f0bc-3e4a-9106d9f4a2dd@loongson.cn>
 <CAH9NwWeB-MudNvuyuH1kUNiyWQTZ5Y4fuiB4uNKtutCKL3EZPg@mail.gmail.com>
 <b69671a6-4d4a-b1ee-784e-e21bd8f5558c@loongson.cn>
 <7bbad708041fffac5fcaf5c0ef2b0e53c29c682a.camel@pengutronix.de>
 <CAFXsbZo8Kcy0OAM61ENUE64-b0imbH8yHd68Mz-4=4sNGJ5x-A@mail.gmail.com>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <CAFXsbZo8Kcy0OAM61ENUE64-b0imbH8yHd68Mz-4=4sNGJ5x-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxNeRoF4tkZREcAA--.14342S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCF15uw1rGr4rCFW7tF13Awc_yoW5GFyDpF
 WUKa9IkF4kJr4xJr47Kw4UtF4Iyw10yr1UXryrWr1UC3s8Kryaqr4Syr4j9rn8Wrs3uw4j
 vr4UGry7Za4YqacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUc3kuDU
 UUU
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/15 21:41, Chris Healy wrote:
> Jingfeng,
>
> Does your design have any bus PMU counters that can be used to measure
> DRAM bandwidth of the 3D GPU directly or even indirectly?

No,  It seems that we don't have such hardware.


What we can do is measure by the CPU,  say write a memcpy program.

Testing the system ram to vram and vram to system bandwidth.

system ram to system ram bandwidth.

Out 3a5000 system RAM bandwidth can be 10 GB/s (tested by memcpy testing 
program 1920x1080)

But the GPU is inside the north bridge,  Access memory from there is a 
bit slower.

because it need cross the HT bus.  But I don't mind.

> Regards,
>
> Chris
>
> On Thu, Jun 15, 2023 at 2:53 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>> Am Donnerstag, dem 15.06.2023 um 17:37 +0800 schrieb Sui Jingfeng:
>>> Hi,
>>>
>> [...]
>>>>>>>> +
>>>>>>>> +   /*
>>>>>>>> +    * Choose number of wait cycles to target a ~30us (1/32768) max latency
>>>>>>>> +    * until new work is picked up by the FE when it polls in the idle loop.
>>>>>>>> +    */
>>>>>>>> +   gpu->fe_waitcycles = min(gpu->base_rate_core >> (15 - gpu->freq_scale),
>>>>>>>> +                            0xffffUL);
>>>>>>> This patch is NOT effective on our hardware GC1000 v5037 (ls7a1000 +
>>>>>>> ls3a5000).
>>>>>>>
>>>>>>> As the gpu->base_rate_core is 0,  so, in the end gpu->fe_waitcycles is
>>>>>>> also zero.
>>>>>>>
>>>>>> Uh, that's a problem, as the patch will then have the opposite effect
>>>>>> on your platform by speeding up the idle loop. Thanks for catching
>>>>>> this! I'll improve the patch to keep a reasonable amount of wait cycles
>>>>>> in this case.
>>>>> It's OK, no big problem as far as I can see. (it my platform's problem,
>>>>> not your problem)
>>>>>
>>>> It will become a problem as it eats up the bandwidth that you want to
>>>> spend for real graphic work.
>>>>
>>>>> Merge it is also OK, if we found something wrong we could fix it with a
>>>>> another patch.
>>>>>
>>>> Hmm.. I think that the fix for this problem is more or less an extra
>>>> if so I would love to see a proper fix
>>>> before this patch gets merged.
>> Right, we don't merge known broken stuff. We are all humans and bugs
>> and oversights happen, but we don't knowingly regress things.
>>
>>> It just no effect(at least I can't find).
>>>
>>> I have tried, The score of glmark2 does not change, not become better,
>>> not become worse.
>> That's because it only affects your system when the GPU is idle but
>> isn't in runtime PM yet. If you measure the DRAM bandwidth in that time
>> window you'll see that the GPU now uses much more bandwidth, slowing
>> down other workloads.
>>
>> Regards,
>> Lucas
>>
-- 
Jingfeng

