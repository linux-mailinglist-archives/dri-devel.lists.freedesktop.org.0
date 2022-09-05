Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2A5AD9D6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AEC10E4CE;
	Mon,  5 Sep 2022 19:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271AB10E4CE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:42:57 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id k66so9649405vsc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wO/CS8iR8KxuQ0QSMzm6/WiY5ujYMWA4u/2Kf3nOOU4=;
 b=JSci26HogKWKQ4bQAPYj/qj3KQoQKdAM0djoTD3V3pfJRNYBkb/crHGNg1ZxmTaRZt
 Y2OeStRuHo3E/9wsjJPHVnMww72oojhAo7UJLNnJ0gRUC+nhaCUEHH9ZmDdynKfHloX2
 0bjx9qX1YL+G8A4rsdAU0h6gp40P8lRhXVGDtlCWUMjl1D8b39ZkjvsqK3cSjapHLUZz
 EVRCqi1r10xb9iSsdWdvvlb6dzMQ8cDz9uv1Pe05ngskplsNCt6Z3TRknJQasbAHVJ+g
 GwNPbWO8101YPtZqf6x/GwXmJmCDOz+EBKotqmHSc5fKyGy5JGnKrxr8z/8BsuU8OywW
 Yx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wO/CS8iR8KxuQ0QSMzm6/WiY5ujYMWA4u/2Kf3nOOU4=;
 b=umrN/x3kx5aME1TwLo4TailIpkZp6HTZ/dEvwKYEOyAZ9MWcinVo7oH9fc/X/f3O85
 ZDNPnrfh6fbH3cv1iTJnS7Ur/t4+/t9K6Wiips9rbfAw/+SvRWmip8PkAPDil+8ZfTnB
 hmy2dtpNrzliooZTuqJZcq3D49EP3rCzbNuQTpdczuACofrWcBH/cCGt6d7O3E6bNJ39
 Ryxts9O4wkxG+hhqgIi7/Vz5cYhZVbaw8uS7yHPOrpxEt/JHkjLB3TLIhOoMrrEfgMfM
 r/cy07UbJj8x+FZsWLJflOfLejQRXUAzliouzqpjY2z64eSDJGcm+wl4VnNiKqXNvpsa
 YfyA==
X-Gm-Message-State: ACgBeo2ezvdiCu2evpqhS49pC4ZtKjjYy3VNVEY5tatdqlzRPnGAumuK
 mDvP3wuIRdzi9zax/pYQqGgarPHbP60LctAQesc=
X-Google-Smtp-Source: AA6agR5H6mS5M0XhYTx5eUbgZC+0kKZN7MbCqjw2PbBKrxMbH7D52IRk52ma02TgJgjEDCJnQoQg6/wvHDVlYSC2VyU=
X-Received: by 2002:a67:c097:0:b0:390:d097:df91 with SMTP id
 x23-20020a67c097000000b00390d097df91mr12625663vsi.85.1662406976034; Mon, 05
 Sep 2022 12:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
In-Reply-To: <YxZQj8bwJCx5rqDv@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 22:41:40 +0300
Message-ID: <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> > > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > > -                                                   "nvidia,phy-reset-gpio",
> > > -                                                   0, GPIOD_OUT_HIGH,
> > > -                                                   "ulpi_phy_reset_b");
> > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > +                                      GPIOD_OUT_HIGH);
> > >                 err = PTR_ERR_OR_ZERO(gpiod);
> >
> > What does _OR_ZERO mean now?
>
> This converts a pointer to an error code if a pointer represents
> ERR_PTR() encoded error, or 0 to indicate success.

Yes, I know that. My point is, how is it useful now (or even before)?
I mean that devm_gpio_get() never returns NULL, right?

-- 
With Best Regards,
Andy Shevchenko
