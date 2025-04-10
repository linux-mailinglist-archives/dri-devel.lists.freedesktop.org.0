Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2CA8504B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1150710EA84;
	Thu, 10 Apr 2025 23:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dYoDcK7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FDA10EA84
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:56:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3F0045236;
 Thu, 10 Apr 2025 23:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C26C4CEDD;
 Thu, 10 Apr 2025 23:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744329373;
 bh=ypD3tbVfNfiKCDvd6kLsFR1P1XnGv4zvSm/5cC9ekJw=;
 h=From:To:Cc:Subject:Date:From;
 b=dYoDcK7ZQ4Iel6blYUQ1dqHUBz0P5YDChT5uH28/rfRIPnpzQx0zAnRkXrwgDdni6
 +ATqu46FyIzPBdo54NiGGT4QYyt8LNaKPKquTbuMc3Y8nb3rVsN7Z6k8qMLHLAXi9e
 VD1DdmdVynOUqEQWPJZCjMCCLZ31u6PCSfAvx9aNlqV0A7XPeNkf+f9XooBAILxLXl
 slr7WCdkiCstKd9ATBvgEwwyZ4AcMsWK62hQOu7GfOt5z5WWhmtisxvHiAtXuk79j1
 nATSsuZ71FNEaa8FInSU8Cd3Da/XRxyy4fsnrEYXVQJzDT0rDrlaZl9/d9vnIzX+Uw
 r7qb8UI1N+2SA==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 alyssa@rosenzweig.io
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/8] DRM Rust abstractions
Date: Fri, 11 Apr 2025 01:55:19 +0200
Message-ID: <20250410235546.43736-1-dakr@kernel.org>
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

Compared to the original work from Lina, the patches in this series contain the
following modifications.

  - "rust: drm: ioctl: Add DRM ioctl abstraction"
      * wrap IOCTL data in Opaque<T> to avoid UB when creating a reference
      * original source archive: https://archive.is/LqHDQ

  - "rust: drm: add driver abstractions" (newly created)
      * Remove unnecessary DRM features
      * add #[expect(unused)] to avoid warnings
      * add sealed trait
      * original source archive: https://archive.is/Pl9ys

  - "rust: drm: add device abstraction" (newly created)
      * full rewrite of the drm::Device abstraction using the subclassing
        pattern
      * original source archive: http://archive.today/5NxBo

  - "rust: drm: add DRM driver registration" (newly created)
      * move VTABLE to drm::Device to prevent use-after-free bugs; VTABLE
        needs to be bound to the lifetime of drm::Device, not the
        drm::Registration
      * combine new() and register() to get rid of the registered boolean
      * remove file_operations
      * move struct drm_device creation to drm::Device
      * introduce Devres
      * original source archive: https://archive.is/Pl9ys

  - "rust: drm: file: Add File abstraction"
      * switch to the Opaque<T> type
      * fix (mutable) references to struct drm_file (which in this
        context is UB)
      * restructure and rename functions to align with common kernel
        schemes
      * write and fix safety and invariant comments
      * remove necessity for and convert 'as' casts
      * original source archive: https://archive.is/GH8oy

  - "rust: drm: gem: Add GEM object abstraction"
       * switch to the Opaque<T> type
       * fix (mutable) references to struct drm_gem_object (which in this
         context is UB)
       * drop all custom reference types in favor of AlwaysRefCounted
       * bunch of minor changes and simplifications (e.g. IntoGEMObject
         trait)
       * write and fix safety and invariant comments
       * remove necessity for and convert 'as' casts
       * original source archive: https://archive.is/dD5SL

A full diff between this series and the original work can be found in [1].

This patch series is also available in [2]; an example usage from nova-drm can
be found in [3].

[1] https://pastebin.com/qLBCfgTc
[2] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[3] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm

Changes in v2:
  - IOCTL: wrap data in Opaque<T> to avoid UB when creating a reference
  - driver: remove unnecessary FEATURE flags
  - driver: remove date field
  - MAINTAINERS: add files to both DRM and DRM MISC
  - change primary authorship of most patches

Asahi Lina (6):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: drm: add driver abstractions
  rust: drm: add device abstraction
  rust: drm: add DRM driver registration
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (2):
  drm: drv: implement __drm_dev_alloc()
  MAINTAINERS: add DRM Rust source files to DRM DRIVERS

 MAINTAINERS                     |   2 +
 drivers/gpu/drm/drm_drv.c       |  58 ++++--
 include/drm/drm_drv.h           |   5 +
 rust/bindings/bindings_helper.h |   6 +
 rust/helpers/drm.c              |  19 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/device.rs       | 195 +++++++++++++++++++
 rust/kernel/drm/driver.rs       | 170 +++++++++++++++++
 rust/kernel/drm/file.rs         |  99 ++++++++++
 rust/kernel/drm/gem/mod.rs      | 321 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 161 ++++++++++++++++
 rust/kernel/drm/mod.rs          |  19 ++
 rust/kernel/lib.rs              |   2 +
 rust/uapi/uapi_helper.h         |   1 +
 14 files changed, 1043 insertions(+), 16 deletions(-)
 create mode 100644 rust/helpers/drm.c
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/driver.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs

-- 
2.49.0

