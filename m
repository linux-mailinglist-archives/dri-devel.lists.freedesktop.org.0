Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CEFAF9C86
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 00:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942B910E035;
	Fri,  4 Jul 2025 22:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b098uLEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB6E10E035;
 Fri,  4 Jul 2025 22:38:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E25A76146E;
 Fri,  4 Jul 2025 22:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19E4C4CEE3;
 Fri,  4 Jul 2025 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751668711;
 bh=Voy1QjVh9xLwt9TKt2YCENbqa5daJHJYGpU8RXQaEQg=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=b098uLEQJJwJl0enNLeKq5Jlcx9dlu6MANF80Yjb1KmLVkxLSL0iSY7pnZ75ZKx7V
 MZdrr5xGVRc0+laLXAL8pwyvtVf/jUZW0B5wOm+C0m2PBgCbLvaH3lfQgkbKUY7esV
 oO0t8l3g0U+Px6/GfufA0StnMcyyM5gk2h4oCr+55nc4RS9Us/7zcrRFc+Kilpmd9f
 TSTIbOtcmiEQhyLhGaiyj/pHg/uN6SrSvxud4HqFOQj6Mvpt/DxRKkPZ8VMduXHEUG
 TZHc+MShxJXCPKzkz4Qz7uTj42DbRhm8SZTZnlSkW9VjCAZS+uGaq/ZL9RYI2Iu2lW
 w1+S+NlaEiSHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Jul 2025 00:38:26 +0200
Message-Id: <DB3MQEHYUAIU.1HRTOLR014FKZ@kernel.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/6] rust: kernel: add `fmt` module
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
 <20250704-core-cstr-prepare-v1-2-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-2-a91524037783@gmail.com>
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
> `kernel::fmt` is a facade over `core::fmt` that can be used downstream,
> allowing future changes to the formatting machinery to be contained
> within the kernel crate without downstream code needing to be modified.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/fmt.rs | 7 +++++++
>  rust/kernel/lib.rs | 1 +
>  2 files changed, 8 insertions(+)
