Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B08A70DD0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8659D10E62E;
	Tue, 25 Mar 2025 23:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n4lrI9xS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3C10E62E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 23:56:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 208715C5D3F;
 Tue, 25 Mar 2025 23:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516E3C4CEE4;
 Tue, 25 Mar 2025 23:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742946956;
 bh=wHi7SCmtPH7BG/xAKxNRXbpGfNZECeqRL1JQGN1ovng=;
 h=From:To:Cc:Subject:Date:From;
 b=n4lrI9xSqetPPY37bE7q/8e8cgZl+FZy2LEvD3RLuCi3szuRcWkJkAs7g9JdZ46+W
 FIUaTIPgcMiSH6UlG+kiC5g68eZhHHf+xxvMoDrBT6vP/EqEHDpdwKC5A0O0zMUtzT
 FUSi0zlt4ZG/5Q8NwG3xFSXT62ZJVpVGM6Rxm65jL31ovSQMRa3aIha2nSsD4xunMz
 EsGdRLOPGqPR/gtYVexJ9EPz44FxFX6ujmVwbIIMerH/0VQ3m6D2/TY9HhU/1wb+bS
 z7mu062Jy83xybdxmGDW1dvZ5vIspSaBCU2hvl5p2FcXtKqi8/k3T7hZhYASo2GIoP
 +7gw1oTb58j6w==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, lina@asahilina.net, daniel.almeida@collabora.com,
 j@jannau.net
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/8] DRM Rust abstractions
Date: Wed, 26 Mar 2025 00:54:27 +0100
Message-ID: <20250325235522.3992-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

This is the series for the initial DRM Rust abstractions, including DRM device /
driver, IOCTL, File and GEM object abstractions.

This series has been posted previously, however this is a long time ago and I
reworked a lot of things quite heavily. Hence, I decided to post this as a whole
new series.

Besides the rework, I want to credit Lina for her initial work, which this
series is based on.

In a private mail Lina told me to "feel free to take anything that's useful
from my past patch submissions or the downstream branches and use it/submit it
in any way".

@Lina: If you, however, feel uncomfortable with any of the Co-developed-by:
tags, due to the major changes, please let me know.

Those changes include:
  - switch to the subclassing pattern for DRM device
  - rework of the GEM object abstraction; dropping the custom reference types in
    favor of AlwaysRefCounted
  - rework of the File abstractions
  - rework of the driver registration
  - lots of minor changes (e.g. to better align with existing abstractions)

This patch series is also available in [1]; an example usage from nova-drm can
be found in [2] and [3].

[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[2] https://lore.kernel.org/nouveau/20250325232222.5326-1-dakr@kernel.org/
[3] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm

Asahi Lina (1):
  rust: drm: ioctl: Add DRM ioctl abstraction

Danilo Krummrich (7):
  drm: drv: implement __drm_dev_alloc()
  rust: drm: add driver abstractions
  rust: drm: add device abstraction
  rust: drm: add DRM driver registration
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction
  MAINTAINERS: add DRM Rust source files to DRM DRIVERS

 MAINTAINERS                     |   1 +
 drivers/gpu/drm/drm_drv.c       |  58 ++++--
 include/drm/drm_drv.h           |   5 +
 rust/bindings/bindings_helper.h |   6 +
 rust/helpers/drm.c              |  19 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/device.rs       | 195 +++++++++++++++++++
 rust/kernel/drm/driver.rs       | 194 +++++++++++++++++++
 rust/kernel/drm/file.rs         |  99 ++++++++++
 rust/kernel/drm/gem/mod.rs      | 321 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 159 ++++++++++++++++
 rust/kernel/drm/mod.rs          |  19 ++
 rust/kernel/lib.rs              |   2 +
 rust/uapi/uapi_helper.h         |   1 +
 14 files changed, 1064 insertions(+), 16 deletions(-)
 create mode 100644 rust/helpers/drm.c
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/driver.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs

-- 
2.49.0

