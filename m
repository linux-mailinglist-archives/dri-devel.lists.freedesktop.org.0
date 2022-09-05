Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20185AD9ED
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2B110E0D2;
	Mon,  5 Sep 2022 19:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B8410E0E9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:51:44 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id fv3so3073720pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=y3Qjjf92TYynwevE3H2ZfJzfWM4V6u0gYdLfjE+80ak=;
 b=p8fQjE0a0ZYjZfKRTjHpT3euYQsGr97PlI4J+3Etag+6i4rW86Bv40nzZOUk7I+O74
 6AB3V55fbqVv7uRxcLJ9p+i6cEGfvUhY3Kul9eRBDmP4APZA6HSJroq5lt4nanlf+S4D
 WzL8qbprYpzsZPbHTw91TVqhBBtGkTVEuU+NWJvf9meD6jRYOhrvpxBh2bEHlWS2vOzN
 /mMdK+1vtePGkD0+o2tcKMw1L7TbtR/LY2u3VdsMAB8lgT9qdQtRVvzA9MzGS4jTHM2e
 Y8DXi1ZE+gjUnF3/4YvRqKEtHb92EDRaHq/IKZmP1TBDcFx5o+n/mIkQoIp34EalsnaQ
 zoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=y3Qjjf92TYynwevE3H2ZfJzfWM4V6u0gYdLfjE+80ak=;
 b=utv6a258H6m8mFrCfVpJkIl3lPW7MDMbbUm0kDNgfQyvjSS8JCYltxD4+aYh2bpmFx
 z0w7PLC+OSjlZb06dWGOQPHn+FEEk2ugPa9WZ1N5kEym3URnCqe7Av0vLzSBiUoOkwou
 nHLjSlIK69GH1baxuIpLY4hIlLA2dY8ZyUerUgdK/XLAtZokxhHT7W5xsibXgWuZ2Cq/
 8/SRxzsAJym9gobLwnCg56UdtaGOwkaUVrs0i9/o+BH1VHAtVqM25/7demhmXfYwDe6d
 lnjrnOz/v1PPxBmB1KrptI0tWRI4wiDy2kokxHRfIfq/d1LFTZ95UD31F0lnXrT8iA8o
 LLoA==
X-Gm-Message-State: ACgBeo2C+9+BYkk6J7OCyZPqnZYA97bJbcYulYYrtLzve/o2lIHpefuN
 y3SXhr0JK2hu8qoNCCid4OY=
X-Google-Smtp-Source: AA6agR6jLyMlXDr8IPeAvG3W5MKsqN0u+BmkWQrSPGBis9zvMHZVJmB1Wm8c2BJ+cKCgBoks41PKTg==
X-Received: by 2002:a17:902:f68d:b0:16f:2314:7484 with SMTP id
 l13-20020a170902f68d00b0016f23147484mr49230641plg.136.1662407504235; 
 Mon, 05 Sep 2022 12:51:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a17090adac500b001fd8316db51sm7191722pjx.7.2022.09.05.12.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:51:43 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:51:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
Message-ID: <YxZTS3Nl1YaMGoBC@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
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

On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> 
> ...
> 
> > > > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > > > -                                                   "nvidia,phy-reset-gpio",
> > > > -                                                   0, GPIOD_OUT_HIGH,
> > > > -                                                   "ulpi_phy_reset_b");
> > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > +                                      GPIOD_OUT_HIGH);
> > > >                 err = PTR_ERR_OR_ZERO(gpiod);
> > >
> > > What does _OR_ZERO mean now?
> >
> > This converts a pointer to an error code if a pointer represents
> > ERR_PTR() encoded error, or 0 to indicate success.
> 
> Yes, I know that. My point is, how is it useful now (or even before)?
> I mean that devm_gpio_get() never returns NULL, right?

What does returning NULL have to do with anything. It converts a pointer
to a "classic" return code, with negative errors and 0 on success.

It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).

Thanks.

-- 
Dmitry
