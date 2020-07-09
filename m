Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0EF21B091
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C676EB80;
	Fri, 10 Jul 2020 07:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4EF6EA58;
 Thu,  9 Jul 2020 12:53:46 +0000 (UTC)
IronPort-SDR: kSxrU+bVWLkGlHZZjxatd6Qt9L2B6znKSaeL0N807IT1v79Y/8aJJVKyuA6jHTM1jA1Bo+6776
 k8ggYGnwKp1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="147979742"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="147979742"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 05:53:45 -0700
IronPort-SDR: 4UhVVzRdfRgY/8+HoyrskJRD7zgshAwz47e2eSEdp3SNRb+nTr3PMqVqoeRkKk3gEKnmZsiQaz
 6mKzTfH7Ka0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="298060505"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2020 05:53:42 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jtW3a-000rRk-Mw; Thu, 09 Jul 2020 15:53:42 +0300
Date: Thu, 9 Jul 2020 15:53:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 04/16] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200709125342.GX3703480@smile.fi.intel.com>
References: <20200708211432.28612-1-hdegoede@redhat.com>
 <20200708211432.28612-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708211432.28612-5-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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

On Wed, Jul 08, 2020 at 11:14:20PM +0200, Hans de Goede wrote:
> When the user requests a high enough period ns value, then the
> calculations in pwm_lpss_prepare() might result in a base_unit value of 0.
> 
> But according to the data-sheet the way the PWM controller works is that
> each input clock-cycle the base_unit gets added to a N bit counter and
> that counter overflowing determines the PWM output frequency. Adding 0
> to the counter is a no-op. The data-sheet even explicitly states that
> writing 0 to the base_unit bits will result in the PWM outputting a
> continuous 0 signal.

And I don't see how you can get duty 100% / 0% (I don't remember which one is
equivalent to 0 in base unit) after this change. IIRC the problem here that
base unit when non-zero is always being added to the counter and it will
trigger the change of output at some point which is not what we want for 100% /
0% cases.

> When the user requestes a low enough period ns value, then the
> calculations in pwm_lpss_prepare() might result in a base_unit value
> which is bigger then base_unit_range - 1. Currently the codes for this
> deals with this by applying a mask:
> 
> 	base_unit &= (base_unit_range - 1);
> 
> But this means that we let the value overflow the range, we throw away the
> higher bits and store whatever value is left in the lower bits into the
> register leading to a random output frequency, rather then clamping the
> output frequency to the highest frequency which the hardware can do.

It would be nice to have an example of calculus here.

> This commit fixes both issues by clamping the base_unit value to be
> between 1 and (base_unit_range - 1).

Eventually I sat and wrote all this on paper. I see now that the problem
is in out of range of the period. And strongly we should clamp rather period
to the supported range, but your solution is an equivalent.

Only question is about the 100% / 0% duty cycle.

> Fixes: 684309e5043e ("pwm: lpss: Avoid potential overflow of base_unit")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Change upper limit of clamp to (base_unit_range - 1)
> - Add Fixes tag
> ---
>  drivers/pwm/pwm-lpss.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
> index 43b1fc634af1..80d0f9c64f9d 100644
> --- a/drivers/pwm/pwm-lpss.c
> +++ b/drivers/pwm/pwm-lpss.c
> @@ -97,6 +97,9 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
>  	freq *= base_unit_range;
>  
>  	base_unit = DIV_ROUND_CLOSEST_ULL(freq, c);
> +	/* base_unit must not be 0 and we also want to avoid overflowing it */

> +	base_unit = clamp_t(unsigned long long, base_unit, 1,
> +			    base_unit_range - 1);

A nit: one line.

>  	on_time_div = 255ULL * duty_ns;
>  	do_div(on_time_div, period_ns);
> @@ -105,7 +108,6 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
>  	orig_ctrl = ctrl = pwm_lpss_read(pwm);
>  	ctrl &= ~PWM_ON_TIME_DIV_MASK;
>  	ctrl &= ~((base_unit_range - 1) << PWM_BASE_UNIT_SHIFT);
> -	base_unit &= (base_unit_range - 1);
>  	ctrl |= (u32) base_unit << PWM_BASE_UNIT_SHIFT;
>  	ctrl |= on_time_div;
>  
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
