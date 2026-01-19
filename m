Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A66D3BBD0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 00:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D40110E548;
	Mon, 19 Jan 2026 23:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JPmB5bxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051A410E25B;
 Mon, 19 Jan 2026 23:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768865722;
 bh=JvOYHt54V3wkz9XOQxonbU0lmdnTo5QUIcTkXnD3p28=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JPmB5bxSwWlh3EqWQJgSR4eUG8eptyYivrLwW9pdq5g4QII9wkAuZw+MhISK8Lknq
 +Vyn4xy0zQUOZacPMnRQYMDCaSZlrW5fcqMCMIbSDHIiVNC4kCV0YCpyMfRubzYqIo
 2VaqVBbJJng5UGw9VP3U8AgwDuGKQW1DHTIgna64QqQ0R6hm6NXzYuBF2DQV3N1EHB
 elTiNwFcxLGhU3Mv4XrXxSF4/7CrBA6vePcQr7fG8wWxphHAxBEWomSWAzcS/EIkqv
 XIAbV5lol/ArTHsV6BkaV2TdVHWRdwyKo6JAEgrJlX6SL2L3caDW93crMB8b7BLo5I
 dCcayE3Gdxn+Q==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AA9217E0FDB;
 Tue, 20 Jan 2026 00:35:19 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 19 Jan 2026 20:34:46 -0300
Subject: [PATCH 1/2] rust: drm: add support for driver features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-render-v1-1-8326e4d5cb44@collabora.com>
References: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
In-Reply-To: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

Add initial support for drm driver features via the DriverFeatures trait.
This trait is unsafe, requiring the implementer to comply with the safety
requirements of each feature individually if the feature is enabled.

New features can be described by adding separate ZSTs to encode them. The
current design assumes two types, for example: FeatureFooSupported and
NoFoo. As said above, this will require implementors to observe more safety
requirements in their DriverFeatures trait implementation.

A subsequent commit will build on this one to add support for FEAT_RENDER.
This is required by Tyr and other drivers.

Additionally, features can also require additional traits to be implemented
when enabled. These traits can add their own safety requirements.

This is roughly described below, with some boilerplate omitted:

pub struct ModesetSupported;
pub struct NoModeset;

pub unsafe trait ModesetOps: Driver {
    fn set_mode(&self, ...);
}

pub trait ModesetRequirement<F: ModesetFeature> {}
impl<T: ModesetOps> ModesetRequirement<ModesetSupported> for T {}
impl<T> ModesetRequirement<NoModeset> for T {}

pub trait Driver:
    DriverFeatures
    + ModesetRequirement<Self::Modeset>
{
    // ...
}

// `driver::compute_features` is augmented to include the feature flag.
const fn compute_features() -> u32 {
  if T::Modeset::ENABLED {
    features |= FEAT_MODESET;
  }

  features
}

// In driver code, `DriverFeatures` can enable the feature via
// `ModesetSupported`.
unsafe impl DriverFeatures for MyDriver {
  type Modeset = ModesetSupported;
}

// Required because `Modeset = ModesetSupported`.
unsafe impl ModesetOps for MyDriver {...}

Feature support will soon be required by upcoming DRM drivers. This
extensible model lets us describe them in terms of either additional safety
requirements and/or traits.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/nova/driver.rs |  5 +++++
 drivers/gpu/drm/tyr/driver.rs  |  5 +++++
 rust/kernel/drm/device.rs      |  6 +++++-
 rust/kernel/drm/driver.rs      | 17 ++++++++++++++++-
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 2246d8e104e0..247a05f7b3a7 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -69,3 +69,8 @@ impl drm::Driver for NovaDriver {
         (NOVA_GEM_INFO, drm_nova_gem_info, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_info),
     }
 }
+
+// SAFETY: This trait requires implementers to observe the safety requirements
+// of each enabled feature. There are no features enabled, so this is safe by
+// definition.
+unsafe impl drm::driver::DriverFeatures for NovaDriver {}
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..ec2aa30515a1 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -191,6 +191,11 @@ impl drm::Driver for TyrDriver {
     }
 }
 
+// SAFETY: This trait requires implementers to observe the safety requirements
+// of each enabled feature. There are no features enabled, so this is safe by
+// definition.
+unsafe impl drm::driver::DriverFeatures for TyrDriver {}
+
 #[pin_data]
 struct Clocks {
     core: Clk,
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a0056..cfc2f34e8cc2 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -61,6 +61,10 @@ pub struct Device<T: drm::Driver> {
 }
 
 impl<T: drm::Driver> Device<T> {
+    const fn compute_features() -> u32 {
+        drm::driver::FEAT_GEM
+    }
+
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
@@ -86,7 +90,7 @@ impl<T: drm::Driver> Device<T> {
         name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
         desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
 
-        driver_features: drm::driver::FEAT_GEM,
+        driver_features: Self::compute_features(),
         ioctls: T::IOCTLS.as_ptr(),
         num_ioctls: T::IOCTLS.len() as i32,
         fops: &Self::GEM_FOPS,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245c..fdfd083ba2b6 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -98,7 +98,7 @@ pub trait AllocImpl: super::private::Sealed + drm::gem::IntoGEMObject {
 /// This trait must be implemented by drivers in order to create a `struct drm_device` and `struct
 /// drm_driver` to be registered in the DRM subsystem.
 #[vtable]
-pub trait Driver {
+pub trait Driver: DriverFeatures {
     /// Context data associated with the DRM driver
     type Data: Sync + Send;
 
@@ -168,3 +168,18 @@ fn drop(&mut self) {
         unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
     }
 }
+
+/// Marker trait for drivers supporting specific features.
+///
+/// This trait is unsafe, and each feature might add its own safety
+/// requirements. The safety requirements for this trait requires the caller to
+/// comply with the safety requirements of each supported feature.
+///
+/// Features might also require additional trait implementations to be present.
+/// These additional traits may also be unsafe.
+///
+/// # Safety
+///
+/// Drivers implementing this trait must ensure they comply with the safety
+/// requirements of each supported feature.
+pub unsafe trait DriverFeatures {}

-- 
2.52.0

