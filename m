Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A6749C5A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D510E3F0;
	Thu,  6 Jul 2023 12:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD75110E3F0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:47:32 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0609C6606FBA;
 Thu,  6 Jul 2023 13:47:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688647651;
 bh=zXq0RxESpSkRSGtoAWJi6JGEGgsz7+mOEqGxgmgm5F0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QWRwQrxYxEJii4Oy32ULOt49iEq2NvCXfSWiYq1uVb0ISH25jO1fQqLl8XZ7p0na0
 8W5v74OYEWDgDegmPjTOu/5iqn+Kb9WXI1KNGWOTUf1DMqn7xJoDBLh2BRXyT9suYS
 2kMgqKdIITNXxzNuBra3luErq+Gy9f+0aN1fvHy4DH6yV0unaiwLQUlFsOXVQukhRW
 TQqSUfpI88zRTyUVdjkv2KCos8Mh6/OlGTTT2YIEOBoq5sjlesR3FdnSs8ObjigLyr
 iS1svXJgKtFT8XOwDk9AuxqfPPdT1flRG+LiPrmhami61Vm74IZcxr8KA45UZ0WNQr
 hUBpKoXlctegw==
Message-ID: <be63fd1b-7659-75b8-e037-38528e8a8276@collabora.com>
Date: Thu, 6 Jul 2023 14:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626185801.684451-1-suijingfeng@loongson.cn>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/06/23 20:58, Sui Jingfeng ha scritto:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

This commit needs a Fixes tag. Please add the relevant one and resend.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index a25b28d3ee90..9f364df52478 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -247,7 +247,11 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   
>   	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>   			       pgprot_writecombine(PAGE_KERNEL));
> -
> +	if (!mtk_gem->kvaddr) {
> +		kfree(sgt);
> +		kfree(mtk_gem->pages);
> +		return -ENOMEM;
> +	}
>   out:
>   	kfree(sgt);
>   	iosys_map_set_vaddr(map, mtk_gem->kvaddr);



