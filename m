Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B65ADB22
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 00:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2204E10E3C2;
	Mon,  5 Sep 2022 22:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5E910E3C2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 22:08:35 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id h188so8957156pgc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=5z1ooZsxXJhukGg5jtTnKIsDm0LxvDPLLdQBFIOg9Mo=;
 b=YgTpoNtQskYKJFiEm9roM8UsHLvYEBNA1mL8ijvR43dcIl3qE9TJ2QJ31Crw3ouUSM
 iI8m5cQ7oncVgCHnH06GZ7ixBdCItXBCOTQ0lnmtukCsaxmucAabTpdrPK7wJWhoEWT7
 cgfEiI7IXkgrurTPX8XkkJoSsKsg9OzznrhVAXoVVoMju1sc4m7PY17g3MSbb/mrzdVs
 e0eC6TEC3Uajc8BSqN8s3bXjyqbHUencfLf3ZSqIc6lxiBQcd3c3TAVmvjecPrYNaR0z
 fbBCLNGPTSjT+MdQuaaUYKGVdpkhWWf3pd/I4UIY2tn2zmhrhfXgmb3XRio80gdSixHJ
 PRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=5z1ooZsxXJhukGg5jtTnKIsDm0LxvDPLLdQBFIOg9Mo=;
 b=seSaLMcEGsyCCuEei2nOzj5/wsD5r1IG6ZKUWTBchDMH+gnaC7qdW1R1SK43KpavHC
 62rSh3TdsjHS93AwLSLUvjdI80gdbtaunHHD75F6qIMejtitoXDRTwn1TUI/9e0yz8+K
 PmYBWBBjdyU4TsUxmc4gUQKPR+Zqag/0NGfVEVXEKJbE7Vnqa+d6fFAqUu7yrGbJ4ZlG
 P5zbyxrps3EdlPV2mW6TdqGBLLftIMZKlnpOFDjO52hQludLZMfS3b4XRTRethZwtUJJ
 vYJrW6mhS4UfN1QlYj/tl62zmljfF9QY3MoMFyMXRSHPKuG5Ra7rfM56DhTJX0aviWBi
 HSHw==
X-Gm-Message-State: ACgBeo11tMDrf6xtPWJb6/A6NMRT+mEt3GEIps6hnBpg+n/j2zRo1DkK
 cK4TPGpYiGsNGyf4SI8LNUU=
X-Google-Smtp-Source: AA6agR7YbREIA01VRSmP+zvXlY2q8iiOZpKUEqi6KFy5cemoOzMeF56ZDQMRUefeyhXXs1gJaKAhsA==
X-Received: by 2002:a63:4719:0:b0:42c:5586:de2 with SMTP id
 u25-20020a634719000000b0042c55860de2mr31993067pga.158.1662415714908; 
 Mon, 05 Sep 2022 15:08:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a170902710c00b00172f1d0825esm8092373pll.113.2022.09.05.15.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 15:08:34 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:08:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
Message-ID: <YxZzXqJiOPDVmACo@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
 <YxZP/exeVD7DQ5Hx@google.com>
 <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 11:03:38PM +0200, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 9:37 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > I would like to limit (or maybe even remove) use of
> > > > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > > > a bit, so let's switch to the generic device property API.
> > >
> > > > It may even
> > > > help with handling secondary fwnodes when gpiolib is taught to handle
> > > > gpios described by swnodes.
> > >
> > > I would remove this sentence from all commit messages since it's a
> > > debatable thing and might even not happen, so the above is a pure
> > > speculation.
> >
> > I have the patches. Granted, I had them since '19 ;) but I'm rebasing
> > them and going to push them. I need them to convert bunch of input
> > drivers away from platform data.
> 
> That's good news!
> 
> Are you referring to this patch set mentioned in a discussion
> from 2017 thru 2020?
> https://lore.kernel.org/linux-input/20200826161222.GA1665100@dtor-ws/
> 
> I put aside GPIO descriptor conversion for input devices (keys, buttons)
> in board files anticipating a swnode mechanism.

Yep, that one, exactly. It is taking a bit longer than I anticipated ;)

Thanks.

-- 
Dmitry
