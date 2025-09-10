Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4CB50F79
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3507210E876;
	Wed, 10 Sep 2025 07:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V+Yl7ejL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123C210E876
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:32:56 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D617815CD;
 Wed, 10 Sep 2025 09:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757489501;
 bh=kaGdOkum4VxJNgDecI3kCpUnC8nt+LPl8FizBkxbrDQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V+Yl7ejLfiPIYE9VBgRU7RqydnSAMThRHVMc+IaktSQo/exlniYy/lLM4SU6XEcFX
 Ij0PbHPMGZVht9SsDxh2AZ0+Dymj98lozmm81LNoprnxz14lWNhQIHcopmzlA06nFc
 EaAKPrt7uMJo7qsT9pXF3pzynzvaXYUAsR8aNnOI=
Message-ID: <5ddabd43-35a0-406e-bc4d-3878febd3341@ideasonboard.com>
Date: Wed, 10 Sep 2025 10:32:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock
 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250903161718.180488-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
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

On 03/09/2025 19:17, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add LPCLK clock handling to the RZ/G2L MIPI DSI driver to support proper
> DSI timing parameter configuration on RZ/V2H SoCs. While lpclk is present
> on both RZ/G2L and RZ/V2H SoCs, the RZ/V2H SoC specifically uses the lpclk
> rate to configure the DSI timing parameter ULPSEXIT.
> 
> Introduce a new lpclk field in the rzg2l_mipi_dsi structure and acquire
> the "lpclk" clock during probe to enable lpclk rate-based timing
> calculations on RZ/V2H while maintaining compatibility with RZ/G2L.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7->v8:
> - Updated commit message
> - Switched to use devm_clk_get() instead of devm_clk_get_optional()
>   as lpclk clock is available on all SoCs.
> 
> v6->v7:
> - New patch
> Note, this patch was previously part of series [0].
> [0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 3b52dfc0ea1e..bb03b49b1e85 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
>  	struct drm_bridge *next_bridge;
>  
>  	struct clk *vclk;
> +	struct clk *lpclk;
>  
>  	enum mipi_dsi_pixel_format format;
>  	unsigned int num_data_lanes;
> @@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>  
> +	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
> +	if (IS_ERR(dsi->lpclk))
> +		return PTR_ERR(dsi->lpclk);
> +
>  	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
>  	if (IS_ERR(dsi->rstc))
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi

