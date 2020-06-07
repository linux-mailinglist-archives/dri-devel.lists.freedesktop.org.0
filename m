Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7381F0F04
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB5C6E3E7;
	Sun,  7 Jun 2020 19:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4EF6E056;
 Sun,  7 Jun 2020 17:03:38 +0000 (UTC)
IronPort-SDR: 0ZQW55t04x8CCyRPUImOr6L4hhZ+J1/BBob+aFsjhFUO91DowJjoAxT4opb/bdmi2tpMqJ8hKC
 xu5k9Rmkj1ig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2020 10:03:38 -0700
IronPort-SDR: 0dFrGoFzh8BbQ3dyiLNKbR3AxLmFYZJG6/gjbDzxXgIk5uKomSN4tK10fMiwIarC8v0DR5nR63
 ZPi7cp+noQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,485,1583222400"; d="scan'208";a="472343710"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2020 10:03:35 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jhyht-00BUOf-Iw; Sun, 07 Jun 2020 20:03:37 +0300
Date: Sun, 7 Jun 2020 20:03:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/16] ACPI / LPSS: Save Cherry Trail PWM ctx registers
 only once (at activation)
Message-ID: <20200607170337.GY2428291@smile.fi.intel.com>
References: <20200606202601.48410-1-hdegoede@redhat.com>
 <20200606202601.48410-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200606202601.48410-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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

On Sat, Jun 06, 2020 at 10:25:47PM +0200, Hans de Goede wrote:
> The DSDTs on most Cherry Trail devices have an ugly clutch where the PWM
> controller gets turned off from the _PS3 method of the graphics-card dev:
> 
>             Method (_PS3, 0, Serialized)  // _PS3: Power State 3
>             {
>                 ...
>                             PWMB = PWMC /* \_SB_.PCI0.GFX0.PWMC */
>                             PSAT |= 0x03
>                             Local0 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
>                 ...
>             }
> 
> Where PSAT is the power-status register of the PWM controller.
> 
> Since the i915 driver will do a pwm_get on the pwm device as it uses it to
> control the LCD panel backlight, there is a device-link marking the i915
> device as a consumer of the pwm device. So that the PWM controller will
> always be suspended after the i915 driver suspends (which is the right
> thing to do). This causes the above GFX0 PS3 AML code to run before
> acpi_lpss.c calls acpi_lpss_save_ctx().
> 
> So on these devices the PWM controller will already be off when
> acpi_lpss_save_ctx() runs. This causes it to read/save all 1-s (0xffffffff)
> as ctx register values.
> 
> When these bogus values get restored on resume the PWM controller actually
> keeps working, since most bits are reserved, but this does set bit 3 of
> the LPSS General purpose register, which for the PWM controller has the
> following function: "This bit is re-used to support 32kHz slow mode.
> Default is 19.2MHz as PWM source clock".
> 
> This causes the clock of the PWM controller to switch from 19.2MHz to
> 32KHz, which is a slow-down of a factor 600. Suprisingly enough so far
> there have been few bug reports about this. This is likely because the
> i915 driver was hardcoding the PWM frequency to 46 KHz, which divided
> by 600 would result in a PWM frequency of aprox. 78 Hz, which mostly
> still works fine. There are some bug reports about the LCD backlight
> flickering after suspend/resume which are likely caused by this issue.
> 
> But with the upcoming patch-series to finally switch the i915 drivers
> code for external PWM controllers to use the atomic API and to honor
> the PWM frequency specified in the video BIOS (VBT), this becomes a much
> bigger problem. On most cases the VBT specifies either 200 Hz or 20
> KHz as PWM frequency, which with the mentioned issue ends up being either
> 1/3 Hz, where the backlight actually visible blinks on and off every 3s,
> or in 33 Hz and horrible flickering of the backlight.
> 
> There are a number of possible solutions to this problem:
> 
> 1. Make acpi_lpss_save_ctx() run before GFX0._PS3
>  Pro: Clean solution from pov of not medling with save/restore ctx code
>  Con: As mentioned the current ordering is the right thing to do
>  Con: Requires assymmetry in at what suspend/resume phase we do the save vs
>       restore, requiring more suspend/resume ordering hacks in already
>       convoluted acpi_lpss.c suspend/resume code.
> 2. Do some sort of save once mode for the LPSS ctx
>  Pro: Reasonably clean
>  Con: Needs a new LPSS flag + code changes to handle the flag
> 3. Detect we have failed to save the ctx registers and do not restore them
>  Pro: Not PWM specific, might help with issues on other LPSS devices too
>  Con: If we can get away with not restoring the ctx why bother with it at
>       all?
> 4. Do not save the ctx for CHT PWM controllers
>  Pro: Clean, as simple as dropping a flag?
>  Con: Not so simple as dropping a flag, needs a new flag to ensure that
>       we still do lpss_deassert_reset() on device activation.
> 5. Make the pwm-lpss code fixup the LPSS-context registers
>  Pro: Keeps acpi_lpss.c code clean
>  Con: Moves knowledge of LPSS-context into the pwm-lpss.c code
> 
> 1 and 5 both do not seem to be a desirable way forward.
> 
> 3 and 4 seem ok, but they both assume that restoring the LPSS-context
> registers is not necessary. I have done a couple of test and those do
> show that restoring the LPSS-context indeed does not seem to be necessary
> on devices using s2idle suspend (and successfully reaching S0i3). But I
> have no hardware to test deep / S3 suspend. So I'm not sure that not
> restoring the context is safe.
> 
> That leaves solution 2, which is about as simple / clean as 3 and 4,
> so this commit fixes the described problem by implementing a new
> LPSS_SAVE_CTX_ONCE flag and setting that for the CHT PWM controllers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/acpi_lpss.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
> index 67892fc0b822..26933e6b7b8c 100644
> --- a/drivers/acpi/acpi_lpss.c
> +++ b/drivers/acpi/acpi_lpss.c
> @@ -68,6 +68,14 @@ ACPI_MODULE_NAME("acpi_lpss");
>  #define LPSS_LTR			BIT(3)
>  #define LPSS_SAVE_CTX			BIT(4)
>  #define LPSS_NO_D3_DELAY		BIT(5)
> +/*
> + * For some devices the DSDT AML code for another device turns off the device
> + * before our suspend handler runs, causing us to read/save all 1-s (0xffffffff)
> + * as ctx register values.
> + * Luckily these devices always use the same ctx register values, so we can
> + * work around this by saving the ctx registers once on activation.
> + */
> +#define LPSS_SAVE_CTX_ONCE		BIT(6)

A nit: I would group SAVE_CTX and CTX_ONCE in the list, i.e. make this BIT(5)
and move NO_D3_DELAY to BIT(6).

>  struct lpss_private_data;
>  
> @@ -254,7 +262,7 @@ static const struct lpss_device_desc byt_pwm_dev_desc = {
>  };
>  
>  static const struct lpss_device_desc bsw_pwm_dev_desc = {
> -	.flags = LPSS_SAVE_CTX | LPSS_NO_D3_DELAY,
> +	.flags = LPSS_SAVE_CTX_ONCE | LPSS_NO_D3_DELAY,
>  	.prv_offset = 0x800,
>  	.setup = bsw_pwm_setup,
>  	.resume_from_noirq = true,
> @@ -885,9 +893,14 @@ static int acpi_lpss_activate(struct device *dev)
>  	 * we have to deassert reset line to be sure that ->probe() will
>  	 * recognize the device.
>  	 */
> -	if (pdata->dev_desc->flags & LPSS_SAVE_CTX)
> +	if (pdata->dev_desc->flags & (LPSS_SAVE_CTX | LPSS_SAVE_CTX_ONCE))
>  		lpss_deassert_reset(pdata);
>  
> +#ifdef CONFIG_PM
> +	if (pdata->dev_desc->flags & LPSS_SAVE_CTX_ONCE)
> +		acpi_lpss_save_ctx(dev, pdata);
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -1031,7 +1044,7 @@ static int acpi_lpss_resume(struct device *dev)
>  
>  	acpi_lpss_d3_to_d0_delay(pdata);
>  
> -	if (pdata->dev_desc->flags & LPSS_SAVE_CTX)
> +	if (pdata->dev_desc->flags & (LPSS_SAVE_CTX | LPSS_SAVE_CTX_ONCE))
>  		acpi_lpss_restore_ctx(dev, pdata);
>  
>  	return 0;
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
