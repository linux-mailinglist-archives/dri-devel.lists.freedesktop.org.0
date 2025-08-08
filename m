Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8A0B1E5EA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 11:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0675F10E8F8;
	Fri,  8 Aug 2025 09:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M2pxGJvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB5B10E8F8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 09:48:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB77841946;
 Fri,  8 Aug 2025 09:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DC6C4CEF0;
 Fri,  8 Aug 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754646503;
 bh=6o/h0XPWZJDPdWa67dneiEMUuXLg7e4ld1sXfJk7mRY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=M2pxGJvic3IegvIrJol/G4EQ1Mmnc2S5C1UlCLCOmw5imQiQ0kCRituTE0cMGYpct
 grzFgcRUwTFUtf9WQyPUcvUhEo1MKlFjdOCYGqk8avh8xcRb6mNc4h83M45nXClOvE
 y2fYZY7/wNuJVFrjp6nxAEZPRDdeaS/hR2iQXAMlXD2qlckmw+8dcLvNA8QLoTZHam
 zsYt339GjxXoKY+us4MOyTRY5X2Ej3+PjB1ZtfNyRB6FiQvnAK/ZtTo1cxdoMaWDvg
 gQ1cQb5CoWqR77gnPpTp2N2zxpGB4cSvEJnfXNhG6+LnqvPnrZxAZE2wfem5fpUi4D
 7DUlMLm8/JAxQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Breno
 Leitao <leitao@debian.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, Tamir Duberstein
 <tamird@gmail.com>
Subject: Re: [PATCH v2 03/10] rust: configfs: use `core::ffi::CStr` method
 names
In-Reply-To: <20250719-core-cstr-fanout-1-v2-3-e1cb53f6d233@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
 <7qdcu66Vo4fRt2CRuTsZm4PDmadED-1KyP09OgA-iV8imr6oA4uYUG5nuNSj-Y_lx-aK0XfEqAU90QA1Qi4gtA==@protonmail.internalid>
 <20250719-core-cstr-fanout-1-v2-3-e1cb53f6d233@gmail.com>
Date: Fri, 08 Aug 2025 11:46:50 +0200
Message-ID: <87fre25enp.fsf@kernel.org>
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

"Tamir Duberstein" <tamird@gmail.com> writes:

> Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
> avoid methods that only exist on the latter.
>
> Also avoid `Deref<Target=BStr> for CStr` as that impl doesn't exist on
> `core::ffi::CStr`.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



