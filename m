Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12331AC7437
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 00:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F1410E195;
	Wed, 28 May 2025 22:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g4oUCb6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C89C10E18D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 22:52:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1077D61F1D;
 Wed, 28 May 2025 22:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A76C4CEE3;
 Wed, 28 May 2025 22:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748472759;
 bh=iYcf9YR7Z4+2/xsCojP+jHho5nR4qku/etCXFMtxKJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g4oUCb6O6O8uFlE9+AfMj/s7q/HQzTa//bQkDQrYBtK3561GQ4tmNZCbtX16fcdxC
 fPQCV4H2kY6GQYKpD+DLEQrUxNDrIhLg9Ysa1rKEumcAZc1DCqstXHVDSzelcCACrg
 QssGImgolEqUEIo8fEPjzVfA1RiXFHP6cfeOWw1NI/ly2fouxtG7x59XLknI/BGHqo
 7TAxSuCg5VpzzlTlxTHo9qQRKtsl1o/H6Su5Jx3cFqctOCVlosY9b+W/8RVF4FN4yT
 rSb+T5+y66BTHlVQI9zuZC+Ql8Ji/OPt73cl0kVaUOniW/0CqqD8x5R5pnL1aaEuHH
 K9Yma78GGhmxw==
Date: Wed, 28 May 2025 15:52:36 -0700
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
Subject: Re: [PATCH v5 2/5] bug/kunit: Suppressing warning backtraces reduced
 impact on WARN*() sites
Message-ID: <202505281549.9B51A7D2@keescook>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-3-acarmina@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526132755.166150-3-acarmina@redhat.com>
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

On Mon, May 26, 2025 at 01:27:52PM +0000, Alessandro Carminati wrote:
> KUnit support is not consistently present across distributions, some
> include it in their stock kernels, while others do not.
> While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
> features, the fact that some distros ship with KUnit enabled means it's
> important to minimize the runtime impact of this patch.
> To that end, this patch introduces a counter for the number of
> suppressed symbols and skips execution of __kunit_is_suppressed_warning()
> entirely when no symbols are currently being suppressed.

If KUnit already serialized? I should have asked this before: you're
reading and writing a global list -- I think some kind of RCU may
be needed for the list? One thread may be removing a function from the
list while another thread is executing a WARN-induced walk of the
list...

This global may have the same problem. Why not use a static branch, or
is that just overkill?

-Kees

-- 
Kees Cook
