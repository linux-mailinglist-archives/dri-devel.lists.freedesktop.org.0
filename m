Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD53AF9BCF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702F310E0D2;
	Fri,  4 Jul 2025 20:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ipinztuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D0910E02C;
 Fri,  4 Jul 2025 20:56:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 545EC61469;
 Fri,  4 Jul 2025 20:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FCCC4CEE3;
 Fri,  4 Jul 2025 20:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751662592;
 bh=/3YRFezrr8EJenY5ydJDWvYfG5QhETwTNQQul8BZb6c=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=ipinztuMt5KUnYPucmuaBLL/D3ZjwbSEk29DsbdMnyTihYJQ/h8aTT79RZXRBsUUg
 IQ++y/DN5GIoOwKnrgIyzWu5ezYoJgcY7FZQZADm/ybFUkzSa7dGcjFDvN3Zghb4qe
 7g54DL9Xh8LsRjTYXcXpvAMZiyHE+wEpjEwISSaK3COf5nikr06bkAbaZwOeEdfC5q
 0H6A6wH9QyrLAvqF80ij/J0zO+CBOkb80bpjpDx59yV/wxwiKoXfcQH7PnbnSGnW/A
 v3FWOrVy6ksEmyDf63LIA9ipBiCGZvD4owM2J/ynbTEc6grg1SqeqGz5BDqBBDmEXK
 MJc8UIEupH92Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Jul 2025 22:56:26 +0200
Message-Id: <DB3KKAZ4HJ96.YPY4C6W0Y5HZ@kernel.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`, fix
 clippy::uninlined-format-args
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
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
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
> Rather than export a macro that delegates to `core::format_args`, simply
> re-export `core::format_args` as `fmt` from the prelude. This exposes
> clippy warnings which were previously obscured by this macro, such as:
>
>     warning: variables can be used directly in the `format!` string
>       --> ../drivers/cpufreq/rcpufreq_dt.rs:21:43
>        |
>     21 |     let prop_name =3D CString::try_from_fmt(fmt!("{}-supply", na=
me)).ok()?;
>        |                                           ^^^^^^^^^^^^^^^^^^^^^^=
^
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#uninlined_format_args
>        =3D note: `-W clippy::uninlined-format-args` implied by `-W clippy=
::all`
>        =3D help: to override `-W clippy::all` add `#[allow(clippy::uninli=
ned_format_args)]`
>     help: change this to
>        |
>     21 -     let prop_name =3D CString::try_from_fmt(fmt!("{}-supply", na=
me)).ok()?;
>     21 +     let prop_name =3D CString::try_from_fmt(fmt!("{name}-supply"=
)).ok()?;
>        |
>
> Thus fix them in the same commit. This could possibly be fixed in two
> stages, but the diff is small enough (outside of kernel/str.rs) that I
> hope it can taken in a single commit.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +--
>  drivers/gpu/nova-core/firmware.rs |  5 +++--
>  rust/kernel/opp.rs                |  2 +-
>  rust/kernel/prelude.rs            |  2 +-
>  rust/kernel/str.rs                | 34 ++++++++++++++-------------------=
-
>  5 files changed, 20 insertions(+), 26 deletions(-)
