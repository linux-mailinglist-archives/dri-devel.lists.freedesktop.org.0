Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A971887C
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4098A10E4FD;
	Wed, 31 May 2023 17:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B7AA10E4FD;
 Wed, 31 May 2023 17:29:19 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxqvLtg3dkewcDAA--.6716S3;
 Thu, 01 Jun 2023 01:29:17 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxMuXsg3dk3rWCAA--.14526S3; 
 Thu, 01 Jun 2023 01:29:17 +0800 (CST)
Message-ID: <5c2faf7e-002c-dad0-c4fe-63aab04f7e87@loongson.cn>
Date: Thu, 1 Jun 2023 01:29:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 6/6] drm/etnaviv: allow usperspace create cached
 coherent bo
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230530160643.2344551-1-suijingfeng@loongson.cn>
 <20230530160643.2344551-7-suijingfeng@loongson.cn>
 <35c15c0912b4a9372b9c2194a46b518ce515ce3d.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <35c15c0912b4a9372b9c2194a46b518ce515ce3d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxMuXsg3dk3rWCAA--.14526S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JF4kAr13Gr4fGw4kWw4DArb_yoWxArW3pF
 Z7AFyYkrW0vrWqkw1xZFn8Aa43Gw12gFWvk3srtas093y5tFs2gr1rKFZ8Crn8CryfGr1a
 qr1jyry5KF10yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU83UUUUUUUU==
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/1 00:33, Lucas Stach wrote:
> Hi Sui Jingfeng,
>
> Am Mittwoch, dem 31.05.2023 um 00:06 +0800 schrieb Sui Jingfeng:
>> cached system RAM is coherent on loongson CPUs, and the GPU and DC allways
>> snoop the CPU's cache. write-combine caching property is not suitiable for
>> us.
>>
> As previously mentioned in the Mesa MR, I don't think this is the right
> approach.
>
> ETNA_BO_CACHED already looks coherent to userspace, as all accesses are
> bracketed via the ETNAVIV_GEM_CPU_PREP and ETNAVIV_GEM_CPU_FINI ioctls,
> which will do the necessary cache maintenance on platforms where device
> coherence isn't enforced by the hardware, so there is no need for a
> separate ETNA_BO_CACHED_COHERENT.

As far as I can see,  ETNA_BO_CACHED_COHERENT could probably help to 
bypass the overhead of

dma_sync_sgtable_for_cpu() and dma_sync_sgtable_for_device() brings to us.


I have tested long time ago, there no need call this function on our 
platform.

The glmark2 works as before if I comment out thoes two function.

Are you serious, sir?

> Instead we just need a new ETNAVIV_PARAM to inform userspace about
> hardware cache coherence being available for a specific GPU core,

Ok, let me think about for a while how to implement this.

But How about we merge this first, I create another patch to improve it

with a roughly working base first? I'm just asking if the answer is No :-)

>   in
> which case the userspace driver should switch to preferring
> ETNA_BO_CACHED over ETNA_BO_WC.

Yeah,  ETNA_BO_CACHED is enough.

ETNA_BO_CACHED_COHERENT is actually a special case of ETNA_BO_CACHED.

> Regards,
> Lucas
>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c       |  2 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 22 +++++++++++++++++++--
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  9 ++++++++-
>>   include/uapi/drm/etnaviv_drm.h              | 11 ++++++-----
>>   4 files changed, 35 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 052f745cecc0..2816c654c023 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -274,7 +274,7 @@ static int etnaviv_ioctl_gem_new(struct drm_device *dev, void *data,
>>   	struct drm_etnaviv_gem_new *args = data;
>>   
>>   	if (args->flags & ~(ETNA_BO_CACHED | ETNA_BO_WC | ETNA_BO_UNCACHED |
>> -			    ETNA_BO_FORCE_MMU))
>> +			    ETNA_BO_CACHED_COHERENT | ETNA_BO_FORCE_MMU))
>>   		return -EINVAL;
>>   
>>   	return etnaviv_gem_new_handle(dev, file, args->size,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index b5f73502e3dd..d8b559bd33d3 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -343,6 +343,7 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
>>   static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>>   {
>>   	struct page **pages;
>> +	pgprot_t prot;
>>   
>>   	lockdep_assert_held(&obj->lock);
>>   
>> @@ -350,8 +351,20 @@ static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>>   	if (IS_ERR(pages))
>>   		return NULL;
>>   
>> -	return vmap(pages, obj->base.size >> PAGE_SHIFT,
>> -			VM_MAP, pgprot_writecombine(PAGE_KERNEL));
>> +	switch (obj->flags) {
>> +	case ETNA_BO_CACHED_COHERENT:
>> +	case ETNA_BO_CACHED:
>> +		prot = PAGE_KERNEL;
>> +		break;
>> +	case ETNA_BO_UNCACHED:
>> +		prot = pgprot_noncached(PAGE_KERNEL);
>> +		break;
>> +	case ETNA_BO_WC:
>> +	default:
>> +		prot = pgprot_writecombine(PAGE_KERNEL);
>> +	}
>> +
>> +	return vmap(pages, obj->base.size >> PAGE_SHIFT, VM_MAP, prot);
>>   }
>>   
>>   static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
>> @@ -545,6 +558,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>>   static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>>   	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>>   {
>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>   	struct etnaviv_gem_object *etnaviv_obj;
>>   	unsigned sz = sizeof(*etnaviv_obj);
>>   	bool valid = true;
>> @@ -555,6 +569,10 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>>   	case ETNA_BO_CACHED:
>>   	case ETNA_BO_WC:
>>   		break;
>> +	case ETNA_BO_CACHED_COHERENT:
>> +		if (priv->has_cached_coherent)
>> +			break;
>> +		fallthrough;
>>   	default:
>>   		valid = false;
>>   	}
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> index 3524b5811682..671d91d8f1c6 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> @@ -112,11 +112,18 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
>>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
>>   	struct dma_buf_attachment *attach, struct sg_table *sgt)
>>   {
>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>   	struct etnaviv_gem_object *etnaviv_obj;
>>   	size_t size = PAGE_ALIGN(attach->dmabuf->size);
>> +	u32 cache_flags;
>>   	int ret, npages;
>>   
>> -	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
>> +	if (priv->has_cached_coherent)
>> +		cache_flags = ETNA_BO_CACHED_COHERENT;
>> +	else
>> +		cache_flags = ETNA_BO_WC;
>> +
>> +	ret = etnaviv_gem_new_private(dev, size, cache_flags,
>>   				      &etnaviv_gem_prime_ops, &etnaviv_obj);
>>   	if (ret < 0)
>>   		return ERR_PTR(ret);
>> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
>> index af024d90453d..474b0db286de 100644
>> --- a/include/uapi/drm/etnaviv_drm.h
>> +++ b/include/uapi/drm/etnaviv_drm.h
>> @@ -90,13 +90,14 @@ struct drm_etnaviv_param {
>>    * GEM buffers:
>>    */
>>   
>> -#define ETNA_BO_CACHE_MASK   0x000f0000
>> +#define ETNA_BO_CACHE_MASK              0x000f0000
>>   /* cache modes */
>> -#define ETNA_BO_CACHED       0x00010000
>> -#define ETNA_BO_WC           0x00020000
>> -#define ETNA_BO_UNCACHED     0x00040000
>> +#define ETNA_BO_CACHED                  0x00010000
>> +#define ETNA_BO_WC                      0x00020000
>> +#define ETNA_BO_UNCACHED                0x00040000
>> +#define ETNA_BO_CACHED_COHERENT         0x00080000
>>   /* map flags */
>> -#define ETNA_BO_FORCE_MMU    0x00100000
>> +#define ETNA_BO_FORCE_MMU               0x00100000
>>   
>>   struct drm_etnaviv_gem_new {
>>   	__u64 size;           /* in */

-- 
Jingfeng

