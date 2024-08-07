Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A094A693
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 13:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5053710E4B2;
	Wed,  7 Aug 2024 11:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mD4IY8MA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE2410E4B0;
 Wed,  7 Aug 2024 11:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6EB8CCE10B9;
 Wed,  7 Aug 2024 11:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF93C32782;
 Wed,  7 Aug 2024 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723028671;
 bh=WryCtfDTwpLJfLb+h3LF6Ld+vO8Q+1flRpuRIuiXoQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mD4IY8MA6rHtHW+8SFkOiPXEVM1OG+kbWiATP4mCHzpSliZVHWFUHkwf2C4FP1e/c
 JWNqR5yBj28gofIcY9qiRpWGc2Ju4g5fxjCu+M1agwK/FvJw8aa/A6IAlmA1x9ZGik
 0vHZFUuhtW7pClhzlx+gUGhjxnEtqrg8XDUQPyjA=
Date: Wed, 7 Aug 2024 13:04:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org,
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org,
 llvm@lists.linux.dev, Finn Behrens <me@kloenk.dev>,
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Subject: Re: [PATCH 08/12] include: add elf.h support
Message-ID: <2024080717-cross-retiree-862e@gregkh>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
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

On Wed, Aug 07, 2024 at 01:09:22AM +0200, Daniel Gomez via B4 Relay wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 
> Add a copy of elf/elf.h header from the GNU C Library (glibc), version
> glibc-2.40 into include/elf. Update Makefiles where elf.h header is used
> to ensure the compiler can find all necessary headers, for macOS host
> where these headers are not provided by the system.
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  arch/arm64/kernel/pi/Makefile     |    1 +
>  arch/arm64/kernel/vdso32/Makefile |    1 +
>  arch/arm64/kvm/hyp/nvhe/Makefile  |    2 +-
>  include/elf/elf.h                 | 4491 +++++++++++++++++++++++++++++++++++++
>  scripts/Makefile                  |    3 +-
>  scripts/mod/Makefile              |    6 +
>  6 files changed, 4502 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
> index 4d11a8c29181..eb782aaa6585 100644
> --- a/arch/arm64/kernel/pi/Makefile
> +++ b/arch/arm64/kernel/pi/Makefile
> @@ -20,6 +20,7 @@ KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
>  KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
>  
>  hostprogs	:= relacheck
> +HOSTCFLAGS_relacheck.o = -I$(srctree)/include/elf
>  
>  quiet_cmd_piobjcopy = $(quiet_cmd_objcopy)
>        cmd_piobjcopy = $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 25a2cb6317f3..e1ac384e6332 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -107,6 +107,7 @@ VDSO_LDFLAGS += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  # $(hostprogs) with $(obj)
>  munge := ../../../arm/vdso/vdsomunge
>  hostprogs := $(munge)
> +HOSTCFLAGS_$(munge).o = -I$(objtree)/include/elf
>  
>  c-obj-vdso := note.o
>  c-obj-vdso-gettimeofday := vgettimeofday.o
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index 782b34b004be..40541c0812bf 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -15,7 +15,7 @@ ccflags-y += -fno-stack-protector	\
>  	     $(DISABLE_STACKLEAK_PLUGIN)
>  
>  hostprogs := gen-hyprel
> -HOST_EXTRACFLAGS += -I$(objtree)/include
> +HOST_EXTRACFLAGS += -I$(objtree)/include -I$(srctree)/include/elf
>  
>  lib-objs := clear_page.o copy_page.o memcpy.o memset.o
>  lib-objs := $(addprefix ../../../lib/, $(lib-objs))
> diff --git a/include/elf/elf.h b/include/elf/elf.h
> new file mode 100644
> index 000000000000..33aea7f743b8
> --- /dev/null
> +++ b/include/elf/elf.h
> @@ -0,0 +1,4491 @@
> +/* This file defines standard ELF types, structures, and macros.
> +   Copyright (C) 1995-2024 Free Software Foundation, Inc.
> +   This file is part of the GNU C Library.
> +
> +   The GNU C Library is free software; you can redistribute it and/or
> +   modify it under the terms of the GNU Lesser General Public
> +   License as published by the Free Software Foundation; either
> +   version 2.1 of the License, or (at your option) any later version.
> +
> +   The GNU C Library is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   Lesser General Public License for more details.
> +
> +   You should have received a copy of the GNU Lesser General Public
> +   License along with the GNU C Library; if not, see
> +   <https://www.gnu.org/licenses/>.  */

I understand your want/need for this, but new files need a SPDX license
header instead of this type of license boilerplate.  Didn't glibc
already convert to SPDX?

Also, as this is not internal for the kernel, but rather for userspace
builds, shouldn't the include/ path be different?

thanks,

greg k-h
