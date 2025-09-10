Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6BB51851
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229F510E922;
	Wed, 10 Sep 2025 13:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IgKqAr9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434410E300
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:52:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757512321; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VVHjm1BMU4OTEu/Pgfvr6jSgC6iLtfNqYzB8DgmdMJuOFovIh50MUg0+/PqhewDjrq1lGVlmJQoob+WCBXNXxmBy8ntAtdXdGPmnsKHd94IITm2RzPbDHIbPeu0lNWS8om5N74UoIM4gp0bd88Rz7I1pJkDBHF8G93aAnVZ+WKc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757512321;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qxFcoduo7QKKxQkDLoPxHstUARsynSiOB8+J4aSjd4s=; 
 b=Hu+acbps99q07wZtxjNjtWjOanpMIinnx3FjA5M4RriOOaDs4YZm+qLjoebkBWwkHZndWlB4xNQFBr9lpRo4M5atKH1RbQzyy7/Mxd+hLwvC0yt0e272lUTcZCxo31x0TGyZVNE/jfuNqsbJtfT/Xrgmkr4f6BDNNqo/JVbo19w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757512321; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=qxFcoduo7QKKxQkDLoPxHstUARsynSiOB8+J4aSjd4s=;
 b=IgKqAr9nZ7Rv9Ta3lGfPsnmdBLkrWZyh9TyKWjYvyCEaGUg2g0sCbO7VwPchD4+t
 g13suoYgT+hv8LV3a8NKiMMyJJsNqHiuudlbeIJxTeFjyHvuZPywRrtZPLJ61lzryut
 jHkLOmTDL3LML052tjGpzZJow9M/IqXNiOQgCvXQ=
Received: by mx.zohomail.com with SMTPS id 1757512319233133.33089885840388;
 Wed, 10 Sep 2025 06:51:59 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 10 Sep 2025 10:51:18 -0300
Subject: [PATCH v3] rust: drm: Introduce the Tyr driver for Arm Mali GPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFWCwWgC/12MwQ6CMBAFf4Xs2RraQqWe/A/joWwXaYLUtKSRE
 P7dggejx3l5MwtECo4inIsFAiUXnR8zyEMB2JvxTszZzCBKUZdKnNg0B6YaSVhpzmVrID+fgTr
 32ivXW+bexcmHeY8mvq2/fuKMM2zrrkKFZCt1QT8MpvXBHNE/YGsk8fUaLj6eyJ6mspMWtTW6/
 vfWdX0Dutad2dIAAAA=
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
 Rob Herring <robh@kernel.org>, Beata Michalska <beata.michalska@arm.com>, 
 Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Ashley Smith <ashley.smith@collabora.com>, 
 Steven Price <steven.price@arm.com>, 
 Jeffrey Vander Stoep <jeffv@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
product of a joint effort between Collabora, Arm and Google engineers.

The aim is to incrementally develop Tyr with the abstractions that are
currently available until it is consider to be in parity with Panthor
feature-wise.

The development of Tyr itself started in January, after a few failed
attempts of converting Panthor piecewise through a mix of Rust and C
code. There is a downstream branch that's much further ahead in terms of
capabilities than this initial patch.

The downstream code is capable of booting the MCU, doing sync VM_BINDS
through the work-in-progress GPUVM abstraction and also doing (trivial)
submits through Asahi's drm_scheduler and dma_fence abstractions. So
basically, most of what one would expect a modern GPU driver to do,
except for power management and some other very important adjacent
pieces. It is not at the point where submits can correctly deal with
dependencies, or at the point where it can rotate access to the GPU
hardware fairly through a software scheduler, but that is simply a
matter of writing more code.

This first patch, however, only implements a subset of the current
features available downstream, as the rest is not implementable without
pulling in even more abstractions. In particular, a lot of things depend
on properly mapping memory on a given VA range, which itself depends on
the GPUVM abstraction that is currently work-in-progress. For this
reason, we still cannot boot the MCU and thus, cannot do much for the
moment.

This constitutes a change in the overall strategy that we have been
using to develop Tyr so far. By submitting small parts of the driver
upstream iteratively, we aim to:

a) evolve together with Nova and rvkms, hopefully reducing regressions
due to upstream changes (that may break us because we were not there, in
the first place)

b) prove any work-in-progress abstractions by having them run on a real
driver and hardware and,

c) provide a reason to work on and review said abstractions by providing
a user, which would be tyr itself.

Despite its limited feature-set, we offer IGT tests. It is only tested
on the rk3588, so any other SoC is probably not going to work at all for
now.

The skeleton is basically taken from Nova and also
rust_platform_driver.rs.

Lastly, the name "Tyr" is inspired by Norse mythology, reflecting ARM's
tradition of naming their GPUs after Nordic mythological figures and
places.

Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Beata Michalska  <beata.michalska@arm.com>
Signed-off-by: Beata Michalska  <beata.michalska@arm.com>
Co-developed-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Co-developed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>

Link: https://www.collabora.com/news-and-blog/news-and-events/introducing-tyr-a-new-rust-drm-driver.html
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
Changes in v3:
- Rebased on rust-drm
- Changed MAINTAINERS to add Alice as a co-maintainer
- Changed T: to point to the rust-drm tree
- Polished the commit message
- Removed the register code for AS registers and Doorbells (not used at
  the moment, and will be eventually replaced with Nova's register!())
- Changed the DRM driver description to say "Arm Mali Tyr DRM driver"
- Link to v2: https://lore.kernel.org/r/20250812-tyr-v2-1-9e0f3dc9da95@collabora.com

Changes in v2:
- Added the "rust: drm:" prefix
- Rebased on top of drm-misc-next (6.17-rc1)
- Got rid of a lot of prerequisite-patch-ids, as most of them were merged
- Removed references to io_poll_timeout() in favor of fsleep(), as this
  will probably take a while to land
- Reword the commit log and the cover letter to remove stale sections

Thanks, Danilo {
- Added safety comments for Send and Sync in TyrData
- Added a TODO explaining how the above is merely temporary
- Switched from pr_err to dev_err
- Did not switch to dev_dbg!() because that does not work in Rust atm.
- Switched to Devres::access()/iomap_sized()/read/write
- Added a TODO in regs.rs to switch to the register!() macro when that's
  available
}

Thanks, Miguel {
- Switched to #[expect(dead_code)] where applicable
- Left a note in regs.rs saying why the above is not applicable there
- Fixed spelling (also thanks, Maira)
- Improved the safety comment for the "AsBytes" for GpuInfo: it is the same
  as the uAPI type (i.e.: both in fields and in the layout) and it is safe
  to implement AsBytes/FromBytes for all uAPI types.
- Changed the "author" key to "authors". Kept the "the Tyr authors"
  nomenclature.
- Added a missing space in uapi_helper.h
}

Thanks, Maira {
- Used the proper constant for the soft-reset command (Steven Price also
  mentioned this)
- Used OptionalClk instead of Clk as applicable (as per the DT)
- Fixed a typo
}

Thanks, Steven {
- Switched from _INT_ to _IRQ_ in regs.rs to match the arch names
- Changed the description to include the name "Tyr"
- Changed the major/minor to be the same ones as Panthor
- Fixed the layout of GpuInfo, which was indeed all over the place (major
  bug, thanks for finding this out)
- Added a TODO for GpuInfo::texture_features[1..3]
- Constrained `AsRegister` to 16 address spaces
- Rearranged the order of the code in regs.rs to have semantically similar
  items closer to each other
}
- Link to v1: https://lore.kernel.org/r/20250627-tyr-v1-1-cb5f4c6ced46@collabora.com
---
 MAINTAINERS                   |  13 +++
 drivers/gpu/drm/Kconfig       |   2 +
 drivers/gpu/drm/Makefile      |   1 +
 drivers/gpu/drm/tyr/Kconfig   |  17 ++++
 drivers/gpu/drm/tyr/Makefile  |   3 +
 drivers/gpu/drm/tyr/driver.rs | 205 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/file.rs   |  57 +++++++++++
 drivers/gpu/drm/tyr/gem.rs    |  18 ++++
 drivers/gpu/drm/tyr/gpu.rs    | 219 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/regs.rs   | 108 +++++++++++++++++++++
 drivers/gpu/drm/tyr/tyr.rs    |  22 +++++
 rust/uapi/uapi_helper.h       |   1 +
 12 files changed, 666 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62298a601bbed343a3b2c77f4f5d8195d1dfe969..8a11e6c5dd809ea0087649786699236193e44bbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2086,6 +2086,19 @@ F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
 F:	drivers/gpu/drm/panthor/
 F:	include/uapi/drm/panthor_drm.h
 
+ARM MALI TYR DRM DRIVER
+M:	Daniel Almeida <daniel.almeida@collabora.com>
+M:	Alice Ryhl <aliceryhl@google.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+W:	https://rust-for-linux.com/tyr-gpu-driver
+W	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
+B:	https://gitlab.freedesktop.org/panfrost/linux/-/issues
+T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
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
index 4dafbdc8f86acc2d31177f8d68e74698e7533587..4b2f7d794275271e7f400dd9300402d9394f20ae 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -220,6 +220,7 @@ obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
 obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_PANTHOR) += panthor/
+obj-$(CONFIG_DRM_TYR) += tyr/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..de910b2cba3a48e0b238eb0f66279758c02dfb6f
--- /dev/null
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0 or MIT
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
index 0000000000000000000000000000000000000000..1d1570b27c04d740af8d466a4f4d4616aad8df70
--- /dev/null
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+use kernel::c_str;
+use kernel::clk::Clk;
+use kernel::clk::OptionalClk;
+use kernel::device::Bound;
+use kernel::device::Core;
+use kernel::device::Device;
+use kernel::devres::Devres;
+use kernel::drm;
+use kernel::drm::ioctl;
+use kernel::new_mutex;
+use kernel::of;
+use kernel::platform;
+use kernel::prelude::*;
+use kernel::regulator;
+use kernel::regulator::Regulator;
+use kernel::sizes::SZ_2M;
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
+pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
+
+/// Convenience type alias for the DRM device type for this driver.
+pub(crate) type TyrDevice = drm::device::Device<TyrDriver>;
+
+#[pin_data(PinnedDrop)]
+pub(crate) struct TyrDriver {
+    device: ARef<TyrDevice>,
+}
+
+#[pin_data(PinnedDrop)]
+pub(crate) struct TyrData {
+    pub(crate) pdev: ARef<platform::Device>,
+
+    #[pin]
+    clks: Mutex<Clocks>,
+
+    #[pin]
+    regulators: Mutex<Regulators>,
+
+    /// Some information on the GPU.
+    ///
+    /// This is mainly queried by userspace, i.e.: Mesa.
+    pub(crate) gpu_info: GpuInfo,
+}
+
+// Both `Clk` and `Regulator` do not implement `Send` or `Sync`, but they
+// should. There are patches on the mailing list to address this, but they have
+// not landed yet.
+//
+// For now, add this workaround so that this patch compiles with the promise
+// that it will be removed in a future patch.
+//
+// SAFETY: This will be removed in a future patch.
+unsafe impl Send for TyrData {}
+// SAFETY: This will be removed in a future patch.
+unsafe impl Sync for TyrData {}
+
+fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
+    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
+
+    // TODO: We cannot poll, as there is no support in Rust currently, so we
+    // sleep. Change this when read_poll_timeout() is implemented in Rust.
+    kernel::time::delay::fsleep(time::Delta::from_millis(100));
+
+    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED == 0 {
+        dev_err!(dev, "GPU reset failed with errno\n");
+        dev_err!(
+            dev,
+            "GPU_INT_RAWSTAT is {}\n",
+            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
+        );
+
+        return Err(EIO);
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
+        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
+        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
+        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
+
+        core_clk.prepare_enable()?;
+        stacks_clk.prepare_enable()?;
+        coregroup_clk.prepare_enable()?;
+
+        let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
+        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
+
+        let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
+        let iomem = Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_KERNEL)?;
+
+        issue_soft_reset(pdev.as_ref(), &iomem)?;
+        gpu::l2_power_on(pdev.as_ref(), &iomem)?;
+
+        let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
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
+        let tdev: ARef<TyrDevice> = drm::device::Device::new(pdev.as_ref(), data)?;
+        drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
+
+        let driver = KBox::pin_init(try_pin_init!(TyrDriver { device: tdev }), GFP_KERNEL)?;
+
+        // We need this to be dev_info!() because dev_dbg!() does not work at
+        // all in Rust for now, and we need to see whether probe succeeded.
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
+#[pinned_drop]
+impl PinnedDrop for TyrData {
+    fn drop(self: Pin<&mut Self>) {
+        // TODO: the type-state pattern for Clks will fix this.
+        let clks = self.clks.lock();
+        clks.core.disable_unprepare();
+        clks.stacks.disable_unprepare();
+        clks.coregroup.disable_unprepare();
+    }
+}
+
+// We need to retain the name "panthor" to achieve drop-in compatibility with
+// the C driver in the userspace stack.
+const INFO: drm::driver::DriverInfo = drm::driver::DriverInfo {
+    major: 1,
+    minor: 5,
+    patchlevel: 0,
+    name: c_str!("panthor"),
+    desc: c_str!("ARM Mali Tyr DRM driver"),
+};
+
+#[vtable]
+impl drm::driver::Driver for TyrDriver {
+    type Data = TyrData;
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
+    stacks: OptionalClk,
+    coregroup: OptionalClk,
+}
+
+#[pin_data]
+struct Regulators {
+    mali: Regulator<regulator::Enabled>,
+    sram: Regulator<regulator::Enabled>,
+}
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
new file mode 100644
index 0000000000000000000000000000000000000000..38ae89e0580e332049c9e82f2b128485fd9dc465
--- /dev/null
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
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
+    fn open(_dev: &DrmDevice<Self::Driver>) -> Result<Pin<KBox<Self>>> {
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
+                    let mut writer = UserSlice::new(
+                        UserPtr::from_addr(devquery.pointer as usize),
+                        devquery.size as usize,
+                    )
+                    .writer();
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
index 0000000000000000000000000000000000000000..1273bf89dbd5d761dd030c99be96e5d9f5aacd2e
--- /dev/null
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+use crate::driver::TyrDevice;
+use crate::driver::TyrDriver;
+use kernel::drm::gem;
+use kernel::prelude::*;
+
+/// GEM Object inner driver data
+#[pin_data]
+pub(crate) struct TyrObject {}
+
+impl gem::DriverObject for TyrObject {
+    type Driver = TyrDriver;
+
+    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, Error> {
+        try_pin_init!(TyrObject {})
+    }
+}
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
new file mode 100644
index 0000000000000000000000000000000000000000..6c582910dd5d93006ea0ba10f876a487b156e313
--- /dev/null
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+use kernel::bits::genmask_u32;
+use kernel::device::Bound;
+use kernel::device::Device;
+use kernel::devres::Devres;
+use kernel::platform;
+use kernel::prelude::*;
+use kernel::time;
+use kernel::transmute::AsBytes;
+
+use crate::driver::IoMem;
+use crate::regs;
+
+/// Struct containing information that can be queried by userspace. This is read from
+/// the GPU's registers.
+///
+/// # Invariants
+///
+/// - The layout of this struct identical to the C `struct drm_panthor_gpu_info`.
+#[repr(C)]
+pub(crate) struct GpuInfo {
+    pub(crate) gpu_id: u32,
+    pub(crate) gpu_rev: u32,
+    pub(crate) csf_id: u32,
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
+    pub(crate) pad0: u32,
+    pub(crate) shader_present: u64,
+    pub(crate) l2_present: u64,
+    pub(crate) tiler_present: u64,
+    pub(crate) core_features: u32,
+    pub(crate) pad: u32,
+}
+
+impl GpuInfo {
+    pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
+        let gpu_id = regs::GPU_ID.read(dev, iomem)?;
+        let csf_id = regs::GPU_CSF_ID.read(dev, iomem)?;
+        let gpu_rev = regs::GPU_REVID.read(dev, iomem)?;
+        let core_features = regs::GPU_CORE_FEATURES.read(dev, iomem)?;
+        let l2_features = regs::GPU_L2_FEATURES.read(dev, iomem)?;
+        let tiler_features = regs::GPU_TILER_FEATURES.read(dev, iomem)?;
+        let mem_features = regs::GPU_MEM_FEATURES.read(dev, iomem)?;
+        let mmu_features = regs::GPU_MMU_FEATURES.read(dev, iomem)?;
+        let thread_features = regs::GPU_THREAD_FEATURES.read(dev, iomem)?;
+        let max_threads = regs::GPU_THREAD_MAX_THREADS.read(dev, iomem)?;
+        let thread_max_workgroup_size = regs::GPU_THREAD_MAX_WORKGROUP_SIZE.read(dev, iomem)?;
+        let thread_max_barrier_size = regs::GPU_THREAD_MAX_BARRIER_SIZE.read(dev, iomem)?;
+        let coherency_features = regs::GPU_COHERENCY_FEATURES.read(dev, iomem)?;
+
+        let texture_features = regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?;
+
+        let as_present = regs::GPU_AS_PRESENT.read(dev, iomem)?;
+
+        let shader_present = u64::from(regs::GPU_SHADER_PRESENT_LO.read(dev, iomem)?);
+        let shader_present =
+            shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << 32;
+
+        let tiler_present = u64::from(regs::GPU_TILER_PRESENT_LO.read(dev, iomem)?);
+        let tiler_present =
+            tiler_present | u64::from(regs::GPU_TILER_PRESENT_HI.read(dev, iomem)?) << 32;
+
+        let l2_present = u64::from(regs::GPU_L2_PRESENT_LO.read(dev, iomem)?);
+        let l2_present = l2_present | u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32;
+
+        Ok(Self {
+            gpu_id,
+            gpu_rev,
+            csf_id,
+            l2_features,
+            tiler_features,
+            mem_features,
+            mmu_features,
+            thread_features,
+            max_threads,
+            thread_max_workgroup_size,
+            thread_max_barrier_size,
+            coherency_features,
+            // TODO: Add texture_features_{1,2,3}.
+            texture_features: [texture_features, 0, 0, 0],
+            as_present,
+            pad0: 0,
+            shader_present,
+            l2_present,
+            tiler_present,
+            core_features,
+            pad: 0,
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
+    }
+
+    /// Returns the number of virtual address bits supported by the GPU.
+    #[expect(dead_code)]
+    pub(crate) fn va_bits(&self) -> u32 {
+        self.mmu_features & genmask_u32(0..=7)
+    }
+
+    /// Returns the number of physical address bits supported by the GPU.
+    #[expect(dead_code)]
+    pub(crate) fn pa_bits(&self) -> u32 {
+        (self.mmu_features >> 8) & genmask_u32(0..=7)
+    }
+}
+
+// SAFETY: `GpuInfo`'s invariant guarantees that it is the same type that is
+// already exposed to userspace by the C driver. This implies that it fulfills
+// the requirements for `AsBytes`.
+//
+// This means:
+//
+// - No implicit padding,
+// - No kernel pointers,
+// - No interior mutability.
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
+pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
+    regs::L2_PWRON_LO.write(dev, iomem, 1)?;
+
+    // TODO: We cannot poll, as there is no support in Rust currently, so we
+    // sleep. Change this when read_poll_timeout() is implemented in Rust.
+    kernel::time::delay::fsleep(time::Delta::from_millis(100));
+
+    if regs::L2_READY_LO.read(dev, iomem)? != 1 {
+        dev_err!(dev, "Failed to power on the GPU\n");
+        return Err(EIO);
+    }
+
+    Ok(())
+}
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f46933aaa2214ee0ac58b1ea2a6aa99506a35b70
--- /dev/null
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+// We don't expect that all the registers and fields will be used, even in the
+// future.
+//
+// Nevertheless, it is useful to have most of them defined, like the C driver
+// does.
+#![allow(dead_code)]
+
+use kernel::bits::bit_u32;
+use kernel::device::Bound;
+use kernel::device::Device;
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::driver::IoMem;
+
+/// Represents a register in the Register Set
+///
+/// TODO: Replace this with the Nova `register!()` macro when it is available.
+/// In particular, this will automatically give us 64bit register reads and
+/// writes.
+pub(crate) struct Register<const OFFSET: usize>;
+
+impl<const OFFSET: usize> Register<OFFSET> {
+    #[inline]
+    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
+        let value = (*iomem).access(dev)?.read32(OFFSET);
+        Ok(value)
+    }
+
+    #[inline]
+    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
+        (*iomem).access(dev)?.write32(value, OFFSET);
+        Ok(())
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
+pub(crate) const GPU_IRQ_RAWSTAT: Register<0x20> = Register;
+
+pub(crate) const GPU_IRQ_RAWSTAT_FAULT: u32 = bit_u32(0);
+pub(crate) const GPU_IRQ_RAWSTAT_PROTECTED_FAULT: u32 = bit_u32(1);
+pub(crate) const GPU_IRQ_RAWSTAT_RESET_COMPLETED: u32 = bit_u32(8);
+pub(crate) const GPU_IRQ_RAWSTAT_POWER_CHANGED_SINGLE: u32 = bit_u32(9);
+pub(crate) const GPU_IRQ_RAWSTAT_POWER_CHANGED_ALL: u32 = bit_u32(10);
+pub(crate) const GPU_IRQ_RAWSTAT_CLEAN_CACHES_COMPLETED: u32 = bit_u32(17);
+pub(crate) const GPU_IRQ_RAWSTAT_DOORBELL_STATUS: u32 = bit_u32(18);
+pub(crate) const GPU_IRQ_RAWSTAT_MCU_STATUS: u32 = bit_u32(19);
+
+pub(crate) const GPU_IRQ_CLEAR: Register<0x24> = Register;
+pub(crate) const GPU_IRQ_MASK: Register<0x28> = Register;
+pub(crate) const GPU_IRQ_STAT: Register<0x2c> = Register;
+pub(crate) const GPU_CMD: Register<0x30> = Register;
+pub(crate) const GPU_CMD_SOFT_RESET: u32 = 1 | (1 << 8);
+pub(crate) const GPU_CMD_HARD_RESET: u32 = 1 | (2 << 8);
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
+pub(crate) const JOB_IRQ_RAWSTAT: Register<0x1000> = Register;
+pub(crate) const JOB_IRQ_CLEAR: Register<0x1004> = Register;
+pub(crate) const JOB_IRQ_MASK: Register<0x1008> = Register;
+pub(crate) const JOB_IRQ_STAT: Register<0x100c> = Register;
+
+pub(crate) const JOB_IRQ_GLOBAL_IF: u32 = bit_u32(31);
+
+pub(crate) const MMU_IRQ_RAWSTAT: Register<0x2000> = Register;
+pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
+pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
+pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
new file mode 100644
index 0000000000000000000000000000000000000000..861d1db43072652710b16bbc2ad48f49eebbd0cb
--- /dev/null
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Arm Mali Tyr DRM driver.
+//!
+//! The name "Tyr" is inspired by Norse mythology, reflecting Arm's tradition of
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
+    authors: ["The Tyr driver authors"],
+    description: "Arm Mali Tyr DRM driver",
+    license: "Dual MIT/GPL",
+}
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 1409441359f510236256bc17851f9aac65c45c4e..d4a239cf2a64fce964b28959ff807ee187b2610d 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -9,6 +9,7 @@
 #include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
 #include <uapi/drm/nova_drm.h>
+#include <uapi/drm/panthor_drm.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>

---
base-commit: d4dc08c530cbf71fb1c7cddb9d1e7e36bd62e22f
change-id: 20250627-tyr-683ec49113ba

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

