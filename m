Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC25AE814
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 14:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7391B10E639;
	Tue,  6 Sep 2022 12:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127AB10E639
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 12:27:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296579838"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="296579838"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 05:27:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="565074197"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 05:27:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andy.shevchenko@gmail.com>) id 1oVXfv-00975d-2X;
 Tue, 06 Sep 2022 15:27:31 +0300
Date: Tue, 6 Sep 2022 15:27:31 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
Message-ID: <Yxc8s8IfzElm/mjS@smile.fi.intel.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
 <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
 <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
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
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 03:07:48PM -0700, Guenter Roeck wrote:
> On 9/5/22 12:55, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > > > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > > > > <dmitry.torokhov@gmail.com> wrote:

...

> > > > > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > > > > +                                      GPIOD_OUT_HIGH);
> > > > > > >                  err = PTR_ERR_OR_ZERO(gpiod);
> > > > > > 
> > > > > > What does _OR_ZERO mean now?
> > > > > 
> > > > > This converts a pointer to an error code if a pointer represents
> > > > > ERR_PTR() encoded error, or 0 to indicate success.
> > > > 
> > > > Yes, I know that. My point is, how is it useful now (or even before)?
> > > > I mean that devm_gpio_get() never returns NULL, right?
> > > 
> > > What does returning NULL have to do with anything.
> > 
> > It has to do with a dead code. If defm_gpiod_get() does not return
> > NULL, then why do we even bother to check?
> 
> PTR_ERR_OR_ZERO() converts into an error code (if the pointer is an
> ERR_PTR) or 0 if it is a real pointer. Its purpose is not to convert
> NULL into 0, its purpose is to convert a pointer either into an error
> code or 0. That is what is done here, and it is done all over the place
> in the kernel. I don't see your problem with it. Care to explain ?
> 
> > > It converts a pointer
> > > to a "classic" return code, with negative errors and 0 on success.
> > > 
> > > It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
> > > IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).
> > 
> > I don't see how this is relevant.
> 
> You lost me. Really, please explain your problem with PTR_ERR_OR_ZERO().

I don't know what I was thinking about... You, guys, are right, sorry for
my noise.

-- 
With Best Regards,
Andy Shevchenko


