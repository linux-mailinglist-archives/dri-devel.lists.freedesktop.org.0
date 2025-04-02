Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343BBA78911
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 09:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A36810E6CF;
	Wed,  2 Apr 2025 07:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="K19W1GmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7588910E6CF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uIzWjvfJbyS7n54sJ+5shgly3p7L+Bq4hAOWNvm3+QQ=; b=K19W1GmQJKHEi4CglJlEuX8NWi
 LthI2Z1LT4kdChvQwI3VZxL8k5hQ8dfV9NdzrOUMMX5Pj6OAhhEMS8GDkCXS2YpBQcPOH/Ls8WWAg
 vt0plzI5MTrstT6vVlp7xwsZ0RSoiIMGP/bQXVfBeMRFvz9Ykq9JPtPXarpYwYT/LMNYgK0a0CjKi
 kJJEWZJJLww9Gks/HsTl8JvWnlqFdUJ6xwagZ6hon/A/xb2B/diil2B0kL2IZ7+7EZgbibHMjzb7w
 /qUr5UiptHJqHeN9jIzxomcDYiKG84dHAl9weULxWpIBCV33DZruujj7uy0w4xbjRcWo4+Gbycyy+
 hIRGELoQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1tzsnH-00000006zJG-0AVp; Wed, 02 Apr 2025 07:45:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 95EEB30049D; Wed,  2 Apr 2025 09:45:50 +0200 (CEST)
Date: Wed, 2 Apr 2025 09:45:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
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
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <20250402074550.GQ5880@noisy.programming.kicks-ass.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
 <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
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

On Tue, Apr 01, 2025 at 10:53:46AM -0700, Guenter Roeck wrote:

> > >   #define _BUG_FLAGS(ins, flags, extra)					\
> > >   do {									\
> > >   	asm_inline volatile("1:\t" ins "\n"				\
> > >   		     ".pushsection __bug_table,\"aw\"\n"		\
> > >   		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> > >   		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
> > > -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> > > -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
> > > -		     "\t.org 2b+%c3\n"					\
> > > +		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
> > > +		     "\t.word %c2"        "\t# bug_entry::line\n"	\
> > > +		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
> > > +		     "\t.org 2b+%c4\n"					\
> > >   		     ".popsection\n"					\
> > >   		     extra						\
> > > -		     : : "i" (__FILE__), "i" (__LINE__),		\
> > > +		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
> > >   			 "i" (flags),					\
> > >   			 "i" (sizeof(struct bug_entry)));		\
> > >   } while (0)

Also this, why do you need this extra function in the bug entry? Isn't
that trivial from the trap site itself? symbol information should be
able to get you the function from the trap ip.

None of this makes any sense.
