Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE8DBA73FB
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 17:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD5D10E394;
	Sun, 28 Sep 2025 15:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bBAJR97m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DB410E394
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 15:27:09 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cZSqF37fJz9t3Y;
 Sun, 28 Sep 2025 17:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1759073225; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nmhv7A3lyTjWqIVVgYCGAAd2pGrvYRt3+awW+o7oyxs=;
 b=bBAJR97mXoUjiV3IoPCTj+QDX5y6DZZ1tOG1uZ1CEeDmYJZjI8j85wGal+qJLXURF871O3
 Rzqvnk4F4SJ+VYCTr76DZ/BTVy25KVYikCxlCwvOTSpvo2FWz+gQbO8jg8SpC1J9pzadiO
 HM1t4ZtTc5DqvKhpN01ovym9idwr0JI6h2r630xPtntGAd4Pw0/YM4IJr1EgoAyZDKsaKj
 9Yo59kRh9WR0mZ7JoNc9shgvGmb9OHZaNb31AVobP5rwgun8wqcToDA3+PPH2+5P1LVpfa
 NAvGDXMtYwAx1fvGhX95jTqDBBcyrNSY9IBEAUGSBmN3J9Oj2XH41Lj0YjS2/w==
Message-ID: <63b1274d05f9ad307f29dd0276f0f3014235225e.camel@mailbox.org>
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Boqun Feng <boqun.feng@gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Viresh Kumar
 <viresh.kumar@linaro.org>, Asahi Lina <lina+kernel@asahilina.net>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, FUJITA
 Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>, Lyude Paul <lyude@redhat.com>, Mitchell Levy
 <levymitchell0@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Date: Sun, 28 Sep 2025 17:26:37 +0200
In-Reply-To: <5873bc43-1d60-419a-9c5b-e623fc5e9c47@amd.com>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
 <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
 <5873bc43-1d60-419a-9c5b-e623fc5e9c47@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 6rgqmwnpiz1ea7m3jqm8xp65b3691oez
X-MBO-RS-ID: a59fc13fb5a4a1cd8eb
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

On Sun, 2025-09-28 at 16:34 +0200, Christian K=C3=B6nig wrote:
> On 27.09.25 11:01, Philipp Stanner wrote:
> > On Fri, 2025-09-26 at 09:10 -0700, Boqun Feng wrote:
> > > On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
> > > > dma_fence is a synchronization mechanism which is needed by virtual=
ly
> > > > all GPU drivers.
> > > >=20
> > > > A dma_fence offers many features, among which the most important on=
es
> > > > are registering callbacks (for example to kick off a work item) whi=
ch
> > > > get executed once a fence gets signalled.
> > > >=20
> > > > dma_fence has a number of callbacks. Only the two most basic ones
> > > > (get_driver_name(), get_timeline_name() are abstracted since they a=
re
> > > > enough to enable the basic functionality.
> > > >=20
> > > > Callbacks in Rust are registered by passing driver data which imple=
ments
> > > > the Rust callback trait, whose function will be called by the C bac=
kend.
> > > >=20
> > > > dma_fence's are always refcounted, so implement AlwaysRefcounted fo=
r
> > > > them. Once a reference drops to zero, the C backend calls a release
> > > > function, where we implement drop_in_place() to conveniently marry =
that
> > > > C-cleanup mechanism with Rust's ownership concepts.
> > > >=20
> > > > This patch provides basic functionality, but is still missing:
> > > > =C2=A0 - An implementation of PinInit<T, Error> for all driver data=
.
> > > > =C2=A0 - A clever implementation for working dma_fence_begin_signal=
ling()
> > > > =C2=A0=C2=A0=C2=A0 guards. See the corresponding TODO in the code.
> > > > =C2=A0 - Additional useful helper functions such as dma_fence_is_si=
gnaled().
> > > > =C2=A0=C2=A0=C2=A0 These _should_ be relatively trivial to implemen=
t, though.
> > > >=20
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > So. =C2=A1Hola!
> > > >=20
> > > > This is a highly WIP RFC. It's obviously at many places not yet
> > > > conforming very well to Rust's standards.
> > > >=20
> > > > Nevertheless, it has progressed enough that I want to request comme=
nts
> > > > from the community.
> > > >=20
> > > > There are a number of TODOs in the code to which I need input.
> > > >=20
> > > > Notably, it seems (half-)illegal to use a shared static reference t=
o an
> > > > Atomic, which I currently use for the dma_fence unit test / docstri=
ng
> > > > test. I'm willing to rework that if someone suggests how.
> > > > (Still, shouldn't changing a global Atomic always be legal? It can =
race,
> > > > of course. But that's kind of the point of an atomic)
> > > >=20
> > > > What I want comments on the most is the design of the callbacks. I =
think
> > > > it's a great opportunity to provide Rust drivers with rust-only
> > > > callbacks, so that they don't have to bother about the C functions.
> > > >=20
> > > > dma_fence wise, only the most basic callbacks currently get impleme=
nted.
> > > > For Nova, AFAICS, we don't need much more than signalling fences an=
d
> > > > registering callbacks.
> > > >=20
> > > >=20
> > > > Another, solvable, issue I'm having is designing the
> > > > dma_fence_begin_signallin() abstractions. There are TODOs about tha=
t in
> > > > the code. That should ideally be robust and not racy. So we might w=
ant
> > > > some sort of synchronized (locked?) way for using that abstraction.
> > > >=20
> > > >=20
> > > > Regarding the manually created spinlock of mine: I so far never nee=
d
> > > > that spinlock anywhere in Rust and wasn't sure what's then the best=
 way
> > > > to pass a "raw" spinlock to C.
> > > >=20
> > > >=20
> > > > So much from my side. Hope to hear from you.
> > > >=20
> > > > (I've compiled and tested this with the unit test on the current -r=
c3)
> > > >=20
> > > > Philipp
> > > > ---
> > > > =C2=A0rust/bindings/bindings_helper.h |=C2=A0=C2=A0 1 +
> > > > =C2=A0rust/helpers/dma_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 23 ++
> > > > =C2=A0rust/helpers/helpers.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > =C2=A0rust/helpers/spinlock.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> > > > =C2=A0rust/kernel/sync.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > =C2=A0rust/kernel/sync/dma_fence.rs=C2=A0=C2=A0 | 388 +++++++++++++=
+++++++++++++++++++
> > >=20
> > > I missed this part, and I don't think kernel::sync is where dma_fence
> > > should be, as kernel::sync is mostly for the basic synchronization
> > > between threads/irqs. dma_fence is probably better to be grouped with
> > > dma-buf and other dma related primitives. Maybe in kernel::dma? Like:
> > >=20
> > > rust/kernel/dma.rs
> > > rust/kernel/dma/dma_buf.rs
> > > rust/kernel/dma/dma_fence.rs
> > >=20
> > > Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?
> >=20
> > @Christian K=C3=B6nig's opinion would be valuable, too.
>=20
> Oh yes, please don't mix dma_fences into SW synchronization, it's a HW sy=
nchronization primitive.

So do you agree that it should be regarded as a part of DMA_BUF?

>=20
> > I'm not super convinced of that because dma_fence has not really much
> > to do with DMA. They're not very different from completions and are a
> > mechanism to synchronize consumers and producers.
>=20
> That we mixed up fences and completion events caused a lot of trouble in =
the past.
>=20
> It's astonishing how often Sima and I had to reject peoples ideas to use =
the dma_fence as SW sync.
>=20
> > Actually, before f54d1867005c3 they were just called "fence" and then
> > renamed to "dma_fence" because someone wanted that name.
>=20
> That was also partially done to make sure that people understand that thi=
s is not for inter SW sync.
>=20
> On the other hand the rename didn't helped much :/

gpu_fence might have been appropriate?


Gr=C3=BC=C3=9Fe
P.


>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > Anyways, I don't have strong objections and mostly care about having
> > them available somewhere.
> >=20
> > P.
> >=20
> > >=20
> > > Regards,
> > > Boqun
> > >=20
> > > > =C2=A06 files changed, 420 insertions(+)
> > > > =C2=A0create mode 100644 rust/helpers/dma_fence.c
> > > > =C2=A0create mode 100644 rust/kernel/sync/dma_fence.rs
> > > >=20
> > > [...]
> >=20
>=20

