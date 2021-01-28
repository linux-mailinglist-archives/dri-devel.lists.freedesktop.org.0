Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F3306D2D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 07:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEBE8914C;
	Thu, 28 Jan 2021 06:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 334656E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 06:01:19 +0000 (UTC)
X-UUID: dd134fe4b4b44e07bd9b2520f7e93c9d-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7QDImCt5+7DsXFqewuf7SP758fb7EaUZc14iGwpvOW4=; 
 b=MPG6B6AmYAq6XixUwzjw/cE2w/HImb3AY7X5dZfzsGyE5G3OaOGoT9jq17NRjefSoht0NkU3FGvsfdoaaOVO7i/B8C7wQzQronQu7ZzPdsR92lMSW+ZehxhUIJcwNB9kXOtSf0qkgpB3ciyAmJhyuPWew9mBwE22i8Ngq1xFwp8=;
X-UUID: dd134fe4b4b44e07bd9b2520f7e93c9d-20210128
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 368407118; Thu, 28 Jan 2021 14:01:13 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 14:01:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 14:01:09 +0800
Message-ID: <1611813669.28312.5.camel@mtksdaap41>
Subject: Re: [PATCH v10 7/9] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 14:01:09 +0800
In-Reply-To: <20210127045422.2418917-8-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-8-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9AC874471A0D8550FCAE5680D29E0B57033CD9A5CB477339768C90370D8C92B12000:8
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> for 5 or 6 bpc panel, we need enable dither function
> to improve the display quality
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 37 ++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 8173f709272be..ee54505412dcd 100644
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
> @@ -313,8 +315,41 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> +	bool enable = true;
> +
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
> +	if (bpc == 6) {
> +		mtk_ddp_write(cmdq_pkt, 0x40400001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> +		mtk_ddp_write(cmdq_pkt, 0x40404040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> +	} else if (bpc == 5) {
> +		mtk_ddp_write(cmdq_pkt, 0x50500001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> +		mtk_ddp_write(cmdq_pkt, 0x50504040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));

This looks very similar to the code in mtk_dither_set(), could you
symbolize this magic number like mtk_dither_set()?

Regards,
CK

> +	} else {
> +		enable = false;
> +	}
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
