Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DE19E182
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 01:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC55A6ECC1;
	Fri,  3 Apr 2020 23:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514E46ECC1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 23:36:53 +0000 (UTC)
IronPort-SDR: ijZp38kdj9hEmEv8dC9V1aJkNb8+2PiwFZYM6kytH8ruEdnDEEgzipmQTskgaP+KSZn5WvL6YR
 HUYwQVs8cncw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 16:36:52 -0700
IronPort-SDR: 6oIBtUZ/jmWrjUZs9IVm41LQ6enIuxRukYfcqqTujn4cCSOT7/E2wfrxgroRoXoU4i5Akc1Oo8
 NI0IgVxlrsMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="360673902"
Received: from lskarbek-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.249.39.121])
 by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2020 16:36:49 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id 8311721E34; Sat,  4 Apr 2020 02:36:47 +0300 (EEST)
Date: Sat, 4 Apr 2020 02:36:47 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403233647.GA4394@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <20200403102449.GB4882@pendragon.ideasonboard.com>
 <20200403104701.GC3172@kekkonen.localdomain>
 <e44e41317719727ea12aee4ff1e210dea796dd2f.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e44e41317719727ea12aee4ff1e210dea796dd2f.camel@perches.com>
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe,

On Fri, Apr 03, 2020 at 11:38:29AM -0700, Joe Perches wrote:
> On Fri, 2020-04-03 at 13:47 +0300, Sakari Ailus wrote:
> > On Fri, Apr 03, 2020 at 01:24:49PM +0300, Laurent Pinchart wrote:
> > > On Fri, Apr 03, 2020 at 12:11:56PM +0300, Sakari Ailus wrote:
> > > > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > > > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > > > the same implementation can be used.
> []
> > > > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> []
> > > > +static noinline_for_stack
> > > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > > +		    struct printf_spec spec, const char *fmt)
> []
> > > > +	if (fmt[1] != 'c' || fmt[2] != 'c')
> 
> This could check outside a format string if
> the %p4 is at the end of the format string.
> 
> 	printk("%p4", fourcc)
> 
> So this should verify
> 
> 	if (!(fmt[1] == 'c' && fmt[2] == 'c'))

How would these be different in functionality? fmt[2] won't be accessed if
fmt[1] is not 'c' (including '\0'), just like on the line above. I find the
original easier to read.

-- 
Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
