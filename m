Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C89B153D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 07:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5F810E21F;
	Sat, 26 Oct 2024 05:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Bx0cYzVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9062C10E21F
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 05:55:32 +0000 (UTC)
Message-ID: <eb0da085-5672-4a6e-b2d7-df628542cfdf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729922130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/BnGth3qVS+yRRXcpYmVqCPs6VRyBTiCHU46Zrgryw=;
 b=Bx0cYzVmFGQ6sTpwDqh78AeWGOU0V9iskS2y8jBjslpBYmBPYe+whDrUW4cPn2r0llovq6
 0TRQ82XcVDEI8clYOGwx3hpVwOwpM09OgCG8T81NlsjFJBcaSSYDrmfzTnnxloeMMezCJX
 vcRMnIt/pkvhQvGZkYd+ykoN0tToEJE=
Date: Sat, 26 Oct 2024 13:55:18 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/etnaviv: Map and unmap the GPU VA range with
 respect to its user size
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
 <20241004194207.1013744-3-sui.jingfeng@linux.dev>
 <13b9c1bde7f0534f7f3c576126def206bdafd60c.camel@pengutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <13b9c1bde7f0534f7f3c576126def206bdafd60c.camel@pengutronix.de>
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

On 2024/10/7 18:17, Lucas Stach wrote:
>>   
>> @@ -104,21 +108,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>>   static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
>>   				struct sg_table *sgt, unsigned len)
>>   {
>> -	struct scatterlist *sg;
>> -	unsigned int da = iova;
>> -	int i;
>> -
>> -	for_each_sgtable_dma_sg(sgt, sg, i) {
>> -		size_t bytes = sg_dma_len(sg) + sg->offset;


Why the length of a single SG segment is `sg_dma_len(sg) + sg->offset` here?


>> -		etnaviv_context_unmap(context, da, bytes);
>> -
>> -		VERB("unmap[%d]: %08x(%zx)", i, iova, bytes);
>> -
>> -		BUG_ON(!PAGE_ALIGNED(bytes));
>> -
>> -		da += bytes;
>> -	}
>> +	etnaviv_context_unmap(context, iova, len);
> This drops some sanity checks, but I have only ever seen them fire when
> we had other kernel memory corruption issues, so I'm fine with the
> simplification you did here.


Isn't that 'sg_dma_len(sg)' itself is the length of its backing memory ?


> Regards,
> Lucas

-- 
Best regards,
Sui

