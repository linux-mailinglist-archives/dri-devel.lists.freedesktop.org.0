Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CC25ED94
	for <lists+dri-devel@lfdr.de>; Sun,  6 Sep 2020 12:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154256E153;
	Sun,  6 Sep 2020 10:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2127C6E153
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Sep 2020 10:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 42110FB03;
 Sun,  6 Sep 2020 12:28:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6es4sdGsHemK; Sun,  6 Sep 2020 12:28:20 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2FBF445B81; Sun,  6 Sep 2020 12:28:20 +0200 (CEST)
Date: Sun, 6 Sep 2020 12:28:20 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
Subject: Re: [PATCH 3/5] drm/bridge: nwl-dsi: Add support for clock-drop-level
Message-ID: <20200906102820.GA3472@bogon.m.sigxcpu.org>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
 <1598613212-1113-4-git-send-email-robert.chiras@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598613212-1113-4-git-send-email-robert.chiras@oss.nxp.com>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,
On Fri, Aug 28, 2020 at 02:13:30PM +0300, Robert Chiras (OSS) wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> The clock-drop-level is needed in order to add more blanking space needed
> by DSI panels when sending DSI commands. One level is the equivalent of
> phy_ref rate from the PLL rate. Since the PLL rate is targeted as highest
> possible, each level should not get the crtc_clock too low, compared to
> the actual clock.

Did you check whether this is only needed during panel prepare (when the
image sequence is being sent)? I wonder if this is an artifact of the
driver sending pixel data too early - and if it's not whether we have
something else wrong so that we need to have a longer blanking period
with some panels?

Cheers,
 -- Guido

> 
> Example for a clock of 132M, with "clock-drop-level = <1>" in dts file
> will result in a crtc_clock of 129M, using the following logic:
> - video_pll rate to provide both phy_ref rate of 24M and pixel-clock
>   of 132M is 1056M (divisor /43 for phy_ref and /8 for pixel-clock)
> - from this rate, we subtract the equivalent of phy_ref (24M) but
>   keep the same divisor. This way, the video_pll rate will be 1056 - 24
> = 1032M.
> - new pixel-clock will be: 1032 / 8 = 129M
> 
> For a "clock-drop-level = <2>", new pixel-clock will be:
> (1056 - (24 * 2)) / 8 = 1008 / 8 = 126M
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 1228466..ac4aa0a 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -142,6 +142,7 @@ struct nwl_dsi {
>  
>  	struct nwl_dsi_transfer *xfer;
>  	struct list_head valid_modes;
> +	u32 clk_drop_lvl;
>  };
>  
>  static const struct regmap_config nwl_dsi_regmap_config = {
> @@ -842,13 +843,14 @@ static unsigned long nwl_dsi_get_lcm(unsigned long a, unsigned long b)
>  
>  	return ((unsigned long long)a * b) / gcf;
>  }
> -
>  /*
>   * This function tries to adjust the crtc_clock for a DSI device in such a way
>   * that the video pll will be able to satisfy both Display Controller pixel
>   * clock (feeding out DPI interface) and our input phy_ref clock.
> + * Also, the DC pixel clock must be lower than the actual clock in order to
> + * have enough blanking space to send DSI commands, if the device is a panel.
>   */
> -static void nwl_dsi_setup_pll_config(struct mode_config *config)
> +static void nwl_dsi_setup_pll_config(struct mode_config *config, u32 lvl)
>  {
>  	unsigned long pll_rate;
>  	int div;
> @@ -908,7 +910,6 @@ static void nwl_dsi_setup_pll_config(struct mode_config *config)
>  	}
>  }
>  
> -
>  /*
>   * This function will try the required phy speed for current mode
>   * If the phy speed can be achieved, the phy will save the speed
> @@ -1103,7 +1104,7 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  
>  	pll_rate = config->pll_rates[config->phy_rate_idx];
>  	if (dsi->pll_clk && !pll_rate)
> -		nwl_dsi_setup_pll_config(config);
> +		nwl_dsi_setup_pll_config(config, dsi->clk_drop_lvl);
>  
>  	return MODE_OK;
>  }
> @@ -1248,6 +1249,7 @@ static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
>  static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
>  {
>  	struct platform_device *pdev = to_platform_device(dsi->dev);
> +	struct device_node *np = dsi->dev->of_node;
>  	struct clk *clk;
>  	void __iomem *base;
>  	int ret;
> @@ -1364,6 +1366,8 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
>  		return PTR_ERR(dsi->rst_dpi);
>  	}
>  
> +	of_property_read_u32(np, "fsl,clock-drop-level", &dsi->clk_drop_lvl);
> +
>  	INIT_LIST_HEAD(&dsi->valid_modes);
>  
>  	return 0;
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
