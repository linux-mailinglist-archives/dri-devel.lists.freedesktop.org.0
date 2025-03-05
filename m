Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FCA53E00
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F81910E84C;
	Wed,  5 Mar 2025 23:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OaQM78hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B71410E84C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnVLYW2FIG18ZU9j87EnxxPDzjwGXevU3H0JDILigMI=;
 b=OaQM78hxPpsa25/yy3Hn/wn2D+dW5XWes0qYd3jeD2eN4s84h2tKgN1e1sxh3sCsvcC3ik
 UZqccjcxYxaK9mrC47NXIkjlZCnZR0dH2KFxIHwCThd+Prs8wcjOKuy3ljij5jVUBGkQkj
 UoLX1pwAJXm4MucjommSIjd5Xh2ZG9U=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-iYOOLzw8P96mzlZ7Xt0KiQ-1; Wed,
 05 Mar 2025 18:05:57 -0500
X-MC-Unique: iYOOLzw8P96mzlZ7Xt0KiQ-1
X-Mimecast-MFC-AGG-ID: iYOOLzw8P96mzlZ7Xt0KiQ_1741215954
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2AACB1955DCD; Wed,  5 Mar 2025 23:05:54 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 133B7300019E; Wed,  5 Mar 2025 23:05:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 09/33] rust: drm/kms: Add DriverConnector::get_mode callback
Date: Wed,  5 Mar 2025 17:59:25 -0500
Message-ID: <20250305230406.567126-10-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

Next up is filling out some of the basic connector hotplugging callbacks -
which we'll need for setting up the fbdev helpers for KMS devices. Note
that connector hotplugging in DRM follows a BFL scheme: pretty much all
probing is protected under the mighty drm_device->mode_config.lock, which
of course is a bit counter-intuitive to rust's locking schemes where data
is always associated with its lock.

Since that lock is embedded in an FFI type and not a rust type, we need to
introduce our own wrapper type that acts as a lock acquisition for this.
This brings us to introducing a few new types:

* ModeConfigGuard - the most basic lock guard, as long as this object is
  alive we are guaranteed to be holding drm_device->mode_config.lock. This
  object doesn't do much else on its own currently.
* ConnectorGuard - an object which corresponds to a specific typed DRM
  connector. This can only be acquired with a ModeConfigGuard, and will be
  used to allow calling methods that are only safe to call with
  drm_device->mode_config.lock held. Since it implements
  Deref<Target=Connector<T>> as well, it can also be used for any other
  operations that would normally be available on a DRM connector.

And finally, we add the DriverConnector::get_modes() trait method which
drivers can use to implement the drm_connector_helper_funcs.get_modes
callback. Note that while we make this trait method mandatory, we only do
so for the time being since VKMS doesn't do very much with DRM connectors -
and as such we have no need yet to implement alternative connector probing
schemes outside of get_modes().

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Document uses of ManuallyDrop
* Use addr_of_mut!() instead of &mut
* Add some missing invariant comments

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h  |  1 +
 rust/kernel/drm/kms.rs           | 90 +++++++++++++++++++++++++++++++-
 rust/kernel/drm/kms/connector.rs | 62 ++++++++++++++++++++--
 3 files changed, 147 insertions(+), 6 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a6735f6fba947..27828dd36d4f2 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index f0044d396e1eb..7935e935f9975 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -8,15 +8,20 @@
 pub mod plane;
 
 use crate::{
-    device,
+    container_of, device,
     drm::{device::Device, drv::Driver},
     error::to_result,
     prelude::*,
     private::Sealed,
+    sync::{Mutex, MutexGuard},
     types::*,
 };
 use bindings;
-use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::{self, addr_of_mut, NonNull},
+};
 
 /// The C vtable for a [`Device`].
 ///
@@ -191,6 +196,23 @@ pub struct ModeConfigInfo {
     pub preferred_fourcc: Option<u32>,
 }
 
+impl<T: KmsDriver> Device<T> {
+    /// Retrieve a pointer to the mode_config mutex
+    #[inline]
+    pub(crate) fn mode_config_mutex(&self) -> &Mutex<()> {
+        // SAFETY: This lock is initialized for as long as `Device<T>` is exposed to users
+        unsafe { Mutex::from_raw(addr_of_mut!((*self.as_raw()).mode_config.mutex)) }
+    }
+
+    /// Acquire the [`mode_config.mutex`] for this [`Device`].
+    #[inline]
+    pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
+        // INVARIANT: We're locking mode_config.mutex, fulfilling our invariant that this lock is
+        // held throughout ModeConfigGuard's lifetime.
+        ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
+    }
+}
+
 /// A modesetting object in DRM.
 ///
 /// This is any type of object where the underlying C object contains a [`struct drm_mode_object`].
@@ -314,3 +336,67 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
         unsafe { bindings::drm_mode_object_put(obj.as_ref().raw_mode_obj()) }
     }
 }
+
+/// A mode config guard.
+///
+/// This is an exclusive primitive that represents when [`drm_device.mode_config.mutex`] is held - as
+/// some modesetting operations (particularly ones related to [`connectors`](connector)) are still
+/// protected under this single lock. The lock will be dropped once this object is dropped.
+///
+/// # Invariants
+///
+/// - `self.0` is contained within a [`struct drm_mode_config`], which is contained within a
+///   [`struct drm_device`].
+/// - The [`KmsDriver`] implementation of that [`struct drm_device`] is always `T`.
+/// - This type proves that [`drm_device.mode_config.mutex`] is acquired.
+///
+/// [`struct drm_mode_config`]: (srctree/include/drm/drm_device.h)
+/// [`drm_device.mode_config.mutex`]: (srctree/include/drm/drm_device.h)
+/// [`struct drm_device`]: (srctree/include/drm/drm_device.h)
+pub struct ModeConfigGuard<'a, T: KmsDriver>(MutexGuard<'a, ()>, PhantomData<T>);
+
+impl<'a, T: KmsDriver> ModeConfigGuard<'a, T> {
+    /// Construct a new [`ModeConfigGuard`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that [`drm_device.mode_config.mutex`] is acquired.
+    ///
+    /// [`drm_device.mode_config.mutex`]: (srctree/include/drm/drm_device.h)
+    pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
+        // SAFETY: Our safety contract fulfills the requirements of `MutexGuard::new()`
+        // INVARIANT: And our safety contract ensures that this type proves that
+        // `drm_device.mode_config.mutex` is acquired.
+        Self(
+            unsafe { MutexGuard::new(drm.mode_config_mutex(), ()) },
+            PhantomData,
+        )
+    }
+
+    /// Return the [`Device`] that this [`ModeConfigGuard`] belongs to.
+    pub fn drm_dev(&self) -> &'a Device<T> {
+        // SAFETY:
+        // - `self` is embedded within a `drm_mode_config` via our type invariants
+        // - `self.0.lock` has an equivalent data type to `mutex` via its type invariants.
+        let mode_config = unsafe { container_of!(self.0.lock, bindings::drm_mode_config, mutex) };
+
+        // SAFETY: And that `drm_mode_config` lives in a `drm_device` via type invariants.
+        unsafe {
+            Device::borrow(container_of!(
+                mode_config,
+                bindings::drm_device,
+                mode_config
+            ))
+        }
+    }
+
+    /// Assert that the given device is the owner of this mode config guard.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `dev` is different from the owning device for this mode config guard.
+    #[inline]
+    pub(crate) fn assert_owner(&self, dev: &Device<T>) {
+        assert!(ptr::eq(self.drm_dev(), dev));
+    }
+}
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 6fe0a7517bd55..14de3b0529f89 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_connector.h)
 
-use super::{encoder::*, KmsDriver, ModeObject, RcModeObject};
+use super::{encoder::*, KmsDriver, ModeConfigGuard, ModeObject, RcModeObject};
 use crate::{
     alloc::KBox,
     bindings,
@@ -17,7 +17,7 @@
 };
 use core::{
     marker::*,
-    mem,
+    mem::{self, ManuallyDrop},
     ops::*,
     ptr::{addr_of_mut, null_mut},
     stringify,
@@ -106,7 +106,7 @@ pub trait DriverConnector: Send + Sync + Sized {
             destroy: Some(connector_destroy_callback::<Self>),
             force: None,
             detect: None,
-            fill_modes: None,
+            fill_modes: Some(bindings::drm_helper_probe_single_connector_modes),
             debugfs_init: None,
             oob_hotplug_event: None,
             atomic_duplicate_state: Some(atomic_duplicate_state_callback::<Self::State>),
@@ -114,7 +114,7 @@ pub trait DriverConnector: Send + Sync + Sized {
         helper_funcs: bindings::drm_connector_helper_funcs {
             mode_valid: None,
             atomic_check: None,
-            get_modes: None,
+            get_modes: Some(get_modes_callback::<Self>),
             detect_ctx: None,
             enable_hpd: None,
             disable_hpd: None,
@@ -145,6 +145,12 @@ pub trait DriverConnector: Send + Sync + Sized {
     ///
     /// Drivers may use this to instantiate their [`DriverConnector`] object.
     fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl PinInit<Self, Error>;
+
+    /// Retrieve a list of available display modes for this [`Connector`].
+    fn get_modes<'a>(
+        connector: ConnectorGuard<'a, Self>,
+        guard: &ModeConfigGuard<'a, Self::Driver>,
+    ) -> i32;
 }
 
 /// The generated C vtable for a [`DriverConnector`].
@@ -196,6 +202,21 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl<T: DriverConnector> Connector<T> {
+    /// Acquire a [`ConnectorGuard`] for this connector from a [`ModeConfigGuard`].
+    ///
+    /// This verifies using the provided reference that the given guard is actually for the same
+    /// device as this connector's parent.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `guard` is not a [`ModeConfigGuard`] for this connector's parent [`Device`].
+    pub fn guard<'a>(&'a self, guard: &ModeConfigGuard<'a, T::Driver>) -> ConnectorGuard<'a, T> {
+        guard.assert_owner(self.drm_dev());
+        ConnectorGuard(self)
+    }
+}
+
 /// A trait implemented by any type that acts as a [`struct drm_connector`] interface.
 ///
 /// This is implemented internally by DRM.
@@ -392,6 +413,39 @@ pub fn attach_encoder(&self, encoder: &impl AsRawEncoder) -> Result {
     drop(unsafe { KBox::from_raw(connector as *mut Connector<T>) });
 }
 
+unsafe extern "C" fn get_modes_callback<T: DriverConnector>(
+    connector: *mut bindings::drm_connector,
+) -> core::ffi::c_int {
+    // SAFETY: This is safe via `DriverConnector`s type invariants.
+    let connector = unsafe { Connector::<T>::from_raw(connector) };
+
+    // SAFETY: This FFI callback is only called while `mode_config.lock` is held
+    // We use ManuallyDrop here to prevent the lock from being released after the callback
+    // completes, as that should be handled by DRM.
+    let guard = ManuallyDrop::new(unsafe { ModeConfigGuard::new(connector.drm_dev()) });
+
+    T::get_modes(connector.guard(&guard), &guard)
+}
+
+/// A privileged [`Connector`] obtained while holding a [`ModeConfigGuard`].
+///
+/// This provides access to various methods for [`Connector`] that must happen under lock, such as
+/// setting resolution preferences and adding display modes.
+///
+/// # Invariants
+///
+/// Shares the invariants of [`ModeConfigGuard`].
+#[derive(Copy, Clone)]
+pub struct ConnectorGuard<'a, T: DriverConnector>(&'a Connector<T>);
+
+impl<T: DriverConnector> Deref for ConnectorGuard<'_, T> {
+    type Target = Connector<T>;
+
+    fn deref(&self) -> &Self::Target {
+        self.0
+    }
+}
+
 // SAFETY: DRM expects this struct to be zero-initialized
 unsafe impl Zeroable for bindings::drm_connector_state {}
 
-- 
2.48.1

