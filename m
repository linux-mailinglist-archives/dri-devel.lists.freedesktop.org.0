Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF88A53E27
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E02C10E864;
	Wed,  5 Mar 2025 23:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iVhomQzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9710E864
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pb/uOI59msB+UZp03QgOsI5r29hZ3aXpEiiWVId3ftY=;
 b=iVhomQztqRHedX2XiiQ8hizMW/sAcDsU9OoU+CEgw6YewSzzES+mr9/WJy7TRNn+/J4nPz
 0YAOImby/zFaIBYOxBOMb7Nv1OEMHvLBTBiPWPWZd+Qx6I7+prqLPTM3JESrmOokNdjBVb
 j+HAR45SgvtZgFONYoul4OC7JjfYrfs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-CRxRtHnYMgi68Gp5y1qzSg-1; Wed,
 05 Mar 2025 18:09:14 -0500
X-MC-Unique: CRxRtHnYMgi68Gp5y1qzSg-1
X-Mimecast-MFC-AGG-ID: CRxRtHnYMgi68Gp5y1qzSg_1741216151
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9879019560B0; Wed,  5 Mar 2025 23:09:11 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 28FC9300019E; Wed,  5 Mar 2025 23:09:07 +0000 (UTC)
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 31/33] rust: drm/kms: Add VblankSupport
Date: Wed,  5 Mar 2025 17:59:47 -0500
Message-ID: <20250305230406.567126-32-lyude@redhat.com>
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

This commit adds bindings for implementing vblank support for a driver's
CRTCs. These bindings are optional, to account for the fact that not all
drivers have dedicated hardware vblanks.

In order to accomplish this, we introduce the VblankSupport trait which can
be implemented on DriverCrtc by drivers which support vblanks. This works
in the same way as the main Kms trait - drivers which don't support
hardware vblanks can simply pass PhantomData<Self> to the associated type
on DriverCrtc. If a driver chooses to implement VblankSupport, VblankImpl
will be implemented by DRM automatically - and can be passed to the
VblankImpl associated type on DriverCrtc.

Additionally, we gate methods which only apply to vblank-supporting drivers
by introducing a VblankDriverCrtc trait that is automatically implemented
by DRM for CRTC drivers implementing VblankSupport. This works basically in
the same way as Kms and KmsDriver, but for CRTCs.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

Notes:

* One thing to keep in mind: this trait is implemented on the CRTC as
  opposed to the KMS driver due to the possibility that a driver may have
  multiple different types of CRTCs. As a result, it's not impossible that
  there could potentially be differences in each type's vblank hardware
  implementation. In theory this could lead to a driver mistakenly only
  implementing VblankSupport for some CRTCs and not others, which isn't
  really defined behavior in DRM. As such, one of the dependencies in the
  branch for this patch series preview is a fix to ensure that DRM
  disallows registering drivers that make this mistake.

V3:
* Update to the latest SpinlockIrq changes
* Fix typo on get_vblank_timestamp()
* Break statements in vblank_crtc() up a bit
* Add comments around all uses of ManuallyDrop
* Improve SAFETY comments
* Make some unsafe scopes smaller

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/drm/drm.c          |   2 +
 rust/helpers/drm/vblank.c       |   8 +
 rust/kernel/drm/device.rs       |   1 -
 rust/kernel/drm/kms.rs          |  21 +-
 rust/kernel/drm/kms/crtc.rs     |  27 +-
 rust/kernel/drm/kms/vblank.rs   | 448 ++++++++++++++++++++++++++++++++
 7 files changed, 501 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/drm/vblank.c
 create mode 100644 rust/kernel/drm/kms/vblank.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2e80a62062fc8..a9a89e9c8adbc 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -25,6 +25,7 @@
 #include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_vblank.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
diff --git a/rust/helpers/drm/drm.c b/rust/helpers/drm/drm.c
index 365f6807774d4..5d4498e01fd3e 100644
--- a/rust/helpers/drm/drm.c
+++ b/rust/helpers/drm/drm.c
@@ -2,7 +2,9 @@
 
 #ifdef CONFIG_DRM_KMS_HELPER
 #include "atomic.c"
+#include "vblank.c"
 #endif
+
 #include "gem.c"
 #ifdef CONFIG_DRM_GEM_SHMEM_HELPER
 #include "gem_shmem_helper.c"
diff --git a/rust/helpers/drm/vblank.c b/rust/helpers/drm/vblank.c
new file mode 100644
index 0000000000000..165db7ac5b4da
--- /dev/null
+++ b/rust/helpers/drm/vblank.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_vblank.h>
+
+struct drm_vblank_crtc *rust_helper_drm_crtc_vblank_crtc(struct drm_crtc *crtc)
+{
+	return drm_crtc_vblank_crtc(crtc);
+}
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3938ceb044645..2c909985b1687 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -156,7 +156,6 @@ pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
     }
 
     /// Returns a reference to the `event` spinlock
-    #[allow(dead_code)]
     pub(crate) fn event_lock(&self) -> &SpinLockIrq<()> {
         // SAFETY: `event_lock` is initialized for as long as `self` is exposed to users
         unsafe { SpinLockIrq::from_raw(&mut (*self.as_raw()).event_lock) }
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 36a0b4c4454ba..38015066491f9 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -8,6 +8,7 @@
 pub mod encoder;
 pub mod framebuffer;
 pub mod plane;
+pub mod vblank;
 
 use crate::{
     container_of, device,
@@ -20,6 +21,7 @@
 };
 use bindings;
 use core::{
+    cell::Cell,
     marker::PhantomData,
     ops::Deref,
     ptr::{self, addr_of_mut, NonNull},
@@ -168,6 +170,13 @@ pub fn from_opaque<$( $lifetime, )? $( $decl_bound_id ),* >(
 /// state required during the initialization process of a [`Device`].
 pub struct UnregisteredKmsDevice<'a, T: Driver> {
     drm: &'a Device<T>,
+    // TODO: Get rid of this - I think the solution we came up on the C side to just make it so that
+    // DRM is a bit more consistent with verifying whether all CRTCs have this implemented or not -
+    // meaning we don't need to keep track of this and can just make the vblank setup conditional on
+    // the implementation of `VblankSupport`.
+    // Note that this also applies to headless devices - those are literally the same but
+    // `dev.num_crtc()` = 0
+    pub(crate) has_vblanks: Cell<bool>,
 }
 
 impl<'a, T: Driver> Deref for UnregisteredKmsDevice<'a, T> {
@@ -185,7 +194,10 @@ impl<'a, T: Driver> UnregisteredKmsDevice<'a, T> {
     ///
     /// The caller promises that `drm` is an unregistered [`Device`].
     pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
-        Self { drm }
+        Self {
+            drm,
+            has_vblanks: Cell::new(false),
+        }
     }
 }
 
@@ -262,6 +274,11 @@ unsafe fn setup_kms(drm: &Device<Self::Driver>) -> Result<ModeConfigInfo> {
 
         T::create_objects(&drm)?;
 
+        if drm.has_vblanks.get() {
+            // SAFETY: `has_vblank` is only true if CRTCs with vblank support were registered
+            to_result(unsafe { bindings::drm_vblank_init(drm.as_raw(), drm.num_crtcs()) })?;
+        }
+
         // TODO: Eventually add a hook to customize how state readback happens, for now just reset
         // SAFETY: Since all static modesetting objects were created in `T::create_objects()`, and
         // that is the only place they can be created, this fulfills the C API requirements.
@@ -312,7 +329,7 @@ pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
         ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
     }
 
-    /// Return the number of registered CRTCs
+    /// Return the number of registered [`Crtc`](crtc::Crtc) objects on this [`Device`].
     #[inline]
     pub fn num_crtcs(&self) -> u32 {
         // SAFETY:
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 9026d0911aa86..8f07197b639f5 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/drm/drm_crtc.h`](srctree/include/drm/drm_crtc.h)
 
 use super::{
-    atomic::*, plane::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
+    atomic::*, plane::*, vblank::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
     UnregisteredKmsDevice,
 };
 use crate::{
@@ -58,13 +58,13 @@ pub trait DriverCrtc: Send + Sync + Sized {
             cursor_set2: None,
             cursor_set: None,
             destroy: Some(crtc_destroy_callback::<Self>),
-            disable_vblank: None,
+            disable_vblank: <Self::VblankImpl as VblankImpl>::VBLANK_OPS.disable_vblank,
             early_unregister: None,
-            enable_vblank: None,
+            enable_vblank: <Self::VblankImpl as VblankImpl>::VBLANK_OPS.enable_vblank,
             gamma_set: None,
             get_crc_sources: None,
             get_vblank_counter: None,
-            get_vblank_timestamp: None,
+            get_vblank_timestamp: <Self::VblankImpl as VblankImpl>::VBLANK_OPS.get_vblank_timestamp,
             late_register: None,
             page_flip: Some(bindings::drm_atomic_helper_page_flip),
             page_flip_target: None,
@@ -129,6 +129,12 @@ pub trait DriverCrtc: Send + Sync + Sized {
     /// See [`DriverCrtcState`] for more info.
     type State: DriverCrtcState;
 
+    /// The driver's optional hardware vblank implementation
+    ///
+    /// See [`VblankSupport`] for more info. Drivers that don't care about this can just pass
+    /// [`PhantomData<Self>`].
+    type VblankImpl: VblankImpl<Crtc = Self>;
+
     /// The constructor for creating a [`Crtc`] using this [`DriverCrtc`] implementation.
     ///
     /// Drivers may use this to instantiate their [`DriverCrtc`] object.
@@ -298,6 +304,15 @@ impl<T: DriverCrtc> Crtc<T> {
             T as DriverCrtc,
             D as KmsDriver
     }
+
+    pub(crate) fn get_vblank_ptr(&self) -> *mut bindings::drm_vblank_crtc {
+        // SAFETY: FFI Call with no special requirements
+        unsafe { bindings::drm_crtc_vblank_crtc(self.as_raw()) }
+    }
+
+    pub(crate) const fn has_vblank() -> bool {
+        T::OPS.funcs.enable_vblank.is_some()
+    }
 }
 
 /// A [`Crtc`] that has not yet been registered with userspace.
@@ -328,6 +343,10 @@ pub fn new<'a, 'b: 'a, PrimaryData, CursorData>(
         PrimaryData: DriverPlane<Driver = T::Driver>,
         CursorData: DriverPlane<Driver = T::Driver>,
     {
+        if Crtc::<T>::has_vblank() {
+            dev.has_vblanks.set(true)
+        }
+
         let this: Pin<KBox<Crtc<T>>> = KBox::try_pin_init(
             try_pin_init!(Crtc::<T> {
                 crtc: Opaque::new(bindings::drm_crtc {
diff --git a/rust/kernel/drm/kms/vblank.rs b/rust/kernel/drm/kms/vblank.rs
new file mode 100644
index 0000000000000..da3c61dec7c04
--- /dev/null
+++ b/rust/kernel/drm/kms/vblank.rs
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM KMS vblank support.
+//!
+//! C header: [`include/drm/drm_vblank.h`](srcfree/include/drm/drm_vblank.h)
+
+use super::{crtc::*, ModeObject};
+use bindings;
+use core::{
+    marker::*,
+    mem::{self, ManuallyDrop},
+    ops::{Deref, Drop},
+    ptr::{addr_of_mut, null_mut},
+};
+use kernel::{
+    drm::device::Device,
+    error::{from_result, to_result},
+    interrupt::LocalInterruptDisabled,
+    prelude::*,
+    time::Ktime,
+    types::Opaque,
+};
+
+/// The main trait for a driver to implement hardware vblank support for a [`Crtc`].
+///
+/// # Invariants
+///
+/// C FFI callbacks generated using this trait can safely assume that input pointers to
+/// [`struct drm_crtc`] are always contained within a [`Crtc<Self::Crtc>`].
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+pub trait VblankSupport: Sized {
+    /// The parent [`DriverCrtc`].
+    type Crtc: VblankDriverCrtc<VblankImpl = Self>;
+
+    /// Enable vblank interrupts for this [`DriverCrtc`].
+    fn enable_vblank(
+        crtc: &Crtc<Self::Crtc>,
+        vblank_guard: &VblankGuard<'_, Self::Crtc>,
+        irq: &LocalInterruptDisabled,
+    ) -> Result;
+
+    /// Disable vblank interrupts for this [`DriverCrtc`].
+    fn disable_vblank(
+        crtc: &Crtc<Self::Crtc>,
+        vblank_guard: &VblankGuard<'_, Self::Crtc>,
+        irq: &LocalInterruptDisabled,
+    );
+
+    /// Retrieve the current vblank timestamp for this [`Crtc`]
+    ///
+    /// If this function is being called from the driver's vblank interrupt handler,
+    /// `handling_vblank_irq` will be `true`.
+    fn get_vblank_timestamp(
+        crtc: &Crtc<Self::Crtc>,
+        in_vblank_irq: bool,
+    ) -> Option<VblankTimestamp>;
+}
+
+/// Trait used for CRTC vblank (or lack there-of) implementations. Implemented internally.
+///
+/// Drivers interested in implementing vblank support should refer to [`VblankSupport`], drivers
+/// that don't have vblank support can use [`PhantomData`].
+pub trait VblankImpl {
+    /// The parent [`DriverCrtc`].
+    type Crtc: DriverCrtc<VblankImpl = Self>;
+
+    /// The generated [`VblankOps`].
+    const VBLANK_OPS: VblankOps;
+}
+
+/// C FFI callbacks for vblank management.
+///
+/// Created internally by DRM.
+#[derive(Default)]
+pub struct VblankOps {
+    pub(crate) enable_vblank: Option<unsafe extern "C" fn(crtc: *mut bindings::drm_crtc) -> i32>,
+    pub(crate) disable_vblank: Option<unsafe extern "C" fn(crtc: *mut bindings::drm_crtc)>,
+    pub(crate) get_vblank_timestamp: Option<
+        unsafe extern "C" fn(
+            crtc: *mut bindings::drm_crtc,
+            max_error: *mut i32,
+            vblank_time: *mut bindings::ktime_t,
+            in_vblank_irq: bool,
+        ) -> bool,
+    >,
+}
+
+impl<T: VblankSupport> VblankImpl for T {
+    type Crtc = T::Crtc;
+
+    const VBLANK_OPS: VblankOps = VblankOps {
+        enable_vblank: Some(enable_vblank_callback::<T>),
+        disable_vblank: Some(disable_vblank_callback::<T>),
+        get_vblank_timestamp: Some(get_vblank_timestamp_callback::<T>),
+    };
+}
+
+impl<T> VblankImpl for PhantomData<T>
+where
+    T: DriverCrtc<VblankImpl = PhantomData<T>>,
+{
+    type Crtc = T;
+
+    const VBLANK_OPS: VblankOps = VblankOps {
+        enable_vblank: None,
+        disable_vblank: None,
+        get_vblank_timestamp: None,
+    };
+}
+
+unsafe extern "C" fn enable_vblank_callback<T: VblankSupport>(
+    crtc: *mut bindings::drm_crtc,
+) -> i32 {
+    // SAFETY: We're guaranteed that `crtc` is of type `Crtc<T::Crtc>` by type invariants.
+    let crtc = unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
+
+    // SAFETY: This callback happens with IRQs disabled
+    let irq = unsafe { LocalInterruptDisabled::assume_disabled() };
+
+    // SAFETY: This callback happens with `vbl_lock` already held
+    // We don't want to drop `vbl_lock` when this callback completes since DRM will do this for us,
+    // so wrap the `VblankGuard` in a `ManuallyDrop`
+    let vblank_guard = ManuallyDrop::new(unsafe { VblankGuard::new(crtc, irq) });
+
+    from_result(|| T::enable_vblank(crtc, &vblank_guard, irq).map(|_| 0))
+}
+
+unsafe extern "C" fn disable_vblank_callback<T: VblankSupport>(crtc: *mut bindings::drm_crtc) {
+    // SAFETY: We're guaranteed that `crtc` is of type `Crtc<T::Crtc>` by type invariants.
+    let crtc = unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
+
+    // SAFETY: This callback happens with IRQs disabled
+    let irq = unsafe { LocalInterruptDisabled::assume_disabled() };
+
+    // SAFETY: This call happens with `vbl_lock` already held
+    // We don't want to drop `vbl_lock` when this callback completes since DRM will do this for us,
+    // so wrap the `VblankGuard` in a `ManuallyDrop`
+    let vblank_guard = ManuallyDrop::new(unsafe { VblankGuard::new(crtc, irq) });
+
+    T::disable_vblank(crtc, &vblank_guard, irq);
+}
+
+unsafe extern "C" fn get_vblank_timestamp_callback<T: VblankSupport>(
+    crtc: *mut bindings::drm_crtc,
+    max_error: *mut i32,
+    vblank_time: *mut bindings::ktime_t,
+    in_vblank_irq: bool,
+) -> bool {
+    // SAFETY: We're guaranteed `crtc` is of type `Crtc<T::Crtc>` by type invariance
+    let crtc = unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
+
+    if let Some(timestamp) = T::get_vblank_timestamp(crtc, in_vblank_irq) {
+        // SAFETY: Both of these pointers are guaranteed by the C API to be valid
+        unsafe {
+            (*max_error) = timestamp.max_error;
+            (*vblank_time) = timestamp.time.to_ns();
+        };
+
+        true
+    } else {
+        false
+    }
+}
+
+/// A vblank timestamp.
+///
+/// This type is used by [`VblankSupport::get_vblank_timestamp`] for the implementor to return the
+/// current vblank timestamp for the hardware.
+#[derive(Copy, Clone)]
+pub struct VblankTimestamp {
+    /// The actual vblank timestamp, accuracy to within [`Self::max_error`] nanoseconds
+    pub time: Ktime,
+
+    /// Maximum allowable timestamp error in nanoseconds
+    pub max_error: i32,
+}
+
+/// A trait for [`DriverCrtc`] implementations with hardware vblank support.
+///
+/// This trait is implemented internally by DRM for any [`DriverCrtc`] implementation that
+/// implements [`VblankSupport`]. It is used to expose hardware-vblank driver exclusive methods and
+/// data to users.
+pub trait VblankDriverCrtc: DriverCrtc {}
+
+impl<T, V> VblankDriverCrtc for T
+where
+    T: DriverCrtc<VblankImpl = V>,
+    V: VblankSupport<Crtc = T>,
+{
+}
+
+impl<T: VblankDriverCrtc> Crtc<T> {
+    /// Retrieve a reference to the [`VblankCrtc`] for this [`Crtc`].
+    pub(crate) fn vblank_crtc(&self) -> &VblankCrtc<T> {
+        // SAFETY:
+        // - The data layouts of these types are equivalent via `VblankCrtc`s type invariants
+        // - We don't expose any way of calling `vblank_crtc()` before `drm_vblank_init()` has been
+        //   called.
+        unsafe { VblankCrtc::from_raw(self.get_vblank_ptr()) }
+    }
+
+    /// Access vblank related infrastructure for a [`Crtc`].
+    ///
+    /// This function explicitly locks the device's vblank lock, and allows access to controlling
+    /// the vblank configuration for this CRTC. The lock is dropped once [`VblankGuard`] is
+    /// dropped.
+    pub fn vblank_lock<'a>(&'a self, irq: &'a LocalInterruptDisabled) -> VblankGuard<'a, T> {
+        // SAFETY: `vbl_lock` is initialized for as long as `Crtc` is available to users
+        // INVARIANT: We just acquired `vbl_lock`, fulfilling the invariants of `VblankGuard`
+        unsafe { bindings::spin_lock(addr_of_mut!((*self.drm_dev().as_raw()).vbl_lock)) };
+
+        // SAFETY: We just acquired vbl_lock above
+        unsafe { VblankGuard::new(self, irq) }
+    }
+
+    /// Trigger a vblank event on this [`Crtc`].
+    ///
+    /// Drivers should use this in their vblank interrupt handlers to update the vblank counter and
+    /// send any signals that may be pending.
+    ///
+    /// Returns whether or not the vblank event was handled.
+    #[inline]
+    pub fn handle_vblank(&self) -> bool {
+        // SAFETY: `as_raw()` always returns a valid pointer to an initialized drm_crtc.
+        unsafe { bindings::drm_crtc_handle_vblank(self.as_raw()) }
+    }
+
+    /// Forbid vblank events for a [`Crtc`].
+    ///
+    /// This function disables vblank events for a [`Crtc`], even if [`VblankRef`] objects exist.
+    #[inline]
+    pub fn vblank_off(&self) {
+        // SAFETY: `as_raw()` always returns a valid pointer to an initialized drm_crtc.
+        unsafe { bindings::drm_crtc_vblank_off(self.as_raw()) }
+    }
+
+    /// Allow vblank events for a [`Crtc`].
+    ///
+    /// This function allows users to enable vblank events and acquire [`VblankRef`] objects again.
+    #[inline]
+    pub fn vblank_on(&self) {
+        // SAFETY: `as_raw()` always returns a valid pointer to an initialized drm_crtc.
+        unsafe { bindings::drm_crtc_vblank_on(self.as_raw()) }
+    }
+
+    /// Enable vblank events for a [`Crtc`].
+    ///
+    /// Returns a [`VblankRef`] which will allow vblank events to be sent until it is dropped. Note
+    /// that vblank events may still be disabled by [`Self::vblank_off`].
+    #[must_use = "Vblanks are only enabled until the result from this function is dropped"]
+    pub fn vblank_get(&self) -> Result<VblankRef<'_, T>> {
+        VblankRef::new(self)
+    }
+}
+
+/// Common methods available on any [`CrtcState`] whose [`Crtc`] implements [`VblankSupport`].
+///
+/// This trait is implemented automatically by DRM for any [`DriverCrtc`] implementation that
+/// implements [`VblankSupport`].
+pub trait RawVblankCrtcState: AsRawCrtcState {
+    /// Return the [`PendingVblankEvent`] for this CRTC state, if there is one.
+    fn get_pending_vblank_event(&mut self) -> Option<PendingVblankEvent<'_, Self>>
+    where
+        Self: Sized,
+    {
+        // SAFETY: The driver is the only one that will ever modify this data, and since our
+        // interface follows rust's data aliasing rules that means this is safe to read
+        let event_ptr = unsafe { *self.as_raw() }.event;
+
+        (!event_ptr.is_null()).then_some(PendingVblankEvent(self))
+    }
+}
+
+impl<T, C> RawVblankCrtcState for T
+where
+    T: AsRawCrtcState<Crtc = Crtc<C>>,
+    C: VblankDriverCrtc,
+{
+}
+
+/// A pending vblank event from an atomic state
+pub struct PendingVblankEvent<'a, T: RawVblankCrtcState>(&'a mut T);
+
+impl<'a, T: RawVblankCrtcState> PendingVblankEvent<'a, T> {
+    /// Send this [`PendingVblankEvent`].
+    ///
+    /// A [`PendingVblankEvent`] can only be sent once, so this function consumes the
+    /// [`PendingVblankEvent`].
+    pub fn send<C>(self)
+    where
+        T: RawVblankCrtcState<Crtc = Crtc<C>>,
+        C: VblankDriverCrtc,
+    {
+        let crtc: &Crtc<C> = self.0.crtc();
+        let event_lock = crtc.drm_dev().event_lock();
+        let _guard = event_lock.lock();
+
+        // SAFETY:
+        // - We now hold the appropriate lock to call this function
+        // - Vblanks are enabled as proved by `vbl_ref`, as per the C api requirements
+        // - Our interface is proof that `event` is non-null
+        unsafe { bindings::drm_crtc_send_vblank_event(crtc.as_raw(), (*self.0.as_raw()).event) };
+
+        // SAFETY: The mutable reference in `self.state` is proof that it is safe to mutate this,
+        // and DRM expects us to set this to NULL once we've sent the vblank event.
+        unsafe { (*self.0.as_raw()).event = null_mut() };
+    }
+
+    /// Arm this [`PendingVblankEvent`] to be sent later by the CRTC's vblank interrupt handler.
+    ///
+    /// A [`PendingVblankEvent`] can only be armed once, so this function consumes the
+    /// [`PendingVblankEvent`]. As well, it requires a [`VblankRef`] so that vblank interrupts
+    /// remain enabled until the [`PendingVblankEvent`] has been sent out by the driver's vblank
+    /// interrupt handler.
+    pub fn arm<C>(self, vbl_ref: VblankRef<'_, C>)
+    where
+        T: RawVblankCrtcState<Crtc = Crtc<C>>,
+        C: VblankDriverCrtc,
+    {
+        let crtc: &Crtc<C> = self.0.crtc();
+        let event_lock = crtc.drm_dev().event_lock();
+        let _guard = event_lock.lock();
+
+        // SAFETY:
+        // - We now hold the appropriate lock to call this function
+        // - Vblanks are enabled as proved by `vbl_ref`, as per the C api requirements
+        // - Our interface is proof that `event` is non-null
+        unsafe { bindings::drm_crtc_arm_vblank_event(crtc.as_raw(), (*self.0.as_raw()).event) };
+
+        // SAFETY: The mutable reference in `self.state` is proof that it is safe to mutate this,
+        // and DRM expects us to set this to NULL once we've armed the vblank event.
+        unsafe { (*self.0.as_raw()).event = null_mut() };
+
+        // DRM took ownership of `vbl_ref` after we called `drm_crtc_arm_vblank_event`
+        mem::forget(vbl_ref);
+    }
+}
+
+/// A borrowed vblank reference.
+///
+/// This object keeps the vblank reference count for a [`Crtc`] incremented for as long as it
+/// exists, enabling vblank interrupts for said [`Crtc`] until all references are dropped, or
+/// [`Crtc::vblank_off`] is called - whichever comes first.
+pub struct VblankRef<'a, T: VblankDriverCrtc>(&'a Crtc<T>);
+
+impl<T: VblankDriverCrtc> Drop for VblankRef<'_, T> {
+    fn drop(&mut self) {
+        // SAFETY: as_raw() returns a valid pointer to an initialized drm_crtc
+        unsafe { bindings::drm_crtc_vblank_put(self.0.as_raw()) };
+    }
+}
+
+impl<'a, T: VblankDriverCrtc> VblankRef<'a, T> {
+    fn new(crtc: &'a Crtc<T>) -> Result<Self> {
+        // SAFETY: as_raw() returns a valid pointer to an initialized drm_crtc
+        to_result(unsafe { bindings::drm_crtc_vblank_get(crtc.as_raw()) })?;
+
+        Ok(Self(crtc))
+    }
+}
+
+/// The base wrapper for [`drm_vblank_crtc`].
+///
+/// Users will rarely interact with this object directly, it is a simple wrapper around
+/// [`drm_vblank_crtc`] which provides access to methods and data that is not protected by a lock.
+///
+/// # Invariants
+///
+/// This type has an identical data layout to [`drm_vblank_crtc`].
+///
+/// [`drm_vblank_crtc`]: srctree/include/drm/drm_vblank.h
+#[repr(transparent)]
+pub struct VblankCrtc<T>(Opaque<bindings::drm_vblank_crtc>, PhantomData<T>);
+
+impl<T: VblankDriverCrtc> VblankCrtc<T> {
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_vblank_crtc {
+        self.0.get()
+    }
+
+    // SAFETY: The caller promises that `ptr` points to a valid instance of
+    // `bindings::drm_vblank_crtc`, and that access to this structure has been properly serialized
+    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::drm_vblank_crtc) -> &'a Self {
+        // SAFETY: Our data layouts are identical via #[repr(transparent)]
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns the [`Device`] for this [`VblankGuard`]
+    pub fn drm_dev(&self) -> &Device<T::Driver> {
+        // SAFETY: `drm` is initialized, invariant and valid throughout our lifetime
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+}
+
+// NOTE: This type does not use a `Guard` because the mutex is not contained within the same
+// structure as the relevant CRTC
+/// An interface for accessing and controlling vblank related state for a [`Crtc`].
+///
+/// This type may be returned from some [`VblankSupport`] callbacks, or manually via
+/// [`Crtc::vblank_lock`]. It provides access to methods and data which require
+/// [`drm_device.vbl_lock`] be held.
+///
+/// # Invariants
+///
+/// - [`drm_device.vbl_lock`] is acquired whenever an instance of this type exists.
+/// - Shares the invariants of [`VblankCrtc`].
+///
+/// [`drm_device.vbl_lock`]: srctree/include/drm/drm_device.h
+#[repr(transparent)]
+pub struct VblankGuard<'a, T: VblankDriverCrtc>(&'a VblankCrtc<T>);
+
+impl<'a, T: VblankDriverCrtc> VblankGuard<'a, T> {
+    /// Construct a new [`VblankGuard`]
+    ///
+    /// # Safety
+    ///
+    /// The caller must have already acquired [`drm_device.vbl_lock`].
+    ///
+    /// [`drm_device.vbl_lock`]: srctree/include/drm/drm_device.h
+    pub(crate) unsafe fn new(crtc: &'a Crtc<T>, _irq: &'a LocalInterruptDisabled) -> Self {
+        // INVARIANT: The caller promises that we've acquired `vbl_lock`
+        Self(crtc.vblank_crtc())
+    }
+
+    /// Returns the duration of a single scanout frame in ns
+    pub fn frame_duration(&self) -> i32 {
+        // SAFETY: We hold the appropriate lock for this read via our type invariants.
+        unsafe { *self.as_raw() }.framedur_ns
+    }
+}
+
+impl<T: VblankDriverCrtc> Deref for VblankGuard<'_, T> {
+    type Target = VblankCrtc<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<T: VblankDriverCrtc> Drop for VblankGuard<'_, T> {
+    fn drop(&mut self) {
+        // SAFETY:
+        // - We acquired this spinlock when creating this object
+        // - This lock is guaranteed to be initialized for as long as our DRM device is exposed to
+        //   users.
+        unsafe { bindings::spin_unlock(addr_of_mut!((*self.drm_dev().as_raw()).vbl_lock)) }
+    }
+}
-- 
2.48.1

