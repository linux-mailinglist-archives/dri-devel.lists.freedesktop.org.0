Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F932A48B8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 15:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546E56ECD2;
	Tue,  3 Nov 2020 14:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F7A6ECD2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 14:56:22 +0000 (UTC)
IronPort-SDR: WhYCxoCgof8OlaNpO2FHCEhfRoUtajOp2ZeMpynY9Ek7LKQuZPs4mksAu79w4yrhvqtADVpQd6
 hQTf2ZdphjVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="156841349"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="156841349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 06:56:22 -0800
IronPort-SDR: KYI2S/nqQuwfQOylVpgemLjwXWSAsuFH0eNZBI3VQ4uLQsyg4Qhf6eguLRBChQdggD6DtpMRXf
 updwEaV03DaQ==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="306067752"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 06:56:18 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id BC4DE209D9; Tue,  3 Nov 2020 16:56:16 +0200 (EET)
Date: Tue, 3 Nov 2020 16:56:16 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201103145616.GJ26150@paasikivi.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
 <20201103144747.GD4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103144747.GD4077@smile.fi.intel.com>
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

Hi Andy,

On Tue, Nov 03, 2020 at 04:47:47PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> 
> ...
> 
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> > +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> 
> I would add a comment that there is another possibility, i.e. big-endian, but
> it occupies less space.

This string is here to represent the longest possible output of the
function. Most of the time it's less. Saying that might make sense but it's
fairly clear already. Either way works for me though.

> 
> > +	char *p = output;
> > +	unsigned int i;
> > +	u32 val;
> > +
> > +	if (fmt[1] != 'c' || fmt[2] != 'c')
> > +		return error_string(output, end, "(%p4?)", spec);
> > +
> > +	if (check_pointer(&buf, end, fourcc, spec))
> > +		return buf;
> > +
> > +	val = *fourcc & ~BIT(31);
> > +
> > +	for (i = 0; i < sizeof(*fourcc); i++) {
> > +		unsigned char c = val >> (i * 8);
> > +
> > +		/* Weed out spaces */
> > +		if (c == ' ')
> > +			continue;
> > +
> > +		/* Print non-control ASCII characters as-is */
> > +		if (isascii(c) && isprint(c)) {
> > +			*p++ = c;
> > +			continue;
> > +		}
> > +
> > +		*p++ = '(';
> > +		p = hex_byte_pack(p, c);
> > +		*p++ = ')';
> > +	}
> 
> I guess above loop can be still optimized, but I have to think about it.
> 
> > +	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> > +	p += strlen(p);
> > +
> > +	*p++ = ' ';
> > +	*p++ = '(';
> > +	/* subtract parenthesis and the space from the size */
> 
> This comment misleading. What you are subtracting is a room for closing
> parenthesis and NUL.

Agreed, I'll update it for v5.

> 
> > +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > +			       sizeof(u32));
> 
> I would go with one line here.

It's wrapped since the result would be over 80 otherwise.

> 
> The (theoretical) problem is here that the case when buffer size is not enough
> to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
> snprintf() does in general.
> 
> > +	*p++ = ')';
> > +	*p = '\0';
> > +
> > +	return string(buf, end, output, spec);
> > +}
> 

-- 
Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
