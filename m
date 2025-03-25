Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F753A70DCE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BDE10E629;
	Tue, 25 Mar 2025 23:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="igco0vdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E533B10E629
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 23:56:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5CFBE4342C;
 Tue, 25 Mar 2025 23:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74410C4CEE9;
 Tue, 25 Mar 2025 23:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742946965;
 bh=3JwTfIvNX2xhkr24D7Yv/5ozdMmdBLuoV3YaTlNyqD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=igco0vdGVIMoAz2BAUyC3WIw1vnkmRFDWxsK1dvcwbNUF4Ldm/g/IXp3QlIJiA9WH
 wuREEud58MDan/uU0C0Cw169c019LnruISrWFL7PV5YpG4ja3iWMLdtaMzB8MRhfk/
 ZGxXCUwqkpZphXSZdmS95PM3r3jl6PMKENl5MqamKnlUUJLbqIuzWsIZQtI7A3rWMS
 5l+YkMKuwkNdIqWOlMYhxXCC9aGYxuVgbKnow+apsKWbSx0WUbUn/zpbdqCRKzKlDE
 7moq8ttzJNRTTi0zDFQEfuy1BxXtxXvXxo2iX84HP113yiCKewbX7XuzwdqaVu7jYb
 KKYLiWOu8V1Bg==
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
Subject: [PATCH 2/8] rust: drm: ioctl: Add DRM ioctl abstraction
Date: Wed, 26 Mar 2025 00:54:29 +0100
Message-ID: <20250325235522.3992-3-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325235522.3992-1-dakr@kernel.org>
References: <20250325235522.3992-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

DRM drivers need to be able to declare which driver-specific ioctls they
support. Add an abstraction implementing the required types and a helper
macro to generate the ioctl definition inside the DRM driver.

Note that this macro is not usable until further bits of the abstraction
are in place (but it will not fail to compile on its own, if not called).

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/ioctl.rs        | 159 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 rust/uapi/uapi_helper.h         |   1 +
 5 files changed, 168 insertions(+)
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 83026b6e53b2..b25ea9fe1663 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/blk-mq.h>
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
new file mode 100644
index 000000000000..fe4ce0373d33
--- /dev/null
+++ b/rust/kernel/drm/ioctl.rs
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM IOCTL definitions.
+//!
+//! C header: [`include/linux/drm/drm_ioctl.h`](srctree/include/linux/drm/drm_ioctl.h)
+
+use crate::ioctl;
+
+const BASE: u32 = uapi::DRM_IOCTL_BASE as u32;
+
+/// Construct a DRM ioctl number with no argument.
+#[allow(non_snake_case)]
+#[inline(always)]
+pub const fn IO(nr: u32) -> u32 {
+    ioctl::_IO(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-only argument.
+#[allow(non_snake_case)]
+#[inline(always)]
+pub const fn IOR<T>(nr: u32) -> u32 {
+    ioctl::_IOR::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a write-only argument.
+#[allow(non_snake_case)]
+#[inline(always)]
+pub const fn IOW<T>(nr: u32) -> u32 {
+    ioctl::_IOW::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-write argument.
+#[allow(non_snake_case)]
+#[inline(always)]
+pub const fn IOWR<T>(nr: u32) -> u32 {
+    ioctl::_IOWR::<T>(BASE, nr)
+}
+
+/// Descriptor type for DRM ioctls. Use the `declare_drm_ioctls!{}` macro to construct them.
+pub type DrmIoctlDescriptor = bindings::drm_ioctl_desc;
+
+/// This is for ioctl which are used for rendering, and require that the file descriptor is either
+/// for a render node, or if it’s a legacy/primary node, then it must be authenticated.
+pub const AUTH: u32 = bindings::drm_ioctl_flags_DRM_AUTH;
+
+/// This must be set for any ioctl which can change the modeset or display state. Userspace must
+/// call the ioctl through a primary node, while it is the active master.
+///
+/// Note that read-only modeset ioctl can also be called by unauthenticated clients, or when a
+/// master is not the currently active one.
+pub const MASTER: u32 = bindings::drm_ioctl_flags_DRM_MASTER;
+
+/// Anything that could potentially wreak a master file descriptor needs to have this flag set.
+///
+/// Current that’s only for the SETMASTER and DROPMASTER ioctl, which e.g. logind can call to
+/// force a non-behaving master (display compositor) into compliance.
+///
+/// This is equivalent to callers with the SYSADMIN capability.
+pub const ROOT_ONLY: u32 = bindings::drm_ioctl_flags_DRM_ROOT_ONLY;
+
+/// This is used for all ioctl needed for rendering only, for drivers which support render nodes.
+/// This should be all new render drivers, and hence it should be always set for any ioctl with
+/// `AUTH` set. Note though that read-only query ioctl might have this set, but have not set
+/// DRM_AUTH because they do not require authentication.
+pub const RENDER_ALLOW: u32 = bindings::drm_ioctl_flags_DRM_RENDER_ALLOW;
+
+/// Internal structures used by the `declare_drm_ioctls!{}` macro. Do not use directly.
+#[doc(hidden)]
+pub mod internal {
+    pub use bindings::drm_device;
+    pub use bindings::drm_file;
+    pub use bindings::drm_ioctl_desc;
+}
+
+/// Declare the DRM ioctls for a driver.
+///
+/// Each entry in the list should have the form:
+///
+/// `(ioctl_number, argument_type, flags, user_callback),`
+///
+/// `argument_type` is the type name within the `bindings` crate.
+/// `user_callback` should have the following prototype:
+///
+/// ```ignore
+/// fn foo(device: &kernel::drm::Device<Self>,
+///        data: &mut bindings::argument_type,
+///        file: &kernel::drm::File<Self::File>,
+/// )
+/// ```
+/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::declare_drm_ioctls! {
+///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
+/// }
+/// ```
+///
+#[macro_export]
+macro_rules! declare_drm_ioctls {
+    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) => {
+        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
+            use $crate::uapi::*;
+            const _:() = {
+                let i: u32 = $crate::uapi::DRM_COMMAND_BASE;
+                // Assert that all the IOCTLs are in the right order and there are no gaps,
+                // and that the size of the specified type is correct.
+                $(
+                    let cmd: u32 = $crate::macros::concat_idents!(DRM_IOCTL_, $cmd);
+                    ::core::assert!(i == $crate::ioctl::_IOC_NR(cmd));
+                    ::core::assert!(core::mem::size_of::<$crate::uapi::$struct>() ==
+                                    $crate::ioctl::_IOC_SIZE(cmd));
+                    let i: u32 = i + 1;
+                )*
+            };
+
+            let ioctls = &[$(
+                $crate::drm::ioctl::internal::drm_ioctl_desc {
+                    cmd: $crate::macros::concat_idents!(DRM_IOCTL_, $cmd) as u32,
+                    func: {
+                        #[allow(non_snake_case)]
+                        unsafe extern "C" fn $cmd(
+                                raw_dev: *mut $crate::drm::ioctl::internal::drm_device,
+                                raw_data: *mut ::core::ffi::c_void,
+                                raw_file: *mut $crate::drm::ioctl::internal::drm_file,
+                        ) -> core::ffi::c_int {
+                            // SAFETY:
+                            // - The DRM core ensures the device lives while callbacks are being
+                            //   called.
+                            // - The DRM device must have been registered when we're called through
+                            //   an IOCTL.
+                            //
+                            // FIXME: Currently there is nothing enforcing that the types of the
+                            // dev/file match the current driver these ioctls are being declared
+                            // for, and it's not clear how to enforce this within the type system.
+                            let dev = $crate::drm::device::Device::as_ref(raw_dev);
+                            // SAFETY: This is just the ioctl argument, which hopefully has the
+                            // right type (we've done our best checking the size).
+                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };
+                            // SAFETY: This is just the DRM file structure
+                            let file = unsafe { $crate::drm::File::as_ref(raw_file) };
+
+                            match $func(dev, data, file) {
+                                Err(e) => e.to_errno(),
+                                Ok(i) => i.try_into()
+                                            .unwrap_or($crate::error::code::ERANGE.to_errno()),
+                            }
+                        }
+                        Some($cmd)
+                    },
+                    flags: $flags,
+                    name: $crate::c_str!(::core::stringify!($cmd)).as_char_ptr(),
+                }
+            ),*];
+            ioctls
+        };
+    };
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
new file mode 100644
index 000000000000..9ec6d7cbcaf3
--- /dev/null
+++ b/rust/kernel/drm/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM subsystem abstractions.
+
+pub mod ioctl;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index d9a2ca9d1f20..f0618bb1f32c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -47,6 +47,8 @@
 pub mod device_id;
 pub mod devres;
 pub mod driver;
+#[cfg(CONFIG_DRM = "y")]
+pub mod drm;
 pub mod error;
 pub mod faux;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 76d3f103e764..19587e55e604 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -7,6 +7,7 @@
  */
 
 #include <uapi/asm-generic/ioctl.h>
+#include <uapi/drm/drm.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.49.0

