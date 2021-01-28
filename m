Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B8306FE4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2386A6E8E7;
	Thu, 28 Jan 2021 07:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C83B16E8E7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 07:44:03 +0000 (UTC)
X-UUID: f6042306bb49404a8f74f8844c73edd6-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5vHOnzu1Slh2QZItzOh3bY2TFXG15jjC2a9A0egvloA=; 
 b=KNoxHWZV+416mP3el6eosNWasj2VwUlFuxfHhHQXv+TQXaeS89oxzN8D5lxmGIBzsAHy8Lu1zWn1gofzW3zFpY+20MqMwbBK61OLHq7HAYCwsnTbnybQ9EAtl4JQ4rPaq4K52U2+54ZnEmO8w9PbF+egE3VYJlfSh1d/w5iNzq4=;
X-UUID: f6042306bb49404a8f74f8844c73edd6-20210128
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 732297563; Thu, 28 Jan 2021 15:42:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 15:42:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 15:42:46 +0800
Message-ID: <1611819766.16091.4.camel@mtksdaap41>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 15:42:46 +0800
In-Reply-To: <20210128072802.830971-8-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8A70314F22D8F0A6B6BFCADD8C97819AA697AC672BFA54AF2FF1F0D0FF62D6932000:8
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> for 5 or 6 bpc panel, we need enable dither function
> to improve the display quality
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 8173f709272be..e85625704d611 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -53,7 +53,9 @@
>  #define DITHER_EN				BIT(0)
>  #define DISP_DITHER_CFG				0x0020
>  #define DITHER_RELAY_MODE			BIT(0)
> +#define DITHER_ENGINE_EN			BIT(1)
>  #define DISP_DITHER_SIZE			0x0030
> +#define DITHER_REG(idx)				(0x100 + (idx) * 4)
>  
>  #define LUT_10BIT_MASK				0x03ff
>  
> @@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> +	bool enable = false;
> +
> +	/* default value for dither reg 5 to 14 */
> +	const u32 dither_setting[] = {
> +		0x00000000, /* 5 */
> +		0x00003002, /* 6 */
> +		0x00000000, /* 7 */
> +		0x00000000, /* 8 */
> +		0x00000000, /* 9 */
> +		0x00000000, /* 10 */
> +		0x00000000, /* 11 */
> +		0x00000011, /* 12 */
> +		0x00000000, /* 13 */
> +		0x00000000, /* 14 */

Could you explain what is this?

> +	};
> +
> +	if (bpc == 5 || bpc == 6) {
> +		enable = true;
> +		mtk_ddp_write(cmdq_pkt,
> +			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> +			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> +			      DITHER_NEW_BIT_MODE,
> +			      &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> +		mtk_ddp_write(cmdq_pkt,
> +			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> +			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> +			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> +			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),

This result in 0x50505050, but previous version is 0x50504040, so this
version is correct and previous version is incorrect?

Regards,
CK

> +			      &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> +	}
> +
> +
> +	if (enable) {
> +		u32 idx;
> +
> +		for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> +			mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> +				      DITHER_REG(idx + 5));
> +	}
> +
>  	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> -	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
>  }
>  
>  static void mtk_dither_start(struct device *dev)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
