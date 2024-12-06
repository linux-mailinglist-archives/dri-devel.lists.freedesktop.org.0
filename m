Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011F9E688A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6562B10F031;
	Fri,  6 Dec 2024 08:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gwdg.de header.i=@gwdg.de header.b="QIuEFM5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2145 seconds by postgrey-1.36 at gabe;
 Fri, 06 Dec 2024 07:16:11 UTC
Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3F10E432;
 Fri,  6 Dec 2024 07:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
 s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cn/mEteP39h7mG9+aXdZN/tTfaU/U5YGN1nxsLlnwXQ=; b=QIuEFM5T0FLtiEdDVaCUTynHbc
 a3zmimEUtLd/4jb8a077kuj6t5Z1EudBlrkT12B2MBGOIwTrIpHJGw3Pk6iKOpO6TtYMuo4JiWtSe
 FALBY7LUEVLwAAmC+Ce1w4h4KJ1Q2urw4zmYWkyBBzLGfosCtmeVjXhaA8OjAaqeQV2RnqsiVCy8m
 7awRl+GwnnpkJjPVI4EbRQMiIMkDU4bc3J9mK7PKsqdbKi7W+7pUlBzCRs/m7RKmjvy3jv/GZxiaF
 qizFSXH5UYZwccUBvg+by18Y9rZX4pnr/B+RuHQJtZemMZiqWS+sQHHLpwRFb7mmbtt58Ow1VWUYu
 sAyfaCaw==;
Received: from xmailer.gwdg.de ([134.76.10.29]:37823)
 by mailer.gwdg.de with esmtp (GWDG Mailer)
 (envelope-from <muecker@gwdg.de>) id 1tJS0h-003tPL-1m;
 Fri, 06 Dec 2024 07:40:19 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
 by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (GWDG Mailer) (envelope-from <muecker@gwdg.de>) id 1tJS0h-000D3F-1M;
 Fri, 06 Dec 2024 07:40:19 +0100
Received: from [192.168.0.221] (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Fri, 6 Dec
 2024 07:40:17 +0100
Message-ID: <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: David Laight <David.Laight@ACULAB.COM>, 'Vincent Mailhol'
 <mailhol.vincent@wanadoo.fr>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Luc Van Oostenryck
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
Date: Fri, 6 Dec 2024 07:40:17 +0100
In-Reply-To: <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-GWD-08.um.gwdg.de (10.108.142.61) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:6, sv:1733449028,
 ts:1733467219
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -
X-Mailman-Approved-At: Fri, 06 Dec 2024 08:12:04 +0000
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

Am Freitag, dem 06.12.2024 um 02:25 +0000 schrieb David Laight:
> From: Vincent Mailhol
> > Sent: 05 December 2024 15:31
> >=20
> > -CC: Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> > +CC: Martin Uecker <muecker@gwdg.de>
> > (seems that Martin changed his address)

My current one is this: uecker@tugraz.at

Martin

> >=20
> > On Thu. 5 Dec. 2024 at 03:39, David Laight <David.Laight@aculab.com> wr=
ote:
> > > > Sent: 02 December 2024 17:33
> > > >=20
> > > > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > >=20
> > > > __is_constexpr(), while being one of the most glorious one liner ha=
ck
> > > > ever witnessed by mankind, is overly complex. Following the adoptio=
n
> > > > of C11 in the kernel, this macro can be simplified through the use =
of
> > > > a _Generic() selection.
> > >=20
> > > You should give credit to some of the earlier patches that do the sam=
e.
> > > I'm sure there were some related ones from Linus - not applied yet.
> >=20
> > ACK. Would adding a suggested--by Linus tag solve your concern?
>=20
> I actually suspect the first patches to change __is_constexpr() to
> use _Generic were from myself.
> I've found a patch I send in November 2023.
>=20
> >=20
> > > > First, split the macro in two:
> > > >=20
> > > >   - __is_const_zero(x): an helper macro; tells whether x is the
> > > >     integer constant expression 0 or something else.
> > > >=20
> > > >   - is_const(x): replacement of __is_constexpr(); tells whether x i=
s a
> > > >     integer constant expression.
> > > >=20
> > > > The split serves two purposes: first make it easier to understand;
> > > > second, __is_const_zero() will be reused as a building block for ot=
her
> > > > is_const_*() macros that will be introduced later on.
> > > >=20
> > > > The core principle of __is_constexpr() to abuse the return type of =
the
> > > > ternary operator remains, but all the surrounding sizeof() hack
> > > > disappear.
> > > >=20
> > > > On a side note, while not relevant to the kernel, __is_constexpr()
> > > > relied on the GNU extension that sizeof(void) is 1. const_expr() do=
es
> > > > not use any GNU extensions, making it ISO C compliant.
> > > >=20
> > > > __is_constexpr() is temporarily kept and will be removed once all i=
ts
> > > > users get migrated to is_const() (or one of its friend).
> > > >=20
> > > > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > > ---
> > > >  include/linux/compiler.h | 41 ++++++++++++++++++++++++++++++++++++=
+++++
> > > >  1 file changed, 41 insertions(+)
> > > >=20
> > > > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > > > index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fa=
d9bc7bffab9097f8b0450 100644
> > > > --- a/include/linux/compiler.h
> > > > +++ b/include/linux/compiler.h
> > > > @@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *o=
ff)
> > > >  #define statically_true(x) (__builtin_constant_p(x) && (x))
> > > >  #define statically_false(x) (__builtin_constant_p(x) && (x) =3D=3D=
 0)
> > > >=20
> > > > +/*
> > > > + * Whether x is the integer constant expression 0 or something els=
e.
> > > > + *
> > > > + * Details:
> > > > + *   - The C11 standard defines in =C2=A76.3.2.3.3
> > > > + *       (void *)<integer constant expression with the value 0>
> > > > + *     as a null pointer constant (c.f. the NULL macro).
> > > > + *   - If x evaluates to the integer constant expression 0,
> > > > + *       (void *)(x)
> > > > + *     is a null pointer constant. Else, it is a void * expression=
.
> > > > + *   - In a ternary expression:
> > > > + *       condition ? operand1 : operand2
> > > > + *     if one of the two operands is of type void * and the other =
one
> > > > + *     some other pointer type, the C11 standard defines in =C2=A7=
6.5.15.6
> > > > + *     the resulting type as below:
> > > > + *       if one operand is a null pointer constant, the result has=
 the
> > > > + *       type of the other operand; otherwise [...] the result typ=
e is
> > > > + *       a pointer to an appropriately qualified version of void.
> > > > + *   - As such, in
> > > > + *       0 ? (void *)(x) : (char *)0
> > > > + *     if x is the integer constant expression 0, operand1 is a nu=
ll
> > > > + *     pointer constant and the resulting type is that of operand2=
:
> > > > + *     char *. If x is anything else, the type is void *.
> > > > + *   - The (long) cast silences a compiler warning for when x is n=
ot 0.
> > > > + *   - Finally, the _Generic() dispatches the resulting type into =
a
> > > > + *     Boolean.
> > >=20
> > > The comment is absolutely excessive.
> > > I'm sure I managed about 2 lines in one of the patches I did.
> >=20
> > I think that Linus made it  clear in:
> >=20
> >   https://lore.kernel.org/all/CAHk-=3DwgfpLdt7SFFGcByTfHdkvv7AEa3MDu_s_=
W1kfOxQs49pw@mail.gmail.com/
> >=20
> > that this deserves a detailed comment.
>=20
> And he wrote one in https://lore.kernel.org/all/CAHk-=3Dwiq=3DGUNWJwWh1CR=
AYchW73UmOaSkaCovLatfDKeveZctA@mail.gmail.com/
>=20
>    /*
>     * iff 'x' is a non-zero constant integer expression,
>     * then '!(x)' will be a zero constant integer expression,
>     * and casting that to 'void *' will result in a NULL pointer.
>     * Otherwise casting it to 'void *' will be just a regular 'void *'.
>     *
>     * The type of '0 ? NULL : (char *)' is 'char *'
>     * The type of '0 ? (void *) : (char *) is 'void *'
>     */
>     #define const_true(x) \
>         _Generic(0 ? (void *)((long)!(x)) : (char *)0, char *: 1, void *:=
 0)
>=20
>=20
>=20
> >=20
> > The details block in the current __is_constexpr() is 37 lines long,
> > the details block in __is_const_zero() takes 22 lines. So I would
> > argue that I made things better.
>=20
> The old block was too long :-)
>=20
> >=20
> > Unless more people share your concern, I am planning to keep this comme=
nt as-is.
> >=20
> > > > + *
> > > > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> > >=20
> > > IIRC Martin has agreed in the past that the accreditation can
> > > be removed - especially since it refers to the 'sizeof (void)' trick.
> >=20
> > I tried to look for such message:
> >=20
> >   https://lore.kernel.org/all/?q=3Df%3A%22martin+uecker%22+__is_constex=
pr
> >=20
> > but couldn't find it. Do you have the link?
> >=20
> > @Martin, do you agree that I remove the accreditation?
> >=20
> > > > + */
> > > > +#define __is_const_zero(x) \
> > > > +     _Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *=
: 0)
> > > > +
> > > > +/*
> > > > + * Returns a constant expression while determining if its argument=
 is a
> > > > + * constant expression, most importantly without evaluating the ar=
gument.
> > >=20
> > > You need to differentiate between a 'constant integer expression'
> > > and a 'compile time constant'.
> >=20
> > OK. This one was just copied from the previous __is_constexpr(). I will=
 apply
> > "s/constant expression/constant integer expression/g" in v2.
> >=20
> > > > + *
> > > > + * If getting a constant expression is not relevant to you, use th=
e more
> > > > + * powerful __builtin_constant_p() instead.
> > >=20
> > > __builtin_constant_p() is not 'more powerful' it is testing for
> > > something different.
> >=20
> > I meant to say that __builtin_constant_p() is more powerful at
> > constant folding. But I agree that the comment is not clear.
> >=20
> > What about this?
> >=20
> >   If getting a constant integer expression is not relevant to you, use
> >   __builtin_constant_p() which not only returns true if the argument
> >   is an integer constant expression, but also if it is a compile time
> >   constant.
>=20
> Complete f***ed tense.
>=20
> It's not about 'constant folding' and 'powerful' isn't the correct word.
> They are checking for two different things.
>=20
> A 'constant integer expression' is defined by the C language, and is
> basically something that is constant when first parsed by the compiler
> (my definition) so it can pretty much only contain constants, sizeof()
> and offsetof().
>=20
> __builtin_constant_p() is true if the compiler decides that an expression=
 is
> constant. This can track values through inlined function calls and can
> change from 'unknown' to 'true' late in the compilation.
>=20
> 	David
>=20
> >=20
> >=20
> > Yours sincerely,
> > Vincent Mailhol
>=20
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)

