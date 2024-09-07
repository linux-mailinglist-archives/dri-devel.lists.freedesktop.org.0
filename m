Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67B8970488
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 01:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C09910E084;
	Sat,  7 Sep 2024 23:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SibNPPI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F9410E084;
 Sat,  7 Sep 2024 23:56:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 959655C0FF9;
 Sat,  7 Sep 2024 23:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DC6C4CEDB;
 Sat,  7 Sep 2024 23:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725753406;
 bh=3+fttz6gFjJyl43MzULvKEFzXvtQ0BnzO8vK0ypOgmk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SibNPPI71xjK1aVr++eeCD/2bazAy/iYBPyysb5rRC2mHLZw3R/PX//k9Up/biD0L
 Sdl6BjlfU8OszbMxnPH927/wP+r8Pzdevh7mZYumlT0Wv1/hzTYZOAKH1kU3vxngaz
 bNK5UG2LrqHTNDxHsj/OpBB7iLGFwyhLPVm6voHKPa9KQnsPJyKubDU/llolAE8tyd
 qnzqPVgqd6JJD5C4Bhy4hwTHF8ZqiMDWJ7WyrC8zUj6qZyyY7+umgeB83vaqzDj5oq
 N+uMOqKu1EaTUnOrf/gSOdbWOMBGHj4R3WwDXjffhLDYaNh7THJSXkkpaurSw3OV3G
 Bq/I6AT6oSfSA==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53660856a21so696417e87.2; 
 Sat, 07 Sep 2024 16:56:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkSpQypp3HUxfYviJTxKx5n86SxO3byWor0ptjeALgNKALhjqG95HTR9dfG16G6HmNjT7SWL3xko8=@lists.freedesktop.org,
 AJvYcCX4AxjwXSUsRBSDb0214crjpR712WR++hFC0Q/WwzlGmBo/mtnd+4fJO/kHTFBlpkp33jOl2GRGAiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEyJKkGCI3h7PtdcuaaNo9XMgyX2SN0zLVsdTssg3sqL4BuPRj
 kI7fiqt1DmQ2asPni1Y3ynkc8Ua7yN5+5gQADVxVpJwgChnxnkHDMAt4QWRp7In5a2VhLly7SVV
 bzn3AF6UFvAH4fwfb0N5QSMfDQjE=
X-Google-Smtp-Source: AGHT+IGCmAdPpT4vaY5j7bydBqEJCnII/COJ3M97NOQpUWntN39srlx/IA0p5Ib/mdHX9fQOiWsnGPDPPro7thKEoqs=
X-Received: by 2002:a05:6512:234e:b0:52e:9d6b:2691 with SMTP id
 2adb3069b0e04-536587b07ebmr4813104e87.20.1725753405079; Sat, 07 Sep 2024
 16:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-2-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-2-06beff418848@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 08:56:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com>
Message-ID: <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] file2alias: fix uuid_t definitions for macos
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
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
 Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com
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

On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> The uuid_t struct defined in sys/types.h on macOS hosts conflicts with
> the one defined in file2alias, resulting in the typedef redefinition
> error below. To resolve this conflict, define the _UUID_T and
> __GETHOSTUUID_ in file2alias HOSTCFLAGS.
>
> Error:
>   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> error: typedef redefinition with different types ('struct uuid_t' vs
> '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       |
> ^
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
>    typedef __darwin_uuid_t uuid_t;    |                         ^
> scripts/mod/file2alias.c:1354:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:19: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:31: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:43: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1354:55: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1354 |
>  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:19: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:31: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:43: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1355:55: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1355 |
>  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:20: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:33: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:46: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1356:59: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1356 |
>  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
>  ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> scripts/mod/file2alias.c:1357:7: error: member reference base
>  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
>  'unsigned char[16]') is not a structure or union 1357 |
>  uuid->b[15]);      |                 ~~~~^ ~
> /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
>    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
>    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
>    |                                                        ^~~~~~~~~~~
> 17 errors generated.
>
> Suggested-by: Nicolas Schier <nicolas@fjasle.eu>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  scripts/mod/Makefile     | 2 ++
>  scripts/mod/file2alias.c | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> index c729bc936bae..75c12c045f21 100644
> --- a/scripts/mod/Makefile
> +++ b/scripts/mod/Makefile
> @@ -8,6 +8,8 @@ modpost-objs    :=3D modpost.o file2alias.o sumversion.o =
symsearch.o
>
>  devicetable-offsets-file :=3D devicetable-offsets.h
>
> +HOSTCFLAGS_file2alias.o +=3D -D_UUID_T -D__GETHOSTUUID_H
> +
>  $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE
>         $(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 99dce93a4188..ab743f6d60ef 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -11,6 +11,9 @@
>   */
>
>  #include "modpost.h"
> +#ifdef __APPLE__
> +#define uuid_t sys_uuid_t
> +#endif
>  #include "devicetable-offsets.h"




Is this what Nicolas suggested?
https://lore.kernel.org/lkml/20240807-sexy-roadrunner-of-acceptance-a84bbf@=
lindesnes/


I thought he suggested replacing #ifdef __APPLE__
with -D_UUID_T -D__GETHOSTUUID_H.


You added -D_UUID_T -D__GETHOSTUUID_H,
keeping #ifdef __APPLE__.









>  /* We use the ELF typedefs for kernel_ulong_t but bite the bullet and
>
> --
> 2.46.0
>
>


--=20
Best Regards
Masahiro Yamada
