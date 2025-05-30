Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B5AC8AAA
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 11:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6649510E7E9;
	Fri, 30 May 2025 09:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="jV0apYW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269910E052
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gR91zQSzqCbc3p6LvARTFu1cbopw2P782WLK55P4y9w=; b=jV0apYW3ub6N06ZD9T9v3FuV5K
 8OCyuhQR5SUnrJzr922AI1qgToxXFgO6EzLmuCrDcA/SAGntoV2dm5WIgeh03WDK7kBzT1wX8R5t6
 bkw5aawChHySMdH/PAEr65qjbXWItpI1HhRp+G7EG9yqA7dJKsP+mPNGqnKBXVklbZLjojJ17Pm+F
 9F7RLHZ8ySEobL386mYcnQHYD+DdNM+V8SbXXa0fk4RyzIclP0yJuqJME0Idb/NGKNZgONhF/3fuL
 RRTe6GPIIVatAgaezKjvjGVe0khmr6MN/kUZHdkBUmmUOGeMaQ5WSdeWRT7gkRXHBcvQkSyDC8K2m
 fPb95lpw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uKvzA-00000000EJS-2hvT; Fri, 30 May 2025 09:25:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1C03B30066A; Fri, 30 May 2025 11:25:08 +0200 (CEST)
Date: Fri, 30 May 2025 11:25:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
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
Message-ID: <20250530092507.GC21197@noisy.programming.kicks-ass.net>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <202505281546.DB9D9029@keescook>
 <20250529090219.GA24938@noisy.programming.kicks-ass.net>
 <202505291033.E7E3E6C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505291033.E7E3E6C@keescook>
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

On Thu, May 29, 2025 at 10:46:15AM -0700, Kees Cook wrote:

> Doing it on the other end doesn't look great (see the other reply).  I was
> suggesting it's not on fast path because the added code is a dependant
> conditional following an "unlikley" conditional. But if you wanted to
> push it totally out of line, we'd likely need to pass __func__ into
> warn_slowpath_fmt() and __warn_printk(), and then have __warn_printk()

warn_slowpath_fmt() already uses buildin_return_address(0), and then it
can use kallsyms to find the symbol name. No need to pass __func__ as a
string.

> return bool to make the call to __WARN_FLAGS() conditional. e.g.:
> 
> -		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg); \
> +		warn_slowpath_fmt(__FILE__, __LINE__, __func__, taint, arg); \
> 
> and:
> 
> -		__warn_printk(arg);					\
> -		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
> +		if (__warn_printk(__func__, arg))			\
> +			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
> 
> But it still leaves bare __WARN unhandled...

Nah, don't propagate, just eat the __WARN and handle things in
__report_bug(), which is where they all end up.

But the real purpose here seems to be to supress printk output, so why
not use 'suppress_printk' ?
