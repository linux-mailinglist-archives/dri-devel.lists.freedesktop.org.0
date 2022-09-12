Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568875B582F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFEF10E36D;
	Mon, 12 Sep 2022 10:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206B410E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:24:17 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CD6E6601FD9;
 Mon, 12 Sep 2022 11:24:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662978256;
 bh=kiqQbnIn7/5ut/Bpv9ksnG72E+m6XZrvIdfMBPIWiDs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nWiUu98eh2uGOzmLk0SWdME8yzF3fTBfsXzrEQ87DFJjiBY1vOH7HPzJvISUPMfS6
 xVPxZpve8trRoYmAvy599zNpzxcBF4Dx3jYO9peJC9GXm04aIzVbSQv5NEsAt8+k/3
 0WdoGIuxzbP1IHImxfostd9DszbMyinHF+R1aH8HdlYdPuFlV8MRzG+Am+kXyhaQyM
 VgLJt2fTJdictRb6SGPt3VCFU4VnEfy3kbWjafXVKTpmpQUEmES0+OSkWb5ML4KBo1
 poYaGyMvWyrXJvKRgctf0Bq+o3EdggZL1UV2EY2eUJZq0Fueb68b2p9eXzyAqqZAug
 On2OPOb0PpQOg==
Message-ID: <97ac2b35-bb3b-360a-4078-f72146136a7f@collabora.com>
Date: Mon, 12 Sep 2022 12:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 4/9] drm/mediatek: Add gamma support different lut_size
 for other SoC
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-5-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> 1. Add mtk_drm_gamma_get_lut_size() and remove MTK_LUT_SIZE macro.
> 2. Add lut_size to gamma driver data for different SoC.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 22 +++++++++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 ++--
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++++++
>   5 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index a83e5fbc8724..6a05bb56e693 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -51,6 +51,7 @@ void mtk_gamma_clk_disable(struct device *dev);
>   void mtk_gamma_config(struct device *dev, unsigned int w,
>   		      unsigned int h, unsigned int vrefresh,
>   		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +unsigned int mtk_gamma_get_lut_size(struct device *dev);
>   void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
>   void mtk_gamma_start(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index f54a6a618348..e69d0b205b9a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -24,10 +24,12 @@
>   #define DISP_GAMMA_LUT				0x0700
>   
>   #define LUT_10BIT_MASK				0x03ff
> +#define LUT_SIZE_DEFAULT			512 /* for setting gamma lut from AAL */
>   
>   struct mtk_disp_gamma_data {
>   	bool has_dither;
>   	bool lut_diff;
> +	u16 lut_size;
>   };
>   
>   /*
> @@ -54,18 +56,32 @@ void mtk_gamma_clk_disable(struct device *dev)
>   	clk_disable_unprepare(gamma->clk);
>   }
>   
> +unsigned int mtk_gamma_get_size(struct device *dev)
> +{
> +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> +	unsigned int lut_size = LUT_SIZE_DEFAULT;
> +
> +	if (gamma && gamma->data)
> +		lut_size = gamma->data->lut_size;
> +
> +	return lut_size;
> +}
> +
>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
>   {
>   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>   	bool lut_diff = false;
> +	u16 lut_size = LUT_SIZE_DEFAULT;

This makes us get a double assignment in case gamma->data is populated.

>   	unsigned int i, reg;
>   	struct drm_color_lut *lut;
>   	void __iomem *lut_base;
>   	u32 word;
>   	u32 diff[3] = {0};
>   
> -	if (gamma && gamma->data)
> +	if (gamma && gamma->data) {
>   		lut_diff = gamma->data->lut_diff;
> +		lut_size = gamma->data->lut_size;
> +	}

...you can avoid it like that:

} else {
	lut_size = LUT_SIZE_DEFAULT;
}


Regards,
Angelo


