Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E22B19D53
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 10:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FA710E40E;
	Mon,  4 Aug 2025 08:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WwrJapm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7F810E40E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 08:06:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77356601F8;
 Mon,  4 Aug 2025 08:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9675CC4CEE7;
 Mon,  4 Aug 2025 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754294800;
 bh=LJsP3POugebwTfDcQDDyey0X+IAXbHHrUgRPsb8MIDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WwrJapm8clxrbORWct74JESkw++nKBRizntME8+LH/8scwh8qPZGh+oXekE2a/hNq
 SC3dSBFesoKAwNeaW8ZYadGbrIor3viKN9Bh4vxmLItcbN/ELSJ7d9UHWKqE8TvI/C
 9SFH8AcFibn24rFyfIkxiKqIuwVLhghG7Eq7jsifJZpTG8pfs8jUq853vMf5ACThK7
 pGNJI/I8osPmv8XtGBvr+qB/GoyRn/no/CSJnTuHk7F8wwFKBdkGIGOtMra7vTxqA8
 cICuFZ9Gww8udA9nGwQBME2mWs2lul3h86ztNqtwjDP1DppAs1TiwefeTWlDjHfcKc
 SB2rP3vFLiPNw==
Date: Mon, 4 Aug 2025 10:06:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Benoit Parrot <bparrot@ti.com>,
 Lee Jones <lee@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, thomas.petazzoni@bootlin.com,
 Jyri Sarha <jsarha@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/tidss: Fix sampling edge configuration
Message-ID: <20250804-tuscan-woodpecker-from-jupiter-9d290f@kuoka>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
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

On Wed, Jul 30, 2025 at 07:02:47PM +0200, Louis Chauvet wrote:
> As stated in the AM62x Technical Reference Manual (SPRUIV7B), the data
> sampling edge needs to be configured in two distinct registers: one in the
> TIDSS IP and another in the memory-mapped control register modules. Since
> the latter is not within the same address range, a phandle to a syscon
> device is used to access the regmap.
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> ---
> 
> Cc: stable@vger.kernel.org

Please read docs how to add stable tags.

> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index c0277fa36425ee1f966dccecf2b69a2d01794899..65ca7629a2e75437023bf58f8a1bddc24db5e3da 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -498,6 +498,7 @@ struct dispc_device {
>  	const struct dispc_features *feat;
>  
>  	struct clk *fclk;
> +	struct regmap *clk_ctrl;
>  
>  	bool is_enabled;
>  
> @@ -1267,6 +1268,11 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
>  		       FLD_VAL(mode->vdisplay - 1, 27, 16));
>  
>  	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
> +
> +	if (dispc->clk_ctrl) {
> +		regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 : 0x000);
> +		regmap_update_bits(dispc->clk_ctrl, 0, 0x200, rf ? 0x200 : 0x000);
> +	}
>  }
>  
>  void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
> @@ -3012,6 +3018,14 @@ int dispc_init(struct tidss_device *tidss)
>  
>  	dispc_init_errata(dispc);
>  
> +	dispc->clk_ctrl = syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
> +								   "ti,clk-ctrl");
> +	if (IS_ERR(dispc->clk_ctrl)) {
> +		r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
> +				  "DISPC: syscon_regmap_lookup_by_phandle failed.\n");
> +		return r;

This breaks ABI. Commit msg mentions the reason but without
justification - was everything broken? Nothing was working? Was it ever
tested?

And anyway ABI impact must be clearly documented.


Best regards,
Krzysztof

