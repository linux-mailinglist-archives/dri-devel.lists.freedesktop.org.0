Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E74F897DA5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 04:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9FA11311E;
	Thu,  4 Apr 2024 02:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="VyMVQ3zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BDF11311E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 02:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1712196863;
 bh=0PcvpW5SQPrf4QnOqaQeX/XXu99U3a1qNIXPB0jb71k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VyMVQ3ztogSJTiIgLxBnLkNGFUgd68Qe2KDkfvwgzAo6UXogiTKbR69fLdEZZdu7n
 j3iNV2JgacCj30EfVfA0nufM6LLB0HhkUu4/gC0cH9GF15bjP6K55yY/SHfDcHG5LZ
 C6A3Ro/1onK6pyPh3jlVC2U8y95oPYSyx7VeOvKtcmV57g7fuqL83rvaMyFKYOVpxw
 oxm58pQDGWVdn2ucF5HZ6tep2QVSw9tARy9V9golouCtHYA3Tik7KGkuZEvWcLHYKF
 3HCUbzR0cNgClz2PklZaCGNb+9TQaIfvB8jeqaIi2XVH6tgkaEYydsWFGiIh6MP6A8
 HT6H386UWr5YA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V94th0jq3z4wcQ;
 Thu,  4 Apr 2024 13:14:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?Q?Ma=C3=ADra?=
 Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Kees
 Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, David
 Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org, x86@kernel.org, Guenter
 Roeck <linux@roeck-us.net>, Linux Kernel Functional Testing
 <lkft@linaro.org>
Subject: Re: [PATCH v3 15/15] powerpc: Add support for suppressing warning
 backtraces
In-Reply-To: <20240403131936.787234-16-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-16-linux@roeck-us.net>
Date: Thu, 04 Apr 2024 13:14:16 +1100
Message-ID: <874jch98nb.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Guenter Roeck <linux@roeck-us.net> writes:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
>
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because __func__
> is not a define but a virtual variable).
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> v3:
> - Rebased to v6.9-rc2
>
>  arch/powerpc/include/asm/bug.h | 37 +++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)

I ran it through some build and boot tests, LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
