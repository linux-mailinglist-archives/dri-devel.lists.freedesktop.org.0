Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678DCB5674C
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 09:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A8610E054;
	Sun, 14 Sep 2025 07:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iRwlpxRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80AD10E053;
 Sun, 14 Sep 2025 07:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 97409409D7;
 Sun, 14 Sep 2025 07:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F808C4CEF0;
 Sun, 14 Sep 2025 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757836734;
 bh=uz1xVp736uSxGyJV2q+yZ0bzLeyruMJpCl0NX2u+YDY=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=iRwlpxRKA0fAf/GCGQ9DQR0XqhKFY6HiWKEQ7dT1YIHzf9F7YYN47NraYtaedlYqD
 PH6vlJi6AEdcPanTIJNNr/HV40atxuXo7lrNNHwzEMexrd3Y88ofdVZ3yPfnm7sZ14
 bi6lSmsST+lW3D+ILXydyeZFCO/s3mDKlYv3CDgRpRc2w8D5SaOJpZi7kJZj5mBwuI
 7ROzGVxdiFD8d3ts3SRuLuGepqqzFxMV4lxkmFB4MfRrnWLW1deLHyaYMnbn8krwIK
 HMFUjVHt6A7/qHjY0NEZyiIA3ADKGFD0q+m34Fk65rB9tKLwQge3d4szPjp8Ocdxtk
 RonRZtjFzk0wQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 09:58:44 +0200
Message-Id: <DCSD437J7EES.359ZQ732TXJY@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
From: "Benno Lossin" <lossin@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
 <DCRXOMQN3Z20.2JCNP4BDEE79T@kernel.org> <20250913230254.GA1568515@joelbox2>
In-Reply-To: <20250913230254.GA1568515@joelbox2>
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

On Sun Sep 14, 2025 at 1:02 AM CEST, Joel Fernandes wrote:
> On Sat, Sep 13, 2025 at 09:53:16PM +0200, Danilo Krummrich wrote:
>> On Sat Sep 13, 2025 at 7:13 PM CEST, Joel Fernandes wrote:
>> > On Sat, Sep 13, 2025 at 03:30:31PM +0200, Danilo Krummrich wrote:
>> >> However, we should never do such things. If there's the necessity to =
do
>> >> something like that, it indicates a design issue.
>> >>=20
>> >> In this case, there's no problem, we can use pin-init without any iss=
ues right
>> >> away, and should do so.
>> >>=20
>> >> pin-init is going to be an essential part of *every* Rust driver give=
n that a
>> >> lot of the C infrastruture that we abstract requires pinned initializ=
ation, such
>> >> as locks and other synchronization primitives.
>> >
>> > To be honest, the pinning concept seems like an after thought for such=
 a
>> > fundamental thing that we need, requiring additional macros, and banda=
ids on
>> > top of the language itself, to make it work for the kernel. I am not a=
lone in
>> > that opinion. This should be first-class in a (systems) language, buil=
t into
>> > the language itself? I am talking about the whole pin initialization,
>> > accessing fields dances, etc.
>>=20
>> Yes, that's exactly why people (Benno) are already working on making thi=
s a
>> language feature (here's a first step in this direction [1]).
>>=20
>> Benno should have more details on this.
>>=20
>> [1] https://github.com/rust-lang/rust/pull/146307

That's the link to the implementation PR, if you know the internals of
the compiler it sure is useful, but if not, only the first comment is :)

> Ack, thanks for the pointer. I will study it further.

I'd recommend looking at these links, as they talk more about the design
& not the compiler implementation:

* https://github.com/rust-lang/rust/issues/145383
* https://hackmd.io/@rust-lang-team/S1I1aEc_lx
* https://rust-lang.github.io/rust-project-goals/2025h2/field-projections.h=
tml

For pin specifically, there also is the pin-ergonomics effort:

* https://github.com/rust-lang/rust/issues/130494

Which is less general than the field projections that I'm working on,
but more specific to pin & tries to make it more compiler internal.

Now for pinned initialization, Alice has a project goal & proposal:

* https://rust-lang.github.io/rust-project-goals/2025h2/in-place-initializa=
tion.html
* https://hackmd.io/%40aliceryhl/BJutRcPblx

This proposal was heavily influenced by pin-init & we're actively
working together with others from the Rust community in getting this to
a language feature.

It's a pretty complicated feature and people just worked around it
before, which you can do when starting from the ground-up (similar to
field projections).

>> > Also I am concerned that overusage of pinning defeats a lot of optimiz=
ations
>>=20
>> pin-init does the oposite it allows us to use a single memory allocation=
 where
>> otherwise you would need multiple.
>>=20
>> Can you please show some optimizations that can not be done in drivers d=
ue to
>> pin-init for dynamic allocations?
>
> Aren't the vector resizing issues an example? The debugfs discussions for
> example. You can't resize pinned vectors without boxing each element whic=
h is
> suboptimal due to requiring additional allocations?

Yes, but that's not really an optimization, is it? In the non-pinned
case, the compiler wouldn't remove the allocation. You can select less
efficient algorithms, since the objects aren't allowed to move, but that
same restriction also applies in C.

---
Cheers,
Benno
