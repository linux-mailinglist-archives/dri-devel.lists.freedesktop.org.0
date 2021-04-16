Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8F36213E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 15:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEDF6EB37;
	Fri, 16 Apr 2021 13:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0BC6EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 13:41:25 +0000 (UTC)
IronPort-SDR: GuGqIFwWTJ5pflmnfB17pK9GCwp4e5afsFeBZtvRdX2f38GIHAHnaEtS1LdggRyy+Kye8/FoXR
 rTTQ2MS+KAAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="182166076"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="182166076"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 06:41:24 -0700
IronPort-SDR: RkMy8kahDr8ADQI+2DiYA8YrkFi3PwsUZKQ1TV9m5jB970VQGpL9A8qO9Q25lNNt1BHY1Vu7yD
 sS51DkTqEcdA==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="383061321"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 06:41:22 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lXOil-004f0l-LX; Fri, 16 Apr 2021 16:41:19 +0300
Date: Fri, 16 Apr 2021 16:41:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/2] fbtft: Rectify GPIO handling
Message-ID: <YHmT/+B1Hq2baSNs@smile.fi.intel.com>
References: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
 <YHmIb2YrwfzZa7Wh@kroah.com> <YHmTLPWT/BoTik/P@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHmTLPWT/BoTik/P@smile.fi.intel.com>
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
Cc: Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>,
 linux-fbdev@vger.kernel.org, Nishad Kamdar <nishadkamdar@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 04:37:48PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 16, 2021 at 02:51:59PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Apr 16, 2021 at 03:31:16PM +0300, Andy Shevchenko wrote:
> > > The infamous commit c440eee1a7a1 ("Staging: fbtft: Switch to
> > > the GPIO descriptor interface") broke GPIO handling completely.
> > > It has already four commits to rectify and it seems not enough.
> > > In order to fix the mess here we:
> > > 
> > >   1) Set default to "inactive" for all requested pins
> > > 
> > >   2) Fix CS, RD, and WR pins polarity since it's active low and
> > >      GPIO descriptor interface takes it into consideration from
> > >      the Device Tree or ACPI
> > > 
> > >   3) Fix RESET pin polarity in the places missed by the commit
> > >      b918d1c27066 ("Staging: fbtft: Fix reset assertion when using gpio descriptor")
> > > 
> > >   4) Consolidate chip activation (CS assert) under default
> > >      ->reset() callback
> > > 
> > > To summarize the expectations about polarity for GPIOs:
> > > 
> > >    #RD			Low
> > >    #WR			Low
> > >    #CS			Low
> > >    #RESET		Low
> > >    DC or RS		High
> > >    RW			High
> > >    Data	0..15		High
> > > 
> > > See also Adafruit learning course [1] for the example of the schematics.
> > > 
> > > While at it, drop unneeded NULL checks, since GPIO API is tolerant to that.
> > > At the end, update TODO to mark this job eventually done.
> > > 
> > > [1]: https://learn.adafruit.com/adafruit-2-8-and-3-2-color-tft-touchscreen-breakout-v2/downloads
> > 
> > Shouldn't this be broken up into "one patch per thing" from your list
> > above?  Feels like you did a lot of different things all in the same
> > patch :(
> 
> I am aware, but breaking to the things here will bring it to the state where
> the functionality is still broken in between. Another point is that the drop
> of unneeded checks will bring the modification of the same line in the code
> twice. Or if you look at 5), for instance, due to CS management breakage,
> fixing it w/o 5) will bring it to the weird case that previously handled CS
> due to lucky defaults from firmware or bootloader, suddenly won't work and
> nothing can help it. The split in this case would look like adding the CS
> handling to all drivers followed by removal all of them. I think it's ugly.
> And so on. Believe me, I really tried hard to split this, but it always
> becomes to undesired result.
> 
> Any ideas how to split that we fix stuff in one commit?

Okay, item 3) can be split to a separate patch.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
