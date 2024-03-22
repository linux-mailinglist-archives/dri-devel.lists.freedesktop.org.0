Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2E8874C6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C6C112825;
	Fri, 22 Mar 2024 22:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="htc2MAU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC25112825
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711145727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2rbFK3Zkwkpa0zSjV5S8wegkn2R9j6nsE8sHWQ00u4=;
 b=htc2MAU0ZcdvOAlb+IQpo6hYZTBbBKD1mT29wzuFQMc+U5u9WYeAWHgagIX4I6huKau6Ac
 QkrAf9okTL+CdMLSfFtkXIY6qk5umDVoCISdzfBYZ9ms/iBvHIsHrEaUIMc0I3db/cJlEe
 VBBuZA4Epkco2VqVSxt3/e+xoC+9P80=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-7wnjtKkHPcy09wf6XsHwfg-1; Fri,
 22 Mar 2024 18:15:22 -0400
X-MC-Unique: 7wnjtKkHPcy09wf6XsHwfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33F7F29AA3B6;
 Fri, 22 Mar 2024 22:15:21 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B60D8173;
 Fri, 22 Mar 2024 22:15:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>,
 "GitAuthor: Lyude Paul" <lyude@redhat.com>,
 linux-kernel@vger.kernel.org (open list),
 rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH 2/4] WIP: drm: Introduce rvkms
Date: Fri, 22 Mar 2024 18:03:34 -0400
Message-ID: <20240322221305.1403600-3-lyude@redhat.com>
In-Reply-To: <20240322221305.1403600-1-lyude@redhat.com>
References: <20240322221305.1403600-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

This introduces a work in progress port of the VKMS driver to rust to
provide a user of the kernel's new rust bindings for KMS drivers! This
driver is very incomplete, I'm not even sure if it loads right now without
crashing (but it did at one point, and I'll be checking very soon!).

Squash into rvkms introduction

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/rvkms/Kconfig      |   3 +
 drivers/gpu/drm/rvkms/Makefile     |   1 +
 drivers/gpu/drm/rvkms/connector.rs |  55 +++++++++++
 drivers/gpu/drm/rvkms/crtc.rs      |  40 ++++++++
 drivers/gpu/drm/rvkms/encoder.rs   |  26 +++++
 drivers/gpu/drm/rvkms/file.rs      |  22 +++++
 drivers/gpu/drm/rvkms/gem.rs       |  32 +++++++
 drivers/gpu/drm/rvkms/output.rs    |  72 ++++++++++++++
 drivers/gpu/drm/rvkms/plane.rs     |  39 ++++++++
 drivers/gpu/drm/rvkms/rvkms.rs     | 146 +++++++++++++++++++++++++++++
 12 files changed, 439 insertions(+)
 create mode 100644 drivers/gpu/drm/rvkms/Kconfig
 create mode 100644 drivers/gpu/drm/rvkms/Makefile
 create mode 100644 drivers/gpu/drm/rvkms/connector.rs
 create mode 100644 drivers/gpu/drm/rvkms/crtc.rs
 create mode 100644 drivers/gpu/drm/rvkms/encoder.rs
 create mode 100644 drivers/gpu/drm/rvkms/file.rs
 create mode 100644 drivers/gpu/drm/rvkms/gem.rs
 create mode 100644 drivers/gpu/drm/rvkms/output.rs
 create mode 100644 drivers/gpu/drm/rvkms/plane.rs
 create mode 100644 drivers/gpu/drm/rvkms/rvkms.rs

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c7edba18a6f09..48c140f943356 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -275,6 +275,8 @@ source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
 
+source "drivers/gpu/drm/rvkms/Kconfig"
+
 source "drivers/gpu/drm/i915/Kconfig"
 
 source "drivers/gpu/drm/xe/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 104b42df2e956..91a18c8290fa4 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -143,6 +143,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
+obj-$(CONFIG_DRM_RVKMS) += rvkms/
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
diff --git a/drivers/gpu/drm/rvkms/Kconfig b/drivers/gpu/drm/rvkms/Kconfig
new file mode 100644
index 0000000000000..d888aa4ffc84c
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/Kconfig
@@ -0,0 +1,3 @@
+config DRM_RVKMS
+        tristate "Rust VKMS PoC driver (EXPERIMENTAL)"
+        depends on RUST && DRM && DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/rvkms/Makefile b/drivers/gpu/drm/rvkms/Makefile
new file mode 100644
index 0000000000000..18e06fc3343c6
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_RVKMS) += rvkms.o
diff --git a/drivers/gpu/drm/rvkms/connector.rs b/drivers/gpu/drm/rvkms/connector.rs
new file mode 100644
index 0000000000000..40f84d38437ee
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/connector.rs
@@ -0,0 +1,55 @@
+// TODO: License and stuff
+// Contain's rvkms's drm_connector implementation
+
+use super::{RvkmsDriver, RvkmsDevice, MAX_RES, DEFAULT_RES};
+use kernel::{
+    prelude::*,
+    drm::{
+        device::Device,
+        kms::{
+            connector::{self, ConnectorGuard},
+            ModeConfigGuard
+        }
+    },
+    prelude::*
+};
+use core::marker::PhantomPinned;
+
+#[pin_data]
+pub(crate) struct DriverConnector {
+    #[pin]
+    _p: PhantomPinned
+}
+
+pub(crate) type Connector = connector::Connector<DriverConnector>;
+
+impl connector::DriverConnector for DriverConnector {
+    type Initializer = impl PinInit<Self, Error>;
+
+    type State = ConnectorState;
+
+    type Driver = RvkmsDriver;
+
+    type Args = ();
+
+    fn new(dev: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+
+    fn get_modes(
+        connector: ConnectorGuard<'_, Self>,
+        _guard: &ModeConfigGuard<'_, Self::Driver>
+    ) -> i32 {
+        let count = connector.add_modes_noedid(MAX_RES);
+
+        connector.set_preferred_mode(DEFAULT_RES);
+        count
+    }
+}
+
+#[derive(Clone, Default)]
+pub(crate) struct ConnectorState;
+
+impl connector::DriverConnectorState for ConnectorState {
+    type Connector = DriverConnector;
+}
diff --git a/drivers/gpu/drm/rvkms/crtc.rs b/drivers/gpu/drm/rvkms/crtc.rs
new file mode 100644
index 0000000000000..2998f288b88e6
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/crtc.rs
@@ -0,0 +1,40 @@
+// TODO: License and stuff
+// Contain's rvkms's drm_crtc implementation
+use core::marker::PhantomPinned;
+use super::RvkmsDriver;
+use kernel::{
+    prelude::*,
+    drm::{
+        device::Device,
+        kms::crtc,
+    },
+};
+
+pub(crate) type Crtc = crtc::Crtc<DriverCrtc>;
+
+#[pin_data]
+pub(crate) struct DriverCrtc {
+    #[pin]
+    _p: PhantomPinned
+}
+
+impl crtc::DriverCrtc for DriverCrtc {
+    type Initializer = impl PinInit<Self, Error>;
+
+    type Args = ();
+
+    type State = CrtcState;
+
+    type Driver = RvkmsDriver;
+
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+}
+
+#[derive(Clone, Default)]
+pub(crate) struct CrtcState;
+
+impl crtc::DriverCrtcState for CrtcState {
+    type Crtc = DriverCrtc;
+}
diff --git a/drivers/gpu/drm/rvkms/encoder.rs b/drivers/gpu/drm/rvkms/encoder.rs
new file mode 100644
index 0000000000000..72d8b43d9107e
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/encoder.rs
@@ -0,0 +1,26 @@
+use core::marker::PhantomPinned;
+use kernel::{
+    drm::{device::Device, kms},
+    prelude::*
+};
+use crate::RvkmsDriver;
+
+#[pin_data]
+pub(crate) struct DriverEncoder {
+    #[pin]
+    _p: PhantomPinned,
+}
+
+pub(crate) type Encoder = kms::encoder::Encoder<DriverEncoder>;
+
+impl kms::encoder::DriverEncoder for DriverEncoder {
+    type Initializer = impl PinInit<Self, Error>;
+
+    type Driver = RvkmsDriver;
+
+    type Args = ();
+
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/file.rs b/drivers/gpu/drm/rvkms/file.rs
new file mode 100644
index 0000000000000..24b1b53b78238
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/file.rs
@@ -0,0 +1,22 @@
+use super::RvkmsDriver;
+
+use kernel::{
+    drm::{
+        self,
+        device::Device as DrmDevice
+    },
+    prelude::*,
+};
+use core::option::*;
+
+pub(crate) struct File();
+
+impl drm::file::DriverFile for File {
+    type Driver = RvkmsDriver;
+
+    fn open(device: &DrmDevice<Self::Driver>) -> Result<Pin<Box<Self>>> {
+        pr_info!("Someone opened a file! But I do not yet know which one...\n");
+
+        Ok(Box::into_pin(Box::try_new(Self())?))
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/gem.rs b/drivers/gpu/drm/rvkms/gem.rs
new file mode 100644
index 0000000000000..b789a1c2170c7
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/gem.rs
@@ -0,0 +1,32 @@
+use crate::{RvkmsDriver, RvkmsDevice};
+use core::sync::atomic::{AtomicU64, Ordering};
+use kernel::{
+    drm::{self, gem},
+    prelude::*,
+};
+
+static GEM_ID: AtomicU64 = AtomicU64::new(0);
+
+/// GEM Object implementation
+#[pin_data]
+pub(crate) struct DriverObject {
+    /// ID for debugging
+    id: u64,
+}
+
+pub(crate) type Object = gem::shmem::Object<DriverObject>;
+
+impl gem::BaseDriverObject<Object> for DriverObject {
+    type Initializer = impl PinInit<Self, Error>;
+
+    fn new(dev: &RvkmsDevice, size: usize) -> Self::Initializer {
+        let id = GEM_ID.fetch_add(1, Ordering::Relaxed);
+
+        pr_debug!("DriverObject::new id={id}\n");
+        DriverObject { id }
+    }
+}
+
+impl gem::shmem::DriverObject for DriverObject {
+    type Driver = RvkmsDriver;
+}
diff --git a/drivers/gpu/drm/rvkms/output.rs b/drivers/gpu/drm/rvkms/output.rs
new file mode 100644
index 0000000000000..227d6c3d719a0
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/output.rs
@@ -0,0 +1,72 @@
+use crate::{
+    crtc::Crtc,
+    plane::Plane,
+    connector::Connector,
+    encoder::Encoder,
+    RvkmsDevice
+};
+use kernel::{
+    drm::{
+        fourcc::Format,
+        kms::{
+            connector::DRM_MODE_CONNECTOR_VIRTUAL,
+            encoder::DRM_MODE_ENCODER_VIRTUAL,
+            plane::PlaneType,
+            KmsRef
+        },
+    },
+    sync::Arc,
+    prelude::*,
+    types::ARef,
+    drm_format_list,
+};
+
+pub(crate) struct Output {
+    crtc: KmsRef<Crtc>,
+    primary: KmsRef<Plane>,
+    // TODO: overlay, cursor
+    connector: ARef<Connector>,
+    encoder: KmsRef<Encoder>,
+}
+
+impl Output {
+    pub(crate) fn new(dev: &RvkmsDevice, index: u8) -> Result<Self> {
+        let primary = Plane::new(
+            dev,
+            1 << index,
+            &drm_format_list![Format::XRGB888],
+            None,
+            PlaneType::PRIMARY,
+            None,
+            ()
+        )?;
+
+        let crtc = Crtc::new(
+            dev,
+            &primary,
+            Option::<&Plane>::None,
+            None,
+            ()
+        )?;
+
+        let connector = Connector::new(dev, DRM_MODE_CONNECTOR_VIRTUAL, ())?;
+
+        let encoder = Encoder::new(
+            dev,
+            DRM_MODE_ENCODER_VIRTUAL,
+            1 << index,
+            0,
+            None,
+            ()
+        )?;
+
+        connector.attach_encoder(&encoder)?;
+
+        Ok(Self {
+            crtc: crtc.into(),
+            primary: primary.into(),
+            connector,
+            encoder: encoder.into()
+        })
+    }
+}
diff --git a/drivers/gpu/drm/rvkms/plane.rs b/drivers/gpu/drm/rvkms/plane.rs
new file mode 100644
index 0000000000000..54c4bbda64d8e
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/plane.rs
@@ -0,0 +1,39 @@
+use core::marker::PhantomPinned;
+use super::RvkmsDriver;
+use kernel::{
+    prelude::*,
+    drm::{
+        device::Device,
+        kms::plane::{self, DriverPlaneState},
+    },
+};
+
+#[pin_data]
+pub(crate) struct DriverPlane {
+    #[pin]
+    _p: PhantomPinned,
+}
+
+pub(crate) type Plane = plane::Plane<DriverPlane>;
+pub(crate) type PlaneState = plane::PlaneState<RvkmsPlaneState>;
+
+impl plane::DriverPlane for DriverPlane {
+    type Initializer = impl PinInit<Self, Error>;
+
+    type State = RvkmsPlaneState;
+
+    type Driver = RvkmsDriver;
+
+    type Args = ();
+
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer {
+        try_pin_init!(Self { _p: PhantomPinned })
+    }
+}
+
+#[derive(Clone, Default)]
+pub(crate) struct RvkmsPlaneState;
+
+impl DriverPlaneState for RvkmsPlaneState {
+    type Plane = DriverPlane;
+}
diff --git a/drivers/gpu/drm/rvkms/rvkms.rs b/drivers/gpu/drm/rvkms/rvkms.rs
new file mode 100644
index 0000000000000..0b14aca7f77d4
--- /dev/null
+++ b/drivers/gpu/drm/rvkms/rvkms.rs
@@ -0,0 +1,146 @@
+// Rust VKMS Proof of Concept driver
+// Written by Lyude Paul
+// Enormous thanks to:
+// - Maira Canal
+// - Asahi Lina
+// - Probably lots of other wonderful people whose names aren't here
+
+mod connector;
+mod crtc;
+mod file;
+mod gem;
+mod plane;
+mod output;
+mod encoder;
+
+use alloc::boxed::Box;
+
+use core::option::*;
+
+use kernel::{
+    c_str,
+    str::CStr,
+    device::{self, RawDevice},
+    drm::{
+        self,
+        drv,
+        kms::{
+            KmsDriver,
+            ModeConfigInfo,
+        },
+    },
+    platform,
+    prelude::*,
+    sync::Arc,
+    types::ARef,
+};
+
+use crate::output::Output;
+
+pub(crate) struct RvkmsDriver;
+pub(crate) struct Resources;
+
+pub(crate) type DeviceData = device::Data<drv::Registration<RvkmsDriver>, Resources, Data>;
+
+/// Convienence type alias for the DRM device type for this driver
+pub(crate) type RvkmsDevice = drm::device::Device<RvkmsDriver>;
+
+/// Driver metadata
+const INFO: drv::DriverInfo = drv::DriverInfo {
+    major: 0,
+    minor: 0,
+    patchlevel: 0,
+    name: c_str!("rvkms"),
+    desc: c_str!("Rust VKMS PoC"),
+    date: c_str!("20240115"),
+};
+
+/// The minimum supported resolution
+const MIN_RES: (i32, i32) = (10, 10);
+
+/// The maximum supported resolution
+const MAX_RES: (i32, i32) = (8192, 8192);
+
+/// The "preferred" resolution
+const DEFAULT_RES: (i32, i32) = (1024, 768);
+
+pub(crate) struct Data {
+}
+
+/// DRM Driver implementation for `RvkmsDriver`
+#[vtable]
+impl drv::Driver for RvkmsDriver {
+    type Data = Arc<DeviceData>;
+    type Object = gem::Object;
+    type File = file::File;
+
+    const INFO: drv::DriverInfo = INFO;
+    const FEATURES:u32 = drv::FEAT_GEM | drv::FEAT_MODESET | drv::FEAT_ATOMIC;
+
+    kernel::declare_drm_ioctls! {}
+}
+
+impl KmsDriver for RvkmsDriver {}
+
+pub(crate) struct Rvkms {
+    output: Output,
+    drm: ARef<RvkmsDevice>,
+    _resource: device::Resource,
+    _pdev: platform::Device,
+}
+
+const MODE_CONFIG_INFO: ModeConfigInfo = ModeConfigInfo {
+    min_resolution: MIN_RES,
+    max_resolution: MAX_RES,
+    max_cursor: (512, 512),
+    preferred_depth: 0,
+};
+
+impl kernel::Module for Rvkms {
+    fn init(name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
+        // We need to handle all of this from the true module_init, as we're a platform driver that
+        // binds to nothing - so we have to handle that portion of init ourselves like the real vkms
+        let mut pdev = platform::Device::register(c_str!("rvkms"), -1)?;
+        let dev = device::Device::from_dev(&pdev);
+
+        dev.pr_info(format_args!("Initializing RVKMS\n"));
+
+        // TODO: I wonder if there's any way we could get rid of having to pass raw pointers to
+        // this?
+        // no idea
+        let resource = dev.open_group(core::ptr::null_mut() as *mut core::ffi::c_void)?;
+
+        let reg: drv::Registration<RvkmsDriver> =
+            drv::Registration::new(&dev, Option::Some(MODE_CONFIG_INFO), module)?;
+        let drm_dev: ARef<RvkmsDevice> = ARef::from(reg.device());
+        let reg_info = reg.registration_info();
+        let output = Output::new(&drm_dev, 0)?;
+        let data = kernel::new_device_data!(
+            reg,
+            Resources,
+            Data { },
+            "RvkmsDeviceData"
+        )?;
+
+        drm_dev.mode_config_reset();
+
+        dev.dma_coerce_mask_and_coherent(kernel::dma::dma_bit_mask(64))?;
+
+        drv::Registration::register(reg_info, data.into(), 0, module)?;
+
+        Ok(Self {
+            drm: drm_dev,
+            output,
+            _resource: resource,
+            _pdev: pdev,
+        })
+    }
+}
+
+module! {
+    type: Rvkms,
+    name: "rvkms",
+    author: "Lyude Paul",
+    description: "Rust VKMS Proof of Concept driver",
+    license: "GPL v2",
+}
-- 
2.43.0

