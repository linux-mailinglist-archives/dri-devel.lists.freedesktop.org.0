Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57364B298C1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 07:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F2910E1B8;
	Mon, 18 Aug 2025 05:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="dWgl2Usu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC53910E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 05:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1755493472; x=1755752672;
 bh=jEQAaK9Pets3hssO/fi53mYdtmA343wdOCnraQfN9/Y=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dWgl2UsugaJs33UHlsdA1serCGEurYv5KKXy6zSkaYC+C6tAa+BE2crcJlo0H33WZ
 X4GuXZEgTpTmt7JTmVhoz34VqydfIFPcUDv1i2EZdb7bdrvJz1LCj0BzRaaG/GxCHv
 sceoPL5+YSAmqIPt9PLL1EP/raKd0KzwxdR6VCeYFeY79UDvAkTvSWb/Le7XMfFP4r
 fNxTli/Irco62lK8vlMtXRUYxNPT6byxTmDXOxa6tPnX1wqxSUjEUmv16xNVvYA4uW
 jbfgYotZsN5ePJfFGMkqVzxNxQlTVVTLl1YG0WAQLJMgH+gOfaB9SGd7PUsSJJjWs5
 uRGA1VWw7GwgA==
Date: Mon, 18 Aug 2025 05:04:28 +0000
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [RFC PATCH 1/3] rust: drm: fix C header references in doc comments
Message-ID: <20250818050251.102399-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 44abf02de46a53657233ff0e97434b16d050fe17
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

The Rust DRM abstractions would incorrectly reference headers using the
non-existent path include/linux/drm. Correct the path to include/drm.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
Fixes: 07c9016085f9 ("rust: drm: add driver abstractions")
Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
Fixes: a98a73be9ee9 ("rust: drm: file: Add File abstraction")
Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")
---
 rust/kernel/drm/device.rs  | 2 +-
 rust/kernel/drm/driver.rs  | 2 +-
 rust/kernel/drm/file.rs    | 2 +-
 rust/kernel/drm/gem/mod.rs | 2 +-
 rust/kernel/drm/ioctl.rs   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3bb7c83966cf..88787a32045f 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -2,7 +2,7 @@
=20
 //! DRM device.
 //!
-//! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm=
/drm_device.h)
+//! C header: [`include/drm/drm_device.h`](srctree/include/drm/drm_device.=
h)
=20
 use crate::{
     bindings, device, drm,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index fe7e8d06961a..d2dad77274c4 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -2,7 +2,7 @@
=20
 //! DRM driver core.
 //!
-//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/dr=
m_drv.h)
+//! C header: [`include/drm/drm_drv.h`](srctree/include/drm/drm_drv.h)
=20
 use crate::{
     bindings, device, devres, drm,
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index e8789c9110d6..8c46f8d51951 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -2,7 +2,7 @@
=20
 //! DRM File objects.
 //!
-//! C header: [`include/linux/drm/drm_file.h`](srctree/include/linux/drm/d=
rm_file.h)
+//! C header: [`include/drm/drm_file.h`](srctree/include/drm/drm_file.h)
=20
 use crate::{bindings, drm, error::Result, prelude::*, types::Opaque};
 use core::marker::PhantomData;
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b71821cfb5ea..b9f3248876ba 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -2,7 +2,7 @@
=20
 //! DRM GEM API
 //!
-//! C header: [`include/linux/drm/drm_gem.h`](srctree/include/linux/drm/dr=
m_gem.h)
+//! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
=20
 use crate::{
     alloc::flags::*,
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index fdec01c37168..8431cdcd3ae0 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -2,7 +2,7 @@
=20
 //! DRM IOCTL definitions.
 //!
-//! C header: [`include/linux/drm/drm_ioctl.h`](srctree/include/linux/drm/=
drm_ioctl.h)
+//! C header: [`include/drm/drm_ioctl.h`](srctree/include/drm/drm_ioctl.h)
=20
 use crate::ioctl;
=20
--=20
2.49.0


