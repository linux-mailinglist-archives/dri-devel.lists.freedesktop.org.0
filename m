Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A5B43384
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F7610E99D;
	Thu,  4 Sep 2025 07:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EiHRXDVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898A310E985;
 Thu,  4 Sep 2025 07:16:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E5BA6013A;
 Thu,  4 Sep 2025 07:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81238C4CEF0;
 Thu,  4 Sep 2025 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756970174;
 bh=LPZdm/buyXJ0xTVnIGoZtyA/LmkK+ghc/dp8KaZjL3M=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=EiHRXDVA82k7Cr9OTXAw9dXNT8pgAZCIFSnn/1dEFk2jAhv0XD2r9Eta//PpL+mG9
 iVNrUJtOTVmsw+zbCWLFuwl+SxclzDqY5c6ZWQFLChpztmT9tPVsedZK9g7OiLlG/p
 5aD3YCHwH/tXG4+Jrw+zBKcAFCNdr86ssiSQyVxiPo7Z5sEKJS1xo8VJ68/54RIvZL
 iiFdRYt9axVaOxxuVdqRE41iUjmNtAEIl/Q6B7fhOEnC7hQFJoPU3sjlnlX0ypimlq
 /BcOCDuKX1qY535sifynGn+R+2ImolliCIOFrm4lhuEx4FGeQ3VvL8M9bZk/W0hsAf
 5cGix/Fo052ig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 09:16:08 +0200
Message-Id: <DCJTY0OQFG83.1AX49CQARXCEX@kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
 <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
In-Reply-To: <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
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

On Thu Sep 4, 2025 at 5:16 AM CEST, Alexandre Courbot wrote:
> On Thu Sep 4, 2025 at 12:15 AM JST, Joel Fernandes wrote:
> <snip>
>>>> +use kernel::prelude::*;
>>>> +
>>>> +/// Macro for defining bitfield-packed structures in Rust.
>>>> +/// The size of the underlying storage type is specified with #[repr(=
TYPE)].
>>>> +///
>>>> +/// # Example (just for illustration)
>>>> +/// ```rust
>>>> +/// bitstruct! {
>>>> +///     #[repr(u64)]
>>>> +///     pub struct PageTableEntry {
>>>> +///         0:0       present     as bool,
>>>> +///         1:1       writable    as bool,
>>>> +///         11:9      available   as u8,
>>>> +///         51:12     pfn         as u64,
>>>> +///         62:52     available2  as u16,
>>>> +///         63:63     nx          as bool,
>>>=20
>>> A note on syntax: for nova-core, we may want to use the `H:L` notation,
>>> as this is what OpenRM uses, but in the larger kernel we might want to
>>> use inclusive ranges (`L..=3DH`) as it will look more natural in Rust
>>> code (and is the notation the `bits` module already uses).
>>
>> Perhaps future add-on enhancement to have both syntax? I'd like to initi=
ally
>> keep H:L and stabilize the code first, what do you think?
>
> Let's have the discussion with the other stakeholders (Daniel?). I think
> in Nova we want to keep the `H:L` syntax, as it matches what the OpenRM
> headers do (so Nova would have its own `register` macro that calls into
> the common one, tweaking things as it needs). But in the kernel crate we
> should use something intuitive for everyone.

I don't care too much about whether it's gonna be H:L or L:H [1], but I do =
care
about being consistent throughout the kernel. Let's not start the practice =
of
twisting kernel APIs to NV_* specific APIs that differ from what people are=
 used
to work with in the kernel.

[1] If it's gonna be H:L, I think we should also list things in reverse ord=
er,
    i.e.:

	pub struct PageTableEntry {
	    63:63     nx          as bool,
	    62:52     available2  as u16,
	    51:12     pfn         as u64,
	    11:9      available   as u8,
	    1:1       writable    as bool,
	    0:0       present     as bool,
	}

This is also what would be my preferred style for the kernel in general.

- Danilo
