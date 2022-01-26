Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BB49C89F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53610E8D6;
	Wed, 26 Jan 2022 11:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C9810E8D6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:26:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3403461900;
 Wed, 26 Jan 2022 11:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96D4C340E3;
 Wed, 26 Jan 2022 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643196399;
 bh=W4uxImZLdrohuxm9pLlvYSNpJJ+YoX/JL5nvs5LsGGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pvsrKDU1u3Sren1+ay3QGc5gg9cbn4i8dEZFwaquE5nJuqgl51YDKDxlDmfo+bRhI
 mpW50d2iH//5w5Tu8FwvqTax6yYT5TkuFHePsFIhqnuTNgb+4fV7ksLlqznS3rBBce
 7o5vpCCOH3s1iPJmPw0ZSS7Z+mxjIY34MBWr5Xok=
Date: Wed, 26 Jan 2022 12:26:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfEv7OQs98O9wJdJ@kroah.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:17:08PM +0100, Helge Deller wrote:
> On 1/26/22 11:31, Daniel Vetter wrote:
> > On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
> >>> Let's maintain occasional fixes to the fbtft driver.
> >>>
> >>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>> ---
> >>>  MAINTAINERS | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index ea3e6c914384..16e614606ac1 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -7372,9 +7372,11 @@ F:     Documentation/fault-injection/
> >>>  F:   lib/fault-inject.c
> >>>
> >>>  FBTFT Framebuffer drivers
> >>> +M:   Andy Shevchenko <andy@kernel.org>
> >>>  L:   dri-devel@lists.freedesktop.org
> >>>  L:   linux-fbdev@vger.kernel.org
> >>> -S:   Orphan
> >>> +S:   Maintained
> >>> +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
> >>
> >> I'm ok with the files moving if the dri developers agree with it.  It's
> >> up to them, not me.
> >
> > On one hand I'm happy anytime someone volunteers to help out.
> >
> > On the other hand ... why does it have to be resurrecting fbdev?
> > There's an entire community of people who really know graphics and
> > display and spent considerable amount of effort on creating useful and
> > documented helpers for pretty much anything you might ever want to do.
> > And somehow we have to go back to typing out things the hard way, with
> > full verbosity, for an uapi that distros are abandoning (e.g. even for
> > sdl the direction is to run it on top of drm with a compat layer,
> > afaiui fedora is completely ditching any userspace that still even
> > uses /dev/fb/0). And yes I know there's still some gaps in drm,
> > largely for display features which were really en vogue about 20 years
> > ago. And we're happy to add that support, if someone who still has
> > such hardware can put in the little bit of work needed ...
> >
> > I don't get this.
> 
> You are describing a transitioning over to DRM - which is Ok.
> But on that way there is no need to ignore, deny or even kill usage scenarios
> which are different compared to your usage scenarios (e.g. embedded devices,
> old platforms, slow devices, slow busses, no 3D hardware features,
> low-color devices, ...).

All of those should be handled by the drm layer, as Daniel keeps
pointing out.  If not, then the tinydrm layer needs to be enhanced to do
so.

Anyone have a pointer to hardware I can buy that is one of these fbtft
drivers that I could do a port to drm to see just how much work is
really needed here?

thanks,

greg k-h
