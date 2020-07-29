Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E750232C63
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE3A6E868;
	Thu, 30 Jul 2020 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B216E478;
 Wed, 29 Jul 2020 08:12:22 +0000 (UTC)
IronPort-SDR: rnlUjDEurStlrRnX6MT6eh+ErT4M28pSbEcBKBlEq+8Lt6sQT1bX2InjwyLUDWeUs2Gw1jVidv
 8t3uusWLcq5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="150544019"
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="150544019"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 01:12:22 -0700
IronPort-SDR: s2JNo0zhIjiaCpq1u81jmQCbPSEu3ALLV3y99My7JkY6HkvzEaDoGe40MzeL9eJW6L0vQy+RZd
 6tyjyOke+mag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="272561398"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007.fm.intel.com with ESMTP; 29 Jul 2020 01:12:19 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0hCE-004eKo-T4; Wed, 29 Jul 2020 11:12:18 +0300
Date: Wed, 29 Jul 2020 11:12:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 06/16] pwm: lpss: Use pwm_lpss_apply() when restoring
 state on resume
Message-ID: <20200729081218.GH3703480@smile.fi.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-7-hdegoede@redhat.com>
 <20200728185703.GA3703480@smile.fi.intel.com>
 <1e19e31f-cf68-5607-3027-3b963ce53c39@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e19e31f-cf68-5607-3027-3b963ce53c39@redhat.com>
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

On Tue, Jul 28, 2020 at 09:55:22PM +0200, Hans de Goede wrote:
> On 7/28/20 8:57 PM, Andy Shevchenko wrote:
> > On Fri, Jul 17, 2020 at 03:37:43PM +0200, Hans de Goede wrote:

...

> > Maybe I'm too picky, but I would go even further and split apply to two versions
> > 
> > static int pwm_lpss_apply_on_resume(struct pwm_chip *chip, struct pwm_device *pwm,
> > 			  const struct pwm_state *state)
> > >   {
> > >   	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
> > >   	if (state->enabled)
> > >   		return pwm_lpss_prepare_enable(lpwm, pwm, state, !pwm_is_enabled(pwm));
> > >   	if (pwm_is_enabled(pwm)) {
> > >   		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
> > >   	return 0;
> > >   }
> > 
> > and another one for !from_resume.
> 
> It is a bit picky :) But that is actually not a bad idea, although I would write
> it like this for more symmetry with the normal (not on_resume) apply version,
> while at it I also renamed the function:
> 
> /*
>  * This is a mirror of pwm_lpss_apply() without pm_runtime reference handling
>  * for restoring the PWM state on resume.
>  */
> static int pwm_lpss_restore_state(struct pwm_chip *chip, struct pwm_device *pwm,
>                                   const struct pwm_state *state)
> {
>    	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
> 	int ret = 0;
> 
>    	if (state->enabled)
>    		ret = pwm_lpss_prepare_enable(lpwm, pwm, state, !pwm_is_enabled(pwm));
>    	else if (pwm_is_enabled(pwm))
>    		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
> 
>    	return ret;
> }
> 
> Would that work for you?

Yes.

...

> > > +		ret = __pwm_lpss_apply(&lpwm->chip, pwm, &saved_state, true);
> > > +		if (ret)
> > > +			dev_err(dev, "Error restoring state on resume\n");
> > 
> > I'm wondering if it's a real error why we do not bail out?
> > Otherwise dev_warn() ?
> 
> It is a real error, but a single PWM chip might have multiple controllers
> and bailing out early would mean not even trying to restore the state on
> the other controllers.  As for propagating the error, AFAIK the pm framework
> does not do anything with resume errors other then log an extra error.

OK.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
