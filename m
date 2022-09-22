Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2445E5D31
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 10:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F6F10EA79;
	Thu, 22 Sep 2022 08:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B369610EA79
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 08:16:37 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BBC5B660205F;
 Thu, 22 Sep 2022 09:16:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663834596;
 bh=1RPw6QEhmeD3uutob+4PAGTRuDEf55q3mdwLBBZoPEg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f2mrfVlj93fK0lW82/gtmpmoFUXkhFWMnwXpFf++NotCJIsOUL7+2YC4+cZvrTPuc
 FetPCCCubueb3DS3J9trdKM3nPX/Mw8s0LoAos9Jx0HlEOUyQbejnLcHkjhp/m+ZJs
 8EO0qizKHvQswd2wkqRFqZ9vVZdX5jwf5cnH14roUuJgQR0Yy1+4vb6BDOvYPM5BRT
 i5U5p44Q31sN+dgiv0sftHNGxscy5aNG+2qn3D8QS0i0xEUAuvtPlqjW2kXdNyp0D/
 kuTQZ9jT94dRYvkYI2W+1+2SUrbAM9oUNc/wpQQ2Ar2z7YjdXJAzolkWoH9QTLQJ6M
 7lLadE2ZjkGnA==
Message-ID: <02bcd7f8-488a-75ec-badb-e62944c3d4e8@collabora.com>
Date: Thu, 22 Sep 2022 10:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7,1/3] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
References: <1663831764-18169-1-git-send-email-xinlei.lee@mediatek.com>
 <1663831764-18169-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663831764-18169-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/09/22 09:29, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> The difference between MT8186 and other ICs is that when modifying the
> output format, we need to modify the mmsys_base+0x400 register to take
> effect.
> So when setting the dpi output format, we need to call mmsys_func to set
> it to MT8186 synchronously.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 32 ++++++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h |  9 ++++++++
>   3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..536005d1cc55 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,14 @@
>   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>   #define __SOC_MEDIATEK_MT8186_MMSYS_H
>   
> +/* Values for DPI configuration in MMSYS address space */
> +#define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> +#define DPI_FORMAT_MASK					0x3

This is GENMASK(1, 0)

> +#define DPI_RGB888_SDR_CON				0
> +#define DPI_RGB888_DDR_CON				1
> +#define DPI_RGB565_SDR_CON				2
> +#define DPI_RGB565_DDR_CON				3
> +
>   #define MT8186_MMSYS_OVL_CON			0xF04
>   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>   #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 06d8e83a2cb5..0857806206dc 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -227,6 +227,38 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> +{
> +	switch (val) {

You're not handling the MTK_DPI_RGB888_SDR_CON case.

> +	case MTK_DPI_RGB888_DDR_CON: > +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,

Are there any other (future, past, present) MTK SoCs having a MMSYS
DPI_OUTPUT_FORMAT register?

I don't like seeing this kind of model-agnostic function in a not model-agnostic
driver, especially when this is only because of a register address.
That would change if no other future (or present) MediaTek SoCs have this register.

> +				      DPI_FORMAT_MASK, DPI_RGB888_DDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_SDR_CON:
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK, DPI_RGB565_SDR_CON);
> +		break;
> +	case MTK_DPI_RGB565_DDR_CON:
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK, DPI_RGB565_DDR_CON);
> +		break;

This goes here...

	case MTK_DPI_RGB888_DDR_CON:
> +	default:
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_FORMAT_MASK, DPI_RGB888_DDR_CON);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
> +
>   static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
>   				  bool assert)
>   {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 59117d970daf..b85f66db33e1 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -9,6 +9,13 @@
>   enum mtk_ddp_comp_id;
>   struct device;
>   
> +enum mtk_dpi_out_format_con {
> +	MTK_DPI_RGB888_SDR_CON,
> +	MTK_DPI_RGB888_DDR_CON,
> +	MTK_DPI_RGB565_SDR_CON,
> +	MTK_DPI_RGB565_DDR_CON
> +};
> +
>   enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_AAL0,
>   	DDP_COMPONENT_AAL1,
> @@ -65,4 +72,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   			      enum mtk_ddp_comp_id cur,
>   			      enum mtk_ddp_comp_id next);
>   
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
> +
>   #endif /* __MTK_MMSYS_H */

