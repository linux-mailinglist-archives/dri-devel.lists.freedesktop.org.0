Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49E9E82C3
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B105E10E420;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="G8c71ehD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD9810F1C5;
 Fri,  6 Dec 2024 21:07:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by smtp.orange.fr with ESMTPSA
 id JfXPtT7cagyqpJfXPtmq0b; Fri, 06 Dec 2024 22:07:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733519220;
 bh=gOoooPhx/l7HLxvA2brAhQv1Lnc9qpuTdTl2b6/0YwM=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=G8c71ehDn7T/eBKyKTuJs7/l2hYaH8KxNA8fuldIzIMVIRccUtd0V/N2EUTrdETOx
 xRun3TLh/8YmxQGZ+xErcpuTjqTzddwuWBheTn/+14PGtAMqUOgLMMHZJerLMA4KTS
 AeaVbewJuxqMknUmdKzB3wCqtO4+GXj0YY2kk2tVv5/cwIVce9ufu0JrUc5cWctx5U
 bYJYbaVeYzD7d54RMIY9cvC8emWo7yWEPg4bYmTlgNAn7+xwyNME9Andqyd5A1ziZ7
 oEtMmqqQyDZ8y46s73EkGBoHQFm5cBFini0eTPimZa8WJFHB1D+8Iig1vaPA1PyBhX
 FkqIL4zfNNBLg==
X-ME-Helo: mail-wm1-f52.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 22:07:00 +0100
X-ME-IP: 209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-434a742481aso23582485e9.3; 
 Fri, 06 Dec 2024 13:06:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5VRK3Y7l1ygzAJEfjhllyS3ewmC/6Q50RN7BuRAlzVSAx2IxAZrI1ojpPtEv80X3FpAsn2OHlP7o=@lists.freedesktop.org,
 AJvYcCXdWw9zZYiHOB34OsDxdO9zJN361gtEqcXbZO+ll3IhVaRXO395AKCE8DQIOB75k108HbQ4oFjDXBPN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsMLuX7ZA029BWzeUZPj4/QQDZGoeNn6NXNBR4VFHLIHdrYg16
 /xgmS6eehJVPnMtIdbee6CcyUQTcrJx+iiko2H1aDwDAh0C2Bs/4VwnLmPQ+CRZTCox3zZeeJZN
 wOBI+a3LjzdKUkiORbItr6gtp3P4=
X-Google-Smtp-Source: AGHT+IFEdpgbM9v1hEJyP58q1rp9/ynE8X6JLZXjVWzmdZJjAWTc9kp//N1g8Aq1Xn7w0wSLoLE1A73y8EJUIxU21wE=
X-Received: by 2002:a17:906:319a:b0:aa5:f288:e7e3 with SMTP id
 a640c23a62f3a-aa5f7d15684mr942250466b.15.1733412700594; Thu, 05 Dec 2024
 07:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
In-Reply-To: <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:31:29 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
Message-ID: <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: David Laight <David.Laight@aculab.com>, Martin Uecker <muecker@gwdg.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 07 Dec 2024 23:46:21 +0000
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

-CC: Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
+CC: Martin Uecker <muecker@gwdg.de>
(seems that Martin changed his address)

On Thu. 5 Dec. 2024 at 03:39, David Laight <David.Laight@aculab.com> wrote:
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > __is_constexpr(), while being one of the most glorious one liner hack
> > ever witnessed by mankind, is overly complex. Following the adoption
> > of C11 in the kernel, this macro can be simplified through the use of
> > a _Generic() selection.
>
> You should give credit to some of the earlier patches that do the same.
> I'm sure there were some related ones from Linus - not applied yet.

ACK. Would adding a suggested--by Linus tag solve your concern?

> > First, split the macro in two:
> >
> >   - __is_const_zero(x): an helper macro; tells whether x is the
> >     integer constant expression 0 or something else.
> >
> >   - is_const(x): replacement of __is_constexpr(); tells whether x is a
> >     integer constant expression.
> >
> > The split serves two purposes: first make it easier to understand;
> > second, __is_const_zero() will be reused as a building block for other
> > is_const_*() macros that will be introduced later on.
> >
> > The core principle of __is_constexpr() to abuse the return type of the
> > ternary operator remains, but all the surrounding sizeof() hack
> > disappear.
> >
> > On a side note, while not relevant to the kernel, __is_constexpr()
> > relied on the GNU extension that sizeof(void) is 1. const_expr() does
> > not use any GNU extensions, making it ISO C compliant.
> >
> > __is_constexpr() is temporarily kept and will be removed once all its
> > users get migrated to is_const() (or one of its friend).
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/compiler.h | 41 ++++++++++++++++++++++++++++++++++++++++=
+
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fad9bc=
7bffab9097f8b0450 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *off)
> >  #define statically_true(x) (__builtin_constant_p(x) && (x))
> >  #define statically_false(x) (__builtin_constant_p(x) && (x) =3D=3D 0)
> >
> > +/*
> > + * Whether x is the integer constant expression 0 or something else.
> > + *
> > + * Details:
> > + *   - The C11 standard defines in =C2=A76.3.2.3.3
> > + *       (void *)<integer constant expression with the value 0>
> > + *     as a null pointer constant (c.f. the NULL macro).
> > + *   - If x evaluates to the integer constant expression 0,
> > + *       (void *)(x)
> > + *     is a null pointer constant. Else, it is a void * expression.
> > + *   - In a ternary expression:
> > + *       condition ? operand1 : operand2
> > + *     if one of the two operands is of type void * and the other one
> > + *     some other pointer type, the C11 standard defines in =C2=A76.5.=
15.6
> > + *     the resulting type as below:
> > + *       if one operand is a null pointer constant, the result has the
> > + *       type of the other operand; otherwise [...] the result type is
> > + *       a pointer to an appropriately qualified version of void.
> > + *   - As such, in
> > + *       0 ? (void *)(x) : (char *)0
> > + *     if x is the integer constant expression 0, operand1 is a null
> > + *     pointer constant and the resulting type is that of operand2:
> > + *     char *. If x is anything else, the type is void *.
> > + *   - The (long) cast silences a compiler warning for when x is not 0=
.
> > + *   - Finally, the _Generic() dispatches the resulting type into a
> > + *     Boolean.
>
> The comment is absolutely excessive.
> I'm sure I managed about 2 lines in one of the patches I did.

I think that Linus made it  clear in:

  https://lore.kernel.org/all/CAHk-=3DwgfpLdt7SFFGcByTfHdkvv7AEa3MDu_s_W1kf=
OxQs49pw@mail.gmail.com/

that this deserves a detailed comment.

The details block in the current __is_constexpr() is 37 lines long,
the details block in __is_const_zero() takes 22 lines. So I would
argue that I made things better.

Unless more people share your concern, I am planning to keep this comment a=
s-is.

> > + *
> > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
>
> IIRC Martin has agreed in the past that the accreditation can
> be removed - especially since it refers to the 'sizeof (void)' trick.

I tried to look for such message:

  https://lore.kernel.org/all/?q=3Df%3A%22martin+uecker%22+__is_constexpr

but couldn't find it. Do you have the link?

@Martin, do you agree that I remove the accreditation?

> > + */
> > +#define __is_const_zero(x) \
> > +     _Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *: 0)
> > +
> > +/*
> > + * Returns a constant expression while determining if its argument is =
a
> > + * constant expression, most importantly without evaluating the argume=
nt.
>
> You need to differentiate between a 'constant integer expression'
> and a 'compile time constant'.

OK. This one was just copied from the previous __is_constexpr(). I will app=
ly
"s/constant expression/constant integer expression/g" in v2.

> > + *
> > + * If getting a constant expression is not relevant to you, use the mo=
re
> > + * powerful __builtin_constant_p() instead.
>
> __builtin_constant_p() is not 'more powerful' it is testing for
> something different.

I meant to say that __builtin_constant_p() is more powerful at
constant folding. But I agree that the comment is not clear.

What about this?

  If getting a constant integer expression is not relevant to you, use
  __builtin_constant_p() which not only returns true if the argument
  is an integer constant expression, but also if it is a compile time
  constant.


Yours sincerely,
Vincent Mailhol
