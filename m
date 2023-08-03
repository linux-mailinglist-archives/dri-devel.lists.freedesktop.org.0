Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECB76EA34
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 15:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD5A10E098;
	Thu,  3 Aug 2023 13:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9018D10E098
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 13:27:21 +0000 (UTC)
Received: from [192.168.0.125] (unknown [82.76.24.202])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F24966015A0;
 Thu,  3 Aug 2023 14:27:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691069240;
 bh=GKxVpL2htb4W/V44J3R/Ch3TGxu315qMlN6i5BaRp1I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oo7mc+GB6YB9oHQ4koa2nFWMb8g7v4RNgRYnrJHXmeh30XNsgyn8zplPvdMUNDlFO
 BdmZbGx13CeVWR+/isBu7FirOF9+o5xQ4uWaz4789oqKXDk4F5PujVr3zb3idQbDD8
 eJ/l8O50Hbnolo2AOvdECXDijID+AdjplSkKF+I3BOagFtr1pu3SkH4sia0BCikRBi
 W/dn8xJk4OMFa/U6h8+tq+iqGv/KbbodwNPsUOcJrYcysqnKchFj0Vh7Aeuw50hEJr
 +lzzCdiTECDbV2dumyS0ec2Y2lKvt3kHZ47gfP/7bPn6EamnwGNec0ZYR033sBNKa/
 o2VDfs0neynLw==
Message-ID: <a0b5ab0a-4c2e-d14c-508c-09a981d7087b@collabora.com>
Date: Thu, 3 Aug 2023 16:27:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 4/8] drm/mediatek: Add encoder_index function to
 mtk_ddp_comp_funcs
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
 <20230802144802.751-5-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230802144802.751-5-jason-jh.lin@mediatek.com>
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
> 1. Add encoder_index function to mtk_ddp_comp_funcs to support dynamic
> connector selection for some ddp_comp who has encoder_index.
> 2. Add mtk_ddp_comp_encoder_index_set function to set encoder_index to
> each comp.
> 

Usually a commit that does two things in a list is supposed to be two 
actual commits.


> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index febcaeef16a1..8428baca70f4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -80,6 +80,7 @@ struct mtk_ddp_comp_funcs {
>   	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
>   	void (*add)(struct device *dev, struct mtk_mutex *mutex);
>   	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
> +	unsigned int (*encoder_index)(struct device *dev);
>   };
>   
>   struct mtk_ddp_comp {
> @@ -87,6 +88,7 @@ struct mtk_ddp_comp {
>   	int irq;
>   	unsigned int id;
>   	const struct mtk_ddp_comp_funcs *funcs;
> +	unsigned int encoder_index;

For better alignment I would suggest variables to be declared together 
and pointers afterwards, not mixed up

>   };
>   
>   static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
> @@ -275,6 +277,12 @@ static inline bool mtk_ddp_comp_disconnect(struct mtk_ddp_comp *comp, struct dev
>   	return false;
>   }
>   
> +static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->encoder_index)
> +		comp->encoder_index = comp->funcs->encoder_index(comp->dev);
> +}

it's also a bit strange that you added a function that is not used 
anywhere. Don't you get like a compiler warning for it ?

> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type);
>   unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,

