Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAADB11028
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 19:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5493F10E9A3;
	Thu, 24 Jul 2025 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HRJnJSQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899B410E047;
 Thu, 24 Jul 2025 17:05:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 137875C564D;
 Thu, 24 Jul 2025 17:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBD1C4CEF8;
 Thu, 24 Jul 2025 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753376731;
 bh=sg3NW9AjretcgkE6d+kewjNw2dnztGx4Ya+hYU2OpQc=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=HRJnJSQR+MK9Oxsd87E6Fac8XKPvf1Qd97ZHcE/xZ6lVVOgaVltIC89t11uYBwJ2w
 MEorXePy7QsGfObA8m2y+mV5jY9WKjWBDCvK0/oIdlyd6T3QwE8IoxV05g8BIRH4Ew
 08sAjcD44S0Me6cNaCxw25YUNZRbVcJae/ijfWKKj+70N1EzQoQISa80qqiWNEZVt0
 Eay+rWLHD6J27K8mclV247u2nLNLTs4DtCXsmm4kEHVFR+pFe5mWj//b5+ZmYVXHUQ
 XEwnAva69qbiKTEy6R+ndUYvduz9cq8tCcUy9PLoERluxdL8W3Mkv6ARAffG7/UVHT
 JF70LX/uKROUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 19:05:26 +0200
Message-Id: <DBKG6CA32OO0.368N1Y6VMIUTL@kernel.org>
Subject: Re: [PATCH] drm: nova-drm: fix 32-bit arm build
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250724165441.2105632-1-ojeda@kernel.org>
In-Reply-To: <20250724165441.2105632-1-ojeda@kernel.org>
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

On Thu Jul 24, 2025 at 6:54 PM CEST, Miguel Ojeda wrote:
> In 32-bit arm, the build fails with:
>
>     error[E0308]: mismatched types
>       --> drivers/gpu/drm/nova/file.rs:42:28
>        |
>     42 |         getparam.set_value(value);
>        |                  --------- ^^^^^ expected `u64`, found `u32`
>        |                  |
>        |                  arguments to this method are incorrect
>        |
>     note: method defined here
>       --> drivers/gpu/drm/nova/uapi.rs:29:12
>        |
>     29 |     pub fn set_value(&self, v: u64) {
>        |            ^^^^^^^^^        ------
>     help: you can convert a `u32` to a `u64`
>        |
>     42 |         getparam.set_value(value.into());
>        |                                 +++++++
>
> The reason is that `Getparam::set_value` takes a `u64` (from the UAPI),
> but `pci::Device::resource_len()` returns a `resource_size_t`, which is a
> `phys_addr_t`, which may be 32- or 64-bit.
>
> Thus add an `into()` call to support the 32-bit case, while allowing the
> Clippy lint that complains in the 64-bit case where the type is the same.
>
> Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Thanks -- will take it through -fixes once rc-1 is out.

> ---
> As discussed, it may be best to have a newtype, or at least a function
> to perform this -- here it is the minimal fix nevertheless.

I think I will follow up with a function to perform the conversion in a sin=
gle
place, but I really like the idea of a special clippy annotation to tell cl=
ippy
to not warn about unnecessary into() conversions for a specific type alias,=
 such
as ResourceSize.

Do we agree that we want something like this? Do we even have a feature req=
uest
for this already?
