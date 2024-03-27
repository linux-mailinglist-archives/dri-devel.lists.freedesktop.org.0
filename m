Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2A588E6DB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC4410FD42;
	Wed, 27 Mar 2024 14:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HaYZUqiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D82710FD42
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 14:44:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CF582CE250F;
 Wed, 27 Mar 2024 14:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463CDC433C7;
 Wed, 27 Mar 2024 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711550679;
 bh=YSLGb1GXTxnIIfhyIvC9GwAUZFGWgRDDFdTmlm4yRqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaYZUqiJa07VEuOX2hUbqIVTlZ8o22sLnSNBmDvYGZReqgO3lSbCQK9Or5zp1KJbR
 JvGvc2ZghpWxbzW5dcHWLkdtr9WPLtyBcYNZCtzYkZ0aehioYwzIa2QQF4Onnok8FB
 Wc4M/AdTqe1cmI5ouLQdACNeTQWP2vIBDKBtvzYFRBk3qaqst4TyhFgm3+FAsIAsGT
 mP0xgnOjCX2lX877lT3Jl7cBjQZe+yHaVUg+5xWuYNjiWEBCoNJyKr1tugz+G9vCSC
 fo6IjfObk8UjT+1n6kvF1dQ0obJmvxfW9gBCQkbrMpth/5YtLWt0cnhdydB5wLkqq1
 8N6oSbYrk2HYQ==
Date: Wed, 27 Mar 2024 14:44:31 +0000
From: Simon Horman <horms@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Message-ID: <20240327144431.GL403975@kernel.org>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325175248.1499046-13-linux@roeck-us.net>
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

On Mon, Mar 25, 2024 at 10:52:46AM -0700, Guenter Roeck wrote:
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
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> 
>  arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
> index 05a485c4fabc..470ce6567d20 100644
> --- a/arch/sh/include/asm/bug.h
> +++ b/arch/sh/include/asm/bug.h
> @@ -24,21 +24,36 @@
>   * The offending file and line are encoded in the __bug_table section.
>   */
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +

Hi Guenter,

a minor nit from my side: this change results in a Kernel doc warning.

     .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead

Perhaps either the new code should be placed above the Kernel doc,
or scripts/kernel-doc should be enhanced?

>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b, %O1\n"			\
> -	"\t.short %O2, %O3\n"			\
> -	"\t.org 2b+%O4\n"			\
> +	__BUG_FUNC_PTR				\
> +	"\t.short %O3, %O4\n"			\
> +	"\t.org 2b+%O5\n"			\
>  	"\t.popsection\n"
>  #else
>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b\n"			\
> -	"\t.short %O3\n"			\
> -	"\t.org 2b+%O4\n"			\
> +	"\t.short %O4\n"			\
> +	"\t.org 2b+%O5\n"			\
>  	"\t.popsection\n"
>  #endif
>  
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define BUG()						\
>  do {							\
>  	__asm__ __volatile__ (				\

...
