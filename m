Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B075C17166
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D7910E202;
	Tue, 28 Oct 2025 21:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sVtfuX2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903A210E202
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:46:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C864B6128C;
 Tue, 28 Oct 2025 21:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64041C4CEE7;
 Tue, 28 Oct 2025 21:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761688000;
 bh=98qCRZHWGnqg7xDIKMCuNXdBxkmWnC/wKM3LJ+sRPFg=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=sVtfuX2mfhe82Bqy0W5riLNw1p7s7ncgziLHl3CfjgIBjfGYXCbdX5nBw9KftTIOr
 WwR4CE6Yf9D3erkZwldSmaF045xibBCcag/QJxUm1betWBzX26jCe571MV+KkQgPSQ
 dzzFx9h2I3bqy18Fl5eKKvXmQJaUmVpXQ9Cs+81GlyMyX88srQ+sO0sdEi4D9hiFzg
 DeaPlqBklU1zibVdTw+n6E6ySliU8+hOEoh3zCRDSGo+dVVtCfcEgLizGZ3TUKCf7Q
 ddMYgw0jhXtrygJK3X/POWEKM3crI1411K/IIfDEwMZNjRRmK94Q4G7H6bEU9viO6H
 MdTP4OtWIR6kg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 22:46:35 +0100
Message-Id: <DDUA9WI1KASO.ECSJNA3RRQEI@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust/dma: Take &mut self in
 CoherentAllocation::field_write()
References: <20251028211801.85215-1-lyude@redhat.com>
In-Reply-To: <20251028211801.85215-1-lyude@redhat.com>
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

On Tue Oct 28, 2025 at 10:18 PM CET, Lyude Paul wrote:
> At the moment - CoherentAllocation::field_write() only takes an immutable
> reference to self. This means it's possible for a user to mistakenly call
> field_write() while Rust still has a slice taken out for the coherent
> allocation:
>
>   let alloc: CoherentAllocation<CoolStruct> =3D /* =E2=80=A6 */;
>
>   let evil_slice =3D unsafe { alloc.as_slice(/* =E2=80=A6 */)? };
>   dma_write!(alloc[1].cool_field =3D 42); /* UB! */
>
> Keep in mind: the above example is technically a violation of the safety
> contract of as_slice(), so luckily this detail shouldn't currently be
> causing any UB in the kernel. But, there's no reason we should be solely
> relying on the safety contract for enforcing this when we can just use a
> mutable reference and already do so in other parts of the API.

While I generally agree with this, the catch is that it would also enforce =
that
you would need a lock for calling dma_write!() in a concurrent context.

I.e. if your CoherentAllocation is shared between tasks we can currently ha=
ve
the tasks calling dma_write!() and dma_read!() concurrently without requiri=
ng a
lock for the CoherentAllocation.

Requiring a spinlock for such a case wouldn't be the end of the world of co=
urse,
but it would still be unnecessary.
