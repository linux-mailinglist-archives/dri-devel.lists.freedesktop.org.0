Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B399A53DFA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7466010E747;
	Wed,  5 Mar 2025 23:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TyEro6WE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEBD10E747
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGO5kh/FxYY4WW0hhW60ooUs3kL6mfXtdUoujsd3eU4=;
 b=TyEro6WEQJJH71Lv+X1ky00y0BmnNY6T9Btii+XnWR7utk39KiU4qulRQlUI2xvB2GHp3A
 3n3eChtziv8TWmr8WGgouHk25frSMU4VhSJddmBOVee7B39ZAfmoLgbig/2oCrgwdOr0kW
 rDJy0gCQxUV/9hdfahsLF0q6pV9Wm9k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-vsZp3jOhPpaF8m1PkZoR5Q-1; Wed,
 05 Mar 2025 18:05:39 -0500
X-MC-Unique: vsZp3jOhPpaF8m1PkZoR5Q-1
X-Mimecast-MFC-AGG-ID: vsZp3jOhPpaF8m1PkZoR5Q_1741215937
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EAE8E1801A00; Wed,  5 Mar 2025 23:05:36 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C3072300019E; Wed,  5 Mar 2025 23:05:32 +0000 (UTC)
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
Subject: [RFC v3 07/33] rust: drm/kms: Add drm_encoder bindings
Date: Wed,  5 Mar 2025 17:59:23 -0500
Message-ID: <20250305230406.567126-8-lyude@redhat.com>
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

The last thing we need to be able to register a KMS driver is the ability
to create DRM encoders, so let's add bindings for that. Again, these
bindings follow the same general pattern as CRTCs, planes, and connector
with one difference: encoders don't have an atomic state.

Note that not having an atomic state doesn't mean there aren't plenty of
valid usecases for a driver to stick private data within a DRM encoder,
hence why we reuse the aforementioned pattern.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Add safety comments for ModeObject implementation
* Make AsRawEncoder unsafe so that we have a guarantee that `as_raw()`
  always returns a valid pointer.
* Introduce UnregisteredEncoder type
* Don't have AsRawEncoder be a supertrait of StaticModeObject. We don't want
  Unregistered mode object variants to be able to return a pointer to the
  DRM device since that would break the UnregisteredKmsDevice pattern.
* Turn all of the encoder type IDs into an enum using a new macro
* Use addr_of_mut!() instead of &mut for accessing C struct fields

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/kms.rs          |   1 +
 rust/kernel/drm/kms/encoder.rs  | 324 ++++++++++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 rust/kernel/drm/kms/encoder.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 551ddcf02ea0e..a6735f6fba947 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -13,6 +13,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fbdev_shmem.h>
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index f8d6d522c9d96..f0044d396e1eb 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -4,6 +4,7 @@
 
 pub mod connector;
 pub mod crtc;
+pub mod encoder;
 pub mod plane;
 
 use crate::{
diff --git a/rust/kernel/drm/kms/encoder.rs b/rust/kernel/drm/kms/encoder.rs
new file mode 100644
index 0000000000000..2e4e88055c890
--- /dev/null
+++ b/rust/kernel/drm/kms/encoder.rs
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM encoders.
+//!
+//! C header: [`include/drm/drm_encoder.h`](srctree/include/drm/drm_encoder.h)
+
+use super::{KmsDriver, ModeObject, StaticModeObject, UnregisteredKmsDevice};
+use crate::{
+    alloc::KBox,
+    drm::device::Device,
+    error::to_result,
+    init::Zeroable,
+    prelude::*,
+    private::Sealed,
+    types::{NotThreadSafe, Opaque},
+};
+use bindings;
+use core::{
+    marker::*,
+    mem,
+    ops::Deref,
+    ptr::{addr_of_mut, null},
+};
+use macros::paste;
+
+/// A macro for generating our type ID enumerator.
+macro_rules! declare_encoder_types {
+    ($( $oldname:ident as $newname:ident ),+) => {
+        #[repr(i32)]
+        #[non_exhaustive]
+        #[derive(Copy, Clone, PartialEq, Eq)]
+        /// An enumerator for all possible [`Encoder`] type IDs.
+        pub enum Type {
+            // Note: bindgen defaults the macro values to u32 and not i32, but DRM takes them as an
+            // i32 - so just do the conversion here
+            $(
+                #[doc = concat!("The encoder type ID for a ", stringify!($newname), " encoder.")]
+                $newname = paste!(crate::bindings::[<DRM_MODE_ENCODER_ $oldname>]) as i32
+            ),+
+        }
+    };
+}
+
+declare_encoder_types! {
+    NONE     as None,
+    DAC      as Dac,
+    TMDS     as Tmds,
+    LVDS     as Lvds,
+    VIRTUAL  as Virtual,
+    DSI      as Dsi,
+    DPMST    as DpMst,
+    DPI      as Dpi
+}
+
+/// The main trait for implementing the [`struct drm_encoder`] API for [`Encoder`].
+///
+/// Any KMS driver should have at least one implementation of this type, which allows them to create
+/// [`Encoder`] objects. Additionally, a driver may store driver-private data within the type that
+/// implements [`DriverEncoder`] - and it will be made available when using a fully typed
+/// [`Encoder`] object.
+///
+/// # Invariants
+///
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_encoder`] pointers are contained within a [`Encoder<Self>`].
+///
+/// [`struct drm_encoder`]: srctree/include/drm/drm_encoder.h
+#[vtable]
+pub trait DriverEncoder: Send + Sync + Sized {
+    /// The generated C vtable for this [`DriverEncoder`] implementation.
+    #[unique]
+    const OPS: &'static DriverEncoderOps = &DriverEncoderOps {
+        funcs: bindings::drm_encoder_funcs {
+            reset: None,
+            destroy: Some(encoder_destroy_callback::<Self>),
+            late_register: None,
+            early_unregister: None,
+            debugfs_init: None,
+        },
+        helper_funcs: bindings::drm_encoder_helper_funcs {
+            dpms: None,
+            mode_valid: None,
+            mode_fixup: None,
+            prepare: None,
+            mode_set: None,
+            commit: None,
+            detect: None,
+            enable: None,
+            disable: None,
+            atomic_check: None,
+            atomic_enable: None,
+            atomic_disable: None,
+            atomic_mode_set: None,
+        },
+    };
+
+    /// The parent driver for this drm_encoder implementation
+    type Driver: KmsDriver;
+
+    /// The type to pass to the `args` field of [`UnregisteredEncoder::new`].
+    ///
+    /// This type will be made available in in the `args` argument of [`Self::new`]. Drivers which
+    /// don't need this can simply pass [`()`] here.
+    type Args;
+
+    /// The constructor for creating a [`Encoder`] using this [`DriverEncoder`] implementation.
+    ///
+    /// Drivers may use this to instantiate their [`DriverEncoder`] object.
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl PinInit<Self, Error>;
+}
+
+/// The generated C vtable for a [`DriverEncoder`].
+///
+/// This type is created internally by DRM.
+pub struct DriverEncoderOps {
+    funcs: bindings::drm_encoder_funcs,
+    helper_funcs: bindings::drm_encoder_helper_funcs,
+}
+
+/// A trait implemented by any type that acts as a [`struct drm_encoder`] interface.
+///
+/// This is implemented internally by DRM.
+///
+/// # Safety
+///
+/// [`as_raw()`] must always return a valid pointer to a [`struct drm_encoder`].
+///
+/// [`struct drm_encoder`]: srctree/include/drm/drm_encoder.h
+/// [`as_raw()`]: AsRawEncoder::as_raw()
+pub unsafe trait AsRawEncoder {
+    /// Return the raw `bindings::drm_encoder` for this DRM encoder.
+    ///
+    /// Drivers should never use this directly
+    fn as_raw(&self) -> *mut bindings::drm_encoder;
+
+    /// Convert a raw `bindings::drm_encoder` pointer into an object of this type.
+    ///
+    /// # Safety
+    ///
+    /// Callers promise that `ptr` points to a valid instance of this type
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_encoder) -> &'a Self;
+}
+
+/// The main interface for a [`struct drm_encoder`].
+///
+/// This type is the main interface for dealing with DRM encoders. In addition, it also allows
+/// immutable access to whatever private data is contained within an implementor's
+/// [`DriverEncoder`] type.
+///
+/// # Invariants
+///
+/// - `encoder` and `inner` are initialized for as long as this object is made available to users.
+/// - The data layout of this structure begins with [`struct drm_encoder`].
+///
+/// [`struct drm_encoder`]: srctree/include/drm/drm_encoder.h
+#[repr(C)]
+#[pin_data]
+pub struct Encoder<T: DriverEncoder> {
+    /// The FFI drm_encoder object
+    encoder: Opaque<bindings::drm_encoder>,
+    /// The driver's private inner data
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+impl<T: DriverEncoder> Sealed for Encoder<T> {}
+
+// SAFETY: DRM expects this to be zero-initialized
+unsafe impl Zeroable for bindings::drm_encoder {}
+
+// SAFETY: Our interface is thread-safe.
+unsafe impl<T: DriverEncoder> Send for Encoder<T> {}
+// SAFETY: Our interface is thread-safe.
+unsafe impl<T: DriverEncoder> Sync for Encoder<T> {}
+
+// SAFETY: We don't expose Encoder<T> to users before `base` is initialized in ::new(), so
+// `raw_mode_obj` always returns a valid pointer to a bindings::drm_mode_object.
+unsafe impl<T: DriverEncoder> ModeObject for Encoder<T> {
+    type Driver = T::Driver;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM encoders exist for as long as the device does, so this pointer is always
+        // valid
+        unsafe { Device::borrow((*self.encoder.get()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose Encoder<T> to users before it's initialized, so `base` is always
+        // initialized
+        unsafe { addr_of_mut!((*self.encoder.get()).base) }
+    }
+}
+
+// SAFETY: Encoders do not have a refcount
+unsafe impl<T: DriverEncoder> StaticModeObject for Encoder<T> {}
+
+impl<T: DriverEncoder> Deref for Encoder<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+// SAFETY:
+// - Via our type invariants our data layout starts with `drm_encoder`.
+// - Since we don't expose `Encoder` to users befre it has been initialized, this and our data
+//   layout ensure that `as_raw()` always returns a valid pointer to a `drm_encoder`.
+unsafe impl<T: DriverEncoder> AsRawEncoder for Encoder<T> {
+    fn as_raw(&self) -> *mut bindings::drm_encoder {
+        self.encoder.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_encoder) -> &'a Self {
+        // SAFETY: Our data layout is starts with to `bindings::drm_encoder`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+/// A [`Encoder`] that has not yet been registered with userspace.
+///
+/// KMS registration is single-threaded, so this object is not thread-safe.
+///
+/// # Invariants
+///
+/// - This object can only exist before its respective KMS device has been registered.
+/// - Otherwise, it inherits all invariants of [`Encoder`] and has an identical data layout.
+pub struct UnregisteredEncoder<T: DriverEncoder>(Encoder<T>, NotThreadSafe);
+
+// SAFETY: We inherit all relevant invariants of `Encoder`
+unsafe impl<T: DriverEncoder> AsRawEncoder for UnregisteredEncoder<T> {
+    fn as_raw(&self) -> *mut bindings::drm_encoder {
+        self.0.as_raw()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_encoder) -> &'a Self {
+        // SAFETY: This is another from_raw() call, so this function shares the same safety contract
+        let encoder = unsafe { Encoder::<T>::from_raw(ptr) };
+
+        // SAFETY: Our data layout is identical via our type invariants.
+        unsafe { mem::transmute(encoder) }
+    }
+}
+
+impl<T: DriverEncoder> Deref for UnregisteredEncoder<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0.inner
+    }
+}
+
+impl<T: DriverEncoder> UnregisteredEncoder<T> {
+    /// Construct a new [`UnregisteredEncoder`].
+    ///
+    /// A driver may use this from their [`KmsDriver::create_objects`] callback in order to
+    /// construct new [`UnregisteredEncoder`] objects.
+    ///
+    /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::create_objects
+    pub fn new<'a, 'b: 'a>(
+        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
+        type_: Type,
+        possible_crtcs: u32,
+        possible_clones: u32,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'b Self> {
+        let this: Pin<KBox<Encoder<T>>> = KBox::try_pin_init(
+            try_pin_init!(Encoder::<T> {
+                encoder: Opaque::new(bindings::drm_encoder {
+                    helper_private: &T::OPS.helper_funcs,
+                    possible_crtcs,
+                    possible_clones,
+                    ..Default::default()
+                }),
+                inner <- T::new(dev, args),
+                _p: PhantomPinned
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // SAFETY:
+        // - `dev` is responsible for destroying the encoder and thus outlives us.
+        // - as_raw() returns valid pointers for each type here
+        // - This initializes `this`
+        // - Our type is proof that this is being called before KMS device registration
+        // - `name` is optional and will be auto-generated by DRM if passed as NULL
+        to_result(unsafe {
+            bindings::drm_encoder_init(
+                dev.as_raw(),
+                this.as_raw(),
+                &T::OPS.funcs,
+                type_ as _,
+                name.map_or(null(), |n| n.as_char_ptr()),
+            )
+        })?;
+
+        // SAFETY: We don't move anything
+        let this = unsafe { Pin::into_inner_unchecked(this) };
+
+        // We'll re-assemble the box in encoder_destroy_callback()
+        let this = KBox::into_raw(this);
+
+        // UnregisteredEncoder has an equivalent data layout
+        let this: *mut Self = this.cast();
+
+        // SAFETY: We just allocated the encoder above, so this pointer must be valid
+        Ok(unsafe { &*this })
+    }
+}
+
+unsafe extern "C" fn encoder_destroy_callback<T: DriverEncoder>(
+    encoder: *mut bindings::drm_encoder,
+) {
+    // SAFETY: DRM guarantees that `encoder` points to a valid initialized `drm_encoder`.
+    unsafe { bindings::drm_encoder_cleanup(encoder) };
+
+    // SAFETY:
+    // - DRM guarantees we are now the only one with access to this [`drm_encoder`].
+    // - This cast is safe via `DriverEncoder`s type invariants.
+    unsafe { drop(KBox::from_raw(encoder as *mut Encoder<T>)) };
+}
-- 
2.48.1

