Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258F5AD3C3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947D310E196;
	Mon,  5 Sep 2022 13:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FDE10E196
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:23:42 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id g16so6257642qkl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xqnaWRmSxWCHIXi5Qlq2gni2AdAVZeps2ahh12VkulY=;
 b=nOletpYDW/GRPvkaWSlAC0rzt34URfVHbiUKwVMsxFl09VUwy8XOqhWqRsptamq/Dg
 II+253/l3T6DgJP066py1bWTdICT2vRCXvzy2Ur+pO4VC493+7Sqn84yvDmlJFGAVdYl
 5PZSVDMi1QDxBMQa2pV/FSXYTAwvX/lFVcFPmgHoO3U8MnbkwA9h7jonAO1nFwBsGmoW
 q5f2ZglIOVt/xEgJLA6EBKdc3gOuFnoMDDVILIKTeoTg7qTOPypEYwVwaO1cq1N6YfbI
 me+dt6lOnpM5B3FzI09ooPbgjOvgXIow30OcLwUv/NaL/eE7AkZh0zMQ2HIMHBfa4q7S
 WwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xqnaWRmSxWCHIXi5Qlq2gni2AdAVZeps2ahh12VkulY=;
 b=XuvDKKeohD5UgwLS8Gvm8NjvF4gTzilqbL2mise2ngr8DjhKGK+CcSfsOqKFNF4OBM
 PhAu0ixy9P82md9t0ea1Xmp1h5zFTKXHV1BXlWhUkt0UqvZTrpL4G6M8C5EpTStoFF7r
 aG/L4dXXEqyF52NsKQU1TuiLsaA3xGqm8oD0Pv9fgyBorGOiqikS+mx+g347F35XNCNG
 3aoRRvv5CxC/0pbR1/OEhcPsaNm/AXsouKTqSwPXiMIYZQ5CiQn1Z+0YOD/3xzezMatd
 aHvs4TwDDlEsDNELUpZVuOEbIfZC0IUjAOWe3qyGKDZ8pKrTQWVtjj8F3srfTR0koW8L
 dIuQ==
X-Gm-Message-State: ACgBeo1DHgEJLNVt1lnFrBD+CDDJYEXp/PqOwxTBny/qodfboYfriw99
 oCvLiOYgvvZ55qzvUaela63RsaqoiPj8f8a9GPaB5+8zGcM=
X-Google-Smtp-Source: AA6agR5sttgUX/02ygd4oRH8E7CwuO10nDnWttnl6PSpdnCic7gOwb1KDafibQkxIBgdBbgVXC2AwvPX08spe4Hyycw=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr33223900qkp.504.1662384221554; Mon, 05
 Sep 2022 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
 <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
 <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
In-Reply-To: <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 16:23:05 +0300
Message-ID: <CAHp75Vek1WOyEdkfCgrcH2FL6GA5gTtxXaV5Qy9aJMCQ3qGxyg@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using
 devm_fwnode_gpiod_get()
To: Matti Vaittinen <mazziesaccount@gmail.com>
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
 USB <linux-usb@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
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
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 4:19 PM Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> On 9/5/22 13:40, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> >> +       vout_mode = device_property_read_bool(pdev->dev.parent,
> >> +                                             "rohm,vout1-en-low");
> >
> > They all using parent device and you may make code neater by adding
> >
> >    struct device *parent = pdev->dev.parent;
>
> This is a matter of personal preference. I prefer seeing
> pdev->dev.parent - as it is more obvious (to me) what the 'pdev' is than
> what 'parent' would be.
>
> I'd use the local variable only when it shortens at least one of the
> lines so that we avoid splitting it. After that being said - I'm not
> going to argue over this change either if one who is improving the
> driver wants to use the "helper" variable here.

And I believe the quoted one is exactly the case of what you are saying above.

-- 
With Best Regards,
Andy Shevchenko
