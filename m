Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6EF9D8AB8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B3910E6B8;
	Mon, 25 Nov 2024 16:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WjGatPso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6AF10E6B8;
 Mon, 25 Nov 2024 16:55:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A9D5A4188B;
 Mon, 25 Nov 2024 16:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4466BC4CECF;
 Mon, 25 Nov 2024 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732553753;
 bh=1yOfnf2sdQigh49jUpG7wRe5NhaEpgvcUzRBP7X0APE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WjGatPsohAWWwdcabMqLnvmRZ19+iYJP2szS2k4pWUAjHDucmFMWxnjmVLHTlgKCX
 1fpO5p2KNySAu6CU79Z5yABWS5767XW77djm2KcqjV4/b99DpjEGZ06amFtnIAsypM
 qqQkRrNekug/WmPm7YRjtduj3Eq+hEgsx5VF3zFFR37NdIbhax9dtLYVBAKLa7ybVL
 SRujKiKXCLD55nAfmxZ4M2lexQb4cJ9pz/S26JiSEsI3vtj/Nwpe4caGCTWY9vyus3
 ZrKE+5W3FvlAQdGJKWb519xvOl6BUAojuOxArYEmVLy3oM1TpJnOSERSVAfn5BX7Z7
 sh7lSOgVCQlSg==
Message-ID: <f4e39af3-ada1-4bbd-ade1-90bfaf3899da@kernel.org>
Date: Mon, 25 Nov 2024 17:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: fw: sync dma after setup is called.
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20241114004603.3095485-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20241114004603.3095485-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/14/24 1:46 AM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> When this code moved to non-coherent allocator the sync was put too
> early for some firmwares which called the setup function, move the
> sync down after the setup function.
> 
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

Do you have a link of where this issue has been reported?

> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Fixes: 9b340aeb26d5 ("nouveau/firmware: use dma non-coherent allocator")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/falcon/fw.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> index a1c8545f1249..cac6d64ab67d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> @@ -89,11 +89,6 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct nvkm_subdev *user,
>   		nvkm_falcon_fw_dtor_sigs(fw);
>   	}
>   
> -	/* after last write to the img, sync dma mappings */
> -	dma_sync_single_for_device(fw->fw.device->dev,
> -				   fw->fw.phys,
> -				   sg_dma_len(&fw->fw.mem.sgl),
> -				   DMA_TO_DEVICE);
>   
>   	FLCNFW_DBG(fw, "resetting");
>   	fw->func->reset(fw);
> @@ -105,6 +100,12 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct nvkm_subdev *user,
>   			goto done;
>   	}
>   
> +	/* after last write to the img, sync dma mappings */
> +	dma_sync_single_for_device(fw->fw.device->dev,
> +				   fw->fw.phys,
> +				   sg_dma_len(&fw->fw.mem.sgl),
> +				   DMA_TO_DEVICE);
> +
>   	ret = fw->func->load(fw);
>   	if (ret)
>   		goto done;

