Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EAD1BBDEE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFEC6E3A8;
	Tue, 28 Apr 2020 12:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DF46E328
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 15:44:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w20so18124700ljj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sVsyz0n2LjXG2IMJx6t3VUYyNBTpyfFbeltK0qpohx0=;
 b=UrD5xFXslZfgP/IsODr4Z3GfOpeNr4l2Y9wwbLA2CxuzqDDSj+VxthzWKGbPbBzx+V
 YFw7RxVyUbIHs9BPMtLAAdksSlCa1ApMHm8w1kmkg+wpKWWC7zT92sWOiWh0RQB6NlTq
 9ck5vp+KJa8tVJztLzVD4UJBbtroaw2dWunMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVsyz0n2LjXG2IMJx6t3VUYyNBTpyfFbeltK0qpohx0=;
 b=irlXtEd4N+mfi3drHxTMm6Oo6ZNo+KoenM2zAPO7tXbkDe9Deitunhw+XCXnrVvcEj
 KcCCJpn80mWThwM1USTx0QjNNukBdseQqqajxDGgOK56wKHXaGKs8ZcwHIJ6cmKXdZ/5
 GjTisOjXTo0P5Umcmyu8KsNJeodMWlvt+vdIU9Bmx5S+D1lNxHj2uAOwnZXrc1D9Nda5
 2ACCXnqOzgTnVwT8gjQ6K1UnK4yQi2S1i53FIim+Z4Wb5qeuyfwAgtK8FrJ4wph/qj6L
 olYMiQs90MTV5safCP9gqfyibPOZUtP6jFrXQXGK7zYwpolM5l7iOmYc5ic01qGs5Pif
 OX0w==
X-Gm-Message-State: AGi0Pua6WUl4SQm73b7rKX2N18jk5aa/OOq1GdbMfTj6HGSiIhUy1l6p
 yIUyrrZHdkThN9XNlyAkHtf2UQ==
X-Google-Smtp-Source: APiQypIo4iuWFF1BSuZmM63rM6Vr2tOgjUljme//kEiDbJuxhm8cbNTY4mYBxzl23MRK4Zgp1JnkkQ==
X-Received: by 2002:a2e:3017:: with SMTP id w23mr14890688ljw.150.1588002243139; 
 Mon, 27 Apr 2020 08:44:03 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-116-45.cgn.fibianet.dk.
 [5.186.116.45])
 by smtp.gmail.com with ESMTPSA id b28sm10171986ljo.1.2020.04.27.08.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 08:44:02 -0700 (PDT)
Subject: Re: [RESEND PATCH v3 1/1] lib/vsprintf: Add support for printing V4L2
 and DRM fourccs
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>
References: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f97e4cf1-c3c6-80b1-5d17-167d60515236@rasmusvillemoes.dk>
Date: Mon, 27 Apr 2020 17:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2020 16.53, Sakari Ailus wrote:
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.
> 
> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v2:
> 
> - Add comments to explain why things are being done
> 
> - Print characters under 32 (space) as hexadecimals in parenthesis.
> 
> - Do not print spaces in the fourcc codes.
> 
> - Make use of a loop over the fourcc characters instead of
>   put_unaligned_le32(). This is necessary to omit spaces in the output.
> 
> - Use DRM style format instead of V4L2. This provides the precise code as
>   a numerical value as well as explicit endianness information.
> 
> - Added WARN_ON_ONCE() sanity checks. Comments on these are welcome; I'd
>   expect them mostly be covered by the tests.
> 
> - Added tests for %p4cc in lib/test_printf.c
> 
>  Documentation/core-api/printk-formats.rst | 12 ++++
>  lib/test_printf.c                         | 17 +++++
>  lib/vsprintf.c                            | 86 +++++++++++++++++++++++
>  3 files changed, 115 insertions(+)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 8ebe46b1af39..7aa0451e06fb 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -545,6 +545,18 @@ For printing netdev_features_t.
>  
>  Passed by reference.
>  
> +V4L2 and DRM FourCC code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +	%p4cc
> +
> +Print a FourCC code used by V4L2 or DRM, including format endianness and
> +its numerical value as hexadecimal.
> +
> +Passed by reference.
> +
>  Thanks
>  ======
>  
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 2d9f520d2f27..a14754086707 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -624,6 +624,22 @@ static void __init fwnode_pointer(void)
>  	software_node_unregister_nodes(softnodes);
>  }
>  
> +static void __init fourcc_pointer(void)
> +{
> +	struct {
> +		u32 code;
> +		char *str;
> +	} const try[] = {
> +		{ 0x20104646, "FF(10) little-endian (0x20104646)", },
> +		{ 0xa0104646, "FF(10) big-endian (0xa0104646)", },
> +		{ 0x10111213, "(13)(12)(11)(10) little-endian (0x10111213)", },
> +	};
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(try); i++)
> +		test(try[i].str, "%p4cc", &try[i].code);
> +}
> +
>  static void __init
>  errptr(void)
>  {
> @@ -668,6 +684,7 @@ test_pointer(void)
>  	flags();
>  	errptr();
>  	fwnode_pointer();
> +	fourcc_pointer();
>  }
>  
>  static void __init selftest(void)
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 7c488a1ce318..02e7906619c0 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1721,6 +1721,89 @@ char *netdev_bits(char *buf, char *end, const void *addr,
>  	return special_hex_number(buf, end, num, size);
>  }
>  
> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *__fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{
> +#define FOURCC_HEX_CHAR_STR		"(xx)"
> +#define FOURCC_BIG_ENDIAN_STR		" big-endian"
> +#define FOURCC_LITTLE_ENDIAN_STR	" little-endian"
> +#define FOURCC_HEX_NUMBER		" (0x01234567)"
> +#define FOURCC_STRING_MAX						\
> +	FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR	\
> +	FOURCC_HEX_CHAR_STR FOURCC_LITTLE_ENDIAN_STR FOURCC_HEX_NUMBER
> +	struct printf_spec my_spec = {
> +		.type = FORMAT_TYPE_UINT,
> +		.field_width = 2,
> +		.flags = SMALL,
> +		.base = 16,
> +		.precision = -1,
> +	};
> +	char __s[sizeof(FOURCC_STRING_MAX)];
> +	char *s = __s;
> +	unsigned int i;
> +	/*
> +	 * The 31st bit defines the endianness of the data, so save its printing
> +	 * for later.
> +	 */
> +	u32 fourcc = *__fourcc & ~BIT(31);
> +	int ret;

Dereference __fourcc ...

> +	if (check_pointer(&buf, end, __fourcc, spec))
> +		return buf;

.. and then sanity check it?

> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(buf, end, "(%p4?)", spec);

Doesn't that want to come before everything else, including the
check_pointer()?

> +	for (i = 0; i < sizeof(fourcc); i++, fourcc >>= 8) {
> +		unsigned char c = fourcc;
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

Are you sure you want to pass non-ascii characters through?

> +		if (WARN_ON_ONCE(sizeof(__s) <
> +				 (s - __s) + sizeof(FOURCC_HEX_CHAR_STR)))
> +			break;

I really don't see the point of these checks.  Why check here but not
before we output a non-control character? That seems rather arbitrary.
Also, assume we do take this break, (to be continued below [*])

> +		*s = '(';
> +		s++;
> +		s = number(s, s + 2, c, my_spec);

You can drop my_spec and just use "s = hex_byte_pack(s, c);".

> +		*s = ')';
> +		s++;
> +	}
> +
> +	ret = strscpy(s, *__fourcc & BIT(31) ? FOURCC_BIG_ENDIAN_STR
> +					     : FOURCC_LITTLE_ENDIAN_STR,
> +		      sizeof(__s) - (s - __s));
> +	if (!WARN_ON_ONCE(ret < 0))
> +		s += ret;
> +
> +	if (!WARN_ON_ONCE(sizeof(__s) <
> +			  (s - __s) + sizeof(FOURCC_HEX_NUMBER))) {

[*] then AFAICT this WARN_ON_ONCE is guaranteed to also fire [the
left-hand side is the same as before, the right-hand side consists of a
quantity s-__s that can only be larger or equal than before and a
constant sizeof(FOURCC_HEX_NUMBER) that is definitely larger], hence we
do not enter this if () and [**]

> +		*s = ' ';
> +		s++;
> +		*s = '(';
> +		s++;
> +		/* subtract parentheses and the space from the size */
> +		special_hex_number(s, s + sizeof(FOURCC_HEX_NUMBER) - 3,
> +				   *__fourcc, sizeof(u32));

Urgh. Don't we have an ARRAY_END() macro that let's you call this with
(s, ARRAY_END(__s)) as buf, end?

> +		s += sizeof(u32) * 2 + 2 /* 0x */;

Why, when special_hex_number returns a pointer to one-past-its-output?

> +		*s = ')';
> +		s++;
> +		*s = '\0';
> +	}
> +
> +	return string(buf, end, __s, spec);

[**] __s does not get nul-terminated, so we call string() with stack
garbage.

I'd say just drop those checks, and de-obfuscate the sizing of the __s
array so it becomes obviously large enough for what the algorithm can
produce. Just

char __s[sizeof("(01)(02)(03)(04) little-endian (0x01020304)")]

or something like that should be sufficient.

Rasmus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
