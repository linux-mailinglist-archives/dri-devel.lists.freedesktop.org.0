Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC3A67890
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 17:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ED610E4AF;
	Tue, 18 Mar 2025 16:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WVHlHUak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B6E10E4AF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 16:00:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E9BB8A48A95;
 Tue, 18 Mar 2025 15:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FD2C4CEDD;
 Tue, 18 Mar 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742313596;
 bh=wnqlTyxAgZ8CuVhXT9duPOO4NgjQBjimZKlWtsOUGPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WVHlHUakLlfN9xeuBYO1EJf+5CyU+WJKRkilNy467a1BnupPF2HSzG6De1fpXKFV+
 ix9jYHBoyySgyb6uel1Y6KTQEzU4+Rwm0HghzRyuSjF71hbCSnTEGnernC5xUEtu10
 +UeOIc/V5TKw7+jkC51H/NeBuaIOzIXiqjJlwYzUGV3n3dFHQ9MxYqNWDakJi0E6hg
 3eBuUyUh9Yz/C8EPNMpPnQhIe07ID+3WJ5N3wJyQiVpq4Skm6z+pxWjAjp5DobEjiB
 6Jrg3x/R+DiIvD5NG4zUjWrrB/2tNu1hT+SvmfpVy3qQGAt9drIa3KhZDqAUmDABl/
 j7eCAm37AJZIQ==
Date: Tue, 18 Mar 2025 15:59:47 +0000
From: Will Deacon <will@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <20250318155946.GC13829@willie-the-truck>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Mar 13, 2025 at 05:40:59PM +0100, Alessandro Carminati wrote:
> On Thu, Mar 13, 2025 at 1:25 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
> > > diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
> > > index 28be048db3f6..044c5e24a17d 100644
> > > --- a/arch/arm64/include/asm/bug.h
> > > +++ b/arch/arm64/include/asm/bug.h
> > > @@ -11,8 +11,14 @@
> > >
> > >  #include <asm/asm-bug.h>
> > >
> > > +#ifdef HAVE_BUG_FUNCTION
> > > +# define __BUG_FUNC  __func__
> > > +#else
> > > +# define __BUG_FUNC  NULL
> > > +#endif
> > > +
> > >  #define __BUG_FLAGS(flags)                           \
> > > -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
> > > +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
> >
> > Why is 'i' the right asm constraint to use here? It seems a bit odd to
> > use that for a pointer.
> 
> I received this code as legacy from a previous version.
> In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
> Here, __BUG_FUNC is defined as __func__, which is the name of the
> current function as a string literal.
> Using the constraint "i" seems appropriate to me in this case.
> 
> However, when HAVE_BUG_FUNCTION is not defined:
> __BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
> but after investigating your concern, I found:
> 
> ```
> $ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
> {\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
> #define NULL ((void *)0)
> ```
> 
> I realized that NULL is actually a pointer that is not a link time
> symbol, and using the "i" constraint with NULL may result in undefined
> behavior.
> 
> Would the following alternative definition for __BUG_FUNC be more convincing?
> 
> ```
> #ifdef HAVE_BUG_FUNCTION
>     #define __BUG_FUNC __func__
> #else
>     #define __BUG_FUNC (uintptr_t)0
> #endif
> ```
> Let me know your thoughts.

Thanks for the analysis; I hadn't noticed this specific issue, it just
smelled a bit fishy. Anyway, the diff above looks better, thanks.

Will
