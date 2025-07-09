Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F2AFF2DD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1D610E84E;
	Wed,  9 Jul 2025 20:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bChUWIyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154BA10E84E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 20:21:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3FAA05C6137;
 Wed,  9 Jul 2025 20:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11FEC4CEEF;
 Wed,  9 Jul 2025 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752092462;
 bh=quTcM77+JwIDAwk/mszow6YJfzgDAsI1Ebx3aEw25ho=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=bChUWIyZAu8N9v9iqcGEu+8pPx7QPo/j7e1LSNTHfMCR1ybTS2EfBKpaX0Xe9qljU
 jzJCfu4BGEGgzvoeS3AXrq/n6oCJwewWKx9LHwtZBbN3JfQ7Y/f3ECH+6b23epdgzw
 /hT6TLrb8CWQjBayEVsq/8lTsN77CseuGy/SAYgycxdoKjD4iOhkBaDlsJBQffmyfb
 T/b3pq0pL1wMggdFEYxPUB+VVWMYWsD8OXQ74ZYGCWq179+lyUCBycizDOTvaJvzFM
 5gT7xA1RNXVyX0UQ54FTSnDQ3xci+jrqgG7USlBxP6VumKhnpFIEUypJ8FQqpJhk0m
 VibIefCIzfJhQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 22:20:54 +0200
Message-Id: <DB7SXTRZ1VKL.VONQAEWAV9TX@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 00/10] rust: use `core::ffi::CStr` method names
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Breno Leitao" <leitao@debian.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Brendan Higgins" <brendan.higgins@linux.dev>,
 "David Gow" <davidgow@google.com>, "Rae Moar" <rmoar@google.com>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>
X-Mailer: aerc 0.20.1
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
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

On Wed Jul 9, 2025 at 9:58 PM CEST, Tamir Duberstein wrote:
> This is series 2b/5 of the migration to `core::ffi::CStr`[0].
> 20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com.
>
> This series depends on the prior series[0] and is intended to go through
> the rust tree to reduce the number of release cycles required to
> complete the work.
>
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the other series must go).
>
> [0] https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (10):
>       gpu: nova-core: use `core::ffi::CStr` method names
>       rust: auxiliary: use `core::ffi::CStr` method names
>       rust: configfs: use `core::ffi::CStr` method names
>       rust: cpufreq: use `core::ffi::CStr` method names
>       rust: drm: use `core::ffi::CStr` method names
>       rust: firmware: use `core::ffi::CStr` method names
>       rust: kunit: use `core::ffi::CStr` method names
>       rust: miscdevice: use `core::ffi::CStr` method names
>       rust: net: use `core::ffi::CStr` method names
>       rust: of: use `core::ffi::CStr` method names
>
>  drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>  rust/kernel/auxiliary.rs        | 4 ++--
>  rust/kernel/configfs.rs         | 4 ++--
>  rust/kernel/cpufreq.rs          | 2 +-
>  rust/kernel/drm/device.rs       | 4 ++--
>  rust/kernel/firmware.rs         | 2 +-
>  rust/kernel/kunit.rs            | 6 +++---
>  rust/kernel/miscdevice.rs       | 2 +-
>  rust/kernel/net/phy.rs          | 2 +-
>  rust/kernel/of.rs               | 2 +-
>  samples/rust/rust_configfs.rs   | 2 +-
>  11 files changed, 16 insertions(+), 16 deletions(-)

For the entire series:

Reviewed-by: Benno Lossin <lossin@kernel.org>

Thanks a lot for splitting it up into these tiny pieces!

---
Cheers,
Benno
