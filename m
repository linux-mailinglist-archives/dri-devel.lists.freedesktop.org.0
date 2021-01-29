Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612C308342
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 02:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E156E2E3;
	Fri, 29 Jan 2021 01:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C5F06E2E3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:33:09 +0000 (UTC)
X-UUID: 0ae9d5946d4046ae93f30ae54c3f474b-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=osPAg0K5Yd7X9cjShUvPGC/GtiMhGLI3vpW3QQq8WXs=; 
 b=SVbp7fctsNo7VFTjJqTqn78oe51H5KAUusyw1m52NIs+N/2N9YjYM/NQqd0jfwnBv67qgdLa1Blkzbt70bLt8z8HRpZjfndb0/kSaIdqHBYRwTFEAk3z/boc52W5XqumjhhYghTm+4Ysx3djUOVCzYS9rEm/N9GT9loVjV+HEH4=;
X-UUID: 0ae9d5946d4046ae93f30ae54c3f474b-20210129
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 639592366; Fri, 29 Jan 2021 09:33:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 09:33:02 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 09:33:02 +0800
Message-ID: <1611883982.5226.12.camel@mtksdaap41>
Subject: Re: [PATCH v12 6/8] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 09:33:02 +0800
In-Reply-To: <20210128112314.1304160-7-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61173972B03CFC5DDB5831DC8F9D30A79FD4418A4F9F31FD79A0881E77BA28132000:8
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

On Thu, 2021-01-28 at 19:23 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> for 5 or 6 bpc panel, we need enable dither function
> to improve the display quality
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index ac2cb25620357..6c8f246380a74 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -53,6 +53,7 @@
>  #define DITHER_EN				BIT(0)
>  #define DISP_DITHER_CFG				0x0020
>  #define DITHER_RELAY_MODE			BIT(0)
> +#define DITHER_ENGINE_EN			BIT(1)
>  #define DISP_DITHER_SIZE			0x0030
>  
>  #define LUT_10BIT_MASK				0x03ff
> @@ -314,9 +315,19 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>  			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +	bool enable = (bpc == 5 || bpc == 6);

I strongly believe that dither function in dither is identical to the
one in gamma and od, and in mtk_dither_set_common(), 'bpc >=
MTK_MIN_BPC' is valid, so I believe we need not to limit bpc to 5 or 6.
But we should consider the case that bpc is invalid in
mtk_dither_set_common(). Invalid case in gamma and od use different way
to process. For gamma, dither is default relay mode, so invalid bpc
would do nothing in mtk_dither_set_common() and result in relay mode.
For od, it set to relay mode first, them invalid bpc would do nothing in
mtk_dither_set_common() and result in relay mode. I would like dither,
gamma and od to process invalid bpc in the same way. One solution is to
set relay mode in mtk_dither_set_common() for invalid bpc.

Regards,
CK

>  
> -	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> -	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> +	if (enable) {
> +		mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
> +				      DISP_DITHER_CFG, DITHER_ENGINE_EN,
> +				      cmdq_pkt);
> +	} else {
> +		mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
> +			      priv->regs, DISP_DITHER_CFG);
> +	}
> +
> +	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +		      DISP_DITHER_SIZE);
>  }
>  
>  static void mtk_dither_start(struct device *dev)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
