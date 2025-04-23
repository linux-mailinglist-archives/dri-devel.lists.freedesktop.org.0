Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD705A98B73
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C6A10E6AC;
	Wed, 23 Apr 2025 13:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="SHQoA5NP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE6C10E6AC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:39:22 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so56314285e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1745415561; x=1746020361; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LQj0aWA0uhLFimVD63/qUQ7O934wTcmBz9rBbgLbZq4=;
 b=SHQoA5NPVq7XPVpZWQ1w2X2vcC07kisE8A3Y8g932RIIrSaT1v6c8T6LpRuRLMvcFM
 CoXw0NmNDXHj4grSujALS1F3bwmNTM6cxP4MidgaavaBqLJ1qtOSQye0dbjk7BjrKuKt
 t3wc0QClNj0uTK6yxHrH7jWKeD7te+5yvc2O1iqnjuPlOXalyVnIVPGL9tJZllnfL3Dq
 vRR59Q3lbTeegHRzo8DtRLd2LNuFWiocUwm8mq/FzsYytsANChQ3+NGntOKZbTJ1f0KK
 rIiAoxvTRjXVOYUjjdeRiIl9rM3tuACdT64iY1vaSY1KUvnfrOpcmUKdNrbl/0mmcR4h
 Z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745415561; x=1746020361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQj0aWA0uhLFimVD63/qUQ7O934wTcmBz9rBbgLbZq4=;
 b=wUf/TKi/CyzpW6k3qboBzXmubj7THD0wukBmUVKKXAP7c1vUkjAZkboRvscI0PmqJp
 a4dqt2FJXDJCCP70vGMFCvbgjIdgAJn5KWuQKF5DZF1BBbxQzTOL+WJmJEMpqtgOWjCY
 dssnm0Qdyy5aFDTyaEuyubkJzxRTDXDx9Xgv5KdLO++ChPrYy08g5gkdV7gMbshgyBds
 27CzlwSNT9Te6ouI9JNoAbTegHLiX/6DYuQlJ91nbKzrONhcftXuSypwqTfT3o9hW8/H
 kvpU4szRb3gb1LcCtf3W0uSKHdN9XtUkjcP2V07jWFsWKZVnpxHRIrd1cOx7OuXeldI4
 iaNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf6xa+81QancluVrsj+nsOoUBm9wEA7B8y4uIIKMXyAquF08q8fxbj3WZyl++NhaguAJB+EncaDU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9dBiq9EcNXsInEWDu6FiW01xzmckbuFDuB1E7NaUu+YoPR6Sf
 9qv7me7UhN4gAU3zAKs8OBTE8QTrMIW+z4nfP3hESDWJRJ8TkhSBvhX1JNhSug8=
X-Gm-Gg: ASbGncvjyTswwaqYkHIkYHZG0flEFDqAv261a5ZTHcEV1rA18yN0aBWZLOI6vxAXBew
 Ds8txxJGbTt+ItmunaeQp1Z+HtlLPN0ERd9601k6KhdkcSYa1bPELtZLHG+PVtzhK/mCJ4eMhj1
 Em9PLAG3j8fPsZSgYVPmyOoq01VnNy1fy81YSFkOTpGKlyLGwMrI3hS14G1VRkHgw9x9zvCzr8X
 ePXNoJD3onH1IUrjdS3cuEFx4Xm9MgKU+GRjHaTxmhjyE8awU8w8DM1YZ1fW6zvTWIMzfmltya3
 O8vu+DskBFC9MMbh6OnI6g0u5OD6KdmLRu1IP7pMmOs=
X-Google-Smtp-Source: AGHT+IFSUhI0GoSrqlt5Y3r/ho99jNi0Y05l/TGhtWyQ6IK4273s3NboVQgNwSsoCRz1OM2e9M8GYw==
X-Received: by 2002:a05:600c:4e52:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-4408efbaebemr42210395e9.26.1745415561308; 
 Wed, 23 Apr 2025 06:39:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092b0a4b5sm26482605e9.0.2025.04.23.06.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:39:20 -0700 (PDT)
Date: Wed, 23 Apr 2025 15:39:18 +0200
From: Petr Mladek <pmladek@suse.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>,
 alyssa@rosenzweig.io, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <aAjthvTuIeUIO4CT@pathway.suse.cz>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
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

On Tue 2025-04-22 10:43:59, Geert Uytterhoeven wrote:
> Hi Aditya,
> 
> CC netdev
> 
> On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> > On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> > >> From: Hector Martin <marcan@marcan.st>
> > >>
> > >> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> > >> it's useful to be able to print generic 4-character codes formatted as
> > >> an integer. Extend it to add format specifiers for printing generic
> > >> 32-bit FourCCs with various endian semantics:
> > >>
> > >> %p4ch   Host byte order
> > >> %p4cn   Network byte order
> > >> %p4cl   Little-endian
> > >> %p4cb   Big-endian
> > >>
> > >> The endianness determines how bytes are interpreted as a u32, and the
> > >> FourCC is then always printed MSByte-first (this is the opposite of
> > >> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> > >> allow printing LSByte-first FourCCs stored in host endian order
> > >> (other than the hex form being in character order, not the integer
> > >> value).
> > >>
> > >> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >> Reviewed-by: Petr Mladek <pmladek@suse.com>
> > >> Tested-by: Petr Mladek <pmladek@suse.com>
> > >> Signed-off-by: Hector Martin <marcan@marcan.st>
> > >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> > >
> > > Thanks for your patch, which is now commit 1938479b2720ebc0
> > > ("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
> > > in drm-misc-next/
> > >
> > >> --- a/Documentation/core-api/printk-formats.rst
> > >> +++ b/Documentation/core-api/printk-formats.rst
> > >> @@ -648,6 +648,38 @@ Examples::
> > >>         %p4cc   Y10  little-endian (0x20303159)
> > >>         %p4cc   NV12 big-endian (0xb231564e)
> > >>
> > >> +Generic FourCC code
> > >> +-------------------
> > >> +
> > >> +::
> > >> +       %p4c[hnlb]      gP00 (0x67503030)
> > >> +
> > >> +Print a generic FourCC code, as both ASCII characters and its numerical
> > >> +value as hexadecimal.
> > >> +
> > >> +The generic FourCC code is always printed in the big-endian format,
> > >> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> > >> +
> > >> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> > >> +endianness is used to load the stored bytes. The data might be interpreted
> > >> +using the host byte order, network byte order, little-endian, or big-endian.
> > >> +
> > >> +Passed by reference.
> > >> +
> > >> +Examples for a little-endian machine, given &(u32)0x67503030::
> > >> +
> > >> +       %p4ch   gP00 (0x67503030)
> > >> +       %p4cn   00Pg (0x30305067)
> > >> +       %p4cl   gP00 (0x67503030)
> > >> +       %p4cb   00Pg (0x30305067)
> > >> +
> > >> +Examples for a big-endian machine, given &(u32)0x67503030::
> > >> +
> > >> +       %p4ch   gP00 (0x67503030)
> > >> +       %p4cn   00Pg (0x30305067)
> > >
> > > This doesn't look right to me, as network byte order is big endian?
> > > Note that I didn't check the code.
> >
> > Originally, it was %p4cr (reverse-endian), but on the request of the maintainers, it was changed to %p4cn.
> 
> Ah, I found it[1]:
> 
> | so, it needs more information that this mimics htonl() / ntohl() for
> networking.
> 
> IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
> while %p4ch and %p4cl yield different results on big-endian.
> 
> > So here network means reverse of host, not strictly big-endian.
> 
> Please don't call it "network byte order" if that does not have the same
> meaning as in the network subsystem.
> 
> Personally, I like "%p4r" (reverse) more...
> (and "%p4ch" might mean human-readable ;-)
> 
> [1] https://lore.kernel.org/all/Z8B6DwcRbV-8D8GB@smile.fi.intel.com

I have to admit that I was always a bit confused by the meaning of the
new modifiers. And I did give up at some point and decided to do not
block the patch when it made sense to others.

But I have to agree with Geert here. The current behavior of %p4ch
is confusing on big endian system. I would expect that it does not
revert the ordering.

Well, I still think that people might find all 4 variants useful.
Andy does not like "r". What about "hR"? It is inspired by
the existing %pmR.

I tried to implement it and the complexity of the code is similar:

From f6aa2213cec9b9d25c0506e3112f32e90a18aa7f Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Wed, 23 Apr 2025 15:02:10 +0200
Subject: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data in
 reversed host ordering

The generic FourCC format always prints the data using the big endian
order. It is generic because it allows to read the data using a custom
ordering.

The current code uses "n" for reading data in the reverse host ordering.
It makes the 4 variants [hnbl] consistent with the generic printing
of IPv4 addresses.

Unfortunately, it creates confusion on big endian systems. For example,
it shows the data &(u32)0x67503030 as

	%p4cn	00Pg (0x30305067)

But people expect that the ordering stays the same. The network ordering
is a big-endian ordering.

The problem is that the semantic is not the same. The modifiers affect
the output ordering of IPv4 addresses while they affect the reading order
in case of FourCC code.

Avoid the confusion by replacing the "n" modifier with "hR", aka
reverse host ordering.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 Documentation/core-api/printk-formats.rst | 10 +++++-----
 lib/tests/printf_kunit.c                  |  2 +-
 lib/vsprintf.c                            | 11 ++++++++---
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 125fd0397510..f531873bb3c9 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -652,7 +652,7 @@ Generic FourCC code
 -------------------
 
 ::
-	%p4c[hnlb]	gP00 (0x67503030)
+	%p4c[h[R]lb]	gP00 (0x67503030)
 
 Print a generic FourCC code, as both ASCII characters and its numerical
 value as hexadecimal.
@@ -660,23 +660,23 @@ value as hexadecimal.
 The generic FourCC code is always printed in the big-endian format,
 the most significant byte first. This is the opposite of V4L/DRM FourCCs.
 
-The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
+The additional ``h``, ``hR``, ``l``, and ``b`` specifiers define what
 endianness is used to load the stored bytes. The data might be interpreted
-using the host byte order, network byte order, little-endian, or big-endian.
+using the host, reversed host byte order, little-endian, or big-endian.
 
 Passed by reference.
 
 Examples for a little-endian machine, given &(u32)0x67503030::
 
 	%p4ch	gP00 (0x67503030)
-	%p4cn	00Pg (0x30305067)
+	%p4chR	00Pg (0x30305067)
 	%p4cl	gP00 (0x67503030)
 	%p4cb	00Pg (0x30305067)
 
 Examples for a big-endian machine, given &(u32)0x67503030::
 
 	%p4ch	gP00 (0x67503030)
-	%p4cn	00Pg (0x30305067)
+	%p4chR	00Pg (0x30305067)
 	%p4cl	00Pg (0x30305067)
 	%p4cb	gP00 (0x67503030)
 
diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index b1fa0dcea52f..b8a4b5006f9c 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -738,7 +738,7 @@ static void fourcc_pointer(struct kunit *kunittest)
 
 	fourcc_pointer_test(kunittest, try_cc, ARRAY_SIZE(try_cc), "%p4cc");
 	fourcc_pointer_test(kunittest, try_ch, ARRAY_SIZE(try_ch), "%p4ch");
-	fourcc_pointer_test(kunittest, try_cn, ARRAY_SIZE(try_cn), "%p4cn");
+	fourcc_pointer_test(kunittest, try_cn, ARRAY_SIZE(try_cn), "%p4chR");
 	fourcc_pointer_test(kunittest, try_cl, ARRAY_SIZE(try_cl), "%p4cl");
 	fourcc_pointer_test(kunittest, try_cb, ARRAY_SIZE(try_cb), "%p4cb");
 }
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 2c5de4216415..34587b2dbdb1 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1804,9 +1804,8 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
 	orig = get_unaligned(fourcc);
 	switch (fmt[2]) {
 	case 'h':
-		break;
-	case 'n':
-		orig = swab32(orig);
+		if (fmt[3] == 'R')
+			orig = swab32(orig);
 		break;
 	case 'l':
 		orig = (__force u32)cpu_to_le32(orig);
@@ -2396,6 +2395,12 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  *       read the documentation (path below) first.
  * - 'NF' For a netdev_features_t
  * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
+ * - '4c[h[R]lb]' For generic FourCC code with raw numerical value. Both are
+ *	 displayed in the big-endian format. This is the opposite of V4L2 or
+ *	 DRM FourCCs.
+ *	 The additional specifiers define what endianness is used to load
+ *	 the stored bytes. The data might be interpreted using the host,
+ *	 reversed host byte order, little-endian, or big-endian.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
-- 
2.49.0

