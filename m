Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7F19D534
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 12:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A736E0C2;
	Fri,  3 Apr 2020 10:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BE76E0C2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 10:47:10 +0000 (UTC)
IronPort-SDR: d+I4AIvdx7+Vgs78CeIglHC3/RJO9z7WT6gXbCGTRS1bCWtoNmMNCesdNq5Z9u1ADAarkVVdUh
 aNDcfhn6CMrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 03:47:10 -0700
IronPort-SDR: 8ti4Qol5gbB/MXswR0sGQ9fX6aCU580MMij4U73bTkAipfBPgWDTHjcfnIYtRY7sCvhQJ6msMf
 oWSzhTIMCqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="273909028"
Received: from seemahan-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.249.38.56])
 by fmsmga004.fm.intel.com with ESMTP; 03 Apr 2020 03:47:07 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id 3EF0F21F19; Fri,  3 Apr 2020 13:47:02 +0300 (EEST)
Date: Fri, 3 Apr 2020 13:47:02 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403104701.GC3172@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <20200403102449.GB4882@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403102449.GB4882@pendragon.ideasonboard.com>
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
 Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the comments.

On Fri, Apr 03, 2020 at 01:24:49PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Apr 03, 2020 at 12:11:56PM +0300, Sakari Ailus wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.
> > 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Improve documentation (add -BE suffix, refer to "FourCC".
> > 
> > - Use '%p4cc' conversion specifier instead of '%ppf'.
> > 
> > - Fix 31st bit handling in printing FourCC codes.
> > 
> > - Use string() correctly, to allow e.g. proper field width handling.
> > 
> > - Remove loop, use put_unaligned_le32() instead.
> > 
> >  Documentation/core-api/printk-formats.rst | 12 +++++++++++
> >  lib/vsprintf.c                            | 25 +++++++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index 8ebe46b1af39..550568520ab6 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -545,6 +545,18 @@ For printing netdev_features_t.
> >  
> >  Passed by reference.
> >  
> > +V4L2 and DRM FourCC code (pixel format)
> > +---------------------------------------
> > +
> > +::
> > +
> > +	%p4cc
> > +
> > +Print a FourCC code used by V4L2 or DRM. The "-BE" suffix is added on big endian
> > +formats.
> > +
> > +Passed by reference.
> > +
> >  Thanks
> >  ======
> >  
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 7c488a1ce318..93eea6a320da 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1721,6 +1721,28 @@ char *netdev_bits(char *buf, char *end, const void *addr,
> >  	return special_hex_number(buf, end, num, size);
> >  }
> >  
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> > +#define FOURCC_STRING_BE	"-BE"
> > +	char s[sizeof(*fourcc) + sizeof(FOURCC_STRING_BE)] = { 0 };
> > +
> > +	if (check_pointer(&buf, end, fourcc, spec))
> > +		return buf;
> > +
> > +	if (fmt[1] != 'c' || fmt[2] != 'c')
> > +		return error_string(buf, end, "(%p4?)", spec);
> > +
> > +	put_unaligned_le32(*fourcc & ~BIT(31), s);
> > +
> > +	if (*fourcc & BIT(31))
> > +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> > +			sizeof(FOURCC_STRING_BE));
> > +
> > +	return string(buf, end, s, spec);
> 
> Taking V4L2_PIX_FMT_Y16_BE as an example, this will print 'Y16 -BE'
> (without quotes). There are other 4CCs that contain spaces and would
> suffer from a similar issue. Even in little-endian format, it would
> result in additional spaces in the output string. Is this what we want ?
> Should the caller always enclose the 4CC in quotes or brackets for
> clarity ? Or should still be done here ?

Good question. Space is indeed a valid character in a 4cc code.

If I omit one or more spaces, it will no longer be a 4cc, but a 3cc or even
a 2cc. Jokes aside, there are probably fair arguments both ways.

I presume there's no 4cc code where the location of a space would make a
difference but all of the spaces are trailing spaces.

It's also worth noting that the formats printed are mostly for debugging
purpose and thus even getting a hypothetical case wrong is not a grave
issue. This would also support just printing them as-is though.

I'm leaning slightly towards omitting any spaces if the code has them. This
is something that couldn't be done by using a macro...

-- 
Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
