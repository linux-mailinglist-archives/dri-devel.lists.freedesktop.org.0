Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793905AD9C1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931B910E07F;
	Mon,  5 Sep 2022 19:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E0710E07F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:37:38 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id v5so9256858plo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=UX/1xWsBuUZKNpnGbmaCNyLgDKXUyHyjW7LSvfviiGM=;
 b=Jq6z0TjBOs+Trb+l/l0E6v2zXWY5HGZUjeUfFoj6h1dgSSPD3CMOMJzKW/FgRblSih
 9XKG/JuD76vNnuQGH4IReEwETm+svg5j/jghxR4WWjXAxOGp9pztBXjFtpMn9fKYvJDF
 mXDcmytCgAWXvi4BSG5pj9Y0FI8rlxUZq6PAQAUnNGkrMF0VrQAsHOOkpAHrZbr3nOJS
 i68fopwEQC0oJscyLwdmpyB8JB1DvXhZEhs94bZIP7npUYVRKyMbaEZFnY/EWTOyJFcw
 6eno1/ywfeqqOcLh7eCoxWyTJI1hItySN2zX1dRx/cdYZr0XNXm5Jc2yy3MvF+522GeF
 f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=UX/1xWsBuUZKNpnGbmaCNyLgDKXUyHyjW7LSvfviiGM=;
 b=TTTz6PW4/vY56P0JPjSkU3+pJXXBJ7AtM8PTyYHx5hn4ySf4Q9PB4ytT38n9ZrQL0+
 VVoYii6/fqdlvTylju1fxN15wuL10MzFQUJ+/DXbnu9wMgaJ9YkReFIEgSLmRs0RCyZN
 0H+acj1mSVgt/hcpZjA6/smF6qZa7kbvEeGlL5MmBCz89vWNxcgb2t0xtloAw+YUfflR
 T8Muy8zADQmrrKMBm4Cv3LG0WrW60bv0w+Y9i0/x8Es/Srulieu2KjFusah3HebnWIvU
 EFydm4jYWULOvOL2HqBRy6+DoCsx2TKMGRFdSJ7R+z4acmPNKkW+ynVjzSA8gRrYIfaP
 lICA==
X-Gm-Message-State: ACgBeo1pn+bnKAx2UQgWC4oKKsXamIBKrtTZR3Z8PpRfOJXXT/LI6a3/
 uRFWFC/YTohLUCmFLh23jvU=
X-Google-Smtp-Source: AA6agR70u6IDqbN3XobJcWbGlwEoBHj5+DIO4sKvf09Hb5lknd4pdCEXQAQd60uZG48UmUAgfPRBLA==
X-Received: by 2002:a17:902:edd5:b0:174:a6e6:51f4 with SMTP id
 q21-20020a170902edd500b00174a6e651f4mr40804784plk.82.1662406657709; 
 Mon, 05 Sep 2022 12:37:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a170902e5c100b00176b5035045sm2216157plf.202.2022.09.05.12.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:37:37 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:37:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
Message-ID: <YxZP/exeVD7DQ5Hx@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
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

On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > I would like to limit (or maybe even remove) use of
> > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > a bit, so let's switch to the generic device property API.
> 
> > It may even
> > help with handling secondary fwnodes when gpiolib is taught to handle
> > gpios described by swnodes.
> 
> I would remove this sentence from all commit messages since it's a
> debatable thing and might even not happen, so the above is a pure
> speculation.

I have the patches. Granted, I had them since '19 ;) but I'm rebasing
them and going to push them. I need them to convert bunch of input
drivers away from platform data.

Thanks.

-- 
Dmitry
