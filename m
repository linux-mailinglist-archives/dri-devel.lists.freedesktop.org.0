Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541579E6884
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017C510EFFE;
	Fri,  6 Dec 2024 08:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aVzGogmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 527 seconds by postgrey-1.36 at gabe;
 Thu, 05 Dec 2024 15:30:41 UTC
Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8F610E3E5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:30:41 +0000 (UTC)
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by smtp.orange.fr with ESMTPSA
 id JDfrt2JeNQ2aZJDfrtOBlz; Thu, 05 Dec 2024 16:21:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733412112;
 bh=5Sob8jML2a9sfY47l90QZhBAyozcID3U7Li8+UA7roI=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=aVzGogmcTPRdjLpDdU/7wCOIlxa/3k9MfUx9oXxURMDPjn98fuB0PLDwBo5NAqUUU
 ZCyRgBXKhOh1O1qV3BMRpAN8iX0SOL8sy7M4kmTBCfkEY01ELS6vc+SCyaJ2oTaFJG
 WY5QTjECwGMTPjnZCaf6e8NMnhANiAArbAsiy7I6tepSRZ9vh5GW4O3M9R5yWzqRI3
 tuOZ/8tEzxmX9Nu4g0gnT+I9PfENnOe4KxABB2icpuwPl0uP4VG2UjXVmfJk04vrwP
 0c1o4j7/O5xytJ5pDDfI3rVf6kTcCCJVQXxcAtrAED3p7DpAAG66pUYEOxoBvx+WNV
 rZjURcMV9HxiA==
X-ME-Helo: mail-lj1-f179.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 16:21:52 +0100
X-ME-IP: 209.85.208.179
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3000b64fbe9so9960441fa.1; 
 Thu, 05 Dec 2024 07:21:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUXI25gL/HipuGV6jBvnlPAiYIYaDAHRFC/bymlbJ52mOg3Dz3G7v5AfXKi41u1Q9kapqbvhyR9RnY=@lists.freedesktop.org,
 AJvYcCX2yD6gBcu5z79Zn7kNmthN403mK9TigF/OK+fiGSgJdHe2j8JP+uYAITjztoBD1XWVq/aqwgSiHE86@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg0Zd8FZL2cSxWXHAf9h3IufHeBPFmmpvU4MnLS9PtXmoVoNIT
 2RT8LJnkaq8d6/Olk6JMYSA0HtcoKAHmq2hAd0QGJK3DyGzOp2+qRSv8O7NhgihXTfXSEU/saPG
 FNAm51KaJGi360lWYzV+ng3kgwas=
X-Google-Smtp-Source: AGHT+IFTPODU6RGdJMXff+75tOD6Nj3x2Mn/gdl5NWtqQnJzhnFZgI0m0ZroaJ8Q+jvxJuILOkW0ziN/Pe9Qt29xALE=
X-Received: by 2002:a05:6512:32c8:b0:53e:28dd:a9d1 with SMTP id
 2adb3069b0e04-53e28ddb7bcmr693951e87.24.1733412111008; Thu, 05 Dec 2024
 07:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <FBEB24FF-5885-4938-8D1C-9B7BA9071FB9@kernel.org>
In-Reply-To: <FBEB24FF-5885-4938-8D1C-9B7BA9071FB9@kernel.org>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:21:35 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLSiTfTNQrcje06MbSxvM2k16MgqG1YTCufe6j9FhupEw@mail.gmail.com>
Message-ID: <CAMZ6RqLSiTfTNQrcje06MbSxvM2k16MgqG1YTCufe6j9FhupEw@mail.gmail.com>
Subject: Re: [PATCH 00/10] compiler.h: refactor __is_constexpr() into
 is_const{, _true, _false}()
To: Kees Cook <kees@kernel.org>
Cc: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <David.Laight@aculab.com>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
 linux-sparse@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org
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

On Thu. 5 Dec. 2024 at 08:58, Kees Cook <kees@kernel.org> wrote:
> On December 3, 2024 3:33:22 AM GMT+10:00, Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:
> >This series is the spiritual successor of [1] which introduced
> >const_true(). In [1], following a comment from David Laight, Linus
> >came with a suggestion to simplify __is_constexpr() and its derived
> >macros using a _Generic() selection. Because of the total change of
> >scope, I am starting a new series.
> >
> >The goal is to introduce a set of three macros:
> >
> >  - is_const(): a one to one replacement of __is_constexpr() in term
> >    of features but written in a less hacky way thanks to _Generic().
> >
> >  - is_const_true(): tells whether or not the argument is a true
> >    integer constant expression.
> >
> >  - is_const_false(): tells whether or not the argument is a false
> >    integer constant expression.
>
> But why make this change? Is something broken? Does it make builds faster?
>
> > 7 files changed, 97 insertions(+), 84 deletions(-)
>
> It makes the code larger too. I don't see what the benefit is, and given how much time has been spent making sure the existing stuff works correctly, I feel like we should have a clear benefit to replacing it all.

It makes the "code" larger because patch 3 ("compiler.h: add
is_const_true() and is_const_false()") adds two new macros with 20
lines of comments to explain the pros and cons. So the added "code" is
only comments. If you ignore the comments, you can see that I am
actually removing a few lines of code.

As for the clear benefit, sorry, but I have nothing more to offer
other than code simplification. The reason why a lot of time was spent
to make __is_constexpr() work correctly is just a testimony of how
complex the thing is. That alone can be a reason to simplify it, now
that new tools (_Generic()) are available.

Of course, modifying __is_constexpr() is not strictly needed to
introduce the new is_const_expr(). My previous series:

  https://lore.kernel.org/all/20241113172939.747686-4-mailhol.vincent@wanadoo.fr/

 did it that way. But I was rightfully pointed out for my macro being
ugly. Maybe I can suggest that you give a look to the above thread and
tell me if you still disagree with David and Linus's comments after
reading it?


Yours sincerely,
Vincent Mailhol
