Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C0832D05
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43910E19A;
	Fri, 19 Jan 2024 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE32510E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:19:13 +0000 (UTC)
Message-ID: <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705681148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjirHN1YGZgKWKkfUTv/3it2+2XwBH3JzoYT3qrsxJk=;
 b=KOkKO5nXfG60oebM//MdpkQbNQMthEpEe9N1Pj7Y+WzSOdysRu2S8dDyYft+ppMOuHrM2L
 sKAPicRe16MZfggAakqEEVRiPd1dPoZBTu/MHvh+CwNzuCZfAnbnGX1cJLpuMuIIJSFD3X
 dejXt7ObVwfsQvCa9WkkMabUmoapku4=
Date: Sat, 20 Jan 2024 00:18:49 +0800
MIME-Version: 1.0
Subject: Re: drm/loongson: Error out if no VRAM detected
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui JIngfeng <sui.jingfeng@linux.dev>
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks a lot for contribution.

On 2024/1/19 18:40, Huacai Chen wrote:
> If there is no VRAM (it is true if there is a discreted card),


Why the dedicated VRAM is gone whenthere is a discrete card?

As far as I know, this is only possible on Loongson 3C5000 + aspeed BMC 
server hardware platform where the dedicated VRAM chip of Loongson 
Graphics is NOT soldered on the motherboard. Probably for cost reason, 
but then, the platform BIOS(either UEFI or PMON) should turn off the 
Loongson integrated graphics.

Because without dedicated VRAM, this driver can not work correctly. Or carve out
part of system RAM as VRAM, and write the base address and size to the BAR 2 of
the GPU PCI device.
This is NOT true  for Loongson 3A5000/3A6000  desktop hardware, because I have do
a lot test on various platform[1] before this driver was merged. It never happens
on a sane hardware configuration. Please update the commit message and limit the
scope.

[1] https://github.com/loongson-gfx/loongson_boards

> we get
> such an error and Xorg fails to start:


Yeah, If there is no dedicated VRAM, the driver can't allocate memory for framebuffer.
But this is probably more about the hardware configuration issue, not a driver issue.


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


This is not expected, if you want this driver be there and run normally.
You should guarantee that there have at least 64MiB dedicated VRAM.

I'm OK if this patch is strongly requested, but this is a kind of error handling.
Please give more details about the hardware in using and explain why there is no
dedicated VRAM available for your hardware.


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
>   }
>   
>   static struct lsdc_device *
