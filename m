Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D973B360
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3811F10E10D;
	Fri, 23 Jun 2023 09:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BB4810E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:20:46 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxZ8XrY5VkXL0AAA--.1240S3;
 Fri, 23 Jun 2023 17:20:43 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxvM7qY5VkMkcDAA--.17569S3; 
 Fri, 23 Jun 2023 17:20:42 +0800 (CST)
Message-ID: <28e9de2e-d966-92f4-0b3e-622b6f163c5c@loongson.cn>
Date: Fri, 23 Jun 2023 17:20:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/14] drm/ast: Set PCI config before accessing I/O
 registers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230621130032.3568-1-tzimmermann@suse.de>
 <20230621130032.3568-7-tzimmermann@suse.de>
 <ac2955ec-0a09-1c44-23a7-e29b952f463d@loongson.cn>
 <a675a203-9ec1-3e66-9ae2-5abf6d2690af@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <a675a203-9ec1-3e66-9ae2-5abf6d2690af@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxvM7qY5VkMkcDAA--.17569S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr13Kr17KrW5Wr1DGFyrZrc_yoW5GFy3pF
 4ktFyrArWDGr1rGr12v3WkXFy5trsrtas0grn8Ja43WwsrZryvqFWkWr4j934UArZ7uFyY
 vws0gr9rZrykA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8U
 UUUU=
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

On 2023/6/23 17:02, Thomas Zimmermann wrote:
> Hi
>
> Am 22.06.23 um 17:42 schrieb Sui Jingfeng:
> [...]
>>> +    ret = ast_init_pci_config(pdev);
>>> +    if (ret)
>>> +        return ERR_PTR(ret);
>>> +
>>
>>
>> Is the calling to ast_init_pci_config() absolute necessary ?
>>
>> I'm asking this question because
>>
>> I think this function is needed to be run only when the chip need POST.
>>
>> On normal case, when you call pcim_enable_device() function,
>>
>> the pci_enable_device() function will do such thing for you.
>
> You're right. We could probably remove this code from the driver. I 
> don't want to do this in a patchset that is about refactoring. Maybe 
> in a later patch.
OK, this sound fine then.
>
>>
>>
>> ```
>>
>> int pci_enable_device(struct pci_dev *dev)
>> {
>>      return pci_enable_device_flags(dev, IORESOURCE_MEM | 
>> IORESOURCE_IO);
>> }
>>
>> ```
>>
>>>       if (!ast_is_vga_enabled(dev)) {
>>>           drm_info(dev, "VGA not enabled on entry, requesting chip 
>>> POST\n");
>>>           need_post = true;
>>> diff --git a/drivers/gpu/drm/ast/ast_post.c 
>>> b/drivers/gpu/drm/ast/ast_post.c
>>> index aa3f2cb00f82c..2da5bdb4bac45 100644
>>> --- a/drivers/gpu/drm/ast/ast_post.c
>>> +++ b/drivers/gpu/drm/ast/ast_post.c
>>> @@ -361,12 +361,6 @@ static void ast_init_dram_reg(struct drm_device 
>>> *dev)
>>>   void ast_post_gpu(struct drm_device *dev)
>>>   {
>>>       struct ast_device *ast = to_ast_device(dev);
>>> -    struct pci_dev *pdev = to_pci_dev(dev->dev);
>>> -    u32 reg;
>>> -
>>> -    pci_read_config_dword(pdev, 0x04, &reg);
>>> -    reg |= 0x3;
>>> -    pci_write_config_dword(pdev, 0x04, reg);
>>
>> You have changed the semantics after this patch is applied .
>>
>> Yes, it still works.
>>
>> But would you like to explain something about this?
>
> I'm looking at the function, but I don't see the change in semantics. 
> I only moved the PCI calls and added error detection. What do you mean?
>
Sorry, I'm using the wrong word. :-)

I means that this function is only needed to be call in ast_post_gpu() 
function.

In fact, on my platform the ast_post_gpu() don't get called even.

I suspect ast_post_gpu() will get called only when the firmware does not 
initial the card.

OK,  You can take another look at this function in the future.

I'm also feel OK about this series.

> Best regards
> Thomas
>
>>
>> We want to learn more knowledge from your patch.
>>
>>>       ast_enable_vga(dev);
>>>       ast_open_key(ast);
>>
>
-- 
Jingfeng

