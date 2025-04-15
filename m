Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05DA8A8F2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 22:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD5110E37F;
	Tue, 15 Apr 2025 20:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="O3GVqXD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32110E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 20:11:51 +0000 (UTC)
Message-ID: <1bf43164-e6de-445f-9c3d-94d69a149a66@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1744747904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RabZih8waE5zBMPNF2lBOJUi8w/qOpEgWhUZo/pD2tQ=;
 b=O3GVqXD9iOIsI52flwOjSVur5HU3PgOU5fbpc57OxHmva1NCjRiLS3V/gZndAcPFdSz0hH
 +3TID8Ieq7Ss4fSV6mO6ilT29CisQEvnPNElZ/+7NU9iJd3ZXH6cfIAsamwuiabctOjntG
 vY9f2nSjYZMsUyFy/Moiy45pVBhNhl0=
Date: Wed, 16 Apr 2025 01:40:51 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v3 13/17] drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
 <20250414-cdns-dsi-impro-v3-13-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250414-cdns-dsi-impro-v3-13-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi Tomi,

On 14/04/25 16:41, Tomi Valkeinen wrote:
> The driver tries to calculate the value for REG_WAKEUP_TIME. However,
> the calculation itself is not correct, and to add on it, the resulting
> value is almost always larger than the field's size, so the actual
> result is more or less random.>
> According to the docs, figuring out the value for REG_WAKEUP_TIME
> requires HW characterization and there's no way to have a generic
> algorithm to come up with the value. That doesn't help at all...
> 
> However, we know that the value must be smaller than the line time, and,
> at least in my understanding, the proper value for it is quite small.
> Testing shows that setting it to 1/10 of the line time seems to work
> well. All video modes from my HDMI monitor work with this algorithm.
> 
> Hopefully we'll get more information on how to calculate the value, and
> we can then update this.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 182845c54c3d..fb0623d3f854 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -786,7 +786,13 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>  
>  	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
>  					    phy_cfg->hs_clk_rate);
> -	reg_wakeup = (phy_cfg->hs_prepare + phy_cfg->hs_zero) / tx_byte_period;

I think the primary point of failure in the original calculation is due
to fact that the hs_prepare and hs_zero are defined in picoseconds (ps),
and the tx_byte_period is in nanoseconds (ns) as evident by the usage of
NSEC_PER_SEC macro.

The resulting tx_by_period is 1000 times smaller, and the reg_wakeup - a
1000 times larger. =)

Further, the TRM does indeed mention that some characterization is
required to fine tune the exact reg_wakeup value, but it ends up giving
a vague-ish formula -

-> reg_wakeup_time = wakeup_time_dsi + wakeup_time_cl + wakeup_time_dl +
		     (hs_host_eot × 4 / lane_nb)

I think the characterization may only be required for the
wakeup_time_dsi component. The existing formula in the driver (after
corrected for time unit) is the wakeup_time_dl component. wakeup_time_cl
seems to be a range of constants, which the phy-core is auto-settling on
defaults. The document never specifically mentions "hs_host_eot" other
than the equation, but on the off-chance it is same as phy_cfg->eot,
then that's 0 and avoidable.

> +
> +	/*
> +	 * Estimated time [in clock cycles] to perform LP->HS on D-PHY.
> +	 * It is not clear how to calculate this, so for now,
> +	 * set it to 1/10 of the total number of clocks in a line.
> +	 */
> +	reg_wakeup = dsi_cfg.htotal / nlanes / 10;
>  	writel(REG_WAKEUP_TIME(reg_wakeup) | REG_LINE_DURATION(tmp),
>  	       dsi->regs + VID_DPHY_TIME);
>  
> 

-- 
Regards
Aradhya

