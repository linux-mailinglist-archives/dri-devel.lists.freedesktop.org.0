Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE120897D6A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 03:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5041130C6;
	Thu,  4 Apr 2024 01:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qb1JzlHC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E6A1130C6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 01:34:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F0C4615AB;
 Thu,  4 Apr 2024 01:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94D4C433C7;
 Thu,  4 Apr 2024 01:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712194455;
 bh=PLHX9CmuF+jzJhTft7r/1Y8OPKACX4mI6u4er178G2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qb1JzlHCkOQ0xQR9xEkxKvsw8OA1eBs2sTlr4JQ5PzuUXWpA08puhxOS0+HGL5xJt
 p+tSFhHdI0/W38jVkWUzbZ83SoA9Ze3oVX0I/xz35tzw9J8ehO4Ej2Z+v4WDgVFly6
 bK1uHAbfHAa/MKwQyDRnXJvZKbn2ZQDjArtD+Ho/3cPayZMvc1juvsoNzlmJRr/Ju4
 IiompHkE91W7nulKLmrSnjlpjrH1dYJE6//xltRqVI5kAJhGo2sMI29VSfrrA1CwJ3
 2VTX8Ds9j7vLv82qYyQgrRRjYVgNl7GVkee7GY7YJqfjkE9sRb6rgoQPF1hbD/SIKA
 JnLshHl50ZGTA==
Date: Wed, 3 Apr 2024 18:34:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook
 <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, David Gow
 <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, Brendan
 Higgins <brendan.higgins@linux.dev>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, Ville
 =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org, Linux Kernel Functional Testing
 <lkft@linaro.org>, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end
 of dev_addr_lists tests
Message-ID: <20240403183412.16254318@kernel.org>
In-Reply-To: <20240403131936.787234-7-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-7-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed,  3 Apr 2024 06:19:27 -0700 Guenter Roeck wrote:
> dev_addr_lists_test generates lock warning noise at the end of tests
> if lock debugging is enabled. There are two sets of warnings.
> 
> WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
> DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())
> 
> WARNING: kunit_try_catch/1336 still has locks held!
> 
> KUnit test cleanup is not guaranteed to run in the same thread as the test
> itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
> be called from different threads. This triggers the warnings.
> Suppress the warnings because they are irrelevant for the test and just
> confusing and distracting.
> 
> The first warning can be suppressed by using START_SUPPRESSED_WARNING()
> and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
> the second warning, it is necessary to set debug_locks_silent while the
> rtnl lock is held.

Is it okay if I move the locking into the tests, instead?
It's only 4 lines more and no magic required, seems to work fine.
