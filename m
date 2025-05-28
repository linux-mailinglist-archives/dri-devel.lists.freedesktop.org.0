Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E48AC742D
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 00:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDE410E0E1;
	Wed, 28 May 2025 22:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NKpLgpeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E66210E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 22:47:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52628A4FB3C;
 Wed, 28 May 2025 22:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B44C4CEE3;
 Wed, 28 May 2025 22:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748472466;
 bh=/uDiyMlExuXwk0cv6TZbVIbgRWnKfXUvjrWMarhJ84Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKpLgpeF80eASQqHsPI8iGn5i7bfvDJ1492ewVMoXYTI8z5Ayuumyi6MAH8ZsrOav
 1L5ORSKgDxJNP7FBAVp+QU7piq1ayeEaTu8cF8qU8qw0hRBJ2W2FT2y4f6WozDlhG8
 VR/cHHOzWLam2CZCRn+kQ0529ABJg+WX9NTYDW1HF/mhUe31akNPoZZkyWGciPMCS7
 yfeFiHmMcYs3fyEySn6w8h2bvq6gqYs0pg2tILIXELvQW6hjI/+gw/ge/isQWo+Lsb
 lclU0ZEMwMrb5MlD1x02dVAXb1iitCoIoNvybAuDC9ng+NcaFKYy5VlAMCHZQ5kG6D
 O3u3wPl037MSA==
Date: Wed, 28 May 2025 15:47:42 -0700
From: Kees Cook <kees@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
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
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <202505281546.DB9D9029@keescook>
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
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons:
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multiple
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum.
> 
> Implementation details:
> Check suppression directly in the `WARN()` Macros.
> This avoids the need for function symbol resolution or ELF section
> modification.
> Suppression is implemented directly in the `WARN*()` macros.
> 
> A helper function, `__kunit_is_suppressed_warning()`, is used to determine
> whether suppression applies. It is marked as `noinstr`, since some `WARN*()`
> sites reside in non-instrumentable sections. As it uses `strcmp`, a
> `noinstr` version of `strcmp` was introduced.
> The implementation is deliberately simple and avoids architecture-specific
> optimizations to preserve portability. Since this mechanism compares
> function names and is intended for test usage only, performance is not a
> primary concern.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I like this -- it's very simple, it doesn't need to be fast-path, so
a linear list walker with strcmp is fine. Nice!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
