Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7DCC294D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 13:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B45D10E5F6;
	Tue, 16 Dec 2025 12:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mwArkI3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C78710E5F6;
 Tue, 16 Dec 2025 12:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2100341867;
 Tue, 16 Dec 2025 12:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448E7C4CEF5;
 Tue, 16 Dec 2025 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765887247;
 bh=pZP2BYvtE9bxefV3Xhyf3JysEWckorGNQUlBT4sl0HE=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=mwArkI3A22We2dV9k1nt+llKSV/PdjOlNKOSh58EWc2WT3tKVntnnU6I/YiUggG3i
 Tqh2Avr7N+p89KUHE18Db1eNRQr79btWxbHXefSDfhZbHyPA/X5xWRI6d6bq8M/40R
 iV8mM+xU+ytME+2AjSpNZGzkx0IfVa7eE8uf0+3iDgrlmtU4sIq2ms8QUuDz+/wK8P
 m4yWOoT3dvUDqi/WRJE4SvI7m8geXpOuHNWA1S5VFcizIh/UM8imRRxIg0GS8i499V
 jjoKi9KwaPezhIb7cI2YtgnG3oibWCi65T41bi5MZzcwoSs2uqWgnMrLLbCZakN2of
 +r0DoPlVFuRgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 13:14:00 +0100
Message-Id: <DEZMS6Y4A7XE.XE7EUBT5SJFJ@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/7] rust: pci: pass driver data by value to `unbind`
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-1-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-1-6a5d823be19d@nvidia.com>
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

On Tue Dec 16, 2025 at 6:13 AM CET, Alexandre Courbot wrote:
> When unbinding a PCI driver, the `T::unbind` callback is invoked by the
> driver framework, passing the driver data as a `Pin<&T>`.
>
> This artificially restricts what the driver can do, as it cannot mutate
> any state on the data. This becomes a problem in e.g. Nova, which needs
> to invoke mutable methods when unbinding.
>
> `remove_callback` retrieves the driver data by value, and drops it right
> after the call to `T::unbind`, meaning it is the only reference to the
> driver data by the time `T::unbind` is called.
>
> There is thus no reason for not granting full ownership of the data to
> `T::unbind`, so do it.

There are multiple reasons I did avoid this for:

(1) Race conditions

A driver can call Device::drvdata() and obtain a reference to the driver's
device private data as long as it has a &Device<Bound> and asserts the corr=
ect
type of the driver's device private data [1].

Assume you have an IRQ registration, for instance, that lives within this d=
evice
private data.  Within the IRQ handler, nothing prevents us from calling
Device::drvdata() given that the IRQ handler has a Device<Bound> reference.

Consequently, with passing the device private data by value to unbind() it =
can
happen that we have both a mutable and immutable reference at of the device
private data at the same time.

The same is true for a lot of other cases, such as work items or workqueues=
 that
are scoped to the Device being bound living within the device private data.

More generally, you can't take full ownership of the device private data as=
 long
as the device is not yet fully unbound (which is not yet the case in unbind=
()).

(2) Design

It is intentional that the device private data has a defined lifetime that =
ends
with the device being unbound from its driver. This way we get the guarante=
e
that any object stored in the device private data won't survive device / dr=
iver
unbind. If we give back the ownership to the driver, this guarantee is lost=
.

Conclusion:

Having that said, if you need mutable access to the fields of the device pr=
ivate
data within unbind() the corresponding field(s) should be protected by a lo=
ck.

Alternatively, you have mutable access within the destructor as well, but t=
here
you don't have a bound device anymore. Which is only consequent, since we c=
an't
call the destructor of the device private data before the device is fully
unbound.

(In fact, as by now, there is a bug with this, which I noticed a few days a=
go
when I still was on vacation: The bus implementations call the destructor o=
f the
device private data too early, i.e. when the device is not fully unbound ye=
t.

I'm working on a fix for this. Luckily, as by now, this is not a real bug i=
n
practice, yet it has to be fixed.)

From your end you don't have to worry about this though. nova-core should j=
ust
employ a lock for this, as we will need it in the future anyways, since we =
will
have concurrent access to the GSP.

[1] https://rust.docs.kernel.org/kernel/device/struct.Device.html#method.dr=
vdata
