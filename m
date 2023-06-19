Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE6734D6A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174E610E12F;
	Mon, 19 Jun 2023 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CDC410E12F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:19:25 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx7eqMD5BkCcoGAA--.14043S3;
 Mon, 19 Jun 2023 16:19:24 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxZuSLD5BkrAcgAA--.24518S3; 
 Mon, 19 Jun 2023 16:19:23 +0800 (CST)
Message-ID: <411abb62-6c80-b42f-54ce-895b863499f9@loongson.cn>
Date: Mon, 19 Jun 2023 16:19:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-7-tzimmermann@suse.de>
 <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>
 <8be5e2e9-92a7-1bbe-e768-78d38eda5854@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <8be5e2e9-92a7-1bbe-e768-78d38eda5854@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxZuSLD5BkrAcgAA--.24518S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFykZw17Jw4UZFW5AF43urX_yoWrWw4UpF
 4kJFWFyrW5GF1ftr17Z3WDZFyaya4Iqa4jgrn7Xa4SqrsFyr1qgFyDXr4q934DJrZ7AFy0
 yrn5Kry3uFy7AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4SoGDU
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/19 15:59, Thomas Zimmermann wrote:
> Hi
>
> Am 17.06.23 um 10:01 schrieb Sui Jingfeng:
>>
>> On 2023/6/16 21:52, Thomas Zimmermann wrote:
>>> Access to I/O registers is required to detect and set up the
>>> device. Enable the rsp PCI config bits before. While at it,
>>> convert the magic number to macro constants.
>>>
>>> Enabling the PCI config bits was done after trying to detect
>>> the device. It was probably too late at this point.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/ast/ast_drv.h  |  2 ++
>>>   drivers/gpu/drm/ast/ast_main.c | 22 ++++++++++++++++++++++
>>>   drivers/gpu/drm/ast/ast_post.c |  6 ------
>>>   3 files changed, 24 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>>> b/drivers/gpu/drm/ast/ast_drv.h
>>> index 0141705beaee9..555a0850957f3 100644
>>> --- a/drivers/gpu/drm/ast/ast_drv.h
>>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>>> @@ -52,6 +52,8 @@
>>>   #define PCI_CHIP_AST2000 0x2000
>>>   #define PCI_CHIP_AST2100 0x2010
>>> +#define AST_PCI_OPTION_MEM_ACCESS_ENABLE    BIT(1)
>>> +#define AST_PCI_OPTION_IO_ACCESS_ENABLE        BIT(0)
>>>   enum ast_chip {
>>>       AST2000,
>>> diff --git a/drivers/gpu/drm/ast/ast_main.c 
>>> b/drivers/gpu/drm/ast/ast_main.c
>>> index c6987e0446618..fe054739b494a 100644
>>> --- a/drivers/gpu/drm/ast/ast_main.c
>>> +++ b/drivers/gpu/drm/ast/ast_main.c
>>> @@ -35,6 +35,24 @@
>>>   #include "ast_drv.h"
>>> +static int ast_init_pci_config(struct pci_dev *pdev)
>>> +{
>>> +    int err;
>>> +    u32 pcis04;
>>> +
>>> +    err = pci_read_config_dword(pdev, 0x04, &pcis04);
>>
>> The third argument of pci_read_config_dword() function should be 'u16 
>> *' type;
>
> No, a dword is a 32-bit integer.
>
Yes, you are right.

'u32' is for the pci_read_config_dword() function.

I'm recommend you to use the pci_read_config_word() function.

Sorry for the noise.

>>
>>
>>> +    if (err)
>>> +        goto out;
>>> +
>>> +    pcis04 |= AST_PCI_OPTION_MEM_ACCESS_ENABLE |
>>> +          AST_PCI_OPTION_IO_ACCESS_ENABLE;
>>> +
>>> +    err = pci_write_config_dword(pdev, 0x04, pcis04);
>>> +
>>> +out:
>>> +    return pcibios_err_to_errno(err);
>>> +}
>>
>>
>> static void ast_enable_mem_io(struct pci_dev *pdev)
>> {
>>      u16 cmd;
>>
>>      pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>>
>>      cmd |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
>>
>>      pci_write_config_word(pdev, PCI_COMMAND, &cmd);
>> }
>>
>>>   static void ast_detect_config_mode(struct drm_device *dev, u32 
>>> *scu_rev)
>>>   {
>>>       struct device_node *np = dev->dev->of_node;
>>> @@ -399,6 +417,10 @@ struct ast_device *ast_device_create(const 
>>> struct drm_driver *drv,
>>>               return ERR_PTR(-EIO);
>>>       }
>>> +    ret = ast_init_pci_config(pdev);
>>> +    if (ret)
>>> +        return ERR_PTR(ret);
>>> +
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
>>>       ast_enable_vga(dev);
>>>       ast_open_key(ast);
>>
>
-- 
Jingfeng

