Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64502BA5BBE
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 11:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE4210E36F;
	Sat, 27 Sep 2025 09:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HaDqZxRs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45DF10E36F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 09:01:51 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cYhK84ZjGz9svD;
 Sat, 27 Sep 2025 11:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758963708; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6dMzxmUsCPkVpnZwfIAz+BTqenxeQnJX0cDJbhkkc8=;
 b=HaDqZxRs7cCTUmSiy9RO+8saBbGSlcVQV7nk5gvZGyLfz3YSdY3WjdV+OpAqjtWXrGh3hu
 XdRKIo218o8Vv5/bBcJfYojCCttx2Oa7VV8sd3ZfqDi3d89/FG59ARrhQHC6Xpyms7O5iC
 JJV2SxRcJTjPj1PQ1Z391UUp+EDPix55jjfr3Kp1owvY+2jH5M9Sym1Ka3hKV9XTxb1Wgp
 4R6La9PA+7gdKxw2YmYlSELIkRHdahxXB8CniKWLq3g6AqpSClg+cnc23RKSmctsRR6T14
 hhxP91b6vje+LLbG42D8EpZiKz9Jqosc8bBiQVUyQL6HuOnHh/L1Bod06qr+pw==
Message-ID: <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
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
Date: Sat, 27 Sep 2025 11:01:38 +0200
In-Reply-To: <aNa7BDpKS2KA__4M@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 1ubho5oa9dpzptjdu7eqkp4bqikqpmed
X-MBO-RS-ID: ecfc66f5dfc11acbca0
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

On Fri, 2025-09-26 at 09:10 -0700, Boqun Feng wrote:
> On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
> > dma_fence is a synchronization mechanism which is needed by virtually
> > all GPU drivers.
> >=20
> > A dma_fence offers many features, among which the most important ones
> > are registering callbacks (for example to kick off a work item) which
> > get executed once a fence gets signalled.
> >=20
> > dma_fence has a number of callbacks. Only the two most basic ones
> > (get_driver_name(), get_timeline_name() are abstracted since they are
> > enough to enable the basic functionality.
> >=20
> > Callbacks in Rust are registered by passing driver data which implement=
s
> > the Rust callback trait, whose function will be called by the C backend=
.
> >=20
> > dma_fence's are always refcounted, so implement AlwaysRefcounted for
> > them. Once a reference drops to zero, the C backend calls a release
> > function, where we implement drop_in_place() to conveniently marry that
> > C-cleanup mechanism with Rust's ownership concepts.
> >=20
> > This patch provides basic functionality, but is still missing:
> > =C2=A0 - An implementation of PinInit<T, Error> for all driver data.
> > =C2=A0 - A clever implementation for working dma_fence_begin_signalling=
()
> > =C2=A0=C2=A0=C2=A0 guards. See the corresponding TODO in the code.
> > =C2=A0 - Additional useful helper functions such as dma_fence_is_signal=
ed().
> > =C2=A0=C2=A0=C2=A0 These _should_ be relatively trivial to implement, t=
hough.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
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
> >=20
> > So much from my side. Hope to hear from you.
> >=20
> > (I've compiled and tested this with the unit test on the current -rc3)
> >=20
> > Philipp
> > ---
> > =C2=A0rust/bindings/bindings_helper.h |=C2=A0=C2=A0 1 +
> > =C2=A0rust/helpers/dma_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 23 ++
> > =C2=A0rust/helpers/helpers.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0rust/helpers/spinlock.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 5 +
> > =C2=A0rust/kernel/sync.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0rust/kernel/sync/dma_fence.rs=C2=A0=C2=A0 | 388 +++++++++++++++++=
+++++++++++++++
>=20
> I missed this part, and I don't think kernel::sync is where dma_fence
> should be, as kernel::sync is mostly for the basic synchronization
> between threads/irqs. dma_fence is probably better to be grouped with
> dma-buf and other dma related primitives. Maybe in kernel::dma? Like:
>=20
> rust/kernel/dma.rs
> rust/kernel/dma/dma_buf.rs
> rust/kernel/dma/dma_fence.rs
>=20
> Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?

@Christian K=C3=B6nig's opinion would be valuable, too.

I'm not super convinced of that because dma_fence has not really much
to do with DMA. They're not very different from completions and are a
mechanism to synchronize consumers and producers.

Actually, before f54d1867005c3 they were just called "fence" and then
renamed to "dma_fence" because someone wanted that name.


Anyways, I don't have strong objections and mostly care about having
them available somewhere.

P.

>=20
> Regards,
> Boqun
>=20
> > =C2=A06 files changed, 420 insertions(+)
> > =C2=A0create mode 100644 rust/helpers/dma_fence.c
> > =C2=A0create mode 100644 rust/kernel/sync/dma_fence.rs
> >=20
> [...]

