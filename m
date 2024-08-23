Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D195D2B8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB27210EC69;
	Fri, 23 Aug 2024 16:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RzINPVnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7592710EC68;
 Fri, 23 Aug 2024 16:13:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4A747CE11B4;
 Fri, 23 Aug 2024 16:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6431C4AF09;
 Fri, 23 Aug 2024 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724429585;
 bh=302mPfppIzV0eIiBLegANXAiB+NF/JryI6zwyAqPKeI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RzINPVndTTUj+asMFEppBFy7pDGuOAnrE9Jgv1eJMn89tbZDJCo57vRvvspyzGZ4D
 O6AL7rD/VLe4o74RnAr/YPOEvEiZJJmLTpv05MXRVMJxQO6uSAtQ9JMGmGOtdzXt7a
 bsg2Y4AoC6AqlAUKsnnuoy/uk3jd32wsj/Ly5iz9yHGyMLPcAUM8lBFId933gRYig1
 odf5AUxyq+UkFaazEie02329cmjxL0NGk1zM8uPK0DaUuDgB0KGScugLmwNRF9YGNp
 rvjh0/hUFtofDyBR6WAwzm65juIYwLwy3mY91mydJlL50rH18GGLPlYjwqP0QvP8Qk
 6z6GSw+jk338A==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f3edb2d908so22009881fa.2; 
 Fri, 23 Aug 2024 09:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUVuoW2dn/ab59oPinIKGvtRGRm7onQgOwgaSl8ksSeraVRmvH+FWlyKRMe2XXO63aq+rjs2E/UKrg=@lists.freedesktop.org,
 AJvYcCW+qsDaMVKV28Ipf0+uPW1FcK40pRJ5MQKniwRBsd5jmio0uZf5s2iyFPcW5Qmgu75aZvWuoR1eFmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVwhcwswcLWKvkDJILOhjDcsAMpZ9nOmYd3V2YestoVqbZUDzI
 MgHZ9AeXQ3gKCfeY4j7VntF2FqWE27MhoAEL6rOiOO/7jW3KSGKOXbSBlF2KIDk9e/FabK99IpQ
 g+VFdVYhQlviRAaHxedFqw2atBpM=
X-Google-Smtp-Source: AGHT+IGLQePVn5RhKmrGdV43WiO6IyDdZ4P8M+JxvZmPPDeIiajBOGYYWmzAWjRdCByIm/YmPmOehjlJ0SdmJRob6wc=
X-Received: by 2002:a05:651c:1505:b0:2ef:2dfd:15dc with SMTP id
 38308e7fff4ca-2f4f48ef636mr23768021fa.9.1724429584330; Fri, 23 Aug 2024
 09:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Aug 2024 01:12:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmy=N+6O87BJGZbodssDw21sHgMf36TXdcxD4=5A_OBA@mail.gmail.com>
Message-ID: <CAK7LNARmy=N+6O87BJGZbodssDw21sHgMf36TXdcxD4=5A_OBA@mail.gmail.com>
Subject: Re: [PATCH 01/12] scripts: subarch.include: fix SUBARCH on MacOS hosts
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
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
 Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com, Nick Desaulniers <nick.desaulniers@gmail.com>
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

On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Nick Desaulniers <nick.desaulniers@gmail.com>
>
> When building the Linux kernel on an aarch64 MacOS based host, if we don'=
t
> specify a value for ARCH when invoking make, we default to arm and thus
> multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.
>
> This is because subarch.include invokes `uname -m` which on MacOS hosts
> evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,
>
> This allows us to build ARCH=3Darm64 natively on MacOS (as in ARCH need
> not be specified on an aarch64-based system).
>
> Utilize a negative lookahead regular expression to avoid matching arm64.


Does sed support "negative lookahead regular expression"?

>
> Add a separate expression to support for armv.* as per error reported by
> Nicolas Schier [1].
>
> [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t
>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  scripts/subarch.include | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/subarch.include b/scripts/subarch.include
> index 4bd327d0ae42..5d84ad8c0dee 100644
> --- a/scripts/subarch.include
> +++ b/scripts/subarch.include
> @@ -6,7 +6,8 @@
>
>  SUBARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
>                                   -e s/sun4u/sparc64/ \
> -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                                 -e s/armv.*/arm/ \
> +                                 -e s/arm\(?:\(?!64\).*\)/arm/ -e s/sa11=
0/arm/ \


s/arm\(?:\(?!64\).*\)/arm/

In sed, this expression does not seem to match anything.

(or please give me some matching examples if I miss something)





Nocolas already provided correct code:

> [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t






>                                   -e s/s390x/s390/ \
>                                   -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>                                   -e s/sh[234].*/sh/ -e s/aarch64.*/arm64=
/ \
>
> --
> Git-146)
>
>


--
Best Regards


Masahiro Yamada
