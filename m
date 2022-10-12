Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964625FC50A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB35A10E441;
	Wed, 12 Oct 2022 12:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CF410E441
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 12:09:23 +0000 (UTC)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D02B84D3;
 Wed, 12 Oct 2022 14:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665576561;
 bh=tpLq+kprIoOVWlbrGY2+d9G3Qq2Gp2E1+oAzuiC1GWc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fRxxCC9N3nRA46kkcotY/dNRIyonbkR1tjDF/W37jLFCmqtihofHtxiokLdM+2u1o
 wYYwqkBqUx/ZtRZCOFiphso5Fnf5pdb12wSm7QwyT5cc37NfiSrmVPSCgCTPACPi+G
 TIIVT69ZG/U0pXv0nVrpZI709JIcw1dqpaS/QFRU=
Message-ID: <eae03891-c814-87fd-d1a6-099b855ca7fb@ideasonboard.com>
Date: Wed, 12 Oct 2022 15:09:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH v5 3/6] drm/tidss: Add support for AM625 DSS
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
 <20220928175223.15225-4-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220928175223.15225-4-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 20:52, Aradhya Bhatia wrote:
> Add support for the DSS controller on TI's new AM625 SoC in the tidss
> driver.
> 
> The first video port (VP0) in am625-dss can output OLDI signals through
> 2 OLDI TXes. A 3rd port has been added with "DISPC_VP_OLDI" bus type.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 61 ++++++++++++++++++++++++++++-
>   drivers/gpu/drm/tidss/tidss_dispc.h |  3 ++
>   drivers/gpu/drm/tidss/tidss_drv.c   |  1 +
>   3 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index dd3c6a606ae2..34f0da4bb3e3 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -93,6 +93,7 @@ const struct dispc_features dispc_k2g_feats = {
>   	.common_regs = tidss_k2g_common_regs,
>   
>   	.num_vps = 1,
> +	.num_max_ports = 1,
>   	.vp_name = { "vp1" },
>   	.ovr_name = { "ovr1" },
>   	.vpclk_name =  { "vp1" },
> @@ -168,6 +169,7 @@ const struct dispc_features dispc_am65x_feats = {
>   	.common_regs = tidss_am65x_common_regs,
>   
>   	.num_vps = 2,
> +	.num_max_ports = 2,
>   	.vp_name = { "vp1", "vp2" },
>   	.ovr_name = { "ovr1", "ovr2" },
>   	.vpclk_name =  { "vp1", "vp2" },
> @@ -257,6 +259,7 @@ const struct dispc_features dispc_j721e_feats = {
>   	.common_regs = tidss_j721e_common_regs,
>   
>   	.num_vps = 4,
> +	.num_max_ports = 4,
>   	.vp_name = { "vp1", "vp2", "vp3", "vp4" },
>   	.ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
>   	.vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
> @@ -275,6 +278,57 @@ const struct dispc_features dispc_j721e_feats = {
>   	.vid_order = { 1, 3, 0, 2 },
>   };
>   
> +const struct dispc_features dispc_am625_feats = {
> +	.max_pclk_khz = {
> +		[DISPC_VP_DPI] = 165000,
> +		[DISPC_VP_OLDI] = 165000,
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
> +	.subrev = DISPC_AM625,
> +
> +	.common = "common",
> +	.common_regs = tidss_am65x_common_regs,
> +
> +	.num_vps = 2,
> +	/* note: the 3rd port is not representative of a 3rd pipeline */
> +	.num_max_ports = 3,
> +	.vp_name = { "vp1", "vp2" },
> +	.ovr_name = { "ovr1", "ovr2" },
> +	.vpclk_name =  { "vp1", "vp2" },
> +	.vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI, DISPC_VP_OLDI },

Here, for example, we have an issue with the VP vs port. vp_bus_type is 
of size TIDSS_MAX_PORTS (VPs), but you're using it for output ports. If 
we did not have J7, which has 4 VPs, we'd have an overflow bug here.

The meaning of vp_sub_type also becomes a bit unclear. I guess it's 
rather "output_port_bus_type"?

  Tomi

