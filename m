Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2443B0535B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154D710E540;
	Tue, 15 Jul 2025 07:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QxJTX6cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C861710E540
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 07:34:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D0D7A52115;
 Tue, 15 Jul 2025 07:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7D7C4CEE3;
 Tue, 15 Jul 2025 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752564878;
 bh=4CL6/hyrXntz5Jzf6q4KYnN4WXadq+OD4RoZk4/8EVw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QxJTX6cn9ikSbIL+Mbheq/UHXcecoYI7JnYpd6bLAxFnhA9ycbbcpbLefRiHGecX2
 lalzHadVfbsb2W6mwhjfXT8enIcbpM/DznclNr7PfXPy6QwfrI3crLj7uVJmOXSlf4
 4+3qxcCaigdsjBL8b70q5s5/85ckxuNSjzWNT47FnjxCihe1kn8/eDOeUXaQeGYubl
 V9xsKBHF03TUYtHIqxA6j23+QOSkG6ld9jdFOYMJBSaQh176oSq3Gw97eQv9DTPMAD
 g8AwFRmdXs4aF7TVnaeFLoVtzWV7+T0YPownhQ86oKevGdSe2UMUx9gpgBBKPP/2Uc
 qnMfLuJfOM9dg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,  "Maxime
 Ripard" <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <lossin@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>,  <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Add Opaque::cast_from
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com> (Alice
 Ryhl's message of "Tue, 24 Jun 2025 15:27:54 +0000")
References: <OeCi_sbX1kfHFfD5rJSghX6nJ6nZA25Ak9sBH6PvR8BqWfBDlxdB0ejBjYgqbzD_m18QNDU4BdjsKdtdSq4lrA==@protonmail.internalid>
 <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Jul 2025 09:34:27 +0200
Message-ID: <8734axj4ak.fsf@kernel.org>
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

> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
>
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
>
> To help catch this kind of mistake, add a new Opaque::cast_from that
> wraps a raw pointer in Opaque without changing the inner type. Also
> rename raw_get() to cast_into() for naming consistency.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I think your search/replace was a bit too general in hrtimer.rs. When
you fix that:

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



