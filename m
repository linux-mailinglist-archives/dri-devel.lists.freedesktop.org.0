Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F05AE2C9B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 23:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3029810E150;
	Sat, 21 Jun 2025 21:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jXNthaeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5202E10E150;
 Sat, 21 Jun 2025 21:17:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 51AA261129;
 Sat, 21 Jun 2025 21:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF4DC4CEE7;
 Sat, 21 Jun 2025 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750540629;
 bh=ZmTQYCTt6FpeXJobXvGHGrkckGX2zkqbJORyKVTdPZ8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jXNthaeCkH8WUGPQKoQGzy2fRj9hCnJcYGtWtzRFpZuDba0pqwmDxhCwgGnIuzzA1
 c15Dv1Qi1qtqqC8qI/P0vIS1/OMORDzmteZ9xIajZbOb/b+5eQf4BwOVVSeyNdjKxS
 ZQbuAYfjkXAvA8vGsQv8FsSm836IvTGTPDcgPtpG9wWbVkydvEgPBbIfztmIfqq04a
 cuLZHgVHmgyr6xjFb2llW7fp0PUsgdNuLJyMGQ2d5sUFi/quLKPFi9sLlUxSpZ9HKX
 37ejW0Od87/cdirzu4bxTNYVO8OYMRQPxn0lO8rADA8ffHYpkG9U26Vs8ZgebFBEdL
 y8fF7nT/yAwww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
 <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>
Subject: Re: [PATCH v12 4/5] rust: replace `kernel::c_str!` with C-Strings
From: Stephen Boyd <sboyd@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
To: Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Benno Lossin <lossin@kernel.org>,
 Bill Wendling <morbo@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 Breno Leitao <leitao@debian.org>, Danilo Krummrich <dakr@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, David Airlie <airlied@gmail.com>,
 David Gow <davidgow@google.com>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Ira Weiny <ira.weiny@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Justin Stitt <justinstitt@goo
 gle.com>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Rae Moar <rmoar@google.com>, Rafael J. Wysocki <rafael@kernel.org>,
 Rob Herring <robh@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@google.com>,
 Simona Vetter <simona@ffwll.ch>, Tamir Duberstein <tamird@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Trevor Gross <tmgross@umich.edu>,
 Viresh Kumar <viresh.kumar@linaro.org>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Date: Sat, 21 Jun 2025 14:17:08 -0700
Message-ID: <175054062889.4372.13449788582456522444@lazor>
User-Agent: alot/0.11
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

Quoting Tamir Duberstein (2025-06-19 08:06:28)
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible and rename
> `kernel::c_str!` to `str_to_cstr!` to clarify its intended use.
>=20
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---

For clk part

>  rust/kernel/clk.rs                    |  6 ++----

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
