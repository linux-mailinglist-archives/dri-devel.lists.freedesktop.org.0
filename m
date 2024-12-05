Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197C9E82C5
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538FA10E63C;
	Sat,  7 Dec 2024 23:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Qg3qPC5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-12.smtpout.orange.fr [193.252.22.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C623710E00B;
 Sat,  7 Dec 2024 05:24:07 +0000 (UTC)
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by smtp.orange.fr with ESMTPSA
 id JnITtByeUHqNCJnITtpnrv; Sat, 07 Dec 2024 06:24:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733549046;
 bh=j52yWXL33J+b9C4aQGdxSf0Rg4c/99LnqEiKjLeaVbc=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=Qg3qPC5A1Sav8bq6eKd4DhOWeuSSdivmLthEvUpcG79u3sbPl0mD2qG6pbOs/giVS
 b8BH+KZA20LelrLqpPSFuOoE5XidpdTKmWUc3AAdRtIh0FTQx9RmipqQtGvrStUr8m
 XWI//kC6cu4uWljHiMewnJT9HqeoLjqq4H8V+dCdiYN0GtnEVk9YNwVJDqA3MYPtBW
 LQXBLy+lgevwdRygigNaCZRFgCWwLW3EYZxIbZ4jpzwiIyLVvATz3K3lTC3pMu/4oi
 rxQ3j/LJxKMOaXRX1qTRqEu0rzkltE0MUVfEKSOXln85G2q17J7mUc6W0p65qUNAIX
 cA1oU7szWaRKQ==
X-ME-Helo: mail-ej1-f43.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 06:24:06 +0100
X-ME-IP: 209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso417750966b.1; 
 Fri, 06 Dec 2024 21:24:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU4VznzyEhAr0sOxpEaoFLE88IxunmgM+kTn+tLqt8ZOJRPxQiexApaYuy2BpLzrcCoAzOi1+BGbnw=@lists.freedesktop.org,
 AJvYcCVa9TgczjurQ4iaU9uijBTzmX1n8blq4D+d5Z25u15rhS8QM7n8WmzoRqXOfgAqHL798dhJ4Pq5d8r7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEUqLUEPoNs9vNYIli/bhbKk5Sdr4VRXo4Xle1B9WrVOyvEwzh
 W4s3W1HJG/aNbrVb44wXwQrIlFXkHjSyckCTsTlqrlbUCXptIgUVnUUtlW6KGbSwd0ewQbIJl+M
 5tnzV3Tu2TAypy2wix/GKs4sVBMA=
X-Google-Smtp-Source: AGHT+IFPV3ip3SYHkyJAtAl7kySK0yuNHOCaaw0rmFlBgQknleAfhI1fXHmOk07U56ZQY/Lp14i5paMJiLtiZFuprbE=
X-Received: by 2002:a17:906:2191:b0:aa6:2d5c:29ce with SMTP id
 a640c23a62f3a-aa62d5c2a3bmr190097866b.52.1733413722571; Thu, 05 Dec 2024
 07:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-3-4e4cbaecc216@wanadoo.fr>
 <c617483816b54096ba4b30bea595da49@AcuMS.aculab.com>
In-Reply-To: <c617483816b54096ba4b30bea595da49@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:48:31 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+=-d0_v3Xqj0CpaPbNuzQuv1SouTkc3Ew5vc5Sb_DUng@mail.gmail.com>
Message-ID: <CAMZ6Rq+=-d0_v3Xqj0CpaPbNuzQuv1SouTkc3Ew5vc5Sb_DUng@mail.gmail.com>
Subject: Re: [PATCH 03/10] compiler.h: add is_const_true() and is_const_false()
To: David Laight <David.Laight@aculab.com>
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
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, 
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

On Thu. 5 Dec 2024 at 03:48, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > __builtin_constant_p() is known for not always being able to produce
> > constant expression [1] which led to the introduction of
> > __is_constexpr() [2]. Because of its dependency on
> > __builtin_constant_p(), statically_true() suffers from the same
> > issues.
>
> No, they are testing different things.

OK, I will remove this paragraph.

> > For example:
> >
> >   void foo(int a)
> >   {
> >        /* fail on GCC */
> >       BUILD_BUG_ON_ZERO(statically_true(a));
> >
> >        /* fail on both clang and GCC */
> >       static char arr[statically_true(a) ? 1 : 2];
> >   }
> >
> > Define a new is_const_true() and is_const_false() pair of macros
> > which, by making use of __is_const_zero(), always produces a constant
> > expression.
> >
> > Note that is_const_false() can not be directly defined as an alias to
> > __is_const_zero(). Otherwise, it could yield some false positives on
> > huge numbers because of a lost of precision when doing the (long) cast
> > in __is_const_zero(). Example:
> >
> >   is_const_false((u128)ULONG_MAX << BITS_PER_LONG)
> >
> > Furthermore, using the ! operator like this:
> >
> >   #define is_const_true(x) __is_const_zero(!(x))
> >   #define is_const_false(x) __is_const_zero(!!(x))
> >
> > would yield a -Wint-in-bool-context compiler warning if the argument
> > is not a boolean. Use the =3D=3D and !=3D operators instead.
> >
> > It should be noted that statically_true/false() are the only ones
> > capable of folding tautologic expressions in which at least one on the
> > operands is not a constant expression. For example:
> >
> >   statically_true(true || var)
> >   statically_true(var =3D=3D var)
> >   statically_false(var * 0)
> >   statically_false(var * 8 % 4)
> >
> > always evaluate to true, whereas all of these would be false under
> > is_const_true/false() if var is not a constant expression [3].
> >
> > For this reason, usage of const_true/false() should be the exception.
> > Reflect in the documentation that const_true() is less powerful and
> > that statically_true() is the overall preferred solution.
> >
> > [1] __builtin_constant_p cannot resolve to const when optimizing
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D19449
> >
> > [2] commit 3c8ba0d61d04 ("kernel.h: Retain constant expression output f=
or max()/min()")
> > Link: https://git.kernel.org/torvalds/c/3c8ba0d61d04
> >
> > [3] https://godbolt.org/z/E4r7EaxW9

D'oh, I used some old versions of the macros in that link. The link
will be updated to this in v2:

  https://godbolt.org/z/E4r7EaxW9

> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/compiler.h | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index 30ce06df4153cfdc0fad9bc7bffab9097f8b0450..165aa5b9bc484376087a130=
a1ac1f3edb50c983d 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -357,6 +357,29 @@ static inline void *offset_to_ptr(const int *off)
> >   */
> >  #define is_const(x) __is_const_zero(0 * (x))
> >
> > +/*
> > + * Similar to statically_true() but produces a constant expression
>
> No.
> It tests whether a value is a 'constant integer expression' and
> the result is a 'constant integer expression'.
> statically_true() checks for the value being a 'compile time constant'.

I still would argue that =E2=80=99constant integer expressions=E2=80=99 and=
 =E2=80=99compile
time constants=E2=80=99 are *similar*. Not the same, agreed, but not
drastically different either. I picked the term *similar* for that
reason.

> Most code really doesn't care, it all got added to min() so that
> a very few places could do:
>         char foo[min(16, sizeof (type))];
> without triggering the 'variable length array' warning.
> But that just bloated everywhere else and (IIRC) Linus replaced
> them with a MIN() that was just an expression.

What about:

  Return an integer constant expression while evaluating if the
  argument is a true (non zero) integer constant expression.



> > + *
> > + * To be used in conjunction with macros, such as BUILD_BUG_ON_ZERO(),
> > + * which require their input to be a constant expression and for which
> > + * statically_true() would otherwise fail.
>
> Use a different BUILD_BUG macro instead.
> Look at the current definition of min().

Do you mean BUILD_BUG_ON_MSG()? That one, at the end, relies on the
error attribute:

  https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-=
error-function-attribute

And the error attribute logic relies on compiler optimization. So
BUILD_BUG_ON_MSG() is not a valid example here because it does not
require its argument to be an integer constant expression. It works
well with other compile time constants.

Another valid example would be _Static_assert() but as a matter of
fact, it is more common to use __is_constexpr() together with
BUILD_BUG_ON_ZERO() than it is with _Static_assert(). So I think that
BUILD_BUG_ON_ZERO() is best here.


Yours sincerely,
Vincent Mailhol
