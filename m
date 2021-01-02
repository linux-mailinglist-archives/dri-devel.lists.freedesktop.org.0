Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA22E8702
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 12:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3089385;
	Sat,  2 Jan 2021 11:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479F489385;
 Sat,  2 Jan 2021 11:23:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 114F6223E4;
 Sat,  2 Jan 2021 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609586617;
 bh=QkAtYWKA5NhUKSgBrKt3Um+b8JsODNS1rc7ga3g5SHk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HgATpEfsWXamt8ySvK2iYAfXRczn34Y0UgUZBPJY0UgZw985oNTVaoG4BbULlRBIB
 Q9aBTTWNjizwgF6gud7fLYsnjPbMpCKKo6KZLIPRcfdqQtm1tci3FlaHL/vTiPHgcU
 q9ePbNvQj2p4CHa/KmdSuKFzELGx51O1Khdy6YK3xlEa35zO1NpHFmghjWmg8sqh0n
 b36unRniR0uJ3IvEuAJ1+vtDqez7MQzTMUBdUrqL1XPJziunLJU/udGwGAVdZMTFs/
 MHaV6lubp1QvphvWbNLN/elKic4ZLDkPKhvt7TQGlkv93VPrbmOU6yTaltDB4/mOOa
 cCpDL9OIKc0/A==
Received: by mail-ot1-f51.google.com with SMTP id n42so21704121ota.12;
 Sat, 02 Jan 2021 03:23:37 -0800 (PST)
X-Gm-Message-State: AOAM532MFVJFRkSps0/9jBc8FX6Pz2sbeJ3q4beQqLQPDZOPM0GtuW9a
 fBSBPCyQcjXX2J8LPLK87HXblgAenOhw/q9gJqw=
X-Google-Smtp-Source: ABdhPJxtNm2L3E+7cUbGuFw8FJsQ5ZXduzpGG24W4VGko6nC5XeZqvgH+bJbgT94nbPC/zq9Pz+doj4j9bk+F3IDAWg=
X-Received: by 2002:a05:6830:2413:: with SMTP id
 j19mr49011301ots.251.1609586616367; 
 Sat, 02 Jan 2021 03:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20201230153928.456260-1-arnd@kernel.org>
 <160934377188.21284.5702573697011773996@build.alporthouse.com>
In-Reply-To: <160934377188.21284.5702573697011773996@build.alporthouse.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 2 Jan 2021 12:23:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LWLKs+0quG_OS6EPgg2uSAOM69SKTix47tEUmuZWRdw@mail.gmail.com>
Message-ID: <CAK8P3a0LWLKs+0quG_OS6EPgg2uSAOM69SKTix47tEUmuZWRdw@mail.gmail.com>
Subject: Re: [PATCH] i915: fix shift warning
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 30, 2020 at 4:56 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Arnd Bergmann (2020-12-30 15:39:14)
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Randconfig builds on 32-bit machines show lots of warnings for
> > the i915 driver for incorrect bit masks like:
>
> mask is a u8.
>
> VCS0 is 2, I915_MAX_VCS 4
>
> (u8 & GENMASK(5, 2)) >> 2

Ah right, I misread the warning then.

> > drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2584:9: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
> >         return hweight64(VDBOX_MASK(&i915->gt));
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
> >  #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
>
> So it's upset by hweight64() on the unsigned long?

I suspect what is going on is that clang once again warns because it performs
more code checks before dead-code elimination than gcc does. The warning is
for the __const_hweight64() case, which is not actually used here because the
input is not a compile-time constant.

> So hweight_long?

That seems to work, I'll send a new version with that.

> Or use a cast, hweight8((intel_engine_mask_t)VDMASK())?
>
> static __always_inline int engine_count(intel_engine_mask_t mask)
> {
>         return sizeof(mask) == 1 ? hweight8(mask) :
>                 sizeof(mask) == 2 ? hweight16(mask) :
>                 sizeof(mask) == 4 ? hweight32(mask) :
>                 hweight64(mask);
> }

Fine with me as well. If you prefer that way, I'll let you handle that.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
