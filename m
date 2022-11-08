Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7356621AD9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC6110E4DB;
	Tue,  8 Nov 2022 17:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABEB10E4D0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:37:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id t1so9268818wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 09:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lL7ib0fQfHAIVHKNMEUfuV2w/rUMbmu/eMiez+EADGc=;
 b=YT8bDUSuYGlX0nSv0Gmye3eRq5y7UbhWrZlTinDOm2D4cvZMf0uBi7FXOD/RD83xQD
 ftEA8Oy9SJ2khn9xHaudJCfy0C5C8+J1XVTe/TZJqrUQboYjz9T+6Auu5BcqxQMiJCk9
 UdOU0NgLAak/vV5X9oK8gPFcxQyRDiTPOq0WF1zieFiXoksfSP6SM7MuznRRMKFDeSTs
 vr4uFMd5goEZAPH8EnCKiqptmLyIk0JdgcQYHSmHAS5ZLUJ+8z37Ot2CbG4HKOMt1Rje
 80KqeqTvSDNFxAUoK0/7qt428CD+a2206fRXAs2pSszQXryGl280+QJPRi/VyEnH3o53
 /AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lL7ib0fQfHAIVHKNMEUfuV2w/rUMbmu/eMiez+EADGc=;
 b=SW64dMmMuima5U5OGr2dNc4jO1mm43gaRhJvtm43ndVe4UwE1DMDbW2cUMr4TaKVaa
 Z1jAfBj1PZa+M3sjD7cqzNI2kmyTp9mQhhcVp74441mZuSD+NJBB1UXW33wbKEoWKj3B
 t9aOLgJT+iS6NOuXTqGIqRoPjDStMVIucLcFG+e0+LzLrdewfAnunDuCzzKVWibFa2Mr
 cJDHspMaTDKw4OFBUakywDBhO1RlEKOVPJsuOo9sTPhkkNUN7RFIHFSUouwgiaNjh2sp
 nHVZvjk5OCBYgPCQNWhouCmeccyBZjhiXZDeAgbzjjw9t90fGUFMVMaTQrax4lbt8ecp
 0ocA==
X-Gm-Message-State: ACrzQf2sCj+4PyfBha5DzZE5tX8KdsAlAu2TXmhrE1on9FbQp0WsIHlV
 bmu5dqw+Knw9DhKDvUMp0BI=
X-Google-Smtp-Source: AMsMyM4ZRxL1bJwjZOpkyyyJeMjJb4TNMK6d9bQf6wA8GOKPj1utSTr6/nojgUJfPKlu3A5LPUB2tA==
X-Received: by 2002:a05:600c:4ecf:b0:3cf:8762:1a67 with SMTP id
 g15-20020a05600c4ecf00b003cf87621a67mr24970726wmq.41.1667929042011; 
 Tue, 08 Nov 2022 09:37:22 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d4b12000000b002365f326037sm13165230wrq.63.2022.11.08.09.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 09:37:20 -0800 (PST)
Message-ID: <58d55016-afc7-e560-32cf-8228794b5752@gmail.com>
Date: Tue, 8 Nov 2022 18:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-6-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221107072243.15748-6-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/11/2022 08:22, Nancy.Lin wrote:
> Simplify code for update  mmsys reg.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
>   1 file changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 9a327eb5d9d7..73c8bd27e6ae 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -99,22 +99,27 @@ struct mtk_mmsys {
>   	struct reset_controller_dev rcdev;
>   };
>   
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | (val & mask);

I'm not sure about the change in the implementation of mtk_mmsys_update_bits(). 
Nicolas tried to explain it to me on IRC but I wasn't totally convincing. As we 
have to go for at least another round of this patches, I'd like to get a clear 
understanding while it is needed that val bits are set to 1 in the mask.

Regards,
Matthias

> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			reg |= routes[i].val;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
> +					      routes[i].val);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>   
> @@ -124,27 +129,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> -static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> -{
> -	u32 tmp;
> -
> -	tmp = readl_relaxed(mmsys->regs + offset);
> -	tmp = (tmp & ~mask) | val;
> -	writel_relaxed(tmp, mmsys->regs + offset);
> -}
> -
>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>   {
>   	if (val)
> @@ -161,18 +153,13 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   {
>   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
>   	unsigned long flags;
> -	u32 reg;
>   
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> -
>   	if (assert)
> -		reg &= ~BIT(id);
> +		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0);
>   	else
> -		reg |= BIT(id);
> -
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id));
>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
>   
