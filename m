Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E493B166
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D658810E6B8;
	Wed, 24 Jul 2024 13:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tescu/Zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F8710E6B8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 13:15:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B97060AC7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 13:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E48BC4AF09
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721826953;
 bh=+LdJ/ZWwutI+/NpdXPE5DllppVaQ6tXAdOOwXolY8Ag=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Tescu/ZiOWWumgH98ifgyE0x6qOlQgn7mud0YPoNuqPzO0Yp5muFyOZ9521raDE6a
 ANFYX4zjjyi6slLr4iyvcnr72rVe2SG5knGXbY+Wti8fWezCEE1z/7iXcBomGwqDS0
 w+AbgNkBiEzSzvWXbeJofF9bbKZtMYjF4Y9KGfddAfJpTXRNCYbf8C9IOww1aTXp+m
 ZRyhbiudUcMJi4d2jjkUB70tAieZiDIed0qdFScm8RAv1nw5nXyJU0nzCofbsQ3U6U
 DHtgwY8Osgd/2aq/VMde1pmC1+VuWaaYQnxcqdAr16Xy2VMZQ/VPe+oU3wbWRJG2IH
 dEoniGbpk948Q==
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso3516810e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 06:15:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ljrq6ZJDhUBqK89WeRTopz1CvYHjTn5Ijv3xyP9+j45gmCbVxxrC8DxzjGDsFOOCbxKec1C+Pq77BUZ/P1ToePP1u/4oc5uYSnzSGHWr
X-Gm-Message-State: AOJu0YyXZDS4xssVzbqkb627qDIS26T0p6b7pCoJ6ozsOrUfDCh3PWyr
 uImcX64yzJD8X2ITLPOQRyY66t1xTkv0ElRnl3a8rU4RV4Un7gRdnWwj0NXvIadjycaKEz1GjoR
 2/tVZMl2NrsGVtlicCdizhHhMuw==
X-Google-Smtp-Source: AGHT+IHklvdgAE7fHJDhbcDGbN3AdRO/07//YyH7VuK1FMgSqyrLmRnJjgV6j60b/4hIS183Gh1b4p+IP9u/dN52GhY=
X-Received: by 2002:ac2:4c42:0:b0:52c:ec5d:b18b with SMTP id
 2adb3069b0e04-52fcf010221mr1772724e87.24.1721826951587; Wed, 24 Jul 2024
 06:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
In-Reply-To: <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jul 2024 08:15:38 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
Message-ID: <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org, 
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, lina@asahilina.net,
 mcanal@igalia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 24, 2024 at 3:59=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> Hi Boris,
>
> On 23/07/2024 17:06, Boris Brezillon wrote:
> > Hi Steve,
> >
> > On Mon, 15 Jul 2024 10:12:16 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >
> >> I note it also shows that the "panthor_regs.rs" would ideally be share=
d.
> >> For arm64 we have been moving to generating system register descriptio=
ns
> >> from a text source (see arch/arm64/tools/sysreg) - I'm wondering wheth=
er
> >> something similar is needed for Panthor to generate both C and Rust
> >> headers? Although perhaps that's overkill, sysregs are certainly
> >> somewhat more complex.
> >
> > Just had a long discussion with Daniel regarding this panthor_regs.rs
> > auto-generation, and, while I agree this is something we'd rather do if
> > we intend to maintain the C and rust code base forever, I'm not
> > entirely convinced this is super useful here because:
>
> So I think we need some more alignment on how the 'Rustification'
> (oxidation?) of the driver is going to happen.
>
> My understanding was that the intention was to effectively start a
> completely separate driver (I call it "Rustthor" here) with the view
> that it would eventually replace (the C) Panthor. Rustthor would be
> written by taking the C driver and incrementally converting parts to
> Rust, but as a separate code base so that 'global' refactoring can be
> done when necessary without risking the stability of Panthor. Then once
> Rustthor is feature complete the Panthor driver can be dropped.
> Obviously we'd keep the UABI the same to avoid user space having to care.

We did discuss this, but I've come to the conclusion that's the wrong
approach. Converting is going to need to track kernel closely as there
are lots of dependencies with the various rust abstractions needed. If
we just copy over the C driver, that's an invitation to diverge and
accumulate technical debt. The advice to upstreaming things is never
go work on a fork for a couple of years and come back with a huge pile
of code to upstream. I don't think this situation is any different. If
there's a path to do it in small pieces, we should take it.

What parts of the current driver are optional that we could leave out?
Perhaps devfreq and any power mgt. That's not much, so I think the
rust implementation (complete or partial) will always be feature
complete.

> I may have got the wrong impression - and I'm certainly not saying the
> above is how we have to do it. But I think we need to go into it with
> open-eyes if we're proposing a creeping Rust implementation upstream of
> the main Mali driver. That approach will make ensuring stability harder
> and will make the bar for implementing large refactors higher (we'd need
> significantly more review and testing for each change to ensure there
> are no regressions).

This sounds to me like the old argument for products running ancient
kernels. Don't change anything so it is 'stable' and doesn't regress.
I think it's a question of when, not if we're going to upstream the
partially converted driver. Pretty much the only reason I see to wait
(ignoring dependencies) is not technical, but the concerns with
markets/environments that can't/won't adopt Rust yet. That's probably
the biggest issue with this patch. If converting the main driver first
is a requirement (as discussed elsewhere in this thread), I think all
the dependencies are going to take some time to upstream, so it's not
something we have to decide anytime soon.

Speaking of converting the main driver, here's what I've got so far
doing that[1]. It's a top down conversion with the driver model and
DRM registration in Rust. All the ioctls are rust wrappers calling
into driver C code. It's compiling without the top commit.

> > 1. the C code base is meant to be entirely replaced by a rust driver.
> > Of course, that's not going to happen overnight, so maybe it'd be worth
> > having this autogen script but...
>
> Just to put my cards on the table. I'm not completely convinced a Rust
> driver is necessarily an improvement, and I saw this as more of an
> experiment - let's see what a Rust driver looks like and then we can
> decide which is preferable. I'd like to be "proved wrong" and be shown a
> Rust driver which is much cleaner and easier to work with, but I still
> need convincing ;)

Unless your Rust is as good as your C, that's never going to happen.

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=
=3Drust/panthor-6.10
