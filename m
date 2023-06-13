Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCD72E84C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 18:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60EE10E3C8;
	Tue, 13 Jun 2023 16:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25B9610E3C8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 16:21:01 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxRulrl4hkpbUEAA--.8090S3;
 Wed, 14 Jun 2023 00:20:59 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxTMpql4hkF3QZAA--.63775S3; 
 Wed, 14 Jun 2023 00:20:58 +0800 (CST)
Message-ID: <14e56806-833b-c01b-ee74-8f16f48df2fc@loongson.cn>
Date: Wed, 14 Jun 2023 00:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
To: WANG Xuerui <kernel@xen0n.name>, Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTMpql4hkF3QZAA--.63775S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFyUtrW3WrWfJr48GF4fCrX_yoW8tw1xpF
 WfKFWIkrykJrn5Ar1DZr15Za48ZrZYya45Wa9Yv3Wjqrn8CryjgryIq3s0gryxCrs3XF1a
 vF4UGw17ua1DXagCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
 I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==
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
Cc: loongson-kernel@lists.loongnix.cn,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Liu Peibao <liupeibao@loongson.cn>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/21 20:21, WANG Xuerui wrote:
>> +
>> +static int __init loongson_module_init(void)
>> +{
>> +    struct pci_dev *pdev = NULL;
>> +
>> +    if (video_firmware_drivers_only())
>> +        return -ENODEV;
>> +
>> +    /* Multiple video card workaround */
>> +    while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
>> +        if (pdev->vendor != PCI_VENDOR_ID_LOONGSON) {
>> +            pr_info("Discrete graphic card detected, abort\n");
>
> Why is it that the iGPU cannot be used together with a dGPU? I can't 
> see why this is technically the case so some more explanations could 
> be beneficial to other readers and LoongArch devs.


We will remote this workaround at next version. we find some way to keep 
multiple GPU driver co-exixt in the system. The reason we choose to 
workaround is because it  is both easy and effective to solve bugs.


After the dGPU is mounted on the motherboard,

1) the integrate register don't receive write or read access anymore.  
sometime cause its can't receive vblank interrupt, causing vblank 
timeout etc.

Have something to do with the PCI driver layer and/or PCI/vgaarb layer.


2) For ls7a1000, both the display controller and gpu is special,

     when dGPU is mounted, we are multiple gpu system.

     we should made the vgaarb works correct , this is relay on firmware 
and efi  support to be complete.

    In the past, our system don't support firmware framebuffer even.

3) It need us we implement PRIME, for cross driver buffer sharing.

      loongson display don't has scatter-gather able DMA. Can't access 
non physical contiguous GTT buffer.

     We can only expect

    1) the CPU do the copy.

    2) DC driver export dumb buffer, and GPU driver import this buffer, 
and resolve the tiled buffer to the linear.

    3) shared buffer has to pinned at GTT


4) Using space X server also has bug for parser the PCI device on 
complex patch.


5) Even on X86, there are motherboard vendor choose to black the iGPU 
when the dGPU is mounted.

It perhaps better black the iGPU at firmware layer.

But our firmware engineer don't know about this for a very long time.


But as its already as is, we will try to improve this at the next version.

-- 
Jingfeng

