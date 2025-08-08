Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E45B1E971
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0C910E1E5;
	Fri,  8 Aug 2025 13:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OB73HsHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37910E1E5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:47:13 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578DkmqU992990;
 Fri, 8 Aug 2025 08:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1754660808;
 bh=wTg4kG3CjTwaBrWnll3HIQP/TPmGxsMNV/xOfqXmXO4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=OB73HsHaP6lFvlDJMOV878MmQImc69xq7hPwAt38IUYsPc0sY5JAZ2pS7fIOzJli0
 68Z9aSSAvpIsxPBswgyVeotyVfr6xAgG2hvSg6HDHjgmyPoqvkGawc1/fkzQI7OLvl
 D/JsSjsN2Q+hBN4evRtAB8ofmriX8qTOMcW5tFY8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578DklxT1623098
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 8 Aug 2025 08:46:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 08:46:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 08:46:46 -0500
Received: from [10.249.145.16] ([10.249.145.16])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578DkXb43128040;
 Fri, 8 Aug 2025 08:46:35 -0500
Message-ID: <71ef3203-e11d-4244-8d2d-8e47e8ba6140@ti.com>
Date: Fri, 8 Aug 2025 19:16:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/tidss: Fix sampling edge configuration
To: Louis Chauvet <louis.chauvet@bootlin.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Sam Ravnborg" <sam@ravnborg.org>,
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>
CC: <thomas.petazzoni@bootlin.com>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <stable@vger.kernel.org>, <s-jain1@ti.com>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
Content-Language: en-US
From: devarsh <devarsht@ti.com>
In-Reply-To: <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Louis,

Thanks for the patch.

On 30/07/25 22:32, Louis Chauvet wrote:
> As stated in the AM62x Technical Reference Manual (SPRUIV7B), the data
> sampling edge needs to be configured in two distinct registers: one in the
> TIDSS IP and another in the memory-mapped control register modules.

I don't think AM62x is thee only one which requires this and on the
contrary not all SoCs require this extra setting. We had been waiting on
confirmations from hardware team and very recently they gave a list of
SoCs which require this, as per that I think we need to limit this to
AM62x and AM62A per current supported SoCs.

Swamil,
Please confirm on this and share if any additional details required here.

Regards
Devarsh

 Since
> the latter is not within the same address range, a phandle to a syscon
> device is used to access the regmap.
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> ---
> 
> Cc: stable@vger.kernel.org
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
> +	}
> +
>  	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
>  				      sizeof(*dispc->fourccs), GFP_KERNEL);
>  	if (!dispc->fourccs)
> 

