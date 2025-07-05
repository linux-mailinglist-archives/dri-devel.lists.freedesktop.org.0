Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC7AF9F52
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 11:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CE610E05A;
	Sat,  5 Jul 2025 09:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VbXaelXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DD310E04A;
 Sat,  5 Jul 2025 09:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C632A5206E;
 Sat,  5 Jul 2025 09:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDB0C4CEE7;
 Sat,  5 Jul 2025 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751706951;
 bh=zAAwL1qn9DWYaFXEYo3FHdzOi6eWfYIf0GhD/81me8I=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=VbXaelXjrbmiJwwmiM8rVc2FLbx9FZq2GjG+M4uRZSSKbUGRyyKOGF8pC82TJ1Zwe
 or72p6rhJA8vKjVtOiaX5p2KBpUUA/EaCkQ4HNOoNlR1omc9y0eiAqsevVZ+e2rLJF
 SMhVZjwHdAGhc3H0hgXTkfLyhNSN1OD9sHfJhq9nFd05Yf1HA5LUQef20WzoVtNSVr
 E9YT/jjS8tnvHtWwlElv0Y838z0aaLTbhzgYO2ZIs9TQq4ngbO8QjY2Jl6q/9/OTwE
 Lj6wRBc1lwBLpAwtoTmH6EZoN58NHGrYN8lQst+JZi6lsjf94hqsTwp9hD5kFSP6dr
 w56MSIa42VUWg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Jul 2025 11:15:46 +0200
Message-Id: <DB40ADOHZ908.3PN41XZ77MR29@kernel.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 5/6] rust: add `CStr` methods matching `core::ffi::CStr`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Nishanth Menon" <nm@ti.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-5-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-5-a91524037783@gmail.com>
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

On Fri Jul 4, 2025 at 10:14 PM CEST, Tamir Duberstein wrote:
> Prepare for replacing `CStr` with `core::ffi::CStr` by soft-deprecating
> methods which don't exist on `core::ffi::CStr`.
>
> We could keep `as_bytes{,_with_nul}` through an extension trait but
> seeing as we have to introduce `as_char_ptr_in_const_context` as a free
> function, we may as well introduce `to_bytes{,_with_nul}` here to allow
> downstream code to migrate in one cycle rather than two.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/str.rs | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
