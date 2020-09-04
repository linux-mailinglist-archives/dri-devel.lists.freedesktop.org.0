Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4E25E07E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 19:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1AD6EC88;
	Fri,  4 Sep 2020 17:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979DD6EC88
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 17:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D1CD6FB03;
 Fri,  4 Sep 2020 19:04:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzK3yQL7kUw2; Fri,  4 Sep 2020 19:04:49 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9C2FC45B81; Fri,  4 Sep 2020 19:04:48 +0200 (CEST)
Date: Fri, 4 Sep 2020 19:04:48 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
Subject: Re: [PATCH 1/5] drm/bridge: nwl-dsi: Add support for video_pll
Message-ID: <20200904170448.GA755526@bogon.m.sigxcpu.org>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
 <1598613212-1113-2-git-send-email-robert.chiras@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598613212-1113-2-git-send-email-robert.chiras@oss.nxp.com>
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
On Fri, Aug 28, 2020 at 02:13:28PM +0300, Robert Chiras (OSS) wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> This patch adds support for a new clock 'video_pll' in order to better
> set the video_pll clock to a clock-rate that satisfies a mode's clock.
> The video PLL, on i.MX8MQ, can drive both DC pixel-clock and DSI phy_ref
> clock. When used with a bridge that can drive multiple modes, like a DSI
> to HDMI bridge, the DSI can't be statically configured for a specific
> mode in the DTS file.
> So, this patch adds access to the video PLL inside the DSI driver, so
> that modes can be filtered-out if the required combination of phy_ref
> and pixel-clock can't be achieved using the video PLL.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 318 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index ce94f79..1228466 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -39,6 +39,20 @@
>  
>  #define NWL_DSI_MIPI_FIFO_TIMEOUT msecs_to_jiffies(500)
>  
> +/* Maximum Video PLL frequency: 1.2GHz */
> +#define MAX_PLL_FREQ 1200000000
> +
> +#define MBPS(x) ((x) * 1000000)
> +#define MIN_PHY_RATE MBPS(24)
> +#define MAX_PHY_RATE MBPS(30)
> +
> +/* Possible valid PHY reference clock rates*/

nitpick: missing ' ' at end of comment.

> +static u32 phyref_rates[] = {
> +	27000000,
> +	25000000,
> +	24000000,
> +};
> +
>  enum transfer_direction {
>  	DSI_PACKET_SEND,
>  	DSI_PACKET_RECEIVE,
> @@ -67,6 +81,17 @@ struct nwl_dsi_transfer {
>  	size_t rx_len; /* in bytes */
>  };
>  
> +struct mode_config {

Maybe use nwl_mode_config ? There's so much other mode_config around an
this makes it obvious it's driver specific.

> +	int				clock;
> +	int				crtc_clock;
> +	unsigned int			lanes;
> +	unsigned long			bitclock;
> +	unsigned long			phy_rates[3];
> +	unsigned long			pll_rates[3];
> +	int				phy_rate_idx;
> +	struct list_head		list;
> +};
> +
>  struct nwl_dsi {
>  	struct drm_bridge bridge;
>  	struct mipi_dsi_host dsi_host;
> @@ -101,6 +126,7 @@ struct nwl_dsi {
>  	struct clk *rx_esc_clk;
>  	struct clk *tx_esc_clk;
>  	struct clk *core_clk;
> +	struct clk *pll_clk;
>  	/*
>  	 * hardware bug: the i.MX8MQ needs this clock on during reset
>  	 * even when not using LCDIF.
> @@ -115,6 +141,7 @@ struct nwl_dsi {
>  	int error;
>  
>  	struct nwl_dsi_transfer *xfer;
> +	struct list_head valid_modes;
>  };
>  
>  static const struct regmap_config nwl_dsi_regmap_config = {
> @@ -778,6 +805,207 @@ static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)
>  	pm_runtime_put(dsi->dev);
>  }
>  
> +static unsigned long nwl_dsi_get_bit_clock(struct nwl_dsi *dsi,
> +		unsigned long pixclock, u32 lanes)
> +{
> +	int bpp;
> +
> +	if (lanes < 1 || lanes > 4)
> +		return 0;
> +
> +	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +	return (pixclock * bpp) / lanes;
> +}
> +
> +/*
> + * Utility function to calculate least commom multiple, using an
> improved

s/commom/common/

> + * version of the Euclidean algorithm for greatest common factor.
> + */
> +static unsigned long nwl_dsi_get_lcm(unsigned long a, unsigned long b)
> +{
> +	u32 gcf = 0; /* greatest common factor */
> +	unsigned long tmp_a = a;
> +	unsigned long tmp_b = b;
> +
> +	if (!a || !b)
> +		return 0;
> +
> +	while (tmp_a % tmp_b) {
> +		gcf = tmp_a % tmp_b;
> +		tmp_a = tmp_b;
> +		tmp_b = gcf;
> +	}
> +
> +	if (!gcf)
> +		return a;
> +
> +	return ((unsigned long long)a * b) / gcf;
> +}
> +
> +/*
> + * This function tries to adjust the crtc_clock for a DSI device in such a way
> + * that the video pll will be able to satisfy both Display Controller pixel
> + * clock (feeding out DPI interface) and our input phy_ref clock.
> + */
> +static void nwl_dsi_setup_pll_config(struct mode_config *config)
> +{
> +	unsigned long pll_rate;
> +	int div;
> +	size_t i, num_rates = ARRAY_SIZE(config->phy_rates);
> +
> +	config->crtc_clock = 0;
> +
> +	for (i = 0; i < num_rates; i++) {
> +		int crtc_clock;
> +
> +		if (!config->phy_rates[i])
> +			break;
> +		/*
> +		 * First, we need to check if phy_ref can actually be obtained
> +		 * from pixel clock. To do this, we check their lowest common
> +		 * multiple, which has to be in PLL range.
> +		 */
> +		pll_rate = nwl_dsi_get_lcm(config->clock, config->phy_rates[i]);
> +		if (pll_rate > MAX_PLL_FREQ) {
> +			/* Drop pll_rate to a realistic value */
> +			while (pll_rate > MAX_PLL_FREQ)
> +				pll_rate >>= 1;
> +			/* Make sure pll_rate can provide phy_ref rate */
> +			div = DIV_ROUND_UP(pll_rate, config->phy_rates[i]);
> +			pll_rate = config->phy_rates[i] * div;
> +		} else {
> +			/*
> +			 * Increase the pll rate to highest possible rate for
> +			 * better accuracy.
> +			 */
> +			while (pll_rate <= MAX_PLL_FREQ)
> +				pll_rate <<= 1;
> +			pll_rate >>= 1;
> +		}
> +
> +		/*
> +		 * Next, we need to tweak the pll_rate to a value that can also
> +		 * satisfy the crtc_clock.
> +		 */
> +		div = DIV_ROUND_CLOSEST(pll_rate, config->clock);
> +		if (lvl)
> +			pll_rate -= config->phy_rates[i] * lvl;

lvl gets never defined so it doesn't compile breaking bisection.

> +		crtc_clock = pll_rate / div;
> +		config->pll_rates[i] = pll_rate;
> +
> +		/*
> +		 * Pick a crtc_clock which is closest to pixel clock.
> +		 * Also, make sure that the pixel clock is a multiply of
> +		 * 50Hz.
> +		 */
> +		if (!(crtc_clock % 50) &&
> +		    abs(config->clock - crtc_clock) <
> +		    abs(config->clock - config->crtc_clock)) {
> +			config->crtc_clock = crtc_clock;
> +			config->phy_rate_idx = i;
> +		}
> +	}
> +}
> +
> +
> +/*
> + * This function will try the required phy speed for current mode
> + * If the phy speed can be achieved, the phy will save the speed
> + * configuration
> + */
> +static struct mode_config *nwl_dsi_mode_probe(struct nwl_dsi *dsi,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct device *dev = dsi->dev;
> +	struct mode_config *config;
> +	union phy_configure_opts phy_opts;
> +	unsigned long clock = mode->clock * 1000;
> +	unsigned long bit_clk = 0;
> +	unsigned long phy_rates[3] = {0};
> +	int match_rates = 0;
> +	u32 lanes = dsi->lanes;
> +	size_t i = 0, num_rates = ARRAY_SIZE(phyref_rates);
> +
> +	list_for_each_entry(config, &dsi->valid_modes, list)
> +		if (config->clock == clock)
> +			return config;
> +
> +	phy_mipi_dphy_get_default_config(clock,
> +			mipi_dsi_pixel_format_to_bpp(dsi->format),
> +			lanes, &phy_opts.mipi_dphy);
> +	phy_opts.mipi_dphy.lp_clk_rate = clk_get_rate(dsi->tx_esc_clk);
> +
> +	while (i < num_rates) {
> +		int ret;
> +
> +		bit_clk = nwl_dsi_get_bit_clock(dsi, clock, lanes);
> +
> +		clk_set_rate(dsi->pll_clk, phyref_rates[i] * 32);
> +		clk_set_rate(dsi->phy_ref_clk, phyref_rates[i]);
> +		ret = phy_validate(dsi->phy, PHY_MODE_MIPI_DPHY, 0, &phy_opts);
> +
> +		/* Pick the non-failing rate, and search for more */
> +		if (!ret) {
> +			phy_rates[match_rates++] = phyref_rates[i++];
> +			continue;
> +		}
> +
> +		if (match_rates)
> +			break;
> +
> +		/* Reached the end of phyref_rates, try another lane config */
> +		if ((i++ == num_rates - 1) && (--lanes > 2)) {
> +			i = 0;
> +			continue;
> +		}
> +	}
> +
> +	/*
> +	 * Try swinging between min and max pll rates and see what rate (in terms
> +	 * of kHz) we can custom use to get the required bit-clock.
> +	 */
> +	if (!match_rates) {
> +		int min_div, max_div;
> +		int bit_clk_khz;
> +
> +		lanes = dsi->lanes;
> +		bit_clk = nwl_dsi_get_bit_clock(dsi, clock, lanes);
> +
> +		min_div = DIV_ROUND_UP(bit_clk, MAX_PHY_RATE);
> +		max_div = DIV_ROUND_DOWN_ULL(bit_clk, MIN_PHY_RATE);
> +		bit_clk_khz = bit_clk / 1000;
> +
> +		for (i = max_div; i > min_div; i--) {
> +			if (!(bit_clk_khz % i)) {
> +				phy_rates[0] = bit_clk / i;
> +				match_rates = 1;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (!match_rates) {
> +		DRM_DEV_DEBUG_DRIVER(dev,
> +			"Cannot setup PHY for mode: %ux%u @%d kHz\n",
> +			mode->hdisplay,
> +			mode->vdisplay,
> +			mode->clock);
> +
> +		return NULL;
> +	}
> +
> +	config = devm_kzalloc(dsi->dev, sizeof(struct mode_config), GFP_KERNEL);
> +	config->clock = clock;
> +	config->lanes = lanes;
> +	config->bitclock = bit_clk;
> +	memcpy(&config->phy_rates, &phy_rates, sizeof(phy_rates));
> +	list_add(&config->list, &dsi->valid_modes);
> +
> +	return config;
> +}
> +
> +
>  static int nwl_dsi_get_dphy_params(struct nwl_dsi *dsi,
>  				   const struct drm_display_mode *mode,
>  				   union phy_configure_opts *phy_opts)
> @@ -809,6 +1037,38 @@ static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
>  				      const struct drm_display_mode *mode,
>  				      struct drm_display_mode *adjusted_mode)
>  {
> +	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
> +	struct mode_config *config;
> +	unsigned long pll_rate;
> +
> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Fixup mode:\n");
> +	drm_mode_debug_printmodeline(adjusted_mode);
> +
> +	config = nwl_dsi_mode_probe(dsi, adjusted_mode);

Since this ends up calling `clk_set_rate` doesn't this violate the
`Drivers MUST NOT touch any persistent state` rule of the fixup
function? So would it be better to teach the phy about it's possible
rates rather then NWL? I guess that get's tricky your clock-drop-level
is dependent on the phy rate later on.

> +	if (!config)
> +		return false;
> +
> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "lanes=%u, data_rate=%lu\n",
> +			     config->lanes, config->bitclock);
> +	if (config->lanes < 2 || config->lanes > 4)
> +		return false;
> +
> +	/* Max data rate for this controller is 1.5Gbps */
> +	if (config->bitclock > 1500000000)
> +		return false;
> +
> +	pll_rate = config->pll_rates[config->phy_rate_idx];
> +	if (dsi->pll_clk && pll_rate) {
> +		clk_set_rate(dsi->pll_clk, pll_rate);
> +		DRM_DEV_DEBUG_DRIVER(dsi->dev,
> +				     "Video pll rate: %lu (actual: %lu)",
> +				     pll_rate, clk_get_rate(dsi->pll_clk));
> +	}
> +	/* Update the crtc_clock to be used by display controller */
> +	if (config->crtc_clock)
> +		adjusted_mode->crtc_clock = config->crtc_clock / 1000;
> +
> +
>  	/* At least LCDIF + NWL needs active high sync */
>  	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>  	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> @@ -822,14 +1082,29 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  			  const struct drm_display_mode *mode)
>  {
>  	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
> -	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	struct mode_config *config;
> +	unsigned long pll_rate;
> +	int bit_rate;
>  
> -	if (mode->clock * bpp > 15000000 * dsi->lanes)
> +	bit_rate = nwl_dsi_get_bit_clock(dsi, mode->clock * 1000, dsi->lanes);
> +
> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Validating mode:");
> +	drm_mode_debug_printmodeline(mode);

These (and other locations) are a bit confusings since
`drm_mode_debug_printmodeline` uses DRM_DEBUG_KMS so if one only enabled
driver debugging (0x2) one gets: `Validating mode:` but then nothing.

> +
> +	if (bit_rate > MBPS(1500))
>  		return MODE_CLOCK_HIGH;
>  
> -	if (mode->clock * bpp < 80000 * dsi->lanes)
> +	if (bit_rate < MBPS(80))
>  		return MODE_CLOCK_LOW;
>  
> +	config = nwl_dsi_mode_probe(dsi, mode);
> +	if (!config)
> +		return MODE_NOCLOCK;
> +
> +	pll_rate = config->pll_rates[config->phy_rate_idx];
> +	if (dsi->pll_clk && !pll_rate)
> +		nwl_dsi_setup_pll_config(config);
> +
>  	return MODE_OK;
>  }
>  
> @@ -842,8 +1117,22 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>  	struct device *dev = dsi->dev;
>  	union phy_configure_opts new_cfg;
>  	unsigned long phy_ref_rate;
> +	struct mode_config *config;
>  	int ret;
>  
> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Setting mode:\n");
> +	drm_mode_debug_printmodeline(adjusted_mode);
> +
> +	config = nwl_dsi_mode_probe(dsi, adjusted_mode);
> +	/* New mode? This should NOT happen */
> +	if (!config) {
> +		DRM_DEV_ERROR(dsi->dev, "Unsupported mode provided:\n");
> +		drm_mode_debug_printmodeline(adjusted_mode);
> +		return;
> +	}
> +
> +	phy_ref_rate = config->phy_rates[config->phy_rate_idx];
> +	clk_set_rate(dsi->phy_ref_clk, phy_ref_rate);
>  	ret = nwl_dsi_get_dphy_params(dsi, adjusted_mode, &new_cfg);
>  	if (ret < 0)
>  		return;
> @@ -855,8 +1144,10 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>  	if (new_cfg.mipi_dphy.hs_clk_rate == dsi->phy_cfg.mipi_dphy.hs_clk_rate)
>  		return;
>  
> -	phy_ref_rate = clk_get_rate(dsi->phy_ref_clk);
> -	DRM_DEV_DEBUG_DRIVER(dev, "PHY at ref rate: %lu\n", phy_ref_rate);
> +	DRM_DEV_DEBUG_DRIVER(dev,
> +			     "PHY at ref rate: %lu (actual: %lu)\n",
> +			     phy_ref_rate, clk_get_rate(dsi->phy_ref_clk));
> +
>  	/* Save the new desired phy config */
>  	memcpy(&dsi->phy_cfg, &new_cfg, sizeof(new_cfg));
>  
> @@ -1014,6 +1305,12 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
>  	}
>  	dsi->tx_esc_clk = clk;
>  
> +	/* The video_pll clock is optional */
> +	clk = devm_clk_get(dsi->dev, "video_pll");

Using devm_clk_get_optional return NULL so we can return a proper error
on other failures.

> +	if (!IS_ERR(clk))
> +		dsi->pll_clk = clk;
> +
> +

Drop one empty line.
Cheers,
 -- Guido

>  	dsi->mux = devm_mux_control_get(dsi->dev, NULL);
>  	if (IS_ERR(dsi->mux)) {
>  		ret = PTR_ERR(dsi->mux);
> @@ -1066,6 +1363,9 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
>  			      PTR_ERR(dsi->rst_dpi));
>  		return PTR_ERR(dsi->rst_dpi);
>  	}
> +
> +	INIT_LIST_HEAD(&dsi->valid_modes);
> +
>  	return 0;
>  }
>  
> @@ -1184,6 +1484,14 @@ static int nwl_dsi_probe(struct platform_device *pdev)
>  static int nwl_dsi_remove(struct platform_device *pdev)
>  {
>  	struct nwl_dsi *dsi = platform_get_drvdata(pdev);
> +	struct mode_config *config;
> +	struct list_head *pos, *tmp;
> +
> +	list_for_each_safe(pos, tmp, &dsi->valid_modes) {
> +		config = list_entry(pos, struct mode_config, list);
> +		list_del(pos);
> +		devm_kfree(dsi->dev, config);
> +	}
>  
>  	nwl_dsi_deselect_input(dsi);
>  	mipi_dsi_host_unregister(&dsi->dsi_host);
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
