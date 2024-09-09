Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45687970D04
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 07:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431E510E2BC;
	Mon,  9 Sep 2024 05:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OmafMRgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4E010E2B9;
 Mon,  9 Sep 2024 05:41:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA52AA42644;
 Mon,  9 Sep 2024 05:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98345C4CECC;
 Mon,  9 Sep 2024 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725860489;
 bh=OTGCX2VKTWNg7JAPpYr9MFc9b3r06DZVg97o1hSt/ng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OmafMRgKBs/YPsssr9NrQZkZVgLxdeEi1wJY0RiiVcqI7BNI3DfbQfJplscZVvWhb
 8+Dld2aPaQbivqVZbDAgSTXcRyUNk3glo7iXLUszV/3qHKlywdLsSSSfF+MIKwXJi9
 tXghX8eW2v2IRd9prCHu/Y2cLmHG84sN8TBlvB9vYqyeHhk4TkOU39hklAwAD0NTZA
 SuyWB2Wtr7LfSY9P6hgUZY+knIc+erNzkRNhurRBZuqMlhmAeTRDibAc6o5KUXJcwm
 6nbToxWsZQmyO4FaQW0+F0uig6JUDmPxaHNzdLYu45JRK+s2wYZx+pY4CV806PgktD
 wL2xdgJwKUfYw==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5365a9574b6so3546069e87.1; 
 Sun, 08 Sep 2024 22:41:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYY6FCr9s4/kqjVIYFETolDqiVZxdGx5UtX4pLBttRq861a/QxIMZxFIOO6KHwtMD3YPtn2TyDmJ8=@lists.freedesktop.org,
 AJvYcCVn3iSQiVvWrQkjWvngJBGkom3Cxmba3Lrk3p314UdWkikz3rl7qSbt5/gpdmwqAc1h+w8I432n5qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7iRMIrB3aw9DHKZ7dR3rT3XlaLhTEeyE/V5sVQGCsxrHEY1at
 dl7PkyoI7r9L5dUoHtpQIHmxis8FPfy1erlaQ4qsuYUkA1Lh9xy7nKYBvozaUwntIJbqNiqGeu2
 lDWvm7WdWJduzO58r4Mvtx8G+HsM=
X-Google-Smtp-Source: AGHT+IE/eeAL3wg4+8lM40atumui+ijWmakaqLgAR4P5hoc1oVKlVHlObEKIEHv2t3Afuag93sP746lU4PC9rYvIgVg=
X-Received: by 2002:a05:6512:3e27:b0:536:5529:f718 with SMTP id
 2adb3069b0e04-5365880c60bmr7800264e87.54.1725860488188; Sun, 08 Sep 2024
 22:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-2-06beff418848@samsung.com>
 <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com>
 <CABj0suCHeWGDXX-S6U9X5iCzwMqn9pq=i84PSKwKtUXhGxaBjQ@mail.gmail.com>
In-Reply-To: <CABj0suCHeWGDXX-S6U9X5iCzwMqn9pq=i84PSKwKtUXhGxaBjQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Sep 2024 14:40:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPS2cdRso_zHt1Z0Gyugc4KOhZVYAFP35f=Eaoy6-8Cg@mail.gmail.com>
Message-ID: <CAK7LNATPS2cdRso_zHt1Z0Gyugc4KOhZVYAFP35f=Eaoy6-8Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] file2alias: fix uuid_t definitions for macos
To: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
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
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 9, 2024 at 2:41=E2=80=AFAM Daniel Gomez (Samsung)
<d+samsung@kruces.com> wrote:
>
> On Sun, Sep 8, 2024 at 1:56=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > The uuid_t struct defined in sys/types.h on macOS hosts conflicts wit=
h
> > > the one defined in file2alias, resulting in the typedef redefinition
> > > error below. To resolve this conflict, define the _UUID_T and
> > > __GETHOSTUUID_ in file2alias HOSTCFLAGS.
> > >
> > > Error:
> > >   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> > > error: typedef redefinition with different types ('struct uuid_t' vs
> > > '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       =
|
> > > ^
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
> > >    typedef __darwin_uuid_t uuid_t;    |                         ^
> > > scripts/mod/file2alias.c:1354:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:19: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:31: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:43: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1354:55: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1354 |
> > >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:19: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:31: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:43: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1355:55: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1355 |
> > >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:20: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:33: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:46: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1356:59: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1356 |
> > >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],    =
  |
> > >  ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > scripts/mod/file2alias.c:1357:7: error: member reference base
> > >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> > >  'unsigned char[16]') is not a structure or union 1357 |
> > >  uuid->b[15]);      |                 ~~~~^ ~
> > > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> > >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> > >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> > >    |                                                        ^~~~~~~~~=
~~
> > > 17 errors generated.
> > >
> > > Suggested-by: Nicolas Schier <nicolas@fjasle.eu>
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  scripts/mod/Makefile     | 2 ++
> > >  scripts/mod/file2alias.c | 3 +++
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> > > index c729bc936bae..75c12c045f21 100644
> > > --- a/scripts/mod/Makefile
> > > +++ b/scripts/mod/Makefile
> > > @@ -8,6 +8,8 @@ modpost-objs    :=3D modpost.o file2alias.o sumversio=
n.o symsearch.o
> > >
> > >  devicetable-offsets-file :=3D devicetable-offsets.h
> > >
> > > +HOSTCFLAGS_file2alias.o +=3D -D_UUID_T -D__GETHOSTUUID_H
> > > +
> > >  $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FOR=
CE
> > >         $(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)
> > >
> > > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > > index 99dce93a4188..ab743f6d60ef 100644
> > > --- a/scripts/mod/file2alias.c
> > > +++ b/scripts/mod/file2alias.c
> > > @@ -11,6 +11,9 @@
> > >   */
> > >
> > >  #include "modpost.h"
> > > +#ifdef __APPLE__
> > > +#define uuid_t sys_uuid_t
> > > +#endif
> > >  #include "devicetable-offsets.h"
> >
> >
> >
> >
> > Is this what Nicolas suggested?
> > https://lore.kernel.org/lkml/20240807-sexy-roadrunner-of-acceptance-a84=
bbf@lindesnes/
> >
> >
> > I thought he suggested replacing #ifdef __APPLE__
> > with -D_UUID_T -D__GETHOSTUUID_H.
> >
> >
> > You added -D_UUID_T -D__GETHOSTUUID_H,
> > keeping #ifdef __APPLE__.
>
> I forgot to remove this.
>
> Based on your suggestion in the other thread to use/overwrite
> HOSTCFLAGS via the command line, it seems I should drop this patch.
> Can you confirm?


Yes, I think this patch is unnecessary because:

 [1] You can feed "-D_UUID_T -D__GETHOSTUUID_H"
     from the HOSTCFLAGS env variable
 [2] uuid_t may be dropped if I succeed in
     refactoring modpost in the future





--=20
Best Regards
Masahiro Yamada
