Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A337A4BEF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 17:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BAB10E072;
	Mon, 18 Sep 2023 15:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550BD10E072
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 15:23:41 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FB4F8A5F;
 Mon, 18 Sep 2023 17:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695050524;
 bh=eUeGACMHyZhM2g7i0GeSAmr3+zMDlgtDBBJJ5VCvzd8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZGKbN7IwyXjMBQs0fHMLzXURSn1AGbY+U+0UN5o/ZUHVgnvRnUrTD7xGHSCoaIY2E
 BSXk0K3+hGkPNfQZ15HzjPwTA/QERvQD9Z95swmRFptXk4GKdpkw2atxYDnNI7bhzw
 gJ3gqRrzVQvT64Ov395rz6OfHKPjQq9PsB/NpLlA=
Message-ID: <a8c5d3a8-5c1f-7b37-5f5f-41773d66b7e3@ideasonboard.com>
Date: Mon, 18 Sep 2023 18:23:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] drivers/tidss: Add support for AM62A7 DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230818142124.8561-1-a-bhatia1@ti.com>
 <20230818142124.8561-3-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230818142124.8561-3-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/08/2023 17:21, Aradhya Bhatia wrote:
> Add support for the DSS controller on TI's AM62A7 SoC in the tidss
> driver.
> 
> This contrller has 2 video pipelines that can render 2 video planes on

"controller".

> over a screen, using the overlay managers. The output of the DSS comes
> from video port 2 (VP2) in the form of RGB88 DPI signals, while the VP1
> is tied off inside the SoC.

If the VP1 is tied off, I think we should somehow mark it in the feats 
below. Maybe just a comment, or perhaps a new DISPC_VP_* flag.

  Tomi

> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
> Notes:
>         Changes from V1:
>         * Correctly sort DISPC_AM62A7 macro after DISPC_AM625.
> 
>   drivers/gpu/drm/tidss/tidss_dispc.c | 53 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
>   drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
>   3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 9d9dee7abaef..5539ddb7f338 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -322,6 +322,54 @@ const struct dispc_features dispc_am625_feats = {
>   	.vid_order = { 1, 0 },
>   };
>   
> +const struct dispc_features dispc_am62a7_feats = {
> +	.max_pclk_khz = {
> +		[DISPC_VP_DPI] = 165000,
> +	},
> +
> +	.scaling = {
> +		.in_width_max_5tap_rgb = 1280,
> +		.in_width_max_3tap_rgb = 2560,
> +		.in_width_max_5tap_yuv = 2560,
> +		.in_width_max_3tap_yuv = 4096,
> +		.upscale_limit = 16,
> +		.downscale_limit_5tap = 4,
> +		.downscale_limit_3tap = 2,
> +		/*
> +		 * The max supported pixel inc value is 255. The value
> +		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
> +		 * The maximum bpp of all formats supported by the HW
> +		 * is 8. So the maximum supported xinc value is 32,
> +		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
> +		 */
> +		.xinc_max = 32,
> +	},
> +
> +	.subrev = DISPC_AM62A7,
> +
> +	.common = "common",
> +	.common_regs = tidss_am65x_common_regs,
> +
> +	.num_vps = 2,
> +	.vp_name = { "vp1", "vp2" },
> +	.ovr_name = { "ovr1", "ovr2" },
> +	.vpclk_name =  { "vp1", "vp2" },
> +	.vp_bus_type = { DISPC_VP_INTERNAL, DISPC_VP_DPI },
> +
> +	.vp_feat = { .color = {
> +			.has_ctm = true,
> +			.gamma_size = 256,
> +			.gamma_type = TIDSS_GAMMA_8BIT,
> +		},
> +	},
> +
> +	.num_planes = 2,
> +	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
> +	.vid_name = { "vid", "vidl1" },
> +	.vid_lite = { false, true, },
> +	.vid_order = { 1, 0 },
> +};
> +
>   static const u16 *dispc_common_regmap;
>   
>   struct dss_vp_data {
> @@ -824,6 +872,7 @@ dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
>   	case DISPC_K2G:
>   		return dispc_k2g_read_and_clear_irqstatus(dispc);
>   	case DISPC_AM625:
> +	case DISPC_AM62A7:
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
>   		return dispc_k3_read_and_clear_irqstatus(dispc);
> @@ -840,6 +889,7 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
>   		dispc_k2g_set_irqenable(dispc, mask);
>   		break;
>   	case DISPC_AM625:
> +	case DISPC_AM62A7:
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
>   		dispc_k3_set_irqenable(dispc, mask);
> @@ -1331,6 +1381,7 @@ void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
>   					x, y, layer);
>   		break;
>   	case DISPC_AM625:
> +	case DISPC_AM62A7:
>   	case DISPC_AM65X:
>   		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
>   					  x, y, layer);
> @@ -2250,6 +2301,7 @@ static void dispc_plane_init(struct dispc_device *dispc)
>   		dispc_k2g_plane_init(dispc);
>   		break;
>   	case DISPC_AM625:
> +	case DISPC_AM62A7:
>   	case DISPC_AM65X:
>   	case DISPC_J721E:
>   		dispc_k3_plane_init(dispc);
> @@ -2357,6 +2409,7 @@ static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
>   		dispc_k2g_vp_write_gamma_table(dispc, hw_videoport);
>   		break;
>   	case DISPC_AM625:
> +	case DISPC_AM62A7:
>   	case DISPC_AM65X:
>   		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
>   		break;
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 33ac5ad7a423..7f203f83559b 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -60,6 +60,7 @@ enum dispc_vp_bus_type {
>   enum dispc_dss_subrevision {
>   	DISPC_K2G,
>   	DISPC_AM625,
> +	DISPC_AM62A7,
>   	DISPC_AM65X,
>   	DISPC_J721E,
>   };
> @@ -88,6 +89,7 @@ struct dispc_features {
>   
>   extern const struct dispc_features dispc_k2g_feats;
>   extern const struct dispc_features dispc_am625_feats;
> +extern const struct dispc_features dispc_am62a7_feats;
>   extern const struct dispc_features dispc_am65x_feats;
>   extern const struct dispc_features dispc_j721e_feats;
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 4d063eb9cd0b..edf69d020544 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -231,6 +231,7 @@ static void tidss_shutdown(struct platform_device *pdev)
>   static const struct of_device_id tidss_of_table[] = {
>   	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
>   	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
> +	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
>   	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
>   	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
>   	{ }

