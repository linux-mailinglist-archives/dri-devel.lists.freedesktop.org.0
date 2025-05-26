Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F4AC420F
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 17:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD5010E3BB;
	Mon, 26 May 2025 15:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o+rC3Qza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A402810E3A2;
 Mon, 26 May 2025 15:05:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AF10549D88;
 Mon, 26 May 2025 15:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF23C4CEE7;
 Mon, 26 May 2025 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748271948;
 bh=ao1QQaXy2vs9T7bnqTuqdmhNzhRdF1NoeYJffk+Q+f8=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=o+rC3Qza/LbfuSE/sViz8vCK2OakU/ZSOOEhpdsbuDUkJz3KhyeyuH4lAXt+DkLW3
 IhPPZZimWUrHQs8pkRzEJZ70CPLO+E/h6gaIEVyUN4sT5UrQ4Q6rcKjOnc6qg5c/Rj
 k3xtvN15UsbnjHAoyF2gU0LzDpN9+FVs0P/2aYS78ogS8WDh+BtHZ33BZFyGdDMQKv
 EHpTLrOGJnmnrjeARLBQy+a7Y4NJaPxQPK9fZmWsP/m2gBphMGpcSS0QEQIScDx4SB
 go6XOZ+ZHKgsykSwU25gaoSP73QOlegk6xWmFOV6P0hMylvrDEAuHTQnqD+eoF9KCH
 BNRs/vnIQFasA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 17:05:36 +0200
Message-Id: <DA66OFXQCWUK.31LM78DIVABZV@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <llvm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-block@vger.kernel.org>
Subject: Re: [PATCH v10 5/5] rust: remove core::ffi::CStr reexport
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
 <kwilczynski@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-5-6412a94d9d75@gmail.com>
In-Reply-To: <20250524-cstr-core-v10-5-6412a94d9d75@gmail.com>
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

On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> Clean up references to `kernel::str::CStr`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs   |  3 ++-
>  drivers/gpu/nova-core/firmware.rs |  2 +-
>  drivers/net/phy/ax88796b_rust.rs  |  1 +
>  drivers/net/phy/qt2025.rs         |  1 +
>  rust/kernel/device.rs             |  3 +--
>  rust/kernel/driver.rs             |  4 ++--
>  rust/kernel/error.rs              |  6 ++----
>  rust/kernel/faux.rs               |  5 ++++-
>  rust/kernel/firmware.rs           | 15 ++++-----------
>  rust/kernel/kunit.rs              |  6 +++---
>  rust/kernel/lib.rs                |  2 +-
>  rust/kernel/miscdevice.rs         |  3 +--
>  rust/kernel/net/phy.rs            |  4 +++-
>  rust/kernel/of.rs                 |  3 ++-
>  rust/kernel/pci.rs                |  2 +-
>  rust/kernel/platform.rs           |  2 +-
>  rust/kernel/prelude.rs            |  5 +----
>  rust/kernel/str.rs                | 22 ++++++++++------------
>  rust/kernel/sync/condvar.rs       |  4 ++--
>  rust/kernel/sync/lock.rs          |  4 ++--
>  rust/kernel/sync/lock/global.rs   |  5 +++--
>  rust/kernel/sync/poll.rs          |  1 +
>  rust/kernel/workqueue.rs          |  1 +
>  rust/macros/module.rs             |  2 +-
>  24 files changed, 51 insertions(+), 55 deletions(-)

Haven't compile tested this series yet, but this commit seems to suggest
to me that some of the previous commits introduced code that doesn't
compile or emits warnings? If so that needs to be fixed.

---
Cheers,
Benno
