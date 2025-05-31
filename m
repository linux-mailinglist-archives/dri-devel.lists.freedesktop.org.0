Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F15AC99F2
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 09:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC83B10E8BC;
	Sat, 31 May 2025 07:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="t1+DShEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA2010E288
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vHtJ0rUGHhX/CQdQbU6ZDVMIjLovSJXXeNJdF3gZOCs=; b=t1+DShEQzcDn5LQT0aspjXhRf/
 7RxT5oLc5jrneWc82F5Dr0LTy9I3aEPpiNWX6OuKSE7V6wdElpBM9sLNZO07JvGZ8xu3M40Aztr+g
 CdiSLVamsrgUoitOH+D6cqsxC5TFsyukFy41zbubp8nmarAGtLnLXy/eUJ8u/+JI6QIhDI9dBbNxK
 8SU8A//s9ARGQlqB8IHniHCMIntW60Jmt1CEgjep0QI/z5ooPeFd54sk+QO7hQsRwm5nO2M05MMGb
 TK9kIerCSNvF9Vm1IlYV+Yc7uIKodSbWa6akTkgN5bvH9zMXLs5j8Id5y2HtLRzABaHUzH4SaG5ou
 HEh/X2zQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uLGv2-0000000Gb56-0pYT; Sat, 31 May 2025 07:46:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 90FE1300787; Sat, 31 May 2025 09:46:15 +0200 (CEST)
Date: Sat, 31 May 2025 09:46:15 +0200
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
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <20250531074615.GA19817@noisy.programming.kicks-ass.net>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530140140.GE21197@noisy.programming.kicks-ass.net>
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

On Fri, May 30, 2025 at 04:01:40PM +0200, Peter Zijlstra wrote:

> I'm not really concerned with performance here, but more with the size
> of the code emitted by WARN_ONCE(). There are a *ton* of WARN sites,
> while only one report_bug() and printk().

We need a new and stronger unlikely(), resulting in the compiler being
forced to split a .cold sub-function/part which lives in .text.unlikely

At that point it becomes less of a concern I suppose. 

AFAIK the only means of achieving that with the current compilers is
doing a manual function split and marking the part __cold -- which is
unfortunate.

At some point GCC explored label attributes, and we were able to mark
labels with cold, but that never really worked / went anywhere.
