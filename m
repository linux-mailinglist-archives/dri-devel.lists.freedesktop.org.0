Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2E73891E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08FA10E4B2;
	Wed, 21 Jun 2023 15:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C8DD10E4AF;
 Wed, 21 Jun 2023 15:30:05 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxlfB8F5NkbiwAAA--.339S3;
 Wed, 21 Jun 2023 23:30:04 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c58F5Nkd9sAAA--.5186S3; 
 Wed, 21 Jun 2023 23:30:04 +0800 (CST)
Message-ID: <66fc74ae-299c-a5de-9cfb-07ae24fb3f07@loongson.cn>
Date: Wed, 21 Jun 2023 23:30:04 +0800
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
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx_c58F5Nkd9sAAA--.5186S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAFyxCF4Uur4UKryrAF47Awc_yoW5Ww45pF
 WfAFyYyrWUXrWUK397Zan8Za4Fgr47W34Iyas8J3Z09w4YyF4qkF1rKFy5CFs8GryfCr1a
 qa1j9ry5XF48ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
 14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
 xVAFwI0_Wrv_ZF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
 JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JbIYCTnIWIevJa73UjIFyTuYvjxU7fHUDUUUU
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

On 2023/6/21 18:00, Lucas Stach wrote:
>>   		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
>>   					 etnaviv_op_to_dma_dir(op));
>>   		etnaviv_obj->last_cpu_prep_op = op;
>> @@ -408,8 +421,9 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
>>   {
>>   	struct drm_device *dev = obj->dev;
>>   	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>   
>> -	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
>> +	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
>>   		/* fini without a prep is almost certainly a userspace error */
>>   		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
>>   		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> index 3524b5811682..754126992264 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> @@ -112,11 +112,16 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
>>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
>>   	struct dma_buf_attachment *attach, struct sg_table *sgt)
>>   {
>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>   	struct etnaviv_gem_object *etnaviv_obj;
>>   	size_t size = PAGE_ALIGN(attach->dmabuf->size);
>> +	u32 cache_flags = ETNA_BO_WC;
>>   	int ret, npages;
>>   
>> -	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
>> +	if (priv->dma_coherent)
>> +		cache_flags = ETNA_BO_CACHED;
>> +
> Drop this change. Instead etnaviv_gem_new_impl() should do the upgrade
> from WC to CACHED as necessary by adding something like this:

I understand you are a profession person in vivante GPU driver domain.

I respect you reviews and instruction.

But, I'm really reluctant to agree with this, is there any space to 
negotiate?

> /*
>   * Upgrade WC to CACHED when the device is hardware coherent and the
>   * platform doesn't allow mixing cached and writecombined mappings to
>   * the same memory area.
>   */
> if ((flags & ETNA_BO_CACHE_MASK) == ETNA_BO_WC &&
>      dev_is_dma_coherent(dev) && !drm_arch_can_wc_memory())
>          flags = (flags & ~ETNA_BO_CACHE_MASK) & ETNA_BO_CACHED;

This is policy, not a mechanism.

Using what cache property is a user-space program's choice.

While you are override the WC with CACHED mapping. This is not correct 
in the concept!

you approach forbidden any possibility to use the WC BO at anywhere.


My approach need only check once, while you approach need at least 3 
check plus

so much bit-wise logic operations,  plus a function call  (&, ==, &&,  
&, ~, &) .

and every time you create a BO. This nasty judgement happens.


Please keep our original implement, it's simple and clear, Please?


-- 
Jingfeng

