Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ABDA7830A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 22:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB1410E66C;
	Tue,  1 Apr 2025 20:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sj0UIMgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5397410E170
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 20:01:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3ABB8A4155A;
 Tue,  1 Apr 2025 19:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB7BC4CEE4;
 Tue,  1 Apr 2025 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743537659;
 bh=SsEtymDjFxM1dLd88DEPk7b/DPbXgQcSJ+nDYJthskA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sj0UIMgJB3BhWg6Q5hThirUmVNapBvLUCssaM9xJhq4z8rINztn8U2a8VU7uKVvO+
 KNTKB8yFVEH/6P0aJxnzC8ql/cEZBktK2XjcFkIJonPY+vNiktGaEJh1pu3KP86pOZ
 0Z/JDChHvvi4fQgWwY2pv315OrvtUWanr7oVb/zq3/xkPyam7hR1FljADmz/mdjKmW
 3KeD4+Bq0JfzX1PdRiolOCzdjflmaIQN6ONyog6XNtxrNEObEDL4X29f59mJiYMhry
 cfSVpBrf0Tf8VE+sJ34qXMxAOHcRzpXoXlXhcPxZlM+YajKX9z4ArQ7bi8GhCQGACf
 ReX1Z2plvjm5Q==
Date: Tue, 1 Apr 2025 13:00:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter Zijlstra <peterz@infradead.org>, 
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
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
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 x86@kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <rkuxvq6pkha6pixz5rtu327ujt7ism5f4wgrak7egcecuxwe42@qkn5ewdzwhvo>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
 <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
> On 4/1/25 10:08, Peter Zijlstra wrote:
> > > +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
> > > +		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
> > >   	instrumentation_end();					\
> > >   } while (0)
> > 
> > NAK, this grows the BUG site for now appreciable reason.
> 
> Only if CONFIG_KUNIT_SUPPRESS_BACKTRACE is enabled. Why does that
> warrant a NACK ?

I agree with Peter, this bloats the code around thousands of UD2 sites.

It would be much better to do the checking after the exception.  In fact
it looks like you're already doing that in report_bug()?

	if (warning && KUNIT_IS_SUPPRESSED_WARNING(function))
		return BUG_TRAP_TYPE_WARN;

Why check it twice?

-- 
Josh
