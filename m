Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C744161F1B6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2972F10E2E4;
	Mon,  7 Nov 2022 11:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E9210E2E4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:20:26 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B6693660239F;
 Mon,  7 Nov 2022 11:20:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667820024;
 bh=+5Huk55iq4Plx52+yZClp0DhD3oOu5tBVt54hs+t8xY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G3lKnascRvbEDCDGxRQEXRx+38Te7xbje/SdqqKVMsWC+tpsomycebcMeFRhkpYFG
 GkR253l6CMfLGzU86DoQzcrSOfuNRwPm6vtOdzDr4rhEavDgoYcfV9ki/6MhNOonM9
 PbnfEe7UHfHF/thyXAKD+zWjv+HSSIJ2cIMxjLjLHbZ/rYY4UrqjP8BbAJ8RGSH16k
 UI+YmFeCJ/hqa8gNRTkCisWSD7pC+HUu74kQSZd1YuI+Iu8rlKHWrSPQF4TvP+tBxt
 okiyNmzlEY4J7WpUOVoiOx7oWQcQh7blqSHEmuNJJf3Cv6+nDC3p+FO4CSidCB3pXm
 jmEqaCqSzyuWw==
Message-ID: <05183178-32cb-98c0-4fcb-d5e78874e6c4@collabora.com>
Date: Mon, 7 Nov 2022 12:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 03/12] drm/mediatek: hdmi: use a regmap instead of iomem
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-3-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-3-a803f2660127@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> To prepare support for newer chips that need to share their address
> range with a dedicated ddc driver, use a regmap.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 43 +++++++++++--------------------------
>   1 file changed, 13 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 4c80b6896dc3..9b02b30a193a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -171,7 +171,7 @@ struct mtk_hdmi {
>   	u32 ibias_up;
>   	struct regmap *sys_regmap;
>   	unsigned int sys_offset;
> -	void __iomem *regs;
> +	struct regmap *regs;
>   	enum hdmi_colorspace csp;
>   	struct hdmi_audio_param aud_param;
>   	bool audio_enable;
> @@ -187,44 +187,29 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
>   	return container_of(b, struct mtk_hdmi, bridge);
>   }
>   
> -static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
> +static int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val)
>   {
> -	return readl(hdmi->regs + offset);
> +	return regmap_read(hdmi->regs, offset, val);
>   }
>   
>   static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
>   {
> -	writel(val, hdmi->regs + offset);
> +	regmap_write(hdmi->regs, offset, val);
>   }
>   
>   static void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)

You don't need these functions anymore, as these are now simply wrapping
regmap calls, hence these don't contain any "real" logic anymore.

Please remove them and use the regmap API directly.

Thanks,
Angelo

