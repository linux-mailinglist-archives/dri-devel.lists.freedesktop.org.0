Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5841B01C45
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A891810E2AD;
	Fri, 11 Jul 2025 12:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IJDmPs2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC6C10E284;
 Fri, 11 Jul 2025 12:44:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 18F51613AC;
 Fri, 11 Jul 2025 12:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244B9C4CEED;
 Fri, 11 Jul 2025 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752237860;
 bh=teZJaqxYI5b4Zi5Q3t/5mosyvGb3FX+DYiKRW0d6N6s=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=IJDmPs2c3NbqO3wxva11UXJLk9zZYU+B2fZtvtfwnFwoEOyxy64podMGkXpF4Srr3
 3GctEfA87rhazleam3+lU8Q7ILT1r5aaQAIGUeaQMKwml83rX69qG61ch5ThQyXrfr
 gPjD9Nb7q3B3sHaOfG16wjiXJpZwHmHh4BnSbqysc8Xl91V0iLPjwhf5mZ4Ii3AJr3
 ALKh/mpgnKqGHTLc+6he887VpV6qrxjkJe0D57+XI880GRuTPANwid4VbJbkUPpjyl
 umhId6gP+TabFKBnQ2H8FvO2WONWNIJtxCD87joyUgyy0ukGUP/qAUsGwkTBOM2wb6
 qUYmv0wyaRYhQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 14:44:09 +0200
Message-Id: <DB98H7EGG96J.2FC3ZWDENYWW5@kernel.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <linux-block@vger.kernel.org>
Subject: Re: [PATCH 00/17] rust: replace `kernel::c_str!` with C-Strings
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Breno Leitao" <leitao@debian.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, "Brendan Higgins" <brendan.higgins@linux.dev>,
 "David Gow" <davidgow@google.com>, "Rae Moar" <rmoar@google.com>, "Jens
 Axboe" <axboe@kernel.dk>
X-Mailer: aerc 0.20.1
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
In-Reply-To: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
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

On Thu Jul 10, 2025 at 5:31 PM CEST, Tamir Duberstein wrote:
> This series depends on step 3[0] which depends on steps 2a[1] and 2b[2]
> which both depend on step 1[3].
>
> This series also has a minor merge conflict with a small change[4] that
> was taken through driver-core-testing. This series is marked as
> depending on that change; as such it contains the post-conflict patch.
>
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the previous series must go).
>
> Link  https://lore.kernel.org/all/20250710-cstr-core-v14-0-ca7e0ca82c82@g=
mail.com/ [0]
> Link: https://lore.kernel.org/all/20250709-core-cstr-fanout-1-v1-0-64308e=
7203fc@gmail.com/ [1]
> Link: https://lore.kernel.org/all/20250709-core-cstr-fanout-1-v1-0-fd793b=
3e58a2@gmail.com/ [2]
> Link: https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a915240=
37783@gmail.com/ [3]
> Link: https://lore.kernel.org/all/20250704-cstr-include-aux-v1-1-e1a404ae=
92ac@gmail.com/ [4]
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (17):
>       drivers: net: replace `kernel::c_str!` with C-Strings
>       gpu: nova-core: replace `kernel::c_str!` with C-Strings
>       rust: auxiliary: replace `kernel::c_str!` with C-Strings
>       rust: clk: replace `kernel::c_str!` with C-Strings
>       rust: configfs: replace `kernel::c_str!` with C-Strings
>       rust: cpufreq: replace `kernel::c_str!` with C-Strings
>       rust: device: replace `kernel::c_str!` with C-Strings
>       rust: firmware: replace `kernel::c_str!` with C-Strings
>       rust: kunit: replace `kernel::c_str!` with C-Strings
>       rust: macros: replace `kernel::c_str!` with C-Strings
>       rust: miscdevice: replace `kernel::c_str!` with C-Strings
>       rust: net: replace `kernel::c_str!` with C-Strings
>       rust: pci: replace `kernel::c_str!` with C-Strings
>       rust: platform: replace `kernel::c_str!` with C-Strings
>       rust: seq_file: replace `kernel::c_str!` with C-Strings
>       rust: str: replace `kernel::c_str!` with C-Strings
>       rust: sync: replace `kernel::c_str!` with C-Strings
>
>  drivers/block/rnull.rs                |  2 +-
>  drivers/cpufreq/rcpufreq_dt.rs        |  5 ++---
>  drivers/gpu/drm/nova/driver.rs        | 10 +++++-----
>  drivers/gpu/nova-core/driver.rs       |  6 +++---
>  drivers/net/phy/ax88796b_rust.rs      |  7 +++----
>  drivers/net/phy/qt2025.rs             |  5 ++---
>  rust/kernel/clk.rs                    |  6 ++----
>  rust/kernel/configfs.rs               |  5 ++---
>  rust/kernel/cpufreq.rs                |  3 +--
>  rust/kernel/device.rs                 |  4 +---
>  rust/kernel/firmware.rs               |  6 +++---
>  rust/kernel/kunit.rs                  | 11 ++++-------
>  rust/kernel/net/phy.rs                |  6 ++----
>  rust/kernel/platform.rs               |  4 ++--
>  rust/kernel/seq_file.rs               |  4 ++--
>  rust/kernel/str.rs                    |  5 ++---
>  rust/kernel/sync.rs                   |  5 ++---
>  rust/kernel/sync/completion.rs        |  2 +-
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
>  28 files changed, 63 insertions(+), 81 deletions(-)

For the entire series:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
