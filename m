Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049B03CFC95
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680896E183;
	Tue, 20 Jul 2021 14:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099D6E183
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:45:44 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2a39336e-e969-11eb-9082-0050568c148b;
 Tue, 20 Jul 2021 14:45:45 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A6564194B81;
 Tue, 20 Jul 2021 16:45:58 +0200 (CEST)
Date: Tue, 20 Jul 2021 16:45:41 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend 0/5] video: fbdev: ssd1307fb: Optimizations and
 improvements
Message-ID: <YPbhlanL295gVnfU@ravnborg.org>
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <YPXRMXQxCW+Agaz8@ravnborg.org>
 <CAMuHMdXK5X5Zawgp=SivGQSvOi=p_PwarYUR4QikGuB+f_d6YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXK5X5Zawgp=SivGQSvOi=p_PwarYUR4QikGuB+f_d6YQ@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,
On Tue, Jul 20, 2021 at 09:33:11AM +0200, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> On Mon, Jul 19, 2021 at 9:23 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Wed, Jul 14, 2021 at 04:57:59PM +0200, Geert Uytterhoeven wrote:
> > > This patch series optimizes console operations on ssd1307fb, after the
> > > customary fixes and cleanups.
> > >
> > > Currently, each screen update triggers an I2C transfer of all screen
> > > data, up to 1 KiB of data for a 128x64 display, which takes at least 20
> > > ms in Fast mode.  While many displays are smaller, and thus require less
> > > data to be transferred, 20 ms is still an optimistic value, as the
> > > actual data transfer may be much slower, especially on bitbanged I2C
> > > drivers.  After this series, the amount of data transfer is reduced, as
> > > fillrect, copyarea, and imageblit only update the rectangle that
> > > changed.
> > >
> > > This has been tested on an Adafruit FeatherWing OLED with an SSD1306
> > > controller and a 128x32 OLED, connected to an OrangeCrab ECP5 FPGA board
> > > running a 64 MHz VexRiscv RISC-V softcore, where it reduced the CPU
> > > usage for blinking the cursor from more than 70% to ca. 10%.
> > >
> > > Thanks for your comments!
> > >
> > > Geert Uytterhoeven (5):
> > >   video: fbdev: ssd1307fb: Propagate errors via
> > >     ssd1307fb_update_display()
> > >   video: fbdev: ssd1307fb: Simplify ssd1307fb_update_display()
> > >   video: fbdev: ssd1307fb: Extract ssd1307fb_set_address_range()
> > >   video: fbdev: ssd1307fb: Optimize screen updates
> > >   video: fbdev: ssd1307fb: Cache address ranges
> >
> > A few comments left for a couple of patches.
> > The remaining patches are:
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Thank you!
> 
> > Do you have commit rights to drm-misc-next?
> 
> No I have not (and I don't think I should).
I would love to have you around for the fbdev stuff, as you knows a ton
more about fbdev than I do - I am just pretending.
And it would then be good if you could apply patches too. I for one may
be off for shorter or longer periods as this is purely driven by interest.

Note: I assume you will resend the series - then I can apply.

	Sam
