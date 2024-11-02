Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBAF9BA129
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 16:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53F89A5C;
	Sat,  2 Nov 2024 15:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="lUKJqR7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A677689A5C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 15:24:42 +0000 (UTC)
Message-ID: <06a4c8d0-a443-458b-82a5-ff90efc47ec0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730561080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ScCswAKEEiXX1cjo9YHcQ9iy5zm0qIs66Se0a1qxy7A=;
 b=lUKJqR7sE9+ylNBln5t3yPqho3rAmrFNxWWqVqL4OZ4yy0YOv00SvgNOSeP34dC1oenVxD
 kVROxI4ABC1HHntX7rMrof5dTIEsiKX274OVIE8fR3P3V/9GbZ2qmE9nJ1nsNwnagsnogz
 AWAnpV9PCIyag35vXq/T8DsaYEQNMb8=
Date: Sat, 2 Nov 2024 23:24:31 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3] drm/etnaviv: Request pages from DMA32 zone on
 addressing_limited
To: xiaolei wang <xiaolei.wang@windriver.com>,
 Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
 <7a6ffbb773784dee0ea3ee87e563ac4e4f7c9c90.camel@pengutronix.de>
 <49288307-a98d-460d-88d5-e92f23a31a46@windriver.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <49288307-a98d-460d-88d5-e92f23a31a46@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I forget to mention that  the commit title should be "on addressing limited devices",
the underscore between the last two words is not necessary. It's a typo when reply
email.


On 2024/10/1 20:32, xiaolei wang wrote:
>
>
> On 10/1/24 20:17, Lucas Stach wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> Hi Xiaolei,
>>
>> Am Dienstag, dem 03.09.2024 um 10:08 +0800 schrieb Xiaolei Wang:
>>> Remove __GFP_HIGHMEM when requesting a page from DMA32 zone,
>>> and since all vivante GPUs in the system will share the same
>>> DMA constraints, move the check of whether to get a page from
>>> DMA32 to etnaviv_bind().
>>>
>>> Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
>>> Suggested-by: Sui Jingfeng<sui.jingfeng@linux.dev>
>>> Signed-off-by: Xiaolei Wang<xiaolei.wang@windriver.com>
>>> ---
>>>
>>> change log
>>>
>>> v1:
>>>    https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/
>>>
>>> v2:
>>>    Modify the issue of not retaining GFP_USER in v1 and update the commit log.
>>>
>>> v3:
>>>    Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
>>> instead of
>>>    "priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
>> I don't understand this part of the changes in the new version. Why
>> should we drop the HIGHMEM bit always and not only in the case where
>> dma addressing is limited? This seems overly restrictive.
>
> Makes sense, thanks for your reminder, I will drop the HIGHMEM bit 
> when the next version has address limit
>
>     if (dma_addressing_limited(gpu->dev)) {
>         priv->shm_gfp_mask |= GFP_DMA32;
>         priv->shm_gfp_mask &= ~__GFP_HIGHMEM;
>     }
>
> thanks
>
> xiaolei
>
>> Regards,
>> Lucas
>>
>>> and move the check of whether to get a page from DMA32 to etnaviv_bind().
>>>
>>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++++++-
>>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
>>>   2 files changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> index 6500f3999c5f..8cb2c3ec8e5d 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> @@ -536,7 +536,15 @@ static int etnaviv_bind(struct device *dev)
>>>        mutex_init(&priv->gem_lock);
>>>        INIT_LIST_HEAD(&priv->gem_list);
>>>        priv->num_gpus = 0;
>>> -     priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
>>> +     priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
>>> +
>>> +     /*
>>> +      * If the GPU is part of a system with DMA addressing limitations,
>>> +      * request pages for our SHM backend buffers from the DMA32 zone to
>>> +      * hopefully avoid performance killing SWIOTLB bounce buffering.
>>> +      */
>>> +     if (dma_addressing_limited(dev))
>>> +             priv->shm_gfp_mask |= GFP_DMA32;
>>>
>>>        priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
>>>        if (IS_ERR(priv->cmdbuf_suballoc)) {
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>> index 7c7f97793ddd..5e753dd42f72 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>> @@ -839,14 +839,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>>>        if (ret)
>>>                goto fail;
>>>
>>> -     /*
>>> -      * If the GPU is part of a system with DMA addressing limitations,
>>> -      * request pages for our SHM backend buffers from the DMA32 zone to
>>> -      * hopefully avoid performance killing SWIOTLB bounce buffering.
>>> -      */
>>> -     if (dma_addressing_limited(gpu->dev))
>>> -             priv->shm_gfp_mask |= GFP_DMA32;
>>> -
>>>        /* Create buffer: */
>>>        ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
>>>                                  PAGE_SIZE);

-- 
Best regards,
Sui

