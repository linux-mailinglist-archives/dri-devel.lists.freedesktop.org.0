Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03122312A6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9056B6E3C7;
	Tue, 28 Jul 2020 19:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3F589D5E;
 Tue, 28 Jul 2020 18:57:08 +0000 (UTC)
IronPort-SDR: A1kQaf8icL4iJnXp5Hm6xU8uA2lNqWm0caDq3e3kg5BC0/AvbQ9Uit450w38sRN7bpmP36Bsni
 SdG9wiJTaKiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="139314532"
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; d="scan'208";a="139314532"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 11:57:07 -0700
IronPort-SDR: UmduEKAs43os32xUjafr9i+QhylJuv1Ke5h4kc5YbuMpJDI/CH0Q6CjoAW8Gt55YsmGeo6NmF6
 aH/dwdSgnEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; d="scan'208";a="286260467"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 28 Jul 2020 11:57:04 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0Umd-004WCX-TA; Tue, 28 Jul 2020 21:57:03 +0300
Date: Tue, 28 Jul 2020 21:57:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 06/16] pwm: lpss: Use pwm_lpss_apply() when restoring
 state on resume
Message-ID: <20200728185703.GA3703480@smile.fi.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717133753.127282-7-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 03:37:43PM +0200, Hans de Goede wrote:
> Before this commit a suspend + resume of the LPSS PWM controller
> would result in the controller being reset to its defaults of
> output-freq = clock/256, duty-cycle=100%, until someone changes
> to the output-freq and/or duty-cycle are made.
> 
> This problem has been masked so far because the main consumer
> (the i915 driver) was always making duty-cycle changes on resume.
> With the conversion of the i915 driver to the atomic PWM API the
> driver now only disables/enables the PWM on suspend/resume leaving
> the output-freq and duty as is, triggering this problem.
> 
> The LPSS PWM controller has a mechanism where the ctrl register value
> and the actual base-unit and on-time-div values used are latched. When
> software sets the SW_UPDATE bit then at the end of the current PWM cycle,
> the new values from the ctrl-register will be latched into the actual
> registers, and the SW_UPDATE bit will be cleared.
> 
> The problem is that before this commit our suspend/resume handling
> consisted of simply saving the PWM ctrl register on suspend and
> restoring it on resume, without setting the PWM_SW_UPDATE bit.
> When the controller has lost its state over a suspend/resume and thus
> has been reset to the defaults, just restoring the register is not
> enough. We must also set the SW_UPDATE bit to tell the controller to
> latch the restored values into the actual registers.
> 
> Fixing this problem is not as simple as just or-ing in the value which
> is being restored with SW_UPDATE. If the PWM was enabled before we must
> write the new settings + PWM_SW_UPDATE before setting PWM_ENABLE.
> We must also wait for PWM_SW_UPDATE to become 0 again and depending on the
> model we must do this either before or after the setting of PWM_ENABLE.
> 
> All the necessary logic for doing this is already present inside
> pwm_lpss_apply(), so instead of duplicating this inside the resume
> handler, this commit makes the resume handler use pwm_lpss_apply() to
> restore the settings when necessary. This fixes the output-freq and
> duty-cycle being reset to their defaults on resume.

...

> -static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> -			  const struct pwm_state *state)
> +static int __pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			    const struct pwm_state *state, bool from_resume)
>  {
>  	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
>  	int ret = 0;
>  
>  	if (state->enabled) {
>  		if (!pwm_is_enabled(pwm)) {
> -			pm_runtime_get_sync(chip->dev);
> +			if (!from_resume)
> +				pm_runtime_get_sync(chip->dev);
> +
>  			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
> -			if (ret)
> +			if (ret && !from_resume)
>  				pm_runtime_put(chip->dev);
>  		} else {
>  			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, false);
>  		}
>  	} else if (pwm_is_enabled(pwm)) {
>  		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
> -		pm_runtime_put(chip->dev);
> +
> +		if (!from_resume)
> +			pm_runtime_put(chip->dev);
>  	}
>  
>  	return ret;
>  }

Maybe I'm too picky, but I would go even further and split apply to two versions

static int pwm_lpss_apply_on_resume(struct pwm_chip *chip, struct pwm_device *pwm,
			  const struct pwm_state *state)
>  {
>  	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
>  
>  	if (state->enabled)
>  		return pwm_lpss_prepare_enable(lpwm, pwm, state, !pwm_is_enabled(pwm));
>  	if (pwm_is_enabled(pwm)) {
>  		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
>  	return 0;
>  }

and another one for !from_resume.

> +static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			  const struct pwm_state *state)
> +{
> +	return __pwm_lpss_apply(chip, pwm, state, false);
> +}

...

> +		ret = __pwm_lpss_apply(&lpwm->chip, pwm, &saved_state, true);
> +		if (ret)
> +			dev_err(dev, "Error restoring state on resume\n");

I'm wondering if it's a real error why we do not bail out?
Otherwise dev_warn() ?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
