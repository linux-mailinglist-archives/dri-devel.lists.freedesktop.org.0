Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915519BC85
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59656E9F4;
	Thu,  2 Apr 2020 07:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C9F6E9F4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 07:18:16 +0000 (UTC)
IronPort-SDR: gw2gIS0CXwqNBSHrhEhi3cswKaAJ7ydmC4U9yFzhtsSdR1TpHURJOyykJ9ezTEu1uvDl/zzkhE
 vN43cVhjhYnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 00:18:16 -0700
IronPort-SDR: zyO7eY/PpiDBlijGqIrfpK9HSgBMKM64PHofMZxjeIa//l2/MH+425bKclVjHvWatif5H2HZKX
 BD9r/3B5EsAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; d="scan'208";a="328726859"
Received: from tronach-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.252.38.191])
 by orsmga001.jf.intel.com with ESMTP; 02 Apr 2020 00:18:09 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id C0C9921F19; Thu,  2 Apr 2020 10:18:01 +0300 (EEST)
Date: Thu, 2 Apr 2020 10:18:01 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200402071801.GA1522@kekkonen.localdomain>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
 <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
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
 dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

Thank you for the review.

On Wed, Apr 01, 2020 at 04:13:51PM +0200, Hans Verkuil wrote:
> On 4/1/20 4:05 PM, Sakari Ailus wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.
> > 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/core-api/printk-formats.rst | 11 +++++++++
> >  lib/vsprintf.c                            | 29 +++++++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index 8ebe46b1af39..b6249f513c09 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -545,6 +545,17 @@ For printing netdev_features_t.
> >  
> >  Passed by reference.
> >  
> > +V4L2 and DRM fourcc code (pixel format)
> > +---------------------------------------
> > +
> > +::
> > +
> > +	%ppf
> > +
> > +Print a 4cc code used by V4L2 or DRM.
> 
> FourCC appears to be the more-or-less official name (https://en.wikipedia.org/wiki/FourCC)
> 
> I would explain about the -BE suffix for bigendian fourcc variants.

Agreed, I'll address these in v2.

> 
> > +
> > +Passed by reference.
> > +
> >  Thanks
> >  ======
> >  
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 7c488a1ce318..b39f0ac317c5 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1721,6 +1721,32 @@ char *netdev_bits(char *buf, char *end, const void *addr,
> >  	return special_hex_number(buf, end, num, size);
> >  }
> >  
> > +static noinline_for_stack
> > +char *pixel_format_string(char *buf, char *end, const u32 *fourcc,
> > +			  struct printf_spec spec, const char *fmt)
> > +{
> > +	char ch[2] = { 0 };
> 
> This can just be '{ };'

As Andy, I also do prefer { 0 }.

> 
> > +	unsigned int i;
> > +
> > +	if (check_pointer(&buf, end, fourcc, spec))
> > +		return buf;
> > +
> > +	switch (fmt[1]) {
> > +	case 'f':
> > +		for (i = 0; i < sizeof(*fourcc); i++) {
> > +			ch[0] = *fourcc >> (i << 3);
> 
> You need to AND with 0x7f, otherwise a big endian fourcc (bit 31 is set)
> will look wrong. Also, each character is standard 7 bit ascii, bit 7 isn't
> used except to indicate a BE variant.

Good point, will fix for v2.

> 
> > +			buf = string(buf, end, ch, spec);
> > +		}
> > +
> > +		if (*fourcc & BIT(31))
> > +			buf = string(buf, end, "-BE", spec);
> > +
> > +		return buf;
> > +	default:
> > +		return error_string(buf, end, "(%pp?)", spec);
> > +	}
> > +}
> > +
> >  static noinline_for_stack
> >  char *address_val(char *buf, char *end, const void *addr,
> >  		  struct printf_spec spec, const char *fmt)
> > @@ -2131,6 +2157,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
> >   *       correctness of the format string and va_list arguments.
> >   * - 'K' For a kernel pointer that should be hidden from unprivileged users
> >   * - 'NF' For a netdev_features_t
> > + * - 'pf' V4L2 or DRM pixel format.
> 
> I'd say 'FourCC format' instead of 'pixel format'.

Will fix.

-- 
Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
