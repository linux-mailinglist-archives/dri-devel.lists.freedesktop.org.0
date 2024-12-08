Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A619E8737
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 19:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C6410E250;
	Sun,  8 Dec 2024 18:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gwdg.de header.i=@gwdg.de header.b="CJKS3qLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227C310E250;
 Sun,  8 Dec 2024 18:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
 s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9FB2GPk7COCoX9cEFVKvQVosxysJZseEWA2qS7zkWkM=; b=CJKS3qLo2nmU8RTYUGjkHdxbqz
 ns3qD6CiJJHSo/fxpi0OkfvH8JDQQZdboDlvM/X5DcOKtxOEKZHO1DDbUS7ibZ6KyG6Zk/SU7+Rph
 Te6kIRiApeS89pXKvOVY+/VJ3wXYA9Z9G+I2/zCcCa/XvLG7AmRxVqASLRJcXP5LXQrdAXnUEcvrs
 O2/01MVDPrEC4QD/XJf1NbP4rjXcQJ8Qs8VhOvKcazkXGe4hH97QTcLqKzLARCv8+BY4s5fBYP0Go
 K8CQW9PwNvu3ayOiSb1QPTX1xyvg4/5600xSFeHb+Ar6vPZsB/cK/rcDMH/V4blTmcT3RaT4DwSed
 W3JC06dw==;
Received: from xmailer.gwdg.de ([134.76.10.29]:57248)
 by mailer.gwdg.de with esmtp (GWDG Mailer)
 (envelope-from <muecker@gwdg.de>) id 1tKLk3-004b6U-2I;
 Sun, 08 Dec 2024 19:10:51 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
 by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (GWDG Mailer) (envelope-from <muecker@gwdg.de>) id 1tKLk3-000BW3-1w;
 Sun, 08 Dec 2024 19:10:51 +0100
Received: from vra-173-64.tugraz.at (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sun, 8 Dec
 2024 19:10:49 +0100
Message-ID: <87dd9b7b52e7cea874c1899f56efdd3d7c5b7243.camel@gwdg.de>
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
Date: Sun, 8 Dec 2024 19:10:49 +0100
In-Reply-To: <e71fffb7ff0e4bf29692d006c0fe77c2@AcuMS.aculab.com>
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
 <6658618490381cf5ec35edbb66f1478024174e67.camel@gwdg.de>
 <e71fffb7ff0e4bf29692d006c0fe77c2@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-GWD-03.um.gwdg.de (10.108.142.56) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:5, sv:1733649613,
 ts:1733681451
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

Am Sonntag, dem 08.12.2024 um 16:48 +0000 schrieb David Laight:
> From: Martin Uecker
> > Sent: 08 December 2024 12:38

...
> ...
> > So a lot of this macro business seems to be necessary
> > to avoid creating warnings for ISO VLAs when instead you really
> > care about the created code not having a dynamic allocation on
> > the stack.
>=20
> A lot of the 'macro business' for min/max is avoiding unexpected
> conversion of negative values to very large unsigned ones.
> And no, -Wsign-compare is spectacularly useless.

This is a different topic, but what would be needed here?
>=20
> ..
> > The issue here is that we miss a language feature in C to
> > introduce local variables that help avoid multiple expansion
> > of macro arguments.  GCC's statement expressions and __auto_type
> > are a solution
>=20
> or historically 'typeof(x) _x =3D x'
>=20
> > #define foo(x) ({ __auto_type __x =3D (x); ... })
> >=20
> > but this runs into the current limitations that ({ }) can not be used
> > at file-scope and can not return constant expressions.
> >=20
> >=20
> > For other reasons I was thinking about adding names to _Generic,
> > as in
> >=20
> > _Generic(x, int i: (i + 1));
> >=20
> > because one design issues with _Generic is that it typechecks
> > also the untaken associations and there the 'x' then has the wrong
> > type.  Having an 'i' with the right type which is set to the value
> > of 'x' when the branch is taken would fix this issue.
>=20
> That looks even more syntactically obscure than _Generic itself.
> Why does it need to do more than very simple syntax analysis of
> the unwanted branches=C2=A0

This would be possible and GCC does turn of some warnings in
the unwanted branches.  I added this to GCC 14 I think.

But so far, ISO C requires that all branches are valid and this
was an intentional design decision to detect errors.

> - or they could automatically be analysed
> with the named variable have the specified type?

Inside a macro there is no variable 'x' but
the macro argument 'x' is replaced by some expression.

Also there is the general problem of multiple expansion which
can only be addressed by introducing an identifier.

>=20
> > But this feature might also allow writing macros that avoid
> > double expansion without requiring statement expressions (which
> > are more difficult to fix):
> >=20
> > #define foo(x) _Generic(x, int i: (i + i));
>=20
> How can that work for things like min() that have multiple arguments?

You would need to nest it:

#define foo(x, y) _Generic(x, int i: _Generic(y, int j: i + j))

Otherwise one could invent syntax for matching multiple arguments
at the same time.

There is still the problem of name collision, but this is already
a problem with=C2=A0

({ int i =3D (x); int j =3D (x); i + j; })=20

> Not going to work if you need __auto_type either.

If we allowed an identifier for the default branch too, this
would work:  _Generic(x, default i: (2 * i))


But hey, I am not saying  this is perfect, it is just
a possible improvement I was thinking about and which could be
implemented easily, would automatically return constant expressions,
and could be used at file scope without further changes.

There are certainly better long-term solutions.

Martin

