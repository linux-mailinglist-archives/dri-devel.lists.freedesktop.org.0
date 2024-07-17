Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BECB933B3B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 12:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD1110EA49;
	Wed, 17 Jul 2024 10:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oJO2W+zf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D610EA59
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 10:39:06 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso8132334e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 03:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721212745; x=1721817545;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUGlQHl8PKwPc+cI7G+9C1/A30MK7pw94dtaMexOJNU=;
 b=oJO2W+zf3UDVZ7S/QuU2RokeGPq/jCuT3K175B1AzbsHTD25jOPw6XHaVwG+7dYwWB
 SqHZjoDrc1xG2HqOvFwv6IEgBU4sI80MoECXbawfzW3Psz0FcQQ+6hFiaOfIc0MmbT6E
 rQQvGU4LKIfbHX0Rvg5Lc/8R0NnkiHDWDk59o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721212745; x=1721817545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUGlQHl8PKwPc+cI7G+9C1/A30MK7pw94dtaMexOJNU=;
 b=nC5Dzi+zfPY+ldRCCwjC4VMHXMgwCz3yfY5wCxHnkfjZb+A6AsCJnT8RM8+7iGFvDJ
 kqpPdXzSpkJ4q18Jnadr9S4XOpIfrQzoFtLgAXrAMKEfHzrHhrFdeI1kEf93xr0lPS9y
 KgRgVAUQM/F2u9Z0gtJ8kLSl6MX3+gAmMRAJ8vegcsSvUiRoR56xtFgQ7NC9s90kIGGw
 rryhBSiZNpJt/+MAJBVz/iKiUndNJctSHI5GAHq0WACjmUlTWuFXHzuTGj/Hzba/wYja
 1Br+9rjSxxiWF61zAuFpi7ouKZmovqyaXNnM+4Zl5c0yGnMO9/1+FY3JW8bJpqrFZoEY
 hJ4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlbifk3kT7bh9ClJ1bTfG6QJBx9nmaAdHrKs8YTG5IvCcKb9TV6n1+C2/HPI+CdnTbb0qj3K+ILW/6LWajk5XgCi0mL1d3qbQRtCfTnmxs
X-Gm-Message-State: AOJu0Yz+3z1y+uPUUay1hYz0KjVjQI7X8VPYsFALy6XHhUbVagjxIHi+
 Pyt3WkhGe2eLpQnwVOvl8VLHcrR9/CHfFgzK2raLF0Pc/yfqRl4Y6RUUWrB4ShRT7SGRIh6NlZU
 vuu4dZ4x9Hmj5yLhPioeXm3No7ssC2mHAID0=
X-Google-Smtp-Source: AGHT+IHxg8zNsdD8Eo1Vffp0MSXIaIS5xW3Su0QbPUe5IWbUhBN/2S1B3D0WgRGGz2VkYyi0XXC5WDVvjaMANhw5Xos=
X-Received: by 2002:a05:6512:2387:b0:52d:259d:bd91 with SMTP id
 2adb3069b0e04-52ee53b04c7mr1051655e87.18.1721212744729; Wed, 17 Jul 2024
 03:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
 <CAJfuBxyxamRhOyz8WuL+7=eJkEKSw8jnAWjyAuqU2i7gvg-rsQ@mail.gmail.com>
 <CALwA+NbUCfEj_DzT5eMQ7_pSNpyp-zBe6PEL2XnMZrb303J4_Q@mail.gmail.com>
 <CAJfuBxzeYWWV1ikYagFpyFHdAQU4ReYPirksQFHbEzDxhXCfHA@mail.gmail.com>
 <CALwA+Naec_YHxHoKu8Ba_Bnuq2L3VXw1cT3=Tx3qC3mE5_BG1g@mail.gmail.com>
 <CAJfuBxxnTyqeGtS1mPBFqX2MYs7kgK49ZUQeR1oTe4UMC4ct5A@mail.gmail.com>
In-Reply-To: <CAJfuBxxnTyqeGtS1mPBFqX2MYs7kgK49ZUQeR1oTe4UMC4ct5A@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 17 Jul 2024 12:38:53 +0200
Message-ID: <CALwA+NYQsKAtrME-dgZcBH=+KKU0duHAjxu-X3PhckJmbwz60A@mail.gmail.com>
Subject: Re: [PATCH v9 00/53] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: jim.cromie@gmail.com
Cc: Luis Chamberlain <mcgrof@kernel.org>, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com
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

On Mon, Jul 15, 2024 at 8:00=E2=80=AFPM <jim.cromie@gmail.com> wrote:
>
> On Mon, Jul 15, 2024 at 4:05=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@chro=
mium.org> wrote:
> >
> > On Sat, Jul 13, 2024 at 11:45=E2=80=AFPM <jim.cromie@gmail.com> wrote:
> > >
> > > On Fri, Jul 12, 2024 at 9:44=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@=
chromium.org> wrote:
> > > >
> > > > On Wed, Jul 3, 2024 at 12:14=E2=80=AFAM <jim.cromie@gmail.com> wrot=
e:
> > > > >
> > > > > On Tue, Jul 2, 2024 at 4:01=E2=80=AFPM Luis Chamberlain <mcgrof@k=
ernel.org> wrote:
> > > > > >
> > > > > > On Tue, Jul 02, 2024 at 03:56:50PM -0600, Jim Cromie wrote:
> > > > > > > This fixes dynamic-debug support for DRM.debug, added via cla=
ssmaps.
> > > > > > > commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
> > > > > > >
> > > > > > > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy was marked broken because dr=
m.debug=3Dval
> > > > > > > was applied when drm.ko was modprobed; too early for the yet-=
to-load
> > > > > > > drivers, which thus missed the enablement.  My testing with
> > > > > > > /etc/modprobe.d/ entries and modprobes with dyndbg=3D$querycm=
d options
> > > > > > > obscured this omission.
> > > > > > >
> > > > > > > The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP =
with
> > > > > > > DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for =
drivers.
> > > > > > > The distinction allows dyndbg to also handle the users proper=
ly.
> > > > > > >
> > > > > > > DRM is the only current classmaps user, and is not really usi=
ng it,
> > > > > > > so if you think DRM could benefit from zero-off-cost debugs b=
ased on
> > > > > > > static-keys, please test.
> > > > > > >
> > > > > > > HISTORY
> > > > > > >
> > > > > > > 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 =
dyndbg parts
> > > > > > > 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 =
drm parts
> > > > > > >
> > > > > > > https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> > > > > > > greg k-h says:
> > > > > > > This should go through the drm tree now.  The rest probably s=
hould also
> > > > > > > go that way and not through my tree as well.
> > > > > >
> > > > > > Can't this just be defined as a coccinelle smpl patch? Must eas=
ier
> > > > > > to read than 53 patches?
> > > > > >
> > > > >
> > > > > perhaps it could - Im not sure that would be easier to review
> > > > > than a file-scoped struct declaration or reference per driver
> > > > >
> > > > > Also, I did it hoping to solicit more Tested-by:s with drm.debug=
=3D0x1ff
> > > > >
> > > > > Jim
> > > > >
> > > >
> > > > Jim,
> > > >
> > > > When testing different combinations of Y/M for TEST_DYNAMIC_DEBUG a=
nd
> > > > TEST_DYNAMIC_DEBUG_SUBMOD in virtme-ng I spotted test failures:
> > > >
> > > > When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > > > BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
> > > > TEST_MOD_SUBMOD selftests passed
> > > > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > > > BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> > > > TEST_PERCENT_SPLITTING selftest fails with ": ./dyndbg_selftest.sh:=
270
> > > > check failed expected 1 on =3Dpf, got 0"
> > > > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
> > > > BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> > > > TEST_PERCENT_SPLITTING selftest fails also with ":
> > > > ./dyndbg_selftest.sh:270 check failed expected 1 on =3Dpf, got 0"
> > > >
> > > > Have I missed something ?
> > > >
> > >
> > > I am not seeing those 2 failures on those 2 configs.
> > >
> > > most of my recent testing has been on x86-defconfig + minimals,
> > > built and run using/inside virtme-ng
> > >
> > > the last kernel I installed on this hw was june 16, I will repeat tha=
t,
> > > and report soon if I see the failure outside the vm
> > >
> > > I'll also send you my script, to maybe speed isolation of the differe=
nces.
> > >
> >
> > Jim,
> >
> > I know why I saw these failures.
> > I ran dyndbg_selftest.sh directly in thw directory
> > tools/testing/selftests/dynamic_debug/.
>
> thats odd.
> I mostly run it from src-root,
> also whereever make selftest target is/works (I forgot)
>
> I went into that subdir and ran it there
> I got no test differences / failures.
>

Jim,

The dyndbg_selftest.sh checks the location of kernel .config if it is
configured and
if not it sets it to the current dir.

[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=3D".config"
if [ -f "$KCONFIG_CONFIG" ]; then

If it does not find the .config it will set the variables to:

    LACK_DD_BUILTIN=3D0
    LACK_TMOD=3D0
    LACK_TMOD_SUBMOD=3D0

and run all selftests no matter what the values (Y/M) of
TEST_DYNAMIC_DEBUG and TEST_DYNAMIC_DEBUG_SUBMOD are.

> IIRC, the failure was on line 270, just after a modprobe.
> can you further isolate it ?
>
> > All works as expected when I run it from the top kernel directory.
> > Here are the results:
> >
> > When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
> > TEST_MOD_SUBMOD selftests passed
> >
> > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
> > TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were
> > skipped
> >
> > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
> > BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
> > TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were
> > skipped
>
>
> thank you for running these config-combo tests.
>
> are you doing these in a VM ?
> and since Im asking, Ive done these combos on virtme-ng builds,
> also installed & running on 2 x86 boxen.
>

Sorry I forgot to mention that I tested it using virtme-ng.

> could you add DRM=3Dm and a driver too,
> and boot with drm.debug=3D0x1ff, dynamic_debug.verbose=3D3
> the debug output should show all the class-work on modprobe,
> for your easy inspection/grading ;-)
>

I will retest with your patchset v9.

Thanks,
Lukasz

> >
> > Based on that maybe it would be worth it for the script to fail when
> > it doesn't find a .config with an error message something like this:
>
> if no config - they get to see more errors now.
> if the solution isnt obvious to them, we can find out more ?
>
> > "Kernel .config not found. Are you running the script from the
> > kernel's top directory?"
> >
> > What do you think ?
>
> the -rc0 window is open, Id rather not fiddle with this now.
>
> Im gonna rebase onto 6.10, resend,
> copy and rebase onto drm-mumble-next
> then try to get into the DRM-CI river, see where that takes me.
>
> thanks Lukas,
> Jim
>
> >
> > Thanks,
> > Lukasz
> >
> > > > Thanks,
> > > > Lukasz
> > > >
> > > > > >   Luis
> > > > > >
