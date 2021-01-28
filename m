Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8E2306C54
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 05:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1489F6E1F5;
	Thu, 28 Jan 2021 04:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 122616E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:39:26 +0000 (UTC)
X-UUID: afd8b3a6c81349ff9dd899a845fd7306-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uGuQXo0nW5O+T24o3iGb5azbkRv5Uvu1w62Cl/E1ZV4=; 
 b=n+xVLo9+Xjv+3ab7ohdxJPB6QeZodUWiwe0QzNnK3xicikxTiplqDBFQFMHT9b3KDrbwJNkSHkNMdRTKUJ05DG9qRXYKFMtcDb1r1n2FqJTa86MmxMFTx+LD7EvY+VsWSO7qy4owUzkjLmoKaDDsTm7k/KaT9D78HhKjvG2STdE=;
X-UUID: afd8b3a6c81349ff9dd899a845fd7306-20210128
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 483608009; Thu, 28 Jan 2021 12:39:22 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 12:39:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 12:39:13 +0800
Message-ID: <1611808753.19104.2.camel@mtksdaap41>
Subject: Re: [PATCH v10 4/9] drm/mediatek: generalize mtk_dither_set() function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 12:39:13 +0800
In-Reply-To: <20210127045422.2418917-5-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-5-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2CBAB08F8393E6009EF02E9C4BAE18DDBE683539EF00AE0CC0DA31C1C09ABFBB2000:8
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
> There may be data structure other than mtk_ddp_comp_dev that would call
> mtk_dither_set(), so use regs as parameter instead of device.

You does not change the interface of mtk_dither_set(). You move the
common part in mtk_dither_set() to a new function which could be called
by another caller.

Regards,
CK.

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
