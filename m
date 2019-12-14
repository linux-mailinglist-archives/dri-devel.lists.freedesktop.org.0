Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF011F15F
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 11:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92196E0C4;
	Sat, 14 Dec 2019 10:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3376E0C4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 10:23:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A8A518050E;
 Sat, 14 Dec 2019 11:23:55 +0100 (CET)
Date: Sat, 14 Dec 2019 11:23:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] drm/panel: simple: Support reset GPIOs
Message-ID: <20191214102354.GB2967@ravnborg.org>
References: <20191213181325.26228-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213181325.26228-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P-IC7800AAAA:8
 a=rgyZEuhkcDeh9zHs8M0A:9 a=CjuIK1q_8ugA:10 a=d3PnA9EDa4IxuAV0gXij:22
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

Hi Miquel.

On Fri, Dec 13, 2019 at 07:13:25PM +0100, Miquel Raynal wrote:
> The panel common bindings provide a gpios-reset property which is
> active low by default. Let's support it in the simple driver.
> 
> De-asserting the reset pin implies a physical high, which in turns is
> a logic low.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Code looks fine - but I fail to see why simple panels would require a
reset pin.

Do you have any simple panels that requires this, or did you add it
because you saw it in the panel-common.yaml file?

	Sam


> ---
>  drivers/gpu/drm/panel/panel-simple.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d487686d25c..15dd495c347d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -110,6 +110,7 @@ struct panel_simple {
>  	struct i2c_adapter *ddc;
>  
>  	struct gpio_desc *enable_gpio;
> +	struct gpio_desc *reset_gpio;
>  
>  	struct drm_display_mode override_mode;
>  };
> @@ -433,12 +434,21 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	if (IS_ERR(panel->supply))
>  		return PTR_ERR(panel->supply);
>  
> +	panel->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						    GPIOD_OUT_LOW);
> +	if (IS_ERR(panel->reset_gpio)) {
> +		err = PTR_ERR(panel->reset_gpio);
> +		if (err != -EPROBE_DEFER)
> +			dev_err(dev, "failed to request reset pin: %d\n", err);
> +		return err;
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
