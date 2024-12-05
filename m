Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DA9E82C2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCC310E506;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="DIQKZN4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-11.smtpout.orange.fr [193.252.22.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72C210E1F6;
 Fri,  6 Dec 2024 23:42:10 +0000 (UTC)
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by smtp.orange.fr with ESMTPSA
 id JhxYtSrPmagYUJhxYt272k; Sat, 07 Dec 2024 00:42:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733528528;
 bh=y8D8qHkNTgsq/hueRr7hAF5ECQldq13KAVXg/Zr3BLA=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=DIQKZN4N1tG5kIETufS6VciJ5rA1lbylGpeGGxllZWRAwIeeqD0VmS7Y9ehLeIVBs
 ImFgKbWnwl1aTcVcWCjtKFvH8NQ1lFr7UZhx9xtB543JddN+hr2Tvde4S+EBRcqifB
 hWpoxUvXihD53FwPfq2zFr1BGW2BSiTW8QYeqDDpErRh2Zmw7cUdnytOWElMixEiV5
 hHZ+cgAnkswvorGk+UNOxES/cYA33MbWLIV7WNeqqAeaCdwXNAINVkTKrGkrBtZf7r
 JEaUxCNhFd7WLi9rHiuVZlmizuYkemkhswv2SU9pDYiltUuI7EACsYy/owQoeTS53Y
 NPXv/cz3zDXLQ==
X-ME-Helo: mail-ed1-f45.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 00:42:08 +0100
X-ME-IP: 209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so3717479a12.0; 
 Fri, 06 Dec 2024 15:42:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU95dgD5pLmWnXlHhGTLAG5oqWaDRpz7LTREkO7AlDVVj9f207E/Xv/k3lGT2ovfATj4dEV+5O8CVQe@lists.freedesktop.org,
 AJvYcCUqGuU/myvSI2mV652Q5wekaL/RUvnFeQiI6mUcciL18cLmHA3c7swRZh5POAyBZt2KRmwLvXGM7Z8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+ggF95gHBkAMcGhl0cHYEEfyVyIZxOxaknlDjwBOpEMg6OCUP
 sbXE5ZZheNZnbUypsVTCdr+7u1yRBulrToSl3hkc7Ucqi3pmeQdl+4BKSQoqszDJ0G/rJxCuVs2
 FpnpSMXs7+QDluNvmyTBYuBeQHDY=
X-Google-Smtp-Source: AGHT+IFZAC0AEpJ1/mPjmzfGhg/DetDbHXis2ssNehZ0yWdtCmcXanGc2R7Dja3wTy2rdkW6SAY6SvJBqtErDk3coGc=
X-Received: by 2002:a17:906:3295:b0:aa5:28af:f0e with SMTP id
 a640c23a62f3a-aa5f7d4edd1mr1018856966b.15.1733413793948; Thu, 05 Dec 2024
 07:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-4-4e4cbaecc216@wanadoo.fr>
 <dff4cdd543104e3792e4856375f310c1@AcuMS.aculab.com>
In-Reply-To: <dff4cdd543104e3792e4856375f310c1@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:49:43 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLsiOF=5FZ=U2MtZ01iBYKZHtfZ5Zi4t3m=L5Oc4EPHGg@mail.gmail.com>
Message-ID: <CAMZ6RqLsiOF=5FZ=U2MtZ01iBYKZHtfZ5Zi4t3m=L5Oc4EPHGg@mail.gmail.com>
Subject: Re: [PATCH 04/10] linux/bits.h: simplify GENMASK_INPUT_CHECK() by
 using is_const_true()
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

On Thu. 5 Dec 2024 at 03:52, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> >   __builtin_choose_expr(__is_constexpr((l) > (h)), (l) > (h), 0)
> >
> > is equivalent to:
> >
> >   is_const_true((l) > (h))
>
> Change it to BUILD_BUG_ON_MSG(statically_true((l) < (h)), "error message")
>
> and then fix all the fallout :-)

BUILD_BUG_ON_MSG() is not suitable for GENMASK_INPUT_CHECK. We need
one of the variants that returns zero here.

But I agree that it is good to have a more meaningful error message
here. I will use __BUILD_BUG_ON_ZERO_MSG() in v2.


Yours sincerely,
Vincent Mailhol
