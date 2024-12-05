Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742FA9E6883
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3863110F017;
	Fri,  6 Dec 2024 08:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kqdwckbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDF10EFE6;
 Fri,  6 Dec 2024 00:05:59 +0000 (UTC)
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by smtp.orange.fr with ESMTPSA
 id JLr3tcGl1TOxlJLr3tlS0U; Fri, 06 Dec 2024 01:05:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733443558;
 bh=fohnIjaGXi4erexWkQR0Ki8fkQHzJ2JQlgx+0ILcUhI=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=kqdwckbAVE/03ViPtIxZ/6vAzBTqok15p85UwCJVtPV3va/DmubHCGFuUVYN94hgH
 4HLwjvpfaz5vbtVxF2y3rZASlRpiIsHGTxT2kmvZ83V3YTmKPjqoub/vn36Wjz138B
 F+6MRobCvpv8abxA0vel5hdoDfGpaHRW2efe7b3a5xvvWNI5d1Ll43DqwXFTpv/BAz
 +QnS1lEv+Lpg/TIuNV+XtiLbBwnEIsPacsjFjodheBs54T7t+3oiFO1cl/37EfWAAf
 s+J9Ut/wb4YqVpog5Xf/S29KxmE9WfRmqoXfNWMnmrjy+cBzjCaaVc3KWZpDBV9fnA
 nAwJxthW16G7Q==
X-ME-Helo: mail-ed1-f54.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 01:05:58 +0100
X-ME-IP: 209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d0bf80972dso1832168a12.2; 
 Thu, 05 Dec 2024 16:05:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtPBdzEbwdBzllMLsqYOFlf4m/kYMKIUGi7uLaAs90EjDSBFUyq6D8sNZMAytLgtLswGLaJcBmCwY=@lists.freedesktop.org,
 AJvYcCX9AqM2GUAw4qoG+7YkWpCgzE5c+pieTS8spsoJZWJ7j6QDpoKeffSz14FqkUz+SR/on04SvIcysLWy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXs1J4D3kfBklf/LKtH8NatGnRqyk1S7OPyukV1gZRvwgXqGvM
 m2yUWAGaU/EF+6+Cbt09J3cFHRq7NvNROLG6DNA2eD9iFaB0iMI2IiG4+MuBfpNDWNctCLu5S1b
 4DvZ6ATffBpuklqmxNvcBZLQNLaQ=
X-Google-Smtp-Source: AGHT+IF7fNOJRtWBE8J5EkTB8RHD/J+PNwJHWESTQDWwz7k7Xwis6ssZjGPrSAnluvbW+xerUjreaR05tr055MdLvCI=
X-Received: by 2002:a05:6000:1a88:b0:385:df73:2f42 with SMTP id
 ffacd0b85a97d-385fd3f2e65mr9440939f8f.32.1733412345020; Thu, 05 Dec 2024
 07:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr>
 <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com>
In-Reply-To: <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:25:34 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
Message-ID: <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
Subject: Re: [PATCH 01/10] compiler.h: add statically_false()
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

On Thu. 5 Dec 2024 at 03:30, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > For completion, add statically_false() which is the equivalent of
> > statically_true() except that it will return true only if the input is
> > known to be false at compile time.
>
> This is pretty much pointless.
> It is just as easy to invert the condition at the call site.

To start with, I will argue that:

  statically_false(foo)

is more pretty than

  statically_true(!(foo))

In addition, the simple negation !(foo) only works if foo is a
boolean. If it is an integer, you would get the -Wint-in-bool-context
warning. Thus you would have to write:

  statically_true((foo) == 0)

Anyone using this in a global header basically does not know what type
of argument they are getting. So, the (foo) == 0 trick is a must. But
because it is ugly, better to encapsulate it once for all. The
statically_false() is just cleaner and less error prone.

That said, I am not strongly opposed to removing statically_false(),
but in that case, I would also remove is_const_false(). For me, these
come as a pair, either we have both or we have none. Only having one
of these looked unbalanced.


Yours sincerely,
Vincent Mailhol
