Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDC3B546D
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jun 2021 18:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE58C89E5F;
	Sun, 27 Jun 2021 16:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357DF89E3B;
 Sun, 27 Jun 2021 16:47:28 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id r20so11727058qtp.3;
 Sun, 27 Jun 2021 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IGinKwiNSfxrJd+RUlITcVgWE2FaXzN4ff0xutRXDaU=;
 b=DeEb2ecHoc+9I/oFeMO1TfS4y4+YwjybIHliznobdI/nxpUlDavt/JLpost/dY8G3R
 8cJOtmQqUlYDxeTfYaNQ1/1g1TYrdNZ/A32GllgnS0hha2/HadzrYR0ZR/tRkdZpbxH8
 IzXE19/om+0BCtDEh+5G/TinS7EBlwCBx9XnhCN27I7baiLvgEtBOZ5RxX86Pt8qGGrL
 ti6MAYW24ozYHGBBcO1pRe0GOzYwFWDEmrfrVRXyBEeul012dxIt8kEK88EQW2k3Go1b
 IUG+ysf0WhcqHZpAScjamKwVwTjwtbeNNXEkL9mP8x8n8wShaIzm/RqO9jBhmSlRJ8kA
 7pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IGinKwiNSfxrJd+RUlITcVgWE2FaXzN4ff0xutRXDaU=;
 b=m/TpDMegVHGHkUdFSmTRnxi1AMHhwBYDW5bk3z+q2Lb+GOgyIxM7jgJreWJBuYv8vJ
 PiwkrIAHLRMDdnFUD8djKaIpMakxqXrqT/2Ec+kotydlS7AotVTcPEdF9RAkDhsHUc/b
 HWIDcfGlI5k4llehdNaUyCpLdnxQXH5FpSGb2eXN1Teqxync7nAxmM9No9bSWhQ3Pf5m
 8dUubR/sM7WNQNi3NYL/B1CBgL0PRfgyi+wexeSy8WvpimH5c8M3IgjH5TifCAlhMG9b
 1vMqDV39TqfnUZh3F2S9jgciyUY929g/NmaSUnRCKGO1wxy05YRZM5YN4P+9CXJ53/yB
 E6Sw==
X-Gm-Message-State: AOAM532CyK2IejcUIWYHEu6XJpjH7Plz+1rtAgORQmxmsuTFLrOMa2Ne
 /KdW3IuxRIVJh8UDS8rTBQI=
X-Google-Smtp-Source: ABdhPJzXp6YlfGmAUiYHzOtD1PJTSLr3XCovAHLZvis1ouC9/p4U2/5jfgoQakO2n+2S85GDybfXYQ==
X-Received: by 2002:a05:622a:11cd:: with SMTP id
 n13mr18281355qtk.233.1624812447049; 
 Sun, 27 Jun 2021 09:47:27 -0700 (PDT)
Received: from localhost ([207.98.216.60])
 by smtp.gmail.com with ESMTPSA id 202sm7563423qki.83.2021.06.27.09.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 09:47:26 -0700 (PDT)
Date: Sun, 27 Jun 2021 09:47:25 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 2/3] find: micro-optimize for_each_{set,clear}_bit()
Message-ID: <YNirnaYw1GSxg1jK@yury-ThinkPad>
References: <20210618195735.55933-1-yury.norov@gmail.com>
 <20210618195735.55933-3-yury.norov@gmail.com>
 <87bl81ddqo.wl-maz@kernel.org> <YM4pJpNphEwvUF2F@yury-ThinkPad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YM4pJpNphEwvUF2F@yury-ThinkPad>
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Alexey Klimov <aklimov@redhat.com>, etnaviv@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 19, 2021 at 10:28:07AM -0700, Yury Norov wrote:
> On Sat, Jun 19, 2021 at 05:24:15PM +0100, Marc Zyngier wrote:
> > On Fri, 18 Jun 2021 20:57:34 +0100,
> > Yury Norov <yury.norov@gmail.com> wrote:
> > > 
> > > The macros iterate thru all set/clear bits in a bitmap. They search a
> > > first bit using find_first_bit(), and the rest bits using find_next_bit().
> > > 
> > > Since find_next_bit() is called shortly after find_first_bit(), we can
> > > save few lines of I-cache by not using find_first_bit().
> > 
> > Really?
> > 
> > > 
> > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > ---
> > >  include/linux/find.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/linux/find.h b/include/linux/find.h
> > > index 4500e8ab93e2..ae9ed52b52b8 100644
> > > --- a/include/linux/find.h
> > > +++ b/include/linux/find.h
> > > @@ -280,7 +280,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
> > >  #endif
> > >  
> > >  #define for_each_set_bit(bit, addr, size) \
> > > -	for ((bit) = find_first_bit((addr), (size));		\
> > > +	for ((bit) = find_next_bit((addr), (size), 0);		\
> > 
> > On which architecture do you observe a gain? Only 32bit ARM and m68k
> > implement their own version of find_first_bit(), and everyone else
> > uses the canonical implementation:
> 
> And those who enable GENERIC_FIND_FIRST_BIT - x86, arm64, arc, mips
> and s390.
> 
> > #ifndef find_first_bit
> > #define find_first_bit(addr, size) find_next_bit((addr), (size), 0)
> > #endif
> > 
> > These architectures explicitly have different implementations for
> > find_first_bit() and find_next_bit() because they can do better
> > (whether that is true or not is another debate). I don't think you
> > should remove this optimisation until it has been measured on these
> > two architectures.
> 
> This patch is based on a series that enables separate implementation
> of find_first_bit() for all architectures; according to my tests,
> find_first* is ~ twice faster than find_next* on arm64 and x86.
> 
> https://lore.kernel.org/lkml/20210612123639.329047-1-yury.norov@gmail.com/T/#t
> 
> After applying the series, I noticed that my small kernel module that
> calls for_each_set_bit() is now using find_first_bit() to just find
> one bit, and find_next_bit() for all others. I think it's better to
> always use find_next_bit() in this case to minimize the chance of
> cache miss. But if it's not that obvious, I'll try to write some test.

This test measures the difference between for_each_set_bit() and
for_each_set_bit_from().

diff --git a/lib/find_bit_benchmark.c b/lib/find_bit_benchmark.c
index 5637c5711db9..1f37e99090b0 100644
--- a/lib/find_bit_benchmark.c
+++ b/lib/find_bit_benchmark.c
@@ -111,6 +111,59 @@ static int __init test_find_next_and_bit(const void *bitmap,
 	return 0;
 }
 
+#ifdef CONFIG_X86_64
+#define flush_cache_all() wbinvd()
+#endif
+
+static int __init test_for_each_set_bit(int flags)
+{
+#ifdef flush_cache_all
+	DECLARE_BITMAP(bm, BITS_PER_LONG * 2);
+	unsigned long i, cnt = 0;
+	ktime_t time;
+
+	bm[0] = 1; bm[1] = 0;
+
+	time = ktime_get();
+	while (cnt < 1000) {
+		if (flags)
+			flush_cache_all();
+		for_each_set_bit(i, bm, BITS_PER_LONG * 2)
+			cnt++;
+	}
+
+	time = ktime_get() - time;
+
+	pr_err("for_each_set_bit:   %18llu ns, %6ld iterations\n",  time, cnt);
+#endif
+	return 0;
+}
+
+static int __init test_for_each_set_bit_from(int flags)
+{
+#ifdef flush_cache_all
+	DECLARE_BITMAP(bm, BITS_PER_LONG * 2);
+	unsigned long i, cnt = 0;
+	ktime_t time;
+
+	bm[0] = 1; bm[1] = 0;
+
+	time = ktime_get();
+	while (cnt < 1000) {
+		if (flags)
+			flush_cache_all();
+		i = 0;
+		for_each_set_bit_from(i, bm, BITS_PER_LONG * 2)
+			cnt++;
+	}
+
+	time = ktime_get() - time;
+
+	pr_err("for_each_set_bit_from:%16llu ns, %6ld iterations\n", time, cnt);
+#endif
+	return 0;
+}
+
 static int __init find_bit_test(void)
 {
 	unsigned long nbits = BITMAP_LEN / SPARSE;
@@ -147,6 +200,16 @@ static int __init find_bit_test(void)
 	test_find_first_bit(bitmap, BITMAP_LEN);
 	test_find_next_and_bit(bitmap, bitmap2, BITMAP_LEN);
 
+	pr_err("\nStart testing for_each_bit()\n");
+
+	test_for_each_set_bit(0);
+	test_for_each_set_bit_from(0);
+
+	pr_err("\nStart testing for_each_bit() with cash flushing\n");
+
+	test_for_each_set_bit(1);
+	test_for_each_set_bit_from(1);
+
 	/*
 	 * Everything is OK. Return error just to let user run benchmark
 	 * again without annoying rmmod.

Here on each iteration: 
 - for_each_set_bit() calls find_first_bit() once, and find_next_bit() once.
 - for_each_set_bit_from() calls  find_next_bit() twice.

On my AMD Ryzen 7 4700U, the result is like this:

Start testing for_each_bit()
for_each_set_bit:                15296 ns,   1000 iterations
for_each_set_bit_from:           15225 ns,   1000 iterations

Start testing for_each_bit() with cash flushing
for_each_set_bit:               547626 ns,   1000 iterations
for_each_set_bit_from:          497899 ns,   1000 iterations

for_each_set_bit_from() is ~10% faster than for_each_set_bit() in
case of cold caches, and no significant difference was observed if
flush_cache_all() is not called.

So, it looks reasonable to switch for_each_set_bit() to use
find_next_bit() only.

Thanks,
Yury
