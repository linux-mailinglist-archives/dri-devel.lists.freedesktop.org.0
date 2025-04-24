Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47CA9B35D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 18:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32F310E821;
	Thu, 24 Apr 2025 16:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GFUSg2IO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF9410E44B;
 Thu, 24 Apr 2025 16:05:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A25A461137;
 Thu, 24 Apr 2025 16:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B039CC4CEE3;
 Thu, 24 Apr 2025 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745510713;
 bh=eDIDIP0yIwESrxxN35qnF8/8t2OFcbde86zD7REwfhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GFUSg2IOZDxLwQFucCyf3JUQfs1z6DZ0wXnaSx2X079pHw2YFCZYGprVaC2rIB82C
 f7QNLI9q9KasvgGewi7DXhkOT1en15VcB/7JPKvpM4J1lUP2tTA+1AowMlnD6Fz1Nj
 pdTR/mOaD8mYHQaX2o1wgxvekXARxfQE4AuzF63rx8Zw8NMgOj+OA9yW8OmdxJHtZG
 Ejutdy6q+0/YRiIhDSuaobjhx6afgQvUvYsSOspHnWRA+fWW/UnhkgkeVaSY+K0h+/
 vO87Nk89T6hY0NFiHugN4A8JH/Uf4Jj0jKn2oZbP/c/ah5hdnGYnoe7JfIZXn/pjBY
 5W0Q7RQTSojvg==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 joelagnelf@nvidia.com, ttabi@nvidia.com, acourbot@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 2/2] drm: nova-drm: add initial driver skeleton
Date: Thu, 24 Apr 2025 18:02:50 +0200
Message-ID: <20250424160452.8070-3-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424160452.8070-1-dakr@kernel.org>
References: <20250424160452.8070-1-dakr@kernel.org>
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

Add the initial nova-drm driver skeleton.

nova-drm is connected to nova-core through the auxiliary bus and
implements the DRM parts of the nova driver stack.

For now, it implements the fundamental DRM abstractions, i.e. creates a
DRM device and registers it, exposing a three sample IOCTLs.

  DRM_IOCTL_NOVA_GETPARAM
    - provides the PCI bar size from the bar that maps the GPUs VRAM
      from nova-core

  DRM_IOCTL_NOVA_GEM_CREATE
    - creates a new dummy DRM GEM object and returns a handle

  DRM_IOCTL_NOVA_GEM_INFO
    - provides metadata for the DRM GEM object behind a given handle

I implemented a small userspace test suite [1] that utilizes this
interface.

Link: https://gitlab.freedesktop.org/dakr/drm-test [1]
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS                    |  12 ++++
 drivers/gpu/drm/Kconfig        |   2 +
 drivers/gpu/drm/Makefile       |   1 +
 drivers/gpu/drm/nova/Kconfig   |  14 +++++
 drivers/gpu/drm/nova/Makefile  |   3 +
 drivers/gpu/drm/nova/driver.rs |  69 ++++++++++++++++++++++
 drivers/gpu/drm/nova/file.rs   |  74 ++++++++++++++++++++++++
 drivers/gpu/drm/nova/gem.rs    |  49 ++++++++++++++++
 drivers/gpu/drm/nova/nova.rs   |  18 ++++++
 drivers/gpu/drm/nova/uapi.rs   |  61 ++++++++++++++++++++
 include/uapi/drm/nova_drm.h    | 101 +++++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h        |   1 +
 12 files changed, 405 insertions(+)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 drivers/gpu/drm/nova/uapi.rs
 create mode 100644 include/uapi/drm/nova_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fe2e531f4cb..f7cffb0a5a77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7594,6 +7594,18 @@ T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
 F:	Documentation/gpu/nova/
 F:	drivers/gpu/nova-core/
 
+DRM DRIVER FOR NVIDIA GPUS [RUST]
+M:	Danilo Krummrich <dakr@kernel.org>
+L:	nouveau@lists.freedesktop.org
+S:	Supported
+Q:	https://patchwork.freedesktop.org/project/nouveau/
+B:	https://gitlab.freedesktop.org/drm/nova/-/issues
+C:	irc://irc.oftc.net/nouveau
+T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
+F:	Documentation/gpu/nova/
+F:	drivers/gpu/drm/nova/
+F:	include/uapi/drm/nova_drm.h
+
 DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
 M:	Stefan Mavrodiev <stefan@olimex.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2cba2b6ebe1c..90cdaa0068bd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -343,6 +343,8 @@ source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
 
+source "drivers/gpu/drm/nova/Kconfig"
+
 source "drivers/gpu/drm/i915/Kconfig"
 
 source "drivers/gpu/drm/xe/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..947ed126135b 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
+obj-$(CONFIG_DRM_NOVA) += nova/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
new file mode 100644
index 000000000000..cf6261584c81
--- /dev/null
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -0,0 +1,14 @@
+config DRM_NOVA
+	tristate "Nova DRM driver"
+	depends on AUXILIARY_BUS
+	depends on DRM
+	depends on PCI
+	depends on RUST
+	default n
+	help
+	  Choose this if you want to build the Nova DRM driver for Nvidia
+	  GSP-based GPUs.
+
+	  This driver is work in progress and may not be functional.
+
+	  If M is selected, the module will be called nova.
diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
new file mode 100644
index 000000000000..42019bff3173
--- /dev/null
+++ b/drivers/gpu/drm/nova/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRM_NOVA) += nova.o
diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
new file mode 100644
index 000000000000..b28b2e05cc15
--- /dev/null
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, prelude::*, types::ARef};
+
+use crate::file::File;
+use crate::gem::NovaObject;
+
+pub(crate) struct NovaDriver {
+    #[expect(unused)]
+    drm: ARef<drm::Device<Self>>,
+}
+
+/// Convienence type alias for the DRM device type for this driver
+pub(crate) type NovaDevice = drm::Device<NovaDriver>;
+
+#[pin_data]
+pub(crate) struct NovaData {
+    pub(crate) adev: ARef<auxiliary::Device>,
+}
+
+const INFO: drm::DriverInfo = drm::DriverInfo {
+    major: 0,
+    minor: 0,
+    patchlevel: 0,
+    name: c_str!("nova"),
+    desc: c_str!("Nvidia Graphics"),
+};
+
+const NOVA_CORE_MODULE_NAME: &CStr = c_str!("NovaCore");
+const AUXILIARY_NAME: &CStr = c_str!("nova-drm");
+
+kernel::auxiliary_device_table!(
+    AUX_TABLE,
+    MODULE_AUX_TABLE,
+    <NovaDriver as auxiliary::Driver>::IdInfo,
+    [(
+        auxiliary::DeviceId::new(NOVA_CORE_MODULE_NAME, AUXILIARY_NAME),
+        ()
+    )]
+);
+
+impl auxiliary::Driver for NovaDriver {
+    type IdInfo = ();
+    const ID_TABLE: auxiliary::IdTable<Self::IdInfo> = &AUX_TABLE;
+
+    fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+        let data = try_pin_init!(NovaData { adev: adev.into() });
+
+        let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
+        drm::Registration::new_foreign_owned(&drm, adev.as_ref(), 0)?;
+
+        Ok(KBox::new(Self { drm }, GFP_KERNEL)?.into())
+    }
+}
+
+#[vtable]
+impl drm::Driver for NovaDriver {
+    type Data = NovaData;
+    type File = File;
+    type Object = gem::Object<NovaObject>;
+
+    const INFO: drm::DriverInfo = INFO;
+
+    kernel::declare_drm_ioctls! {
+        (NOVA_GETPARAM, drm_nova_getparam, ioctl::RENDER_ALLOW, File::get_param),
+        (NOVA_GEM_CREATE, drm_nova_gem_create, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_create),
+        (NOVA_GEM_INFO, drm_nova_gem_info, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_info),
+    }
+}
diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
new file mode 100644
index 000000000000..7e59a34b830d
--- /dev/null
+++ b/drivers/gpu/drm/nova/file.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::{NovaDevice, NovaDriver};
+use crate::gem::NovaObject;
+use crate::uapi::{GemCreate, GemInfo, Getparam};
+use kernel::{
+    alloc::flags::*,
+    drm::{self, gem::BaseObject},
+    pci,
+    prelude::*,
+    types::Opaque,
+    uapi,
+};
+
+pub(crate) struct File;
+
+impl drm::file::DriverFile for File {
+    type Driver = NovaDriver;
+
+    fn open(_dev: &NovaDevice) -> Result<Pin<KBox<Self>>> {
+        Ok(KBox::new(Self, GFP_KERNEL)?.into())
+    }
+}
+
+impl File {
+    /// IOCTL: get_param: Query GPU / driver metadata.
+    pub(crate) fn get_param(
+        dev: &NovaDevice,
+        getparam: &Opaque<uapi::drm_nova_getparam>,
+        _file: &drm::File<File>,
+    ) -> Result<u32> {
+        let adev = &dev.adev;
+        let parent = adev.parent().ok_or(ENOENT)?;
+        let pdev: &pci::Device = parent.try_into()?;
+        let getparam: &Getparam = getparam.into();
+
+        let value = match getparam.param() as u32 {
+            uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
+            _ => return Err(EINVAL),
+        };
+
+        getparam.set_value(value);
+
+        Ok(0)
+    }
+
+    /// IOCTL: gem_create: Create a new DRM GEM object.
+    pub(crate) fn gem_create(
+        dev: &NovaDevice,
+        req: &Opaque<uapi::drm_nova_gem_create>,
+        file: &drm::File<File>,
+    ) -> Result<u32> {
+        let req: &GemCreate = req.into();
+        let obj = NovaObject::new(dev, req.size().try_into()?)?;
+
+        req.set_handle(obj.create_handle(file)?);
+
+        Ok(0)
+    }
+
+    /// IOCTL: gem_info: Query GEM metadata.
+    pub(crate) fn gem_info(
+        _dev: &NovaDevice,
+        req: &Opaque<uapi::drm_nova_gem_info>,
+        file: &drm::File<File>,
+    ) -> Result<u32> {
+        let req: &GemInfo = req.into();
+        let bo = NovaObject::lookup_handle(file, req.handle())?;
+
+        req.set_size(bo.size().try_into()?);
+
+        Ok(0)
+    }
+}
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
new file mode 100644
index 000000000000..33b62d21400c
--- /dev/null
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    drm,
+    drm::{gem, gem::BaseObject},
+    prelude::*,
+    types::ARef,
+};
+
+use crate::{
+    driver::{NovaDevice, NovaDriver},
+    file::File,
+};
+
+/// GEM Object inner driver data
+#[pin_data]
+pub(crate) struct NovaObject {}
+
+impl gem::BaseDriverObject<gem::Object<NovaObject>> for NovaObject {
+    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+        try_pin_init!(NovaObject {})
+    }
+}
+
+impl gem::DriverObject for NovaObject {
+    type Driver = NovaDriver;
+}
+
+impl NovaObject {
+    /// Create a new DRM GEM object.
+    pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
+        let aligned_size = size.next_multiple_of(1 << 12);
+
+        if size == 0 || size > aligned_size {
+            return Err(EINVAL);
+        }
+
+        gem::Object::new(dev, aligned_size)
+    }
+
+    /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
+    #[inline]
+    pub(crate) fn lookup_handle(
+        file: &drm::File<File>,
+        handle: u32,
+    ) -> Result<ARef<gem::Object<Self>>> {
+        gem::Object::lookup_handle(file, handle)
+    }
+}
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
new file mode 100644
index 000000000000..902876aa14d1
--- /dev/null
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova DRM Driver
+
+mod driver;
+mod file;
+mod gem;
+mod uapi;
+
+use crate::driver::NovaDriver;
+
+kernel::module_auxiliary_driver! {
+    type: NovaDriver,
+    name: "Nova",
+    author: "Danilo Krummrich",
+    description: "Nova GPU driver",
+    license: "GPL v2",
+}
diff --git a/drivers/gpu/drm/nova/uapi.rs b/drivers/gpu/drm/nova/uapi.rs
new file mode 100644
index 000000000000..eb228a58d423
--- /dev/null
+++ b/drivers/gpu/drm/nova/uapi.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::uapi;
+
+// TODO Work out some common infrastructure to avoid boilerplate code for uAPI abstractions.
+
+macro_rules! define_uapi_abstraction {
+    ($name:ident <= $inner:ty) => {
+        #[repr(transparent)]
+        pub struct $name(::kernel::types::Opaque<$inner>);
+
+        impl ::core::convert::From<&::kernel::types::Opaque<$inner>> for &$name {
+            fn from(value: &::kernel::types::Opaque<$inner>) -> Self {
+                // SAFETY: `Self` is a transparent wrapper of `$inner`.
+                unsafe { ::core::mem::transmute(value) }
+            }
+        }
+    };
+}
+
+define_uapi_abstraction!(Getparam <= uapi::drm_nova_getparam);
+
+impl Getparam {
+    pub fn param(&self) -> u64 {
+        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
+        unsafe { (*self.0.get()).param }
+    }
+
+    pub fn set_value(&self, v: u64) {
+        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
+        unsafe { (*self.0.get()).value = v };
+    }
+}
+
+define_uapi_abstraction!(GemCreate <= uapi::drm_nova_gem_create);
+
+impl GemCreate {
+    pub fn size(&self) -> u64 {
+        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
+        unsafe { (*self.0.get()).size }
+    }
+
+    pub fn set_handle(&self, handle: u32) {
+        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
+        unsafe { (*self.0.get()).handle = handle };
+    }
+}
+
+define_uapi_abstraction!(GemInfo <= uapi::drm_nova_gem_info);
+
+impl GemInfo {
+    pub fn handle(&self) -> u32 {
+        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
+        unsafe { (*self.0.get()).handle }
+    }
+
+    pub fn set_size(&self, size: u64) {
+        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
+        unsafe { (*self.0.get()).size = size };
+    }
+}
diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
new file mode 100644
index 000000000000..3ca90ed9d2bb
--- /dev/null
+++ b/include/uapi/drm/nova_drm.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __NOVA_DRM_H__
+#define __NOVA_DRM_H__
+
+#include "drm.h"
+
+/* DISCLAIMER: Do not use, this is not a stable uAPI.
+ *
+ * This uAPI serves only testing purposes as long as this driver is still in
+ * development. It is required to implement and test infrastructure which is
+ * upstreamed in the context of this driver. See also [1].
+ *
+ * [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
+ */
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * NOVA_GETPARAM_VRAM_BAR_SIZE
+ *
+ * Query the VRAM BAR size in bytes.
+ */
+#define NOVA_GETPARAM_VRAM_BAR_SIZE	0x1
+
+/**
+ * struct drm_nova_getparam - query GPU and driver metadata
+ */
+struct drm_nova_getparam {
+	/**
+	 * @param: The identifier of the parameter to query.
+	 */
+	__u64 param;
+
+	/**
+	 * @value: The value for the specified parameter.
+	 */
+	__u64 value;
+};
+
+/**
+ * struct drm_nova_gem_create - create a new DRM GEM object
+ */
+struct drm_nova_gem_create {
+	/**
+	 * @handle: The handle of the new DRM GEM object.
+	 */
+	__u32 handle;
+
+	/**
+	 * @pad: 32 bit padding, should be 0.
+	 */
+	__u32 pad;
+
+	/**
+	 * @size: The size of the new DRM GEM object.
+	 */
+	__u64 size;
+};
+
+/**
+ * struct drm_nova_gem_info - query DRM GEM object metadata
+ */
+struct drm_nova_gem_info {
+	/**
+	 * @handle: The handle of the DRM GEM object to query.
+	 */
+	__u32 handle;
+
+	/**
+	 * @pad: 32 bit padding, should be 0.
+	 */
+	__u32 pad;
+
+	/**
+	 * @size: The size of the DRM GEM obejct.
+	 */
+	__u64 size;
+};
+
+#define DRM_NOVA_GETPARAM		0x00
+#define DRM_NOVA_GEM_CREATE		0x01
+#define DRM_NOVA_GEM_INFO		0x02
+
+/* Note: this is an enum so that it can be resolved by Rust bindgen. */
+enum {
+	DRM_IOCTL_NOVA_GETPARAM		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GETPARAM,
+						   struct drm_nova_getparam),
+	DRM_IOCTL_NOVA_GEM_CREATE	= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GEM_CREATE,
+						   struct drm_nova_gem_create),
+	DRM_IOCTL_NOVA_GEM_INFO		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GEM_INFO,
+						   struct drm_nova_gem_info),
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __NOVA_DRM_H__ */
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 19587e55e604..1409441359f5 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -8,6 +8,7 @@
 
 #include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
+#include <uapi/drm/nova_drm.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.49.0

