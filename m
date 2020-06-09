Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D51F4F3A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EED6E44D;
	Wed, 10 Jun 2020 07:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7617896AF;
 Tue,  9 Jun 2020 11:32:54 +0000 (UTC)
IronPort-SDR: QCtpK115xx5ZgQI1qUftWKnLcwAKjW4ua5puhJF+hqocRaz+Rld/BNLOS6iRUlUWVdi3LAH8xp
 o3UVk/iQalQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 04:32:54 -0700
IronPort-SDR: lKDKus3APn1bKbgBIwg6urxIw7pI0i/NCuY2+woSiz0eO5RXJTgqSV+j0Rlr0Pox3HxkytogN9
 Rn11SihIRlqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; d="scan'208";a="295808008"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2020 04:32:51 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jicUw-00Bt7J-1x; Tue, 09 Jun 2020 14:32:54 +0300
Date: Tue, 9 Jun 2020 14:32:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 11/15] pwm: crc: Implement get_state() method
Message-ID: <20200609113254.GN2428291@smile.fi.intel.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-12-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607181840.13536-12-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 07, 2020 at 08:18:36PM +0200, Hans de Goede wrote:
> Implement the pwm_ops.get_state() method to complete the support for the
> new atomic PWM API.

This one is good.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pwm/pwm-crc.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index 58c7e9ef7278..6c75a3470bc8 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -114,8 +114,37 @@ static int crc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	return 0;
>  }
>  
> +static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +			       struct pwm_state *state)
> +{
> +	struct crystalcove_pwm *crc_pwm = to_crc_pwm(chip);
> +	struct device *dev = crc_pwm->chip.dev;
> +	unsigned int clk_div, clk_div_reg, duty_cycle_reg;
> +	int error;
> +
> +	error = regmap_read(crc_pwm->regmap, PWM0_CLK_DIV, &clk_div_reg);
> +	if (error) {
> +		dev_err(dev, "Error reading PWM0_CLK_DIV %d\n", error);
> +		return;
> +	}
> +
> +	error = regmap_read(crc_pwm->regmap, PWM0_DUTY_CYCLE, &duty_cycle_reg);
> +	if (error) {
> +		dev_err(dev, "Error reading PWM0_DUTY_CYCLE %d\n", error);
> +		return;
> +	}
> +
> +	clk_div = (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
> +
> +	state->period     = clk_div * NSEC_PER_MHZ * 256 / PWM_BASE_CLK_MHZ;
> +	state->duty_cycle = duty_cycle_reg * state->period / PWM_MAX_LEVEL;
> +	state->polarity   = PWM_POLARITY_NORMAL;
> +	state->enabled    = !!(clk_div_reg & PWM_OUTPUT_ENABLE);
> +}
> +
>  static const struct pwm_ops crc_pwm_ops = {
>  	.apply = crc_pwm_apply,
> +	.get_state = crc_pwm_get_state,
>  };
>  
>  static int crystalcove_pwm_probe(struct platform_device *pdev)
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
