Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F5D5EB2D6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 23:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8274510E0DE;
	Mon, 26 Sep 2022 21:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9F10E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 21:07:16 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id y136so7931461pfb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=VUYHQIv2vL8pY0r5skq1FuqyyfYP1QoMOYkxGZwbp6o=;
 b=TxQD2fJTodac/gzds749N6eKDMqdv7Q8g+tPhsOiW/sX3qUzP3f31tYswj1cNjhZ+P
 GZ26rUT4PfJw2GQKkiXkOXyDG3qoXJdjcDtY3ngV/e6Eip/wNz2SxOqyLUFoEqou289d
 65H2ej14mtX4cRsJfIOnYU6qdCyop+wYz0PRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=VUYHQIv2vL8pY0r5skq1FuqyyfYP1QoMOYkxGZwbp6o=;
 b=xst/FDa2elUvTgDfI46vhNE6mYPiTfFb3Rs4Yv1FIhVBkkCWrwnaa4iKR68Lojxa7T
 wN76uEiXACdtzPqA2e0awgibFxmlzF+USo6G86Wwf4Svb+CDSIUzarHqsYR4IwpwuST1
 pjFggytCAcHl05n014Ggt3VElXyTFkVrbhaEjjD66ViNaIIu17kWtJ1WcQXmxsguWxkI
 XKCXRK9Q9lNCcCMHIMSiN0Qhlgb3lVhH7AXfs56zxWnibU0g7KAxXmBKyDO9Rq8T4q4T
 Zh06rGEIzwFx9160W6RzTdgWtfxw1p1sqTYz4GocQ6Gx1J5CmP+KoF0gNgszD37s+mX5
 E5bQ==
X-Gm-Message-State: ACrzQf117YMTIBl5WeWxDUQJOmyA8NBMgDbqvLD+WYT3x5Af1qHSr80x
 bUEgv6DTFwMS8EDWKSjA3N5trQ==
X-Google-Smtp-Source: AMsMyM6ac5PcbdyiCXdkvj0iGPsWyVMYvQOqt4HWPCMIqT7ijtbq72queIktQfLMWxfsTRb46FTITA==
X-Received: by 2002:a63:441b:0:b0:439:103b:25a4 with SMTP id
 r27-20020a63441b000000b00439103b25a4mr21064706pga.487.1664226436243; 
 Mon, 26 Sep 2022 14:07:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 h6-20020aa79f46000000b00540ffb28da0sm13290247pfr.91.2022.09.26.14.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 14:07:15 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:07:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] overflow: Introduce overflows_type() and
 castable_to_type()
Message-ID: <202209261405.619441AC2F@keescook>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <CAKwvOdmCjAQpaF40VStbFNf1ZqmTxTTZzy2v4TwSF0LVO08GYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmCjAQpaF40VStbFNf1ZqmTxTTZzy2v4TwSF0LVO08GYw@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, Daniel Latypov <dlatypov@google.com>,
 llvm@lists.linux.dev, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, Vitor Massaru Iha <vitor@massaru.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 01:17:18PM -0700, Nick Desaulniers wrote:
> + Arnd
> 
> On Mon, Sep 26, 2022 at 12:11 PM Kees Cook <keescook@chromium.org> wrote:
> > ---
> > v2:
> >  - fix comment typo
> >  - wrap clang pragma to avoid GCC warnings
> >  - style nit cleanups
> >  - rename __castable_to_type() to castable_to_type()
> >  - remove prior overflows_type() definition
> > v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
> > diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> > index f385ca652b74..fffc3f86181d 100644
> > --- a/lib/overflow_kunit.c
> > +++ b/lib/overflow_kunit.c
> > @@ -16,6 +16,11 @@
> >  #include <linux/types.h>
> >  #include <linux/vmalloc.h>
> >
> > +/* We're expecting to do a lot of "always true" or "always false" tests. */
> > +#ifdef CONFIG_CC_IS_CLANG
> > +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> > +#endif
> 
> Any chance we can reuse parts of __diag_ignore or __diag_clang from
> include/linux/compiler_types.h or include/linux/compiler-clang.h
> respectively?

Hm, I'm not sure how those are supposed to be used. Those defines don't
seem to be used externally?

> Those are needed for pragmas within preprocessor macros, which we
> don't have here, but I suspect they may be more concise to use here.

Yeah, I was surprised when I had to wrap it in #ifdef given "clang" is
part of the string.

> 
> > +#define TEST_SAME_TYPE(t1, t2, same)                   do {    \
> > +       typeof(t1) __t1h = type_max(t1);                        \
> > +       typeof(t1) __t1l = type_min(t1);                        \
> > +       typeof(t2) __t2h = type_max(t2);                        \
> > +       typeof(t2) __t2l = type_min(t2);                        \
> 
> Can we use __auto_type here rather than typeof(macro expansion)?

I'd rather it stay explicit -- otherwise we start to wander into "oops,
we got lucky" territory for what should be a really distinct test case.

-- 
Kees Cook
