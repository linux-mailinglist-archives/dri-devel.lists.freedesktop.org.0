Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3A6AE24A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE64810E4AA;
	Tue,  7 Mar 2023 14:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FF810E4AA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:27:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id A3475424AC;
 Tue,  7 Mar 2023 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199222;
 bh=QBiytwbsc0G1We1dJW1nIZFmB+ztwRRDlj9w4vMV0Ro=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=xAGB4P/oo/JGUzu7/9TffIgLeqScyHn1BdOEXg7j24rlLZwfpKL/pW783VTJLoZDd
 UUUwvllNfz+n8CEH7/VkCJfz2Kt3HCxhYc/EJZjVmLNa1vGNSB69UYBsBpQovNlcoh
 47pv2L5TfESCngho/MbRa1R/Qyn3RvwWrlZmhNgbqrCevLiIoGZkBStabFgTUDOae6
 EORSq8TCMuYNpvigWU0w1OENwm1hxxYY3R9b2vemSUiKCBpX1ZjdRzQRuNu1MU7U9X
 tjCGS3DMxQykbNKsmAIuPbPSkWE6vsMwcLH0hy4JZPjUONAvu86zjL0knadsl9l23V
 0nrfhIIc5PVpA==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:28 +0900
Subject: [PATCH RFC 03/18] rust: drm: file: Add File abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-3-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=5871;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=QBiytwbsc0G1We1dJW1nIZFmB+ztwRRDlj9w4vMV0Ro=;
 b=NkHywoaUixWj5shg1jl7LNEBfnrmuiLisYFWU1LZZmq0/+I3LVSV8lK+ExlBi3b/t/O2ZUFyH
 rzDEcCifeKOBMCzcXcZoiQK3N2xZUcpC/i3ZFKNDrBE1tR6HrJ806z4
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A DRM File is the DRM counterpart to a kernel file structure,
representing an open DRM file descriptor. Add a Rust abstraction to
allow drivers to implement their own File types that implement the
DriverFile trait.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/drv.rs          |   7 ++-
 rust/kernel/drm/file.rs         | 113 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 4 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2a999138c4ae..7d7828faf89c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <linux/delay.h>
 #include <linux/device.h>
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index 29a465515dc9..1dcb651e1417 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -144,6 +144,9 @@ pub trait Driver {
     /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
     type Object: AllocImpl;
 
+    /// The type used to represent a DRM File (client)
+    type File: drm::file::DriverFile;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
@@ -213,8 +216,8 @@ macro_rules! drm_device_register {
 impl<T: Driver> Registration<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
-        open: None, // TODO: File abstraction
-        postclose: None, // TODO: File abstraction
+        open: Some(drm::file::open_callback::<T::File>),
+        postclose: Some(drm::file::postclose_callback::<T::File>),
         lastclose: None,
         unload: None,
         release: None,
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
new file mode 100644
index 000000000000..48751e93c38a
--- /dev/null
+++ b/rust/kernel/drm/file.rs
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM File objects.
+//!
+//! C header: [`include/linux/drm/drm_file.h`](../../../../include/linux/drm/drm_file.h)
+
+use crate::{bindings, drm, error::Result};
+use alloc::boxed::Box;
+use core::marker::PhantomData;
+use core::ops::Deref;
+
+/// Trait that must be implemented by DRM drivers to represent a DRM File (a client instance).
+pub trait DriverFile {
+    /// The parent `Driver` implementation for this `DriverFile`.
+    type Driver: drm::drv::Driver;
+
+    /// Open a new file (called when a client opens the DRM device).
+    fn open(device: &drm::device::Device<Self::Driver>) -> Result<Box<Self>>;
+}
+
+/// An open DRM File.
+///
+/// # Invariants
+/// `raw` is a valid pointer to a `drm_file` struct.
+#[repr(transparent)]
+pub struct File<T: DriverFile> {
+    raw: *mut bindings::drm_file,
+    _p: PhantomData<T>,
+}
+
+pub(super) unsafe extern "C" fn open_callback<T: DriverFile>(
+    raw_dev: *mut bindings::drm_device,
+    raw_file: *mut bindings::drm_file,
+) -> core::ffi::c_int {
+    let drm = core::mem::ManuallyDrop::new(unsafe { drm::device::Device::from_raw(raw_dev) });
+    // SAFETY: This reference won't escape this function
+    let file = unsafe { &mut *raw_file };
+
+    let inner = match T::open(&drm) {
+        Err(e) => {
+            return e.to_kernel_errno();
+        }
+        Ok(i) => i,
+    };
+
+    file.driver_priv = Box::into_raw(inner) as *mut _;
+
+    0
+}
+
+pub(super) unsafe extern "C" fn postclose_callback<T: DriverFile>(
+    _dev: *mut bindings::drm_device,
+    raw_file: *mut bindings::drm_file,
+) {
+    // SAFETY: This reference won't escape this function
+    let file = unsafe { &*raw_file };
+
+    // Drop the DriverFile
+    unsafe { Box::from_raw(file.driver_priv as *mut T) };
+}
+
+impl<T: DriverFile> File<T> {
+    // Not intended to be called externally, except via declare_drm_ioctls!()
+    #[doc(hidden)]
+    pub unsafe fn from_raw(raw_file: *mut bindings::drm_file) -> File<T> {
+        File {
+            raw: raw_file,
+            _p: PhantomData,
+        }
+    }
+
+    #[allow(dead_code)]
+    /// Return the raw pointer to the underlying `drm_file`.
+    pub(super) fn raw(&self) -> *const bindings::drm_file {
+        self.raw
+    }
+
+    /// Return an immutable reference to the raw `drm_file` structure.
+    pub(super) fn file(&self) -> &bindings::drm_file {
+        unsafe { &*self.raw }
+    }
+}
+
+impl<T: DriverFile> Deref for File<T> {
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        unsafe { &*(self.file().driver_priv as *const T) }
+    }
+}
+
+impl<T: DriverFile> crate::private::Sealed for File<T> {}
+
+/// Generic trait to allow users that don't care about driver specifics to accept any File<T>.
+///
+/// # Safety
+/// Must only be implemented for File<T> and return the pointer, following the normal invariants
+/// of that type.
+pub unsafe trait GenericFile: crate::private::Sealed {
+    /// Returns the raw const pointer to the `struct drm_file`
+    fn raw(&self) -> *const bindings::drm_file;
+    /// Returns the raw mut pointer to the `struct drm_file`
+    fn raw_mut(&mut self) -> *mut bindings::drm_file;
+}
+
+unsafe impl<T: DriverFile> GenericFile for File<T> {
+    fn raw(&self) -> *const bindings::drm_file {
+        self.raw
+    }
+    fn raw_mut(&mut self) -> *mut bindings::drm_file {
+        self.raw
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 69376b3c6db9..a767942d0b52 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -4,4 +4,5 @@
 
 pub mod device;
 pub mod drv;
+pub mod file;
 pub mod ioctl;

-- 
2.35.1

