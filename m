Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08FB43974
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269AF10E9EC;
	Thu,  4 Sep 2025 11:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gBHU3Amu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDA310E9EB;
 Thu,  4 Sep 2025 11:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756983757; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YGrZaiFXgz/dcAD/GhG5qWejTWpckke2xtxufSRxDWuIJ8TfsHzsQxzSDX1D1IstkMHOGXUlrdb4GRh0IHLqvh5GLRU0VgsT2nAVtVGcyIr8h/jnKsRO3FhUEoVY1wlOvYsnh2+gXQnqHXqgSWQVQ2yYffpbMCdybTmSIuZbIZ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756983757;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=M+c8sBfNK7jTMhcj9S/0VC9pw8RniI4xywgLwf5sppE=; 
 b=bCvYFODO7/KwS+25DN9Px9ISAIUCdCXbhvPcsqXI9TlcLdCp0D1SXxr7hmoIqTni/oj23iG0zWqhnl8s/UZSRsdl4rBmc3Zv0XdOmmL8TAYN3l5QV0t0Dsot0n08onTDCYznArS1n710ERwgk3DfUu9VIc4cwABpL/aXshgkOYU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756983756; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=M+c8sBfNK7jTMhcj9S/0VC9pw8RniI4xywgLwf5sppE=;
 b=gBHU3AmuyBe8B5E0E8wU5a6jJhJv1uugBOQrrisM+9rIaGMuTo8Rcf4quNHKP8E0
 liL6RHiyLZ6rYKSeMfr2d25Il4g17l2rBOreViwmNCxDBEfQbJOCCG+eXjGd8HLPd3R
 wDIwvWOs8v6Sw3RcjnY+u0UYYMf5EUjtrWad5Z70=
Received: by mx.zohomail.com with SMTPS id 1756983753966635.954770851991;
 Thu, 4 Sep 2025 04:02:33 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
Date: Thu, 4 Sep 2025 08:02:16 -0300
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8498F151-B4DF-43D3-981E-FAE598964CA2@collabora.com>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
 <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 4 Sep 2025, at 00:16, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> On Thu Sep 4, 2025 at 12:15 AM JST, Joel Fernandes wrote:
> <snip>
>>>> +use kernel::prelude::*;
>>>> +
>>>> +/// Macro for defining bitfield-packed structures in Rust.
>>>> +/// The size of the underlying storage type is specified with =
#[repr(TYPE)].
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
>>> A note on syntax: for nova-core, we may want to use the `H:L` =
notation,
>>> as this is what OpenRM uses, but in the larger kernel we might want =
to
>>> use inclusive ranges (`L..=3DH`) as it will look more natural in =
Rust
>>> code (and is the notation the `bits` module already uses).
>>=20
>> Perhaps future add-on enhancement to have both syntax? I'd like to =
initially
>> keep H:L and stabilize the code first, what do you think?
>=20
> Let's have the discussion with the other stakeholders (Daniel?). I =
think
> in Nova we want to keep the `H:L` syntax, as it matches what the =
OpenRM
> headers do (so Nova would have its own `register` macro that calls =
into
> the common one, tweaking things as it needs). But in the kernel crate =
we
> should use something intuitive for everyone.
>=20

I don=E2=80=99t specifically care which syntax is used. We will adapt to =
it.

=E2=80=94 Daniel

