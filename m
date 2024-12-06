Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049BA9E82BC
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2EE10E30C;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 997 seconds by postgrey-1.36 at gabe;
 Fri, 06 Dec 2024 19:55:40 UTC
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
 by gabe.freedesktop.org (Postfix) with ESMTP id C518210F19A;
 Fri,  6 Dec 2024 19:55:40 +0000 (UTC)
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 4B6JcarQ027033;
 Fri, 6 Dec 2024 20:38:36 +0100
Date: Fri, 6 Dec 2024 20:38:36 +0100
From: Willy Tarreau <w@1wt.eu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>,
 Vincent Mailhol <vincent.mailhol@gmail.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
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
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "uecker@tugraz.at" <uecker@tugraz.at>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Message-ID: <20241206193836.GA26860@1wt.eu>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, Dec 06, 2024 at 11:15:20AM -0800, Linus Torvalds wrote:
> On Fri, 6 Dec 2024 at 11:07, David Laight <David.Laight@aculab.com> wrote:
> >
> > I'm missing the compiler version and options to generate the error.
> 
> Just -Wall with most recent gcc versions seems to do it. At least I
> can repro it with gcc-14.2.1 and something silly like this:
> 
>   $ cat t.c
>   int fn(int a) { return (a<<2)?1:2; }
>   $ gcc -Wall -S t.c
>   t.c: In function 'fn':
>   t.c:1:26: warning: '<<' in boolean context, did you mean '<'?
> [-Wint-in-bool-context]
> 
> > Does a '+ 0' help?  "(var << 2) + 0 ? 0 : 0"
> 
> Yeah, that actually works.
> 
> And "+0" is nice in that it should work in any context.

I've already used "+0" to shut certain warnings, I don't really remember
which one, but also remember it was OK everywhere I needed.

Another trick I've been using to shut up the compiler is a cast via typeof
and an intermediary variable:

  #define shut_up(expr)                           \
          ({                                      \
                  typeof(expr) _expr_ = expr;     \
                  _expr_;                         \
                  })
  
  int fn1(int a)
  {
          return shut_up(a << 2) ? 1 : 2;
  }
  
  int fn2(int a)
  {
          return (a << 2) ? 1 : 2;
  }

  $ gcc -Wall -S t2.c
  t2.c: In function 'fn2':
  t2.c:15:19: warning: '<<' in boolean context, did you mean '<'? [-Wint-in-bool-context]
     15 |         return (a << 2) ? 1 : 2;
        |                ~~~^~~~~

See ? It only complains on fn2() but not fn1(). Similarly I found it
to be quite portable (at least I don't remember seeing it fail on me).
It produces the exact same code, except at -O0 where it does really
create a local variable.

Willy
