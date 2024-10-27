Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF599B1C19
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 04:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5966310E088;
	Sun, 27 Oct 2024 03:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="RFgLLAxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60E110E088
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 03:59:13 +0000 (UTC)
Message-ID: <51f93661-697e-4b0f-b383-fc80ff0b6edd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730001551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxokjpi64ojG2mVk/2Soqm7JX1QalF+tS1YKzDyo+ko=;
 b=RFgLLAxgzOse5eYUbwD80fB3tX8DbEG6Eg9j8F3lwW7U+Uk1Hlm/tZF+9m/ER+pjlPERGv
 3WeM5kQ7p2tI9NoaYdi11Xpio49Tups6n4VTiDndW60mpqb8Hi/4dwpuG/tYkoKsi9hHyy
 ABNf1fuWYg4JBfnijZ8g/Ifd8ijSf4c=
Date: Sun, 27 Oct 2024 11:59:01 +0800
MIME-Version: 1.0
Subject: Re: drm/etnaviv: always allocate 4K for kernel ringbuffers
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
References: <20241025151417.2475966-1-l.stach@pengutronix.de>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20241025151417.2475966-1-l.stach@pengutronix.de>
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

Hi,


On 10/25/24 23:14, Lucas Stach wrote:
> Since the kernel ringbuffers are allocated from a larger suballocated
> area, same as the user commandbufs, they don't need to be CPU page
> sized. Allocate 4KB for the kernel ring buffers, as we never use more
> than that.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>


Tested with on a 16 KiB system, it works fine as before.

I notices that most test samples of glmark2 consumes only one page,
only a few of them consumes more than one page command buffer, can
up to 20 KiB.

> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7c7f97793ddd..7b39786871b3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -848,8 +848,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>   		priv->shm_gfp_mask |= GFP_DMA32;
>   
>   	/* Create buffer: */
> -	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
> -				  PAGE_SIZE);
> +	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer, SZ_4K);
>   	if (ret) {
>   		dev_err(gpu->dev, "could not create command buffer\n");
>   		goto fail;

-- 
Best regards
Sui

