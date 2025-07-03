Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7CAF841C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 01:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0960510E910;
	Thu,  3 Jul 2025 23:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e7Ufdtga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590C10E910;
 Thu,  3 Jul 2025 23:24:03 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-32b78b5aa39so4188401fa.1; 
 Thu, 03 Jul 2025 16:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751585042; x=1752189842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtvbM0ZJbl7PRtVkId0uy2JLD6jAbUhYMSmm1BPeVlY=;
 b=e7Ufdtgal4pKlYBY5b2YuST16X1yTIX1JJEIHkMU3bHavS9D93nR0i3sy32f+VijmQ
 cMZVbjvlRHmO7Q2O6fch4Ijnk1tWCKnJFBAUkgERSYALqUVvVKoC/SnSqwSsnJhq6O2H
 xXQU/604L/KrKz97/Vfz6psySwmX2MmemZTNTDGLd9d6FAU+8czeDVL2RpQmUXKswbhx
 ucRidizPJ/93shN/bWpecFQy1BeJ6Fvdc0IQ9d9Op+8uCfUWoqnwhL/ws5KcODdnxLqX
 4wzDK61Oglfzi6Y4afqyxtvgZRA2f4PvWDTxI1hmZuboq7ZE9OpkMe821dOOiQ0QKAcM
 kthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751585042; x=1752189842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtvbM0ZJbl7PRtVkId0uy2JLD6jAbUhYMSmm1BPeVlY=;
 b=ILQmVqhccXWQxMa/ZsxgixxVggJNLJ+kh25/jPqPNB55hrxSg/enHwly2k4E8Gox8w
 /Z4+GvtF13fb9a3Sn09DCcaOAXm9YElarS0fIlT19VFpqS3IP04fpOPQd8NevDRAQ6u7
 c0Pul4ZaIILOdW2GRpJPyAzToRRasgbxxYe1kLeQsM4AHYhNOjBcUp9M6E6TnYTBA9Et
 d4c59UhpJTeqqTUy9p1LFjyWwesCQHBGmiGoLFOSPp8JqrbyaKiR82cAyGEFvD/iSfp1
 hCnRBZumBRgqOnc1B+z7pZ2b7MMyguYKsJ5kGMh+p4YZfYO9e0ZfIHdjPccR9LqOuTd3
 IJTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPwR5bJG/WBP/BB1Zmv/vQ+8PPvtTYocuLlJ4OPSW4CMmmHkmAuZ/btR2gI26KW0SvAQ+JXLO/qA==@lists.freedesktop.org,
 AJvYcCWOs2O2WAGclvk8/sD90hRfM28hLB1dzogsZ/yvoIWwcZJ0Iymt9v3upxdUASNIeRvomAVhUJ6l4uc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAJBN/GiQ1o4rd8VftXZlrvplJ6UBZ7EZDJGAC13KBSuPjXTEY
 OetK/OmEEQsrgKfZlVSgnhifBcU2x54n0Tv+JTc9NOyh9NIuDnnd+XOTWx/YNDHRQ+DDSXTc4pz
 G/8ITwEVOOGHAwYEwKgX4gCpr/XfnVpI=
X-Gm-Gg: ASbGnctdmoDp57mbeP8UL7GZkTb+Pj4O4Dw1a++PLvFBTq12r0bx3DzF9EfU1fIk6tn
 VhZSxkXpx4oBk2Co+5jT7K7xlMWRSa7THg+yAIe1WAn2T5fCv2gmccGqUDLblt6EZeZF/cVpGjE
 Tz7t9cA6WlB0HMBpbxEoNONNQ26jna6/XktF6I0jVCxMm9rTFaEqjHqhqkFCTypZZB8E18AENp4
 6ypCLOSvHcEEE94
X-Google-Smtp-Source: AGHT+IGEPG+g+OxH8rOfSaGvbFyeTmDB+1fQ7xPcfMGDOeGLeCcig+uAF9z9wcJ3Z5LOomVIJicrX6bQd17nnYWnOI4=
X-Received: by 2002:a05:651c:2155:b0:32a:604c:504e with SMTP id
 38308e7fff4ca-32e5f62cdfcmr641231fa.38.1751585041586; Thu, 03 Jul 2025
 16:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org>
 <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
In-Reply-To: <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 19:23:25 -0400
X-Gm-Features: Ac12FXySgZtzHdWG_UZyVlFR27yExYl4PiFasz3P6nXfOoJ_ZKfjtj833w6aTPo
Message-ID: <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

On Thu, Jul 3, 2025 at 6:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Thu, Jul 3, 2025 at 4:36=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
> >
> > On Thu Jul 3, 2025 at 8:55 PM CEST, Tamir Duberstein wrote:
> > > On Thu, Jul 3, 2025 at 11:08=E2=80=AFAM Benno Lossin <lossin@kernel.o=
rg> wrote:
> > >> On Thu Jul 3, 2025 at 3:55 PM CEST, Tamir Duberstein wrote:
> > >> > On Thu, Jul 3, 2025 at 5:32=E2=80=AFAM Benno Lossin <lossin@kernel=
.org> wrote:
> > >> >> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > >> >> > Introduce a `fmt!` macro which wraps all arguments in
> > >> >> > `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This=
 enables
> > >> >> > formatting of foreign types (like `core::ffi::CStr`) that do no=
t
> > >> >> > implement `core::fmt::Display` due to concerns around lossy con=
versions which
> > >> >> > do not apply in the kernel.
> > >> >> >
> > >> >> > Replace all direct calls to `format_args!` with `fmt!`.
> > >> >> >
> > >> >> > Replace all implementations of `core::fmt::Display` with implem=
entations
> > >> >> > of `kernel::fmt::Display`.
> > >> >> >
> > >> >> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > >> >> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/2880=
89-General/topic/Custom.20formatting/with/516476467
> > >> >> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> >> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > >> >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > >> >> > ---
> > >> >> >  drivers/block/rnull.rs       |  2 +-
> > >> >> >  drivers/gpu/nova-core/gpu.rs |  4 +-
> > >> >> >  rust/kernel/block/mq.rs      |  2 +-
> > >> >> >  rust/kernel/device.rs        |  2 +-
> > >> >> >  rust/kernel/fmt.rs           | 89 ++++++++++++++++++++++++++++=
+++++++++++
> > >> >> >  rust/kernel/kunit.rs         |  6 +--
> > >> >> >  rust/kernel/lib.rs           |  1 +
> > >> >> >  rust/kernel/prelude.rs       |  3 +-
> > >> >> >  rust/kernel/print.rs         |  4 +-
> > >> >> >  rust/kernel/seq_file.rs      |  2 +-
> > >> >> >  rust/kernel/str.rs           | 22 ++++------
> > >> >> >  rust/macros/fmt.rs           | 99 ++++++++++++++++++++++++++++=
++++++++++++++++
> > >> >> >  rust/macros/lib.rs           | 19 +++++++++
> > >> >> >  rust/macros/quote.rs         |  7 ++++
> > >> >> >  scripts/rustdoc_test_gen.rs  |  2 +-
> > >> >> >  15 files changed, 236 insertions(+), 28 deletions(-)
> > >> >>
> > >> >> This would be a lot easier to review if he proc-macro and the cal=
l
> > >> >> replacement were different patches.
> > >> >>
> > >> >> Also the `kernel/fmt.rs` file should be a different commit.
> > >> >
> > >> > Can you help me understand why? The changes you ask to be separate=
d
> > >> > would all be in different files, so why would separate commits mak=
e it
> > >> > easier to review?
> > >>
> > >> It takes less time to go through the entire patch and give a RB. I c=
an
> > >> take smaller time chunks and don't have to get back into the entire
> > >> context of the patch when I don't have 30-60min available.
> > >
> > > Ah, I see what you mean. Yeah, the requirement to RB the entire patch
> > > does mean there's a benefit to smaller patches.
> > >
> > >> In this patch the biggest problem is the rename & addition of new
> > >> things, maybe just adding 200 lines in those files could be okay to =
go
> > >> together, see below for more.
> > >
> > > After implementing your suggestion of re-exporting things from
> > > `kernel::fmt` the diffstat is
> > >
> > > 26 files changed, 253 insertions(+), 51 deletions(-)
> > >
> > > so I guess I could do all the additions in one patch, but then
> > > *everything* else has to go in a single patch together because the
> > > formatting macros either want core::fmt::Display or
> > > kernel::fmt::Display; they can't work in a halfway state.
> >
> > I don't understand, can't you just do:
> >
> > * add `rust/kernel/fmt.rs`,
> > * add `rust/macros/fmt.rs`,
> > * change all occurrences of `core::fmt` to `kernel::fmt` and
> >   `format_args!` to `fmt!`.
>
> Yes, such a split could be done - I will do so in the next spin
>
>
> > The last one could be split by subsystem, no? Some subsystems might
> > interact and thus need simultaneous splitting, but there should be some
> > independent ones.
>
> Yes, it probably can. As you say, some subsystems might interact - the
> claimed benefit of doing this subsystem-by-subsystem split is that it
> avoids conflicts with ongoing work that will conflict with a large
> patch, but this is also the downside; if ongoing work changes the set
> of interactions between subsystems then a maintainer may find
> themselves unable to emit the log message they want (because one
> subsystem is using kernel::fmt while another is still on core::fmt).

I gave this a try. I ran into the problem that `format_args!` (and,
after this patch, `fmt!`) is at the center of `print_macro!`, which
itself underpins various other formatting macros. This means we'd have
to bifurcate the formatting infrastructure to support an incremental
migration. That's quite a bit of code, and likely quite a mess in the
resulting git history -- and that's setting aside the toil required to
figure out the correct combinations of subsystems that must migrate
together.
