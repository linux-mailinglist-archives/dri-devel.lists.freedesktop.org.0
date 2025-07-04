Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B5AF935C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D9510EA2E;
	Fri,  4 Jul 2025 13:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mi+LrZHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDF510EA2D;
 Fri,  4 Jul 2025 13:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6C9C961457;
 Fri,  4 Jul 2025 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F840C4CEE3;
 Fri,  4 Jul 2025 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751634040;
 bh=PQ+uuvbgXKFc5vIr220QI1Lf8oYUGvsoSa+Kga5uCxI=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=mi+LrZHjF+yRfLmrMqCm45+w6sUTBWLIFLln4t06TCRfNNID72odMCaUkq6P7uCUX
 6UUsEVXl8dcAwtsGpEQ4be8tzBNVlVqFR/dHUws6kyBu1YvtpkQhwwKUxloNwWR9R/
 IGSdHN0MxrYLaSCkpAV78+BdMxg3sCNdQTC9sRmKmYWFLMqIw4rrFCZRyV7KRJtd2E
 0j73lXtusTnleqcS0NxrPxjaCD0MHAoeWaeskbB4i7ET3pELASmMynDmabvpgju8s5
 lM5kWnUgAXLXzxzcI7AEuaVKCn3OYtKdR4/uhCwyRJ5lqmW3Ng5o+Qj0VkMX0rxdf6
 342H5Q7Nz/erA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Jul 2025 15:00:24 +0200
Message-Id: <DB3AFTUC22W1.39C4DMWSENZGB@kernel.org>
Subject: Re: [PATCH v13 3/5] rust: replace `CStr` with `core::ffi::CStr`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Michal Rostecki"
 <vadorovsky@protonmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <davidgow@google.com>, "Rae Moar" <rmoar@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt"
 <justinstitt@google.com>, "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit"
 <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Arnd Bergmann" <arnd@arndb.de>, "Jens
 Axboe" <axboe@kernel.dk>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Dave Ertman" <david.m.ertman@intel.com>, "Ira
 Weiny" <ira.weiny@intel.com>, "Leon Romanovsky" <leon@kernel.org>, "Breno
 Leitao" <leitao@debian.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <llvm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-block@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-3-29f7d3eb97a6@gmail.com>
In-Reply-To: <20250701-cstr-core-v13-3-29f7d3eb97a6@gmail.com>
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

On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> `kernel::ffi::CStr` was introduced in commit d126d2380131 ("rust: str:
> add `CStr` type") in November 2022 as an upstreaming of earlier work
> that was done in May 2021[0]. That earlier work, having predated the
> inclusion of `CStr` in `core`, largely duplicated the implementation of
> `std::ffi::CStr`.
>
> `std::ffi::CStr` was moved to `core::ffi::CStr` in Rust 1.64 in
> September 2022. Hence replace `kernel::str::CStr` with `core::ffi::CStr`
> to reduce our custom code footprint, and retain needed custom
> functionality through an extension trait.
>
> C-String literals were added in Rust 1.77, while our MSRV is 1.78. Thus
> opportunistically replace instances of `kernel::c_str!` with C-String
> literals where other code changes were already necessary or where
> existing code triggered clippy lints; the rest will be done in a later
> commit.
>
> Link: https://github.com/Rust-for-Linux/linux/commit/faa3cbcca03d0dec8f8e=
43f1d8d5c0860d98a23f [0]
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs |   2 +-
>  rust/kernel/auxiliary.rs        |   4 +-
>  rust/kernel/configfs.rs         |   4 +-
>  rust/kernel/cpufreq.rs          |   2 +-
>  rust/kernel/device.rs           |   4 +-
>  rust/kernel/drm/device.rs       |   4 +-
>  rust/kernel/error.rs            |   4 +-
>  rust/kernel/firmware.rs         |  11 +-
>  rust/kernel/kunit.rs            |   6 +-
>  rust/kernel/miscdevice.rs       |   2 +-
>  rust/kernel/net/phy.rs          |   2 +-
>  rust/kernel/of.rs               |   2 +-
>  rust/kernel/prelude.rs          |   5 +-
>  rust/kernel/seq_file.rs         |   4 +-
>  rust/kernel/str.rs              | 394 +++++++++++-----------------------=
------
>  rust/kernel/sync/condvar.rs     |   2 +-
>  rust/kernel/sync/lock.rs        |   2 +-
>  rust/kernel/sync/lock/global.rs |   2 +-
>  samples/rust/rust_configfs.rs   |   2 +-
>  19 files changed, 140 insertions(+), 318 deletions(-)

Is it also possible to split this? First rename the existing functions
on our CStr to match upstream & then you don't need to do the rename &
removal of our CStr in the same patch?

---
Cheers,
Benno
