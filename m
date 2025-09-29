Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A33BA83C0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 09:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF3D10E3A0;
	Mon, 29 Sep 2025 07:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AwgzNJRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B63710E3A0;
 Mon, 29 Sep 2025 07:24:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8A5862308;
 Mon, 29 Sep 2025 07:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C08C4CEF4;
 Mon, 29 Sep 2025 07:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759130666;
 bh=1qzNnpu3NUoqi58w/V80ugREMmoNYeEvOtzP7t+zvkI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=AwgzNJRuocgjAGZ1GURK4UCtFvmTUaMRB+hol6d5Rk+/bvyCaocUKVrJF3iQ0UWLd
 3Qc6mE5XX+a/dsG1lBnayQyoJuooAqF7qQfSLq/VfolhbDVh4DokgIMIwNU6hFdWe2
 QqVn2li1Pox+IYgNPjwxGnkERpplwjciHOTFUto93ULc6qNb5ZE2JDtvsMTorjUDBF
 ZI1Bkk2BEW7PVGHpTuq0tG3bMJFwjBIQjHxLMAIruWYvk0TAZ2Tv6W6qg0vlONCTBe
 tsxJUnslbgBZCCJy+WtpXjvguHBMappH5ZE8nDsKgnCerpI3y+N3TY4nx5BR1Ukyn/
 MCAbmC8FRzHVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 09:24:19 +0200
Message-Id: <DD53RWODAWPS.3MBKE59UU905Q@kernel.org>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul"
 <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <e95c59cc72145c05380d0d81d767c6ce97fbbf0a.camel@redhat.com>
 <fiwv6movnoliptvjdlxzx4rggv5a7mid4zyvmqowvw6kt5auhh@r4dmizzmykwv>
 <DD2DFKZTFIGS.2HDVZRV6WGXHG@nvidia.com>
 <mkecw5p2eb6bsl54ccpxrdezeatr4sxjtkvsteu4klx6u3ldka@p42jqjvoi275>
In-Reply-To: <mkecw5p2eb6bsl54ccpxrdezeatr4sxjtkvsteu4klx6u3ldka@p42jqjvoi275>
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

On Mon Sep 29, 2025 at 3:06 AM CEST, Alistair Popple wrote:
> On 2025-09-26 at 12:20 +1000, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> On Thu Sep 25, 2025 at 3:32 PM JST, Alistair Popple wrote:
>> <snip>
>> >> > +    #[expect(unused)]
>> >> > +    pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
>> >> > +        &mut self,
>> >> > +        timeout: Delta,
>> >> > +        init: impl FnOnce(&M, SBuffer<core::array::IntoIter<&[u8],=
 2>>) -> Result<R>,
>> >> > +    ) -> Result<R> {
>> >> > +        let (driver_area, msg_header, slice_1) =3D wait_on(timeout=
, || {
>> >> > +            let driver_area =3D self.gsp_mem.driver_read_area();
>> >> > +            // TODO: find an alternative to as_flattened()
>> >> > +            #[allow(clippy::incompatible_msrv)]
>> >> > +            let (msg_header_slice, slice_1) =3D driver_area
>> >> > +                .0
>> >> > +                .as_flattened()
>> >> > +                .split_at(size_of::<GspMsgElement>());
>> >> > +
>> >> > +            // Can't fail because msg_slice will always be
>> >> > +            // size_of::<GspMsgElement>() bytes long by the above =
split.
>> >> > +            let msg_header =3D GspMsgElement::from_bytes(msg_heade=
r_slice).unwrap();
>> >>=20
>> >> Any reason we're not just using unwrap_unchecked() here then?
>> >
>> > Because whilst my assertions about the code are currently correct if i=
t ever
>> > changes I figured it would be better to explicitly panic than end up w=
ith
>> > undefined behaviour. Is there some other advantage to using unwrap_unc=
hecked()?
>> > I can't imagine there'd be much of a performance difference.
>>=20
>> Here I think we should just use the `?` operator. The function already
>> returns a `Result` so it would fit.
>
> Actually note quite true - this is in a closure that must return `Option<=
_>`
> so returning `Result` doesn't fit. However it still fits because I just n=
oticed
> `::from_bytes()` returns an `Option` so `?` will still work.

More in general, as by now, unwrap() panics the kernel, which is an absolut=
e
last resort, that should only be considered if there's really no other opti=
on.
Please also see [1] and [2].

[1] https://docs.kernel.org/process/coding-style.html#do-not-crash-the-kern=
el
[2] https://github.com/Rust-for-Linux/linux/issues/1191
