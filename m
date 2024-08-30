Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758449669F6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 21:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D64910E01F;
	Fri, 30 Aug 2024 19:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ku6SQfVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBB810E01F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 19:40:26 +0000 (UTC)
Message-ID: <761c07a9-a507-44a6-94e5-69655881c137@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725046824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P23hzakT4iTBeTQQZIxqORb4IwFukzfuhRAvyZU6U08=;
 b=ku6SQfVc3QfWZJGgEvQbT0ayyu3NFuPKSTJ5kiD1Vo1ZCqFOPC0+mk243x+a2dS2qz/2VI
 sFqqa1ANZBkQgaQtJq8jrE+xFSbT4c9B71Wn17Y+rMJGK/Dg5MgDevRbpmpzci3T6rD3Di
 9E0F7HgDi7P26Eak0vEoBDPmH0KYgqE=
Date: Sat, 31 Aug 2024 03:40:11 +0800
MIME-Version: 1.0
Subject: Re: [v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in GFP_HIGHUSER
 with 32 address
To: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <MW5PR11MB57648F441CEDD36E614E31EA95812@MW5PR11MB5764.namprd11.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <MW5PR11MB57648F441CEDD36E614E31EA95812@MW5PR11MB5764.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, Xiaolei


On 2024/8/16 09:55, Wang, Xiaolei wrote:
> Ping ...

I think, the more proper fix that Lucas hint
is to modify the 'priv->shm_gfp_mask' variable
in the|etnaviv_bind() function|. Say:
|Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"|

instead of

|"priv->shm_gfp_mask = ||GFP_HIGHUSER||| __GFP_RETRY_MAYFAIL | __GFP_NOWARN;|"


Right?

> thanks
> xiaolei
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7c7f97793ddd..0e6bdf2d028b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>            * request pages for our SHM backend buffers from the DMA32 zone to
>            * hopefully avoid performance killing SWIOTLB bounce buffering.
>            */
> -       if (dma_addressing_limited(gpu->dev))
> +       if (dma_addressing_limited(gpu->dev)) {
>                   priv->shm_gfp_mask |= GFP_DMA32;
> +               priv->shm_gfp_mask &= ~__GFP_HIGHMEM;
> +       }
>
>           /* Create buffer: */
>           ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,

-- 
Best regards,
Sui

