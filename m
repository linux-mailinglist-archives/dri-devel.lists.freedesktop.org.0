Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DCBAC9A8A
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 12:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0FA10E054;
	Sat, 31 May 2025 10:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="kh4TyDc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E979C10E054
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+gmjqDolMU/6cNi6kpQuNUUonuQoBi05ZwkqfJ4iIao=; b=kh4TyDc1EKRiFok397uA0uqi7j
 CKseQl1q4Z20SDvCCTgSS8SJLnyba8wYht/a5sPDV3x0mrCVicMDDXVwxq77K1ZZNlZPzw7pv++Yt
 yChJoaBxkdXbLtqqFgqYvvExW7p3L8BdSuH6a2YulPeg7smpt9KvRpl6s4mYW5hwDLlkXv4FAX1Ol
 qcWY5183QrVr8G+s0e+M6HD5GOjA3QiiEmGh4bBpNOG2nANRtOSqAU1MmZpBQOjhVszI2wgi8nArR
 w6yJUaJMnzY72enu8dvz+kS1CVrelWkgqKNP9sOmQRw2J7qEJR/7PKfTdJc2tKgb24hlIOXLaAaxY
 hWpwzLAg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uLJPH-0000000GhJM-1MCd; Sat, 31 May 2025 10:25:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 92D3F300787; Sat, 31 May 2025 12:25:38 +0200 (CEST)
Date: Sat, 31 May 2025 12:25:38 +0200
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
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <20250531102538.GG21197@noisy.programming.kicks-ass.net>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
 <202505301037.D816A49@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505301037.D816A49@keescook>
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

On Fri, May 30, 2025 at 10:48:47AM -0700, Kees Cook wrote:

> This needs docs too. I think this is collapsing 1 and 2 argument WARNs
> into the ud1, and anything larger is explicitly calling __warn_printk +
> __WARN_FLAGS? If only 1 and 2 args can be collapsed, why reserve 0xfe00
> through 0xfeff? I feel like I'm missing something here...

I did something really evil in that first version, I encoded the
registers into the bug type. I've fixed that and have decode_bug emit a
ud_regs thingy now.

