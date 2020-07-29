Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA41232C5B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC156E877;
	Thu, 30 Jul 2020 07:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEDF6E4AB;
 Wed, 29 Jul 2020 10:29:00 +0000 (UTC)
IronPort-SDR: pDeMQBANAtYduu1dIbo/brWNv12iu35fZzD8CThD0YTHhZhYD11Hm55A5l99JaJREMlO3UeEZ8
 KjXNpwXXFPhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="212924255"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="212924255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 03:28:59 -0700
IronPort-SDR: pFmGOE9DMDUahmu6PJQM3J5A2wCVQQ5sHKOG7eFdxyD/ywAhnoazswxstxySaUcNNceehnJwEc
 BArPWz+zBtng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="273851313"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2020 03:28:56 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0jKR-004ffH-Rm; Wed, 29 Jul 2020 13:28:55 +0300
Date: Wed, 29 Jul 2020 13:28:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 08/16] pwm: crc: Fix off-by-one error in the
 clock-divider calculations
Message-ID: <20200729102855.GP3703480@smile.fi.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717133753.127282-9-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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

On Fri, Jul 17, 2020 at 03:37:45PM +0200, Hans de Goede wrote:
> The CRC PWM controller has a clock-divider which divides the clock with
> a value between 1-128. But as can seen from the PWM_DIV_CLK_xxx
> defines, this range maps to a register value of 0-127.
> 
> So after calculating the clock-divider we must subtract 1 to get the
> register value, unless the requested frequency was so high that the
> calculation has already resulted in a (rounded) divider value of 0.
> 
> Note that before this fix, setting a period of PWM_MAX_PERIOD_NS which
> corresponds to the max. divider value of 128 could have resulted in a
> bug where the code would use 128 as divider-register value which would
> have resulted in an actual divider value of 0 (and the enable bit being
> set). A rounding error stopped this bug from actually happen. This
> same rounding error means that after the subtraction of 1 it is impossible
> to set the divider to 128. Also bump PWM_MAX_PERIOD_NS by 1 ns to allow
> setting a divider of 128 (register-value 127).

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Introduce crc_pwm_calc_clk_div() here instead of later in the patch-set
>   to reduce the amount of churn in the patch-set a bit
> ---
>  drivers/pwm/pwm-crc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index c056eb9b858c..44ec7d5b63e1 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -22,7 +22,7 @@
>  #define PWM_MAX_LEVEL		0xFF
>  
>  #define PWM_BASE_CLK_MHZ	6	/* 6 MHz */
> -#define PWM_MAX_PERIOD_NS	5461333	/* 183 Hz */
> +#define PWM_MAX_PERIOD_NS	5461334	/* 183 Hz */
>  
>  /**
>   * struct crystalcove_pwm - Crystal Cove PWM controller
> @@ -39,6 +39,18 @@ static inline struct crystalcove_pwm *to_crc_pwm(struct pwm_chip *pc)
>  	return container_of(pc, struct crystalcove_pwm, chip);
>  }
>  
> +static int crc_pwm_calc_clk_div(int period_ns)
> +{
> +	int clk_div;
> +
> +	clk_div = PWM_BASE_CLK_MHZ * period_ns / (256 * NSEC_PER_USEC);
> +	/* clk_div 1 - 128, maps to register values 0-127 */
> +	if (clk_div > 0)
> +		clk_div--;
> +
> +	return clk_div;
> +}
> +
>  static int crc_pwm_enable(struct pwm_chip *c, struct pwm_device *pwm)
>  {
>  	struct crystalcove_pwm *crc_pwm = to_crc_pwm(c);
> @@ -68,11 +80,10 @@ static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,
>  	}
>  
>  	if (pwm_get_period(pwm) != period_ns) {
> -		int clk_div;
> +		int clk_div = crc_pwm_calc_clk_div(period_ns);
>  
>  		/* changing the clk divisor, need to disable fisrt */
>  		crc_pwm_disable(c, pwm);
> -		clk_div = PWM_BASE_CLK_MHZ * period_ns / (256 * NSEC_PER_USEC);
>  
>  		regmap_write(crc_pwm->regmap, PWM0_CLK_DIV,
>  					clk_div | PWM_OUTPUT_ENABLE);
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
