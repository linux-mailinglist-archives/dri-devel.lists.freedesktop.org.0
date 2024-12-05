Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3479E6889
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B6F10F030;
	Fri,  6 Dec 2024 08:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="qx5Rl+fF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4960410E18E;
 Thu,  5 Dec 2024 21:47:22 +0000 (UTC)
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by smtp.orange.fr with ESMTPSA
 id JJgttdzItqhuoJJgutKMm7; Thu, 05 Dec 2024 22:47:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733435240;
 bh=L5clrau1lRtsXlazqJvRaiJm9ebUB3H7RT0weXhH8So=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=qx5Rl+fF0W8lmvN1BcYjwmcBq6L/aTOeEY1iGuf/7C8OacrgGVFylGk3ZLAviOpXK
 SnA55lG6EjkwQJzROMhfiGiwF/zj3fN8EXFbJ+yEEPD3XlehO4sYbhbFVyRCGeBfm/
 raMxQxS66JNlbZRjw6iEIrVoURDOmuAf0cwSPbSaFm0CBO5fal25a8VyxJswnFsazQ
 yi4ijQ2F5UfNHW0FNpTMCus/h7SyJb9RD8eiseIbNC06PkxLQyhAIXZtuiunpg+oAI
 xKcVQwy3jnkejmdiMnqfYe97qEG9PSTIcEInJ+QtrR6Cvxa3V1tAWtRMPc6g+O5TL1
 NFk4fJP7C3mpg==
X-ME-Helo: mail-lj1-f178.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 22:47:20 +0100
X-ME-IP: 209.85.208.178
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30024c73101so10437121fa.1; 
 Thu, 05 Dec 2024 13:47:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUP7CqaULWXpsjICC8EYU0fn8pIg4O/TarfBxChSMIr4Tv+bWNhkH1kFmStTs/aksmswXNBhDAtQvud@lists.freedesktop.org,
 AJvYcCWcxHGL230IHsgkoQdrnVMglxJ5zALz3u+eFQu2zzIxFUr/XsHaBTGAkoogqO+FeL4KCcjAFlvCyCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfj54Z/1fEQv+RPXIhnk2TuGn2IxVK8WBvjpB6//1372howFj5
 SKk48TjLsrkQWTuSonCATXAo8Re3ctaT6+0nqrOmpnoIvSyq7OMJnZxFguM+1d9kPwQA/ApGLDX
 23kI3BtvvncCwbF9Eus0plD/mtpM=
X-Google-Smtp-Source: AGHT+IH7WYy/8Hc8H+vVCwhqalxjzlWUoqcEyoqkjWQBBxloHACrRQF+5k7EKnQaTMOmRJCyI12iNEP09nDvxOtT4aY=
X-Received: by 2002:a05:6402:358f:b0:5d0:fc12:79e3 with SMTP id
 4fb4d7f45d1cf-5d125063c34mr3565576a12.15.1733414047033; Thu, 05 Dec 2024
 07:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-6-4e4cbaecc216@wanadoo.fr>
 <ad4482cc835543578862051431f5174f@AcuMS.aculab.com>
In-Reply-To: <ad4482cc835543578862051431f5174f@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:53:56 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJMXKaa_xDcyweGwb+FqvANrpvrkRvnjh6_s-J1ApVmaA@mail.gmail.com>
Message-ID: <CAMZ6RqJMXKaa_xDcyweGwb+FqvANrpvrkRvnjh6_s-J1ApVmaA@mail.gmail.com>
Subject: Re: [PATCH 06/10] fortify: replace __is_constexpr() by is_const() in
 strlen()
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

On Thu. 5 Dec. 2024 at 03:58, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > is_const() is a one to one replacement of __is_constexpr(). Do the
> > replacement so that __is_constexpr() can be removed.
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/fortify-string.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> > index 0d99bf11d260a3482bbe46e35c7553c0ccfb8b94..e3f2f772c5439ef71eb4a904b4ce27956bc69743 100644
> > --- a/include/linux/fortify-string.h
> > +++ b/include/linux/fortify-string.h
> > @@ -254,8 +254,8 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char * const POS p, __kernel_size
> >   * Returns number of characters in @p (NOT including the final NUL).
> >   *
> >   */
> > -#define strlen(p)                                                    \
> > -     __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
> > +#define strlen(p)                                            \
> > +     __builtin_choose_expr(is_const(__builtin_strlen(p)),    \
> >               __builtin_strlen(p), __fortify_strlen(p))
>
> I'm sure Linus suggested a way of doing that without replicating
> the __builtin_strlen().
>
> Indeed it may be valid to do:
>         len = __builtin_strlen(p);
>         __builtin_constant_p(len) ? len : __fortify_strlen(p);

Then, wouldn't it be better for strlen() to be an inline function
instead of a macro?

  __FORTIFY_INLINE __kernel_size_t strlen(const char *p)
  {
          __kernel_size_t ret = __builtin_strlen(p);

          if (__builtin_constant_p(ret))
                  return ret;
          return __fortify_strlen(p);
  }

I tested it and it worked on an allyesconfig. So if I receive no
objections, strlen() will become an inline function in v2.


Yours sincerely,
Vincent Mailhol
