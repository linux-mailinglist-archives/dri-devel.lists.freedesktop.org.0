Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97016AE248
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C2510E4A6;
	Tue,  7 Mar 2023 14:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A89710E4A1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 81BB142058;
 Tue,  7 Mar 2023 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199207;
 bh=odEitMmgQnLv6N8I5beA3x4xEAfKw5Q0o5W+1zb1Uq0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=RC0KNZdRAjm8I6dSNwqjpDJWYHk41dpDkvn1rl6ayJTvGPU1ivz3uCnyKA6WQy/n1
 R60Zce/vvBHuycoyN3hawXRPjGiwzLplHZbKrY8XWrRpJC1z6uRT0zp4hXKXKEMYz4
 ppO7x3pDfCTBzt2pEd3dgZJXKlN3hyWqDa6wkGCypMmXLAtxw+M+YoYG21bI+drXYR
 bAvp1yvGdGMzlV/5JE0P3bkmKnhKyr5Uyy58J7zNpC6uZNFBgNCQ4YVKa+wH8Ppmza
 9iJ1EqjZ+pSZ3vRoyX2/GZMkELY03THlB6TTOJ6uqM6tSgSCWD+O61EUgj56wgwlFH
 pE1feT/nwHBIQ==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:26 +0900
Subject: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=9667;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=odEitMmgQnLv6N8I5beA3x4xEAfKw5Q0o5W+1zb1Uq0=;
 b=pVDYzlEsrw9so/OnmS15cqXJNcC01JKoowKgcvrbpThVxIO7BRruz7od9ntExpWQktPx4YCXO
 EwvtHQIBKysAyqQfsbYwJ6r30+3rae8H4xWsD5WZClGGRTizDqcEogo
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

DRM drivers need to be able to declare which driver-specific ioctls they
support. This abstraction adds the required types and a helper macro to
generate the ioctl definition inside the DRM driver.

Note that this macro is not usable until further bits of the
abstraction are in place (but it will not fail to compile on its own, if
not called).

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/Kconfig         |   7 ++
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/drm/ioctl.rs        | 147 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   5 ++
 rust/kernel/lib.rs              |   2 +
 5 files changed, 163 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dc0f94f02a82..dab8f0f9aa96 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -27,6 +27,13 @@ menuconfig DRM
 	  details.  You should also select and configure AGP
 	  (/dev/agpgart) support if it is available for your platform.
 
+# Rust abstractions cannot be built as modules currently, so force them as
+# bool by using these intermediate symbols. In the future these could be
+# tristate once abstractions themselves can be built as modules.
+config RUST_DRM
+	bool "Rust support for the DRM subsystem"
+	depends on DRM=y
+
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 91bb7906ca5a..2687bef1676f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_ioctl.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -23,6 +24,7 @@
 #include <linux/sysctl.h>
 #include <linux/timekeeping.h>
 #include <linux/xarray.h>
+#include <uapi/drm/drm.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
new file mode 100644
index 000000000000..10304efbd5f1
--- /dev/null
+++ b/rust/kernel/drm/ioctl.rs
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+#![allow(non_snake_case)]
+
+//! DRM IOCTL definitions.
+//!
+//! C header: [`include/linux/drm/drm_ioctl.h`](../../../../include/linux/drm/drm_ioctl.h)
+
+use crate::ioctl;
+
+const BASE: u32 = bindings::DRM_IOCTL_BASE as u32;
+
+/// Construct a DRM ioctl number with no argument.
+pub const fn IO(nr: u32) -> u32 {
+    ioctl::_IO(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-only argument.
+pub const fn IOR<T>(nr: u32) -> u32 {
+    ioctl::_IOR::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a write-only argument.
+pub const fn IOW<T>(nr: u32) -> u32 {
+    ioctl::_IOW::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-write argument.
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
+/// Current that’s only for the SETMASTER and DROPMASTER ioctl, which e.g. logind can call to force
+/// a non-behaving master (display compositor) into compliance.
+///
+/// This is equivalent to callers with the SYSADMIN capability.
+pub const ROOT_ONLY: u32 = bindings::drm_ioctl_flags_DRM_ROOT_ONLY;
+
+/// Whether drm_ioctl_desc.func should be called with the DRM BKL held or not. Enforced as the
+/// default for all modern drivers, hence there should never be a need to set this flag.
+///
+/// Do not use anywhere else than for the VBLANK_WAIT IOCTL, which is the only legacy IOCTL which
+/// needs this.
+pub const UNLOCKED: u32 = bindings::drm_ioctl_flags_DRM_UNLOCKED;
+
+/// This is used for all ioctl needed for rendering only, for drivers which support render nodes.
+/// This should be all new render drivers, and hence it should be always set for any ioctl with
+/// `AUTH` set. Note though that read-only query ioctl might have this set, but have not set
+/// DRM_AUTH because they do not require authentication.
+pub const RENDER_ALLOW: u32 = bindings::drm_ioctl_flags_DRM_RENDER_ALLOW;
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
+/// ```
+/// fn foo(device: &kernel::drm::device::Device<Self>,
+///        data: &mut bindings::argument_type,
+///        file: &kernel::drm::file::File<Self::File>,
+/// )
+/// ```
+/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
+///
+/// # Examples
+///
+/// ```
+/// kernel::declare_drm_ioctls! {
+///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
+/// }
+/// ```
+///
+#[macro_export]
+macro_rules! declare_drm_ioctls {
+    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) => {
+        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
+            const _:() = {
+                let i: u32 = $crate::bindings::DRM_COMMAND_BASE;
+                // Assert that all the IOCTLs are in the right order and there are no gaps,
+                // and that the sizeof of the specified type is correct.
+                $(
+                    let cmd: u32 = $crate::macros::concat_idents!($crate::bindings::DRM_IOCTL_, $cmd);
+                    ::core::assert!(i == $crate::ioctl::_IOC_NR(cmd));
+                    ::core::assert!(core::mem::size_of::<$crate::bindings::$struct>() == $crate::ioctl::_IOC_SIZE(cmd));
+                    let i: u32 = i + 1;
+                )*
+            };
+
+            let ioctls = &[$(
+                $crate::bindings::drm_ioctl_desc {
+                    cmd: $crate::macros::concat_idents!($crate::bindings::DRM_IOCTL_, $cmd) as u32,
+                    func: {
+                        #[allow(non_snake_case)]
+                        unsafe extern "C" fn $cmd(
+                                raw_dev: *mut $crate::bindings::drm_device,
+                                raw_data: *mut ::core::ffi::c_void,
+                                raw_file_priv: *mut $crate::bindings::drm_file,
+                        ) -> core::ffi::c_int {
+                            // SAFETY: We never drop this, and the DRM core ensures the device lives
+                            // while callbacks are being called.
+                            //
+                            // FIXME: Currently there is nothing enforcing that the types of the
+                            // dev/file match the current driver these ioctls are being declared
+                            // for, and it's not clear how to enforce this within the type system.
+                            let dev = ::core::mem::ManuallyDrop::new(unsafe {
+                                $crate::drm::device::Device::from_raw(raw_dev)
+                            });
+                            // SAFETY: This is just the ioctl argument, which hopefully has the right type
+                            // (we've done our best checking the size).
+                            let data = unsafe { &mut *(raw_data as *mut $crate::bindings::$struct) };
+                            // SAFETY: This is just the DRM file structure
+                            let file = unsafe { $crate::drm::file::File::from_raw(raw_file_priv) };
+
+                            match $func(&*dev, data, &file) {
+                                Err(e) => e.to_kernel_errno(),
+                                Ok(i) => i.try_into().unwrap_or(ERANGE.to_kernel_errno()),
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
index 7903490816bf..cb23d24c6718 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,8 @@ mod build_assert;
 pub mod delay;
 pub mod device;
 pub mod driver;
+#[cfg(CONFIG_RUST_DRM)]
+pub mod drm;
 pub mod error;
 pub mod io_buffer;
 pub mod io_mem;

-- 
2.35.1

