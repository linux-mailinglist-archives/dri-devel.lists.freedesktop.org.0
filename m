Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47BBA301D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B8010E2FD;
	Fri, 26 Sep 2025 08:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oewmB4a8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0406910E2FD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:48:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cY44243YHz9st3;
 Fri, 26 Sep 2025 10:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758876498; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7De3nQZm4PVTdWyp59mYSwiaxDz6Qyhn9LYb89sbxxg=;
 b=oewmB4a8fvEjTKbGN/DAs/n7MBgg9RL9DiXgxDoYuwrY9a6lV0LDNw6hF3+0nR9hXA+6je
 cIvS2p05i6RvXBKFYs0lbZSaRNAiwuQXBdDzYQieJtLK+G1hVZSc3mwBekxUfjGsAKc/gO
 gBYbiN5IhJjZcx1BHnbtZxChkf6rG6VfoNmz6YgzIRPRLnSG1GWtzolVcvfeBNxEtLmEti
 bAwIebXzzwxtIljpNiA/zhyDL+Kmghl8qlMpO+SdCd0Jej/4NjaEV1wOo8kXJ8a8CXBDMw
 aozeNUa8SAm0VHmRzk/Rom5JKxPnlq/MGxCrCSGKG4mk64KC5xilz9uhtTqPBg==
Message-ID: <12c09de235023c99a8a864b17b2f797c7339bb7b.camel@mailbox.org>
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Boqun Feng <boqun.feng@gmail.com>, Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>,  Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Viresh Kumar
 <viresh.kumar@linaro.org>, Asahi Lina <lina+kernel@asahilina.net>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, FUJITA
 Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>, Lyude Paul <lyude@redhat.com>, Mitchell Levy
 <levymitchell0@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Date: Fri, 26 Sep 2025 10:48:06 +0200
In-Reply-To: <aMwOoYe1xGDBg0Zv@tardis-2.local>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aMwOoYe1xGDBg0Zv@tardis-2.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: dcc294d54bd9f90528a
X-MBO-RS-META: c53m4ic87syjzwty5tfmxisedsq4b4ff
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-09-18 at 15:52 +0200, Boqun Feng wrote:
> On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
> [...]
> > ---
> > So. =C2=A1Hola!
> >=20
> > This is a highly WIP RFC. It's obviously at many places not yet
> > conforming very well to Rust's standards.
> >=20
> > Nevertheless, it has progressed enough that I want to request comments
> > from the community.
> >=20
> > There are a number of TODOs in the code to which I need input.
> >=20
> > Notably, it seems (half-)illegal to use a shared static reference to an
> > Atomic, which I currently use for the dma_fence unit test / docstring
>=20
> The `CHECKER` static you mean? If so, it should be a `static CHECKER`
> instead of `static mut CHECKER`, also for future versions please use
> LKMM (Linux Kernel Memory Model) atomics [1] instead of Rust native
> atomics (you probably need to define `CHECKER` as `Atomic<i32>` because
> AtomicBool is not supported by LKMM and potentially sub-optimial in some
> cases).

Thanks.

Thinking about it I realized that for that example code I don't even
need atomics. So I'll drop them for now.

>=20
> > test. I'm willing to rework that if someone suggests how.
> > (Still, shouldn't changing a global Atomic always be legal? It can race=
,
> > of course. But that's kind of the point of an atomic)
> >=20
> > What I want comments on the most is the design of the callbacks. I thin=
k
> > it's a great opportunity to provide Rust drivers with rust-only
> > callbacks, so that they don't have to bother about the C functions.
> >=20
> > dma_fence wise, only the most basic callbacks currently get implemented=
.
> > For Nova, AFAICS, we don't need much more than signalling fences and
> > registering callbacks.
> >=20
> >=20
> > Another, solvable, issue I'm having is designing the
> > dma_fence_begin_signallin() abstractions. There are TODOs about that in
> > the code. That should ideally be robust and not racy. So we might want
> > some sort of synchronized (locked?) way for using that abstraction.
> >=20
> >=20
> > Regarding the manually created spinlock of mine: I so far never need
> > that spinlock anywhere in Rust and wasn't sure what's then the best way
> > to pass a "raw" spinlock to C.
> >=20
>=20
> You can use `SpinLock<()>` for this purpose, no need to add new
> bindings.

The dma_fence C backend needs a spinlock pointer, given to it by the
driver (so Rust code).

How do I pass a SpinLock<()> to a C function? AFAICS SpinLock doesn't
implement as_raw(), so I'd have to implement it, wouldn't I?

Or rather, as it looks, I'd have to implement it for SpinLockBackend?


P.

>=20
> [1]: https://lore.kernel.org/rust-for-linux/20250905044141.77868-1-boqun.=
feng@gmail.com/
>=20
> Regards,
> Boqun
>=20
> >=20
> > So much from my side. Hope to hear from you.
> >=20
> > (I've compiled and tested this with the unit test on the current -rc3)
> >=20
> > Philipp
> > ---
> [...]

