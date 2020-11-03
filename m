Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8652A4679
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 14:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1B6EC9F;
	Tue,  3 Nov 2020 13:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B249F6EC9F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 13:31:50 +0000 (UTC)
IronPort-SDR: R7Epp6bdn9Hupb2MVLmb4Bgj2CSnP1OL5arwFGdkuE7g3smP4XZLy8rgKO5aFbcHfgoqE2d7Hu
 ax1KdeEs024A==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="168266924"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="168266924"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 05:31:50 -0800
IronPort-SDR: uMdaK5CiZEP78/7GO9Gp/GSllkNVGoo6Ya74JJl//qmwjYdPzhOy6s5stD9B3KZYpYu5A0awCt
 Zi/g5O4XNDcA==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="426305996"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 05:31:47 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id E8606209D9; Tue,  3 Nov 2020 15:31:44 +0200 (EET)
Date: Tue, 3 Nov 2020 15:31:44 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RESEND PATCH v3 1/1] lib/vsprintf: Add support for printing
 V4L2 and DRM fourccs
Message-ID: <20201103133144.GI26150@paasikivi.fi.intel.com>
References: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
 <f97e4cf1-c3c6-80b1-5d17-167d60515236@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f97e4cf1-c3c6-80b1-5d17-167d60515236@rasmusvillemoes.dk>
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
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rasmus,

Thanks for the review.

On Mon, Apr 27, 2020 at 05:44:00PM +0200, Rasmus Villemoes wrote:
> On 27/04/2020 16.53, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> > 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v2:
> > 
> > - Add comments to explain why things are being done
> > 
> > - Print characters under 32 (space) as hexadecimals in parenthesis.
> > 
> > - Do not print spaces in the fourcc codes.
> > 
> > - Make use of a loop over the fourcc characters instead of
> >   put_unaligned_le32(). This is necessary to omit spaces in the output.
> > 
> > - Use DRM style format instead of V4L2. This provides the precise code as
> >   a numerical value as well as explicit endianness information.
> > 
> > - Added WARN_ON_ONCE() sanity checks. Comments on these are welcome; I'd
> >   expect them mostly be covered by the tests.
> > 
> > - Added tests for %p4cc in lib/test_printf.c
> > 
> >  Documentation/core-api/printk-formats.rst | 12 ++++
> >  lib/test_printf.c                         | 17 +++++
> >  lib/vsprintf.c                            | 86 +++++++++++++++++++++++
> >  3 files changed, 115 insertions(+)
> > 
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index 8ebe46b1af39..7aa0451e06fb 100644
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
> > +Print a FourCC code used by V4L2 or DRM, including format endianness and
> > +its numerical value as hexadecimal.
> > +
> > +Passed by reference.
> > +
> >  Thanks
> >  ======
> >  
> > diff --git a/lib/test_printf.c b/lib/test_printf.c
> > index 2d9f520d2f27..a14754086707 100644
> > --- a/lib/test_printf.c
> > +++ b/lib/test_printf.c
> > @@ -624,6 +624,22 @@ static void __init fwnode_pointer(void)
> >  	software_node_unregister_nodes(softnodes);
> >  }
> >  
> > +static void __init fourcc_pointer(void)
> > +{
> > +	struct {
> > +		u32 code;
> > +		char *str;
> > +	} const try[] = {
> > +		{ 0x20104646, "FF(10) little-endian (0x20104646)", },
> > +		{ 0xa0104646, "FF(10) big-endian (0xa0104646)", },
> > +		{ 0x10111213, "(13)(12)(11)(10) little-endian (0x10111213)", },
> > +	};
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(try); i++)
> > +		test(try[i].str, "%p4cc", &try[i].code);
> > +}
> > +
> >  static void __init
> >  errptr(void)
> >  {
> > @@ -668,6 +684,7 @@ test_pointer(void)
> >  	flags();
> >  	errptr();
> >  	fwnode_pointer();
> > +	fourcc_pointer();
> >  }
> >  
> >  static void __init selftest(void)
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 7c488a1ce318..02e7906619c0 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1721,6 +1721,89 @@ char *netdev_bits(char *buf, char *end, const void *addr,
> >  	return special_hex_number(buf, end, num, size);
> >  }
> >  
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *__fourcc,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> > +#define FOURCC_HEX_CHAR_STR		"(xx)"
> > +#define FOURCC_BIG_ENDIAN_STR		" big-endian"
> > +#define FOURCC_LITTLE_ENDIAN_STR	" little-endian"
> > +#define FOURCC_HEX_NUMBER		" (0x01234567)"
> > +#define FOURCC_STRING_MAX						\
> > +	FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR	\
> > +	FOURCC_HEX_CHAR_STR FOURCC_LITTLE_ENDIAN_STR FOURCC_HEX_NUMBER
> > +	struct printf_spec my_spec = {
> > +		.type = FORMAT_TYPE_UINT,
> > +		.field_width = 2,
> > +		.flags = SMALL,
> > +		.base = 16,
> > +		.precision = -1,
> > +	};
> > +	char __s[sizeof(FOURCC_STRING_MAX)];
> > +	char *s = __s;
> > +	unsigned int i;
> > +	/*
> > +	 * The 31st bit defines the endianness of the data, so save its printing
> > +	 * for later.
> > +	 */
> > +	u32 fourcc = *__fourcc & ~BIT(31);
> > +	int ret;
> 
> Dereference __fourcc ...
> 
> > +	if (check_pointer(&buf, end, __fourcc, spec))
> > +		return buf;
> 
> .. and then sanity check it?
> 
> > +	if (fmt[1] != 'c' || fmt[2] != 'c')
> > +		return error_string(buf, end, "(%p4?)", spec);
> 
> Doesn't that want to come before everything else, including the
> check_pointer()?

Agreed on all three.

> 
> > +	for (i = 0; i < sizeof(fourcc); i++, fourcc >>= 8) {
> > +		unsigned char c = fourcc;
> > +
> > +		/* Weed out spaces */
> > +		if (c == ' ')
> > +			continue;
> > +
> > +		/* Print non-control characters as-is */
> > +		if (c > ' ') {
> > +			*s = c;
> > +			s++;
> > +			continue;
> > +		}
> 
> Are you sure you want to pass non-ascii characters through?

I'll print the hexadecimal value in v4.

> 
> > +		if (WARN_ON_ONCE(sizeof(__s) <
> > +				 (s - __s) + sizeof(FOURCC_HEX_CHAR_STR)))
> > +			break;
> 
> I really don't see the point of these checks.  Why check here but not
> before we output a non-control character? That seems rather arbitrary.
> Also, assume we do take this break, (to be continued below [*])

Will remove.

> 
> > +		*s = '(';
> > +		s++;
> > +		s = number(s, s + 2, c, my_spec);
> 
> You can drop my_spec and just use "s = hex_byte_pack(s, c);".

Ack, this cleans it up indeed.

> 
> > +		*s = ')';
> > +		s++;
> > +	}
> > +
> > +	ret = strscpy(s, *__fourcc & BIT(31) ? FOURCC_BIG_ENDIAN_STR
> > +					     : FOURCC_LITTLE_ENDIAN_STR,
> > +		      sizeof(__s) - (s - __s));
> > +	if (!WARN_ON_ONCE(ret < 0))
> > +		s += ret;
> > +
> > +	if (!WARN_ON_ONCE(sizeof(__s) <
> > +			  (s - __s) + sizeof(FOURCC_HEX_NUMBER))) {
> 
> [*] then AFAICT this WARN_ON_ONCE is guaranteed to also fire [the
> left-hand side is the same as before, the right-hand side consists of a
> quantity s-__s that can only be larger or equal than before and a
> constant sizeof(FOURCC_HEX_NUMBER) that is definitely larger], hence we
> do not enter this if () and [**]
> 
> > +		*s = ' ';
> > +		s++;
> > +		*s = '(';
> > +		s++;
> > +		/* subtract parentheses and the space from the size */
> > +		special_hex_number(s, s + sizeof(FOURCC_HEX_NUMBER) - 3,
> > +				   *__fourcc, sizeof(u32));
> 
> Urgh. Don't we have an ARRAY_END() macro that let's you call this with
> (s, ARRAY_END(__s)) as buf, end?

We do, yes. In drivers/block/floppy.c. :-)

> 
> > +		s += sizeof(u32) * 2 + 2 /* 0x */;
> 
> Why, when special_hex_number returns a pointer to one-past-its-output?

I'll use that for v4.

> 
> > +		*s = ')';
> > +		s++;
> > +		*s = '\0';
> > +	}
> > +
> > +	return string(buf, end, __s, spec);
> 
> [**] __s does not get nul-terminated, so we call string() with stack
> garbage.
> 
> I'd say just drop those checks, and de-obfuscate the sizing of the __s
> array so it becomes obviously large enough for what the algorithm can
> produce. Just
> 
> char __s[sizeof("(01)(02)(03)(04) little-endian (0x01020304)")]
> 
> or something like that should be sufficient.

Done.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
