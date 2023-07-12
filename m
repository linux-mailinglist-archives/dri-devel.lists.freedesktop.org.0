Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ADA750BC2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0DA10E561;
	Wed, 12 Jul 2023 15:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49C0E10E561
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:05:47 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxLOtEwa5kIQwEAA--.6200S3;
 Wed, 12 Jul 2023 23:05:40 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx4eQywa5kraYqAA--.54700S3; 
 Wed, 12 Jul 2023 23:05:40 +0800 (CST)
Message-ID: <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
Date: Wed, 12 Jul 2023 23:05:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
 <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx4eQywa5kraYqAA--.54700S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7trWDWr4UKrWDWF43ury7XFc_yoW8ZFW5pr
 WYkayrKFWDCryIy3y2vw4YgryjyrZ7JFWYgFnxAw1UG3sxKryFyF4Skrs093WxCr4ftF1Y
 va1UXws7CFyDWagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
 VUUUUUU==
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


I'm here join to the discussion. Because I know a little about aspeed BMC.


On 2023/7/10 16:07, Jocelyn Falempe wrote:
> On 07/07/2023 09:30, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 06.07.23 um 18:37 schrieb Jocelyn Falempe:
>> [...]
>>>>>
>>>>> You could out-comment the VGA code in the ast driver for testing.
>>>>
>>>> Oh, Thanks for the idea, I will try that.
>>>>
>>>
>>> The result is that I get a black screen on the remote BMC. So maybe 
>>> adding a remote/bmc connector will solve that.
>>
>> Could work. That would be a connector and encoder of type 'virtual'?
>>
>> Not all ast devices have a BMC. Do you know how to detect its presence?
>
> Hum, I though all ast devices have a BMC, 

No, Thomas is right, not all ast devices have a BMC.

I have two discrete AST BMC cards, see [1] for reference.

I generally using the ast2400 BMC cards to testing patches and study 
drm/ast driver.

It seems that this two cards are pure 2D display card, because they 
don't have a net interface(can not plug-in the net cable).


[1] 
https://github.com/loongson-gfx/loongson_boards/blob/main/ast_bmc_cards/ast1400_and_ast2400.jpg


> and I don't see a way to detect that BMC is active or present.

I think we better find one, then if the BMC is active (present).

we could create a virtual encoder and connector safely.


> (It would be even better to know the browser's size, and automatically 
> resize, like when using a VM. But I'm not sure the hardware/firmware 
> is able to do this).
>

I think it is not difficult, it just that need the firmware of your 
board to set a value to a register,

(a scratch register) or something like that.

But this really need you have the firmware (source code) to support this.

Or you are luckily, if there somebody already done this for you.

> On the other hand, are there any drawback to present a BMC connector 
> even when the hardware doesn't have it ?

If not properly setting up, I think you will create two encoder and two 
connector in the system.

>>
>> Best regards
>> Thomas
>>
>>>
>>>
>>
>
> Best regards,
>

