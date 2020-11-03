Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF92A5F4E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C81F89487;
	Wed,  4 Nov 2020 08:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9899F6ECCB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 14:46:49 +0000 (UTC)
IronPort-SDR: uKx5YM3oPNPBu7S6wLaSSC9rVe4I5Z1BIE1vqXyT9+RnjGtLOaXv9pOc5Yzoz7fNTuGxTod8PZ
 Oi1qaEND87Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="233228899"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="233228899"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 06:46:49 -0800
IronPort-SDR: EjuroLYVH7sHSk0NjvP6CMOCZ8CpZrUNGFwdHGgfnMFIKSpjRlD7oZbo5aBPd570P+gmrNS1Kv
 ie4tot7f/1nA==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="306065252"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 06:46:45 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kZxb9-003V4L-D1; Tue, 03 Nov 2020 16:47:47 +0200
Date: Tue, 3 Nov 2020 16:47:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201103144747.GD4077@smile.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
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

On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.

...

> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{
> +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];

I would add a comment that there is another possibility, i.e. big-endian, but
it occupies less space.

> +	char *p = output;
> +	unsigned int i;
> +	u32 val;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(output, end, "(%p4?)", spec);
> +
> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	val = *fourcc & ~BIT(31);
> +
> +	for (i = 0; i < sizeof(*fourcc); i++) {
> +		unsigned char c = val >> (i * 8);
> +
> +		/* Weed out spaces */
> +		if (c == ' ')
> +			continue;
> +
> +		/* Print non-control ASCII characters as-is */
> +		if (isascii(c) && isprint(c)) {
> +			*p++ = c;
> +			continue;
> +		}
> +
> +		*p++ = '(';
> +		p = hex_byte_pack(p, c);
> +		*p++ = ')';
> +	}

I guess above loop can be still optimized, but I have to think about it.

> +	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> +	p += strlen(p);
> +
> +	*p++ = ' ';
> +	*p++ = '(';
> +	/* subtract parenthesis and the space from the size */

This comment misleading. What you are subtracting is a room for closing
parenthesis and NUL.

> +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> +			       sizeof(u32));

I would go with one line here.

The (theoretical) problem is here that the case when buffer size is not enough
to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
snprintf() does in general.

> +	*p++ = ')';
> +	*p = '\0';
> +
> +	return string(buf, end, output, spec);
> +}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
