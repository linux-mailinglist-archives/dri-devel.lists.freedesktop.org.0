Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345EA9446F2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 10:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A00B10E8BF;
	Thu,  1 Aug 2024 08:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UZVL5nTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436C110E8BF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722502046;
 bh=ZvL5JK0xoQbNLJLpgSh3UzGq8mYLVNf9h1k9sBmtknM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UZVL5nTSZP7MXOjJSoPiRGk224xui/tSYUmB2gCqnCETSqFaSH2wgN1oTNPMRYucp
 uagZ/3lB6xvM6J+2QCAWeoPSFfZvW90+0ZhiT0XOSdk+pF8ee9b8vH23AgnOLzmwVE
 hSuN1+988xl59cqjv7GEF/cdjRT7lqxv4F9GFbXKiqaZHKgCYWPA6IEIXcv6TL3CY6
 iLnsHjIb343/ooNNgGVN0RgTS2ndkLu/dKMPk9MMzGIexwmrQvHsMBDa9/Bx0wOHix
 fd/0zj3Fg2JfDKcjscqFIMPIToX91dEdoIaJbJlU9N/QfMwn2glAaK5F/uJylLXFOw
 GLV6ueH8mRjbg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C7E13780520;
 Thu,  1 Aug 2024 08:47:25 +0000 (UTC)
Message-ID: <950ec184-859b-4b30-9d87-8cd40005f87a@collabora.com>
Date: Thu, 1 Aug 2024 10:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/mediatek: dsi: Add dsi per-frame lp code for mt8188
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240801081144.22372-1-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240801081144.22372-1-shuijing.li@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/08/24 10:11, Shuijing Li ha scritto:
> Adding the per-frame lp function of mt8188, which can keep HFP in HS and
> reduce the time required for each line to enter and exit low power.
> Per Frame LP:
>    |<----------One Active Frame-------->|
> --______________________________________----___________________
>    ^HSA+HBP^^RGB^^HFP^^HSA+HBP^^RGB^^HFP^    ^HSA+HBP^^RGB^^HFP^
> 
> Per Line LP:
>    |<---------------One Active Frame----------->|
> --______________--______________--______________----______________
>    ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^    ^HSA+HBP^^RGB^
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
> Changes in v4:
> Drop the code related to bllp_en and bllp_wc, adjust ps_wc to dsi->vm.hactive *
> dsi_buf_bpp.
> Changes in v3:
> Use function in bitfield.h and get value from phy timing, per suggestion
> from previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240424091639.22759-1-shuijing.li@mediatek.com/
> Changes in v2:
> Use bitfield macros and add new function for per prame lp and improve
> the format, per suggestion from previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240314094238.3315-1-shuijing.li@mediatek.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 210 ++++++++++++++++++++++-------
>   1 file changed, 163 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index b6e3c011a12d..4bda8fa17c3d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -88,12 +88,16 @@
>   #define DSI_HSA_WC		0x50
>   #define DSI_HBP_WC		0x54
>   #define DSI_HFP_WC		0x58
> +#define HFP_HS_EN		31

#define HFP_HS_VB_PS_WC	GENMASK(30, 16)
#define HFP_HS_EN	BIT(31)

> +#define HFP_HS_VB_PS_WC_SHIFT 16

...you don't need this definition

>   
>   #define DSI_CMDQ_SIZE		0x60
>   #define CMDQ_SIZE			0x3f
>   #define CMDQ_SIZE_SEL		BIT(15)
>   
>   #define DSI_HSTX_CKL_WC		0x64
> +#define HSTX_CKL_WC				GENMASK(15, 2)


> +#define HSTX_CKL_WC_SHIFT	2

This one is already defined in your GENMASK(...), and you should avoid having to
define that at all. Check below for a solution.

>   
>   #define DSI_RX_DATA0		0x74
>   #define DSI_RX_DATA1		0x78
> @@ -187,6 +191,7 @@ struct mtk_dsi_driver_data {
>   	bool has_shadow_ctl;
>   	bool has_size_ctl;
>   	bool cmdq_long_packet_ctl;
> +	bool support_per_frame_lp;
>   };
>   
>   struct mtk_dsi {
> @@ -426,6 +431,112 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
>   	writel(ps_val, dsi->regs + DSI_PSCTRL);
>   }
>   
> +static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
> +{
> +	u32 horizontal_sync_active_byte;
> +	u32 horizontal_backporch_byte;
> +	u32 horizontal_frontporch_byte;
> +	u32 dsi_tmp_buf_bpp;
> +	unsigned int lpx, da_hs_exit, da_hs_prep, da_hs_trail;
> +	unsigned int da_hs_zero, ps_wc, hs_vb_ps_wc;
> +	u32 v_active_roundup, hstx_cklp_wc;
> +	u32 hstx_cklp_wc_max, hstx_cklp_wc_min;
> +	struct videomode *vm = &dsi->vm;
> +
> +	if (dsi->format == MIPI_DSI_FMT_RGB565)
> +		dsi_tmp_buf_bpp = 2;
> +	else
> +		dsi_tmp_buf_bpp = 3;
> +
> +	da_hs_trail = dsi->phy_timing.da_hs_trail;
> +	ps_wc = dsi->vm.hactive * dsi_tmp_buf_bpp;
> +
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
> +		horizontal_sync_active_byte =
> +			vm->hsync_len * dsi_tmp_buf_bpp - 10;
> +		horizontal_backporch_byte =
> +			vm->hback_porch * dsi_tmp_buf_bpp - 10;
> +		horizontal_frontporch_byte =
> +			vm->hfront_porch * dsi_tmp_buf_bpp - 12;
> +
> +		v_active_roundup = (32 + horizontal_sync_active_byte +
> +			horizontal_backporch_byte + ps_wc +
> +			horizontal_frontporch_byte) % dsi->lanes;
> +		if (v_active_roundup)
> +			horizontal_backporch_byte = horizontal_backporch_byte +
> +				dsi->lanes - v_active_roundup;
> +		hstx_cklp_wc_min = (DIV_ROUND_UP((12 + 2 + 4 +
> +			horizontal_sync_active_byte), dsi->lanes) + da_hs_trail + 1)
> +			* dsi->lanes / 6 - 1;
> +		hstx_cklp_wc_max = (DIV_ROUND_UP((20 + 6 + 4 +
> +			horizontal_sync_active_byte + horizontal_backporch_byte +
> +			ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
> +	} else {
> +		horizontal_sync_active_byte = vm->hsync_len * dsi_tmp_buf_bpp - 4;
> +
> +		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
> +			dsi_tmp_buf_bpp - 10;
> +		hstx_cklp_wc_min = (DIV_ROUND_UP(4, dsi->lanes) + da_hs_trail + 1)
> +			* dsi->lanes / 6 - 1;
> +
> +		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> +			horizontal_frontporch_byte = (vm->hfront_porch *
> +				dsi_tmp_buf_bpp - 18);
> +
> +			v_active_roundup = (28 + horizontal_backporch_byte + ps_wc +
> +				horizontal_frontporch_byte) % dsi->lanes;
> +			if (v_active_roundup)
> +				horizontal_backporch_byte = horizontal_backporch_byte +
> +				dsi->lanes - v_active_roundup;
> +
> +			hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
> +				horizontal_backporch_byte + ps_wc),
> +				dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
> +		} else {
> +			horizontal_frontporch_byte = (vm->hfront_porch *
> +				dsi_tmp_buf_bpp - 12);
> +
> +			v_active_roundup = (22 + horizontal_backporch_byte + ps_wc +
> +				horizontal_frontporch_byte) % dsi->lanes;
> +			if (v_active_roundup)
> +				horizontal_backporch_byte = horizontal_backporch_byte +
> +				dsi->lanes - v_active_roundup;
> +
> +			hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
> +				horizontal_backporch_byte + ps_wc),
> +				dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
> +		}
> +	}
> +	hstx_cklp_wc = FIELD_GET(HSTX_CKL_WC, readl(dsi->regs + DSI_HSTX_CKL_WC));
> +

Sorry, this snippet is ugly.

> +	if (hstx_cklp_wc <= hstx_cklp_wc_min ||
> +		hstx_cklp_wc >= hstx_cklp_wc_max) {
> +		hstx_cklp_wc = ((hstx_cklp_wc_min + hstx_cklp_wc_max) / 2) << HSTX_CKL_WC_SHIFT;
> +		writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
> +	}
> +	hstx_cklp_wc = hstx_cklp_wc >> HSTX_CKL_WC_SHIFT;
> +	if (hstx_cklp_wc <= hstx_cklp_wc_min ||
> +		hstx_cklp_wc >= hstx_cklp_wc_max) {
> +		DRM_WARN("Wrong setting of hstx_ckl_wc\n");
> +	}

.........

I can propose the following:

	if (hstx_cklp_wc <= hstx_cklp_wc_min || hstx_cklp_wc >= hstx_cklp_wc_max) {
		hstx_cklp_wc = ((hstx_cklp_wc_min + hstx_cklp_wc_max) / 2);

		/* Check if the new setting is valid */
		if (hstx_cklp_wc <= hstx_cklp_wc_min || hstx_cklp_wc >= hstx_cklp_wc_max)
			DRM_WARN("Wrong setting of hstx_ckl_wc\n");

		hstx_cklp_wc = FIELD_PREP(DSI_HSTX_CKL_WC, hstx_cklp_wc);
		writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
	}

.... and please remove the definition of HSTX_CKL_WC_SHIFT, as that is unused now.

> +
> +	lpx = dsi->phy_timing.lpx;
> +	da_hs_exit = dsi->phy_timing.da_hs_exit;
> +	da_hs_prep = dsi->phy_timing.da_hs_prepare;
> +	da_hs_zero = dsi->phy_timing.da_hs_zero;
> +
> +	hs_vb_ps_wc = ps_wc -
> +		(lpx + da_hs_exit + da_hs_prep + da_hs_zero + 2)
> +		* dsi->lanes;
> +	horizontal_frontporch_byte = (1 << HFP_HS_EN)
> +		| (hs_vb_ps_wc << HFP_HS_VB_PS_WC_SHIFT)
> +		| (horizontal_frontporch_byte);

horizontal_frontporch_byte = FIELD_PREP(HFP_HS_EN, 1) |
			     FIELD_PREP(HFP_HS_VB_PS_WC, hs_vb_ps_wc) |
			     horizontal_frontporch_byte;

> +
> +	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> +	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
> +	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> +}
> +
>   static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>   {
>   	u32 horizontal_sync_active_byte;
> @@ -449,57 +560,61 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>   	writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
>   	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
>   
> -	if (dsi->driver_data->has_size_ctl)
> -		writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
> -		       FIELD_PREP(DSI_WIDTH, vm->hactive),
> -		       dsi->regs + DSI_SIZE_CON);
> -
> -	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
> -
> -	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> -		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp - 10;
> -	else
> -		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
> -					    dsi_tmp_buf_bpp - 10;
> -
> -	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> -			  timing->da_hs_zero + timing->da_hs_exit + 3;
> -
> -	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
> -	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
> +	if (dsi->driver_data->support_per_frame_lp)

There's a code style issue. If you need braces for the else, you need to
add braces everywhere:


if (dsi->driver_data->support_per_frame_lp) {
	mtk_dsi_config_vdo_timing_per_frame_lp(dsi);
} else {
	......


Regards,
Angelo


