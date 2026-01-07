Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0DCFE7B7
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E4910E2A0;
	Wed,  7 Jan 2026 15:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LnmnRkXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BF510E2A0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767798599;
 bh=rJaqvOB8/875SKmK7dTBqU4qyFZchqY4Kmbj5roEflw=;
 h=From:Subject:Date:To:Cc:From;
 b=LnmnRkXnQNe1UnB0hMqYpQRqFTI6QfwNN3MV5sH8fGUIQPJFt5Goe1ISJWNT5I48c
 0CUrGVe0NSoMAwjGGkwkvgUylrysHJq+bzq5gb+iMhRFHaMwRLdVZx1VDU7z1VSImH
 mHSCZISTSmr24CLvcNa0I5sdP4vFS+holZI3tcgDA7sCwtb4Ybg4c4H2tkiSRkTCX2
 ae8xmUWzSdOPoSg34EThmEzyjWOn1AhreRUsZHchab3/AfvulkkZ9YHHIG7LMdJfcS
 HJbWdCSybK/SQ5tCFnD8lLo4hiZ2yV8gxk4WklOp2UTmAGYVpop6yz5ciPnyPa8M+5
 B6hFEa1P6pe8g==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F2FB117E13D8;
 Wed,  7 Jan 2026 16:09:54 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v3 0/3] Clk improvements
Date: Wed, 07 Jan 2026 12:09:51 -0300
Message-Id: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD93XmkC/6WQzW7DIBCEX8XiXCoWjAk+9T2qHPhZGtTYJECtW
 lHevSSu1Ko59jgrzbczcyEFc8RCxu5CMi6xxDQ3IZ464g5mfkMafdOEMy6ZZpq64zut6wlpqaY
 idQyMUd5LCZ400yljiJ934Ou+6ZDTROsho/nBKP6AWYAC3enBSrGDISj74tLxaGzK5tml6UY+x
 FJTXu9JF37j/4e29QH2YOWUUbBaOQBrBwF/rPvrVjLj+aONVbemxJrStkjTFOvYaeOwV1IY2b5
 YxkGDlz3q4IMKGoVv151ES36PPHbfE/f3SAVnT8s6OypcMCr0CA75uIiW4PoFV/nla7YBAAA=
X-Change-ID: 20250909-clk-type-state-c01aa7dd551d
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3
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

This series contains a few improvements that simplifies clock handling for
drivers.

Patch 1 implements the same typestate pattern that has been used
successfully for Regulators. This is needed because otherwise drivers
will be responsible for unpreparing and disabling clocks themselves and
ultimately handling the reference counts on their own. This is
undesirable. The patch automatically encodes this information using the
type system so that no misuse can occur.

Patch 2 makes things more convenient by offering devres-managed APIs. This
lets drivers set clock parameters once and forget about lifetime
management.

Patch 3 converts clk.rs to the newer kernel-vertical style in order to make
future changes easier.

This depends on Alice Ryhl's series [0].

[0]: https://lore.kernel.org/rust-for-linux/20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com/

---
Changes in v3:
- Rebased on top of 6.19-rc4
- Dropped patch 1 (from Alice), added her series as a dependency instead
- Fixed Tyr, PWM_TH1520 drivers
- Changed clk.rs imports to kernel-vertical style
- Added support get_optional shortcut for Prepared and Enabled (i.e.:
  Clk::<Enabled>::get_optional())
- Fixed misplaced #[inline] tag

Thanks, Danilo {
  - Moved the devres changes into its own patch
  - Require &Device<Bound> for all functions where a &Device is used
  - Account for con_in in SAFETY comments where applicable
  - Added backticks
}

- Link to v2: https://lore.kernel.org/r/20250910-clk-type-state-v2-0-1b97c11bb631@collabora.com

Changes in v2:
- Added Alice's patch as patch 1, since it is a dependency.
- Added devm helpers (like we did for Regulator<T>)
- Fixed missing clk_put() call in Drop (Danilo)
- Fixed missing parenthesis and wrong docs (Viresh)
- Removed extra "dev" parameter from "shutdown" example (Danilo)
- Removed useless type annotation from example (Danilo)
- Link to v1: https://lore.kernel.org/rust-for-linux/20250729-clk-type-state-v1-1-896b53816f7b@collabora.com/#r

---
Daniel Almeida (3):
      rust: clk: use the type-state pattern
      rust: clk: add devres-managed clks
      rust: clk: use 'kernel vertical style' for imports

 drivers/cpufreq/rcpufreq_dt.rs |   2 +-
 drivers/gpu/drm/tyr/driver.rs  |  31 +--
 drivers/pwm/pwm_th1520.rs      |  17 +-
 rust/kernel/clk.rs             | 466 +++++++++++++++++++++++++++++------------
 rust/kernel/cpufreq.rs         |   8 +-
 5 files changed, 346 insertions(+), 178 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20250909-clk-type-state-c01aa7dd551d
prerequisite-change-id: 20250904-clk-send-sync-3cfa7f4e1ce2:v3
prerequisite-patch-id: 13476f9e7e7c3bdbcab42912948953743381b1e0
prerequisite-patch-id: 8f91583384bb4516afcac66d21ac08b3982747b2
prerequisite-patch-id: b2ad5ecbd9a395b622bc04f891b5bb276f6f6b16

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

