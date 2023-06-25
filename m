Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22073CE4D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 05:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0873710E0F1;
	Sun, 25 Jun 2023 03:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FA3A10E0F1;
 Sun, 25 Jun 2023 03:51:23 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxhMS5uZdkPWsBAA--.2279S3;
 Sun, 25 Jun 2023 11:51:21 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxzM65uZdkATMGAA--.30261S3; 
 Sun, 25 Jun 2023 11:51:21 +0800 (CST)
Message-ID: <064a39bd-cfca-2799-f72f-0e253215b927@loongson.cn>
Date: Sun, 25 Jun 2023 11:51:21 +0800
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
 <66fc74ae-299c-a5de-9cfb-07ae24fb3f07@loongson.cn>
 <8212078bd56c54ce508205eae0ed0b69e78d4c38.camel@pengutronix.de>
 <fd5dd250-b01e-fd00-1419-88398cb13347@loongson.cn>
 <62bf84f19318c54c50f154e1eb64a179fb2389ce.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <62bf84f19318c54c50f154e1eb64a179fb2389ce.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxzM65uZdkATMGAA--.30261S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuw45AFykJr4DCF48CFyxtFc_yoW7uw18pF
 WayFWYyr4UXry8tw1Ivw1UZ34Svr4xXFy5Zrn8Jwn0v390yF1xKF48KF1UCFn8Gr1xGr4a
 qr4jyrW3GF1UZ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
 6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=
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

On 2023/6/22 01:45, Lucas Stach wrote:
> Am Donnerstag, dem 22.06.2023 um 01:21 +0800 schrieb Sui Jingfeng:
>> Hi,
>>
>> On 2023/6/21 23:58, Lucas Stach wrote:
>>> Am Mittwoch, dem 21.06.2023 um 23:30 +0800 schrieb Sui Jingfeng:
>>>> Hi,
>>>>
>>>> On 2023/6/21 18:00, Lucas Stach wrote:
>>>>>>     		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
>>>>>>     					 etnaviv_op_to_dma_dir(op));
>>>>>>     		etnaviv_obj->last_cpu_prep_op = op;
>>>>>> @@ -408,8 +421,9 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
>>>>>>     {
>>>>>>     	struct drm_device *dev = obj->dev;
>>>>>>     	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>>>>>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>>>>>     
>>>>>> -	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
>>>>>> +	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
>>>>>>     		/* fini without a prep is almost certainly a userspace error */
>>>>>>     		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
>>>>>>     		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>>>>>> index 3524b5811682..754126992264 100644
>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>>>>>> @@ -112,11 +112,16 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
>>>>>>     struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
>>>>>>     	struct dma_buf_attachment *attach, struct sg_table *sgt)
>>>>>>     {
>>>>>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>>>>>     	struct etnaviv_gem_object *etnaviv_obj;
>>>>>>     	size_t size = PAGE_ALIGN(attach->dmabuf->size);
>>>>>> +	u32 cache_flags = ETNA_BO_WC;
>>>>>>     	int ret, npages;
>>>>>>     
>>>>>> -	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
>>>>>> +	if (priv->dma_coherent)
>>>>>> +		cache_flags = ETNA_BO_CACHED;
>>>>>> +
>>>>> Drop this change. Instead etnaviv_gem_new_impl() should do the upgrade
>>>>> from WC to CACHED as necessary by adding something like this:
>>>> I understand you are a profession person in vivante GPU driver domain.
>>>>
>>>> I respect you reviews and instruction.
>>>>
>>>> But, I'm really reluctant to agree with this, is there any space to
>>>> negotiate?
>>>>
>>>>> /*
>>>>>     * Upgrade WC to CACHED when the device is hardware coherent and the
>>>>>     * platform doesn't allow mixing cached and writecombined mappings to
>>>>>     * the same memory area.
>>>>>     */
>>>>> if ((flags & ETNA_BO_CACHE_MASK) == ETNA_BO_WC &&
>>>>>        dev_is_dma_coherent(dev) && !drm_arch_can_wc_memory())
>>>>>            flags = (flags & ~ETNA_BO_CACHE_MASK) & ETNA_BO_CACHED;
>>>> This is policy, not a mechanism.
>>>>
>>>> Using what cache property is a user-space program's choice.
>>>>
>>>> While you are override the WC with CACHED mapping. This is not correct
>>>> in the concept!
>>>>
>>> Please explain why you think that this isn't correct.
>> Again,
>>
>> this is user-space things!
>>
>> this is user-space things!
>>
>> this is user-space things!
>>
>> I have explained several times.
>>
>> made the decision for the user-space program is wrong.
>>
> This mode of communication isn't helpful. Please stop it.
>
> As I tried to explain to you multiple times: if userspace can break
> coherency by selecting the wrong mapping type then this is something
> the kernel should prevent.

You are right in overall.


This is the only one benefit which WC mapping is preferred over the 
cached mapping.

As you already told me,  the WC mapping don't *pollute CPU's cache*.


If we can make sure that a BO is *only* going to be used by the GPU,

then we still can choose WC mapping as the cache property of this BO.

As the cache property is CPU side thing.


>>> It allows
>>> userspace to use WC mappings that would potentially cause loss of
>>> coherency between CPU and GPU, which isn't acceptable.
>> Before made the WC works correctly,  you need the developing environment.
>>
>> userspace program can tune the BO cache mapping easily.
>>
>> Either environment or supply a conf file.
>>
>>
>> While with your implement, we don't have the opportunity to do debugging
>> and the development.
> You can always add a patch to your local kernel to re-allow WC mappings
> while you work on making them behave as expected on your platform.


We are doing the things about the *upstream*.


>   With
> the mainline kernel there is no way that the kernel driver will allow
> broken coherency.


A buffer is used by the GPU solely won't break the coherency.


> And as I also mentioned before, there is a clear upgrade path here:
> once WC mappings work as expected on your platform we can easily drop
> the upgrading from the kernel driver again. The userspace driver can
> already be changed to use CACHED BOs where beneficial on your platform
> in the meantime.

For our platform, I think the problem is that the GPU always write to L3 
share cache,

even you use the WC mapping.

As I already said, the WC mapping only influence the CPU side.

How can I control the GPU when a BO is WC mapping ?

Does the GPU know that whether a BO  is WC mapping or not ?

How can I let(or tell) the GPU that

please not write to shared L3 cache,  write to the system RAM directly?

On out platform, the coherency between the CPU and peripheral IO 
device's cache

is maintained by hardware. While at here.  the hardware is the shared L3 
cache.


I guess the current problem is that the GPU don't listen to me,

he still write to CPU cache's even you choose the WC mapping.

Then if you want to read the rendered image by CPU,

the CPU go the un-cached path. Then I think the CPU will get wrong data.

> Regards,
> Lucas

-- 
Jingfeng

