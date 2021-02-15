Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C761C31C05C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 18:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBE46E088;
	Mon, 15 Feb 2021 17:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C5B6E088
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 17:21:39 +0000 (UTC)
IronPort-SDR: O25jU87p2mB3Iof/Y7yjiUKPin2uaH0YeUuYWJkPZJlbbmXfrg0mSB9soV9NPscamuGynJ2ybg
 C1PYDFclWcuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="169861125"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="169861125"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:21:38 -0800
IronPort-SDR: geRpXhgmUT9FMi4UccziIcMxaTZyiBds3SjXanW6DPrJxmk0e5swhB0HicfkwGS4oAhIIEeQTL
 su/W5+KEreZg==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="588917260"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:21:35 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 2A17320518;
 Mon, 15 Feb 2021 19:21:03 +0200 (EET)
Date: Mon, 15 Feb 2021 19:21:03 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v7 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20210215172103.GJ3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
 <YCp3sdZoalFSUS7u@smile.fi.intel.com>
 <20210215135650.GI3@paasikivi.fi.intel.com>
 <YCqZR5N6ktABHXNf@smile.fi.intel.com> <YCqmnG9r2gogFPsH@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCqmnG9r2gogFPsH@alley>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mchehab@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Petr,

On Mon, Feb 15, 2021 at 05:51:40PM +0100, Petr Mladek wrote:
> On Mon 2021-02-15 17:54:47, Andy Shevchenko wrote:
> > On Mon, Feb 15, 2021 at 03:56:50PM +0200, Sakari Ailus wrote:
> > > On Mon, Feb 15, 2021 at 03:31:29PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> > > > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > > > so the same implementation can be used.
> > > > 
> > > > This version I almost like, feel free to add
> > > > Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > after considering addressing below nit-picks.
> > 
> > > > > +Examples::
> > > > > +
> > > > > +	%p4cc	BG12 little-endian (0x32314742)
> > > > 
> > > > No examples with spaces / non-printable / non-ascii characters
> > > 
> > > I can sure add an example that has a space. But do you think I really
> > > should add an example where invalid information is being printed?
> > 
> > I think you have to provide better coverage of what user can get out of this.
> > Perhaps one example with space and non-printable character is enough.
> > 
> > > > > +	char output[sizeof("1234 little-endian (0x01234567)")];
> > > > 
> > > > 1234 -> ABCD ? (Or XY12 to be closer to the reality)
> > > 
> > > I count in numbers... albeit the hexadecimal number there starts from zero.
> > > 
> > > I guess both would work though.
> > > 
> > > 0123 would be consistent.
> > 
> > Since letters can be printed the above is confusing a bit. I think XY12 is
> > closer to the reality than 0123.
> 
> Ailus, are you going to send v8 with the two small changes? I mean a
> selftest with the space and the above sample code.

Yes, and a few more examples.

> 
> Anyway, feel free to add:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Thank you.

It'd be great if we could merge this through the printk tree. Acks are
needed from the DRM people first.

-- 
Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
