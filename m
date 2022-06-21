Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17353552D5D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 10:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1981126DC;
	Tue, 21 Jun 2022 08:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BF21126DC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 08:46:59 +0000 (UTC)
X-UUID: ec8775581713496298f9786b6bb3f920-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:49656c31-03b5-4dac-916c-58014802bba8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:b14ad71, CLOUDID:dfd9a12d-1756-4fa3-be7f-474a6e4be921,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: ec8775581713496298f9786b6bb3f920-20220621
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1524695954; Tue, 21 Jun 2022 16:46:55 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 21 Jun 2022 16:46:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 16:46:53 +0800
Message-ID: <7a581fd59a68a292a0acc0c17173cc3ae62612f0.camel@mediatek.com>
Subject: Re: [PATCH v12 10/14] drm/mediatek: dpi: Add dpintf support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 21 Jun 2022 16:46:53 +0800
In-Reply-To: <0862532b568f7e13b89b6537928efd518a2971a3.camel@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
 <20220620121028.29234-11-rex-bc.chen@mediatek.com>
 <0862532b568f7e13b89b6537928efd518a2971a3.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-21 at 10:32 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > dpintf is the displayport interface hardware unit. This unit is
> > similar
> > to dpi and can reuse most of the code.
> > 
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >  - 4 pixels for one round for dp_intf while dpi is 1 pixel for one
> > round.
> >    Therefore, pixel clock and timing parameter should be divided by
> > 4
> > for
> >    dp_intf.
> >  - Some features/functional components are not available for dpintf
> >    which are now excluded from code execution once is_dpintf is
> > set.
> >    The main difference is some parts of hardware design between
> > dp_intf
> >    and dpi.
> >  - Some register contents differ slightly between the two
> > components.
> > To
> >    work around this I added register bits/masks with a DPINTF_
> > prefix
> >    and use them where different.
> > 
> > Based on a separate driver for dpintf created by
> > Jitao shi <jitao.shi@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Modify reviewers' comments.]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c          | 65
> > +++++++++++++++++++--
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     | 13 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  3 +
> >  5 files changed, 82 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index e186870ba3bc..2717b1741b7a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
> >  	const u32 *output_fmts;
> >  	u32 num_output_fmts;
> >  	bool is_ck_de_pol;
> > +	bool is_dpintf;
> >  	bool swap_input_support;
> >  	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> > (no shift) */
> >  	u32 dimension_mask;
> > @@ -513,6 +514,14 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >  	pll_rate = clk_get_rate(dpi->tvd_clk);
> >  
> >  	vm.pixelclock = pll_rate / factor;
> > +
> > +	/*
> > +	 * For dp_intf, we need to divide clock by 4 because it's
> > +	 * 4 pixels for one round while dpi is 1 pixel for one round.
> > +	 */
> > +	if (dpi->conf->is_dpintf)
> > +		vm.pixelclock /= 4;
> 
> I this this should define dpi->conf->round_pixels rather than dpi-
> > conf->is_dpintf.

ok, I will use this config and drop is_dpintf.

> > +
> >  	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> >  	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> >  		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > @@ -534,6 +543,17 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >  	hsync.sync_width = vm.hsync_len;
> >  	hsync.back_porch = vm.hback_porch;
> >  	hsync.front_porch = vm.hfront_porch;
> > +
> > +	/*
> > +	 * For dp_intf, we need to divide everything by 4 because it's
> > +	 * 4 pixels for one round while dpi is 1 pixel for one round.
> > +	 */
> > +	if (dpi->conf->is_dpintf) {
> > +		hsync.sync_width = vm.hsync_len / 4;
> > +		hsync.back_porch = vm.hback_porch / 4;
> > +		hsync.front_porch = vm.hfront_porch / 4;
> > +	}
> 
> Ditto.
> 
> > +
> >  	hsync.shift_half_line = false;
> >  	vsync_lodd.sync_width = vm.vsync_len;
> >  	vsync_lodd.back_porch = vm.vback_porch;
> > @@ -575,11 +595,16 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >  	mtk_dpi_config_channel_limit(dpi);
> >  	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
> >  	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> > -	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> >  	mtk_dpi_config_color_format(dpi, dpi->color_format);
> > -	mtk_dpi_config_2n_h_fre(dpi);
> > -	mtk_dpi_dual_edge(dpi);
> > -	mtk_dpi_config_disable_edge(dpi);
> > +	if (dpi->conf->is_dpintf) {
> 
> Separate this to an independent patch and give a better config name
> rather than dpi->conf->is_dpintf.
> 

this is separate config.
I will modify like this:
add new config "input_2pixel" for input two pixels in this patch:
mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
			     DPINTF_INPUT_2P_EN);

and create another patch to add config "support_direct_pin"
this config is only used for dpi which could be directly connect to
pins while dp_intf is not.

+       if (dpi->conf->support_direct_pin) {
+               mtk_dpi_config_yc_map(dpi, dpi->yc_map);
+               mtk_dpi_config_2n_h_fre(dpi);
+               mtk_dpi_dual_edge(dpi);
+               mtk_dpi_config_disable_edge(dpi);
+       }

BRs,
Bo-Chen
> > +		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> > +			     DPINTF_INPUT_2P_EN);
> > +	} else {
> > +		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> > +		mtk_dpi_config_2n_h_fre(dpi);
> > +		mtk_dpi_dual_edge(dpi);
> > +		mtk_dpi_config_disable_edge(dpi);
> > +	}
> >  	mtk_dpi_sw_reset(dpi, false);
> >  
> >  	return 0;
> > @@ -817,6 +842,16 @@ static unsigned int
> > mt8183_calculate_factor(int
> > clock)
> >  		return 2;
> >  }
> >  
> 
> [snip]
> 
> >  
> >  #define EDGE_SEL_EN			BIT(5)
> >  #define H_FRE_2N			BIT(25)
> > +
> 
> This seems not related to dpintf support.
> 
> Regards,
> CK
> 
> >  #endif /* __MTK_DPI_REGS_H */
> > 
> 
> 

