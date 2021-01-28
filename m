Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B6306FAD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE856E8EB;
	Thu, 28 Jan 2021 07:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52A5C6E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 07:39:26 +0000 (UTC)
X-UUID: 5ab0d80cf6a1473d88016470d4d4767f-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5Sfop1PtYGQUduRyL0SKK4UxMHpv4G8/L7ZQ91LlTok=; 
 b=YdrKKkQ4E8A0QUr7Q/gR/rA/wT9E2fYe9jmo8ofz1/64vV0rE3Iomv3EuA1mMJVvBPlIjq1CAK/5p0nPLA/NwG8io2mMC3ropOhcUnjgD1Fv8co5Z+ayjOpmZ2ZE90kE9YDc0GC/P04C/4A7tSyven+eg8c5tVnKGxbZT7hcWu8=;
X-UUID: 5ab0d80cf6a1473d88016470d4d4767f-20210128
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1987687882; Thu, 28 Jan 2021 15:39:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 15:39:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 15:39:12 +0800
Message-ID: <1611819552.16091.1.camel@mtksdaap41>
Subject: Re: [PATCH v11 4/9] drm/mediatek: add mtk_dither_set_common() function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 15:39:12 +0800
In-Reply-To: <20210128072802.830971-5-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-5-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 079BE8C6A619A54B65635DC05D10741DADDEA17ADE9AC0EA5D43112F5A34835F2000:8
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

On Thu, 2021-01-28 at 15:27 +0800, Hsin-Yi Wang wrote:
> Current implementation of mtk_dither_set() cast dev data to
> struct mtk_ddp_comp_dev. But other devices with different dev data
> would also call this function.
> 
> Separate necessary parameters out so other device components (dither,
> gamma) can call this function.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 25 +++++++++++++--------
>  2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 46d199b7b4a29..c50d5fc9fd349 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -17,6 +17,10 @@ void mtk_color_config(struct device *dev, unsigned int w,
>  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  void mtk_color_start(struct device *dev);
>  
> +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> +			   unsigned int bpc, unsigned int CFG,
> +			   struct cmdq_pkt *cmdq_pkt);
> +
>  void mtk_dpi_start(struct device *dev);
>  void mtk_dpi_stop(struct device *dev);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 7b5293429426d..53d25823a37cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -151,33 +151,40 @@ static void mtk_ddp_clk_disable(struct device *dev)
>  	clk_disable_unprepare(priv->clk);
>  }
>  
> -static void mtk_dither_set(struct device *dev, unsigned int bpc,
> -		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> -{
> -	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> +			   unsigned int bpc, unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> +{
>  	/* If bpc equal to 0, the dithering function didn't be enabled */
>  	if (bpc == 0)
>  		return;
>  
>  	if (bpc >= MTK_MIN_BPC) {
> -		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
> -		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
> +		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> +		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
>  		mtk_ddp_write(cmdq_pkt,
>  			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
>  			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
>  			      DITHER_NEW_BIT_MODE,
> -			      &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
> +			      cmdq_reg, regs, DISP_DITHER_15);
>  		mtk_ddp_write(cmdq_pkt,
>  			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
>  			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
>  			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
>  			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> -			      &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
> -		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
> +			      cmdq_reg, regs, DISP_DITHER_16);
> +		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, cmdq_reg, regs, CFG);
>  	}
>  }
>  
> +static void mtk_dither_set(struct device *dev, unsigned int bpc,
> +		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, CFG, cmdq_pkt);
> +}
> +
>  static void mtk_od_config(struct device *dev, unsigned int w,
>  			  unsigned int h, unsigned int vrefresh,
>  			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
