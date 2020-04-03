Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC619D3E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 11:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BF86EB56;
	Fri,  3 Apr 2020 09:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28DB6EB56
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 09:39:26 +0000 (UTC)
IronPort-SDR: vwR8sIlrlwnKPydHcnrSkhMPMfZqtY+V1WEPajvbn6sCRCJzOBNSenGxelEXIutKN5d9iHwLyi
 sgzk1kc9SKrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:39:25 -0700
IronPort-SDR: mrfzUyQhdnAbx6mzKGKFsTZVO2V/SsCPoTEyp8okqq/FlyrMWR9/Xl6C1QvBColw/C4o0d4tcH
 M/aQK3AzdKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451242657"
Received: from seemahan-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.249.38.56])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:39:22 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id 6354521F19; Fri,  3 Apr 2020 12:39:17 +0300 (EEST)
Date: Fri, 3 Apr 2020 12:39:16 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403093916.GA3172@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <20200403093103.GI1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403093103.GI1922688@smile.fi.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the comments.

On Fri, Apr 03, 2020 at 12:31:03PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 03, 2020 at 12:11:56PM +0300, Sakari Ailus wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.
> 
> ...
> 
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> 
> > +#define FOURCC_STRING_BE	"-BE"
> > +	char s[sizeof(*fourcc) + sizeof(FOURCC_STRING_BE)] = { 0 };
> 
> I guess it makes it too complicated.

The above also clearly binds the size to the data that is expected to
contain there. I'd prefer keeping it as-is. And yes, 8 would be correct,
too.

> 
> 	char s[8];
> 
> > +	if (check_pointer(&buf, end, fourcc, spec))
> > +		return buf;
> > +
> > +	if (fmt[1] != 'c' || fmt[2] != 'c')
> > +		return error_string(buf, end, "(%p4?)", spec);
> > +
> 
> > +	put_unaligned_le32(*fourcc & ~BIT(31), s);
> 
> Can you elaborate what the difference in output with this bit set over cleared?
> I.o.w. why don't we need to put it as BE and for LE case addd "-LE"?

The established practice is that big endian formats have "-BE" suffix
whereas the little endian ones have nothing. (At least when it comes to
V4L2.)

> 
> > +	if (*fourcc & BIT(31))
> > +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> > +			sizeof(FOURCC_STRING_BE));
> 
> We know the size, and we may put '\0' as well
> 	if (*fourcc & BIT(31))
> 		strscpy(&s[4], "-BE", sizeof("-BE"));
> 	else
> 		strscpy(&s[4], "", sizeof(""));

The rest of the struct memory has already been set to zero in variable
declaration.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
