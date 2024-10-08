Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63AF994601
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 13:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5C910E084;
	Tue,  8 Oct 2024 11:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TurhgPjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA0B10E084;
 Tue,  8 Oct 2024 11:04:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 39315A43500;
 Tue,  8 Oct 2024 11:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9189C4CEC7;
 Tue,  8 Oct 2024 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728385468;
 bh=d+4dJ9Ma+xa5ecnFCjCiJyEy9xn4w2t7xy9bBhkJBio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TurhgPjTQ805yeA/y+pp7tgQYJlBpGFff7h5LXnlXArSqG+a+guCmzvRbe+3YrLFN
 15A/dAsNTnDcDE4tSJdb9KbjpMXcnLmhTRCEVlZy6iTbefcEAcSEjQfBMyfDiO+0Dw
 ++pfrqcWg/yMLA4iqwA2SFACfZXkL1lo5cNhU8AfF1M8t7hplKhV5f7Eyrj0LJ++cA
 nQ4m5y3EK3ODlI3ciDppp0YWFI+xUG3v3dNhdGv19PKfFygBF4jqodwi0wEcbUGpKT
 ylECF+7xN2JsmEl6oHW5Ko+7BWMCPFUz/4knKYUYJC/CE0cwsu6LJ4c8DJMqP7YiSA
 iLdLRZL3QGKYg==
Date: Tue, 8 Oct 2024 13:04:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, bskeggs@nvidia.com,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v3 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Message-ID: <ZwURtuu7Jkgh6GRl@pollux>
References: <20241008073103.987926-1-ymaman@nvidia.com>
 <20241008073103.987926-2-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008073103.987926-2-ymaman@nvidia.com>
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

On Tue, Oct 08, 2024 at 10:31:02AM +0300, Yonatan Maman wrote:
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
> Co-developed-by: Gal Shalom <GalShalom@Nvidia.com>

'Co-developed-by' must be immediately followed by the corresponding
'Signed-off-by'.

This is just a nit, but it indicates you didn't run ./scripts/checkpatch.pl, did
you?

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

This patch does not apply, it seems like it is based on some old or OOT version
of the code.

Please make sure to rebase and test your patches against upstream code if you're
submitting patches upstream.

>  	if (ret)
>  		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
>  }
> -- 
> 2.34.1
> 
