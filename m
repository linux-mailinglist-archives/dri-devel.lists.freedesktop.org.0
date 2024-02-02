Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BFB84760C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 18:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2210E05B;
	Fri,  2 Feb 2024 17:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="i669Bify";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35FA10E197
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 17:24:48 +0000 (UTC)
Message-ID: <081b4b16-0e39-4ab0-9b80-c967e635b909@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706894686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgcYeo764bYyxxP5Ik2eYNyooqGOuKMRPXJvqpugx3U=;
 b=i669BifyZxDB0eDMMK8DbBgqK7Khujp8b9OQj69+A+5eeqwh2DVYIUpdK9X+yy3GuqQVzo
 gOppBVUQfRO2EbrrYfKT8CGYsSJA3zwswqrFgbkhjBjTXsE69BvU2z9UffwTXJO241GSO0
 myw/0RdduXNH4c8cm1SJbUhrxGUJJWU=
Date: Sat, 3 Feb 2024 01:24:41 +0800
MIME-Version: 1.0
Subject: Re: drm/loongson: Error out if no VRAM detected
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
Cc: dri-devel@lists.freedesktop.org
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240119104049.335449-1-chenhuacai@loongson.cn>
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


On 2024/1/19 18:40, Huacai Chen wrote:
> If there is no VRAM (it is true if there is a discreted card), we get
> such an error and Xorg fails to start:
>
> [  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
>
> So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is less
> than 1MB which is also an unusable case) detected.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index 89ccc0c43169..d8ff60b46abe 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
>   	drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
>   		 (u64)base, (u32)(size >> 20));
>   
> -	return 0;
> +	return (size > SZ_1M) ? 0 : -ENODEV;


I forget to tell you that you probably should return ENOSPC at here,
which stand for no space left on device, not the ENODEV.

