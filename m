Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7AE9E6882
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003BD10EFF1;
	Fri,  6 Dec 2024 08:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Fr2FylXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB2F10E2D8;
 Thu,  5 Dec 2024 21:43:57 +0000 (UTC)
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by smtp.orange.fr with ESMTPSA
 id JJdbtamvwo2eYJJdbtXBPV; Thu, 05 Dec 2024 22:43:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733435035;
 bh=1FRoHoQWpZzbjWYvjotIUGh9Pf5+Jx2FZlKpO4hH6NM=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=Fr2FylXA9m2UMqFj4uyKZwPTMcy6pn3IB5yA6fnTjtV4RrhdP9Uipdn8mn2RfZgq+
 bmzbAEOg1RIYbz84u9XDIvMCkkNPoh942LSUzWxqIeVSXs8VLQ7t9E941xZnNxnK8+
 mck0ZPSdxEaP0SaA0lkz9UDTWNkAMDzOdIJjkQSXl5B+av0sntjJnwK+bEEDWZJf4A
 rtOQycuZFrV3IABqI0ynxClSA6RXCwntHT2oWo7Lg3yajCXH1pPWt5A/ZmNpc6ycd+
 qMcpwbtiPTRq/Y57kARZ63Pdqx11WSkaFeOYOW9nJwgqR3vU/r1o40YlWqTv2pb7U2
 pyLJForVcHKkA==
X-ME-Helo: mail-ed1-f47.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 22:43:55 +0100
X-ME-IP: 209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d3ab136815so694529a12.1; 
 Thu, 05 Dec 2024 13:43:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWEY93Qb0hKWug3mF+CPzw91SM+hP1M6EGApDkZJlviJ5uQrhRlaw+xqHpK+AjgbpRO79tqCT0haQQ=@lists.freedesktop.org,
 AJvYcCXQ2Ka0oS/fFGpPr1tNKcPyTMtfN32u2wTp7UZpin455/8O+BKAQUQhefu9PU/Er1HbK4R8Nx7S0cyA@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs4wMgL9/qc+bw4HyyAkma2O+CEygLR/eo3YUFl0xwE582T49Q
 acjffmeo409fpDf/0lZhrUDvBAF784MsD8is4xYNzXgZeExJHbBi+MXl8hdKocC2ybKSKHS9omf
 foRgoMVmrIGkcLFOyDkVo4MGjO84=
X-Google-Smtp-Source: AGHT+IFYWIvr/wb1ttWAqU3XdgmdbVRXgljv2wGXYHxZGru+z8zfXAuY4J7uLgYbwqJhFyewdEilCwKv6EaVf4E+2bE=
X-Received: by 2002:a17:907:270f:b0:a9e:b5d0:e5c with SMTP id
 a640c23a62f3a-aa5f7f6f2f8mr768523566b.61.1733414207483; Thu, 05 Dec 2024
 07:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-8-4e4cbaecc216@wanadoo.fr>
 <6597979088eb4ee7b98cfb99815a402e@AcuMS.aculab.com>
In-Reply-To: <6597979088eb4ee7b98cfb99815a402e@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:56:35 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+XhOb+yn5A1dHD=qkbB1_FQXMA7_ydBB4nPTSnys3jkA@mail.gmail.com>
Message-ID: <CAMZ6Rq+XhOb+yn5A1dHD=qkbB1_FQXMA7_ydBB4nPTSnys3jkA@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/i915/reg: replace __is_const_expr() by
 is_const_true() or is_const()
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

On Thu. 5 Dec 2024 at 04:00, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:34
> >
> > Most of the use of __is_const_expr() in i915_reg_defs.h are just to
> > test whether an expression is known to be true. Because those checks
> > are all done in a BUILD_BUG_ON_ZERO(), replace those with
> > is_const_true().
>
> Another place that could use statically_true() and BUILD_BUG_ON_MSG().

Here also, BUILD_BUG_ON_MSG() is not suitable because it does not
return a value.

__BUILD_BUG_ON_ZERO_MSG() could be used; but there is less benefit to
do this at a driver scope. In this i915_reg_defs.h,
BUILD_BUG_ON_ZERO() is used 20 times. Adding an error message each
time will just make things ugly.

If we want more readable error messages here, the solution for me is
just to redefine BUILD_BUG_ON_ZERO() to print a more meaningful error
message by default. But this is not the scope of this series. I sent a
separate patch for this:

  https://lore.kernel.org/all/20241205151316.1480255-2-mailhol.vincent@wanadoo.fr/

Concerning statically_true() instead of is_const_true(), let me test,
and if this works, then I will replace these in v2.


Yours sincerely,
Vincent Mailhol
