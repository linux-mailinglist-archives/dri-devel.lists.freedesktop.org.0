Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E4B115BC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 03:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D99D10E111;
	Fri, 25 Jul 2025 01:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m1Rk3hWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A846A10E0C2;
 Fri, 25 Jul 2025 01:21:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4CF755C6964;
 Fri, 25 Jul 2025 01:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5D7C4CEF6;
 Fri, 25 Jul 2025 01:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753406486;
 bh=MwqHEfaufpCZenjp6i2XUuWCEA4wM5dG9Nbu1j4rcuc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=m1Rk3hWsOdacTaqRQmyKq2WcAz4JOiCCmafCCpJZccGewpWk5tGPQ8vUmkzPGQNtx
 Nae3LJoRHEwKyp1nMtsPRvccMrdF64rL2Kwoq4uUk9osiNEPUvWp858ZzH2tvAnyKp
 L57gcyS169BmwAj5aTWef7sjQKz2aikszYiwkniZivAlFvilRhoL07uCJePxeU0z7D
 6mediv7gl4GjUtxouU0P4vAmIV3kWOuq+zyrSkJWTedoI/jwOQxK2WKce1EjRxufSD
 UdcrsM6goolXixPwQPkVuanLvYRSH+rGkJrILKsKqPPuKKhZkRK51RqEMAWbC+nVoY
 t8BHUQy0d00Lw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-core-cstr-cstrings-v1-4-027420ea799e@gmail.com>
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
 <20250710-core-cstr-cstrings-v1-4-027420ea799e@gmail.com>
Subject: Re: [PATCH 04/17] rust: clk: replace `kernel::c_str!` with C-Strings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
To: Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Benno Lossin <lossin@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 Breno Leitao <leitao@debian.org>, Danilo Krummrich <dakr@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, David Airlie <airlied@gmail.com>,
 David Gow <davidgow@google.com>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Leon Romanovsky <leon@kernel.or g>, Luis Chamberlain <mcgrof@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rae Moar <rmoar@google.com>,
 Rafael J. Wysocki <rafael@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Russell King <linux@armlinux.org.uk>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Trevor Gross <tmgross@umich.edu>, Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 24 Jul 2025 18:21:24 -0700
Message-ID: <175340648493.3513.9465215631125389438@lazor>
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

Quoting Tamir Duberstein (2025-07-10 08:31:07)
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
