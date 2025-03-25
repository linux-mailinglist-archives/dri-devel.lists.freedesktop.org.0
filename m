Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEDA70DD3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE1210E635;
	Tue, 25 Mar 2025 23:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Aft6Q1Wy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59310E635
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 23:56:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 494BD61126;
 Tue, 25 Mar 2025 23:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E351C4CEE4;
 Tue, 25 Mar 2025 23:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742946979;
 bh=BZJKgVWhfvs3CEcMsGO57oM5Dgx4ENJP3weiQBABz+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Aft6Q1WyX+5dubcPBstLZyU59krSIExcMbnUD1hC3hV+wY4cbxvRje0+KEfTYXglF
 catKrKq/8lwlPOyHqooPJ4S4ByFPuUW+2Da04Apm9SA4+IeQY5HIsQ/lrj1Zs1KVGs
 GIn0Pt0L3T7mpzMV6OdIU30Lisk5SptJLaKQgqBm9X5iZuaehpCEZoti6yfyY0JIuZ
 Lhkx9NKyt3OpVAuXQSOzNdyp/ZenvONxGKzV1rBaPbJOi7PmlJ1e44T4iu86gJsC9m
 tTPG2567BDoCMCcvrlJw9lBwcpjMZKjUgu65PDQB0G9XdyEnOt3SPCai0pJlsrYCHW
 6wQi6Di6Y922A==
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
Subject: [PATCH 5/8] rust: drm: add DRM driver registration
Date: Wed, 26 Mar 2025 00:54:32 +0100
Message-ID: <20250325235522.3992-6-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325235522.3992-1-dakr@kernel.org>
References: <20250325235522.3992-1-dakr@kernel.org>
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

Implement the DRM driver `Registration`.

The `Registration` structure is responsible to register and unregister a
DRM driver. It makes use of the `Devres` container in order to allow the
`Registration` to be owned by devres, such that it is automatically
dropped (and the DRM driver unregistered) once the parent device is
unbound.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/driver.rs | 57 ++++++++++++++++++++++++++++++++++++++-
 rust/kernel/drm/mod.rs    |  1 +
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 625cab7839a3..8d2b397018d1 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -4,7 +4,15 @@
 //!
 //! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
 
-use crate::{bindings, drm, str::CStr};
+use crate::{
+    bindings,
+    devres::Devres,
+    drm,
+    error::{Error, Result},
+    prelude::*,
+    str::CStr,
+    types::ARef,
+};
 use macros::vtable;
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -134,3 +142,50 @@ pub trait Driver {
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
+    pub fn new(drm: ARef<drm::Device<T>>, flags: usize) -> Result<Self> {
+        // SAFETY: Safe by the invariants of `drm::Device`.
+        let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Self(drm))
+    }
+
+    /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to
+    /// [`Devres`].
+    pub fn new_foreign_owned(drm: ARef<drm::device::Device<T>>, flags: usize) -> Result {
+        let reg = Registration::<T>::new(drm.clone(), flags)?;
+
+        Devres::new_foreign_owned(drm.as_ref(), reg, GFP_KERNEL)
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

