Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D9635FF15
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 02:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395B6E980;
	Thu, 15 Apr 2021 00:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583896E980
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 00:58:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63B3E51E;
 Thu, 15 Apr 2021 02:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618448306;
 bh=dT0dNdclklPiYApYQlXIEs77mjYEm26Y9+wMkOD0nvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RxLAeseP/5Pdt5JDnRvWf/rt6evuAn133rWeH6zaj1mKSEUlv64P8LNG/QdY52rXj
 kAZ9ksbDJQbfOkAFg7j5b+4VSSoOPa3I2w9S5KrUpQy8BqA705FFPZTDiBtU/g82el
 Lknu/tWvcMyEHaLL+ZO6r8+4faZeq4oA+AMYXOlk=
Date: Thu, 15 Apr 2021 03:58:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 12/12] drm/panel: panel-simple: Use runtime pm to
 avoid excessive unprepare / prepare
Message-ID: <YHePsQgqOau1V5lD@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.12.I9e8bd33b49c496745bfac58ea9ab418bd3b6f5ce@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.12.I9e8bd33b49c496745bfac58ea9ab418bd3b6f5ce@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:46PM -0700, Douglas Anderson wrote:
> Unpreparing and re-preparing a panel can be a really heavy
> operation. Panels datasheets often specify something on the order of
> 500ms as the delay you should insert after turning off the panel
> before turning it on again. In addition, turning on a panel can have
> delays on the order of 100ms - 200ms before the panel will assert HPD
> (AKA "panel ready"). The above means that we should avoid turning a
> panel off if we're going to turn it on again shortly.
> 
> The above becomes a problem when we want to read the EDID of a
> panel. The way that ordering works is that userspace wants to read the
> EDID of the panel _before_ fully enabling it so that it can set the
> initial mode correctly. However, we can't read the EDID until we power
> it up. This leads to code that does this dance (like
> ps8640_bridge_get_edid()):
> 
> 1. When userspace requests EDID / the panel modes (through an ioctl),
>    we power on the panel just enough to read the EDID and then power
>    it off.
> 2. Userspace then turns the panel on.
> 
> There's likely not much time between step #1 and #2 and so we want to
> avoid powering the panel off and on again between those two steps.
> 
> Let's use Runtime PM to help us. We'll move the existing prepare() and
> unprepare() to be runtime resume() and runtime suspend(). Now when we
> want to prepare() or unprepare() we just increment or decrement the
> refcount. We'll default to a 1 second autosuspend delay which seems
> sane given the typical delays we see for panels.
> 
> A few notes:
> - It seems the existing unprepare() and prepare() are defined to be
>   no-ops if called extra times. We'll preserve that behavior.

The prepare and unprepare calls are supposed to be balanced, which
should allow us to drop this check. Do you have a reason to suspect that
it may not be the case ?

> - This is a slight change in the ABI of simple panel. If something was
>   absolutely relying on the unprepare() to happen instantly that
>   simply won't be the case anymore. I'm not aware of anyone relying on
>   that behavior, but if there is someone then we'll need to figure out
>   how to enable (or disable) this new delayed behavior selectively.
> - In order for this to work we now have a hard dependency on
>   "PM". From memory this is a legit thing to assume these days and we
>   don't have to find some fallback to keep working if someone wants to
>   build their system without "PM".

Sounds fine to me.

The code looks good to me. Possibly with the prepared check removed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/Kconfig        |  1 +
>  drivers/gpu/drm/panel/panel-simple.c | 93 +++++++++++++++++++++-------
>  2 files changed, 73 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4894913936e9..ef87d92cdf49 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -80,6 +80,7 @@ config DRM_PANEL_SIMPLE
>  	tristate "support for simple panels"
>  	depends on OF
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on PM
>  	select VIDEOMODE_HELPERS
>  	help
>  	  DRM panel driver for dumb panels that need at most a regulator and
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index be312b5c04dd..6b22872b3281 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -27,6 +27,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/display_timing.h>
> @@ -175,6 +176,8 @@ struct panel_simple {
>  	bool enabled;
>  	bool no_hpd;
>  
> +	bool prepared;
> +
>  	ktime_t prepared_time;
>  	ktime_t unprepared_time;
>  
> @@ -334,19 +337,31 @@ static int panel_simple_disable(struct drm_panel *panel)
>  	return 0;
>  }
>  
> +static int panel_simple_suspend(struct device *dev)
> +{
> +	struct panel_simple *p = dev_get_drvdata(dev);
> +
> +	gpiod_set_value_cansleep(p->enable_gpio, 0);
> +	regulator_disable(p->supply);
> +	p->unprepared_time = ktime_get();
> +
> +	return 0;
> +}
> +
>  static int panel_simple_unprepare(struct drm_panel *panel)
>  {
>  	struct panel_simple *p = to_panel_simple(panel);
> +	int ret;
>  
> -	if (p->prepared_time == 0)
> +	/* Unpreparing when already unprepared is a no-op */
> +	if (!p->prepared)
>  		return 0;
>  
> -	gpiod_set_value_cansleep(p->enable_gpio, 0);
> -
> -	regulator_disable(p->supply);
> -
> -	p->prepared_time = 0;
> -	p->unprepared_time = ktime_get();
> +	pm_runtime_mark_last_busy(panel->dev);
> +	ret = pm_runtime_put_autosuspend(panel->dev);
> +	if (ret < 0)
> +		return ret;
> +	p->prepared = false;
>  
>  	return 0;
>  }
> @@ -376,22 +391,19 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
>  	return 0;
>  }
>  
> -static int panel_simple_prepare_once(struct drm_panel *panel)
> +static int panel_simple_prepare_once(struct panel_simple *p)
>  {
> -	struct panel_simple *p = to_panel_simple(panel);
> +	struct device *dev = p->base.dev;
>  	unsigned int delay;
>  	int err;
>  	int hpd_asserted;
>  	unsigned long hpd_wait_us;
>  
> -	if (p->prepared_time != 0)
> -		return 0;
> -
>  	panel_simple_wait(p->unprepared_time, p->desc->delay.unprepare);
>  
>  	err = regulator_enable(p->supply);
>  	if (err < 0) {
> -		dev_err(panel->dev, "failed to enable supply: %d\n", err);
> +		dev_err(dev, "failed to enable supply: %d\n", err);
>  		return err;
>  	}
>  
> @@ -405,7 +417,7 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
>  
>  	if (p->hpd_gpio) {
>  		if (IS_ERR(p->hpd_gpio)) {
> -			err = panel_simple_get_hpd_gpio(panel->dev, p, false);
> +			err = panel_simple_get_hpd_gpio(dev, p, false);
>  			if (err)
>  				goto error;
>  		}
> @@ -423,7 +435,7 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
>  
>  		if (err) {
>  			if (err != -ETIMEDOUT)
> -				dev_err(panel->dev,
> +				dev_err(dev,
>  					"error waiting for hpd GPIO: %d\n", err);
>  			goto error;
>  		}
> @@ -447,25 +459,46 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
>   */
>  #define MAX_PANEL_PREPARE_TRIES		5
>  
> -static int panel_simple_prepare(struct drm_panel *panel)
> +static int panel_simple_resume(struct device *dev)
>  {
> +	struct panel_simple *p = dev_get_drvdata(dev);
>  	int ret;
>  	int try;
>  
>  	for (try = 0; try < MAX_PANEL_PREPARE_TRIES; try++) {
> -		ret = panel_simple_prepare_once(panel);
> +		ret = panel_simple_prepare_once(p);
>  		if (ret != -ETIMEDOUT)
>  			break;
>  	}
>  
>  	if (ret == -ETIMEDOUT)
> -		dev_err(panel->dev, "Prepare timeout after %d tries\n", try);
> +		dev_err(dev, "Prepare timeout after %d tries\n", try);
>  	else if (try)
> -		dev_warn(panel->dev, "Prepare needed %d retries\n", try);
> +		dev_warn(dev, "Prepare needed %d retries\n", try);
>  
>  	return ret;
>  }
>  
> +static int panel_simple_prepare(struct drm_panel *panel)
> +{
> +	struct panel_simple *p = to_panel_simple(panel);
> +	int ret;
> +
> +	/* Preparing when already prepared is a no-op */
> +	if (p->prepared)
> +		return 0;
> +
> +	ret = pm_runtime_get_sync(panel->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_autosuspend(panel->dev);
> +		return ret;
> +	}
> +
> +	p->prepared = true;
> +
> +	return 0;
> +}
> +
>  static int panel_simple_enable(struct drm_panel *panel)
>  {
>  	struct panel_simple *p = to_panel_simple(panel);
> @@ -748,6 +781,18 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		break;
>  	}
>  
> +	dev_set_drvdata(dev, panel);
> +
> +	/*
> +	 * We use runtime PM for prepare / unprepare since those power the panel
> +	 * on and off and those can be very slow operations. This is important
> +	 * to optimize powering the panel on briefly to read the EDID before
> +	 * fully enabling the panel.
> +	 */
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
>  	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
>  
>  	err = drm_panel_of_backlight(&panel->base);
> @@ -756,8 +801,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  
>  	drm_panel_add(&panel->base);
>  
> -	dev_set_drvdata(dev, panel);
> -
>  	return 0;
>  
>  free_ddc:
> @@ -4603,10 +4646,17 @@ static void panel_simple_platform_shutdown(struct platform_device *pdev)
>  	panel_simple_shutdown(&pdev->dev);
>  }
>  
> +static const struct dev_pm_ops panel_simple_pm_ops = {
> +	SET_RUNTIME_PM_OPS(panel_simple_suspend, panel_simple_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +};
> +
>  static struct platform_driver panel_simple_platform_driver = {
>  	.driver = {
>  		.name = "panel-simple",
>  		.of_match_table = platform_of_match,
> +		.pm = &panel_simple_pm_ops,
>  	},
>  	.probe = panel_simple_platform_probe,
>  	.remove = panel_simple_platform_remove,
> @@ -4901,6 +4951,7 @@ static struct mipi_dsi_driver panel_simple_dsi_driver = {
>  	.driver = {
>  		.name = "panel-simple-dsi",
>  		.of_match_table = dsi_of_match,
> +		.pm = &panel_simple_pm_ops,
>  	},
>  	.probe = panel_simple_dsi_probe,
>  	.remove = panel_simple_dsi_remove,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
