Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A6A4A248
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710D210ED23;
	Fri, 28 Feb 2025 18:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hpCy+tlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0D10ED25
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:58:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 89E596115F;
 Fri, 28 Feb 2025 18:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9309C4CEE5;
 Fri, 28 Feb 2025 18:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740769120;
 bh=0CWAFx3at7Ov80r+klQBiRHBMyocMZNWKTji/2lWbWo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hpCy+tlIL/WiH8sIXrgw1CU9Iu7kCns02O5uwQNuWa+pDA5b8HsPwx7OVt0GpDHqI
 +Kn2pMfpWYk7v8zHZolQ/YqFAbVdzknKNL+qBy9nBz/bAYz5BmBd10QrN6tVfmrHCd
 v3M/fqA96zdyp4cKGpCQxrvmm+sVNAwYxkrqDoD2R422Bj7nqO7byGzOz22K7Edhap
 cMmhxdV2uqpP7GlJcf2k636Iij0TcRh+fcO5+EUxr3QzMQMMWmZjF2D4MmXkBVtrIs
 yHvsduUnQRZaoqdGTaua9jkMpB5EuwpZSX2EoxZX7/Op270jrlu2/9jjtRbNb4uu1D
 aS7wZjmBj+S4w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Petr Mladek" <pmladek@suse.com>,  "Steven Rostedt"
 <rostedt@goodmis.org>,  "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>,  "Rasmus Villemoes"
 <linux@rasmusvillemoes.dk>,  "Sergey Senozhatsky"
 <senozhatsky@chromium.org>,  "Andrew Morton" <akpm@linux-foundation.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  "Benno
 Lossin"
 <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,  "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/5] rust: add #[export] macro
In-Reply-To: <20250228-export-macro-v2-3-569cc7e8926c@google.com> (Alice
 Ryhl's message of "Fri, 28 Feb 2025 12:39:32 +0000")
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <fSc95Xx2hPhD6YoRZ9J69-yHCdUg6S-frMHo1td_JsVpE2Tw3HmgDeteQR1SN-XwdpLwAnhS9jBzq-JCh8aoVw==@protonmail.internalid>
 <20250228-export-macro-v2-3-569cc7e8926c@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 28 Feb 2025 19:53:31 +0100
Message-ID: <87y0xplx3o.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

"Alice Ryhl" <aliceryhl@google.com> writes:

> Rust has two different tools for generating function declarations to
> call across the FFI boundary:
>
> * bindgen. Generates Rust declarations from a C header.
> * cbindgen. Generates C headers from Rust declarations.
>
> In the kernel, we only use bindgen. This is because cbindgen assumes a
> cargo-based buildsystem, so it is not compatible with the kernel's build
> system. This means that when C code calls a Rust function by name, its
> signature must be duplicated in both Rust code and a C header, and the
> signature needs to be kept in sync manually.
>
> To eliminate this manual checking, introduce a new macro that verifies
> at compile time that the two function declarations use the same
> signature. The idea is to run the C declaration through bindgen, and
> then have rustc verify that the function pointers have the same type.
>
> The signature must still be written twice, but at least you can no
> longer get it wrong. If the signatures don't match, you will get errors
> that look like this:
>
> error[E0308]: `if` and `else` have incompatible types
>   --> <linux>/rust/kernel/print.rs:22:22
>    |
> 21 | #[export]
>    | --------- expected because of this
> 22 | unsafe extern "C" fn rust_fmt_argument(
>    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
>    |
>    = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
>               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`
>
> It is unfortunate that the error message starts out by saying "`if` and
> `else` have incompatible types", but I believe the rest of the error
> message is reasonably clear and not too confusing.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



