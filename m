Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD2BE3866
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 14:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5D210E9CF;
	Thu, 16 Oct 2025 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QYXAUcu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68510E9CF;
 Thu, 16 Oct 2025 12:56:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AADA363F49;
 Thu, 16 Oct 2025 12:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2C0C4CEF1;
 Thu, 16 Oct 2025 12:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760619389;
 bh=LLXoURVs84YoBxq6KqhCNf68UqJPx499QKC/0Wlux1U=;
 h=From:To:Cc:Subject:Date:From;
 b=QYXAUcu+oKsBMiapUXCtKtPAtOXF9oToKIoQ4XUxRMyTIIepK9JZ/wR3tVV/Pg8pR
 IFO9Ii1xpEnfYTq/hnnGQwvecdXDWBgzx2Ugxkn3LkDtOzg6UE8nVt3qQ+4EquBEww
 +3A8DzqhXzu33eXUInoUl80XBLgYUC+xKqcRFOUFVoRBlKG0joDkPhYXHnVhdgs2K+
 I7c/M+CFMc6bzC5i3GhGHwehFddy3scNO6c5p3QCMoaZRu3ZECQHD8ASJTxnQBhPOf
 9XdjwONa2Smbim54R3tEg9gKBJN+rXGRCwfUSEvmHDSGOafIIbcDh50IS+xZWbmcp0
 8LAjZopJrlNng==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: viresh.kumar@linaro.org, acourbot@nvidia.com, ira.weiny@intel.com,
 leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com,
 kwilczynski@kernel.org, abdiel.janulgue@gmail.com, robin.murphy@arm.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
Date: Thu, 16 Oct 2025 14:55:28 +0200
Message-ID: <20251016125544.15559-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The driver model defines the lifetime of the private data stored in (and
owned by) a bus device to be valid from when the driver is bound to a
device (i.e. from successful probe()) until the driver is unbound from
the device.

This is already taken care of by the Rust implementation of the driver
model. However, we still ask drivers to return a Result<Pin<KBox<Self>>>
from probe().

Unlike in C, where we do not have the concept of initializers, but
rather deal with uninitialized memory, drivers can just return an
impl PinInit<Self, Error> instead.

This contributed to more clarity to the fact that a driver returns it's
device private data in probe() and the Rust driver model owns the data,
manages the lifetime and - considering the lifetime - provides (safe)
accessors for the driver.

Hence, let probe() functions return an impl PinInit<Self, Error> instead
of Result<Pin<KBox<Self>>>.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Depends on a minor pin-init patch [1] (Benno will send it to the list
soon). A branch with this patch and the pin-init dependency is available
in [2].

[1] https://github.com/Rust-for-Linux/pin-init/pull/86/commits
[2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=probe_return
---
 drivers/cpufreq/rcpufreq_dt.rs        |  4 +-
 drivers/gpu/drm/nova/driver.rs        |  4 +-
 drivers/gpu/drm/tyr/driver.rs         |  4 +-
 drivers/gpu/nova-core/driver.rs       | 34 +++++++----------
 rust/kernel/auxiliary.rs              |  6 +--
 rust/kernel/cpufreq.rs                |  4 +-
 rust/kernel/device.rs                 |  9 ++++-
 rust/kernel/driver.rs                 |  4 +-
 rust/kernel/io/mem.rs                 |  8 ++--
 rust/kernel/pci.rs                    |  8 ++--
 rust/kernel/platform.rs               | 12 +++---
 rust/kernel/usb.rs                    |  4 +-
 samples/rust/rust_debugfs.rs          | 21 ++++++-----
 samples/rust/rust_dma.rs              | 37 +++++++++----------
 samples/rust/rust_driver_auxiliary.rs | 25 +++++--------
 samples/rust/rust_driver_pci.rs       | 53 +++++++++++++--------------
 samples/rust/rust_driver_platform.rs  |  6 +--
 samples/rust/rust_driver_usb.rs       |  5 +--
 18 files changed, 117 insertions(+), 131 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 53923b8ef7a1..31e07f0279db 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -207,9 +207,9 @@ impl platform::Driver for CPUFreqDTDriver {
     fn probe(
         pdev: &platform::Device<Core>,
         _id_info: Option<&Self::IdInfo>,
-    ) -> Result<Pin<KBox<Self>>> {
+    ) -> impl PinInit<Self, Error> {
         cpufreq::Registration::<CPUFreqDTDriver>::new_foreign_owned(pdev.as_ref())?;
-        Ok(KBox::new(Self {}, GFP_KERNEL)?.into())
+        Ok(Self {})
     }
 }
 
diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 91b7380f83ab..2246d8e104e0 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -45,13 +45,13 @@ impl auxiliary::Driver for NovaDriver {
     type IdInfo = ();
     const ID_TABLE: auxiliary::IdTable<Self::IdInfo> = &AUX_TABLE;
 
-    fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+    fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
         let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
         drm::Registration::new_foreign_owned(&drm, adev.as_ref(), 0)?;
 
-        Ok(KBox::new(Self { drm }, GFP_KERNEL)?.into())
+        Ok(Self { drm })
     }
 }
 
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index d5625dd1e41c..0389c558c036 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -103,7 +103,7 @@ impl platform::Driver for TyrDriver {
     fn probe(
         pdev: &platform::Device<Core>,
         _info: Option<&Self::IdInfo>,
-    ) -> Result<Pin<KBox<Self>>> {
+    ) -> impl PinInit<Self, Error> {
         let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
         let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
         let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
@@ -143,7 +143,7 @@ fn probe(
         let tdev: ARef<TyrDevice> = drm::Device::new(pdev.as_ref(), data)?;
         drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref(), 0)?;
 
-        let driver = KBox::pin_init(try_pin_init!(TyrDriver { device: tdev }), GFP_KERNEL)?;
+        let driver = TyrDriver { device: tdev };
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index edc72052e27a..a83b86199182 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -51,36 +51,28 @@ impl pci::Driver for NovaCore {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
 
-    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
-        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
 
-        pdev.enable_device_mem()?;
-        pdev.set_master();
+            pdev.enable_device_mem()?;
+            pdev.set_master();
 
-        let devres_bar = Arc::pin_init(
-            pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
-            GFP_KERNEL,
-        )?;
+            let bar = Arc::pin_init(
+                pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
+                GFP_KERNEL,
+            )?;
 
-        // Used to provided a `&Bar0` to `Gpu::new` without tying it to the lifetime of
-        // `devres_bar`.
-        let bar_clone = Arc::clone(&devres_bar);
-        let bar = bar_clone.access(pdev.as_ref())?;
-
-        let this = KBox::pin_init(
-            try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, devres_bar, bar),
+            Ok(try_pin_init!(Self {
+                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c_str!("nova-drm"),
                     0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
                     crate::MODULE_NAME
                 )?,
-            }),
-            GFP_KERNEL,
-        )?;
-
-        Ok(this)
+            }))
+        })
     }
 
     fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index e11848bbf206..4163129b4103 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -68,9 +68,9 @@ extern "C" fn probe_callback(
         let info = T::ID_TABLE.info(id.index());
 
         from_result(|| {
-            let data = T::probe(adev, info)?;
+            let data = T::probe(adev, info);
 
-            adev.as_ref().set_drvdata(data);
+            adev.as_ref().set_drvdata(data)?;
             Ok(0)
         })
     }
@@ -184,7 +184,7 @@ pub trait Driver {
     /// Auxiliary driver probe.
     ///
     /// Called when an auxiliary device is matches a corresponding driver.
-    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>;
+    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> impl PinInit<Self, Error>;
 }
 
 /// The auxiliary device representation.
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 21b5b9b8acc1..462a9ef8669e 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -894,9 +894,9 @@ fn register_em(_policy: &mut Policy) {
 ///     fn probe(
 ///         pdev: &platform::Device<Core>,
 ///         _id_info: Option<&Self::IdInfo>,
-///     ) -> Result<Pin<KBox<Self>>> {
+///     ) -> impl PinInit<Self, Error> {
 ///         cpufreq::Registration::<SampleDriver>::new_foreign_owned(pdev.as_ref())?;
-///         Ok(KBox::new(Self {}, GFP_KERNEL)?.into())
+///         Ok(Self {})
 ///     }
 /// }
 /// ```
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 1321e6f0b53c..23a95324cb0f 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,6 +6,7 @@
 
 use crate::{
     bindings, fmt,
+    prelude::*,
     sync::aref::ARef,
     types::{ForeignOwnable, Opaque},
 };
@@ -198,9 +199,13 @@ pub unsafe fn as_bound(&self) -> &Device<Bound> {
 
 impl Device<CoreInternal> {
     /// Store a pointer to the bound driver's private data.
-    pub fn set_drvdata(&self, data: impl ForeignOwnable) {
+    pub fn set_drvdata<T: 'static>(&self, data: impl PinInit<T, Error>) -> Result {
+        let data = KBox::pin_init(data, GFP_KERNEL)?;
+
         // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
-        unsafe { bindings::dev_set_drvdata(self.as_raw(), data.into_foreign().cast()) }
+        unsafe { bindings::dev_set_drvdata(self.as_raw(), data.into_foreign().cast()) };
+
+        Ok(())
     }
 
     /// Take ownership of the private data stored in this [`Device`].
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 279e3af20682..9beae2e3d57e 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -24,7 +24,7 @@
 //!     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
 //!
 //!     /// Driver probe.
-//!     fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>;
+//!     fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> impl PinInit<Self, Error>;
 //!
 //!     /// Driver unbind (optional).
 //!     fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
@@ -35,7 +35,7 @@
 //!
 //! For specific examples see [`auxiliary::Driver`], [`pci::Driver`] and [`platform::Driver`].
 //!
-//! The `probe()` callback should return a `Result<Pin<KBox<Self>>>`, i.e. the driver's private
+//! The `probe()` callback should return a `impl PinInit<Self, Error>`, i.e. the driver's private
 //! data. The bus abstraction should store the pointer in the corresponding bus device. The generic
 //! [`Device`] infrastructure provides common helpers for this purpose on its
 //! [`Device<CoreInternal>`] implementation.
diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 6f99510bfc3a..59096d579644 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -53,7 +53,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     ///    fn probe(
     ///       pdev: &platform::Device<Core>,
     ///       info: Option<&Self::IdInfo>,
-    ///    ) -> Result<Pin<KBox<Self>>> {
+    ///    ) -> impl PinInit<Self, Error> {
     ///       let offset = 0; // Some offset.
     ///
     ///       // If the size is known at compile time, use [`Self::iomap_sized`].
@@ -70,7 +70,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
     ///
     ///       io.write32_relaxed(data, offset);
     ///
-    ///       # Ok(KBox::new(SampleDriver, GFP_KERNEL)?.into())
+    ///       # Ok(SampleDriver)
     ///     }
     /// }
     /// ```
@@ -111,7 +111,7 @@ pub fn iomap_exclusive_sized<const SIZE: usize>(
     ///    fn probe(
     ///       pdev: &platform::Device<Core>,
     ///       info: Option<&Self::IdInfo>,
-    ///    ) -> Result<Pin<KBox<Self>>> {
+    ///    ) -> impl PinInit<Self, Error> {
     ///       let offset = 0; // Some offset.
     ///
     ///       // Unlike [`Self::iomap_sized`], here the size of the memory region
@@ -128,7 +128,7 @@ pub fn iomap_exclusive_sized<const SIZE: usize>(
     ///
     ///       io.try_write32_relaxed(data, offset)?;
     ///
-    ///       # Ok(KBox::new(SampleDriver, GFP_KERNEL)?.into())
+    ///       # Ok(SampleDriver)
     ///     }
     /// }
     /// ```
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index d91ec9f008ae..83e19bcec46e 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -131,9 +131,9 @@ extern "C" fn probe_callback(
         let info = T::ID_TABLE.info(id.index());
 
         from_result(|| {
-            let data = T::probe(pdev, info)?;
+            let data = T::probe(pdev, info);
 
-            pdev.as_ref().set_drvdata(data);
+            pdev.as_ref().set_drvdata(data)?;
             Ok(0)
         })
     }
@@ -302,7 +302,7 @@ macro_rules! pci_device_table {
 ///     fn probe(
 ///         _pdev: &pci::Device<Core>,
 ///         _id_info: &Self::IdInfo,
-///     ) -> Result<Pin<KBox<Self>>> {
+///     ) -> impl PinInit<Self, Error> {
 ///         Err(ENODEV)
 ///     }
 /// }
@@ -325,7 +325,7 @@ pub trait Driver: Send {
     ///
     /// Called when a new pci device is added or discovered. Implementers should
     /// attempt to initialize the device here.
-    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>;
+    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> impl PinInit<Self, Error>;
 
     /// PCI driver unbind.
     ///
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 7205fe3416d3..043721fdb6d8 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -74,9 +74,9 @@ extern "C" fn probe_callback(pdev: *mut bindings::platform_device) -> kernel::ff
         let info = <Self as driver::Adapter>::id_info(pdev.as_ref());
 
         from_result(|| {
-            let data = T::probe(pdev, info)?;
+            let data = T::probe(pdev, info);
 
-            pdev.as_ref().set_drvdata(data);
+            pdev.as_ref().set_drvdata(data)?;
             Ok(0)
         })
     }
@@ -166,7 +166,7 @@ macro_rules! module_platform_driver {
 ///     fn probe(
 ///         _pdev: &platform::Device<Core>,
 ///         _id_info: Option<&Self::IdInfo>,
-///     ) -> Result<Pin<KBox<Self>>> {
+///     ) -> impl PinInit<Self, Error> {
 ///         Err(ENODEV)
 ///     }
 /// }
@@ -190,8 +190,10 @@ pub trait Driver: Send {
     ///
     /// Called when a new platform device is added or discovered.
     /// Implementers should attempt to initialize the device here.
-    fn probe(dev: &Device<device::Core>, id_info: Option<&Self::IdInfo>)
-        -> Result<Pin<KBox<Self>>>;
+    fn probe(
+        dev: &Device<device::Core>,
+        id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error>;
 
     /// Platform driver unbind.
     ///
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 14ddb711bab3..9238b96c2185 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -270,7 +270,7 @@ macro_rules! usb_device_table {
 ///         _interface: &usb::Interface<Core>,
 ///         _id: &usb::DeviceId,
 ///         _info: &Self::IdInfo,
-///     ) -> Result<Pin<KBox<Self>>> {
+///     ) -> impl PinInit<Self, Error> {
 ///         Err(ENODEV)
 ///     }
 ///
@@ -292,7 +292,7 @@ fn probe(
         interface: &Interface<device::Core>,
         id: &DeviceId,
         id_info: &Self::IdInfo,
-    ) -> Result<Pin<KBox<Self>>>;
+    ) -> impl PinInit<Self, Error>;
 
     /// USB driver disconnect.
     ///
diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 82b61a15a34b..d3f50f344856 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -106,16 +106,17 @@ impl platform::Driver for RustDebugFs {
     fn probe(
         pdev: &platform::Device<Core>,
         _info: Option<&Self::IdInfo>,
-    ) -> Result<Pin<KBox<Self>>> {
-        let result = KBox::try_pin_init(RustDebugFs::new(pdev), GFP_KERNEL)?;
-        // We can still mutate fields through the files which are atomic or mutexed:
-        result.counter.store(91, Ordering::Relaxed);
-        {
-            let mut guard = result.inner.lock();
-            guard.x = guard.y;
-            guard.y = 42;
-        }
-        Ok(result)
+    ) -> impl PinInit<Self, Error> {
+        RustDebugFs::new(pdev).pin_chain(|this| {
+            this.counter.store(91, Ordering::Relaxed);
+            {
+                let mut guard = this.inner.lock();
+                guard.x = guard.y;
+                guard.y = 42;
+            }
+
+            Ok(())
+        })
     }
 }
 
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 4d324f06cc2a..f53bce2a73e3 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -55,36 +55,33 @@ impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
 
-    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
-        dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");
 
-        let mask = DmaMask::new::<64>();
+            let mask = DmaMask::new::<64>();
 
-        // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
-        unsafe { pdev.dma_set_mask_and_coherent(mask)? };
+            // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
+            unsafe { pdev.dma_set_mask_and_coherent(mask)? };
 
-        let ca: CoherentAllocation<MyStruct> =
-            CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+            let ca: CoherentAllocation<MyStruct> =
+                CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
-        for (i, value) in TEST_VALUES.into_iter().enumerate() {
-            kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
-        }
+            for (i, value) in TEST_VALUES.into_iter().enumerate() {
+                kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
+            }
 
-        let size = 4 * page::PAGE_SIZE;
-        let pages = VVec::with_capacity(size, GFP_KERNEL)?;
+            let size = 4 * page::PAGE_SIZE;
+            let pages = VVec::with_capacity(size, GFP_KERNEL)?;
 
-        let sgt = SGTable::new(pdev.as_ref(), pages, DataDirection::ToDevice, GFP_KERNEL);
+            let sgt = SGTable::new(pdev.as_ref(), pages, DataDirection::ToDevice, GFP_KERNEL);
 
-        let drvdata = KBox::pin_init(
-            try_pin_init!(Self {
+            Ok(try_pin_init!(Self {
                 pdev: pdev.into(),
                 ca,
                 sgt <- sgt,
-            }),
-            GFP_KERNEL,
-        )?;
-
-        Ok(drvdata)
+            }))
+        })
     }
 }
 
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 55ece336ee45..0e221abe4936 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -27,7 +27,7 @@ impl auxiliary::Driver for AuxiliaryDriver {
 
     const ID_TABLE: auxiliary::IdTable<Self::IdInfo> = &AUX_TABLE;
 
-    fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+    fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         dev_info!(
             adev.as_ref(),
             "Probing auxiliary driver for auxiliary device with id={}\n",
@@ -36,9 +36,7 @@ fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBo
 
         ParentDriver::connect(adev)?;
 
-        let this = KBox::new(Self, GFP_KERNEL)?;
-
-        Ok(this.into())
+        Ok(Self)
     }
 }
 
@@ -58,18 +56,13 @@ impl pci::Driver for ParentDriver {
 
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
 
-    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
-        let this = KBox::new(
-            Self {
-                _reg: [
-                    auxiliary::Registration::new(pdev.as_ref(), AUXILIARY_NAME, 0, MODULE_NAME)?,
-                    auxiliary::Registration::new(pdev.as_ref(), AUXILIARY_NAME, 1, MODULE_NAME)?,
-                ],
-            },
-            GFP_KERNEL,
-        )?;
-
-        Ok(this.into())
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        Ok(Self {
+            _reg: [
+                auxiliary::Registration::new(pdev.as_ref(), AUXILIARY_NAME, 0, MODULE_NAME)?,
+                auxiliary::Registration::new(pdev.as_ref(), AUXILIARY_NAME, 1, MODULE_NAME)?,
+            ],
+        })
     }
 }
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 55a683c39ed9..5823787bea8e 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -65,35 +65,34 @@ impl pci::Driver for SampleDriver {
 
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
 
-    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
-        let vendor = pdev.vendor_id();
-        dev_dbg!(
-            pdev.as_ref(),
-            "Probe Rust PCI driver sample (PCI ID: {}, 0x{:x}).\n",
-            vendor,
-            pdev.device_id()
-        );
-
-        pdev.enable_device_mem()?;
-        pdev.set_master();
-
-        let drvdata = KBox::pin_init(
-            try_pin_init!(Self {
+    fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            let vendor = pdev.vendor_id();
+            dev_dbg!(
+                pdev.as_ref(),
+                "Probe Rust PCI driver sample (PCI ID: {}, 0x{:x}).\n",
+                vendor,
+                pdev.device_id()
+            );
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            Ok(try_pin_init!(Self {
                 bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c_str!("rust_driver_pci")),
-                pdev: pdev.into(),
                 index: *info,
-            }),
-            GFP_KERNEL,
-        )?;
-
-        let bar = drvdata.bar.access(pdev.as_ref())?;
-        dev_info!(
-            pdev.as_ref(),
-            "pci-testdev data-match count: {}\n",
-            Self::testdev(info, bar)?
-        );
-
-        Ok(drvdata)
+                _: {
+                    let bar = bar.access(pdev.as_ref())?;
+
+                    dev_info!(
+                        pdev.as_ref(),
+                        "pci-testdev data-match count: {}\n",
+                        Self::testdev(info, bar)?
+                    );
+                },
+                pdev: pdev.into(),
+            }))
+        })
     }
 
     fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 6473baf4f120..d63adb422ba6 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -103,7 +103,7 @@ impl platform::Driver for SampleDriver {
     fn probe(
         pdev: &platform::Device<Core>,
         info: Option<&Self::IdInfo>,
-    ) -> Result<Pin<KBox<Self>>> {
+    ) -> impl PinInit<Self, Error> {
         let dev = pdev.as_ref();
 
         dev_dbg!(dev, "Probe Rust Platform driver sample.\n");
@@ -116,9 +116,7 @@ fn probe(
             Self::properties_parse(dev)?;
         }
 
-        let drvdata = KBox::new(Self { pdev: pdev.into() }, GFP_KERNEL)?;
-
-        Ok(drvdata.into())
+        Ok(Self { pdev: pdev.into() })
     }
 }
 
diff --git a/samples/rust/rust_driver_usb.rs b/samples/rust/rust_driver_usb.rs
index 5c396f421de7..4eaad14867b2 100644
--- a/samples/rust/rust_driver_usb.rs
+++ b/samples/rust/rust_driver_usb.rs
@@ -24,12 +24,11 @@ fn probe(
         intf: &usb::Interface<Core>,
         _id: &usb::DeviceId,
         _info: &Self::IdInfo,
-    ) -> Result<Pin<KBox<Self>>> {
+    ) -> impl PinInit<Self, Error> {
         let dev: &device::Device<Core> = intf.as_ref();
         dev_info!(dev, "Rust USB driver sample probed\n");
 
-        let drvdata = KBox::new(Self { _intf: intf.into() }, GFP_KERNEL)?;
-        Ok(drvdata.into())
+        Ok(Self { _intf: intf.into() })
     }
 
     fn disconnect(intf: &usb::Interface<Core>, _data: Pin<&Self>) {
-- 
2.51.0

