Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3709311F2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 12:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B6710E236;
	Mon, 15 Jul 2024 10:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FnEVe9/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADADA10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 10:05:09 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52ea33671ffso4146296e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721037908; x=1721642708;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXrhdNRq6oludJZnjz76rz84qmMewPWdtA9STQ5A9L0=;
 b=FnEVe9/sLPgEINEsGst9ox0IFowzHtbOV1hHXwK+2vE4B70F42sO/pAulE2xZF4yBq
 T4SkVb7xNGZThBLjsKMldERY9jSwOhSLlroPTXAYbf8CurxU3JXWROZ3ACedbLG85q/R
 gjnE9eUJyVsLFD6u4TkBQx1bcQn/mNkYBfGSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721037908; x=1721642708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXrhdNRq6oludJZnjz76rz84qmMewPWdtA9STQ5A9L0=;
 b=dqz1duvsdOj6MS0AILD/zksbz/RibSEq9PxIwboJcPWSGdtBj9HwAEzvddbJ75SExG
 uQxmwQec1Rtxao6rD0p1CSvKhOIRyXNZpyixfo2AyLyFmHiiL5LATLUVPYT+u7sCEO6y
 Zdb0MTQSQ0fbN9GckJJSoPD128+fJBqNZsAU4DubYliZCC1rY+tOPz9htLmBsEVxvlch
 IAy29YGDgKXHkNJcU8xgmjwfK5BFFDOygWAS0CH22AJSQ9XczG9R04ucngraAGGjdCyI
 k/kqu5KVvq3Kxcv+rFCRjEMrvDdRXds7iYgBY+oTeHwTCX+479MEUHwhfMvGmJg6OWgk
 odUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcIsJrKSxvyPiEJirkFcgh6x3TFExUtLPnYKCltnA+xFELJOTTXNMY+Nifbbfq+45oC+fshs/reN+BXW2KOrSvYIjM9yDVv3Gvbq0AS3OU
X-Gm-Message-State: AOJu0YzXFgcFG7BkJrcjBvU8jFSiU7r8j8Pg2qKKT0RMZqJygsIYCXEb
 Gt1wvMsH4bnKWfIPBIkVZ+S8y4EaQ9GC7h8Emp/nfEuT0rm3oXZuvLM3WeHGgqAdS6i0WaVWiRT
 86Elhr03S5yexWDYbTGVJ024A3ieAl9b4jyA=
X-Google-Smtp-Source: AGHT+IFR/iC1N3Tb8Jho/ZE42f1MzhOjhl0CAO4hiWmUByPiy1Zd0g36Ny/4VrjQlbpoVgWVwwAvv2WZBTBdvA7v3B4=
X-Received: by 2002:a05:6512:3b20:b0:52c:c9ce:be8d with SMTP id
 2adb3069b0e04-52eb99d6de0mr12891922e87.57.1721037907620; Mon, 15 Jul 2024
 03:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
 <CAJfuBxyxamRhOyz8WuL+7=eJkEKSw8jnAWjyAuqU2i7gvg-rsQ@mail.gmail.com>
 <CALwA+NbUCfEj_DzT5eMQ7_pSNpyp-zBe6PEL2XnMZrb303J4_Q@mail.gmail.com>
 <CAJfuBxzeYWWV1ikYagFpyFHdAQU4ReYPirksQFHbEzDxhXCfHA@mail.gmail.com>
In-Reply-To: <CAJfuBxzeYWWV1ikYagFpyFHdAQU4ReYPirksQFHbEzDxhXCfHA@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 15 Jul 2024 12:04:56 +0200
Message-ID: <CALwA+Naec_YHxHoKu8Ba_Bnuq2L3VXw1cT3=Tx3qC3mE5_BG1g@mail.gmail.com>
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

On Sat, Jul 13, 2024 at 11:45=E2=80=AFPM <jim.cromie@gmail.com> wrote:
>
> On Fri, Jul 12, 2024 at 9:44=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@chro=
mium.org> wrote:
> >
> > On Wed, Jul 3, 2024 at 12:14=E2=80=AFAM <jim.cromie@gmail.com> wrote:
> > >
> > > On Tue, Jul 2, 2024 at 4:01=E2=80=AFPM Luis Chamberlain <mcgrof@kerne=
l.org> wrote:
> > > >
> > > > On Tue, Jul 02, 2024 at 03:56:50PM -0600, Jim Cromie wrote:
> > > > > This fixes dynamic-debug support for DRM.debug, added via classma=
ps.
> > > > > commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
> > > > >
> > > > > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy was marked broken because drm.de=
bug=3Dval
> > > > > was applied when drm.ko was modprobed; too early for the yet-to-l=
oad
> > > > > drivers, which thus missed the enablement.  My testing with
> > > > > /etc/modprobe.d/ entries and modprobes with dyndbg=3D$querycmd op=
tions
> > > > > obscured this omission.
> > > > >
> > > > > The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP with
> > > > > DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for driv=
ers.
> > > > > The distinction allows dyndbg to also handle the users properly.
> > > > >
> > > > > DRM is the only current classmaps user, and is not really using i=
t,
> > > > > so if you think DRM could benefit from zero-off-cost debugs based=
 on
> > > > > static-keys, please test.
> > > > >
> > > > > HISTORY
> > > > >
> > > > > 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dynd=
bg parts
> > > > > 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 drm =
parts
> > > > >
> > > > > https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> > > > > greg k-h says:
> > > > > This should go through the drm tree now.  The rest probably shoul=
d also
> > > > > go that way and not through my tree as well.
> > > >
> > > > Can't this just be defined as a coccinelle smpl patch? Must easier
> > > > to read than 53 patches?
> > > >
> > >
> > > perhaps it could - Im not sure that would be easier to review
> > > than a file-scoped struct declaration or reference per driver
> > >
> > > Also, I did it hoping to solicit more Tested-by:s with drm.debug=3D0x=
1ff
> > >
> > > Jim
> > >
> >
> > Jim,
> >
> > When testing different combinations of Y/M for TEST_DYNAMIC_DEBUG and
> > TEST_DYNAMIC_DEBUG_SUBMOD in virtme-ng I spotted test failures:
> >
> > When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
> > TEST_MOD_SUBMOD selftests passed
> > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> > BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> > TEST_PERCENT_SPLITTING selftest fails with ": ./dyndbg_selftest.sh:270
> > check failed expected 1 on =3Dpf, got 0"
> > When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
> > BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> > TEST_PERCENT_SPLITTING selftest fails also with ":
> > ./dyndbg_selftest.sh:270 check failed expected 1 on =3Dpf, got 0"
> >
> > Have I missed something ?
> >
>
> I am not seeing those 2 failures on those 2 configs.
>
> most of my recent testing has been on x86-defconfig + minimals,
> built and run using/inside virtme-ng
>
> the last kernel I installed on this hw was june 16, I will repeat that,
> and report soon if I see the failure outside the vm
>
> I'll also send you my script, to maybe speed isolation of the differences=
.
>

Jim,

I know why I saw these failures.
I ran dyndbg_selftest.sh directly in thw directory
tools/testing/selftests/dynamic_debug/.

All works as expected when I run it from the top kernel directory.
Here are the results:

When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
TEST_MOD_SUBMOD selftests passed

When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were
skipped

When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were
skipped

Based on that maybe it would be worth it for the script to fail when
it doesn't find a .config with an error message something like this:
"Kernel .config not found. Are you running the script from the
kernel's top directory?"

What do you think ?

Thanks,
Lukasz

> > Thanks,
> > Lukasz
> >
> > > >   Luis
> > > >
