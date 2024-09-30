Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F301F98B0E9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2C10E47A;
	Mon, 30 Sep 2024 23:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OVKfYNFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927C810E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4rfjRqkU+rOu5xBWMssWwYCDhyFvRa9kZUvIuwzUoI=;
 b=OVKfYNFlc6KP+Q6l49gVRPrfmNb2OIVlzLN//FfdMpM7CHtrbMZlHiVw+kg9Dk/f3GeBFS
 WbVjHdvmOc5k0P/zdsj0RjslbH/fQkVxmAaVQh4QyaF+YsmPBAZNNYw9t9dB+beQePpMYE
 OFctzTlI7/6vKXZYs+xabkdiudYc1o4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-iVxDa2flN7a3QiNfhk8r-g-1; Mon,
 30 Sep 2024 19:38:26 -0400
X-MC-Unique: iVxDa2flN7a3QiNfhk8r-g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 40D96193EB26; Mon, 30 Sep 2024 23:38:24 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 25D923003DEC; Mon, 30 Sep 2024 23:38:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 08/35] rust: drm/kms: Add bindings for drm_encoder
Date: Mon, 30 Sep 2024 19:09:51 -0400
Message-ID: <20240930233257.1189730-9-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
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
 rust/kernel/drm/kms.rs         |   1 +
 rust/kernel/drm/kms/encoder.rs | 248 +++++++++++++++++++++++++++++++++
 2 files changed, 249 insertions(+)
 create mode 100644 rust/kernel/drm/kms/encoder.rs

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 4b54611fdba8b..d5cad598f016f 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -4,6 +4,7 @@
 
 pub mod connector;
 pub mod crtc;
+pub mod encoder;
 pub mod fbdev;
 pub mod plane;
 
diff --git a/rust/kernel/drm/kms/encoder.rs b/rust/kernel/drm/kms/encoder.rs
new file mode 100644
index 0000000000000..3ae597093645e
--- /dev/null
+++ b/rust/kernel/drm/kms/encoder.rs
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! drm_encoder abstractions for rust
+
+use crate::{
+    drm::{
+        device::Device,
+        drv::Driver,
+    },
+    prelude::*,
+    sync::Arc,
+    types::Opaque,
+    init::Zeroable,
+    error::to_result,
+    private::Sealed,
+};
+use core::{
+    marker::*,
+    ptr::{null, addr_of_mut},
+    ops::Deref,
+};
+use super::{ModeObject, StaticModeObject, KmsDriver, UnregisteredKmsDevice};
+use bindings;
+
+// TODO: We should alias all of these types with shorter names
+pub use bindings::{
+    DRM_MODE_ENCODER_NONE,
+    DRM_MODE_ENCODER_DAC,
+    DRM_MODE_ENCODER_TMDS,
+    DRM_MODE_ENCODER_LVDS,
+    DRM_MODE_ENCODER_TVDAC,
+    DRM_MODE_ENCODER_VIRTUAL,
+    DRM_MODE_ENCODER_DSI,
+    DRM_MODE_ENCODER_DPMST,
+    DRM_MODE_ENCODER_DPI,
+};
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
+    /// The type to pass to the `args` field of [`Encoder::new`].
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
+/// [`struct drm_encoder`]: srctree/include/drm/drm_encoder.h
+pub trait AsRawEncoder: StaticModeObject {
+    /// Return the raw `bindings::drm_encoder` for this DRM encoder.
+    ///
+    /// Drivers should never use this directly
+    fn as_raw(&self) -> *mut bindings::drm_encoder;
+
+    /// Convert a raw `bindings::drm_encoder` pointer into an object of this type.
+    ///
+    /// SAFETY: Callers promise that `ptr` points to a valid instance of this type
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
+unsafe impl<T: DriverEncoder> Send for Encoder<T> { }
+// SAFETY: Our interface is thread-safe.
+unsafe impl<T: DriverEncoder> Sync for Encoder<T> { }
+
+impl<T: DriverEncoder> ModeObject for Encoder<T> {
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
+        unsafe { &mut (*self.encoder.get()).base }
+    }
+}
+
+// SAFETY: Encoders do not have a refcount
+unsafe impl<T: DriverEncoder> StaticModeObject for Encoder<T> { }
+
+impl<T: DriverEncoder> Deref for Encoder<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverEncoder> AsRawEncoder for Encoder<T> {
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
+impl<T: DriverEncoder> Encoder<T> {
+    /// Construct a new [`Encoder`].
+    ///
+    /// A driver may use this from their [`Kms::create_objects`] callback in order to construct new
+    /// [`Encoder`] objects.
+    ///
+    /// [`Kms::create_objects`]: kernel::drm::kms::Kms::create_objects
+    pub fn new<'a, 'b: 'a>(
+        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
+        type_: u32,
+        possible_crtcs: u32,
+        possible_clones: u32,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'b Self> {
+        let this: Pin<Box<Self>> = Box::try_pin_init(
+            try_pin_init!(Self {
+                encoder: Opaque::new(bindings::drm_encoder {
+                    helper_private: &T::OPS.helper_funcs,
+                    possible_crtcs,
+                    possible_clones,
+                    ..Default::default()
+                }),
+                inner <- T::new(dev, args),
+                _p: PhantomPinned
+            }),
+            GFP_KERNEL
+        )?;
+
+        // SAFETY: FFI call with no special requirements
+        to_result(unsafe {
+            bindings::drm_encoder_init(
+                dev.as_raw(),
+                this.as_raw(),
+                &T::OPS.funcs,
+                type_ as _,
+                name.map_or(null(), |n| n.as_char_ptr())
+            )
+        })?;
+
+        // Convert the box into a raw pointer, we'll re-assemble it in encoder_destroy_callback()
+        // SAFETY: We don't move anything
+        Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) })
+    }
+}
+
+unsafe extern "C" fn encoder_destroy_callback<T: DriverEncoder>(
+    encoder: *mut bindings::drm_encoder
+) {
+    // SAFETY: DRM guarantees that `encoder` points to a valid initialized `drm_encoder`.
+    unsafe { bindings::drm_encoder_cleanup(encoder) };
+
+    // SAFETY:
+    // - DRM guarantees we are now the only one with access to this [`drm_encoder`].
+    // - This cast is safe via `DriverEncoder`s type invariants.
+    unsafe { drop(Box::from_raw(encoder as *mut Encoder<T>)) };
+}
-- 
2.46.1

