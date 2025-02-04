Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B15A27AC6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 20:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269A010E038;
	Tue,  4 Feb 2025 19:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tgwQPr6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA1A10E038;
 Tue,  4 Feb 2025 19:04:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9ED585C6582;
 Tue,  4 Feb 2025 19:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FE0C4CEDF;
 Tue,  4 Feb 2025 19:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738695849;
 bh=vLKZJx+AgyLJXaJHRLLCgq9rmOcspj/T/NX5fhccKKI=;
 h=From:To:Cc:Subject:Date:From;
 b=tgwQPr6rAKMG633eVhOt/k8xyb6UvXSuNnd3Sf4nsZ8dxU19GUblTtd1egZduAtj9
 L73Pm9hTiP3PeBcjY1IH0zK+1lPELMgYw+VtPWKFLyZZ59Cp2iy6pde9IugYf08r/0
 lT02Y7sA/GCKVCY2EUxqTcZpK8XttOwZMXhF6ePD6PgE5E+By9ekiCKHcEmYxrfXHH
 IlYL9LONrHzYHCMaJhdqKdwcWNs/6U+loVM5seOTFHvopk02xRLfzIdBGJSFXLxZ+y
 HGTUMv+2SxpI5Bu8wrOBkJemxtFuHEh6LjcxS/7qITdW3PiuPmWWN58WLIKfRqoPV2
 2IK3/kn/sOvBw==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/2] gpu: nova-core: add initial driver stub
Date: Tue,  4 Feb 2025 20:03:11 +0100
Message-ID: <20250204190400.2550-1-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
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

Add the initial nova-core driver stub.

nova-core is intended to serve as a common base for nova-drm (the
corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.

The Nova project, including nova-core and nova-drm, in the long term,
is intended to serve as the successor of Nouveau for all GSP-based GPUs.

The motivation for both, starting a successor project for Nouveau and
doing so using the Rust programming language, is documented in detail
through a previous post on the mailing list [1], an LWN article [2] and a
talk from LPC '24.

In order to avoid the chicken and egg problem to require a user to
upstream Rust abstractions, but at the same time require the Rust
abstractions to implement the driver, nova-core kicks off as a driver
stub and is subsequently developed upstream.

Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u [1]
Link: https://lwn.net/Articles/990736/ [2]
Link: https://youtu.be/3Igmx28B3BQ?si=sBdSEer4tAPKGpOs [3]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Changes in v2:
  - Fix module name in Kconfig description. (John)
  - Expand Kconfig description a bit. (John)
  - Expand name for PCI BAR0 region.
  - Do not store / print boot0 raw register value. (John)
  - Rename CardType to Architecture, rename enum names to represent the
    architecture name and adjust enum values according to the register
    definition. (John)
  - Add an abstraction for register accesses.
  - Print chipset, architecture and revision.
  - Load bootloader firmware. (Timur)
---
 MAINTAINERS                        |  10 ++
 drivers/gpu/Makefile               |   1 +
 drivers/gpu/nova-core/Kconfig      |  14 +++
 drivers/gpu/nova-core/Makefile     |   3 +
 drivers/gpu/nova-core/driver.rs    |  47 ++++++++
 drivers/gpu/nova-core/gpu.rs       | 187 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  15 +++
 drivers/gpu/nova-core/regs.rs      |  60 +++++++++
 drivers/video/Kconfig              |   1 +
 9 files changed, 338 insertions(+)
 create mode 100644 drivers/gpu/nova-core/Kconfig
 create mode 100644 drivers/gpu/nova-core/Makefile
 create mode 100644 drivers/gpu/nova-core/driver.rs
 create mode 100644 drivers/gpu/nova-core/gpu.rs
 create mode 100644 drivers/gpu/nova-core/nova_core.rs
 create mode 100644 drivers/gpu/nova-core/regs.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index d1086e53a317..f7ddca7de0ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7446,6 +7446,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
 F:	drivers/gpu/drm/nouveau/
 F:	include/uapi/drm/nouveau_drm.h
 
+CORE DRIVER FOR NVIDIA GPUS [RUST]
+M:	Danilo Krummrich <dakr@kernel.org>
+L:	nouveau@lists.freedesktop.org
+S:	Supported
+Q:	https://patchwork.freedesktop.org/project/nouveau/
+B:	https://gitlab.freedesktop.org/drm/nova/-/issues
+C:	irc://irc.oftc.net/nouveau
+T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
+F:	drivers/gpu/nova-core/
+
 DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
 M:	Stefan Mavrodiev <stefan@olimex.com>
 S:	Maintained
diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 8997f0096545..36a54d456630 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -5,3 +5,4 @@
 obj-y			+= host1x/ drm/ vga/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
+obj-$(CONFIG_NOVA_CORE)		+= nova-core/
diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
new file mode 100644
index 000000000000..ad0c06756516
--- /dev/null
+++ b/drivers/gpu/nova-core/Kconfig
@@ -0,0 +1,14 @@
+config NOVA_CORE
+	tristate "Nova Core GPU driver"
+	depends on PCI
+	depends on RUST
+	depends on RUST_FW_LOADER_ABSTRACTIONS
+	default n
+	help
+	  Choose this if you want to build the Nova Core driver for Nvidia
+	  GPUs based on the GPU System Processor (GSP). This is true for Turing
+	  and later GPUs.
+
+	  This driver is work in progress and may not be functional.
+
+	  If M is selected, the module will be called nova_core.
diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
new file mode 100644
index 000000000000..2d78c50126e1
--- /dev/null
+++ b/drivers/gpu/nova-core/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_NOVA_CORE) += nova_core.o
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
new file mode 100644
index 000000000000..63c19f140fbd
--- /dev/null
+++ b/drivers/gpu/nova-core/driver.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{bindings, c_str, pci, prelude::*};
+
+use crate::gpu::Gpu;
+
+#[pin_data]
+pub(crate) struct NovaCore {
+    #[pin]
+    pub(crate) gpu: Gpu,
+}
+
+const BAR0_SIZE: usize = 8;
+pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+
+kernel::pci_device_table!(
+    PCI_TABLE,
+    MODULE_PCI_TABLE,
+    <NovaCore as pci::Driver>::IdInfo,
+    [(
+        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as _),
+        ()
+    )]
+);
+
+impl pci::Driver for NovaCore {
+    type IdInfo = ();
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
+
+    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
+
+        pdev.enable_device_mem()?;
+        pdev.set_master();
+
+        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0"))?;
+
+        let this = KBox::pin_init(
+            try_pin_init!(Self {
+                gpu <- Gpu::new(pdev, bar)?,
+            }),
+            GFP_KERNEL,
+        )?;
+
+        Ok(this)
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
new file mode 100644
index 000000000000..be260a8ffe46
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString,
+};
+
+use crate::driver::Bar0;
+use crate::regs;
+use core::fmt;
+
+/// Enum representation of the GPU chipset.
+#[derive(fmt::Debug)]
+pub(crate) enum Chipset {
+    TU102 = 0x162,
+    TU104 = 0x164,
+    TU106 = 0x166,
+    TU117 = 0x167,
+    TU116 = 0x168,
+    GA102 = 0x172,
+    GA103 = 0x173,
+    GA104 = 0x174,
+    GA106 = 0x176,
+    GA107 = 0x177,
+    AD102 = 0x192,
+    AD103 = 0x193,
+    AD104 = 0x194,
+    AD106 = 0x196,
+    AD107 = 0x197,
+}
+
+/// Enum representation of the GPU generation.
+#[derive(fmt::Debug)]
+pub(crate) enum Architecture {
+    Turing = 0x16,
+    Ampere = 0x17,
+    Ada = 0x19,
+}
+
+pub(crate) struct Revision {
+    major: u8,
+    minor: u8,
+}
+
+/// Structure holding the metadata of the GPU.
+pub(crate) struct Spec {
+    chipset: Chipset,
+    arch: Architecture,
+    /// The revision of the chipset.
+    revision: Revision,
+}
+
+/// Structure encapsulating the firmware blobs required for the GPU to operate.
+#[allow(dead_code)]
+pub(crate) struct Firmware {
+    booter_load: firmware::Firmware,
+    booter_unload: firmware::Firmware,
+    bootloader: firmware::Firmware,
+    gsp: firmware::Firmware,
+}
+
+/// Structure holding the resources required to operate the GPU.
+#[allow(dead_code)]
+#[pin_data]
+pub(crate) struct Gpu {
+    spec: Spec,
+    /// MMIO mapping of PCI BAR 0
+    bar: Devres<Bar0>,
+    fw: Firmware,
+}
+
+// TODO replace with something like derive(FromPrimitive)
+impl Chipset {
+    fn from_u32(value: u32) -> Option<Chipset> {
+        match value {
+            0x162 => Some(Chipset::TU102),
+            0x164 => Some(Chipset::TU104),
+            0x166 => Some(Chipset::TU106),
+            0x167 => Some(Chipset::TU117),
+            0x168 => Some(Chipset::TU116),
+            0x172 => Some(Chipset::GA102),
+            0x173 => Some(Chipset::GA103),
+            0x174 => Some(Chipset::GA104),
+            0x176 => Some(Chipset::GA106),
+            0x177 => Some(Chipset::GA107),
+            0x192 => Some(Chipset::AD102),
+            0x193 => Some(Chipset::AD103),
+            0x194 => Some(Chipset::AD104),
+            0x196 => Some(Chipset::AD106),
+            0x197 => Some(Chipset::AD107),
+            _ => None,
+        }
+    }
+}
+
+// TODO:
+// - replace with something like derive(FromPrimitive)
+// - consider to store within Chipset, if arbitrary_enum_discriminant becomes stable
+impl Architecture {
+    fn from_u32(value: u32) -> Option<Architecture> {
+        match value {
+            0x16 => Some(Architecture::Turing),
+            0x17 => Some(Architecture::Ampere),
+            0x19 => Some(Architecture::Ada),
+            _ => None,
+        }
+    }
+}
+
+impl Revision {
+    fn new(major: u8, minor: u8) -> Self {
+        Self { major, minor }
+    }
+}
+
+impl fmt::Display for Revision {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{:x}.{:x}", self.major, self.minor)
+    }
+}
+
+impl Spec {
+    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
+        let bar = bar.try_access().ok_or(ENXIO)?;
+        let boot0 = regs::Boot0::read(&bar);
+
+        let Some(chipset) = Chipset::from_u32(boot0.chipset()) else {
+            return Err(ENODEV);
+        };
+
+        let Some(arch) = Architecture::from_u32(boot0.arch()) else {
+            return Err(ENODEV);
+        };
+
+        let revision = Revision::new(boot0.major_rev(), boot0.minor_rev());
+
+        Ok(Self {
+            arch,
+            chipset,
+            revision,
+        })
+    }
+}
+
+impl Firmware {
+    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
+        let mut chip_name = CString::try_from_fmt(fmt!("{:?}", spec.chipset))?;
+        chip_name.make_ascii_lowercase();
+
+        let fw_booter_load_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin", &*chip_name, ver))?;
+        let fw_booter_unload_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.bin", &*chip_name, ver))?;
+        let fw_bootloader_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/bootloader-{}.bin", &*chip_name, ver))?;
+        let fw_gsp_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chip_name, ver))?;
+
+        let booter_load = firmware::Firmware::request(&fw_booter_load_path, dev)?;
+        let booter_unload = firmware::Firmware::request(&fw_booter_unload_path, dev)?;
+        let bootloader = firmware::Firmware::request(&fw_bootloader_path, dev)?;
+        let gsp = firmware::Firmware::request(&fw_gsp_path, dev)?;
+
+        Ok(Firmware {
+            booter_load,
+            booter_unload,
+            bootloader,
+            gsp,
+        })
+    }
+}
+
+impl Gpu {
+    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
+        let spec = Spec::new(&bar)?;
+        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
+
+        dev_info!(
+            pdev.as_ref(),
+            "NVIDIA (Chipset: {:?}, Architecture: {:?}, Revision: {})\n",
+            spec.chipset,
+            spec.arch,
+            spec.revision
+        );
+
+        Ok(pin_init!(Self { spec, bar, fw }))
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
new file mode 100644
index 000000000000..5d0230042793
--- /dev/null
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova Core GPU Driver
+
+mod driver;
+mod gpu;
+mod regs;
+
+kernel::module_pci_driver! {
+    type: driver::NovaCore,
+    name: "NovaCore",
+    author: "Danilo Krummrich",
+    description: "Nova Core GPU driver",
+    license: "GPL v2",
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
new file mode 100644
index 000000000000..65b46f8a67d3
--- /dev/null
+++ b/drivers/gpu/nova-core/regs.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+use kernel::revocable::RevocableGuard;
+
+// TODO
+//
+// Create register definitions via generic macros. See task "Generic register abstraction" in
+// Documentation/gpu/nova/core/todo.rst.
+
+const BOOT0_OFFSET: usize = 0x00000000;
+
+// 3:0
+const BOOT0_MINOR_REV_SHIFT: u8 = 0;
+const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
+
+// 7:4
+const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
+const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
+
+// 23:20
+const BOOT0_IMPL_SHIFT: u8 = 20;
+const BOOT0_IMPL_MASK: u32 = 0x00f00000;
+
+// 28:24
+const BOOT0_ARCH_SHIFT: u8 = 24;
+const BOOT0_ARCH_MASK: u32 = 0x1f000000;
+
+// 28:20 - Combine BOOT0_IMPL and BOOT0_ARCH to a new virtual register field.
+const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
+const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
+
+pub(crate) struct Boot0(u32);
+
+impl Boot0 {
+    #[inline]
+    pub(crate) fn read(bar: &RevocableGuard<'_, Bar0>) -> Self {
+        Self(bar.readl(BOOT0_OFFSET))
+    }
+
+    #[inline]
+    pub(crate) fn chipset(&self) -> u32 {
+        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
+    }
+
+    #[inline]
+    pub(crate) fn arch(&self) -> u32 {
+        (self.0 & BOOT0_ARCH_MASK) >> BOOT0_ARCH_SHIFT
+    }
+
+    #[inline]
+    pub(crate) fn minor_rev(&self) -> u8 {
+        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
+    }
+
+    #[inline]
+    pub(crate) fn major_rev(&self) -> u8 {
+        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
+    }
+}
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 44c9ef1435a2..5df981920a94 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -39,6 +39,7 @@ source "drivers/gpu/vga/Kconfig"
 
 source "drivers/gpu/host1x/Kconfig"
 source "drivers/gpu/ipu-v3/Kconfig"
+source "drivers/gpu/nova-core/Kconfig"
 
 source "drivers/gpu/drm/Kconfig"
 

base-commit: 69b8923f5003664e3ffef102e73333edfa2abdcf
-- 
2.48.1

