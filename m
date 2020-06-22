Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B1C203C13
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 18:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD9889FEC;
	Mon, 22 Jun 2020 16:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD0989FCC;
 Mon, 22 Jun 2020 16:03:29 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id i4so3458732ooj.10;
 Mon, 22 Jun 2020 09:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKM6qdl4XxQVGL7OyBuykfl37CtWnc+tdGzZUekyK0U=;
 b=nghsYsELuB7OgD4tiEeP+eFZkhJVb+odpS6AZkuXdGDMCpL1zU/uzMallodZlXOJl9
 owxWIVgWefJvCXPSgU17dYejGJgc72KnvOLUlocdTYHJyF4PfWQj8M/0WlCTVnA/CMG/
 dAnrxDTovyJfNRuI/xUlrLkvGYt7ris0ls2PBJ7DnNSUB7eVzBlIWx0FiG+/H4evRb4u
 yPnzpp8ok1CUlIKwO1Iv0dv/90Iiuf2RRF/6G2mICs0UrCubdSPzliEKy/CTxgwz1+AW
 GwuCqjdN1ZxsM2YRBAYwiEu3lmP/2XX2di882TvJCyunD8wKCqlpg5iBc2Tg3L6/npZU
 9iGg==
X-Gm-Message-State: AOAM531Dp7KrJm/oceVs/rPHllYZ3n0V8pgU8i5UNeoRWb7TgeSo+1Oe
 jn+1kNLyhKbjr87Ktuqqb8R9sVFTBuTe8sXPmfY=
X-Google-Smtp-Source: ABdhPJztT2kIm5+7aGh27njiWN+yCK4UNRDLDkh0MGlPoCw1P8uYpgB3LfSffpwKz8rwB34VXzzt+NuMGnXFvvsI1JI=
X-Received: by 2002:a4a:6513:: with SMTP id y19mr14820649ooc.75.1592841808852; 
 Mon, 22 Jun 2020 09:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-2-hdegoede@redhat.com>
In-Reply-To: <20200620121758.14836-2-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 22 Jun 2020 18:03:17 +0200
Message-ID: <CAJZ5v0hheU2SaebNiLgRdxwC_dV44uSFWgAx2pr3w5ENeEF7EQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] ACPI / LPSS: Resume Cherry Trail PWM controller
 in no-irq phase
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
> controller gets poked from the _PS0 method of the graphics-card device:
>
>         Local0 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
>         If (((Local0 & 0x03) == 0x03))
>         {
>             PSAT &= 0xFFFFFFFC
>             Local1 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
>             RSTA = Zero
>             RSTF = Zero
>             RSTA = One
>             RSTF = One
>             PWMB |= 0xC0000000
>             PWMC = PWMB /* \_SB_.PCI0.GFX0.PWMB */
>         }
>
> Where PSAT is the power-status register of the PWM controller, so if it
> is in D3 when the GFX0 device's PS0 method runs then it will turn it on
> and restore the PWM ctrl register value it saved from its PS3 handler.
> Note not only does it restore it, it ors it with 0xC0000000 turning it
> on at a time where we may not want it to get turned on at all.
>
> The pwm_get call which the i915 driver does to get a reference to the
> PWM controller, already adds a device-link making the GFX0 device a
> consumer of the PWM device. So it should already have been resumed when
> the above AML runs and the AML should thus not do its undesirable poking
> of the PWM controller register.
>
> But the PCI core powers on PCI devices in the no-irq resume phase and
> thus calls the troublesome PS0 method in the no-irq resume phase.
> Where as LPSS devices by default are resumed in the early resume phase.
>
> This commit sets the resume_from_noirq flag in the bsw_pwm_dev_desc
> struct, so that Cherry Trail PWM controllers will be resumed in the
> no-irq phase. Together with the device-link added by the pwm-get this
> ensures that the PWM controller will be on when the troublesome PS0
> method runs, which stops it from poking the PWM controller.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/acpi/acpi_lpss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
> index c5a5a179f49d..446e666b3466 100644
> --- a/drivers/acpi/acpi_lpss.c
> +++ b/drivers/acpi/acpi_lpss.c
> @@ -257,6 +257,7 @@ static const struct lpss_device_desc bsw_pwm_dev_desc = {
>         .flags = LPSS_SAVE_CTX | LPSS_NO_D3_DELAY,
>         .prv_offset = 0x800,
>         .setup = bsw_pwm_setup,
> +       .resume_from_noirq = true,
>  };
>
>  static const struct lpss_device_desc byt_uart_dev_desc = {
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
