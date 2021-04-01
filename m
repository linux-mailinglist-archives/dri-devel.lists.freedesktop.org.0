Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC8350C6D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 04:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BDA6EC0F;
	Thu,  1 Apr 2021 02:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 01 Apr 2021 02:13:22 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B30C16EC0F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:22 +0000 (UTC)
X-UUID: 47acad642a104fb2a14041a079cb813c-20210401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xxoJj4PzGeFeHxkVicdKTYcSt15G5RUjI0591TbB/Mc=; 
 b=dvMoHBxp2+B60fJvac56osF3A+YFYzNYeApi6qe6NeBGp/h0I4cdCDUIvvHT84Aob9riMX78N+DmGDJ+9LYvYsmCdTKjgg0ARPvyaEnhrP2SVbehPeM5Bo3TAF4WP3i4DNDgYINdmmsDpwp9t+oVPjoAvgtlk3L8RJzlDqEYLlU=;
X-UUID: 47acad642a104fb2a14041a079cb813c-20210401
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1636523368; Thu, 01 Apr 2021 10:08:13 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Apr 2021 10:08:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Apr 2021 10:08:12 +0800
Message-ID: <1617242892.14305.5.camel@mtksdaap41>
Subject: Re: [PATCH 3/3] drm/mediatek: dpi: add bus format negociation
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Thu, 1 Apr 2021 10:08:12 +0800
In-Reply-To: <20210330155330.28759-4-jitao.shi@mediatek.com>
References: <20210330155330.28759-1-jitao.shi@mediatek.com>
 <20210330155330.28759-4-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 rex-bc.chen@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jitao:

On Tue, 2021-03-30 at 23:53 +0800, Jitao Shi wrote:
> Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negociate
> the possible output and input formats for the current mode and monitor,
> and use the negotiated formats in a basic atomic_check callback.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 96 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 91 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 87bb27649c4c..4e45d1b01b0c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -81,6 +81,8 @@ struct mtk_dpi {
>  	struct pinctrl *pinctrl;
>  	struct pinctrl_state *pins_gpio;
>  	struct pinctrl_state *pins_dpi;
> +	unsigned int in_bus_format;
> +	unsigned int out_bus_format;

Why do you keep these two value? You does not use them.

>  	bool ddr_edge_sel;
>  	int refcount;
>  };
> @@ -534,6 +536,92 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	return 0;
>  }
>  
> +#define MAX_OUTPUT_SEL_FORMATS	2
> +
> +static u32 *mtk_dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					unsigned int *num_output_fmts)
> +{
> +	struct drm_display_mode *mode = &crtc_state->mode;
> +	u32 *output_fmts;
> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
> +
> +	*num_output_fmts = 0;
> +
> +	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
> +			      GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	/* Default 8bit RGB fallback */
> +	if (dpi->conf->dual_edge) {
> +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_2X12_LE;
> +		output_fmts[1] =  MEDIA_BUS_FMT_RGB888_2X12_BE;

So mt8183 does not support MEDIA_BUS_FMT_RGB888_1X24?

> +		*num_output_fmts = 2;
> +	} else {
> +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_1X24;
> +		*num_output_fmts = 1;
> +	}
> +
> +	return output_fmts;
> +}
> +
> +#define MAX_INPUT_SEL_FORMATS	1
> +
> +static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	return input_fmts;
> +}
> +
> +static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
> +{
> +	struct mtk_dpi *dpi = bridge->driver_private;
> +
> +	dpi->out_bus_format = bridge_state->output_bus_cfg.format;
> +
> +	dpi->in_bus_format = bridge_state->input_bus_cfg.format;
> +
> +	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> +		bridge_state->input_bus_cfg.format,
> +		bridge_state->output_bus_cfg.format);
> +
> +	if (dpi->out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_LE ||
> +	    dpi->out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_BE) {

I think you could remove this 'if' checking.

Regards,
CK.

> +		dpi->ddr_edge_sel =
> +			(dpi->out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_LE) ?
> +			 true : false;
> +	}
> +
> +	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> +	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> +	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> +	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> +
> +	return 0;
> +}
> +
>  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>  				 enum drm_bridge_attach_flags flags)
>  {
> @@ -572,6 +660,9 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
>  	.mode_set = mtk_dpi_bridge_mode_set,
>  	.disable = mtk_dpi_bridge_disable,
>  	.enable = mtk_dpi_bridge_enable,
> +	.atomic_check = mtk_dpi_bridge_atomic_check,
> +	.atomic_get_output_bus_fmts = mtk_dpi_bridge_atomic_get_output_bus_fmts,
> +	.atomic_get_input_bus_fmts = mtk_dpi_bridge_atomic_get_input_bus_fmts,
>  };
>  
>  static void mtk_dpi_start(struct mtk_ddp_comp *comp)
> @@ -621,11 +712,6 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>  		goto err_cleanup;
>  	}
>  
> -	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> -	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> -	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> -
>  	return 0;
>  
>  err_cleanup:

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
