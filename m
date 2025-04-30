Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2BAA5383
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 20:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520D310E10B;
	Wed, 30 Apr 2025 18:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FBN/ePs+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB7110E10B;
 Wed, 30 Apr 2025 18:16:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0CF8E68495;
 Wed, 30 Apr 2025 18:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBA3C4CEE7;
 Wed, 30 Apr 2025 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746036989;
 bh=u+gLd6Cauqg83Q7vPE135p/3fXtheyIdEV1XMt+xhxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FBN/ePs+8ER1bxqKoTN23OCJ/q3dk2qoAgx0OTRaleborkhSxY1sSuVm2cmc9VNEw
 mXY1MtXfvQFxFkXuL1L2sQwnqTBXYRIrl28i1Uv7Wbv3um5MKxKKNmXt5P58dBlAHh
 /wjQsFpIGVVBUoghUOu2f1OqS1HQwGjQkOT64acXoUP4bAKB2zw/1IdskFvnw4kzVD
 lkO8aNbPKupRQYD5wo94L5fjBGIBmTNm9LDAV0nygZendKx6DV4QnVrelLXUbVEPWr
 xxJoqx+PWyI2Yk2IseALagcqoAgboZ7+xUFTppeZ/uOuEjtA7TFHQ0T0gzjSpveGjC
 rh1J67l04Imjg==
Date: Wed, 30 Apr 2025 20:16:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <aBJo9qNDn8xDEwlk@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae>
 <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
 <9977ad2e-ce2d-48b5-a222-f74a821abfeb@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9977ad2e-ce2d-48b5-a222-f74a821abfeb@nvidia.com>
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

On Wed, Apr 30, 2025 at 10:38:11AM -0400, Joel Fernandes wrote:
> On 4/30/2025 9:25 AM, Alexandre Courbot wrote:
> > On Tue Apr 22, 2025 at 11:44 PM JST, Danilo Krummrich wrote:
> 
> >>> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
> >>> +///
> >>> +/// We use this function and a heap-allocated trait object instead of statically defined trait
> >>> +/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
> >>> +/// requested HAL.
> >>
> >> Do we really need the dynamic dispatch? AFAICS, there's only E::BASE that is
> >> relevant to FalconHal impls?
> >>
> >> Can't we do something like I do in the following example [1]?
> >>
> >> [1] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=bf7035a07e79a4047fb6834eac03a9f2
> > 
> > So are you have noticed there are two dimensions from which the falcons
> > can be instantiated:
> > 
> > - The engine, which determines its register BASE,
> > - The HAL, which is determined by the chipset.
> > 
> > For the engine, I want to keep things static for the main reason that if
> > BASE was dynamic, we would have to do all our IO using
> > try_read()/try_write() and check for an out-of-bounds error at each
> > register access. The cost of monomorphization is limited as there are
> > only a handful of engines.
> > 
> > But the HAL introduces a second dimension to this, and if we support N
> > engines then the amount of monomorphized code would then increase by N
> > for each new HAL we add. Chipsets are released at a good cadence, so
> > this is the dimension that risks growing the most.

I agree, avoiding the dynamic dispatch is probably not worth in this case
considering the long term. However, I wanted to point out an alternative with
[2].

> > It is also the one that makes use of methods to abstract things (vs.
> > fixed parameters), so it is a natural candidate for using virtual
> > methods. I am not a fan of having ever-growing boilerplate match
> > statements for each method that needs to be abstracted, especially since
> > this is that virtual methods do without requiring extra code, and for a
> > runtime penalty that is completely negligible in our context and IMHO
> > completely balanced by the smaller binary size that results from their
> > use.
>
> Adding to what Alex said, note that the runtime cost is still there even without
> using dyn. Because at runtime, the match conditionals need to route function
> calls to the right place.

Honestly, I don't know how dynamic dispatch scales compared to static dispatch
with conditionals.

OOC, I briefly looked for a benchmark and found [3], which doesn't look
unreasonable at a first glance.

I modified it real quick to have more than 2 actions. [4]

2 Actions
---------
Dynamic Dispatch: time:   [2.0679 ns 2.0825 ns 2.0945 ns]
 Static Dispatch: time:   [850.29 ps 851.05 ps 852.36 ps]

20 Actions
----------
Dynamic Dispatch: time:   [21.368 ns 21.827 ns 22.284 ns]
 Static Dispatch: time:   [1.3623 ns 1.3703 ns 1.3793 ns]

100 Actions
-----------
Dynamic Dispatch: time:   [103.72 ns 104.33 ns 105.13 ns]
 Static Dispatch: time:   [4.5905 ns 4.6311 ns 4.6775 ns]

Absolutely take it with a grain of salt, I neither spend a lot of brain power
nor time on this, which usually is not a great combination with benchmarking
things. :)

However, I think it's probably not too important here. Hence, feel free to go
with dynamic dispatch for this.

> I am just not seeing the benefits of not using dyn for
> this use case and only drawbacks. IMHO, we should try to not be doing the
> compiler's job.
> 
> Maybe the only benefit is you don't need an Arc or Kbox wrapper?

That's not a huge concern for me, it's only one single allocation per Engine,
correct?

[2] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=99ce0f12542488f78e35356c99a1e23f
[3] https://github.com/tailcallhq/rust-benchmarks
[4] https://pastebin.com/k0PqtQnq
