Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A94E5AD9CC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A7710E4D0;
	Mon,  5 Sep 2022 19:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9A610E4D0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:40:04 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y127so9358599pfy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=CBRkTEdupwBv7lUysuAAHCWeUeGOXoPs3goZlUKIChI=;
 b=AoB/BB+wDCEOf3ollKTlkOpFH5ZdJcaYtYObH7F+USml96PL05nQZdIxn7ekRew/5b
 7EIcLBlc3MsHwZ5Sf25zmIO3Px5fO4gvhdDaBRhf9uOzwFLARLpmd1bM870f8lIBNHD3
 gytJZ2ifVtaupmJ3QTM9/NdK15W4dYwrMCBg6SW65U1OqgtNyXc84pbod89bIQ6BXjDU
 8DjK9Glh1ftaKc4OO8CDr320e11XRL2oTkt0sdDZYfOg6PUIpHo4y/CMFZXvXzFkVUsb
 WSwJf6gJvfOXaQ8gaip6aWRNOqu2Fi4hdJAIEf0y3X+J6pOHAoM+5/JGDwZcC7JNH7er
 c8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=CBRkTEdupwBv7lUysuAAHCWeUeGOXoPs3goZlUKIChI=;
 b=G4WfEGyOUdc1fFU7tPWnQyR7AFBcK+a1Qct1SLFtnEkGayycf6hhm1d9m+P19RgUCB
 cQ5EZuQBxI3ApbQ7e/GVCbdLJU5KizKSGQ8sDvDyQvV+bV1FUbu6vLhLnJkx8ECIfjna
 wIctHTNl5RcsljjuiBDjGYwoa4Uq2wHr70l1PIw1bTBKypAjKUHDGmDRD2z2/lwEC8FC
 RqH6dYXiz9IOxkg7srnF94obBW0FYdrNC10MTDg/H6i3inYOkzhXwpfF5NO8BvNM9q2S
 kaak2h+99RTKc1waMscwvj/4rCxmCjdKdg/Lg4vsHWbfjnnZi3EvwTYfzgauYzLi0Cjj
 uqHg==
X-Gm-Message-State: ACgBeo1yrLeT4uAriKeWE53e8WwORChbmCrHQrC2CBUhz0ovfQFqm3WN
 aydohKB9r27mEKaOCzrFn1U=
X-Google-Smtp-Source: AA6agR57aEnMQb2MM+YsWuK1Qvz4a+9OpUI4vj1PStOfsBOdRv0ywrZ084st51jWLHlWq8m5GTSO4g==
X-Received: by 2002:a65:6255:0:b0:42c:87b1:485b with SMTP id
 q21-20020a656255000000b0042c87b1485bmr29214848pgv.491.1662406803892; 
 Mon, 05 Sep 2022 12:40:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170902780e00b00176b4f9d871sm2199498pll.70.2022.09.05.12.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:40:03 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:39:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
Message-ID: <YxZQj8bwJCx5rqDv@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > device property API.
> >
> > I believe that the only reason the driver, instead of the standard
> > devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
> > wanted to set up a pretty consumer name for the GPIO, and we now have
> > a special API for that.
> 
> ...
> 
> > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > -                                                   "nvidia,phy-reset-gpio",
> > -                                                   0, GPIOD_OUT_HIGH,
> > -                                                   "ulpi_phy_reset_b");
> > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > +                                      GPIOD_OUT_HIGH);
> >                 err = PTR_ERR_OR_ZERO(gpiod);
> 
> What does _OR_ZERO mean now?

This converts a pointer to an error code if a pointer represents
ERR_PTR() encoded error, or 0 to indicate success.

static inline int __must_check PTR_ERR_OR_ZERO(__force const void *ptr)
{
	if (IS_ERR(ptr))
		return PTR_ERR(ptr);
	else
		return 0;
}

Thanks.

-- 
Dmitry
