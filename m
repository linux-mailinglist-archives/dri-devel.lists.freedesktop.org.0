Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700042A5F6A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B3189C18;
	Wed,  4 Nov 2020 08:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB2F6E8DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 15:46:24 +0000 (UTC)
IronPort-SDR: oATB62HpZuOqW5sscm6m1prxqTqGlSy59pocWPBuO6bZn1J5Vx0D0GWpPcDv0Ao2QVZWRAoMRG
 qdKqK5tdGchA==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="148925742"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="148925742"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 07:45:57 -0800
IronPort-SDR: 0N5GIaDzQLTkm+QI39DbxKEIqUgnz5PwMjSHGBBwSEp6ZtuJ/rWshE7S5SHGOl/RSjDs9/b9fO
 nsR9K8XyzagA==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="320484142"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 07:45:54 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kZyWN-003ZmP-UA; Tue, 03 Nov 2020 17:46:55 +0200
Date: Tue, 3 Nov 2020 17:46:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201103154655.GE4077@smile.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
 <20201103144747.GD4077@smile.fi.intel.com>
 <20201103145616.GJ26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103145616.GJ26150@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 04:56:16PM +0200, Sakari Ailus wrote:
> On Tue, Nov 03, 2020 at 04:47:47PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > so the same implementation can be used.

...

> > > +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > 
> > I would add a comment that there is another possibility, i.e. big-endian, but
> > it occupies less space.
> 
> This string is here to represent the longest possible output of the
> function. Most of the time it's less. Saying that might make sense but it's
> fairly clear already. Either way works for me though.

It's not known by reading the above line. I would add a comment.

...

> > > +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > +			       sizeof(u32));
> > 
> > I would go with one line here.
> 
> It's wrapped since the result would be over 80 otherwise.

It will be not the first one breaking the limit in this module for the sake of
readability.

...

> > The (theoretical) problem is here that the case when buffer size is not enough
> > to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
> > snprintf() does in general.

Any comments here?
Perhaps you need to add a comment to explain that the overflow is impossible.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
