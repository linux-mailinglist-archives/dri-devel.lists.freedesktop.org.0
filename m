Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA8AC81CD
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 19:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2176410E16F;
	Thu, 29 May 2025 17:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DpnJR87G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF3D10E76D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 17:46:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5E90749CB1;
 Thu, 29 May 2025 17:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303F8C4CEE7;
 Thu, 29 May 2025 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748540779;
 bh=D6A2f6OkNP4xGxAQPA6G3CiIW40sQ0PkrUg3mi6Z0AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpnJR87GaELawUixDTHfSmRN6b/gA21GhykOU16QhMXszDYe4FVPtQDLqUwrRnV7t
 seDcPRCSlr9BldKs0xHoRGZSkJ+MdZ+B2c+kim8YIOKMU8kQZhDU1dPl/PQaKK3Hcb
 KN4SfPs36An1mtTbD2m/YA/KRM8gnrbeAx0s7TvW9+uCT2JgW4+3mr4s7H6YhPpcSk
 aeFx43YyE8qvuw14krEYwTcMgCKtb+HIH4EGte1V4QRxWtsDFi/pic0Fpm1/MqCOun
 KlANLVEqX8X4La91SV7MXJFuD9+XoQR3gOM8xU5t1CjZ5yvUjh0qGxV0bVO5RPdVXH
 UB3AwjJ9Ak5Kg==
Date: Thu, 29 May 2025 10:46:15 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <202505291033.E7E3E6C@keescook>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <202505281546.DB9D9029@keescook>
 <20250529090219.GA24938@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529090219.GA24938@noisy.programming.kicks-ass.net>
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

On Thu, May 29, 2025 at 11:02:19AM +0200, Peter Zijlstra wrote:
> On Wed, May 28, 2025 at 03:47:42PM -0700, Kees Cook wrote:
> > On Mon, May 26, 2025 at 01:27:51PM +0000, Alessandro Carminati wrote:
> > > Some unit tests intentionally trigger warning backtraces by passing bad
> > > parameters to kernel API functions. Such unit tests typically check the
> > > return value from such calls, not the existence of the warning backtrace.
> > > 
> > > Such intentionally generated warning backtraces are neither desirable
> > > nor useful for a number of reasons:
> > > - They can result in overlooked real problems.
> > > - A warning that suddenly starts to show up in unit tests needs to be
> > >   investigated and has to be marked to be ignored, for example by
> > >   adjusting filter scripts. Such filters are ad hoc because there is
> > >   no real standard format for warnings. On top of that, such filter
> > >   scripts would require constant maintenance.
> > > 
> > > Solve the problem by providing a means to identify and suppress specific
> > > warning backtraces while executing test code. Support suppressing multiple
> > > backtraces while at the same time limiting changes to generic code to the
> > > absolute minimum.
> > > 
> > > Implementation details:
> > > Check suppression directly in the `WARN()` Macros.
> > > This avoids the need for function symbol resolution or ELF section
> > > modification.
> > > Suppression is implemented directly in the `WARN*()` macros.
> > > 
> > > A helper function, `__kunit_is_suppressed_warning()`, is used to determine
> > > whether suppression applies. It is marked as `noinstr`, since some `WARN*()`
> > > sites reside in non-instrumentable sections. As it uses `strcmp`, a
> > > `noinstr` version of `strcmp` was introduced.
> > > The implementation is deliberately simple and avoids architecture-specific
> > > optimizations to preserve portability. Since this mechanism compares
> > > function names and is intended for test usage only, performance is not a
> > > primary concern.
> > > 
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > I like this -- it's very simple, it doesn't need to be fast-path, so
> > a linear list walker with strcmp is fine. Nice!
> 
> But it is on the fast path! This is still bloating every UD2 site
> instead of doing it on the other end.

Doing it on the other end doesn't look great (see the other reply).  I was
suggesting it's not on fast path because the added code is a dependant
conditional following an "unlikley" conditional. But if you wanted to
push it totally out of line, we'd likely need to pass __func__ into
warn_slowpath_fmt() and __warn_printk(), and then have __warn_printk()
return bool to make the call to __WARN_FLAGS() conditional. e.g.:

-		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg); \
+		warn_slowpath_fmt(__FILE__, __LINE__, __func__, taint, arg); \

and:

-		__warn_printk(arg);					\
-		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
+		if (__warn_printk(__func__, arg))			\
+			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\

But it still leaves bare __WARN unhandled...

-- 
Kees Cook
