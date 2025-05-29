Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FAAC7A96
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 11:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBB410E15C;
	Thu, 29 May 2025 09:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="eMNB7fUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EAC10E15C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HKJazYyVUxZwZjpx7rpY6/R5Vj8bS07F1odK3H9jHLg=; b=eMNB7fUo/1FgcxbOdQuF2r/kYX
 qV1xN+llHYjOp7B0PwNTJpfs7dzrSlOcVTibvnRFZ/qrogqn1MY4T3QsxTwblw3hoqHAeoD9hJ2qR
 Awih0ms4vbkG83lzrvofFOYNU4EblQ+qHfb5WfpW4wcjf1cVyBdODinakYxgaePnC79A6Xq16Sk/5
 4xll1VA2wdEKkEwFYNLcdn/n1x0fUTlZNjNN0kRrGQuv73cFpfoznp2yt7OpBCpcuVKmFXT9dSmPP
 fW+TlbJYnKz/F80qHoNIl7R2zmTzMpgr4AC3UYVhKIgYZFDlLsAjDNq7tMrT8/cyFMefKCVXZsjSy
 4Tch/ddA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uKZ9Y-000000006vJ-3HJd; Thu, 29 May 2025 09:02:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id DC66430057C; Thu, 29 May 2025 11:02:19 +0200 (CEST)
Date: Thu, 29 May 2025 11:02:19 +0200
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
Message-ID: <20250529090219.GA24938@noisy.programming.kicks-ass.net>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <202505281546.DB9D9029@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505281546.DB9D9029@keescook>
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

On Wed, May 28, 2025 at 03:47:42PM -0700, Kees Cook wrote:
> On Mon, May 26, 2025 at 01:27:51PM +0000, Alessandro Carminati wrote:
> > Some unit tests intentionally trigger warning backtraces by passing bad
> > parameters to kernel API functions. Such unit tests typically check the
> > return value from such calls, not the existence of the warning backtrace.
> > 
> > Such intentionally generated warning backtraces are neither desirable
> > nor useful for a number of reasons:
> > - They can result in overlooked real problems.
> > - A warning that suddenly starts to show up in unit tests needs to be
> >   investigated and has to be marked to be ignored, for example by
> >   adjusting filter scripts. Such filters are ad hoc because there is
> >   no real standard format for warnings. On top of that, such filter
> >   scripts would require constant maintenance.
> > 
> > Solve the problem by providing a means to identify and suppress specific
> > warning backtraces while executing test code. Support suppressing multiple
> > backtraces while at the same time limiting changes to generic code to the
> > absolute minimum.
> > 
> > Implementation details:
> > Check suppression directly in the `WARN()` Macros.
> > This avoids the need for function symbol resolution or ELF section
> > modification.
> > Suppression is implemented directly in the `WARN*()` macros.
> > 
> > A helper function, `__kunit_is_suppressed_warning()`, is used to determine
> > whether suppression applies. It is marked as `noinstr`, since some `WARN*()`
> > sites reside in non-instrumentable sections. As it uses `strcmp`, a
> > `noinstr` version of `strcmp` was introduced.
> > The implementation is deliberately simple and avoids architecture-specific
> > optimizations to preserve portability. Since this mechanism compares
> > function names and is intended for test usage only, performance is not a
> > primary concern.
> > 
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> I like this -- it's very simple, it doesn't need to be fast-path, so
> a linear list walker with strcmp is fine. Nice!

But it is on the fast path! This is still bloating every UD2 site
instead of doing it on the other end.
