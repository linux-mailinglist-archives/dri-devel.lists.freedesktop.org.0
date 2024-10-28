Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9539B366A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E6910E4FF;
	Mon, 28 Oct 2024 16:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="wG3uZTa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05C10E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 16:25:42 +0000 (UTC)
Message-ID: <826ec7f4-50cd-43df-acf0-79eb67082742@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730132740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qy1JMU6QyV9pkBRlJmAGThzbyeZbs1xn2FoOI28BhDs=;
 b=wG3uZTa2LD5Ezv/IC2+fuDA0GFXbVs7OeKjMmmoIfT2tk8/Mp5JlBvLQQ9nlPpoUMgqeOG
 0n0dwLTewpPQfikY7/GKMgO3x6shUAm42tEatz5BlZKMjEzSjUlp3k0l6UUW5+VXUSHKkO
 68Y2U3ho0E43twbIoN8terdQM80IvfQ=
Date: Tue, 29 Oct 2024 00:25:30 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm/etnaviv: Print an error message if inserting IOVA
 range fails
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
 <20241004194207.1013744-4-sui.jingfeng@linux.dev>
 <fb5ae5769442f4c84098acd674d423cd3f00bc66.camel@pengutronix.de>
 <5ec01e85f58ee1ac1604e029a71175cd733a3cd9.camel@pengutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <5ec01e85f58ee1ac1604e029a71175cd733a3cd9.camel@pengutronix.de>
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

On 2024/10/29 00:01, Lucas Stach wrote:
> Hi Sui,
>
> Am Montag, dem 07.10.2024 um 12:20 +0200 schrieb Lucas Stach:
>> Am Samstag, dem 05.10.2024 um 03:42 +0800 schrieb Sui Jingfeng:
>>> Print an error message to help debug when such an issue happen, since it's
>>> not so obvious.
>>>
>>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
>>
> What happened to this patch? It's not part of the updated series
> anymore. Even though the problem at hand is solved right now, I still
> think this patch is useful  to have.

I was thinking this patch should be a separate patch while making the v2.

In the future, I guess there may have 64K CPU and/or GPU page size combinations
from other users or contributors.

I think I should resend this.
But don't know take which Linux kernel as code base.
etnaviv-next or etnaviv-fixes?

If you have convenient code base at hand now, you could pick it up, I don't mind.

> Regards,
> Lucas
>
>>> ---
>>> v0 -> v1: Use dev_err_ratelimited() to prevent spamming the logs
>>>
>>> v0 is at https://lore.kernel.org/dri-devel/20240930221706.399139-1-sui.jingfeng@linux.dev/
>>> ---
>>>   drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>>> index a52ec5eb0e3d..37866ed05c13 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>>> @@ -300,8 +300,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
>>>   		ret = etnaviv_iommu_insert_exact(context, node, user_size, va);
>>>   	else
>>>   		ret = etnaviv_iommu_find_iova(context, node, user_size);
>>> -	if (ret < 0)
>>> +	if (ret < 0) {
>>> +		dev_err_ratelimited(context->global->dev,
>>> +				    "Insert iova failed: 0x%llx(0x%x)\n",
>>> +				    va, user_size);
>>>   		goto unlock;
>>> +	}
>>>   
>>>   	mapping->iova = node->start;
>>>   	ret = etnaviv_iommu_map(context, node->start, user_size, sgt,

-- 
Best regards,
Sui

