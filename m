Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D636BA9F667
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4464610E61D;
	Mon, 28 Apr 2025 17:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681AE10E61A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 17:00:44 +0000 (UTC)
Date: Mon, 28 Apr 2025 13:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745859640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sg8XZ9CR9qDeTIx+rDJpUhFGbbTBIqmoWO1me0C2EqA=;
 b=XeSJpptCZOnw5pTqme5mUnDdWRKVctf29A4FYstbOqnwQb/DPLicYPTZh6e8kWhp9dv3LV
 ma47SY4duzEpvJWlBFdznEqif9Vl9P2ZUX04kivJhyd9WvaFJL7jIcPr/9dUaNZc3ObzsW
 qwir6XwNwskDGdQ/8be5tZIup1zELlwvLIIxbTY1Zk2KxHpube6N1RztL6lGwdYsxcjjue
 bFu54pJEow5hveQW5vwnNOnUrO4KX2Pr9qSJtxzfVpN96bhY9dJoFWSJGKutzvhIq6A8b1
 36lOqO8zdlTBL0VwxWiIE2N4dDyk02fUxPDQOOtgm5r3mfIzRWAu0Xqiw9Uhzw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Petr Mladek <pmladek@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Aditya Garg <gargaditya08@live.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-ID: <aA-0MuLxVTueDAhm@blossom>
References: <20250428123132.578771-1-pmladek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Since the other patches went thru drm-misc-next, I guess this should
too?


Le Mon , Apr 28, 2025 at 02:31:32PM +0200, Petr Mladek a écrit :
> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
> 
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
> 
> Unfortunately, it creates confusion on big endian systems. For example,
> it shows the data &(u32)0x67503030 as
> 
> 	%p4cn	00Pg (0x30305067)
> 
> But people expect that the ordering stays the same. The network ordering
> is a big-endian ordering.
> 
> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.
> 
> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering. It is inspired by the existing %p[mM]R printf
> format.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/r/CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
> Hi,
> 
> I am sending this as a proper patch. It would be nice to queue it
> together with the other patches adding the generic printf modifiers.
> 
> Best Regards,
> Petr
> ---
> Documentation/core-api/printk-formats.rst | 10 +++++-----
>  lib/tests/printf_kunit.c                  |  4 ++--
>  lib/vsprintf.c                            | 11 ++++++++---
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 125fd0397510..f531873bb3c9 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -652,7 +652,7 @@ Generic FourCC code
>  -------------------
>  
>  ::
> -	%p4c[hnlb]	gP00 (0x67503030)
> +	%p4c[h[R]lb]	gP00 (0x67503030)
>  
>  Print a generic FourCC code, as both ASCII characters and its numerical
>  value as hexadecimal.
> @@ -660,23 +660,23 @@ value as hexadecimal.
>  The generic FourCC code is always printed in the big-endian format,
>  the most significant byte first. This is the opposite of V4L/DRM FourCCs.
>  
> -The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> +The additional ``h``, ``hR``, ``l``, and ``b`` specifiers define what
>  endianness is used to load the stored bytes. The data might be interpreted
> -using the host byte order, network byte order, little-endian, or big-endian.
> +using the host, reversed host byte order, little-endian, or big-endian.
>  
>  Passed by reference.
>  
>  Examples for a little-endian machine, given &(u32)0x67503030::
>  
>  	%p4ch	gP00 (0x67503030)
> -	%p4cn	00Pg (0x30305067)
> +	%p4chR	00Pg (0x30305067)
>  	%p4cl	gP00 (0x67503030)
>  	%p4cb	00Pg (0x30305067)
>  
>  Examples for a big-endian machine, given &(u32)0x67503030::
>  
>  	%p4ch	gP00 (0x67503030)
> -	%p4cn	00Pg (0x30305067)
> +	%p4chR	00Pg (0x30305067)
>  	%p4cl	00Pg (0x30305067)
>  	%p4cb	gP00 (0x67503030)
>  
> diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
> index b1fa0dcea52f..bc54cca2d7a6 100644
> --- a/lib/tests/printf_kunit.c
> +++ b/lib/tests/printf_kunit.c
> @@ -726,7 +726,7 @@ static void fourcc_pointer(struct kunit *kunittest)
>  	static const struct fourcc_struct try_ch[] = {
>  		{ 0x41424344, "ABCD (0x41424344)", },
>  	};
> -	static const struct fourcc_struct try_cn[] = {
> +	static const struct fourcc_struct try_chR[] = {
>  		{ 0x41424344, "DCBA (0x44434241)", },
>  	};
>  	static const struct fourcc_struct try_cl[] = {
> @@ -738,7 +738,7 @@ static void fourcc_pointer(struct kunit *kunittest)
>  
>  	fourcc_pointer_test(kunittest, try_cc, ARRAY_SIZE(try_cc), "%p4cc");
>  	fourcc_pointer_test(kunittest, try_ch, ARRAY_SIZE(try_ch), "%p4ch");
> -	fourcc_pointer_test(kunittest, try_cn, ARRAY_SIZE(try_cn), "%p4cn");
> +	fourcc_pointer_test(kunittest, try_chR, ARRAY_SIZE(try_chR), "%p4chR");
>  	fourcc_pointer_test(kunittest, try_cl, ARRAY_SIZE(try_cl), "%p4cl");
>  	fourcc_pointer_test(kunittest, try_cb, ARRAY_SIZE(try_cb), "%p4cb");
>  }
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 2c5de4216415..34587b2dbdb1 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1804,9 +1804,8 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
>  	orig = get_unaligned(fourcc);
>  	switch (fmt[2]) {
>  	case 'h':
> -		break;
> -	case 'n':
> -		orig = swab32(orig);
> +		if (fmt[3] == 'R')
> +			orig = swab32(orig);
>  		break;
>  	case 'l':
>  		orig = (__force u32)cpu_to_le32(orig);
> @@ -2396,6 +2395,12 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
>   *       read the documentation (path below) first.
>   * - 'NF' For a netdev_features_t
>   * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
> + * - '4c[h[R]lb]' For generic FourCC code with raw numerical value. Both are
> + *	 displayed in the big-endian format. This is the opposite of V4L2 or
> + *	 DRM FourCCs.
> + *	 The additional specifiers define what endianness is used to load
> + *	 the stored bytes. The data might be interpreted using the host,
> + *	 reversed host byte order, little-endian, or big-endian.
>   * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
>   *            a certain separator (' ' by default):
>   *              C colon
> -- 
> 2.49.0
> 
