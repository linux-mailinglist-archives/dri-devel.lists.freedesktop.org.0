Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C085AD9F5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BAF10E0F5;
	Mon,  5 Sep 2022 19:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690DE10E0F5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:54:27 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id v5so9285223plo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=zxa96jF7Tq2NFS5Z0f+Vbe6tPHaqlTK7+tACu1Wc1bY=;
 b=p+w40zBKb360cS3t/20RQ9fj87kNmL9+wV2DVi2rkEnZbxImbIJc7pte6gUegPMA8a
 sFBB5aUkvaOM6b3Kj9qmd2ut1NKgO+CDhyFT91dG8+KUVoVf0gInhE/UOnfhB92XkSNY
 u8qMra/sYBIyNm2Awyf4P1TWUIjbeQASP/d7P9T5CM2s7DH926t2/T3HcNVk1DoW+UGS
 v796lRquHF7Qmw7ptQ1DqA4ajtoKb1+hxfBI6rfUByvolTPU6//4uMw0nmTfqEuWbj/R
 2Evodr6uEdppBL0mwTkx6onhEejt0ETyPcrx+UWGe+X8/pqjNco8n2BX6gqU3Djw+OmE
 nbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zxa96jF7Tq2NFS5Z0f+Vbe6tPHaqlTK7+tACu1Wc1bY=;
 b=CUSw+8gud9nqyHQmjfwTgXKBDtyvSrs9aCNPO2t7xp8lOa/2Pnb9TZfbpOq9p+ZbZ8
 S2MH/K/9JPKsAxM/RhWRSviK58LF46logjkDlbLqi+oGQdNbO8y/sj6u+OzgijHKGQ1V
 xc02BDNpOIT352hybOPdlCzYvSUyJ4NWOJbn/qKY4BDKKNR9Ra65wUEESM+wjVrSUCWj
 AzsYeS9uddB7RXRh2DcAScOkZAnWItBwHW7ZwUFKJzPH74PfHMNTUrvDisX7nSwVB4RB
 0u91ggOs/tcGBxRZCDhjuJpOGjeysInUHs5pxXnEVh8uHy/jzNcASulNBheR5nmr+g9V
 uCoA==
X-Gm-Message-State: ACgBeo23tUFtZogAq/qbrYTukGI87Sp6VrT6eB8BcPpizPq8SRyMd6Tz
 U7iiYG+AW9zke3S6Ppwoyuw=
X-Google-Smtp-Source: AA6agR5Cv7sHKUo7MkZvN9NCQW+TEQYIAszXUVs54FMP1ugGloikm17da8wbNClAm9HOmIskUrqfng==
X-Received: by 2002:a17:903:248:b0:172:7520:db07 with SMTP id
 j8-20020a170903024800b001727520db07mr50029962plh.76.1662407666780; 
 Mon, 05 Sep 2022 12:54:26 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a170902dace00b001754a3c5404sm7987874plx.212.2022.09.05.12.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:54:26 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:54:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <YxZT7tDhW/7T+Snl@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
 <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Mon, Sep 05, 2022 at 01:47:41PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:02 AM Pali Rohár <pali@kernel.org> wrote:
> > On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > > device property API.
> > >
> > > I believe that the only reason the driver, instead of the standard
> > > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > > because it wanted to set up a pretty consumer name for the GPIO,
> >
> > IIRC consumer name is not used at all.
> 
> It's. The user space tools use it as a label. So, GPIO line can have
> "name" (this is provider specific) and "label" (which is consumer
> specific, i.o.w. how we use this line).
> 
> ...
> 
> > > +             if (ret != -EPROBE_DEFER)
> > > +                     dev_err(dev, "Failed to get reset-gpio: %i\n",
> > > +                             ret);
> > > +             return ret;
> 
> I understand that in the input subsystem maintainer's hat you don't
> like dev_err_probe(), but it's a good case to have it here.

The driver currently does not use this API, so I elected not to
introduce it in this series.

Thanks,

-- 
Dmitry
