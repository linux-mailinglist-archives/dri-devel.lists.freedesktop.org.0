Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9DB12E95D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 18:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933336E120;
	Thu,  2 Jan 2020 17:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5310E6E120
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 17:27:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 58D1E80402;
 Thu,  2 Jan 2020 18:27:02 +0100 (CET)
Date: Thu, 2 Jan 2020 18:27:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] drm/panel: simple: Support reset GPIOs
Message-ID: <20200102172700.GA15341@ravnborg.org>
References: <20191224142134.22902-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224142134.22902-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P-IC7800AAAA:8
 a=QLuOc4X6XEWfbEXzOXoA:9 a=CjuIK1q_8ugA:10 a=d3PnA9EDa4IxuAV0gXij:22
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel

On Tue, Dec 24, 2019 at 03:21:34PM +0100, Miquel Raynal wrote:
> The panel common bindings provide a gpios-reset property. Let's
> support it in the simple driver.
> 
> Two fields are added to the panel description structure: the time to
> assert the reset and the time to wait right after before starting to
> interact with it in any manner. In case these default values are not
> filled but the GPIO is present in the DT, default values are applied.

Wehn we discussed this the last time you wrote:

"""
my hardware is:

LVDS IP <----------> LVDS to RGB bridge <------------> Panel

While there is a simple "RGB to LVDS" bridge driver, there is none
doing the work the other way around. In my case, the bridge has a reset
pin.

As until now there is no way to represent the "LVDS to RGB" bridge and
because the bindings already document such reset pin, I decided to add
support for it in the simple panel driver.
"""

Based on the information provided it seems that the correct way is to
add a "LVDS to RGB bridge" and then let the bridge handle the reset
functionality.

It is obviously much more code to do it this way but then
other panels using the same type of brigde have the
same functionality without adding bridge functionality to the panel.

	Sam

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes since v1:
> * Add two parameters in the panel description structure.
> * Ensure the reset is asserted the right amount of time and the
>   deasserted before continuing if a reset GPIO is given.
> 
>  drivers/gpu/drm/panel/panel-simple.c | 32 +++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 28fa6ba7b767..ac6f6b5d200d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -38,6 +38,9 @@
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_panel.h>
>  
> +#define MIN_DEFAULT_RESET_US 10
> +#define MIN_DEFAULT_WAIT_US 10
> +
>  /**
>   * @modes: Pointer to array of fixed modes appropriate for this panel.  If
>   *         only one mode then this can just be the address of this the mode.
> @@ -94,6 +97,10 @@ struct panel_desc {
>  
>  	u32 bus_format;
>  	u32 bus_flags;
> +
> +	/* Minimum reset duration and wait period after it in us */
> +	u32 reset_time;
> +	u32 reset_wait;
>  };
>  
>  struct panel_simple {
> @@ -109,6 +116,7 @@ struct panel_simple {
>  	struct i2c_adapter *ddc;
>  
>  	struct gpio_desc *enable_gpio;
> +	struct gpio_desc *reset_gpio;
>  
>  	struct drm_display_mode override_mode;
>  };
> @@ -432,12 +440,34 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	if (IS_ERR(panel->supply))
>  		return PTR_ERR(panel->supply);
>  
> +	panel->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						    GPIOD_OUT_HIGH);
> +	if (IS_ERR(panel->reset_gpio)) {
> +		err = PTR_ERR(panel->reset_gpio);
> +		if (err != -EPROBE_DEFER)
> +			dev_err(dev, "failed to request reset pin: %d\n", err);
> +		return err;
> +	} else if (panel->reset_gpio) {
> +		u32 reset_time = panel->desc->reset_time;
> +		u32 reset_wait = panel->desc->reset_wait;
> +
> +		if (!reset_time)
> +			reset_time = MIN_DEFAULT_RESET_US;
> +
> +		if (!reset_wait)
> +			reset_wait = MIN_DEFAULT_WAIT_US;
> +
> +		usleep_range(reset_time, 2 * reset_time);
> +		gpiod_set_value_cansleep(panel->reset_gpio, 0);
> +		usleep_range(reset_wait, 2 * reset_wait);
> +	}
> +
>  	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
>  						     GPIOD_OUT_LOW);
>  	if (IS_ERR(panel->enable_gpio)) {
>  		err = PTR_ERR(panel->enable_gpio);
>  		if (err != -EPROBE_DEFER)
> -			dev_err(dev, "failed to request GPIO: %d\n", err);
> +			dev_err(dev, "failed to request enable pin: %d\n", err);
>  		return err;
>  	}
>  
> -- 
> 2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
