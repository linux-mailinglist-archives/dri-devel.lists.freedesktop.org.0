Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145ED203C1B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 18:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF696E859;
	Mon, 22 Jun 2020 16:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BED6E858;
 Mon, 22 Jun 2020 16:04:38 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i74so16087864oib.0;
 Mon, 22 Jun 2020 09:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpWGd5tWAlHrsA+mT/NF4UYRUsAtI3QPFNIfXvhEAqo=;
 b=DI8VhHJAKuXiP/lRNcUBlOQF3rVi9CGRLlkFy6dcTQ+dF/i+VCIlmVgDpAwGaQ4BiZ
 oRRGx783jeRX9AmuhXJZQMRp924/5czcF1W+PVgZuuNqGB2ktPDuMEZ9jfyKu9gsnqw7
 l5XB/zcRfr5gVd+7yeszPIaFtTDuqoILx1tRJKqMPHchID9L02FohX8x/1t0kA0KPS5m
 XOmvNWrc5d5q3Ti2AbKmMov59DIRkhiKwoFB5fwTyG06QYH3J4r2jzBWCeyRq26Cax5o
 W9qoxam+CVD03mRmmm7sGAGo6sZUMIIqDqeT1CytQJG6UtvY2am8veWhsZAJAoGI/otP
 jAmQ==
X-Gm-Message-State: AOAM531lZ1WNghDqVn9PD3GwVlVP8UXSYOImrGhICIl1euvb0ih/m1rn
 Kjoih/YvB7+t2tpPscLIt9ORF/snIy8R7V745nU=
X-Google-Smtp-Source: ABdhPJzgqjjqMjWomRkl96TUnoeA4k5Od/1zV3BURoexpD0a1Q6HZYzTxs/gWT6gQpKOmyhotiI4DLmVD8zb1Vdir78=
X-Received: by 2002:aca:ad88:: with SMTP id
 w130mr13636839oie.103.1592841878226; 
 Mon, 22 Jun 2020 09:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-3-hdegoede@redhat.com>
In-Reply-To: <20200620121758.14836-3-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 22 Jun 2020 18:04:27 +0200
Message-ID: <CAJZ5v0jYuKFmabZg+Y-rvXFF_EBfXKn=vOcyxFEs9bJugtvCfg@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] ACPI / LPSS: Save Cherry Trail PWM ctx registers
 only once (at activation)
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 20, 2020 at 2:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
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
> 32KHz, which is a slow-down of a factor 600. Surprisingly enough so far
> there have been few bug reports about this. This is likely because the
> i915 driver was hardcoding the PWM frequency to 46 KHz, which divided
> by 600 would result in a PWM frequency of approx. 78 Hz, which mostly
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

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
> Changes in v2:
> - Move #define LPSS_SAVE_CTX_ONCE define to group it with LPSS_SAVE_CTX
> ---
>  drivers/acpi/acpi_lpss.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
> index 446e666b3466..7e6db0f1d9ee 100644
> --- a/drivers/acpi/acpi_lpss.c
> +++ b/drivers/acpi/acpi_lpss.c
> @@ -67,7 +67,15 @@ ACPI_MODULE_NAME("acpi_lpss");
>  #define LPSS_CLK_DIVIDER               BIT(2)
>  #define LPSS_LTR                       BIT(3)
>  #define LPSS_SAVE_CTX                  BIT(4)
> -#define LPSS_NO_D3_DELAY               BIT(5)
> +/*
> + * For some devices the DSDT AML code for another device turns off the device
> + * before our suspend handler runs, causing us to read/save all 1-s (0xffffffff)
> + * as ctx register values.
> + * Luckily these devices always use the same ctx register values, so we can
> + * work around this by saving the ctx registers once on activation.
> + */
> +#define LPSS_SAVE_CTX_ONCE             BIT(5)
> +#define LPSS_NO_D3_DELAY               BIT(6)
>
>  struct lpss_private_data;
>
> @@ -254,7 +262,7 @@ static const struct lpss_device_desc byt_pwm_dev_desc = {
>  };
>
>  static const struct lpss_device_desc bsw_pwm_dev_desc = {
> -       .flags = LPSS_SAVE_CTX | LPSS_NO_D3_DELAY,
> +       .flags = LPSS_SAVE_CTX_ONCE | LPSS_NO_D3_DELAY,
>         .prv_offset = 0x800,
>         .setup = bsw_pwm_setup,
>         .resume_from_noirq = true,
> @@ -885,9 +893,14 @@ static int acpi_lpss_activate(struct device *dev)
>          * we have to deassert reset line to be sure that ->probe() will
>          * recognize the device.
>          */
> -       if (pdata->dev_desc->flags & LPSS_SAVE_CTX)
> +       if (pdata->dev_desc->flags & (LPSS_SAVE_CTX | LPSS_SAVE_CTX_ONCE))
>                 lpss_deassert_reset(pdata);
>
> +#ifdef CONFIG_PM
> +       if (pdata->dev_desc->flags & LPSS_SAVE_CTX_ONCE)
> +               acpi_lpss_save_ctx(dev, pdata);
> +#endif
> +
>         return 0;
>  }
>
> @@ -1036,7 +1049,7 @@ static int acpi_lpss_resume(struct device *dev)
>
>         acpi_lpss_d3_to_d0_delay(pdata);
>
> -       if (pdata->dev_desc->flags & LPSS_SAVE_CTX)
> +       if (pdata->dev_desc->flags & (LPSS_SAVE_CTX | LPSS_SAVE_CTX_ONCE))
>                 acpi_lpss_restore_ctx(dev, pdata);
>
>         return 0;
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
