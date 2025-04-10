Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B7A85050
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE37D10EA8C;
	Thu, 10 Apr 2025 23:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="goMRnP2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F34010EA8C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:56:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 205BB6843D;
 Thu, 10 Apr 2025 23:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A15BC4CEDD;
 Thu, 10 Apr 2025 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744329396;
 bh=5AD3tVCCnPhzivSgvNP08fMHMTPQoqboba5m88+FTW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=goMRnP2pXvIVoXfCxbUkTVK/2EdDuk5uZ66jOCIjQ+eVW3x4J5jM7iAbQWI8psbby
 PFRhr7QRHIJ/o0dQvsPb5HVC0G4nFvMgfaF5U/S8kNfZG4m/jPSgBk3nFS4OmFThiE
 qFOgeDyP/44p7zfiCWcEooFvuhJVJ2q0FK0RCZ70iN5KaCYmpmO7MIiwkZeM9kfp+B
 mUj6uhN/NPLpKOOpk9hnWIEEyCvXMcEwyUXpTfp/eQPogBeOFUwL1ADDQE0jVCzKpI
 erKPhaLtDKP8HMR7UAK+Dgg+2MXYCwBlpZBF5ZywEw/YGqCJqdClojwZS8vLam2sl0
 aZthHtRp9QvvA==
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
Subject: [PATCH v2 5/8] rust: drm: add DRM driver registration
Date: Fri, 11 Apr 2025 01:55:24 +0200
Message-ID: <20250410235546.43736-6-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410235546.43736-1-dakr@kernel.org>
References: <20250410235546.43736-1-dakr@kernel.org>
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

From: Asahi Lina <lina@asahilina.net>

Implement the DRM driver `Registration`.

The `Registration` structure is responsible to register and unregister a
DRM driver. It makes use of the `Devres` container in order to allow the
`Registration` to be owned by devres, such that it is automatically
dropped (and the DRM driver unregistered) once the parent device is
unbound.

Signed-off-by: Asahi Lina <lina@asahilina.net>
[ Rework of drm::Registration
    * move VTABLE to drm::Device to prevent use-after-free bugs; VTABLE
      needs to be bound to the lifetime of drm::Device, not the
      drm::Registration
    * combine new() and register() to get rid of the registered boolean
    * remove file_operations
    * move struct drm_device creation to drm::Device
    * introduce Devres
    * original source archive: https://archive.is/Pl9ys

  - Danilo ]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/driver.rs | 60 ++++++++++++++++++++++++++++++++++++++-
 rust/kernel/drm/mod.rs    |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 6d09d1933d3e..96bb287eada2 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -4,7 +4,15 @@
 //!
 //! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
 
-use crate::{bindings, drm, str::CStr};
+use crate::{
+    bindings, device,
+    devres::Devres,
+    drm,
+    error::{Error, Result},
+    prelude::*,
+    str::CStr,
+    types::ARef,
+};
 use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -107,3 +115,53 @@ pub trait Driver {
     /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
     const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
 }
+
+/// The registration type of a `drm::Device`.
+///
+/// Once the `Registration` structure is dropped, the device is unregistered.
+pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
+
+impl<T: Driver> Registration<T> {
+    /// Creates a new [`Registration`] and registers it.
+    pub fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
+        // SAFETY: Safe by the invariants of `drm::Device`.
+        let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Self(drm.into()))
+    }
+
+    /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to
+    /// [`Devres`].
+    pub fn new_foreign_owned(drm: &drm::Device<T>, dev: &device::Device, flags: usize) -> Result {
+        if drm.as_ref().as_raw() != dev.as_raw() {
+            return Err(EINVAL);
+        }
+
+        let reg = Registration::<T>::new(drm, flags)?;
+        Devres::new_foreign_owned(dev, reg, GFP_KERNEL)
+    }
+
+    /// Returns a reference to the `Device` instance for this registration.
+    pub fn device(&self) -> &drm::Device<T> {
+        &self.0
+    }
+}
+
+// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between
+// threads, hence it's safe to share it.
+unsafe impl<T: Driver> Sync for Registration<T> {}
+
+// SAFETY: Registration with and unregistration from the DRM subsystem can happen from any thread.
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+impl<T: Driver> Drop for Registration<T> {
+    /// Removes the registration from the kernel if it has completed successfully before.
+    fn drop(&mut self) {
+        // SAFETY: Safe by the invariant of `ARef<drm::Device<T>>`. The existence of this
+        // `Registration` also guarantees the this `drm::Device` is actually registered.
+        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 967854a2083e..2d88e70ba607 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -9,6 +9,7 @@
 pub use self::device::Device;
 pub use self::driver::Driver;
 pub use self::driver::DriverInfo;
+pub use self::driver::Registration;
 
 pub(crate) mod private {
     pub trait Sealed {}
-- 
2.49.0

