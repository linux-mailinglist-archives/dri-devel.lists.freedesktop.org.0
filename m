Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360B9E82C4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5BC10E637;
	Sat,  7 Dec 2024 23:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="NV8W7gCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-16.smtpout.orange.fr [193.252.22.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26F210E640;
 Sat,  7 Dec 2024 16:33:39 +0000 (UTC)
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by smtp.orange.fr with ESMTPSA
 id JxkPtxgHPOZ7nJxkQtzcNr; Sat, 07 Dec 2024 17:33:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1733589218;
 bh=EDV0uoUPSeCM4ycVbpiYzkI+GBIJXljO1W7VncV40gg=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=NV8W7gCn9oe/rL7MffkNOyoC+JVA07dJ8CtXAqGO01FxcpxpnPglRt1FM55fvOYgm
 wlzDPe6VvGoTVnLIsArQtK8gzApCZwPk8uKo94lvvsRFqT6tHpa5A+mwzgm/+UYUHH
 9gPJSo5BvYq0cNTD+DYrWPGrjBLUvQfeB2/BfTJ2ss/kpRYuiirSjTotvhrTuD/PN2
 QIcz7jQxOdkqkTRz5lrKSHeKYJx+9reNQkTQL948+r0Xyg6nitKvd2zYKfcA6BL8sB
 4HGNcm1zJ4O5zDVxFQ/tqrM/pfqlZOS8qzFCcFyBWJX1eNOmhaA5QeV15VbR/BR/vz
 wTmIHH8MH4fBQ==
X-ME-Helo: mail-ej1-f43.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 17:33:38 +0100
X-ME-IP: 209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa647af6804so178371066b.1; 
 Sat, 07 Dec 2024 08:33:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSXY1v5grG4+dAhFJ1w1V+qeKBKzMJmByAzVe1eBfi7wx8Hs8HiK9Cr+LFbj30V4M0+OmqzNW7cJ6t@lists.freedesktop.org,
 AJvYcCVvAspyxJa917UzoejUkkEV/JhzZ3bzlrrKuwA6E9e+yKRYwrz05QXun5kKxKueT6/V6guWiFzzaZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxafH+shgTu3acOjAWoI9OnwT+mYrvsecz3qjwLp4QKhVak+kl1
 HlDPgHSK26AqJPCKupvbNg5k2V9KUZT6Gj500yipeUgQIoVx5KrRfP9xGOe5KUu4AHGsl5KChaY
 i3Er1d+OrkSYRy+NLNHT3JbZtS0k=
X-Google-Smtp-Source: AGHT+IEENKH5q363NsvaDS9r/FGBH4NT8jK2UDZzhmMDEw1YQ0vbbHzKVnWBLQ5cMhIKh2zINR9br+tBOM6tHUnfBmY=
X-Received: by 2002:a17:907:7759:b0:a99:5f45:cb69 with SMTP id
 a640c23a62f3a-aa6202f3295mr391454866b.4.1733413951191; Thu, 05 Dec 2024
 07:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr>
 <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
In-Reply-To: <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:52:20 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
Message-ID: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] minmax: simplify __clamp_once() by using
 is_const_false()
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

On Thu. 5 Dec. 2024 at 03:54, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > In __clamp_once(),
> >
> >   __builtin_choose_expr(__is_constexpr((lo) > (hi)), (lo) <= (hi), true)
> >
> > is equivalent to:
> >
> >   !is_const_false((lo) <= (hi))
> >
> > Apply is_const_false() to simplify __clamp_once().
>
> There is already a patch 'for next' that changes it use BUILD_BUG_ON_MSG()
> and statically_true().

Found it!

  https://lore.kernel.org/all/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com/

I think the easiest would be for me to cherry pick this patch. So that
regardless which series is merged first, no conflict will occur, the
patch will just be skipped the second time it is encountered.

Does this work for you?


Yours sincerely,
Vincent Mailhol
