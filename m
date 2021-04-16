Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4463336220C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2C76EB74;
	Fri, 16 Apr 2021 14:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4836EB74
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:21:04 +0000 (UTC)
IronPort-SDR: yvp0IGk3kRhhKb/iF7yPzTHucDcZPnDhsTjwIppi2RvqsXX/HKXWO6lo7ytrpDbo2beYWjvjih
 eTGoOncABRwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="175152810"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="175152810"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 07:21:03 -0700
IronPort-SDR: zmdCb34RpMljdFJ+iFsV9Zoyu2JS5v7cl2KQLOEOFPzdsUfs7jvKZ8+gpfyVdcNURMi5bs2RCa
 iCh1XdmGXiBA==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="461979133"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 07:21:01 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lXPL8-004fR5-6x; Fri, 16 Apr 2021 17:20:58 +0300
Date: Fri, 16 Apr 2021 17:20:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/2] fbtft: Rectify GPIO handling
Message-ID: <YHmdSpN4PIZghsgS@smile.fi.intel.com>
References: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
 <YHmIb2YrwfzZa7Wh@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHmIb2YrwfzZa7Wh@kroah.com>
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

On Fri, Apr 16, 2021 at 02:51:59PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 16, 2021 at 03:31:16PM +0300, Andy Shevchenko wrote:
> > The infamous commit c440eee1a7a1 ("Staging: fbtft: Switch to
> > the GPIO descriptor interface") broke GPIO handling completely.
> > It has already four commits to rectify and it seems not enough.
> > In order to fix the mess here we:
> > 
> >   1) Set default to "inactive" for all requested pins
> > 
> >   2) Fix CS, RD, and WR pins polarity since it's active low and
> >      GPIO descriptor interface takes it into consideration from
> >      the Device Tree or ACPI
> > 
> >   3) Fix RESET pin polarity in the places missed by the commit
> >      b918d1c27066 ("Staging: fbtft: Fix reset assertion when using gpio descriptor")
> > 
> >   4) Consolidate chip activation (CS assert) under default
> >      ->reset() callback
> > 
> > To summarize the expectations about polarity for GPIOs:
> > 
> >    #RD			Low
> >    #WR			Low
> >    #CS			Low
> >    #RESET		Low
> >    DC or RS		High
> >    RW			High
> >    Data	0..15		High
> > 
> > See also Adafruit learning course [1] for the example of the schematics.
> > 
> > While at it, drop unneeded NULL checks, since GPIO API is tolerant to that.
> > At the end, update TODO to mark this job eventually done.
> > 
> > [1]: https://learn.adafruit.com/adafruit-2-8-and-3-2-color-tft-touchscreen-breakout-v2/downloads
> 
> Shouldn't this be broken up into "one patch per thing" from your list
> above?  Feels like you did a lot of different things all in the same
> patch :(

Okay, I split a bit, now it's 4 patches. (See v2).

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
