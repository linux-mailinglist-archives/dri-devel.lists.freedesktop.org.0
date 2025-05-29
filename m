Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F6AC7A91
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 11:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB3D10E720;
	Thu, 29 May 2025 09:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="D0p438Kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE4410E720
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4rPjHyO1ImjfX55E2k5VoZ01eHeMPnzv3/koD1bA2Rw=; b=D0p438Kf5mlprmqRVogIIHQsYh
 HJ/q3CXjGlZZZrdL/+ZAPMrxAUTScM5jGy9h3tCvTNLkxK/VU7N4/+7T8Lv0upCxQs2tLHTa+YbE2
 JDL+AuS2CNPgKy3JLdYs1zPOK3pjfknYNl+IRo10uQBbqb06b/9TWDPcN9MPmICUdXqOt04elWGcN
 z1jPG0mi/V99rdCXNHWedorf/WEL4kQcpTON2TICuR0/yMMUV/GQHuuHiHKXZEgRmya/mNx9kd7gR
 knobjRVBP894kXb000cjon+3g1Ow6ftff1ibC1Amz2siZIaiTgHVV+1VEXrlte8tU8EIiZ8cGvIs6
 aVu3QTVw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uKZ8k-0000000Eaug-2OvC; Thu, 29 May 2025 09:01:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 964CA30057C; Thu, 29 May 2025 11:01:29 +0200 (CEST)
Date: Thu, 29 May 2025 11:01:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526132755.166150-2-acarmina@redhat.com>
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

On Mon, May 26, 2025 at 01:27:51PM +0000, Alessandro Carminati wrote:

>  #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
>  #define __WARN_printf(taint, arg...) do {				\
> -		instrumentation_begin();				\
> -		__warn_printk(arg);					\
> -		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
> -		instrumentation_end();					\
> +		if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
> +			instrumentation_begin();			\
> +			__warn_printk(arg);				\
> +			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE |		\
> +				BUGFLAG_TAINT(taint));			\
> +			instrumentation_end();				\
> +		}							\
>  	} while (0)
>  #define WARN_ON_ONCE(condition) ({				\
>  	int __ret_warn_on = !!(condition);			\
> -	if (unlikely(__ret_warn_on))				\
> +	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
>  		__WARN_FLAGS(BUGFLAG_ONCE |			\
>  			     BUGFLAG_TAINT(TAINT_WARN));	\
>  	unlikely(__ret_warn_on);				\
> @@ -121,7 +130,7 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
>  #ifndef WARN_ON
>  #define WARN_ON(condition) ({						\
>  	int __ret_warn_on = !!(condition);				\
> -	if (unlikely(__ret_warn_on))					\
> +	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
>  		__WARN();						\
>  	unlikely(__ret_warn_on);					\
>  })
> @@ -138,7 +147,7 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
>  
>  #define WARN_TAINT(condition, taint, format...) ({			\
>  	int __ret_warn_on = !!(condition);				\
> -	if (unlikely(__ret_warn_on))					\
> +	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
>  		__WARN_printf(taint, format);				\
>  	unlikely(__ret_warn_on);					\
>  })
> @@ -157,8 +166,10 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
>  #else /* !CONFIG_BUG */
>  #ifndef HAVE_ARCH_BUG
>  #define BUG() do {		\
> -	do {} while (1);	\
> -	unreachable();		\
> +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
> +		do {} while (1);					\
> +		unreachable();						\
> +	}								\
>  } while (0)
>  #endif

NAK

This is again doing it wrong -- this will bloat every frigging bug/warn
site for no reason. 

Like I said before; you need to do this on the report_bug() size of
things.
