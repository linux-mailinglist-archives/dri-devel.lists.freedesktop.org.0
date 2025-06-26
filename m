Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80FAEA36C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 18:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B18410E8D7;
	Thu, 26 Jun 2025 16:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3857B10E2D0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 16:23:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75611758;
 Thu, 26 Jun 2025 09:23:13 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.66.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 362BA3F66E;
 Thu, 26 Jun 2025 09:23:27 -0700 (PDT)
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
 aliceryhl@google.com, daniel.almeida@collabora.com, boqun.feng@gmail.com
Cc: gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
Date: Thu, 26 Jun 2025 18:23:13 +0200
Message-Id: <20250626162313.2755584-1-beata.michalska@arm.com>
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

With the Opaque<T>, the expectations are that Rust should not
make any assumptions on the layout or invariants of the wrapped
C types. That runs rather counter to ioctl arguments, which must
adhere to certain data-layout constraints. By using Opaque<T>,
ioctl handlers are forced to use unsafe code where none is actually
needed. This adds needless complexity and maintenance overhead,
brining no safety benefits.
Drop the use of Opaque for ioctl arguments as that is not the best
fit here.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
---

Changes in v5:
- Use `.cast::<T>()` for ptr casting

Changes in v4:
- Fixed typo in commit message

Changes in v3:
- Squashed the changes into single commit

Changes in v2:
- Missing Nova changes now included
- Fixed formatting and added comment on safety guarantees


 drivers/gpu/drm/nova/file.rs | 23 ++++++--------
 drivers/gpu/drm/nova/nova.rs |  1 -
 drivers/gpu/drm/nova/uapi.rs | 61 ------------------------------------
 rust/kernel/drm/ioctl.rs     | 11 ++++---
 4 files changed, 16 insertions(+), 80 deletions(-)
 delete mode 100644 drivers/gpu/drm/nova/uapi.rs

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index 7e59a34b830d..7e7d4e2de2fb 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -2,13 +2,11 @@
 
 use crate::driver::{NovaDevice, NovaDriver};
 use crate::gem::NovaObject;
-use crate::uapi::{GemCreate, GemInfo, Getparam};
 use kernel::{
     alloc::flags::*,
     drm::{self, gem::BaseObject},
     pci,
     prelude::*,
-    types::Opaque,
     uapi,
 };
 
@@ -26,20 +24,19 @@ impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
         dev: &NovaDevice,
-        getparam: &Opaque<uapi::drm_nova_getparam>,
+        getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
         let adev = &dev.adev;
         let parent = adev.parent().ok_or(ENOENT)?;
         let pdev: &pci::Device = parent.try_into()?;
-        let getparam: &Getparam = getparam.into();
 
-        let value = match getparam.param() as u32 {
+        let value = match getparam.param as u32 {
             uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
             _ => return Err(EINVAL),
         };
 
-        getparam.set_value(value);
+        getparam.value = value;
 
         Ok(0)
     }
@@ -47,13 +44,12 @@ pub(crate) fn get_param(
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
         dev: &NovaDevice,
-        req: &Opaque<uapi::drm_nova_gem_create>,
+        req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
-        let req: &GemCreate = req.into();
-        let obj = NovaObject::new(dev, req.size().try_into()?)?;
+        let obj = NovaObject::new(dev, req.size.try_into()?)?;
 
-        req.set_handle(obj.create_handle(file)?);
+        req.handle = obj.create_handle(file)?;
 
         Ok(0)
     }
@@ -61,13 +57,12 @@ pub(crate) fn gem_create(
     /// IOCTL: gem_info: Query GEM metadata.
     pub(crate) fn gem_info(
         _dev: &NovaDevice,
-        req: &Opaque<uapi::drm_nova_gem_info>,
+        req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
-        let req: &GemInfo = req.into();
-        let bo = NovaObject::lookup_handle(file, req.handle())?;
+        let bo = NovaObject::lookup_handle(file, req.handle)?;
 
-        req.set_size(bo.size().try_into()?);
+        req.size = bo.size().try_into()?;
 
         Ok(0)
     }
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
index 902876aa14d1..730598defe04 100644
--- a/drivers/gpu/drm/nova/nova.rs
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -5,7 +5,6 @@
 mod driver;
 mod file;
 mod gem;
-mod uapi;
 
 use crate::driver::NovaDriver;
 
diff --git a/drivers/gpu/drm/nova/uapi.rs b/drivers/gpu/drm/nova/uapi.rs
deleted file mode 100644
index eb228a58d423..000000000000
--- a/drivers/gpu/drm/nova/uapi.rs
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-use kernel::uapi;
-
-// TODO Work out some common infrastructure to avoid boilerplate code for uAPI abstractions.
-
-macro_rules! define_uapi_abstraction {
-    ($name:ident <= $inner:ty) => {
-        #[repr(transparent)]
-        pub struct $name(::kernel::types::Opaque<$inner>);
-
-        impl ::core::convert::From<&::kernel::types::Opaque<$inner>> for &$name {
-            fn from(value: &::kernel::types::Opaque<$inner>) -> Self {
-                // SAFETY: `Self` is a transparent wrapper of `$inner`.
-                unsafe { ::core::mem::transmute(value) }
-            }
-        }
-    };
-}
-
-define_uapi_abstraction!(Getparam <= uapi::drm_nova_getparam);
-
-impl Getparam {
-    pub fn param(&self) -> u64 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
-        unsafe { (*self.0.get()).param }
-    }
-
-    pub fn set_value(&self, v: u64) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
-        unsafe { (*self.0.get()).value = v };
-    }
-}
-
-define_uapi_abstraction!(GemCreate <= uapi::drm_nova_gem_create);
-
-impl GemCreate {
-    pub fn size(&self) -> u64 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
-        unsafe { (*self.0.get()).size }
-    }
-
-    pub fn set_handle(&self, handle: u32) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
-        unsafe { (*self.0.get()).handle = handle };
-    }
-}
-
-define_uapi_abstraction!(GemInfo <= uapi::drm_nova_gem_info);
-
-impl GemInfo {
-    pub fn handle(&self) -> u32 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
-        unsafe { (*self.0.get()).handle }
-    }
-
-    pub fn set_size(&self, size: u64) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
-        unsafe { (*self.0.get()).size = size };
-    }
-}
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 445639404fb7..cb30b9ad1808 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -83,7 +83,7 @@ pub mod internal {
 ///
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self>,
-///        data: &Opaque<uapi::argument_type>,
+///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
 /// ```
@@ -138,9 +138,12 @@ pub mod internal {
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
-                            let data = unsafe {
-                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
-                            };
+                            // The `ioctl` argument is exclusively owned by the handler
+                            // and guaranteed by the C implementation (`drm_ioctl()`) to remain
+                            // valid for the entire lifetime of the reference taken here.
+                            // There is no concurrent access or aliasing; no other references
+                            // to this object exist during this call.
+                            let data = unsafe { &mut *(raw_data.cast::<$crate::uapi::$struct>()) };
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::as_ref(raw_file) };
 
-- 
2.25.1

