Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416173A8FA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 21:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAEF10E00D;
	Thu, 22 Jun 2023 19:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1999710E00D;
 Thu, 22 Jun 2023 19:26:26 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxxcRfoJRkzocAAA--.929S3;
 Fri, 23 Jun 2023 03:26:23 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c5eoJRksncCAA--.13556S3; 
 Fri, 23 Jun 2023 03:26:22 +0800 (CST)
Message-ID: <9f3c3a81-1aca-a36e-8090-d851ea5ce9f7@loongson.cn>
Date: Fri, 23 Jun 2023 03:26:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
To: Lucas Stach <l.stach@pengutronix.de>, Sui Jingfeng <18949883232@163.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <66fc74ae-299c-a5de-9cfb-07ae24fb3f07@loongson.cn>
 <8212078bd56c54ce508205eae0ed0b69e78d4c38.camel@pengutronix.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <8212078bd56c54ce508205eae0ed0b69e78d4c38.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Cx_c5eoJRksncCAA--.13556S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gry5tFWrCF48AF45ZrWfXrc_yoWxXw15pF
 WavFWYkr4DXrW8Kw1Ivw45Za4S9w4xXFy8Cw1DJwn0vws0kF1j9r4rKF15CFs8GryxWr4a
 vr4jvFyUWF4kZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
 6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
 vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7XTmDUUU
 U
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

Hi

On 2023/6/21 23:58, Lucas Stach wrote:
> Am Mittwoch, dem 21.06.2023 um 23:30 +0800 schrieb Sui Jingfeng:
>> Hi,
>>
>> On 2023/6/21 18:00, Lucas Stach wrote:
>>>>    		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
>>>>    					 etnaviv_op_to_dma_dir(op));
>>>>    		etnaviv_obj->last_cpu_prep_op = op;
>>>> @@ -408,8 +421,9 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
>>>>    {
>>>>    	struct drm_device *dev = obj->dev;
>>>>    	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>>>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>>>    
>>>> -	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
>>>> +	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
>>>>    		/* fini without a prep is almost certainly a userspace error */
>>>>    		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
>>>>    		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>>>> index 3524b5811682..754126992264 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>>>> @@ -112,11 +112,16 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
>>>>    struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
>>>>    	struct dma_buf_attachment *attach, struct sg_table *sgt)
>>>>    {
>>>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>>>    	struct etnaviv_gem_object *etnaviv_obj;
>>>>    	size_t size = PAGE_ALIGN(attach->dmabuf->size);
>>>> +	u32 cache_flags = ETNA_BO_WC;
>>>>    	int ret, npages;
>>>>    
>>>> -	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
>>>> +	if (priv->dma_coherent)
>>>> +		cache_flags = ETNA_BO_CACHED;
>>>> +
>>> Drop this change. Instead etnaviv_gem_new_impl() should do the upgrade
>>> from WC to CACHED as necessary by adding something like this:
>> I understand you are a profession person in vivante GPU driver domain.
>>
>> I respect you reviews and instruction.
>>
>> But, I'm really reluctant to agree with this, is there any space to
>> negotiate?
>>
>>> /*
>>>    * Upgrade WC to CACHED when the device is hardware coherent and the
>>>    * platform doesn't allow mixing cached and writecombined mappings to
>>>    * the same memory area.
>>>    */
>>> if ((flags & ETNA_BO_CACHE_MASK) == ETNA_BO_WC &&
>>>       dev_is_dma_coherent(dev) && !drm_arch_can_wc_memory())
>>>           flags = (flags & ~ETNA_BO_CACHE_MASK) & ETNA_BO_CACHED;
>> This is policy, not a mechanism.
>>
>> Using what cache property is a user-space program's choice.
>>
>> While you are override the WC with CACHED mapping. This is not correct
>> in the concept!
>>
> Please explain why you think that this isn't correct.

This is NOT always correct because:

when etnaviv_gem_prime_import_sg_table() is called,

drm/etnaviv is importing buffer from other drivers (for example drm/loongson or drm/ingenic).

drm/etnaviv is the importer, and drm/loongson or drm/ingenic is the exporter.


While drm/etnaviv using the WC mapping by default, which may cause *cache aliasing*,


Because the imported buffer originally belong to the KMS driver side.

The KMS driver may choose cached mapping by default.


For drm/ingenic(jz4770), the BO will be cached, but their hardware can't guarantee coherency.

they have to flush the cache manually when do the frame buffer update(damage update or dirty update).

Because cached mapping is more fast than the WC mapping.




For drm/loongson, shared buffer have to pinned into GTT,

By default, we using the cached mapping for the buffers in the system RAM;

But we are lucky, our the hardware bless us,

the hardware maintain the cache coherency for us.


While drm/etnaviv choose the WC mapping for the imported buffer blindly,

when doing the import,

*drm/etnaviv know nothing about the original buffer's caching property.*

This is the problem.


Currently, I guess drm/etnaviv only works for drm/imx,

because drm/imx choose WC mapping as the cache property by default for 
the dumb buffer.

The cache property mapping match, so it works.

But their no communications between the KMS driver and RO driver.


I think, drm/etanviv will also wrong on the ARM64 platforms where cache 
coherency is maintained by the hardware.

If the KMS driver using cached mapping, while drm/etnaviv using WC mapping,

There still will have problems.

I will go to find the hardware, and do the testing for you.


> If using WC
> mappings cause a potential loss of coherency on your platform, then we
> can not allow the userspace driver to use WC mappings.

I have explained with my broken English,

The point is that loss of coherency may because KMS-RO framework have 
defect,

maybe software side bug, please don't make the conclusion too fast.


Xorg DDX driver (EXA base DDX for an example) fallback to the CPU do the 
software rendering.

It is even faster than the hardware accelerated implement,

especially in the case where the CPU is fast and the GPU is weak.

LS7A1000(GC1000) + LS3A5000@2.5Ghz X4 core is such a case.

For Discrete on-board VRAM we will using the WC mapping, it will not be 
shared with other driver,

The CPU use it themself, this is definitionally OK.

In practice, it works like a charm.

For buffers in the system RAM and GTT,

We will using cached mapping for faster CPU software rendering.

hard-coded by the driver.


We are benefited so much from the cached mapping.

While when using write-combine caching mapping for a buffer on LoongArch 
and Loongson Mips CPU,

It is OK for CPU write.

But when you want read from such buffer by the CPU, it is just boil down 
to uncached.

For our platform, uncached read serve as a kind of SYNC.

It will flush the data in the CPU's write buffer.

This cause performance drop.


But we still can use the write-combine caching mapping in the 
circumstances where do not need the CPU read.

So allow write-combine is providing one more choice to the user-space,

It is just that use it at your own risk.


> As I would like to keep the option of WC mappings,

Yeah, I know what's reason.

Because on the platform you love (imx6q, imx8q, for an example),

The hardware don't maintain the cache coherency.

So if fallback to software rendering, you will need to flush the cache frequency.

the performance will drop very much, right?


-- 
Jingfeng

