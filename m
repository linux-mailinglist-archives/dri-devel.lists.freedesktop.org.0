Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC36232C53
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832E86E86C;
	Thu, 30 Jul 2020 07:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF41D8929A;
 Wed, 29 Jul 2020 10:32:26 +0000 (UTC)
IronPort-SDR: mRcrZ4NJE4vNS+5jmdefjnfjZLTy5e1a7l5pcSDSFvjytqLEP+UY6ZOIqjVj1co8OpF1lO1wUh
 oYDkA3DjY6Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="169510579"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="169510579"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 03:32:26 -0700
IronPort-SDR: 7JXcY8QKMRfyvr2U+9DUu54QNPqnal9ObafaFtoBTfd8foBIGR2iFqcigrxjDB49g0IcU1f8vB
 5m0A0ocWMsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="434645151"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 29 Jul 2020 03:32:22 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0jNl-004fiD-Sm; Wed, 29 Jul 2020 13:32:21 +0300
Date: Wed, 29 Jul 2020 13:32:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 10/16] pwm: crc: Enable/disable PWM output on
 enable/disable
Message-ID: <20200729103221.GR3703480@smile.fi.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-11-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717133753.127282-11-hdegoede@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 03:37:47PM +0200, Hans de Goede wrote:
> The pwm-crc code is using 2 different enable bits:
> 1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
> 2. bit 0 of the BACKLIGHT_EN register
> =

> So far we've kept the PWM_OUTPUT_ENABLE bit set when disabling the PWM,
> this commit makes crc_pwm_disable() clear it on disable and makes
> crc_pwm_enable() set it again on re-enable.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Remove paragraph about tri-stating the output from the commit message,
>   we don't have a datasheet so this was just an unfounded guess
> ---
>  drivers/pwm/pwm-crc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index 81232da0c767..b72008c9b072 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -54,7 +54,9 @@ static int crc_pwm_calc_clk_div(int period_ns)
>  static int crc_pwm_enable(struct pwm_chip *c, struct pwm_device *pwm)
>  {
>  	struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(c);
> +	int div =3D crc_pwm_calc_clk_div(pwm_get_period(pwm));
>  =

> +	regmap_write(crc_pwm->regmap, PWM0_CLK_DIV, div | PWM_OUTPUT_ENABLE);
>  	regmap_write(crc_pwm->regmap, BACKLIGHT_EN, 1);
>  =

>  	return 0;
> @@ -63,8 +65,10 @@ static int crc_pwm_enable(struct pwm_chip *c, struct p=
wm_device *pwm)
>  static void crc_pwm_disable(struct pwm_chip *c, struct pwm_device *pwm)
>  {
>  	struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(c);
> +	int div =3D crc_pwm_calc_clk_div(pwm_get_period(pwm));
>  =

>  	regmap_write(crc_pwm->regmap, BACKLIGHT_EN, 0);
> +	regmap_write(crc_pwm->regmap, PWM0_CLK_DIV, div);
>  }
>  =

>  static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,
> -- =

> 2.26.2
> =


-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
