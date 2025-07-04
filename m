Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0FAF9363
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D87810EA2F;
	Fri,  4 Jul 2025 13:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VTZQCGwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4B510EA2F;
 Fri,  4 Jul 2025 13:01:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5996EA53BFB;
 Fri,  4 Jul 2025 13:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA72C4CEE3;
 Fri,  4 Jul 2025 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751634099;
 bh=1SFIg86ScSSNsm00r4z39bxOC+QdfD7ofZFsNo39Gyw=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=VTZQCGwhAN+TexmrabJGl6LSW4Xumo1b3iyodJcqKKb2S+NtuyH0wgV0XP9jPivaQ
 QuIqn8AtkfhK0+gKQ1ejE0AWPSMFd9C0sa8nLfuIly2BzdyUP8Px0ho4oMaC2LnN3l
 4lB1zV53g1wSLGMaKO1dWQLG5r1vqzj/k5z4JY4BdlXr5S/IsxRkvkdm+tgkf2VgOx
 fZqh+B/8T9b4HB0rnSrjSrFm90CAihtJ2cuZ6KUhRJXNxo5H/Hqv9zo/6d3q3R8XPw
 gK1OTk3fERiW0Prtx9CO8/vhuUS5bARcvhok3yE2TSbAXA89qvtD+iuArw73v2kZOz
 bKOGfZaX9sCWQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Jul 2025 15:01:23 +0200
Message-Id: <DB3AGL1QO4M4.2HANWHX9TF9WN@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <llvm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-block@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v13 4/5] rust: replace `kernel::c_str!` with C-Strings
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
X-Mailer: aerc 0.20.1
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-4-29f7d3eb97a6@gmail.com>
In-Reply-To: <20250701-cstr-core-v13-4-29f7d3eb97a6@gmail.com>
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
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible and rename
> `kernel::c_str!` to `str_to_cstr!` to clarify its intended use.

These two things can also be split? And it should also be possible to do
this by-subsystem, right?

---
Cheers,
Benno

> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/block/rnull.rs                |  2 +-
>  drivers/cpufreq/rcpufreq_dt.rs        |  5 ++---
>  drivers/gpu/drm/nova/driver.rs        | 10 +++++-----
>  drivers/gpu/nova-core/driver.rs       |  6 +++---
>  drivers/net/phy/ax88796b_rust.rs      |  7 +++----
>  drivers/net/phy/qt2025.rs             |  5 ++---
>  rust/kernel/clk.rs                    |  6 ++----
>  rust/kernel/configfs.rs               |  9 +++++----
>  rust/kernel/cpufreq.rs                |  3 +--
>  rust/kernel/devres.rs                 |  2 +-
>  rust/kernel/drm/ioctl.rs              |  2 +-
>  rust/kernel/firmware.rs               |  6 +++---
>  rust/kernel/kunit.rs                  | 14 ++++++--------
>  rust/kernel/net/phy.rs                |  6 ++----
>  rust/kernel/platform.rs               |  4 ++--
>  rust/kernel/str.rs                    | 24 ++++++++++++++++--------
>  rust/kernel/sync.rs                   |  7 +++----
>  rust/kernel/sync/completion.rs        |  2 +-
>  rust/kernel/sync/lock/global.rs       |  3 ++-
>  rust/kernel/workqueue.rs              |  8 ++++----
>  rust/macros/kunit.rs                  | 10 +++++-----
>  rust/macros/module.rs                 |  2 +-
>  samples/rust/rust_configfs.rs         |  5 ++---
>  samples/rust/rust_driver_auxiliary.rs |  4 ++--
>  samples/rust/rust_driver_faux.rs      |  4 ++--
>  samples/rust/rust_driver_pci.rs       |  4 ++--
>  samples/rust/rust_driver_platform.rs  |  4 ++--
>  samples/rust/rust_misc_device.rs      |  3 +--
>  scripts/rustdoc_test_gen.rs           |  4 ++--
>  29 files changed, 84 insertions(+), 87 deletions(-)
