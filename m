Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12D90DFFC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33A210E815;
	Tue, 18 Jun 2024 23:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YF7e7z1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9010E811
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0Bto6qyi282V0FfFQETmOtdKduKSr9xi2/2rtGnlRY=;
 b=YF7e7z1gIjcxv3QwyyMbEQJRAAc5BfvqW4jU2yIgXbsCJ7job/6ruuPi8onGjBhFz8Z9Yg
 l1YQrNZ8zlmq9pRnHM9+Yzs1cgPweg504lyUZ8QNHr/GgK8EaxuPlIqzimKBgQ5iGHvS2g
 ZHu2fNEdHWPUJksr0OwmFr8eN2QnnQo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-Ghd-MdHmPa2vf7nQMx_tMg-1; Tue, 18 Jun 2024 19:34:04 -0400
X-MC-Unique: Ghd-MdHmPa2vf7nQMx_tMg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52cb4cf42f6so2607247e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753643; x=1719358443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0Bto6qyi282V0FfFQETmOtdKduKSr9xi2/2rtGnlRY=;
 b=l3NW4WH6RSFzK8eipHMoB19ew/8CumIzZv+I9q70tVs4Lrx8yl0/Bz9Re0+IX4kvVC
 nm+morhmYL7+9DlGuFnNR9+6DU6j/xni+UXX2icoirT6xURhtqNyMZ+n4RGoGe0pPgGR
 wJGkZxFFhlM5ODHdxvapbzm7Ig5molZB8mmFWHdV9878RNnIt6GgpSe2n32yHhNTG9l0
 br/J/fUS+HZoonIWOuuOs80/EQQywT/npRoOh60pK0QtPbIiyMvdJcqhdZxPtq2uDFHG
 qf1zpP5v9jsWX6e77TIhDsE+ddOZxPboLpsE8dvlpfZ5QLrDbjbyc8ItXhMth5pqw+mY
 WD3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy6kAGEllxtEN6JsbN2/32SKDBxaEbd5lUBmc3fQKh4YjBtg32P15jITHZwz4Z9sPDJFrQQGazLuDMcU6QzR+bY5FhTcxhc990jTBm5qsC
X-Gm-Message-State: AOJu0YzOUsxn4emB846eKAz70OVpuEjsUfqPjVdNkZ81LV34N+Qfw9s3
 3h0KChAb3MT0fRq1rH22MYf/e3KLtKaBvTHmFrj3DzfMHEWySnyk2S6UVKxLqshkbmIHD43T6fU
 vRO4BYbFubDqpg0x0UXiQDGeof3NppanPJJHPSBIm0UT1agEc9nJqqkXsKuuJidk0SA==
X-Received: by 2002:a05:6512:3a90:b0:52c:cbb4:7810 with SMTP id
 2adb3069b0e04-52ccbb478afmr258852e87.8.1718753643077; 
 Tue, 18 Jun 2024 16:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE76RwFXNcn06n31+CxDk2+RBLAA6Ow+iK4Kyj7qDOn/TkTQ1xvZUZFDP+7uys3HXRUlJOiUg==
X-Received: by 2002:a05:6512:3a90:b0:52c:cbb4:7810 with SMTP id
 2adb3069b0e04-52ccbb478afmr258835e87.8.1718753642627; 
 Tue, 18 Jun 2024 16:34:02 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f2489sm15331736f8f.69.2024.06.18.16.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:34:02 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 8/8] nova: add initial driver stub
Date: Wed, 19 Jun 2024 01:31:44 +0200
Message-ID: <20240618233324.14217-9-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Add the initial driver stub of Nova, a Rust-based GSP-only driver for
Nvidia GPUs. Nova, in the long term, is intended to serve as the
successor of Nouveau for GSP-firmware-based GPUs. [1]

As a stub driver Nova's focus is to make use of the most basic device /
driver infrastructure required to build a DRM driver on the PCI bus and
serve as demonstration example and justification for this
infrastructure.

In further consequence, the idea is to develop Nova continuously
upstream, using those increments to lift further Rust abstractions and
infrastructure upstream.

Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u [1]
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 MAINTAINERS                    |  10 ++
 drivers/gpu/drm/Kconfig        |   2 +
 drivers/gpu/drm/Makefile       |   1 +
 drivers/gpu/drm/nova/Kconfig   |  12 +++
 drivers/gpu/drm/nova/Makefile  |   3 +
 drivers/gpu/drm/nova/driver.rs |  85 ++++++++++++++++
 drivers/gpu/drm/nova/file.rs   |  70 +++++++++++++
 drivers/gpu/drm/nova/gem.rs    |  50 ++++++++++
 drivers/gpu/drm/nova/gpu.rs    | 173 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/nova/nova.rs   |  18 ++++
 include/uapi/drm/nova_drm.h    | 101 +++++++++++++++++++
 rust/uapi/uapi_helper.h        |   1 +
 12 files changed, 526 insertions(+)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/gpu.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 include/uapi/drm/nova_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..1f08bdb2d5c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7039,6 +7039,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
 F:	drivers/gpu/drm/nouveau/
 F:	include/uapi/drm/nouveau_drm.h
 
+DRM DRIVER (STUB) FOR NVIDIA GSP GPUS [RUST]
+M:	Danilo Krummrich <dakr@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+L:	nouveau@lists.freedesktop.org
+S:	Supported
+C:	irc://irc.oftc.net/nouveau
+T:	git https://gitlab.freedesktop.org/drm/nova.git
+F:	drivers/gpu/drm/nova/
+F:	include/uapi/drm/nova_drm.h
+
 DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
 M:	Stefan Mavrodiev <stefan@olimex.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 026444eeb5c6..4123f0eccff2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -308,6 +308,8 @@ source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
 
+source "drivers/gpu/drm/nova/Kconfig"
+
 source "drivers/gpu/drm/i915/Kconfig"
 
 source "drivers/gpu/drm/xe/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f9ca4f8fa6c5..cec017f4925a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -172,6 +172,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
+obj-$(CONFIG_DRM_NOVA_STUB) += nova/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
new file mode 100644
index 000000000000..3c15593e054b
--- /dev/null
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -0,0 +1,12 @@
+config DRM_NOVA_STUB
+	tristate "Nova GPU driver stub"
+	depends on DRM
+	depends on PCI
+	depends on RUST
+	depends on RUST_FW_LOADER_ABSTRACTIONS
+	default n
+	help
+	  Choose this if you want to build the Nova stub driver for Nvidia
+	  GSP-based GPUs.
+
+	  If M is selected, the module will be called nova.
diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
new file mode 100644
index 000000000000..733ac5fb9f4f
--- /dev/null
+++ b/drivers/gpu/drm/nova/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRM_NOVA_STUB) += nova.o
diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
new file mode 100644
index 000000000000..69d0efeb125e
--- /dev/null
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    bindings, c_str, drm,
+    drm::{drv, ioctl},
+    pci,
+    pci::define_pci_id_table,
+    prelude::*,
+    sync::Arc,
+};
+
+use crate::{file::File, gpu::Gpu};
+
+pub(crate) struct NovaDriver;
+
+/// Convienence type alias for the DRM device type for this driver
+pub(crate) type NovaDevice = drm::device::Device<NovaDriver>;
+
+#[allow(dead_code)]
+pub(crate) struct NovaData {
+    pub(crate) gpu: Arc<Gpu>,
+    pub(crate) pdev: pci::Device,
+}
+
+const BAR0_SIZE: usize = 8;
+pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+
+const INFO: drm::drv::DriverInfo = drm::drv::DriverInfo {
+    major: 0,
+    minor: 0,
+    patchlevel: 0,
+    name: c_str!("nova"),
+    desc: c_str!("Nvidia Graphics"),
+    date: c_str!("20240227"),
+};
+
+impl pci::Driver for NovaDriver {
+    type Data = Arc<NovaData>;
+
+    define_pci_id_table! {
+        (),
+        [ (pci::DeviceId::new(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as u32), None) ]
+    }
+
+    fn probe(pdev: &mut pci::Device, _id_info: Option<&Self::IdInfo>) -> Result<Self::Data> {
+        dev_dbg!(pdev.as_ref(), "Probe Nova GPU driver.\n");
+
+        pdev.enable_device_mem()?;
+        pdev.set_master();
+
+        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova"))?;
+        let data = Arc::new(
+            NovaData {
+                gpu: Gpu::new(pdev, bar)?,
+                pdev: pdev.clone(),
+            },
+            GFP_KERNEL,
+        )?;
+
+        let drm = drm::device::Device::<NovaDriver>::new(pdev.as_ref(), data.clone())?;
+        drm::drv::Registration::new_foreign_owned(drm, 0)?;
+
+        Ok(data)
+    }
+
+    fn remove(data: &Self::Data) {
+        dev_dbg!(data.pdev.as_ref(), "Remove Nova GPU driver.\n");
+    }
+}
+
+#[vtable]
+impl drm::drv::Driver for NovaDriver {
+    type Data = Arc<NovaData>;
+    type File = File;
+    type Object = crate::gem::Object;
+
+    const INFO: drm::drv::DriverInfo = INFO;
+    const FEATURES: u32 = drv::FEAT_GEM;
+
+    kernel::declare_drm_ioctls! {
+        (NOVA_GETPARAM, drm_nova_getparam, ioctl::RENDER_ALLOW, File::get_param),
+        (NOVA_GEM_CREATE, drm_nova_gem_create, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_create),
+        (NOVA_GEM_INFO, drm_nova_gem_info, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_info),
+    }
+}
diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
new file mode 100644
index 000000000000..4fa9df536f78
--- /dev/null
+++ b/drivers/gpu/drm/nova/file.rs
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::{NovaDevice, NovaDriver};
+use crate::gem;
+use kernel::{
+    alloc::flags::*,
+    drm::{self, device::Device as DrmDevice, gem::BaseObject},
+    prelude::*,
+    uapi,
+};
+
+pub(crate) struct File();
+
+/// Convenience type alias for our DRM `File` type
+pub(crate) type DrmFile = drm::file::File<File>;
+
+impl drm::file::DriverFile for File {
+    type Driver = NovaDriver;
+
+    fn open(dev: &DrmDevice<Self::Driver>) -> Result<Pin<Box<Self>>> {
+        dev_dbg!(dev.as_ref(), "drm::device::Device::open\n");
+
+        Ok(Box::into_pin(Box::new(Self(), GFP_KERNEL)?))
+    }
+}
+
+impl File {
+    /// IOCTL: get_param: Query GPU / driver metadata.
+    pub(crate) fn get_param(
+        dev: &NovaDevice,
+        getparam: &mut uapi::drm_nova_getparam,
+        _file: &DrmFile,
+    ) -> Result<u32> {
+        let pdev = &dev.data().pdev;
+
+        getparam.value = match getparam.param as u32 {
+            uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(0)
+    }
+
+    /// IOCTL: gem_create: Create a new DRM GEM object.
+    pub(crate) fn gem_create(
+        dev: &NovaDevice,
+        req: &mut uapi::drm_nova_gem_create,
+        file: &DrmFile,
+    ) -> Result<u32> {
+        let obj = gem::object_new(dev, req.size.try_into()?)?;
+
+        let handle = obj.create_handle(file)?;
+        req.handle = handle;
+
+        Ok(0)
+    }
+
+    /// IOCTL: gem_info: Query GEM metadata.
+    pub(crate) fn gem_info(
+        _dev: &NovaDevice,
+        req: &mut uapi::drm_nova_gem_info,
+        file: &DrmFile,
+    ) -> Result<u32> {
+        let bo = gem::lookup_handle(file, req.handle)?;
+
+        req.size = bo.size().try_into()?;
+
+        Ok(0)
+    }
+}
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
new file mode 100644
index 000000000000..51bc30c226e2
--- /dev/null
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    drm::{
+        gem,
+        gem::{BaseObject, ObjectRef},
+    },
+    prelude::*,
+};
+
+use crate::{
+    driver::{NovaDevice, NovaDriver},
+    file::DrmFile,
+};
+
+/// GEM Object inner driver data
+#[pin_data]
+pub(crate) struct DriverObject {}
+
+/// Type alias for the GEM object tyoe for this driver.
+pub(crate) type Object = gem::Object<DriverObject>;
+
+impl gem::BaseDriverObject<Object> for DriverObject {
+    fn new(dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+        dev_dbg!(dev.as_ref(), "DriverObject::new\n");
+        DriverObject {}
+    }
+}
+
+impl gem::DriverObject for DriverObject {
+    type Driver = NovaDriver;
+}
+
+/// Create a new DRM GEM object.
+pub(crate) fn object_new(dev: &NovaDevice, size: usize) -> Result<ObjectRef<Object>> {
+    let aligned_size = size.next_multiple_of(1 << 12);
+
+    if size == 0 || size > aligned_size {
+        return Err(EINVAL);
+    }
+
+    let gem = Object::new(dev, aligned_size)?;
+
+    Ok(ObjectRef::from_pinned_unique(gem))
+}
+
+/// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
+pub(crate) fn lookup_handle(file: &DrmFile, handle: u32) -> Result<ObjectRef<Object>> {
+    Object::lookup_handle(file, handle)
+}
diff --git a/drivers/gpu/drm/nova/gpu.rs b/drivers/gpu/drm/nova/gpu.rs
new file mode 100644
index 000000000000..d2cc45b6b636
--- /dev/null
+++ b/drivers/gpu/drm/nova/gpu.rs
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString, sync::Arc,
+};
+
+use crate::driver::Bar0;
+use core::fmt::Debug;
+
+/// Enum representing the GPU chipset.
+#[derive(Debug)]
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
+/// Enum representing the GPU generation.
+#[derive(Debug)]
+pub(crate) enum CardType {
+    /// Turing
+    TU100 = 0x160,
+    /// Ampere
+    GA100 = 0x170,
+    /// Ada Lovelace
+    AD100 = 0x190,
+}
+
+/// Structure holding the metadata of the GPU.
+#[allow(dead_code)]
+pub(crate) struct GpuSpec {
+    /// Contents of the boot0 register.
+    boot0: u64,
+    card_type: CardType,
+    chipset: Chipset,
+    /// The revision of the chipset.
+    chiprev: u8,
+}
+
+/// Structure encapsulating the firmware blobs required for the GPU to operate.
+#[allow(dead_code)]
+pub(crate) struct Firmware {
+    booter_load: firmware::Firmware,
+    booter_unload: firmware::Firmware,
+    gsp: firmware::Firmware,
+}
+
+/// Structure holding the resources required to operate the GPU.
+#[allow(dead_code)]
+#[pin_data]
+pub(crate) struct Gpu {
+    spec: GpuSpec,
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
+// TODO replace with something like derive(FromPrimitive)
+impl CardType {
+    fn from_u32(value: u32) -> Option<CardType> {
+        match value {
+            0x160 => Some(CardType::TU100),
+            0x170 => Some(CardType::GA100),
+            0x190 => Some(CardType::AD100),
+            _ => None,
+        }
+    }
+}
+
+impl GpuSpec {
+    fn new(bar: &Devres<Bar0>) -> Result<GpuSpec> {
+        let bar = bar.try_access().ok_or(ENXIO)?;
+        let boot0 = u64::from_le(bar.readq(0));
+        let chip = ((boot0 & 0x1ff00000) >> 20) as u32;
+
+        if boot0 & 0x1f000000 == 0 {
+            return Err(ENODEV);
+        }
+
+        let chipset = match Chipset::from_u32(chip) {
+            Some(x) => x,
+            None => return Err(ENODEV),
+        };
+
+        let card_type = match CardType::from_u32(chip & 0x1f0) {
+            Some(x) => x,
+            None => return Err(ENODEV),
+        };
+
+        Ok(Self {
+            boot0,
+            card_type,
+            chipset,
+            chiprev: (boot0 & 0xff) as u8,
+        })
+    }
+}
+
+impl Firmware {
+    fn new(dev: &device::Device, spec: &GpuSpec, ver: &str) -> Result<Firmware> {
+        let mut chip_name = CString::try_from_fmt(fmt!("{:?}", spec.chipset))?;
+        chip_name.make_ascii_lowercase();
+
+        let fw_booter_load_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin", &*chip_name, ver,))?;
+        let fw_booter_unload_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.bin", &*chip_name, ver))?;
+        let fw_gsp_path =
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chip_name, ver))?;
+
+        let booter_load = firmware::Firmware::request(&fw_booter_load_path, dev)?;
+        let booter_unload = firmware::Firmware::request(&fw_booter_unload_path, dev)?;
+        let gsp = firmware::Firmware::request(&fw_gsp_path, dev)?;
+
+        Ok(Firmware {
+            booter_load,
+            booter_unload,
+            gsp,
+        })
+    }
+}
+
+impl Gpu {
+    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<Arc<Gpu>> {
+        let spec = GpuSpec::new(&bar)?;
+        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
+
+        dev_info!(
+            pdev.as_ref(),
+            "NVIDIA {:?} ({:#x})",
+            spec.chipset,
+            spec.boot0
+        );
+
+        Arc::pin_init(try_pin_init!(Self { spec, bar, fw }), GFP_KERNEL)
+    }
+}
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
new file mode 100644
index 000000000000..c675be404d9b
--- /dev/null
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova GPU Driver
+
+mod driver;
+mod file;
+mod gem;
+mod gpu;
+
+use crate::driver::NovaDriver;
+
+kernel::module_pci_driver! {
+    type: NovaDriver,
+    name: "Nova",
+    author: "Danilo Krummrich",
+    description: "Nova GPU driver",
+    license: "GPL v2",
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
index ed42a456da2e..b9ab3406b2ce 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -8,5 +8,6 @@
 
 #include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
+#include <uapi/drm/nova_drm.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.45.1

