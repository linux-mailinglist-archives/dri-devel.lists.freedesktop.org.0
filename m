Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01057992DDA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 15:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBA710E34E;
	Mon,  7 Oct 2024 13:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DctWvKJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26F910E34E;
 Mon,  7 Oct 2024 13:54:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B79E2A40814;
 Mon,  7 Oct 2024 13:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4082FC4CEC6;
 Mon,  7 Oct 2024 13:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728309243;
 bh=OqTgQbaF1Wymp6tKgKCQ/wtWZC34eQBotCaVLTmxZLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DctWvKJa5JQaX+NffcrwW411WL8HqFa26Ui3O2VffAPTPyX3gmFF3E6MzGZkQB/Xr
 XVqZnwBA3ox8xdkaQZN+ND5N2xSDCTgIhIuwMwCVD0AIoM5K5JcfVzMmDBWzV4ihbE
 qXUqs7r/+DuszgI++u2396nKyh9fB+JV6/IEZzv6r0XSnTPGFMe+TDUXZTcB915kBV
 mJCPOl3lKNKLrsq3zEkG9pJvmzzmMeRG6i/AW3+rqqYL7f6EmG6I3mnx4gfH3hF0IM
 Bf8e5JNhr9kJZOoR3jTYnIPSwCDog0idaXUpKNT7hib+e9cqs5bE0MVhcbnvI79q4K
 AeAtnTSUf2cXw==
Date: Mon, 7 Oct 2024 15:53:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, bskeggs@nvidia.com,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Message-ID: <ZwPn9Z1IPlB65zd-@pollux>
References: <20241007132700.982800-1-ymaman@nvidia.com>
 <20241007132700.982800-2-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007132700.982800-2-ymaman@nvidia.com>
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

On Mon, Oct 07, 2024 at 04:26:59PM +0300, Yonatan Maman wrote:
> From: Yonatan Maman <Ymaman@Nvidia.com>
> 
> When `nouveau_dmem_copy_one` is called, the following error occurs:
> 
> [272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
> ch 1 00000300 00003386
> 
> This indicates that a copy push command triggered a Host Copy Engine
> Privileged error on channel 1 (Copy Engine channel). To address this
> issue, modify the Copy Engine channel to allow privileged push commands
> 
> Fixes: 6de125383a5c ("drm/nouveau/fifo: expose runlist topology info on all chipsets")
> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
> Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>

Again, why is this signed-off by Gal? If he's a co-author, please add the
corresponding tag.

Please also see my reply to the previous version.

> Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a58c31089613..0a75ce4c5021 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
>  		return;
>  	}
>  
> -	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
> +	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
>  	if (ret)
>  		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
>  }
> -- 
> 2.34.1
> 
