Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C963D94D42F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2701210E97A;
	Fri,  9 Aug 2024 16:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="oyavxWLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E5D10E916
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 13:47:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ef95ec938so2198046e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1723211268; x=1723816068;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpHG5jPmqSzzMq80QApgQU2Gxos+KWN9CPGhvKscsRg=;
 b=oyavxWLBCPUMJfRnTKs8XtrdTBQ9LYfJGm7IJRLwLE4hGcemFuoeN/QnAPabkwbsVa
 Xo6a/w9qUwS36C1SkWu2QitN/LhNBY8AFcs1qVDjB2v3WNuSPykZiAyWVQA6L2Xg0xzQ
 8NMYGyQ6Wvzk70+yCrWJqLS+P/YcHl4HK4lvGQcAi/yXXa3vhDb6jrKPFLcGRZ5eQTKg
 Tdk28CxepjlAuMu4enkGTmyHg6KEf2az00v1pwy/AY31/ccjgWEZI6HieipyaSbkMR8g
 Oz5Te8UVPGyNpCcK30S173Bf9o7+nLDTup9zU234SxflAM6Q7dAbhLWdWdV93+X9ti4p
 whIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723211268; x=1723816068;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jpHG5jPmqSzzMq80QApgQU2Gxos+KWN9CPGhvKscsRg=;
 b=w9bmQl3Dl8VIXwcZnLIU0ZWWJtCo7eEWqKm+HsVAvNnqjq+5TEeh6EUl6VBpdaKeoy
 FcYKE2FMQXrVNWftlxfcgZPlhbPN0+ftFNlB49HTEA3sVd0+8DuaeUliopWJeGhAreri
 qfQtAihnq7I4D+0hrmso1SPgmg2vaPdni7rOp+HZZopD3nLkwKO0LcKeuf2v/2NOIuUI
 4Bua26FVWM1LH/roMmoHWpQZkHVNf6dpG6BbGWINJ821QKA06BEIPhLws6jH+drVgOp+
 nFfDV6dbNY/KvAGIvubO4bnbcEycJyaoxCv56aOPC9RxLg5I9+zZHUgDB77C9O1I9C4G
 Qq5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhxU3ZcdL75bnYmzbswtt5lNV5z85mdWmYbaEFweS/h9pGEkPeOhWmXlzIKgBrSl38QNBiFpq6c6a0vtGqyOWLs3szGTiwfl/fxKlxNW4L
X-Gm-Message-State: AOJu0Yxj0ZXq6gd8WlRLobzevL0SjRmqVqHAgjYn/ykLXfuctZnBZyzR
 Dw/gXROofuCOsVkk0DE+C2iSbW1gC8d2WuVFd2wEJIsb4OsrddBBIEjPbjGRp0K+LvLUzA2mdoF
 MyxNvoUClmOYuU4N9B2fdehFsVPy+dDk68BaUrg==
X-Google-Smtp-Source: AGHT+IHRvyhFxRd+8gsq4yU0wWg6PpO4Ch68Ej98GVi8jrDPqmad9RYqQx3J3nljLKafMtNu25HNa4FplBYJma626Jg=
X-Received: by 2002:a05:6512:158d:b0:52e:9b68:d2da with SMTP id
 2adb3069b0e04-530ee96c1b3mr1277926e87.9.1723211267644; Fri, 09 Aug 2024
 06:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com>
 <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
In-Reply-To: <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Fri, 9 Aug 2024 15:47:21 +0200
Message-ID: <CABj0suDkth5OY2SEaasyMWvFMnQyjqg=YPiyp38BpP0RdC_hNg@mail.gmail.com>
Subject: Re: [PATCH 11/12] tty/vt: conmakehash requires linux/limits.h
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 09 Aug 2024 16:09:10 +0000
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

On Fri, Aug 9, 2024 at 2:15=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > macOS hosts do not provide the linux/limits.h header required for
> > conmakehash. To address this, ensure that usr/include is included in
> > the conmakehash HOSTCFLAGS. This will provide the necessary header for
> > successful compilation on macOS.
> >
> > Fixes error:
> > HOSTCC  drivers/tty/vt/conmakehash - due to target missing
> >   clang -Wp,-MMD,drivers/tty/vt/.conmakehash.d -Wall
> > -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
> > -std=3Dgnu11   -I ./scripts/include     -o drivers/tty/vt/conmakehash
> > drivers/tty/vt/conmakehash.c
> > drivers/tty/vt/conmakehash.c:15:10: fatal error: 'linux/
> >    limits.h' file not found 15 | #include <linux/limits.h>    |
> >    ^~~~~~~~~~~~~~~~
>
>
> The error is reported at line 15 of drivers/tty/vt/conmakehash.c
>
>
> The line 15 is #include <stdlib.h>:
>
> https://github.com/torvalds/linux/blob/v6.11-rc1/drivers/tty/vt/conmakeha=
sh.c#L15

The patches were sent using the latest linux-next at the moment of
sending, so next-20240806.
B4 adds the baseline [1] used at the bottom.

[1] base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179

So line 15 is linux/limits.h header in this case:
https://github.com/torvalds/linux/blob/1e391b34f6aa043c7afa40a2103163a0ef06=
d179/drivers/tty/vt/conmakehash.c#L15
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/tty/vt/conmakehash.c?h=3D1e391b34f6aa043c7afa40a2103163a0ef06d179#n15

This patch adds the header:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers/tty/vt/conmakehash.c?h=3Dnext-20240809&id=3D6e20753da6bc651e02378a0=
cdb78f16c42098c88

>
>
> So, host programs cannot include <stdlib.h> on your build machine.
>
>
>
> drivers/tty/vt/conmakehash.c has only 5 include directives:
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sysexits.h>
> #include <string.h>
> #include <ctype.h>
>
>
> You cannot build this, your build machine cannot build anything.
>
>
>
>
>
>
>
>
>
> > 1 error generated.
> > make[5]: *** [scripts/Makefile.host:116: drivers/tty/vt/conmakehash]
> > Error 1
> > make[4]: *** [scripts/Makefile.build:485: drivers/tty/vt] Error 2
> > make[3]: *** [scripts/Makefile.build:485: drivers/tty] Error 2
> > make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
> > make[1]: *** [/Volumes/src/kernel/linux-next/Makefile:1925: .] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2
> >
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  drivers/tty/vt/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
> > index 2c8ce8b592ed..d266895357e5 100644
> > --- a/drivers/tty/vt/Makefile
> > +++ b/drivers/tty/vt/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_CONSOLE_TRANSLATIONS)    +=3D consolemap=
.o consolemap_deftbl.o
> >  clean-files :=3D consolemap_deftbl.c defkeymap.c
> >
> >  hostprogs +=3D conmakehash
> > +HOSTCFLAGS_conmakehash.o =3D -I$(srctree)/usr/include
> >
> >  quiet_cmd_conmk =3D CONMK   $@
> >        cmd_conmk =3D $(obj)/conmakehash $< > $@
> >
> > --
> > Git-146)
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada
