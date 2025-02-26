Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416DCA468A1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50B610E997;
	Wed, 26 Feb 2025 17:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nfVZHxan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FEC10E997;
 Wed, 26 Feb 2025 17:56:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A13C0614E2;
 Wed, 26 Feb 2025 17:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DA4C4CEE8;
 Wed, 26 Feb 2025 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740592595;
 bh=n2knh1BmXUTlZBkVust+C74yB7InF1llJidGA8Mnv+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nfVZHxantOIV4nADSb3ZZ371lKQRponngMswL4GvFt1iNBQ7RXip5QD3865/4VYlB
 figoNP/EtZINjIgKqPgLpwGlUR7m0TlmNq0rO5cR74kN5vkmUP4TP2nl7s44ain08z
 NEMgkTS0/apM+Pt6f+QkbCqxlVYJEfJHs+TKeN07f540ndea/9AZQZubKTjtYP+ylk
 5yub0TrooWFl63RjkDmc9bSdPtfKguN1S+bvGbXJIr8LcPSg1oUCbJbyIDbeoXTYFy
 IJA4NxY8nyYsQza0OKGchOHx3iUpt3TTuLTTU+RrXqhIExwH3WNFqQbb0lxjrkXnHQ
 YFCZzt/adxpPg==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 5/6] gpu: nova-core: add initial driver stub
Date: Wed, 26 Feb 2025 18:55:47 +0100
Message-ID: <20250226175552.29381-6-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226175552.29381-1-dakr@kernel.org>
References: <20250226175552.29381-1-dakr@kernel.org>
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
 MAINTAINERS                        |  10 ++
 drivers/gpu/Makefile               |   1 +
 drivers/gpu/nova-core/Kconfig      |  14 ++
 drivers/gpu/nova-core/Makefile     |   3 +
 drivers/gpu/nova-core/driver.rs    |  47 ++++++
 drivers/gpu/nova-core/firmware.rs  |  45 ++++++
 drivers/gpu/nova-core/gpu.rs       | 225 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  19 +++
 drivers/gpu/nova-core/regs.rs      |  55 +++++++
 drivers/video/Kconfig              |   1 +
 10 files changed, 420 insertions(+)
 create mode 100644 drivers/gpu/nova-core/Kconfig
 create mode 100644 drivers/gpu/nova-core/Makefile
 create mode 100644 drivers/gpu/nova-core/driver.rs
 create mode 100644 drivers/gpu/nova-core/firmware.rs
 create mode 100644 drivers/gpu/nova-core/gpu.rs
 create mode 100644 drivers/gpu/nova-core/nova_core.rs
 create mode 100644 drivers/gpu/nova-core/regs.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b0cc181db74..3c8a3b61af38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7438,6 +7438,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
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
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
new file mode 100644
index 000000000000..a94caa7cf8d3
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::gpu;
+use kernel::firmware;
+
+pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
+
+impl<const N: usize> ModInfoBuilder<N> {
+    const fn make_entry_file(self, chipset: &[u8], fw: &[u8]) -> Self {
+        let version = b"535.113.01";
+
+        ModInfoBuilder(
+            self.0
+                .prepare()
+                .push(b"nvidia/")
+                .push(chipset)
+                .push(b"/gsp/")
+                .push(fw)
+                .push(b"-")
+                .push(version)
+                .push(b".bin"),
+        )
+    }
+
+    const fn make_entry_chipset(self, chipset: &[u8]) -> Self {
+        self.make_entry_file(chipset, b"booter_load")
+            .make_entry_file(chipset, b"booter_unload")
+            .make_entry_file(chipset, b"bootloader")
+            .make_entry_file(chipset, b"gsp")
+    }
+
+    pub(crate) const fn create(
+        module_name: &'static kernel::str::CStr,
+    ) -> firmware::ModInfoBuilder<N> {
+        let mut this = Self(firmware::ModInfoBuilder::new(module_name));
+        let mut i = 0;
+
+        while i < gpu::Chipset::NAMES.len() {
+            this = this.make_entry_chipset(gpu::Chipset::NAMES[i].as_bytes());
+            i += 1;
+        }
+
+        this.0
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
new file mode 100644
index 000000000000..7693a5df0dc1
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::BStr, str::CString,
+};
+
+use crate::driver::Bar0;
+use crate::regs;
+use core::fmt;
+
+const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
+    let src = s.as_bytes();
+    let mut dst = [0; N];
+    let mut i = 0;
+
+    while i < src.len() && i < N {
+        dst[i] = (src[i] as char).to_ascii_lowercase() as u8;
+        i += 1;
+    }
+
+    dst
+}
+
+macro_rules! define_chipset {
+    ({ $($variant:ident = $value:expr),* $(,)* }) =>
+    {
+        /// Enum representation of the GPU chipset.
+        #[derive(fmt::Debug)]
+        pub(crate) enum Chipset {
+            $($variant = $value),*,
+        }
+
+        impl Chipset {
+            pub(crate) const ALL: &'static [Chipset] = &[
+                $( Chipset::$variant, )*
+            ];
+
+            pub(crate) const NAMES: [&BStr; Self::ALL.len()] = [
+                $( BStr::from_bytes(
+                        to_lowercase_bytes::<{ stringify!($variant).len() }>(
+                            stringify!($variant)
+                        ).as_slice()
+                ), )*
+            ];
+        }
+    }
+}
+
+define_chipset!({
+    // Turing
+    TU102 = 0x162,
+    TU104 = 0x164,
+    TU106 = 0x166,
+    TU117 = 0x167,
+    TU116 = 0x168,
+    // Ampere
+    GA102 = 0x172,
+    GA103 = 0x173,
+    GA104 = 0x174,
+    GA106 = 0x176,
+    GA107 = 0x177,
+    // Ada
+    AD102 = 0x192,
+    AD103 = 0x193,
+    AD104 = 0x194,
+    AD106 = 0x196,
+    AD107 = 0x197,
+});
+
+impl Chipset {
+    pub(crate) fn arch(&self) -> Architecture {
+        match self {
+            Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
+                Architecture::Turing
+            }
+            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
+                Architecture::Ampere
+            }
+            Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
+                Architecture::Ada
+            }
+        }
+    }
+}
+
+// TODO
+//
+// The resulting strings are used to generate firmware paths, hence the
+// generated strings have to be stable.
+//
+// Hence, replace with something like strum_macros derive(Display).
+//
+// For now, redirect to fmt::Debug for convenience.
+impl fmt::Display for Chipset {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{:?}", self)
+    }
+}
+
+// TODO replace with something like derive(FromPrimitive)
+impl TryFrom<u32> for Chipset {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: u32) -> Result<Self, Self::Error> {
+        match value {
+            0x162 => Ok(Chipset::TU102),
+            0x164 => Ok(Chipset::TU104),
+            0x166 => Ok(Chipset::TU106),
+            0x167 => Ok(Chipset::TU117),
+            0x168 => Ok(Chipset::TU116),
+            0x172 => Ok(Chipset::GA102),
+            0x173 => Ok(Chipset::GA103),
+            0x174 => Ok(Chipset::GA104),
+            0x176 => Ok(Chipset::GA106),
+            0x177 => Ok(Chipset::GA107),
+            0x192 => Ok(Chipset::AD102),
+            0x193 => Ok(Chipset::AD103),
+            0x194 => Ok(Chipset::AD104),
+            0x196 => Ok(Chipset::AD106),
+            0x197 => Ok(Chipset::AD107),
+            _ => Err(ENODEV),
+        }
+    }
+}
+
+/// Enum representation of the GPU generation.
+#[derive(fmt::Debug)]
+pub(crate) enum Architecture {
+    Turing,
+    Ampere,
+    Ada,
+}
+
+pub(crate) struct Revision {
+    major: u8,
+    minor: u8,
+}
+
+impl Revision {
+    fn from_boot0(boot0: regs::Boot0) -> Self {
+        Self {
+            major: boot0.major_rev(),
+            minor: boot0.minor_rev(),
+        }
+    }
+}
+
+impl fmt::Display for Revision {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{:x}.{:x}", self.major, self.minor)
+    }
+}
+
+/// Structure holding the metadata of the GPU.
+pub(crate) struct Spec {
+    chipset: Chipset,
+    /// The revision of the chipset.
+    revision: Revision,
+}
+
+impl Spec {
+    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
+        let bar = bar.try_access().ok_or(ENXIO)?;
+        let boot0 = regs::Boot0::read(&bar);
+
+        Ok(Self {
+            chipset: boot0.chipset().try_into()?,
+            revision: Revision::from_boot0(boot0),
+        })
+    }
+}
+
+/// Structure encapsulating the firmware blobs required for the GPU to operate.
+#[expect(dead_code)]
+pub(crate) struct Firmware {
+    booter_load: firmware::Firmware,
+    booter_unload: firmware::Firmware,
+    bootloader: firmware::Firmware,
+    gsp: firmware::Firmware,
+}
+
+impl Firmware {
+    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
+        let mut chip_name = CString::try_from_fmt(fmt!("{}", spec.chipset))?;
+        chip_name.make_ascii_lowercase();
+
+        let request = |name_| {
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
+                .and_then(|path| firmware::Firmware::request(&path, dev))
+        };
+
+        Ok(Firmware {
+            booter_load: request("booter_load")?,
+            booter_unload: request("booter_unload")?,
+            bootloader: request("bootloader")?,
+            gsp: request("gsp")?,
+        })
+    }
+}
+
+/// Structure holding the resources required to operate the GPU.
+#[pin_data]
+pub(crate) struct Gpu {
+    spec: Spec,
+    /// MMIO mapping of PCI BAR 0
+    bar: Devres<Bar0>,
+    fw: Firmware,
+}
+
+impl Gpu {
+    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
+        let spec = Spec::new(&bar)?;
+        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
+
+        dev_info!(
+            pdev.as_ref(),
+            "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
+            spec.chipset,
+            spec.chipset.arch(),
+            spec.revision
+        );
+
+        Ok(pin_init!(Self { spec, bar, fw }))
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
new file mode 100644
index 000000000000..8479be2a3f31
--- /dev/null
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova Core GPU Driver
+
+mod driver;
+mod firmware;
+mod gpu;
+mod regs;
+
+kernel::module_pci_driver! {
+    type: driver::NovaCore,
+    name: "NovaCore",
+    author: "Danilo Krummrich",
+    description: "Nova Core GPU driver",
+    license: "GPL v2",
+    firmware: [],
+}
+
+kernel::module_firmware!(firmware::ModInfoBuilder);
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
new file mode 100644
index 000000000000..50aefb150b0b
--- /dev/null
+++ b/drivers/gpu/nova-core/regs.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+
+// TODO
+//
+// Create register definitions via generic macros. See task "Generic register
+// abstraction" in Documentation/gpu/nova/core/todo.rst.
+
+const BOOT0_OFFSET: usize = 0x00000000;
+
+// 3:0 - chipset minor revision
+const BOOT0_MINOR_REV_SHIFT: u8 = 0;
+const BOOT0_MINOR_REV_MASK: u32 = 0x0000000f;
+
+// 7:4 - chipset major revision
+const BOOT0_MAJOR_REV_SHIFT: u8 = 4;
+const BOOT0_MAJOR_REV_MASK: u32 = 0x000000f0;
+
+// 23:20 - chipset implementation Identifier (depends on architecture)
+const BOOT0_IMPL_SHIFT: u8 = 20;
+const BOOT0_IMPL_MASK: u32 = 0x00f00000;
+
+// 28:24 - chipset architecture identifier
+const BOOT0_ARCH_MASK: u32 = 0x1f000000;
+
+// 28:20 - chipset identifier (virtual register field combining BOOT0_IMPL and
+//         BOOT0_ARCH)
+const BOOT0_CHIPSET_SHIFT: u8 = BOOT0_IMPL_SHIFT;
+const BOOT0_CHIPSET_MASK: u32 = BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
+
+#[derive(Copy, Clone)]
+pub(crate) struct Boot0(u32);
+
+impl Boot0 {
+    #[inline]
+    pub(crate) fn read(bar: &Bar0) -> Self {
+        Self(bar.readl(BOOT0_OFFSET))
+    }
+
+    #[inline]
+    pub(crate) fn chipset(&self) -> u32 {
+        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
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
 
-- 
2.48.1

