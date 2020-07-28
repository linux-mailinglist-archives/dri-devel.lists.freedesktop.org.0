Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E897D2312A7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03616E3D0;
	Tue, 28 Jul 2020 19:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B006E249;
 Tue, 28 Jul 2020 18:45:57 +0000 (UTC)
IronPort-SDR: 0AjXZtWOFWotc2Ef6K+1hJvBle5Axy0ottPbDWVq51vhp7Jtan5UZghMH2Ja35rAvPTJ0NcQdA
 lWqP4KPeVrkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="130852354"
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; d="scan'208";a="130852354"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 11:45:56 -0700
IronPort-SDR: wwWappNoJfKls/eFsEdb++nFi5WOaro8lC2t0gajQmO4NdQk54sfqMRwrDFI40pe+1MnoCMCo0
 VeDEfvP1Pujw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; d="scan'208";a="394420092"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2020 11:45:53 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0Ubp-004W6J-2e; Tue, 28 Jul 2020 21:45:53 +0300
Date: Tue, 28 Jul 2020 21:45:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 05/16] pwm: lpss: Add pwm_lpss_prepare_enable() helper
Message-ID: <20200728184553.GZ3703480@smile.fi.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717133753.127282-6-hdegoede@redhat.com>
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

On Fri, Jul 17, 2020 at 03:37:42PM +0200, Hans de Goede wrote:
> In the not-enabled -> enabled path pwm_lpss_apply() needs to get a
> runtime-pm reference; and then on any errors it needs to release it
> again.
> 
> This leads to somewhat hard to read code. This commit introduces a new
> pwm_lpss_prepare_enable() helper and moves all the steps necessary for
> the not-enabled -> enabled transition there, so that we can error check
> the entire transition in a single place and only have one pm_runtime_put()
> on failure call site.
> 
> While working on this I noticed that the enabled -> enabled (update
> settings) path was quite similar, so I've added an enable parameter to
> the new pwm_lpss_prepare_enable() helper, which allows using it in that
> path too.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
But see below.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pwm/pwm-lpss.c | 45 ++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
> index da9bc3d10104..8a136ba2a583 100644
> --- a/drivers/pwm/pwm-lpss.c
> +++ b/drivers/pwm/pwm-lpss.c
> @@ -122,41 +122,48 @@ static inline void pwm_lpss_cond_enable(struct pwm_device *pwm, bool cond)
>  		pwm_lpss_write(pwm, pwm_lpss_read(pwm) | PWM_ENABLE);
>  }
>  
> +static int pwm_lpss_prepare_enable(struct pwm_lpss_chip *lpwm,
> +				   struct pwm_device *pwm,
> +				   const struct pwm_state *state,
> +				   bool enable)
> +{
> +	int ret;
> +
> +	ret = pwm_lpss_is_updating(pwm);
> +	if (ret)
> +		return ret;
> +
> +	pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
> +	pwm_lpss_cond_enable(pwm, enable && lpwm->info->bypass == false);
> +	ret = pwm_lpss_wait_for_update(pwm);
> +	if (ret)
> +		return ret;
> +
> +	pwm_lpss_cond_enable(pwm, enable && lpwm->info->bypass == true);
> +	return 0;
> +}
> +
>  static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  			  const struct pwm_state *state)
>  {
>  	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
> -	int ret;

> +	int ret = 0;

We can avoid this change...

>  	if (state->enabled) {
>  		if (!pwm_is_enabled(pwm)) {
>  			pm_runtime_get_sync(chip->dev);
> -			ret = pwm_lpss_is_updating(pwm);
> -			if (ret) {
> -				pm_runtime_put(chip->dev);
> -				return ret;
> -			}
> -			pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
> -			pwm_lpss_cond_enable(pwm, lpwm->info->bypass == false);
> -			ret = pwm_lpss_wait_for_update(pwm);
> -			if (ret) {
> +			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
> +			if (ret)
>  				pm_runtime_put(chip->dev);
> -				return ret;
> -			}
> -			pwm_lpss_cond_enable(pwm, lpwm->info->bypass == true);
>  		} else {
> -			ret = pwm_lpss_is_updating(pwm);
> -			if (ret)
> -				return ret;
> -			pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
> -			return pwm_lpss_wait_for_update(pwm);

> +			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, false);

...by simple return directly from here. But I admit I haven't seen the next patch yet.

>  		}
>  	} else if (pwm_is_enabled(pwm)) {
>  		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
>  		pm_runtime_put(chip->dev);
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
