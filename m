Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA0D9A3F31
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4310E35D;
	Fri, 18 Oct 2024 13:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RTNCoAWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014810E35D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:10:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B809721C;
 Fri, 18 Oct 2024 15:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729256936;
 bh=1vTBt3XGnJR90JCL6rOhjfoYCG2YNW38fXFpkdEspTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTNCoAWWuVD/LIR9YrhL4tfBMddRa18ORKRI0DqReHsJ/JM4+2t3KCR6USRx507GP
 Zj/ZImJGRrU2OYlOqCsPBmx+NjUKT+x7aV4Fjs/TfIZRar4/cmgYDR56V7iuirQD7L
 lr6mWgQ0+TrAhQ/3gay9Y5iXfs11co/ZigChstQ0=
Date: Fri, 18 Oct 2024 16:10:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Douglas Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <20241018131035.GA20602@pendragon.ideasonboard.com>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
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

Hi Geert,

Thank you for the patch.

On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> Each bridge instance creates up to four auxiliary devices with different
> names.  However, their IDs are always zero, causing duplicate filename
> errors when a system has multiple bridges:
> 
>     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> 
> Fix this by using a unique instance ID per bridge instance.

Isn't this something that should be handled by the AUX core ? The code
below would otherwise need to be duplicated by all drivers, which seems
a burden we should avoid.

> Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> /sys/bus/auxiliary/devices
> ├── ti_sn65dsi86.gpio.0
> ├── ti_sn65dsi86.pwm.0
> ├── ti_sn65dsi86.aux.0
> ├── ti_sn65dsi86.bridge.0
> ├── ti_sn65dsi86.gpio.1
> ├── ti_sn65dsi86.pwm.1
> ├── ti_sn65dsi86.aux.1
> └── ti_sn65dsi86.bridge.1
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 9e31f750fd889745..8f6ac48aefdb70b3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
> +#include <linux/idr.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> @@ -168,6 +169,7 @@
>   * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
>   * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
>   * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
> + * @id:           Unique instance ID
>   */
>  struct ti_sn65dsi86 {
>  	struct auxiliary_device		*bridge_aux;
> @@ -202,8 +204,11 @@ struct ti_sn65dsi86 {
>  	atomic_t			pwm_pin_busy;
>  #endif
>  	unsigned int			pwm_refclk_freq;
> +	int				id;
>  };
>  
> +static DEFINE_IDA(ti_sn65dsi86_ida);
> +
>  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
>  	{ .range_min = 0, .range_max = 0xFF },
>  };
> @@ -488,6 +493,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>  		return -ENOMEM;
>  
>  	aux->name = name;
> +	aux->id = pdata->id;
>  	aux->dev.parent = dev;
>  	aux->dev.release = ti_sn65dsi86_aux_device_release;
>  	device_set_of_node_from_dev(&aux->dev, dev);
> @@ -1889,6 +1895,13 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
>  				       pdata->supplies);
>  }
>  
> +static void ti_sn65dsi86_devm_ida_free(void *data)
> +{
> +	struct ti_sn65dsi86 *pdata = data;
> +
> +	ida_free(&ti_sn65dsi86_ida, pdata->id);
> +}
> +
>  static int ti_sn65dsi86_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -1903,6 +1916,17 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
>  	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
>  	if (!pdata)
>  		return -ENOMEM;
> +
> +	ret = ida_alloc(&ti_sn65dsi86_ida, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +
> +	pdata->id = ret;
> +
> +	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_devm_ida_free, pdata);
> +	if (ret)
> +		return ret;
> +
>  	dev_set_drvdata(dev, pdata);
>  	pdata->dev = dev;
>  

-- 
Regards,

Laurent Pinchart
