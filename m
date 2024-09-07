Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DEB970162
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 11:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AED410E20F;
	Sat,  7 Sep 2024 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="02cuX01i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AF810E210
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 09:32:49 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so35277166b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Sep 2024 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725701567; x=1726306367;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYAYDwYU9XEQd7B0n4GlUaSi+kByWiSIqgApWZK2k7Y=;
 b=02cuX01iS32BLEBhVizrk6qa/WY70EWsw9S2vmafoKkhweW7lOJbsUPnqJcFS/ldT0
 fWtib0UxsPqVThO1avPtI52hWzq9bTE0I4xte3jiazMKI9tQfFey6nZKOn1D1C30yy70
 01KMoBumjoY2PWNcGGM8h7elszcRM16BXR09Qk1Kw0G0VPEXti2n4TW/48caaJMFGExL
 P1CKzv8sCp+zgOLvMU2j2LuMvO99AGz3nkwPZ9VkU6usBGrddC+nPaVZU236EgC4aRTW
 NzHSje18cC+JkqB2X2jRczqGPQZqjzwpyhzMUZWuR5M/LEUKnf7qBYk1h0cARRd5B3N2
 cLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725701567; x=1726306367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYAYDwYU9XEQd7B0n4GlUaSi+kByWiSIqgApWZK2k7Y=;
 b=jpDdgeTzAz1f2NDDgbn/nJe1KFi9NAR1pr9MBXxEmwHsnxBCZS/g8szALr1ncjr1/G
 X+MzrcTT6DuultX0AYw2tk+9dEh1YWglQk1rT+hsEiohkjo/B3qxfTXF+AEboMMSGo5M
 /ZuDjzQWWXoaCqyrR1t/Zr8cUpOgX+38ICUaIVcj29/xrmoYe6dyXYGGYNy9G57YsRIl
 /5OasbBeVCmk73f02BFMWvsNGtp6FQa4N1fsdLBSDpOApmtXD7s+AbKL9Wb9qkgJPdxd
 H1zR0dkNMfuRcU99HRumGSLBgA28ZRhA9m6cHW96lDzsAbvNx7ZRbtT8unHb7Dn69hxq
 nFJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgI+MlyLEr2KAKpx8my9/7qYEbX3+UyEVgmQDTdVvNPXKfjlKkQalGkV7WZE7np3Q+bCbSjj6AXkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKOC/vJopKgnq9bpT2qNRsQEcjZlX2xz+bl7VrvVeRDTtU92Ec
 vipF9gnjpkGlNZTQ5/pY7HnIcUgNCV2S9PnvRqPrUYa9GW/t2D5bAfU4cJ/EmGrz2yhkdIWNrwF
 vYCxj2oEqJu408tSCOnRo3QiORP0sUTqS8WQUxw==
X-Google-Smtp-Source: AGHT+IGWwhV1FppouK54v3V9A8eHwS6rbK0nonXkKqq2rXZ9hT6w4qHPiZkVwNteqV+2HfQ53hj21jvfFLgYyvqTkhg=
X-Received: by 2002:a17:906:6a15:b0:a7a:9144:e23a with SMTP id
 a640c23a62f3a-a8d248a6d5fmr79801166b.43.1725701567219; Sat, 07 Sep 2024
 02:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
 <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
In-Reply-To: <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Sat, 7 Sep 2024 11:32:20 +0200
Message-ID: <CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] Documentation: add howto build in macos
To: Masahiro Yamada <masahiroy@kernel.org>
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

On Sat, Sep 7, 2024 at 10:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > Add documentation under kbuild/llvm to inform about the experimental
> > support for building the Linux kernel in macOS hosts environments.
> >
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
>
>
> Instead, you can add this instruction to:
>
> https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md

Sure, that can be done as well. But the effort here is to have this
integrated. So, I think documentation should be in-tree.

>
>
>
>
>
> > ---
> >  Documentation/kbuild/llvm.rst | 78 +++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 78 insertions(+)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.=
rst
> > index 6dc66b4f31a7..de3bde925793 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -186,6 +186,84 @@ yet. Bug reports are always welcome at the issue t=
racker below!
> >       - Supported
> >       - ``LLVM=3D1``
> >
> > +Experimental Build in macOS
> > +---------------------------
> > +
> > +Building on macOS with LLVM is experimental. This section provides ste=
ps to
> > +install dependencies via Homebrew, set up the environment, and start t=
he build
> > +process.
> > +
> > +1. **Create a Case-Sensitive Volume**
> > +
> > +   For fetching and building the project, you need a case-sensitive vo=
lume. Use the following
> > +   command to create one:
> > +
> > +   .. code-block:: shell
> > +
> > +      diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux
> > +
> > +   Replace `/dev/disk<N>` with the appropriate disk identifier.
> > +
> > +2. **Install Build Dependencies**
> > +
> > +Use Homebrew to install the required build dependencies.
> > +
> > +- **Core Utilities**: `coreutils`, `findutils`, `gnu-sed`, `gnu-tar`, =
`grep`,
> > +  `llvm`, `make`, and `pkg-config`.
> > +
> > +   .. code-block:: shell
> > +
> > +      brew install coreutils findutils gnu-sed gnu-tar grep llvm make =
pkg-config
> > +
> > +- **Bee Headers**: Install byteswap, elf and endian headers using the
> > +  `Bee Headers Project <https://github.com/bee-headers/headers>`_.
> > +
> > +   .. code-block:: shell
> > +
> > +      brew tap bee-headers/bee-headers
> > +      brew install bee-headers/bee-headers/bee-headers
> > +
> > +   After installation, verify the `CFLAGS` with `pkg-config`:
> > +
> > +   .. code-block:: shell
> > +
> > +      pkg-config --cflags bee-headers
> > +      -I/opt/homebrew/Cellar/bee-headers/0.1/include
> > +
> > +3. **Configure the PATH**
> > +
> > +   Include all the required GNU tools and LLVM in your `PATH`. This en=
sures that
> > +   the necessary tools are available during the build process.
> > +
> > +   .. code-block:: shell
> > +
> > +      PATH=3D"/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
> > +      PATH=3D"/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
> > +      PATH=3D"/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
> > +      PATH=3D"/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
> > +      PATH=3D"/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
> > +      PATH=3D"/opt/homebrew/opt/make/libexec/gnubin:$PATH"
> > +      PATH=3D"/opt/homebrew/opt/llvm/bin:$PATH"
> > +
> > +Building the Project
> > +--------------------
> > +
> > +Once the environment is set up, you can start the build process using =
LLVM. Run
> > +the following commands to initiate the build:
> > +
> > +.. code-block:: shell
> > +
> > +   make LLVM=3D1 allyesconfig
> > +   make LLVM=3D1 -j$(nproc)
> > +
> > +Supported in macOS
> > +~~~~~~~~~~~~~~~~~~
> > +
> > +At the moment, only arm64 is supported and tested with `allyesconfig` =
Makefile
> > +configuration target. Other Kconfig options not included in `allyescon=
fig`
> > +target and architectures may be supported as well as support in macOS =
is based
> > +on LLVM effort and maintenance.
> > +
> >  Getting Help
> >  ------------
> >
> >
> > --
> > 2.46.0
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada
