Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9B7509692
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 07:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E2710E27D;
	Thu, 21 Apr 2022 05:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7055510E27D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2EAAD811B;
 Thu, 21 Apr 2022 05:16:56 +0000 (UTC)
Date: Thu, 21 Apr 2022 08:19:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
Message-ID: <YmDpcXoafouaDL7s@atomide.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-27-arnd@kernel.org>
 <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
 <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Arnd Bergmann <arnd@kernel.org> [220420 19:18]:
> On Wed, Apr 20, 2022 at 3:46 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> >
> > Hi,
> >
> > On Tue, Apr 19, 2022 at 03:37:08PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The address range 0xfee00000-0xfeffffff is used for PCI and
> > > PCMCIA I/O port mappings, but OMAP1 has its static mappings
> > > there as well.
> > >
> > > Move the OMAP1 addresses a little higher to avoid crashing
> > > at boot.
> >
> > This has the same problem I reported in 2019, with earlyprintk the
> > system no longer boots:
> >
> >         https://marc.info/?t=156530014200005&r=1&w=2
> >
> > Tested on OSK and SX1/qemu.
> 
> Thanks a lot for testing!
> 
> I managed to get to the bottom of this after just a few hours, and
> it turned out to be a simple math error on my end, as I got
> the alignment wrong, the offset has to be 0x00f00000
> instead of 0x00fb0000 be section aligned. I made sure the
> kernel boots up (to the point of missing a rootfs) and uploaded
> the fixed branch.

Good to hear this got sorted out :)

Regards,

Tony
