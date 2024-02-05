Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC284989B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 12:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F9A1124CB;
	Mon,  5 Feb 2024 11:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeS/Hj1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83E01124CB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707131864; x=1738667864;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tHnpZhTX8Xrq4EUJgaVdVCOTaR8PdQikDpjX/wFWX+M=;
 b=BeS/Hj1qX7NT/sth0NABj2JgS/qWg7tS5vRGB8QFkmEJER8IXtS7Tvl6
 rd01eCow/5k79tTcjbycS8kVgr7ukUxCpatYqU0QF6+mj7hispbDbwmNh
 54qkb5jGpLPuAsTorQl0VVprTJpwrskNp08rLEPYA0wLUkeZsKjv1I1+P
 w6Mb1v42pfNMBMZq+C1/fEhC8joYm2m9B89JAJmfObQqFx43+xSouPuc/
 d44y+lbWUQzYIIYTN2xLkJrqq7Q5vWLR9QCnxVLbDjcznR/jWLzF89/Fw
 BbBzPe+jTB12KH4kBLIGa490Llk7N+L855wScmyvI6zk3ibmzhvDk4yba w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="18026472"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="18026472"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:17:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="31783025"
Received: from bgrigorc-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:17:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: eizan@chromium.org, Douglas Anderson <dianders@chromium.org>, Ankit
 Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Imre Deak <imre.deak@intel.com>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
In-Reply-To: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
Date: Mon, 05 Feb 2024 13:17:32 +0200
Message-ID: <87fry7dusz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 02 Feb 2024, Douglas Anderson <dianders@chromium.org> wrote:
> If an eDP panel is not powered on then any attempts to talk to it over
> the DP AUX channel will timeout. Unfortunately these attempts may be
> quite slow. Userspace can initiate these attempts either via a
> /dev/drm_dp_auxN device or via the created i2c device.
>
> Making the DP AUX drivers timeout faster is a difficult proposition.
> In theory we could just poll the panel's HPD line in the AUX transfer
> function and immediately return an error there. However, this is
> easier said than done. For one thing, there's no hard requirement to
> hook the HPD line up for eDP panels and it's OK to just delay a fixed
> amount. For another thing, the HPD line may not be fast to probe. On
> parade-ps8640 we need to wait for the bridge chip's firmware to boot
> before we can get the HPD line and this is a slow process.
>
> The fact that the transfers are taking so long to timeout is causing
> real problems. The open source fwupd daemon sometimes scans DP busses
> looking for devices whose firmware need updating. If it happens to
> scan while a panel is turned off this scan can take a long time. The
> fwupd daemon could try to be smarter and only scan when eDP panels are
> turned on, but we can also improve the behavior in the kernel.
>
> Let's let eDP panels drivers specify that a panel is turned off and
> then modify the common AUX transfer code not to attempt a transfer in
> this case.

I guess my question is, why not make the aux->transfer function handle
the powered down case and return the appropriate error?

For example, the transfer hook in i915 checks whether the display is
connected and bails out early if not.

Having to track and set the state all over the place seems more
complicated to me than dynamically checking where needed i.e. in the
transfer hook.


BR,
Jani.

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/display/drm_dp_helper.c       | 35 +++++++++++++++++++
>  drivers/gpu/drm/panel/panel-edp.c             |  3 ++
>  .../gpu/drm/panel/panel-samsung-atna33xc20.c  |  2 ++
>  include/drm/display/drm_dp_helper.h           |  6 ++++
>  4 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index b1ca3a1100da..6fa705d82c8f 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -532,6 +532,15 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
>  
>  	mutex_lock(&aux->hw_mutex);
>  
> +	/*
> +	 * If the device attached to the aux bus is powered down then there's
> +	 * no reason to attempt a transfer. Error out immediately.
> +	 */
> +	if (aux->powered_down) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
>  	/*
>  	 * The specification doesn't give any recommendation on how often to
>  	 * retry native transactions. We used to retry 7 times like for
> @@ -599,6 +608,29 @@ int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_probe);
>  
> +/**
> + * drm_dp_dpcd_set_powered() - Set whether the DP device is powered
> + * @aux: DisplayPort AUX channel; for convenience it's OK to pass NULL here
> + *       and the function will be a no-op.
> + * @powered: true if powered; false if not
> + *
> + * If the endpoint device on the DP AUX bus is known to be powered down
> + * then this function can be called to make future transfers fail immediately
> + * instead of needing to time out.
> + *
> + * If this function is never called then a device defaults to being powered.
> + */
> +void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
> +{
> +	if (!aux)
> +		return;
> +
> +	mutex_lock(&aux->hw_mutex);
> +	aux->powered_down = !powered;
> +	mutex_unlock(&aux->hw_mutex);
> +}
> +EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
> +
>  /**
>   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
> @@ -1858,6 +1890,9 @@ static int drm_dp_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
>  	struct drm_dp_aux_msg msg;
>  	int err = 0;
>  
> +	if (aux->powered_down)
> +		return -EBUSY;
> +
>  	dp_aux_i2c_transfer_size = clamp(dp_aux_i2c_transfer_size, 1, DP_AUX_MAX_PAYLOAD_BYTES);
>  
>  	memset(&msg, 0, sizeof(msg));
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 7d556b1bfa82..d2a4e514d8fd 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -413,6 +413,7 @@ static int panel_edp_suspend(struct device *dev)
>  {
>  	struct panel_edp *p = dev_get_drvdata(dev);
>  
> +	drm_dp_dpcd_set_powered(p->aux, false);
>  	gpiod_set_value_cansleep(p->enable_gpio, 0);
>  	regulator_disable(p->supply);
>  	p->unprepared_time = ktime_get_boottime();
> @@ -469,6 +470,7 @@ static int panel_edp_prepare_once(struct panel_edp *p)
>  	}
>  
>  	gpiod_set_value_cansleep(p->enable_gpio, 1);
> +	drm_dp_dpcd_set_powered(p->aux, true);
>  
>  	p->powered_on_time = ktime_get_boottime();
>  
> @@ -507,6 +509,7 @@ static int panel_edp_prepare_once(struct panel_edp *p)
>  	return 0;
>  
>  error:
> +	drm_dp_dpcd_set_powered(p->aux, false);
>  	gpiod_set_value_cansleep(p->enable_gpio, 0);
>  	regulator_disable(p->supply);
>  	p->unprepared_time = ktime_get_boottime();
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> index 5703f4712d96..76c2a8f6718c 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -72,6 +72,7 @@ static int atana33xc20_suspend(struct device *dev)
>  	if (p->el3_was_on)
>  		atana33xc20_wait(p->el_on3_off_time, 150);
>  
> +	drm_dp_dpcd_set_powered(p->aux, false);
>  	ret = regulator_disable(p->supply);
>  	if (ret)
>  		return ret;
> @@ -93,6 +94,7 @@ static int atana33xc20_resume(struct device *dev)
>  	ret = regulator_enable(p->supply);
>  	if (ret)
>  		return ret;
> +	drm_dp_dpcd_set_powered(p->aux, true);
>  	p->powered_on_time = ktime_get_boottime();
>  
>  	if (p->no_hpd) {
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 863b2e7add29..472359a9d675 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -463,9 +463,15 @@ struct drm_dp_aux {
>  	 * @is_remote: Is this AUX CH actually using sideband messaging.
>  	 */
>  	bool is_remote;
> +
> +	/**
> +	 * @powered_down: If true then the remote endpoint is powered down.
> +	 */
> +	bool powered_down;
>  };
>  
>  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
> +void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
>  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  			 void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,

-- 
Jani Nikula, Intel
