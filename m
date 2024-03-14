Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A487BB03
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 11:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072F310FA1C;
	Thu, 14 Mar 2024 10:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bjILxDdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5054810FA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710411050;
 bh=U4YEsnxniAk2SJLiG1F83BQacHJwGqbY26ZK4ZuBGU4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bjILxDdcv8hqfkJ3jPKQcKll9Dhmzpmz4gtJDn+MDmhHnhkt6dtxbf92y4n13yFy6
 Xbgn5Q0F1C4rQoBoyU1zmgLanTjYlWCJrf9/S/tz/OHuCx7tV4qQtphxDWDsqIfcXK
 GgUCZfb57loUs9n9Xin8Jtbb67xTi6oUKf4IsW+6g1VOdw/XhKiaT7YNWZRDdExadv
 Mfm43/FafPrjrMf/C/Vhl0E7vI9+XvfL1xWsuyCqAJrsQH7VAzPQshcgE7Gz+qqDlN
 LVc7gE3bPRqpoFKavWy7XVCctJqSkEtb9QC4O4MLV0lxT8WV+jM/qXBTSB8kLQRBjM
 KZxdHsKvARF5A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A20D137820A3;
 Thu, 14 Mar 2024 10:10:49 +0000 (UTC)
Message-ID: <b7addbd1-d199-4734-9db6-d7dbc3a7f7d9@collabora.com>
Date: Thu, 14 Mar 2024 11:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mediatek: dsi: Add dsi per-frame lp code for mt8188
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240314094238.3315-1-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240314094238.3315-1-shuijing.li@mediatek.com>
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

Il 14/03/24 10:41, Shuijing Li ha scritto:
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
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 100 +++++++++++++++++++++++++++++
>   1 file changed, 100 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index a2fdfc8ddb15..e6f4807c8711 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -83,6 +83,7 @@
>   #define DSI_HSA_WC		0x50
>   #define DSI_HBP_WC		0x54
>   #define DSI_HFP_WC		0x58
> +#define DSI_BLLP_WC		0x5C
>   
>   #define DSI_CMDQ_SIZE		0x60
>   #define CMDQ_SIZE			0x3f
> @@ -180,6 +181,7 @@ struct mtk_dsi_driver_data {
>   	bool has_shadow_ctl;
>   	bool has_size_ctl;
>   	bool cmdq_long_packet_ctl;
> +	bool support_per_frame_lp;
>   };
>   
>   struct mtk_dsi {
> @@ -516,6 +518,103 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>   			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
>   	}
>   
> +	if (dsi->driver_data->support_per_frame_lp) {

This really looks like a good candidate to fit in a function on its own...

> +		unsigned int lpx = 0, da_hs_exit = 0, da_hs_prep = 0, da_hs_trail = 0;
> +		unsigned int da_hs_zero = 0, ps_wc = 0, hs_vb_ps_wc = 0;
> +		u32 bllp_wc, bllp_en, v_active_roundup, hstx_cklp_wc;
> +		u32 hstx_cklp_wc_max, hstx_cklp_wc_min;
> +
> +		da_hs_trail = (readl(dsi->regs + DSI_PHY_TIMECON0) >> 24) & 0xff;
> +		bllp_en = (readl(dsi->regs + DSI_TXRX_CTRL) >> 7) & 0x1;

(somewhere: #define HSTX_BLLP_EN BIT(7))

u32 timecon0, txrx_ctrl;

timecon0 = readl(....DSI_PHY_TIMECON0);
txrx_ctrl = readl(.....);

da_hs_trail = FIELD_GET(HS_TRAIL, timecon0);
bllp_en = FIELD_GET(HSTX_BLLP_EN, txrx_ctrl);

> +		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
> +			horizontal_sync_active_byte =
> +				(vm->hsync_len * dsi_tmp_buf_bpp - 10);
> +			horizontal_backporch_byte =
> +				(vm->hback_porch * dsi_tmp_buf_bpp - 10);
> +			horizontal_frontporch_byte =
> +				(vm->hfront_porch * dsi_tmp_buf_bpp - 12);
> +
> +			ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
> +			v_active_roundup = (32 + horizontal_sync_active_byte +
> +				horizontal_backporch_byte + ps_wc +
> +				horizontal_frontporch_byte) % dsi->lanes;
> +			if (v_active_roundup)
> +				horizontal_backporch_byte = horizontal_backporch_byte +
> +					dsi->lanes - v_active_roundup;
> +			hstx_cklp_wc_min = (DIV_ROUND_UP((12 + 2 + 4 +

Please document those "magic numbers": why is this 12 + 2 + 4 ?
What is 12? what is 2? what is 4?

> +				horizontal_sync_active_byte), dsi->lanes) + da_hs_trail + 1)
> +				* dsi->lanes / 6 - 1;
> +			hstx_cklp_wc_max = (DIV_ROUND_UP((20 + 6 + 4 +
> +				horizontal_sync_active_byte + horizontal_backporch_byte +
> +				ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
> +		} else {
> +			horizontal_sync_active_byte = vm->hsync_len * dsi_tmp_buf_bpp - 4;
> +
> +			horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
> +				dsi_tmp_buf_bpp - 10;
> +			hstx_cklp_wc_min = (DIV_ROUND_UP(4, dsi->lanes) + da_hs_trail + 1)
> +				* dsi->lanes / 6 - 1;
> +
> +			if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> +				ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
> +				bllp_wc = readl(dsi->regs + DSI_BLLP_WC) & 0xfff;

Please use bitfield macros here as well.

> +				horizontal_frontporch_byte = (vm->hfront_porch *
> +					dsi_tmp_buf_bpp - 18);
> +
> +				v_active_roundup = (28 + horizontal_backporch_byte + ps_wc +
> +					horizontal_frontporch_byte + bllp_wc) % dsi->lanes;
> +				if (v_active_roundup)
> +					horizontal_backporch_byte = horizontal_backporch_byte +
> +					dsi->lanes - v_active_roundup;
> +				if (bllp_en) {
> +					hstx_cklp_wc_max = (DIV_ROUND_UP((16 + 6 + 4 +
> +						horizontal_backporch_byte + bllp_wc + ps_wc),
> +						dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
> +				} else {
> +					hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
> +						horizontal_backporch_byte + bllp_wc + ps_wc),
> +						dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
> +				}
> +			} else {
> +				ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
> +				horizontal_frontporch_byte = (vm->hfront_porch *
> +					dsi_tmp_buf_bpp - 12);
> +
> +				v_active_roundup = (22 + horizontal_backporch_byte + ps_wc +
> +					horizontal_frontporch_byte) % dsi->lanes;
> +				if (v_active_roundup)
> +					horizontal_backporch_byte = horizontal_backporch_byte +
> +					dsi->lanes - v_active_roundup;
> +
> +				hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
> +					horizontal_backporch_byte + ps_wc),
> +					dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
> +			}
> +		}
> +		hstx_cklp_wc = (readl(dsi->regs + DSI_HSTX_CKL_WC) >> 2) & 0x3fff;

same here

> +		if (hstx_cklp_wc <= hstx_cklp_wc_min ||
> +			hstx_cklp_wc >= hstx_cklp_wc_max) {
> +			hstx_cklp_wc = (hstx_cklp_wc_max / 2) << 2;

and same here... and everywhere else.

> +			writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
> +		}
> +		hstx_cklp_wc = hstx_cklp_wc >> 2;
> +		if (hstx_cklp_wc <= hstx_cklp_wc_min ||
> +			hstx_cklp_wc >= hstx_cklp_wc_max) {
> +			DRM_WARN("Wrong setting of hstx_ckl_wc\n");
> +		}
> +
> +		lpx = readl(dsi->regs + DSI_PHY_TIMECON0) & 0xff;
> +		da_hs_exit = (readl(dsi->regs + DSI_PHY_TIMECON1) >> 24) & 0xff;
> +		da_hs_prep = (readl(dsi->regs + DSI_PHY_TIMECON0) >> 8) & 0xff;
> +		da_hs_zero = (readl(dsi->regs + DSI_PHY_TIMECON0) >> 16) & 0xff;
> +		ps_wc = readl(dsi->regs + DSI_PSCTRL) & 0x7fff;
> +		hs_vb_ps_wc = ps_wc -
> +			(lpx + da_hs_exit + da_hs_prep + da_hs_zero + 2)
> +			* dsi->lanes;
> +		horizontal_frontporch_byte = (1 << 31)
> +			| (hs_vb_ps_wc << 16)
> +			| (horizontal_frontporch_byte);
> +	}
>   	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
>   	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>   	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> @@ -1246,6 +1345,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
>   	.has_shadow_ctl = true,
>   	.has_size_ctl = true,
>   	.cmdq_long_packet_ctl = true,
> +	.support_per_frame_lp = true,

Is this supported only on MT8188? Are you sure that MT8195 doesn't support that?

Regards,
Angelo

>   };
>   
>   static const struct of_device_id mtk_dsi_of_match[] = {


