Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C76BE8FD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B3210EEFD;
	Fri, 17 Mar 2023 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0464F10EEFD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SG4ltpL9G6+swbrKGEeMx5f5tqfqBQLa9yPR9e99PN4=; b=fMvVOs++yDmAoD6K+JkpeXGzV8
 8LeP2ua61vFkKeDzSZi9vehqVHPkneuOcSC1EjAMc7wevgOlxzyrQFa2YTk4QERtstEP/6EYw/A4T
 Bm0xs4RXocMKFUISl8wY4TtDoHa7xO8e6lrm3HaN/cbSSqBp9xclq18CdYemuY1STSpXnMJ8BqRP3
 rGjfX0XO+PzdV4YG/l8+UxiS6LToN+ZFVjfGog4075elvpXnM8/yvA2AAeJBtB2j4oxn5vm+M6XCW
 FK2rSt5dlSx9LOm4YwGNhdPy9qKttoROsXi2sr3ONfxeZuQ4Bv+wh1qMOri6a1UE9nCj5hg5bO8AB
 sccLjlZQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xk-00FrGz-W5; Fri, 17 Mar 2023 13:13:37 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Asahi Lina <lina@asahilina.net>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [RFC PATCH 7/9] drm/rustgem: implement a Rust version of VGEM
Date: Fri, 17 Mar 2023 09:12:11 -0300
Message-Id: <20230317121213.93991-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VGEM driver is a non-hardware backed GEM service and it is currently
implemented in C on the DRM subsystem. This patch introduces a new
version of the VGEM driver written in Rust. This driver provides the
same functionalities and uses the same UAPI of the original VGEM driver.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/Kconfig          |  11 +++
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/rustgem/Makefile |   3 +
 drivers/gpu/drm/rustgem/fence.rs |  56 ++++++++++++++
 drivers/gpu/drm/rustgem/file.rs  | 128 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/rustgem/gem.rs   |  31 ++++++++
 drivers/gpu/drm/rustgem/vgem.rs  | 104 +++++++++++++++++++++++++
 rust/bindings/bindings_helper.h  |   1 +
 8 files changed, 335 insertions(+)
 create mode 100644 drivers/gpu/drm/rustgem/Makefile
 create mode 100644 drivers/gpu/drm/rustgem/fence.rs
 create mode 100644 drivers/gpu/drm/rustgem/file.rs
 create mode 100644 drivers/gpu/drm/rustgem/gem.rs
 create mode 100644 drivers/gpu/drm/rustgem/vgem.rs

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 315cbdf61979..0f886a33e377 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -245,6 +245,17 @@ source "drivers/gpu/drm/kmb/Kconfig"
 
 config DRM_VGEM
 	tristate "Virtual GEM provider"
+	depends on !RUST
+	depends on DRM && MMU
+	select DRM_GEM_SHMEM_HELPER
+	help
+	  Choose this option to get a virtual graphics memory manager,
+	  as used by Mesa's software renderer for enhanced performance.
+	  If M is selected the module will be called vgem.
+
+config DRM_RUSTGEM
+	tristate "Virtual GEM provider written in Rust"
+	depends on RUST
 	depends on DRM && MMU
 	select DRM_GEM_SHMEM_HELPER
 	help
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index cc637343d87b..8bfd40a2d341 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VIA)	+=via/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
+obj-$(CONFIG_DRM_RUSTGEM) += rustgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
diff --git a/drivers/gpu/drm/rustgem/Makefile b/drivers/gpu/drm/rustgem/Makefile
new file mode 100644
index 000000000000..94b67cec0377
--- /dev/null
+++ b/drivers/gpu/drm/rustgem/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_RUSTGEM)	+= vgem.o
diff --git a/drivers/gpu/drm/rustgem/fence.rs b/drivers/gpu/drm/rustgem/fence.rs
new file mode 100644
index 000000000000..9ef1399548e2
--- /dev/null
+++ b/drivers/gpu/drm/rustgem/fence.rs
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: MIT
+
+use core::fmt::Write;
+use core::ops::Deref;
+use kernel::c_str;
+use kernel::dma_fence::*;
+use kernel::prelude::*;
+use kernel::sync::Arc;
+
+static QUEUE_NAME: &CStr = c_str!("vgem_fence");
+static QUEUE_CLASS_KEY: kernel::sync::LockClassKey = kernel::sync::LockClassKey::new();
+
+pub(crate) struct Fence {}
+
+#[vtable]
+impl FenceOps for Fence {
+    const USE_64BIT_SEQNO: bool = false;
+
+    fn get_driver_name<'a>(self: &'a FenceObject<Self>) -> &'a CStr {
+        c_str!("vgem")
+    }
+
+    fn get_timeline_name<'a>(self: &'a FenceObject<Self>) -> &'a CStr {
+        c_str!("unbound")
+    }
+
+    fn fence_value_str(self: &FenceObject<Self>, output: &mut dyn Write) {
+        let _ = output.write_fmt(format_args!("{}", self.seqno()));
+    }
+
+    fn timeline_value_str(self: &FenceObject<Self>, output: &mut dyn Write) {
+        let value = if self.is_signaled() { self.seqno() } else { 0 };
+        let _ = output.write_fmt(format_args!("{}", value));
+    }
+}
+
+pub(crate) struct VgemFence {
+    fence: Arc<UniqueFence<Fence>>,
+}
+
+impl VgemFence {
+    pub(crate) fn create() -> Result<Self> {
+        let fence_ctx = FenceContexts::new(1, QUEUE_NAME, &QUEUE_CLASS_KEY)?;
+        let fence = Arc::try_new(fence_ctx.new_fence(0, Fence {})?)?;
+
+        Ok(Self { fence })
+    }
+}
+
+impl Deref for VgemFence {
+    type Target = UniqueFence<Fence>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.fence
+    }
+}
diff --git a/drivers/gpu/drm/rustgem/file.rs b/drivers/gpu/drm/rustgem/file.rs
new file mode 100644
index 000000000000..2552c7892b0e
--- /dev/null
+++ b/drivers/gpu/drm/rustgem/file.rs
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: MIT
+
+use crate::fence::VgemFence;
+use crate::gem::DriverObject;
+use crate::{VgemDevice, VgemDriver};
+use core::ops::Deref;
+use kernel::dma_fence::RawDmaFence;
+use kernel::drm::gem::BaseObject;
+use kernel::prelude::*;
+use kernel::{bindings, drm, drm::gem::shmem, xarray};
+
+pub(crate) struct File {
+    fences: xarray::XArray<Box<Option<VgemFence>>>,
+}
+
+/// Convenience type alias for our DRM `File` type.
+pub(crate) type DrmFile = drm::file::File<File>;
+
+impl drm::file::DriverFile for File {
+    type Driver = VgemDriver;
+
+    fn open(_device: &VgemDevice) -> Result<Box<Self>> {
+        Ok(Box::try_new(Self {
+            fences: xarray::XArray::new(xarray::flags::ALLOC1)?,
+        })?)
+    }
+}
+
+impl File {
+    /// vgem_fence_attach_ioctl (DRM_IOCTL_VGEM_FENCE_ATTACH):
+    ///
+    /// Create and attach a fence to the vGEM handle. This fence is then exposed
+    /// via the dma-buf reservation object and visible to consumers of the exported
+    /// dma-buf.
+    ///
+    /// If the vGEM handle does not exist, attach returns -ENOENT.
+    ///
+    pub(crate) fn attach(
+        _device: &VgemDevice,
+        data: &mut bindings::drm_vgem_fence_attach,
+        file: &DrmFile,
+    ) -> Result<u32> {
+        if (data.flags & !bindings::VGEM_FENCE_WRITE) != 0 {
+            return Err(EINVAL);
+        }
+
+        if data.pad != 0 {
+            return Err(EINVAL);
+        }
+
+        let obj = shmem::Object::<DriverObject>::lookup_handle(file, data.handle)?;
+
+        let fence = VgemFence::create()?;
+
+        // Check for a conflicting fence
+        let resv = obj.resv();
+        let usage = resv.usage_rw(data.flags & bindings::VGEM_FENCE_WRITE != 0);
+        if !resv.test_signaled(usage) {
+            fence.signal()?;
+            return Err(EBUSY);
+        }
+
+        let usage = if (data.flags & bindings::VGEM_FENCE_WRITE) != 0 {
+            bindings::dma_resv_usage_DMA_RESV_USAGE_WRITE
+        } else {
+            bindings::dma_resv_usage_DMA_RESV_USAGE_READ
+        };
+
+        // Expose the fence via the dma-buf
+        if resv.add_fences(fence.deref(), 1, usage).is_ok() {
+            // Record the fence in our xarray for later signaling
+            if let Ok(id) = file.fences.alloc(Some(Box::try_new(Some(fence))?)) {
+                data.out_fence = id as u32
+            }
+        } else {
+            fence.signal()?;
+        }
+
+        Ok(0)
+    }
+
+    /// vgem_fence_signal_ioctl (DRM_IOCTL_VGEM_FENCE_SIGNAL):
+    ///
+    /// Signal and consume a fence earlier attached to a vGEM handle using
+    /// attach (DRM_IOCTL_VGEM_FENCE_ATTACH).
+    ///
+    /// Signaling a fence indicates to all consumers of the dma-buf that the
+    /// client has completed the operation associated with the fence, and that the
+    /// buffer is then ready for consumption.
+    ///
+    /// If the fence does not exist (or has already been signaled by the client),
+    /// signal returns -ENOENT.
+    ///
+    pub(crate) fn signal(
+        _device: &VgemDevice,
+        data: &mut bindings::drm_vgem_fence_signal,
+        file: &DrmFile,
+    ) -> Result<u32> {
+        if data.flags != 0 {
+            return Err(EINVAL);
+        }
+
+        let fence = file
+            .fences
+            .replace(data.fence as usize, Box::try_new(None)?);
+
+        let fence = match fence {
+            Err(ret) => {
+                return Err(ret);
+            }
+            Ok(None) => {
+                return Err(ENOENT);
+            }
+            Ok(fence) => {
+                let fence = fence.unwrap().unwrap();
+
+                if fence.is_signaled() {
+                    return Err(ETIMEDOUT);
+                }
+
+                fence
+            }
+        };
+
+        fence.signal()?;
+        Ok(0)
+    }
+}
diff --git a/drivers/gpu/drm/rustgem/gem.rs b/drivers/gpu/drm/rustgem/gem.rs
new file mode 100644
index 000000000000..e20bfe4ee0cf
--- /dev/null
+++ b/drivers/gpu/drm/rustgem/gem.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: MIT
+
+use kernel::{
+    drm::{gem, gem::shmem},
+    error::Result,
+};
+
+use crate::file::DrmFile;
+use crate::{VgemDevice, VgemDriver};
+
+/// Represents the inner data of a GEM object for this driver.
+pub(crate) struct DriverObject {}
+
+/// Type alias for the shmem GEM object type for this driver.
+pub(crate) type Object = shmem::Object<DriverObject>;
+
+impl gem::BaseDriverObject<Object> for DriverObject {
+    /// Callback to create the inner data of a GEM object
+    fn new(_dev: &VgemDevice, _size: usize) -> Result<Self> {
+        Ok(Self {})
+    }
+
+    /// Callback to drop all mappings for a GEM object owned by a given `File`
+    fn close(_obj: &Object, _file: &DrmFile) {}
+}
+
+impl shmem::DriverObject for DriverObject {
+    type Driver = VgemDriver;
+
+    const MAP_WC: bool = true;
+}
diff --git a/drivers/gpu/drm/rustgem/vgem.rs b/drivers/gpu/drm/rustgem/vgem.rs
new file mode 100644
index 000000000000..c2fc55bb39bd
--- /dev/null
+++ b/drivers/gpu/drm/rustgem/vgem.rs
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: MIT
+
+//! Driver for a Virtual GEM service.
+
+use kernel::driver::DeviceRemoval;
+use kernel::macros::vtable;
+use kernel::{
+    c_str, device, drm,
+    drm::{drv, ioctl},
+    error::Result,
+    platform,
+    prelude::*,
+    sync::Arc,
+};
+
+mod fence;
+mod file;
+mod gem;
+
+/// Driver metadata
+const INFO: drv::DriverInfo = drv::DriverInfo {
+    major: 1,
+    minor: 0,
+    patchlevel: 0,
+    name: c_str!("vgem"),
+    desc: c_str!("Virtual GEM provider"),
+    date: c_str!("20230201"),
+};
+
+struct Vgem {
+    data: Arc<DeviceData>,
+    _resource: device::Resource,
+    _pdev: platform::Device,
+}
+
+/// Empty struct representing this driver.
+pub(crate) struct VgemDriver;
+
+/// Convenience type alias for the DRM device type for this driver.
+pub(crate) type VgemDevice = kernel::drm::device::Device<VgemDriver>;
+
+///// Convenience type alias for the `device::Data` type for this driver.
+type DeviceData = device::Data<drv::Registration<VgemDriver>, (), ()>;
+
+#[vtable]
+impl drv::Driver for VgemDriver {
+    /// Our `DeviceData` type, reference-counted
+    type Data = Arc<DeviceData>;
+    /// Our `File` type.
+    type File = file::File;
+    /// Our `Object` type.
+    type Object = gem::Object;
+
+    const INFO: drv::DriverInfo = INFO;
+    const FEATURES: u32 = drv::FEAT_GEM | drv::FEAT_RENDER;
+
+    kernel::declare_drm_ioctls! {
+        (VGEM_FENCE_ATTACH, drm_vgem_fence_attach, ioctl::RENDER_ALLOW, file::File::attach),
+        (VGEM_FENCE_SIGNAL, drm_vgem_fence_signal, ioctl::RENDER_ALLOW, file::File::signal),
+    }
+}
+
+impl kernel::Module for Vgem {
+    fn init(_name: &'static CStr, _module: &'static ThisModule) -> Result<Self> {
+        let mut pdev = platform::Device::register(c_str!("vgem"), -1)?;
+        let dev = device::Device::from_dev(&pdev);
+
+        let resource = dev.open_group(core::ptr::null_mut() as *mut core::ffi::c_void)?;
+
+        pdev.coerse_dma_masks(u64::MAX)?;
+
+        let reg = drm::drv::Registration::<VgemDriver>::new(&dev)?;
+
+        let data = kernel::new_device_data!(reg, (), (), "Vgem::Registrations")?;
+
+        let data = Arc::<DeviceData>::from(data);
+
+        kernel::drm_device_register!(
+            data.registrations().ok_or(ENXIO)?.as_pinned_mut(),
+            data.clone(),
+            0
+        )?;
+
+        Ok(Vgem {
+            _pdev: pdev,
+            _resource: resource,
+            data,
+        })
+    }
+}
+
+impl Drop for Vgem {
+    fn drop(&mut self) {
+        self.data.device_remove();
+    }
+}
+
+module! {
+    type: Vgem,
+    name: "vgem",
+    author: "Maíra Canal",
+    description: "Virtual GEM provider",
+    license: "GPL",
+}
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1bf6d762d36e..dc44d3c3b9ad 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -37,6 +37,7 @@
 #include <linux/xarray.h>
 #include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
+#include <uapi/drm/vgem_drm.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
-- 
2.39.2

