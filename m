Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AEC4CB53C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 04:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B4F10EE2A;
	Thu,  3 Mar 2022 03:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEB810ECEE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 03:09:11 +0000 (UTC)
X-UUID: 133d936a7f2d4e438bf40450ed05303c-20220303
X-UUID: 133d936a7f2d4e438bf40450ed05303c-20220303
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1448947605; Thu, 03 Mar 2022 11:09:04 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 11:09:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 11:09:03 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 11:09:02 +0800
Message-ID: <dab8913e9a50110fd13650e14f35f13a30239013.camel@mediatek.com>
Subject: Re: [PATCH v1,2/3] drm/mediatek: Add TOPCKGEN select mux control
 dpi_clk
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Date: Thu, 3 Mar 2022 11:09:17 +0800
In-Reply-To: <6db20053-71dc-d0e3-aac9-de5da1d7ba9e@collabora.com>
References: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
 <1645782833-27875-3-git-send-email-xinlei.lee@mediatek.com>
 <6db20053-71dc-d0e3-aac9-de5da1d7ba9e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-03-02 at 10:07 +0100, AngeloGioacchino Del Regno wrote:
> Il 25/02/22 10:53, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi_clk is controlled by the mux selected
> > by TOPCKGEN and APMIXEDSYS can support small resolution.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Hello Xinlei,
> 
> as it was pointed out by reviewers in the MT8195 DisplayPort series,
> that is
> adding the same logic that you are proposing in this patch, the clock
> parent
> selection should be performed by the clock drivers, I'd say in the
> callback
> .set_rate_and_parent(), and not by the mtk_dpi driver.
> 
> Please fix this in the proper drivers (clocks!) instead.
> 
> Thanks,
> Angelo
> 
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c | 38
> > ++++++++++++++++++++++++++----
> >   1 file changed, 34 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4554e2de1430..bad686817e29 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
> >   	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> >   };
> >   
> > +enum TVDPLL_CLK {
> > +	TVDPLL_PLL = 0,
> > +	TVDPLL_D2 = 2,
> > +	TVDPLL_D4 = 4,
> > +	TVDPLL_D8 = 8,
> > +	TVDPLL_D16 = 16,
> > +};
> > +
> >   struct mtk_dpi {
> >   	struct drm_encoder encoder;
> >   	struct drm_bridge bridge;
> > @@ -73,6 +81,7 @@ struct mtk_dpi {
> >   	struct clk *engine_clk;
> >   	struct clk *pixel_clk;
> >   	struct clk *tvd_clk;
> > +	struct clk *pclk_src[5];
> >   	int irq;
> >   	struct drm_display_mode mode;
> >   	const struct mtk_dpi_conf *conf;
> > @@ -459,6 +468,7 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >   	struct videomode vm = { 0 };
> >   	unsigned long pll_rate;
> >   	unsigned int factor;
> > +	struct clk *clksrc = NULL;
> >   
> >   	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
> >   	factor = dpi->conf->cal_factor(mode->clock);
> > @@ -473,11 +483,26 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >   
> >   	vm.pixelclock = pll_rate / factor;
> >   	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > -	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> > -		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > -	else
> > -		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> > +	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
> > +		if (factor == 8)
> > +			clksrc = dpi->pclk_src[2];
> > +		else if (factor == 4)
> > +			clksrc = dpi->pclk_src[1];
> > +		else
> > +			clksrc = dpi->pclk_src[1];
> > +		}
> > +	else {
> > +		if (factor == 8)
> > +			clksrc = dpi->pclk_src[3];
> > +		else if (factor == 4)
> > +			clksrc = dpi->pclk_src[2];
> > +		else
> > +			clksrc = dpi->pclk_src[2];
> > +	}
> >   
> > +	clk_prepare_enable(dpi->pixel_clk);
> > +	clk_set_parent(dpi->pixel_clk, clksrc);
> > +	clk_disable_unprepare(dpi->pixel_clk);
> >   
> >   	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
> >   
> > @@ -893,6 +918,11 @@ static int mtk_dpi_probe(struct
> > platform_device *pdev)
> >   		return ret;
> >   	}
> >   
> > +	dpi->pclk_src[1] = devm_clk_get_optional(dev, "tvdpll_d2");
> > +	dpi->pclk_src[2] = devm_clk_get_optional(dev, "tvdpll_d4");
> > +	dpi->pclk_src[3] = devm_clk_get_optional(dev, "tvdpll_d8");
> > +	dpi->pclk_src[4] = devm_clk_get_optional(dev, "tvdpll_d16");
> > +
> >   	dpi->irq = platform_get_irq(pdev, 0);
> >   	if (dpi->irq <= 0)
> >   		return -EINVAL;
> 
> 

Hi Angelo:

Thanks for your review, I would like to explain why I operate clk in
dpi driver.
A patch I mentioned on the cover: 
http://lists.infradead.org/pipermail/linux-mediatek/2016-May/005281.html
It contains instructions:

+ * The dpi0_sel clock should not propagate rate changes to its parent
+ * clock so the dpi driver can have full control over PLL and divider.

My understanding is that the clk driver will no longer perform the
set_rate_and_parent() operation on dpi_clk, but will hand over the
control to the dpi driver.
The current modification may be to synchronize the previous clk
modification.
Can we operate clk on dpi driver for this reson?

Best Regards!
xinlei

