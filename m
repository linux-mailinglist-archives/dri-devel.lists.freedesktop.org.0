Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7EA2B1962
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 11:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580EE6E49F;
	Fri, 13 Nov 2020 10:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A5F6E49F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:54:24 +0000 (UTC)
IronPort-SDR: 7VjKhBtaSmcGB3JtV+aHVV6K9w1tgU30YVm4cXy4HBKPTni8rYbZKBTah3u3w9m1dxGlQV8hhm
 E6P1QTdC4qjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="158233736"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="158233736"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 02:54:23 -0800
IronPort-SDR: CqYnJPCz85Lt+Zl46+QWnqQoSIbJs9rraLE/sDGJGNJQmvn0olodnEO95VXNg27Cu+wQyV1Q4t
 bs6BUj7spy9g==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="309130601"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 02:54:20 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 7B63320736; Fri, 13 Nov 2020 12:54:18 +0200 (EET)
Date: Fri, 13 Nov 2020 12:54:18 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201113105418.GB15897@paasikivi.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
 <20201103144747.GD4077@smile.fi.intel.com>
 <20201103145616.GJ26150@paasikivi.fi.intel.com>
 <b389f6991ede1f8ae89a0dbaa8deab06aecc6146.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b389f6991ede1f8ae89a0dbaa8deab06aecc6146.camel@perches.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe,

On Tue, Nov 03, 2020 at 08:49:36AM -0800, Joe Perches wrote:
> On Tue, 2020-11-03 at 16:56 +0200, Sakari Ailus wrote:
> > On Tue, Nov 03, 2020 at 04:47:47PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> > > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > > so the same implementation can be used.
> > > 
> > > ...
> > > 
> > > > +static noinline_for_stack
> > > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > > +		    struct printf_spec spec, const char *fmt)
> > > > +{
> > > > +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > > 
> > > I would add a comment that there is another possibility, i.e. big-endian, but
> > > it occupies less space.
> 
> I think it's unnecessary as it's obvious and similarly done in other
> <foo>_string type functions.
> 
> > > > +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > > +			       sizeof(u32));
> > > 
> > > I would go with one line here.
> > 
> > It's wrapped since the result would be over 80 otherwise.
> 
> Perhaps simpler as
> 
> 	p = special_hex_number(p, p + 10, *fourcc, sizeof(u32));

Yes. But having bugs elsewhere would have a magnified effect. I wouldn't be
afraid of a newline here.

> 
> > > The (theoretical) problem is here that the case when buffer size is not enough
> > > to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
> > > snprintf() does in general.
> 
> Isn't the stack buffer known to be large enough?

Yes. If there are no bugs, that is.

> 
> > > > +	*p++ = ')';
> > > > +	*p = '\0';
> > > > +
> > > > +	return string(buf, end, output, spec);
> 
> Isn't the actual output buffer used here truncating output?
> 
> If the general problem is someone using a limited length pointer
> output like %10p4cc, then all the output is getting truncated no?

Correct. But I'd also be surprised if anyone ever used this feature.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
