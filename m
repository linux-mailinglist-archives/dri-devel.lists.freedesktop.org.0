Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A9AEC2A1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6A710E0AC;
	Fri, 27 Jun 2025 22:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="PCxQr4vX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5110E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751063691; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ilwbWnzyhlwD6vFsrpeZY7oM6HO3nagXb3Uzc9WSBfGYBgE3R7sNlD7LHOuJkiLxt07Tq1Va6CxTRQ4jZX1R6hPdDP1xWfyi7eC3dlfRum15V8km4vbbMYgu/lPfOSA1jMv90H+hjZEimKiGfQD+/sLhWv746FbvHTrjeEDjRTw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751063691;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GAS5TR6t2nrJ4vNeps0wo8O3QCBJB6U4Dwim8NY97PE=; 
 b=F/4F8pctONS4NQN/x0Qfse3jIlsonoHsDY/px9g6XYCNTYHwjmlkVPSx63c7MssfTG2Uxl50W5aHNDCz9F/BBBDfs01jbzfSjmf/H1DgpgnVg5Be+KBI2fNiKSK6usv8G2sud/ks5Uz+XbtPSRCLYiqxvd4Q29YIGyq+DPp6TmI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751063690; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=GAS5TR6t2nrJ4vNeps0wo8O3QCBJB6U4Dwim8NY97PE=;
 b=PCxQr4vXsWqn3fzZ+2M4tCmipLviIIV+kiKMWTEuLA5f8wjni9Oegh8XWIu06TPq
 mxXL0gy+sF22s9SfHFN7EN5LY8r6b9Gm8B2hWfiT/CCU/9IVwtT5Ds7AULuVpYyB7og
 3EV89MBKmiT3uWz0cXpO9xmMSbZTn3aaMAxzzmgg=
Received: by mx.zohomail.com with SMTPS id 1751063687750523.5034904887891;
 Fri, 27 Jun 2025 15:34:47 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Jun 2025 19:34:04 -0300
Subject: [PATCH] Introduce Tyr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFscX2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNz3ZLKIl0zC+PUZBNLQ0PjpEQloMqCotS0zAqwKdGxtbUAIjWW+FU
 AAAA=
X-Change-ID: 20250627-tyr-683ec49113ba
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>, 
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>, 
 Beata Michalska <beata.michalska@arm.com>, 
 Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Ashley Smith <ashley.smith@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel@collabora.com, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

Add a Rust driver for ARM Mali CSF-based GPUs. It is a port of Panthor
and therefore exposes Panthor's uAPI and name to userspace, and the
product of a joint effort between Collabora, ARM and Google engineers.

The aim is to incrementally develop Tyr with the abstractions that are
currently available until it is consider to be in parity with Panthor
feature-wise.

This first version only implements a subset of the current features
available downstream, as the rest is not implementable without pulling
in even more abstractions. In particular, a lot of things depend on
properly mapping memory on a given VA range, which itself depends on the
GPUVM abstraction that is currently work-in-progress. For this reason,
we still cannot boot the MCU and thus, cannot do much in the current
version.

Still, this version is intended as a way to validate some of the
abstractions that are still being developed, in particular the platform
iomem code. A subsequent patch will introduce VM_BIND support once the
discussions on the GPUVM abstraction advance.

Despite its limited feature-set, we offer an IGT branch to test this
patch with. It is only tested on the rk3588, so any other SoC is
probably not going to work at all for now.

The skeleton is basically taken from Nova and also
rust_platform_driver.rs.

The name "Tyr" is inspired by Norse mythology, reflecting ARM's
tradition of naming their GPUs after Nordic mythological figures and
places.

Co-developed-by: Alice Ryhl <alice.ryhl@google.com>
Signed-off-by: Alice Ryhl <alice.ryhl@google.com>
Co-developed-by: Beata Michalska  <beata.michalska@arm.com>
Signed-off-by: Beata Michalska  <beata.michalska@arm.com>
Co-developed-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Co-developed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
The development of Tyr itself started in January, after a few failed
attempts of converting Panthor piecewise through a mix of Rust and C
code. We have a branch (tyr-next [0]) downstream that's much further
ahead than this submission.

Briefly speaking, our downstream code is capable of booting the MCU,
doing sync VM_BINDS through the work-in-progress GPUVM abstraction
I've been submitting to the list - and also of doing (trivial) submits
through Lina's drm_scheduler and dma_fence abstractions. So basically,
most of what we expect a modern GPU driver to do, except for power
management and some other very important adjacent pieces.

We are not at the point where submits can correctly deal with
dependencies, or at the point where we can rotate access to the GPU
hardware fairly through our own software scheduler, but that is simply a
matter of writing more code. Unfortunately, other things have taken
precedence lately.

At the current pace, I am fairly certain that we can achieve a working
driver downstream in a couple of months, for a given definition of
"working". In any case, reconciling this with upstream has been somewhat
challenging recently, so this patch constitutes a change in the overall
strategy that we have been using to develop Tyr so far.

By submitting small parts of the driver upstream iteratively, we aim to:

a) evolve together with Nova and rvkms, hopefully reducing regressions
due to upstream changes (that may break us because we were not there, in
the first place)

b) prove any work-in-progress abstractions by having them run on a real
driver and hardware and,

c) provide a reason to work on and review said abstractions by providing
a user, which would be tyr itself.

Unfortunately, without GPUVM support, there is not much that we can do
on this first patch. This is because the firmware expect things to be
mapped at precise VA ranges, so we simply cannot get it to boot with the
current upstream code. This will be achieved by a subsequent patch.

The current one can power on the GPU and get the driver to probe,
though. It uses a few in-flight abstractions like Fujita's
read_poll_timeout() and friends, alongside some of the abstractions I've
been working on (like regulators, platform iomem, genmask, and etc) to
extract some diagnostic data from the device and print it to the
terminal. 

This functionality can be attested by running our IGT suite at [1].
Again, note that the tests are meant for the downstream version of the
driver, so anything other than the "query" tests will fail here.

As the abstractions above are in-flight, I provide a branch where they
have been collected into [2]. Anyone is encouraged to test this if they
feel like it, but be aware that it was only tested on the rk3588.

Lastly, I'd like to mention that this driver is a joint initiative
between Collabora, Arm and Google. Everyone that has directly touched
the source code so far has been acknowledged as an author through their
respective co-developed-by tag. In particular, Alice Ryhl has been
steadily helping out with all the necessary abstractions for a long time
now, apart from the code that she has directly contributed to the driver
itself.

I'd also like to give a special thanks to my colleague Boris Brezillon -
who has been steering me through this new territory, and without whom
this project would not have been possible at all.

[0]: https://gitlab.freedesktop.org/panfrost/linux/-/tree/tyr-next?ref_type=heads
[1]: https://gitlab.freedesktop.org/dwlsalmeida/igt-gpu-tools/-/tree/panthor?ref_type=heads
[2]: https://gitlab.freedesktop.org/panfrost/linux/-/tree/tyr?ref_type=heads
---
 MAINTAINERS                   |   9 ++
 drivers/gpu/drm/Kconfig       |   2 +
 drivers/gpu/drm/Makefile      |   1 +
 drivers/gpu/drm/tyr/Kconfig   |  18 +++
 drivers/gpu/drm/tyr/Makefile  |   3 +
 drivers/gpu/drm/tyr/driver.rs | 188 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/file.rs   |  57 ++++++++++
 drivers/gpu/drm/tyr/gem.rs    |  20 ++++
 drivers/gpu/drm/tyr/gpu.rs    | 217 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/regs.rs   | 252 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs    |  22 ++++
 rust/uapi/uapi_helper.h       |   1 +
 12 files changed, 790 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a475b07519c34be316f0b71ad953de384d7c748d..4b157710c064fdd33c603e52f07c28d15853f64f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2039,6 +2039,15 @@ F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
 F:	drivers/gpu/drm/panthor/
 F:	include/uapi/drm/panthor_drm.h
 
+ARM MALI TYR DRM DRIVER
+M:	Daniel Almeida <daniel.almeida@collabora.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/panfrost/linux.git
+F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+F:	drivers/gpu/drm/tyr/
+F:	include/uapi/drm/panthor_drm.h
+
 ARM MALI-DP DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c0e17ee39364e0e832cd17571358f..fda1707304683dc4c22f44fd2e8bc774636729bd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
 
 source "drivers/gpu/drm/imagination/Kconfig"
 
+source "drivers/gpu/drm/tyr/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5050ac32bba26a6f90af83a67748ee7677dc3332..889ba62e62acc50ffe9342b905e28a1261fc76dc 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -216,6 +216,7 @@ obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
 obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_PANTHOR) += panthor/
+obj-$(CONFIG_DRM_TYR) += tyr/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..91db81e3857a028600db4b2b8bc024a53f5e295b
--- /dev/null
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0 or MIT
+
+
+config DRM_TYR
+	tristate "Tyr (Rust DRM support for ARM Mali CSF-based GPUs)"
+	depends on DRM=y
+	depends on RUST
+	depends on ARM || ARM64 || COMPILE_TEST
+	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
+	help
+	  Rust DRM driver for ARM Mali CSF-based GPUs.
+
+	  This driver is for Mali (or Immortalis) Valhall Gxxx GPUs.
+
+	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
+	  be supported with the panfrost driver as they are not CSF GPUs.
+
+	  if M is selected, the module will be called tyr.
diff --git a/drivers/gpu/drm/tyr/Makefile b/drivers/gpu/drm/tyr/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..ba545f65f2c0823b9a4a5a54e39b867e4f9bf812
--- /dev/null
+++ b/drivers/gpu/drm/tyr/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0 or MIT
+
+obj-$(CONFIG_DRM_TYR) += tyr.o
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
new file mode 100644
index 0000000000000000000000000000000000000000..2443620e10620585eae3d57978e64d2169a1b2d1
--- /dev/null
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+use core::pin::Pin;
+
+use kernel::bits::bit_u32;
+use kernel::c_str;
+use kernel::clk::Clk;
+use kernel::device::Core;
+use kernel::devres::Devres;
+use kernel::drm;
+use kernel::drm::ioctl;
+use kernel::io;
+use kernel::io::mem::IoMem;
+use kernel::new_mutex;
+use kernel::of;
+use kernel::platform;
+use kernel::prelude::*;
+use kernel::regulator;
+use kernel::regulator::Regulator;
+use kernel::sync::Arc;
+use kernel::sync::Mutex;
+use kernel::time;
+use kernel::types::ARef;
+
+use crate::file::File;
+use crate::gem::TyrObject;
+use crate::gpu;
+use crate::gpu::GpuInfo;
+use crate::regs;
+
+/// Convienence type alias for the DRM device type for this driver
+pub(crate) type TyrDevice = drm::device::Device<TyrDriver>;
+
+#[pin_data(PinnedDrop)]
+pub(crate) struct TyrDriver {
+    device: ARef<TyrDevice>,
+}
+
+#[pin_data]
+pub(crate) struct TyrData {
+    pub(crate) pdev: ARef<platform::Device>,
+
+    #[pin]
+    clks: Mutex<Clocks>,
+
+    #[pin]
+    regulators: Mutex<Regulators>,
+
+    // Some inforation on the GPU. This is mainly queried by userspace (mesa).
+    pub(crate) gpu_info: GpuInfo,
+}
+
+unsafe impl Send for TyrData {}
+unsafe impl Sync for TyrData {}
+
+fn issue_soft_reset(iomem: &Devres<IoMem<0>>) -> Result<()> {
+    let irq_enable_cmd = 1 | bit_u32(8);
+    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
+
+    let op = || regs::GPU_INT_RAWSTAT.read(iomem);
+    let cond = |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 == 1 };
+    let res = io::poll::read_poll_timeout(
+        op,
+        cond,
+        time::Delta::from_millis(100),
+        Some(time::Delta::from_micros(20000)),
+    );
+
+    if let Err(e) = res {
+        pr_err!("GPU reset failed with errno {}\n", e.to_errno());
+        pr_err!(
+            "GPU_INT_RAWSTAT is {}\n",
+            regs::GPU_INT_RAWSTAT.read(iomem)?
+        );
+    }
+
+    Ok(())
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <TyrDriver as platform::Driver>::IdInfo,
+    [
+        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
+        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
+    ]
+);
+
+impl platform::Driver for TyrDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        _info: Option<&Self::IdInfo>,
+    ) -> Result<Pin<KBox<Self>>> {
+        dev_dbg!(pdev.as_ref(), "Probed Tyr\n");
+
+        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
+        let stacks_clk = Clk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
+        let coregroup_clk = Clk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
+
+        core_clk.prepare_enable()?;
+        stacks_clk.prepare_enable()?;
+        coregroup_clk.prepare_enable()?;
+
+        let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
+        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
+
+        let resource = pdev.resource_by_index(0).ok_or(EINVAL)?;
+
+        let iomem = Arc::new(pdev.iomap_resource(resource)?, GFP_KERNEL)?;
+
+        issue_soft_reset(&iomem)?;
+        gpu::l2_power_on(&iomem)?;
+
+        let gpu_info = GpuInfo::new(&iomem)?;
+        gpu_info.log(pdev);
+
+        let platform: ARef<platform::Device> = pdev.into();
+
+        let data = try_pin_init!(TyrData {
+                pdev: platform.clone(),
+                clks <- new_mutex!(Clocks {
+                    core: core_clk,
+                    stacks: stacks_clk,
+                    coregroup: coregroup_clk,
+                }),
+                regulators <- new_mutex!(Regulators {
+                    mali: mali_regulator,
+                    sram: sram_regulator,
+                }),
+                gpu_info,
+        });
+
+        let data = Arc::pin_init(data, GFP_KERNEL)?;
+
+        let tdev: ARef<TyrDevice> = drm::device::Device::new(pdev.as_ref(), data.clone())?;
+        drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
+
+        let driver = KBox::pin_init(try_pin_init!(TyrDriver { device: tdev }), GFP_KERNEL)?;
+
+        regs::MCU_CONTROL.write(&iomem, regs::MCU_CONTROL_AUTO)?;
+
+        dev_info!(pdev.as_ref(), "Tyr initialized correctly.\n");
+        Ok(driver)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for TyrDriver {
+    fn drop(self: Pin<&mut Self>) {}
+}
+
+const INFO: drm::driver::DriverInfo = drm::driver::DriverInfo {
+    major: 0,
+    minor: 0,
+    patchlevel: 0,
+    name: c_str!("panthor"),
+    desc: c_str!("ARM Mali CSF-based Rust GPU driver"),
+};
+
+#[vtable]
+impl drm::driver::Driver for TyrDriver {
+    type Data = Arc<TyrData>;
+    type File = File;
+    type Object = drm::gem::Object<TyrObject>;
+
+    const INFO: drm::driver::DriverInfo = INFO;
+
+    kernel::declare_drm_ioctls! {
+        (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, File::dev_query),
+    }
+}
+
+#[pin_data]
+struct Clocks {
+    core: Clk,
+    stacks: Clk,
+    coregroup: Clk,
+}
+
+#[pin_data]
+struct Regulators {
+    mali: Regulator<regulator::Enabled>,
+    sram: Regulator<regulator::Enabled>,
+}
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
new file mode 100644
index 0000000000000000000000000000000000000000..19049b289ff5f8d87f2e954d25ab92320c9ffbef
--- /dev/null
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+use kernel::alloc::flags::*;
+use kernel::drm;
+use kernel::drm::device::Device as DrmDevice;
+use kernel::prelude::*;
+use kernel::uaccess::UserSlice;
+use kernel::uapi;
+
+use crate::driver::TyrDevice;
+use crate::TyrDriver;
+
+#[pin_data]
+pub(crate) struct File {}
+
+/// Convenience type alias for our DRM `File` type
+pub(crate) type DrmFile = drm::file::File<File>;
+
+impl drm::file::DriverFile for File {
+    type Driver = TyrDriver;
+
+    fn open(dev: &DrmDevice<Self::Driver>) -> Result<Pin<KBox<Self>>> {
+        dev_dbg!(dev.as_ref(), "drm::device::Device::open\n");
+
+        KBox::try_pin_init(try_pin_init!(Self {}), GFP_KERNEL)
+    }
+}
+
+impl File {
+    pub(crate) fn dev_query(
+        tdev: &TyrDevice,
+        devquery: &mut uapi::drm_panthor_dev_query,
+        _file: &DrmFile,
+    ) -> Result<u32> {
+        if devquery.pointer == 0 {
+            match devquery.type_ {
+                uapi::drm_panthor_dev_query_type_DRM_PANTHOR_DEV_QUERY_GPU_INFO => {
+                    devquery.size = core::mem::size_of_val(&tdev.gpu_info) as u32;
+                    Ok(0)
+                }
+                _ => Err(EINVAL),
+            }
+        } else {
+            match devquery.type_ {
+                uapi::drm_panthor_dev_query_type_DRM_PANTHOR_DEV_QUERY_GPU_INFO => {
+                    let mut writer =
+                        UserSlice::new(devquery.pointer as usize, devquery.size as usize).writer();
+
+                    writer.write(&tdev.gpu_info)?;
+
+                    Ok(0)
+                }
+                _ => Err(EINVAL),
+            }
+        }
+    }
+}
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7fd01473a9a6922406e7177c264ca771fa7af8ee
--- /dev/null
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+use crate::driver::TyrDevice;
+use crate::driver::TyrDriver;
+use kernel::drm::gem::{self};
+use kernel::prelude::*;
+
+/// GEM Object inner driver data
+#[pin_data]
+pub(crate) struct TyrObject {}
+
+impl gem::DriverObject for TyrObject {
+    type Driver = TyrDriver;
+}
+
+impl gem::BaseDriverObject<gem::Object<TyrObject>> for TyrObject {
+    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, Error> {
+        try_pin_init!(TyrObject {})
+    }
+}
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a33caa7b2968e62da136f245422023ba6e3ad5c3
--- /dev/null
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+use crate::regs::*;
+use kernel::bits;
+use kernel::bits::genmask_u32;
+use kernel::devres::Devres;
+use kernel::io;
+use kernel::io::mem::IoMem;
+use kernel::platform;
+use kernel::prelude::*;
+use kernel::time;
+use kernel::transmute::AsBytes;
+
+// This can be queried by userspace to get information about the GPU.
+#[repr(C)]
+pub(crate) struct GpuInfo {
+    pub(crate) gpu_id: u32,
+    pub(crate) csf_id: u32,
+    pub(crate) gpu_rev: u32,
+    pub(crate) core_features: u32,
+    pub(crate) l2_features: u32,
+    pub(crate) tiler_features: u32,
+    pub(crate) mem_features: u32,
+    pub(crate) mmu_features: u32,
+    pub(crate) thread_features: u32,
+    pub(crate) max_threads: u32,
+    pub(crate) thread_max_workgroup_size: u32,
+    pub(crate) thread_max_barrier_size: u32,
+    pub(crate) coherency_features: u32,
+    pub(crate) texture_features: [u32; 4],
+    pub(crate) as_present: u32,
+    pub(crate) shader_present: u64,
+    pub(crate) tiler_present: u64,
+    pub(crate) l2_present: u64,
+}
+
+impl GpuInfo {
+    pub(crate) fn new(iomem: &Devres<IoMem>) -> Result<Self> {
+        let gpu_id = GPU_ID.read(iomem)?;
+        let csf_id = GPU_CSF_ID.read(iomem)?;
+        let gpu_rev = GPU_REVID.read(iomem)?;
+        let core_features = GPU_CORE_FEATURES.read(iomem)?;
+        let l2_features = GPU_L2_FEATURES.read(iomem)?;
+        let tiler_features = GPU_TILER_FEATURES.read(iomem)?;
+        let mem_features = GPU_MEM_FEATURES.read(iomem)?;
+        let mmu_features = GPU_MMU_FEATURES.read(iomem)?;
+        let thread_features = GPU_THREAD_FEATURES.read(iomem)?;
+        let max_threads = GPU_THREAD_MAX_THREADS.read(iomem)?;
+        let thread_max_workgroup_size = GPU_THREAD_MAX_WORKGROUP_SIZE.read(iomem)?;
+        let thread_max_barrier_size = GPU_THREAD_MAX_BARRIER_SIZE.read(iomem)?;
+        let coherency_features = GPU_COHERENCY_FEATURES.read(iomem)?;
+
+        let texture_features = GPU_TEXTURE_FEATURES0.read(iomem)?;
+
+        let as_present = GPU_AS_PRESENT.read(iomem)?;
+
+        let shader_present = GPU_SHADER_PRESENT_LO.read(iomem)? as u64;
+        let shader_present = shader_present | (GPU_SHADER_PRESENT_HI.read(iomem)? as u64) << 32;
+
+        let tiler_present = GPU_TILER_PRESENT_LO.read(iomem)? as u64;
+        let tiler_present = tiler_present | (GPU_TILER_PRESENT_HI.read(iomem)? as u64) << 32;
+
+        let l2_present = GPU_L2_PRESENT_LO.read(iomem)? as u64;
+        let l2_present = l2_present | (GPU_L2_PRESENT_HI.read(iomem)? as u64) << 32;
+
+        Ok(Self {
+            gpu_id,
+            csf_id,
+            gpu_rev,
+            core_features,
+            l2_features,
+            tiler_features,
+            mem_features,
+            mmu_features,
+            thread_features,
+            max_threads,
+            thread_max_workgroup_size,
+            thread_max_barrier_size,
+            coherency_features,
+            texture_features: [texture_features, 0, 0, 0],
+            as_present,
+            shader_present,
+            tiler_present,
+            l2_present,
+        })
+    }
+
+    pub(crate) fn log(&self, pdev: &platform::Device) {
+        let major = (self.gpu_id >> 16) & 0xff;
+        let minor = (self.gpu_id >> 8) & 0xff;
+        let status = self.gpu_id & 0xff;
+
+        let model_name = if let Some(model) = GPU_MODELS
+            .iter()
+            .find(|&f| f.major == major && f.minor == minor)
+        {
+            model.name
+        } else {
+            "unknown"
+        };
+
+        dev_info!(
+            pdev.as_ref(),
+            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
+            model_name,
+            self.gpu_id >> 16,
+            major,
+            minor,
+            status
+        );
+
+        dev_info!(
+            pdev.as_ref(),
+            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
+            self.l2_features,
+            self.tiler_features,
+            self.mem_features,
+            self.mmu_features,
+            self.as_present
+        );
+
+        dev_info!(
+            pdev.as_ref(),
+            "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
+            self.shader_present,
+            self.l2_present,
+            self.tiler_present
+        );
+
+        dev_info!(
+            pdev.as_ref(),
+            "PA bits: {}, VA bits: {}",
+            self.pa_bits(),
+            self.va_bits()
+        );
+    }
+
+    pub(crate) fn va_bits(&self) -> u32 {
+        self.mmu_features & bits::genmask_u32(0..=7)
+    }
+
+    pub(crate) fn pa_bits(&self) -> u32 {
+        (self.mmu_features >> 8) & bits::genmask_u32(0..=7)
+    }
+}
+
+// SAFETY:
+//
+// This type is the same type exposed by Panthor's uAPI. As it's declared as
+// #repr(C), we can be sure that the layout is the same. Therefore, it is safe
+// to expose this to userspace.
+unsafe impl AsBytes for GpuInfo {}
+
+struct GpuModels {
+    name: &'static str,
+    major: u32,
+    minor: u32,
+}
+
+const GPU_MODELS: [GpuModels; 1] = [GpuModels {
+    name: "g610",
+    major: 10,
+    minor: 7,
+}];
+
+#[allow(dead_code)]
+pub(crate) struct GpuId {
+    pub(crate) arch_major: u32,
+    pub(crate) arch_minor: u32,
+    pub(crate) arch_rev: u32,
+    pub(crate) prod_major: u32,
+    pub(crate) ver_major: u32,
+    pub(crate) ver_minor: u32,
+    pub(crate) ver_status: u32,
+}
+
+impl From<u32> for GpuId {
+    fn from(value: u32) -> Self {
+        GpuId {
+            arch_major: (value & genmask_u32(28..=31)) >> 28,
+            arch_minor: (value & genmask_u32(24..=27)) >> 24,
+            arch_rev: (value & genmask_u32(20..=23)) >> 20,
+            prod_major: (value & genmask_u32(16..=19)) >> 16,
+            ver_major: (value & genmask_u32(12..=15)) >> 12,
+            ver_minor: (value & genmask_u32(4..=11)) >> 4,
+            ver_status: value & genmask_u32(0..=3),
+        }
+    }
+}
+
+/// Powers on the l2 block.
+pub(crate) fn l2_power_on(iomem: &Devres<IoMem>) -> Result<()> {
+    let op = || L2_PWRTRANS_LO.read(iomem);
+
+    let cond = |pwr_trans: &u32| *pwr_trans == 0;
+
+    let _ = io::poll::read_poll_timeout(
+        op,
+        cond,
+        time::Delta::from_millis(100),
+        Some(time::Delta::from_millis(200)),
+    )?;
+
+    L2_PWRON_LO.write(iomem, 1)?;
+
+    let op = || L2_READY_LO.read(iomem);
+    let cond = |l2_ready: &u32| *l2_ready == 1;
+
+    let _ = io::poll::read_poll_timeout(
+        op,
+        cond,
+        time::Delta::from_millis(100),
+        Some(time::Delta::from_millis(200)),
+    )?;
+
+    Ok(())
+}
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..db36cfd030d202e47619cb744cae5597d47f6029
--- /dev/null
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#![allow(dead_code)]
+
+use kernel::bits::bit_u64;
+use kernel::devres::Devres;
+use kernel::io::mem::IoMem;
+use kernel::{bits::bit_u32, prelude::*};
+
+/// Represents a register in the Register Set
+pub(crate) struct Register<const OFFSET: usize>;
+
+impl<const OFFSET: usize> Register<OFFSET> {
+    #[inline]
+    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> {
+        (*iomem).try_access().ok_or(ENODEV)?.try_read32(OFFSET)
+    }
+
+    #[inline]
+    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> Result<()> {
+        (*iomem)
+            .try_access()
+            .ok_or(ENODEV)?
+            .try_write32(value, OFFSET)
+    }
+}
+
+pub(crate) const GPU_ID: Register<0x0> = Register;
+pub(crate) const GPU_L2_FEATURES: Register<0x4> = Register;
+pub(crate) const GPU_CORE_FEATURES: Register<0x8> = Register;
+pub(crate) const GPU_CSF_ID: Register<0x1c> = Register;
+pub(crate) const GPU_REVID: Register<0x280> = Register;
+pub(crate) const GPU_TILER_FEATURES: Register<0xc> = Register;
+pub(crate) const GPU_MEM_FEATURES: Register<0x10> = Register;
+pub(crate) const GPU_MMU_FEATURES: Register<0x14> = Register;
+pub(crate) const GPU_AS_PRESENT: Register<0x18> = Register;
+pub(crate) const GPU_INT_RAWSTAT: Register<0x20> = Register;
+
+pub(crate) const GPU_INT_RAWSTAT_FAULT: u32 = bit_u32(0);
+pub(crate) const GPU_INT_RAWSTAT_PROTECTED_FAULT: u32 = bit_u32(1);
+pub(crate) const GPU_INT_RAWSTAT_RESET_COMPLETED: u32 = bit_u32(8);
+pub(crate) const GPU_INT_RAWSTAT_POWER_CHANGED_SINGLE: u32 = bit_u32(9);
+pub(crate) const GPU_INT_RAWSTAT_POWER_CHANGED_ALL: u32 = bit_u32(10);
+pub(crate) const GPU_INT_RAWSTAT_CLEAN_CACHES_COMPLETED: u32 = bit_u32(17);
+pub(crate) const GPU_INT_RAWSTAT_DOORBELL_STATUS: u32 = bit_u32(18);
+pub(crate) const GPU_INT_RAWSTAT_MCU_STATUS: u32 = bit_u32(19);
+
+pub(crate) const GPU_INT_CLEAR: Register<0x24> = Register;
+pub(crate) const GPU_INT_MASK: Register<0x28> = Register;
+pub(crate) const GPU_INT_STAT: Register<0x2c> = Register;
+pub(crate) const GPU_CMD: Register<0x30> = Register;
+pub(crate) const GPU_THREAD_FEATURES: Register<0xac> = Register;
+pub(crate) const GPU_THREAD_MAX_THREADS: Register<0xa0> = Register;
+pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> = Register;
+pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> = Register;
+pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> = Register;
+pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> = Register;
+pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> = Register;
+pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> = Register;
+pub(crate) const GPU_TILER_PRESENT_HI: Register<0x114> = Register;
+pub(crate) const GPU_L2_PRESENT_LO: Register<0x120> = Register;
+pub(crate) const GPU_L2_PRESENT_HI: Register<0x124> = Register;
+pub(crate) const L2_READY_LO: Register<0x160> = Register;
+pub(crate) const L2_READY_HI: Register<0x164> = Register;
+pub(crate) const L2_PWRON_LO: Register<0x1a0> = Register;
+pub(crate) const L2_PWRON_HI: Register<0x1a4> = Register;
+pub(crate) const L2_PWRTRANS_LO: Register<0x220> = Register;
+pub(crate) const L2_PWRTRANS_HI: Register<0x204> = Register;
+pub(crate) const L2_PWRACTIVE_LO: Register<0x260> = Register;
+pub(crate) const L2_PWRACTIVE_HI: Register<0x264> = Register;
+
+pub(crate) const MCU_CONTROL: Register<0x700> = Register;
+pub(crate) const MCU_CONTROL_ENABLE: u32 = 1;
+pub(crate) const MCU_CONTROL_AUTO: u32 = 2;
+pub(crate) const MCU_CONTROL_DISABLE: u32 = 0;
+
+pub(crate) const MCU_STATUS: Register<0x704> = Register;
+pub(crate) const MCU_STATUS_DISABLED: u32 = 0;
+pub(crate) const MCU_STATUS_ENABLED: u32 = 1;
+pub(crate) const MCU_STATUS_HALT: u32 = 2;
+pub(crate) const MCU_STATUS_FATAL: u32 = 3;
+
+pub(crate) const GPU_COHERENCY_FEATURES: Register<0x300> = Register;
+
+pub(crate) const JOB_INT_RAWSTAT: Register<0x1000> = Register;
+pub(crate) const JOB_INT_CLEAR: Register<0x1004> = Register;
+pub(crate) const JOB_INT_MASK: Register<0x1008> = Register;
+pub(crate) const JOB_INT_STAT: Register<0x100c> = Register;
+
+pub(crate) const JOB_INT_GLOBAL_IF: u32 = bit_u32(31);
+
+pub(crate) const MMU_INT_RAWSTAT: Register<0x2000> = Register;
+pub(crate) const MMU_INT_CLEAR: Register<0x2004> = Register;
+pub(crate) const MMU_INT_MASK: Register<0x2008> = Register;
+pub(crate) const MMU_INT_STAT: Register<0x200c> = Register;
+
+pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 = bit_u64(0);
+pub(crate) const AS_TRANSCFG_ADRMODE_IDENTITY: u64 = bit_u64(1);
+pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 = bit_u64(2) | bit_u64(1);
+pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_64K: u64 = bit_u64(3);
+pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
+    x << 6
+}
+pub(crate) const fn as_transcfg_outa_bits(x: u64) -> u64 {
+    x << 14
+}
+pub(crate) const AS_TRANSCFG_SL_CONCAT: u64 = bit_u64(22);
+pub(crate) const AS_TRANSCFG_PTW_MEMATTR_NC: u64 = bit_u64(24);
+pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 = bit_u64(25);
+pub(crate) const AS_TRANSCFG_PTW_SH_NS: u64 = 0 << 28;
+pub(crate) const AS_TRANSCFG_PTW_SH_OS: u64 = bit_u64(29);
+pub(crate) const AS_TRANSCFG_PTW_SH_IS: u64 = bit_u64(29) | bit_u64(28);
+pub(crate) const AS_TRANSCFG_PTW_RA: u64 = bit_u64(30);
+pub(crate) const AS_TRANSCFG_DISABLE_HIER_AP: u64 = bit_u64(33);
+pub(crate) const AS_TRANSCFG_DISABLE_AF_FAULT: u64 = bit_u64(34);
+pub(crate) const AS_TRANSCFG_WXN: u64 = bit_u64(35);
+
+pub(crate) const MMU_BASE: usize = 0x2400;
+pub(crate) const MMU_AS_SHIFT: usize = 6;
+
+const fn mmu_as(as_nr: usize) -> usize {
+    MMU_BASE + (as_nr << MMU_AS_SHIFT)
+}
+
+pub(crate) struct AsRegister(usize);
+
+impl AsRegister {
+    fn new(as_nr: usize, offset: usize) -> Result<Self> {
+        if as_nr >= 32 {
+            Err(EINVAL)
+        } else {
+            Ok(AsRegister(mmu_as(as_nr) + offset))
+        }
+    }
+
+    #[inline]
+    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> {
+        (*iomem).try_access().ok_or(ENODEV)?.try_read32(self.0)
+    }
+
+    #[inline]
+    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> Result<()> {
+        (*iomem)
+            .try_access()
+            .ok_or(ENODEV)?
+            .try_write32(value, self.0)
+    }
+}
+
+pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x0)
+}
+
+pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x4)
+}
+
+pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x8)
+}
+
+pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0xc)
+}
+
+pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x10)
+}
+
+pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x14)
+}
+
+pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x18)
+}
+
+pub(crate) fn as_faultstatus(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x1c)
+}
+
+pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_MASK: u32 = 0x3 << 8;
+pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_ATOMIC: u32 = 0x0 << 8;
+pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_EX: u32 = 0x1 << 8;
+pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_READ: u32 = 0x2 << 8;
+pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_WRITE: u32 = 0x3 << 8;
+
+pub(crate) fn as_faultaddress_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x20)
+}
+
+pub(crate) fn as_faultaddress_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x24)
+}
+
+pub(crate) const AS_COMMAND_NOP: u32 = 0;
+pub(crate) const AS_COMMAND_UPDATE: u32 = 1;
+pub(crate) const AS_COMMAND_LOCK: u32 = 2;
+pub(crate) const AS_COMMAND_UNLOCK: u32 = 3;
+pub(crate) const AS_COMMAND_FLUSH_PT: u32 = 4;
+pub(crate) const AS_COMMAND_FLUSH_MEM: u32 = 5;
+
+pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x28)
+}
+
+pub(crate) const AS_STATUS_ACTIVE: u32 = bit_u32(0);
+
+pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x30)
+}
+pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x34)
+}
+
+pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 = bit_u32(15);
+
+pub(crate) const AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL: u32 = 2 << 2;
+
+pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) -> u32 {
+    (3 << 2) | ((w as u32) << 0) | ((r as u32) << 1)
+}
+pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 = 0 << 4;
+pub(crate) const AS_MEMATTR_AARCH64_SH_CPU_INNER: u32 = 1 << 4;
+pub(crate) const AS_MEMATTR_AARCH64_SH_CPU_INNER_SHADER_COH: u32 = 2 << 4;
+pub(crate) const AS_MEMATTR_AARCH64_SHARED: u32 = 0 << 6;
+pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 = 1 << 6;
+pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 = 2 << 6;
+pub(crate) const AS_MEMATTR_AARCH64_FAULT: u32 = 3 << 6;
+
+pub(crate) struct Doorbell(usize);
+
+impl Doorbell {
+    pub(crate) fn new(doorbell_id: usize) -> Self {
+        Doorbell(0x80000 + (doorbell_id * 0x10000))
+    }
+
+    #[inline]
+    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> {
+        (*iomem).try_access().ok_or(ENODEV)?.try_read32(self.0)
+    }
+
+    #[inline]
+    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> Result<()> {
+        (*iomem)
+            .try_access()
+            .ok_or(ENODEV)?
+            .try_write32(value, self.0)
+    }
+}
+
+pub(crate) const CSF_GLB_DOORBELL_ID: usize = 0;
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
new file mode 100644
index 0000000000000000000000000000000000000000..455100aafcffb58af955d3796f2621f2947ad7b9
--- /dev/null
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Rust driver for ARM Mali CSF-based GPUs
+//!
+//! The name "Tyr" is inspired by Norse mythology, reflecting ARM's tradition of
+//! naming their GPUs after Nordic mythological figures and places.
+
+use crate::driver::TyrDriver;
+
+mod driver;
+mod file;
+mod gem;
+mod gpu;
+mod regs;
+
+kernel::module_platform_driver! {
+    type: TyrDriver,
+    name: "tyr",
+    author: "The Tyr driver authors",
+    description: "Rust driver for ARM Mali CSF-based GPUs",
+    license: "Dual MIT/GPL",
+}
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 1409441359f510236256bc17851f9aac65c45c4e..f9959c1d889170ebe6ad5f98a431225fb08625b5 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -9,6 +9,7 @@
 #include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
 #include <uapi/drm/nova_drm.h>
+#include<uapi/drm/panthor_drm.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>

---
base-commit: 1b1d6cbeba24e4c9ff39580101472efeb3bd9b6f
change-id: 20250627-tyr-683ec49113ba

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

