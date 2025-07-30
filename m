Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2FB160FB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8110E364;
	Wed, 30 Jul 2025 13:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CBHRoL/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250A510E364
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:07:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C860B444CB;
 Wed, 30 Jul 2025 13:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86555C4CEE7;
 Wed, 30 Jul 2025 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753880847;
 bh=pi2a7GnrhCAqcsm+sfSbg+NpUqiSUzYvwlb+GLh/v0A=;
 h=From:To:Cc:Subject:Date:From;
 b=CBHRoL/icwQ6+Mnzy0gpLoncSiBBNfdVoReTQsgdMr7uWpY5SpiLhN5LjydwTPqhS
 gkoReMcZez/a8Y7ioc+6oPbNMjFK8yb7PI+GIk0MxRR3TXxdohex09/XLKVavKm5jA
 oAwgarUCyCu0XTnRnJWkloO16Zhf6BhYL9tYjTtGtakRoMCYpxF1mCC+uadNRHjRTG
 zSjh0vWLFgyBcveit5PvjiuqrMYfxW0idDa61w5ek9kNIlRAZKEjKm3X02H8cas8Nc
 /JMpBSIk44M12REke/StKsklFhnzRM++4Pmqpx4Q2bExGHiM3JePsKAPSzakzTL2D3
 Kle0SI7wP4qyQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: [PATCH 0/3] Fix broken `srctree/` links and warn about them
Date: Wed, 30 Jul 2025 15:07:13 +0200
Message-ID: <20250730130716.3278285-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This fixes a handful of broken links and introduces a warning to
prevent them from happening in the future.

Relatedly, we could also perhaps check the other side of the links, but
perhaps there are cases we want to customize. Alternatively, we could
also in the future introduce custom syntax for these that avoids
repetition or a fancier preprocessing step.

Miguel Ojeda (3):
  rust: block: fix `srctree/` links
  rust: drm: fix `srctree/` links
  rust: warn if `srctree/` links do not exist

 rust/Makefile                    | 6 ++++++
 rust/kernel/block/mq/gen_disk.rs | 2 +-
 rust/kernel/drm/device.rs        | 2 +-
 rust/kernel/drm/driver.rs        | 2 +-
 rust/kernel/drm/file.rs          | 2 +-
 rust/kernel/drm/gem/mod.rs       | 2 +-
 rust/kernel/drm/ioctl.rs         | 2 +-
 7 files changed, 12 insertions(+), 6 deletions(-)

--
2.50.1
