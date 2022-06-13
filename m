Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB08547F56
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 08:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E337D10E1AB;
	Mon, 13 Jun 2022 06:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AECE10E222
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:05:52 +0000 (UTC)
X-UUID: 026c566412a9405d94655abfa0feb386-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:3d246b70-29b7-43a2-8be8-403b47c5f172, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:fd8f7e37-84c0-4f9a-9fbd-acd4a0e9ad0f,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 026c566412a9405d94655abfa0feb386-20220613
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 819150509; Mon, 13 Jun 2022 14:05:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 13 Jun 2022 14:05:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 14:05:46 +0800
Message-ID: <85102b2a8abeac8719ffdb2a1ec1c6463e91ddd7.camel@mediatek.com>
Subject: Re: [PATCH v10 14/21] drm/mediatek: dpi: Add dpintf support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <granquet@baylibre.com>
Date: Mon, 13 Jun 2022 14:05:45 +0800
In-Reply-To: <60d33448-1cc9-c662-167b-10c1f9660545@wanadoo.fr>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-15-granquet@baylibre.com>
 <60d33448-1cc9-c662-167b-10c1f9660545@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, deller@gmx.de, kishon@ti.com,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, msp@baylibre.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-02 at 07:48 +0200, Christophe JAILLET wrote:
> Le 23/05/2022 à 12:47, Guillaume Ranquet a écrit :
> > dpintf is the displayport interface hardware unit. This unit is
> > similar
> > to dpi and can reuse most of the code.
> > 
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >   - Some features/functional components are not available for
> > dpintf
> >     which are now excluded from code execution once is_dpintf is
> > set
> >   - dpintf can and needs to choose between different clockdividers
> > based
> >     on the clockspeed. This is done by choosing a different clock
> > parent.
> >   - There are two additional clocks that need to be managed. These
> > are
> >     only set for dpintf and will be set to NULL if not supplied.
> > The
> >     clk_* calls handle these as normal clocks then.
> >   - Some register contents differ slightly between the two
> > components. To
> >     work around this I added register bits/masks with a DPINTF_
> > prefix
> >     and use them where different.
> > 
> > Based on a separate driver for dpintf created by
> > Jason-JH.Lin <jason-jh.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > .
> > 
> > Signed-off-by: Markus Schneider-Pargmann <
> > msp-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Guillaume Ranquet <
> > granquet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c          | 126
> > +++++++++++++++++---
> >   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  35 ++++++
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   8 ++
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
> >   include/linux/soc/mediatek/mtk-mmsys.h      |   4 +-
> >   6 files changed, 159 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index eb969c5c5c2e..763bfb700135 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -71,6 +71,7 @@ struct mtk_dpi {
> >   	void __iomem *regs;
> >   	struct device *dev;
> >   	struct clk *engine_clk;
> > +	struct clk *dpi_ck_cg;
> >   	struct clk *pixel_clk;
> >   	struct clk *tvd_clk;
> >   	int irq;
> > @@ -126,6 +127,7 @@ struct mtk_dpi_conf {
> >   	const u32 *output_fmts;
> >   	u32 num_output_fmts;
> >   	bool is_ck_de_pol;
> > +	bool is_dpintf;
> >   	bool swap_input_support;
> >   	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> > (no shift) */
> >   	u32 dimension_mask;
> > @@ -438,6 +440,8 @@ static void mtk_dpi_power_off(struct mtk_dpi
> > *dpi)
> >   	mtk_dpi_disable(dpi);
> >   	clk_disable_unprepare(dpi->pixel_clk);
> >   	clk_disable_unprepare(dpi->engine_clk);
> > +	clk_disable_unprepare(dpi->dpi_ck_cg);
> > +	clk_disable_unprepare(dpi->tvd_clk);
> >   }
> >   
> >   static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > @@ -447,12 +451,24 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >   	if (++dpi->refcount != 1)
> >   		return 0;
> >   
> 
> Hi,
> 
> belwo the error handling path looks odd. (both where we goto, and
> the 
> order of the clk_disable_unprepare() in the error handling path.
> 
> just my 2c,
> 
> CJ
> 

Hello Christophe,

Thanks for your review.
I will fix this order in enxt version.

Thanks

BRs,
Bo-Chen

> > +	ret = clk_prepare_enable(dpi->tvd_clk);
> > +	if (ret) {
> > +		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n",
> > ret);
> > +		goto err_pixel;
> > +	}
> > +
> >   	ret = clk_prepare_enable(dpi->engine_clk);
> >   	if (ret) {
> >   		dev_err(dpi->dev, "Failed to enable engine clock:
> > %d\n", ret);
> >   		goto err_refcount;
> >   	}
> >   
> > +	ret = clk_prepare_enable(dpi->dpi_ck_cg);
> > +	if (ret) {
> > +		dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock:
> > %d\n", ret);
> > +		goto err_ck_cg;
> > +	}
> > +
> >   	ret = clk_prepare_enable(dpi->pixel_clk);
> >   	if (ret) {
> >   		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n",
> > ret);
> > @@ -466,6 +482,8 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >   	return 0;
> >   
> >   err_pixel:
> > +	clk_disable_unprepare(dpi->dpi_ck_cg);
> > +err_ck_cg:
> >   	clk_disable_unprepare(dpi->engine_clk);
> >   err_refcount:
> >   	dpi->refcount--;
> 
> [...]
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

