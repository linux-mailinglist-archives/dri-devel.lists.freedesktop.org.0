Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC98376E9FB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 15:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1022A10E078;
	Thu,  3 Aug 2023 13:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA04B10E078
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 13:22:50 +0000 (UTC)
Received: from [192.168.0.125] (unknown [82.76.24.202])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 932BA66003AA;
 Thu,  3 Aug 2023 14:22:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691068969;
 bh=QjOypgF2tjYzN7SWK9FWCkeF0m/mCGr8viJpxU+QpfU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QRhY6RjuYvQYrtIjk7tguUaphwsxhkMgvaV5aXqsta5ceFPkEv3CpeM5u+E+MyWQC
 2q4o3TYK6QQUY4SbYMwEkO+d6Y0k3JmwehKBKEKqDZdHm5JHPl+BhAuYYVY5cNc9mF
 qF3u/ztJjpNcnzfOjDVqsQ3y9Tf5NEgWUeEAk/t5OocMl1tZS2u1PRETUzd39cm+vq
 E9SBCEZMkNKmJHuCleyHVAMoAbwb5PA6YIxrGFVWHElaLpFHbUGVuFo7Z6+3A8p23a
 tztmQQhw5Rsxno+eL4PQbNJstMoaAX+auT90i6P+GF71g7g7ci3hZGrwIDGWCyMTxf
 hu7c45LAT5jQA==
Message-ID: <3d5de892-8311-86e8-b962-0e564903b0e6@collabora.com>
Date: Thu, 3 Aug 2023 16:22:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 3/8] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
 <20230802144802.751-4-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230802144802.751-4-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/23 17:47, Jason-JH.Lin wrote:
> In mtk_drm_kms_init(), each element in all_drm_priv should has one
> display path private data only, such as:
> all_drm_priv[CRTC_MAIN] should has main_path data only
> all_drm_priv[CRTC_EXT] should has ext_path data only
> all_drm_priv[CRTC_THIRD] should has third_path data only

s/should has/should have/ ?

> 
> So we need to add the length checking for each display path before
> assigning their drm private data into all_drm_priv array.
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 89a38561ba27..c12886f31e54 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -351,6 +351,7 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
>   {
>   	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
>   	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +	struct mtk_drm_private *temp_drm_priv;
>   	struct device_node *phandle = dev->parent->of_node;
>   	const struct of_device_id *of_id;
>   	struct device_node *node;
> @@ -373,9 +374,18 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
>   		if (!drm_dev || !dev_get_drvdata(drm_dev))
>   			continue;
>   
> -		all_drm_priv[cnt] = dev_get_drvdata(drm_dev);
> -		if (all_drm_priv[cnt] && all_drm_priv[cnt]->mtk_drm_bound)
> -			cnt++;
> +		temp_drm_priv = dev_get_drvdata(drm_dev);
> +		if (temp_drm_priv) {

This is inside a 'for' loop right ?
Why don't you just 'continue' if temp_drm_priv is null ?


> +			if (temp_drm_priv->mtk_drm_bound)
> +				cnt++;
> +
> +			if (temp_drm_priv->data->main_len)
> +				all_drm_priv[CRTC_MAIN] = temp_drm_priv;
> +			else if (temp_drm_priv->data->ext_len)
> +				all_drm_priv[CRTC_EXT] = temp_drm_priv;
> +			else if (temp_drm_priv->data->third_len)
> +				all_drm_priv[CRTC_THIRD] = temp_drm_priv;
> +		}
>   	}
>   
>   	if (drm_priv->data->mmsys_dev_num == cnt) {

