Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7DB562D5
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 21:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031EB10E104;
	Sat, 13 Sep 2025 19:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WvA3AjKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19F010E0D3;
 Sat, 13 Sep 2025 19:53:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D2893601B6;
 Sat, 13 Sep 2025 19:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB26C4CEEB;
 Sat, 13 Sep 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757793202;
 bh=h8N95CyM3XlShL5mBm/W2Xii5o6YkYMuBuMVBYeehFo=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=WvA3AjKn7l6aiUov0i1/zk+7amQZkRrc9H3OKEXOJAgD2ff18K92K8xSMij8/U0Bt
 bNSl3kzK0JMyHoTmelhR3EDcOMdjg4CFuhXkq2RH1m9GyJ27jpNOoRhvk22LAMjUM7
 DlOt2j4mkgFCq6nHphl8e3Xm6i4TF2UOHvWZb7UlSHXiMNnb1G7YJ7xIIKqv0IWTL7
 40D+02JYIK35HbeSRzPLoF1eGZqYgVO0DjAQOkDfqMEZROW+iut5VPByjL5n1T+h0b
 rJby8tdHGtAGbxA3HVr8mNiTCinJatVG6eUh2HpEUFdcI4rJdRPo+oRgcKKH+DibJZ
 WLyRcQcJQSa8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Sep 2025 21:53:16 +0200
Message-Id: <DCRXOMQN3Z20.2JCNP4BDEE79T@kernel.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
In-Reply-To: <20250913171357.GA1551194@joelbox2>
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

On Sat Sep 13, 2025 at 7:13 PM CEST, Joel Fernandes wrote:
> On Sat, Sep 13, 2025 at 03:30:31PM +0200, Danilo Krummrich wrote:
>> On Sat Sep 13, 2025 at 3:02 AM CEST, Joel Fernandes wrote:
>> > Any chance we can initialize the locks later? We don't need locking un=
til
>> > after the boot process is completed, and if there's a way we can dynam=
ically
>> > "pin", where we hypothetically pin after the boot process completed, t=
hat
>> > might also work. Though I am not sure if that's something possible in
>> > Rust/rust4linux or if it makes sense.
>>=20
>> We can't partially initialize structures and then rely on accessing init=
ialized
>> data only.
>
> Yet, that is exactly what the pin initialization sequence block does? The
> whole structure is not initialized yet you need access to already initial=
ized
> fields.

No, having a reference to a partially initialized structure is UB. But of c=
ourse
you can have a reference to already initialized fields within a not yet ful=
ly
initialized structure.

>> This is one of the sources for memory bugs that Rust tries to solve.
>> You can wrap fields into Option types and initialize them later, which w=
ould
>> defer pin-init calls for the price of having Option fields around.
>
> I am not denying the need for pinning. Also regarding Option, just thinki=
ng
> out loud but if something is optional temporary, maybe needing a new type
> like TempOption, and promote it to a non-option type later, I am not seei=
ng
> that as completely outside the world, if there is a legitimate usecase th=
at
> needs to be Option temporarily, but not later, what's wrong with that? It=
 is
> "Optional" for the timebeing, but not later.

That's what MaybeUninit<T> from the core library already does and promoting=
 it
to T is fundamentally unsafe for obvious reasons.

Drivers should never use that. Having partially initialized structures is a
horrible anti-pattern that we see too often in C code (only for convinience
reasons) causing real memory bugs.

If you run into a case where you want this, 99% of the time you have a desi=
gn
issue that you should fix instead.

>> However, we should never do such things. If there's the necessity to do
>> something like that, it indicates a design issue.
>>=20
>> In this case, there's no problem, we can use pin-init without any issues=
 right
>> away, and should do so.
>>=20
>> pin-init is going to be an essential part of *every* Rust driver given t=
hat a
>> lot of the C infrastruture that we abstract requires pinned initializati=
on, such
>> as locks and other synchronization primitives.
>
> To be honest, the pinning concept seems like an after thought for such a
> fundamental thing that we need, requiring additional macros, and bandaids=
 on
> top of the language itself, to make it work for the kernel. I am not alon=
e in
> that opinion. This should be first-class in a (systems) language, built i=
nto
> the language itself? I am talking about the whole pin initialization,
> accessing fields dances, etc.

Yes, that's exactly why people (Benno) are already working on making this a
language feature (here's a first step in this direction [1]).

Benno should have more details on this.

[1] https://github.com/rust-lang/rust/pull/146307

> Also I am concerned that overusage of pinning defeats a lot of optimizati=
ons

pin-init does the oposite it allows us to use a single memory allocation wh=
ere
otherwise you would need multiple.

Can you please show some optimizations that can not be done in drivers due =
to
pin-init for dynamic allocations?

Or in other words, what are the things you want to do with a KBox<T> in dri=
vers
that you can't do with a Pin<KBox<T>> in a more optimal way?

> that Rust may be able to perform, especially forcefully pinning stuff tha=
t
> does not need all to be pinned (except to satisfy paranoia),

Can you please present some examples where it is a major advantage to be ab=
le to
move out of a Box in drivers? I think you will have a hard time finding the=
m.

In C code, how often do you move fields out of structures that live within =
a
kmalloc() allocation?

> thus generating
> suboptimal code gen. Not only does it require redesign and concerns over
> accesses to un-initialized fields,

We're not doing any accesses to uninitialized fields with pin-init, nor do =
we
encourage them.

> like we saw in the last 2-3 weeks, it also
> forces people into that when maybe there is a chance that underlying
> structures do not need to be pinned at all (for some usecases).

Again, what are those use-cases where you want to be able to move out of a =
Box
in drivers?
