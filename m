Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C287F5BBC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF3610E70C;
	Thu, 23 Nov 2023 09:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1956110E70C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:56:20 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CF5C6607390;
 Thu, 23 Nov 2023 09:56:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700733378;
 bh=gAu++mm0U9mt5g8RN6c84qdtHW1L8vp8uMGDwrRFt2w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cYpgxRvXSU7lshcYEGilzhAYIy537CqAcQ8D/ubmzEPpgsvAdTARo54CTvvSOicjf
 RuerpVWNozkRfg9DHrHYt7jdwaNWPZyF5lgNWvPz+IlCa0HrQFp+ugT/FYkNcjTWu4
 2hC08R353s8zSVumTEgY8bSG+jxMQKWYIDTp4UFrlK4T0isEXyfekSwRukxaSZ/ecR
 jK7DyHfN+23ph+i+1biWwPba3r9qeBLgyU4QoEhiLtswXprz+31BBwsgNdiIUpHBx1
 FEzWbyxpYb+FVu9y0ktRSy71pGspK6abkZqSQQT8ybEISanVaNx/657zlGPuVeAsVj
 SGVKlwej9j08g==
Message-ID: <fff2faef-6f3c-4009-840a-3ce83db90288@collabora.com>
Date: Thu, 23 Nov 2023 10:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: mediatek: mtk_disp_gamma: Fix breakage due to merge
 issue
To: chunkuang.hu@kernel.org
References: <20231025104940.140605-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231025104940.140605-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/10/23 12:49, AngeloGioacchino Del Regno ha scritto:
> While the commit that was sent to the mailing lists was fine, something
> happened during merge and the mtk_gamma_set() function got broken as
> a writel() was turned into a readl().
> 
> Fix that by changing that back to the expected writel().
> 
> Fixes: a6b39cd248f3 ("drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This was a urgent patch one month ago, and it got ignored.

Friendly ping.

Regards,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index 2fada9d6c95f..52c752bc5f41 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -203,7 +203,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>   	/* Disable RELAY mode to pass the processed image */
>   	cfg_val &= ~GAMMA_RELAY_MODE;
>   
> -	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
> +	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
>   }
>   
>   void mtk_gamma_config(struct device *dev, unsigned int w,


