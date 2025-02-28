Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1602A49346
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5146810EC15;
	Fri, 28 Feb 2025 08:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iEjJXe7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6FA10EC14
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:20:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7C415C65F3;
 Fri, 28 Feb 2025 08:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88C4C4CEE4;
 Fri, 28 Feb 2025 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740730824;
 bh=07PaF1z2XapagVOUVls3LNjkNVKmOgxjvsYJxQn7wG8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iEjJXe7LbIrkINX5hp0Sgal0JU1zlp0qgi4Kd9CHEWE0Gkk7pcuXRiHXZvYNrsA23
 n3trDI8u5ZVZFp0k+U/kBYctkJHaYCk+Bf9BhG61gSxtCYl2GZq3eusrNsonAWqHkX
 5R83pyMHwTfHA8BxYDf3A6HR+4t1ohHRctB+QTliOM1+Q4NtwMRG4/zG+BBO5Tn8a8
 FAAfhsJt3y11eHAiRfkDJrSjtTnTXQd2ivf1bb99U/vArwQV2qm8tQeLPjPjaqCt8J
 rDh1okfNwoGmkQW2KQKz1HpMCs+Y/Q7nmcP9uaeepaBlweEFnf/oeToi8SRZ6Z2z1i
 es14H5VYpVKmg==
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
Subject: Re: [PATCH 4/4] panic_qr: use new #[export] macro
In-Reply-To: <20250227-export-macro-v1-4-948775fc37aa@google.com> (Alice
 Ryhl's message of "Thu, 27 Feb 2025 17:02:02 +0000")
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <4cDCLbcJEQ7swGgJXKHMNNEKJT-zVTUP2Y__b8FvtuRWnKrlLV89Sa3hVF4Xh0t9QzFGm0yZ3f8gaIss-fGNng==@protonmail.internalid>
 <20250227-export-macro-v1-4-948775fc37aa@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 28 Feb 2025 09:19:59 +0100
Message-ID: <87jz9ao500.fsf@kernel.org>
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

> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.

It would indeed be nice if there was a way to mark some functions to be
emitted as safe by bindgen.

>
> If the function is not unsafe, then this error is emitted:
>
> error[E0308]: `if` and `else` have incompatible types
>    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>     |
> 986 | #[export]
>     | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
>     |
>     = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
>                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


