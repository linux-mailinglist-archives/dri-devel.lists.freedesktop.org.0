Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DF966B11
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 23:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F8010EAF1;
	Fri, 30 Aug 2024 21:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Qqgxawc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26DA10E128
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 21:03:11 +0000 (UTC)
Message-ID: <e0d206be-7ad1-4b80-9f58-88eb0cf1ce74@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725051790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4OEWcEhfJSfSlYo07oIFQ/4ZIDOB0tVXO3csQokwug=;
 b=Qqgxawc3kIVrVt+sccZg/wjFrWmXtPLJB3tMu6J+z1+015puL9Pan0j99RMTXSWBvb8t3J
 2xBeYejFXk7YEnJ9xZtPodwURTbitUqYubrYi/Vi1o5+3a4S86gq7i3ZXHzieksdOJFPCY
 fTQARNgfb7S2AV4nmLqeckDGc7QtFwY=
Date: Sat, 31 Aug 2024 05:03:01 +0800
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


Thanks for your nice catch! I have more to say.

On 2024/8/16 09:55, Wang, Xiaolei wrote:
> Ping ...

32 address -> 32-bit address,

Perhaps, we could improve the commit title a little bit
by writing a more accurate sentence if possible, say:

drm/etnaviv: Properly request pages from DMA32 zone when needed

or

drm/etnaviv: Request pages from DMA32 zone on addressing_limited


> thanks
> xiaolei

Vivante GPU is a 32-bit GPU, it do can access 40-bit physical address via its MMU(IOMMU).
But this is only possible *after* the MMU has been setup(initialized). Before GPU page
table is setup(and flush-ed into the GPU's TLB), the device can only access 32-bit
physical addresses and the addresses has to be physical continues in ranges.

The GPU page tables (GART) and command buffer has to reside in low 4GB address.

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

The code here  still looks itchy and risky,
because for a i.MX8 SoC with multiple vivante GPU core.
We will modify priv->shm_gfp_mask *multiple* time.

For the 2D core and the 3D core have different DMA addressing constraint.
Then, only the last(latest) modify will be effective. This lead to the
probe order dependent.

However this may not be a problem in practice, as usually, all vivante
GPUs in the system will share the same DMA constraints. And the driver
assume that.

But then, we probably still should not modify the global shared GFP
mask multiple time.

Now that we do assume that all vivante GPUs in the system share the
same DMA constraints. And the DMA constraints information has been
assigned to the virtual master. The right time to modify the
`priv->shm_gfp_mask` should be in the etnaviv_bind() function. as
this can eliminate overlap(repeat) stores.


Please consider move the entire if() {} to etnaviv_bind(), just below
where the 'priv->shm_gfp_mask' was initially initialized.

or alternatively we can just hard-code to use low 4GM memmory only:

priv->shm_gfp_mask = GFP_USER | GFP_DMA32 | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;


Best regards,
Sui

>           /* Create buffer: */
>           ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
