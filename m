Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400001BA9AD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 18:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB9D6E32C;
	Mon, 27 Apr 2020 16:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0127.hostedemail.com
 [216.40.44.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCFE6E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 16:02:38 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id CE7BD18029587;
 Mon, 27 Apr 2020 16:02:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:968:973:981:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1544:1593:1594:1605:1711:1730:1747:1777:1792:2393:2538:2559:2562:2689:2691:2692:2828:2898:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3873:4321:4605:5007:6119:6120:6742:7875:7901:7903:7904:7974:8603:8784:9036:10004:11026:11232:11473:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13160:13161:13229:13255:13439:14659:14721:21080:21220:21451:21627:21990:30030:30034:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: ship96_33c1d1869b436
X-Filterd-Recvd-Size: 5476
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Apr 2020 16:02:35 +0000 (UTC)
Message-ID: <0c487ba493f4b4c0f68b3dfd23f14a080e4fb0c2.camel@perches.com>
Subject: Re: [RESEND PATCH v3 1/1] lib/vsprintf: Add support for printing
 V4L2 and DRM fourccs
From: Joe Perches <joe@perches.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>
Date: Mon, 27 Apr 2020 09:02:34 -0700
In-Reply-To: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
References: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-04-27 at 17:53 +0300, Sakari Ailus wrote:
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.
[]
> - Added WARN_ON_ONCE() sanity checks. Comments on these are welcome; I'd
>   expect them mostly be covered by the tests.

All the WARN_ON_ONCE uses are not necessary.

> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
[]
> @@ -1721,6 +1721,89 @@ char *netdev_bits(char *buf, char *end, const void *addr,
>  	return special_hex_number(buf, end, num, size);
>  }
>  
> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *__fourcc,
> +		    struct printf_spec spec, const char *fmt)

There's no reason to use __ prefixed argument names here.

> +{
> +#define FOURCC_HEX_CHAR_STR		"(xx)"
> +#define FOURCC_BIG_ENDIAN_STR		" big-endian"
> +#define FOURCC_LITTLE_ENDIAN_STR	" little-endian"

I don't believe used-once macro defines are useful.

> +#define FOURCC_HEX_NUMBER		" (0x01234567)"

> +#define FOURCC_STRING_MAX						\
> +	FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR	\
> +	FOURCC_HEX_CHAR_STR FOURCC_LITTLE_ENDIAN_STR FOURCC_HEX_NUMBER

This is very difficult to read and is size dependent on
the size of little-endian > big_endian

I'd write it out

	FOURCC_STRING_MAX	sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")

and then not have the define at all but use
the written out string in the declaration.

> +	struct printf_spec my_spec = {
> +		.type = FORMAT_TYPE_UINT,
> +		.field_width = 2,
> +		.flags = SMALL,
> +		.base = 16,
> +		.precision = -1,
> +	};

my_spec isn't usefully named, likely not necessary at all,
and if really necessary, it should be static const

> +	char __s[sizeof(FOURCC_STRING_MAX)];

I'd declare the buffer

	char fourcc[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)"];

like all the other specialty functions do.

> +	char *s = __s;

There's no reason to use __ prefixed variable names here either.
All the other specialty function use:

	char *p = <output_buffer_name>;

> +	unsigned int i;

just int i; is typical

> +	/*
> +	 * The 31st bit defines the endianness of the data, so save its printing
> +	 * for later.
> +	 */
> +	u32 fourcc = *__fourcc & ~BIT(31);

	bool be = fourcc & BIT(31);

> +	int ret;
> +
> +	if (check_pointer(&buf, end, __fourcc, spec))
> +		return buf;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(buf, end, "(%p4?)", spec);
> +
> +	for (i = 0; i < sizeof(fourcc); i++, fourcc >>= 8) {
> +		unsigned char c = fourcc >> (i*8);

Please remove the fourcc >>= 8 from the loop and use

		unsigned char c = fourcc >> (i*8);

If I understand this correctly, I think this is simpler:

		if (isascii(c) && isprint(c)) {
			*s++ = c;
		} else {
			*s++ = '(';
			s = hex_byte_pack(s, c);
			*s++ = ')';
		}

> +
> +		/* Weed out spaces */
> +		if (c == ' ')
> +			continue;
> +
> +		/* Print non-control characters as-is */
> +		if (c > ' ') {
> +			*s = c;
> +			s++;
> +			continue;
> +		}
> +
> +		if (WARN_ON_ONCE(sizeof(__s) <
> +				 (s - __s) + sizeof(FOURCC_HEX_CHAR_STR)))
> +			break;
> +
> +		*s = '(';
> +		s++;
> +		s = number(s, s + 2, c, my_spec);
> +		*s = ')';
> +		s++;
> +	}
> +
> +	ret = strscpy(s, *__fourcc & BIT(31) ? FOURCC_BIG_ENDIAN_STR
> +					     : FOURCC_LITTLE_ENDIAN_STR,
> +		      sizeof(__s) - (s - __s));

If you size the initial buffer correctly, strscpy is unnecessary.

	strcpy(s, <bit31> ? "big endian" : "little endian");
	s += strlen(s);

> +	if (!WARN_ON_ONCE(ret < 0))
> +		s += ret;
> +
> +	if (!WARN_ON_ONCE(sizeof(__s) <
> +			  (s - __s) + sizeof(FOURCC_HEX_NUMBER))) {
> +		*s = ' ';
> +		s++;
> +		*s = '(';
> +		s++;

		*s++ = ' ';
		*s++ = '(';

+		/* subtract parentheses and the space from the size */
> +		special_hex_number(s, s + sizeof(FOURCC_HEX_NUMBER) - 3,
> +				   *__fourcc, sizeof(u32));
> +		s += sizeof(u32) * 2 + 2 /* 0x */;
> +		*s = ')';
> +		s++;
		*s++ = ')';

> +		*s = '\0';
> +	}
> +
> +	return string(buf, end, __s, spec);
> +}
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
