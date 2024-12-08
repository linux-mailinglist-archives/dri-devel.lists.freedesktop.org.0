Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13C9E8504
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 13:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6424010E323;
	Sun,  8 Dec 2024 12:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gwdg.de header.i=@gwdg.de header.b="byU3IfeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B270910E012;
 Sun,  8 Dec 2024 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
 s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CYPZ6zhZQZZegU5YKzAwbOa7JzOMQMMoi9xo6uKq+Yo=; b=byU3IfeK/Jszh3px4gBXWsVxW4
 /Uy3hONFmadHud3NLgWfq93VfyrCzySJiBjGY46NRtsG0PTQ8UVc4PR7AgDtSIJqLAJkLA3syPYL6
 nkFWCkAkLylaC6XsqCc0WsaNIOKeN2D8IOjdmo//of3IyUSS/sgrXcfheXQ4zpEoatupVAUiGoAVl
 EomUTq2W0/3CLTbnEmtixebgfjOVO7rkINYp3CSPnt6aPMdKEfxYw7RQy6DGK3/S30Erx3MkajS49
 pF7KWi6Qami3L7TVwTQ6MUSACAnhnv+/wG2V4IQHLwhiacw28v9qP97n6GWPhzQScMCOGUH5OX7MT
 bFFz2glA==;
Received: from xmailer.gwdg.de ([134.76.10.29]:42336)
 by mailer.gwdg.de with esmtp (GWDG Mailer)
 (envelope-from <muecker@gwdg.de>) id 1tKGY8-004Y8O-3C;
 Sun, 08 Dec 2024 13:38:13 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
 by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (GWDG Mailer) (envelope-from <muecker@gwdg.de>) id 1tKGY8-0006nC-2q;
 Sun, 08 Dec 2024 13:38:12 +0100
Received: from vra-173-64.tugraz.at (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sun, 8 Dec
 2024 13:38:11 +0100
Message-ID: <6658618490381cf5ec35edbb66f1478024174e67.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: David Laight <David.Laight@ACULAB.COM>, Linus Torvalds
 <torvalds@linux-foundation.org>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
 <rikard.falkeborn@gmail.com>, "linux-sparse@vger.kernel.org"
 <linux-sparse@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "coresight@lists.linaro.org"
 <coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Sun, 8 Dec 2024 13:38:10 +0100
In-Reply-To: <b71056c1b9e04aa383f2e5608c27290f@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
 <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
 <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
 <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
 <b71056c1b9e04aa383f2e5608c27290f@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-GWD-05.um.gwdg.de (10.108.142.58) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:6, sv:1733639668,
 ts:1733661492
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -
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

Am Sonntag, dem 08.12.2024 um 11:26 +0000 schrieb David Laight:
> From: Martin Uecker
> > Sent: 07 December 2024 23:52
> ...
> > While the compiler can not automatically prove every use
> > of VLA bounded, it can reliably diagnose the cases where it
> > can=C2=A0*not* see that it is bounded. Consider this example:
> >=20
> > void oob(int n, char p[n]);
> > void f(unsigned int n)
> > {
> >     char buf[MIN(n, 100)]; // bounded
> >     oob(n + 10, buf); // warning
> > }
> ...
>=20
> The kernel stack has to have enough space for the [100]
> so the full amount might as well always be allocated.
> The chance of 'trading off' stack usage with another function
> in the same call stack that is guaranteed to use less than
> its maximum is about zero.

In numerical computing this is a big motivation because
you can reduce stack usage in recursive divide-and-conquer
algorithms.  For the kernel, I agree this is not a
compelling use case, and the better motivation would be
precise bounds checking and clearer semantics for buffer
management. =C2=A0

But don't get me wrong, if the kernel is happier without VLA
this is fine with me, I am just trying to understand the
underlying issues better and the "VLAs are security problem"
or "VLA use more stack"  arguments do not convince me, while
the points Linus raises make much more sense to me.

>=20
> The VLA code also adds an extra stack frame, this pretty much
> pessimises everything.

Yes, but this is something which seems could be improved
on the compiler side, e.g. by simply transforming
small VLAs automatically to a fixed size array while
preserving their semantics for bound checking.


> This happened for 'constant' sizes from min(16, sizeof (struct))
> because min() needs to be a statement function to avoid re-evaluating
> its arguments.

Can you clarify this?  If the VLA size is constant, even when
it is not an integer constant expression according to ISO C,
the compiler should not produce worse code.  For example,

void g(void*);

void foo()
{
    int n =3D 10;
    char buf[n];
    g(buf);
}

void bar()
{
    char buf[10];
    g(buf);
}

So a lot of this macro business seems to be necessary
to avoid creating warnings for ISO VLAs when instead you really
care about the created code not having a dynamic allocation on
the stack.

So one might wonder whether a compiler warning that warns more
specifically about this would help.

> (The version of min() that managed to return constant from constant
> input just exploded in cpp, partially responsible for 18MB lines
> being fed into the compiler part.)

The issue here is that we miss a language feature in C to
introduce local variables that help avoid multiple expansion
of macro arguments.  GCC's statement expressions and __auto_type
are a solution

#define foo(x) ({ __auto_type __x =3D (x); ... })

but this runs into the current limitations that ({ }) can not be used
at file-scope and can not return constant expressions.


For other reasons I was thinking about adding names to _Generic,
as in

_Generic(x, int i: (i + 1));

because one design issues with _Generic is that it typechecks=C2=A0
also the untaken associations and there the 'x' then has the wrong
type.  Having an 'i' with the right type which is set to the value
of 'x' when the branch is taken would fix this issue.

But this feature might also allow writing macros that avoid
doublel expansion without requiring statement expressions (which
are more difficult to fix):

#define foo(x) _Generic(x, int i: (i + i));


Martin


