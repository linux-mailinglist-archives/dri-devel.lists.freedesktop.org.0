Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BFAB6953
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973B110E611;
	Wed, 14 May 2025 10:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SbnH8/g4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A30B10E60E;
 Wed, 14 May 2025 10:58:53 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-72c40235c34so1871291a34.3; 
 Wed, 14 May 2025 03:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747220333; x=1747825133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qD5w6c0a6kvz0Ef85ipEl+D0Znk2XoV05BpXME7RAZc=;
 b=SbnH8/g45IehITQ+ag7EcNoqkr5DV8Qm7AL4VbmzCOdRHnEbqqqGvO2y30MKuCPbfW
 37A1Q+Dan9GcipELLSVV0A3jbnUWckz2FxIINL7MCYAq0y2qma5Rtwj5JNNqAauar4OH
 Uc3n65XO4SiqoC/QESCfQiOgMxyzrVOOTEqAeWPUHn5bZsCZ0rkmn2OcQSaPE5AcdR0w
 Bn5Zci/qhlx5N6I/csXM8vCkmaR9aVz3wGi+/uyxChhIaCBY6j/4Cuq28sIOEocK4qT+
 6nOLJj0DhSGGhaEYXoYbbjmJRITnD9u6LS+c9HjbpRIScpibkNOW70WDPdHxbnC/XPzb
 Jlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747220333; x=1747825133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qD5w6c0a6kvz0Ef85ipEl+D0Znk2XoV05BpXME7RAZc=;
 b=FhcpmS46grq5SyS6D6tFe6tN03Tz4YoukdhWJQ2rN0YzJVvUfBwe17TykTqSpcD6nZ
 jbla7tSgR6hbjCpOb2pVhm157J0Yb+OCUapC8t40Ize+OD4eHaQDjnCavCtfdp0FF2gK
 3I11Ch3VqCNHhXmq/TjCRkncmSgXEerVZPxF6LTp0znuyUYVMgyEe+otvpZVLA/Pq6dm
 1TKuc5gYVmvD+e04KwQKQc/XFPQk8OhI0RRVwf85LDT89Dq7sAgSbdICYcPGDgEIR4SH
 ojIFzjkdHx8rpuh8E8bjSngvph2qcCWHgPAV62XRb1YcA/dwMGAOe05gh/oNiZlFf66D
 InmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2swPURAG8PGMKiNrySRKOuxcjosYJiq6o0lhkpytL7zNsH98wXZaucnLSNfc/XQUnJ6N3MN7v@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN7/b0L3NqWBpCrRp57LiI4lBQyBx/97Mgo+R7EnfYqMqfRHFM
 yPMskDZsEgt2MYfDSrgGVwS1W24Bfy1zFY64w2mwuMeka1kqoNjy
X-Gm-Gg: ASbGncuyTSSxW9c6TGNZ6cBMtwmXBElCdF75/au7rUeE7AjG+h1DRh+piUt6G24HsNY
 k+R9wyq1TUb4iF1tWdIMdtl2K0c/IwaRwG9S8fRLrm4VgoxSgg2vkNM6KH6oxtDSjzEzsPtMRvI
 sQSww6DnrPrecfW/C7fo73+mFvN/4iDsI/jCEl+f/36yaxSCkFhF2Ztahv8xwbwdgArDrIfFina
 SbYDJnXUAn2M4Gc41RX2BT8ZmowK4T1UK4RmxA8uIQGS/5brqybeTULEhH0S53dfQV20mqNuGFC
 hQQCrLGB8tVlb498jEeLanC1I4A0Rkwe58GAlHFpXYY6O0I3EDqN78cfoHRKw4HcAvs172VYIxI
 /Wd/OWgFOntQSi9DFC1qrOP3KQXQAxkDZvQ==
X-Google-Smtp-Source: AGHT+IE54MfSAuxodqlDuPCWb0IgGKv5g1H7LzyyZwbg9zyX4LOVBOAb43K73rSiK2QfFtlG75L38w==
X-Received: by 2002:a05:6830:368f:b0:727:345d:3b72 with SMTP id
 46e09a7af769-734e144c500mr1437251a34.16.1747220332495; 
 Wed, 14 May 2025 03:58:52 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-2dba060be9esm2654535fac.10.2025.05.14.03.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:58:52 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, a.hindborg@kernel.org, airlied@gmail.com,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 andrewjballance@gmail.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, benno.lossin@proton.me, bhelgaas@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev,
 ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch,
 tmgross@umich.edu
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 6/6] rust: pci: make Bar generic over Io
Date: Wed, 14 May 2025 05:57:34 -0500
Message-ID: <20250514105734.3898411-7-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514105734.3898411-1-andrewjballance@gmail.com>
References: <20250514105734.3898411-1-andrewjballance@gmail.com>
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

renames `Bar` to `RawBar` and makes it generic over `IoAccess`.
a user can give a compile time suggestion when mapping a bar so
that the type of io can be known.

updates nova-core and rust_driver_pci to use new bar api.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 drivers/gpu/nova-core/driver.rs |   4 +-
 rust/kernel/pci.rs              | 101 +++++++++++++++++++++++++-------
 samples/rust/rust_driver_pci.rs |   2 +-
 3 files changed, 83 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267..c03283d1e60e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -11,7 +11,7 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = 8;
-pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+pub(crate) type Bar0 = pci::MMIoBar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
     PCI_TABLE,
@@ -33,7 +33,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0"))?;
+        let bar = pdev.iomap_region_sized_mmio::<BAR0_SIZE>(0, c_str!("nova-core/bar0"))?;
 
         let this = KBox::pin_init(
             try_pin_init!(Self {
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 9f5ca22d327a..42fbe597b06e 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -11,8 +11,7 @@
     devres::Devres,
     driver,
     error::{to_result, Result},
-    io::Io,
-    io::IoRaw,
+    io::{Io, IoAccess, IoRaw, MMIo},
     str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
@@ -259,15 +258,21 @@ pub struct Device<Ctx: device::DeviceContext = device::Normal>(
 ///
 /// # Invariants
 ///
-/// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
+/// `Bar` always holds an `I` inststance that holds a valid pointer to the start of the I/O
 /// memory mapped PCI bar and its size.
-pub struct Bar<const SIZE: usize = 0> {
+pub struct RawBar<const SIZE: usize = 0, I: IoAccess<SIZE> = Io<SIZE>> {
     pdev: ARef<Device>,
-    io: IoRaw<SIZE>,
+    io: I,
     num: i32,
 }
 
-impl<const SIZE: usize> Bar<SIZE> {
+/// a pci bar that can be either PortIo or MMIo
+pub type IoBar<const SIZE: usize = 0> = RawBar<SIZE, Io<SIZE>>;
+
+/// a pci bar that maps a [`MMIo`].
+pub type MMIoBar<const SIZE: usize = 0> = RawBar<SIZE, MMIo<SIZE>>;
+
+impl<const SIZE: usize, I: IoAccess<SIZE>> RawBar<SIZE, I> {
     fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
         let len = pdev.resource_len(num)?;
         if len == 0 {
@@ -299,7 +304,7 @@ fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
             return Err(ENOMEM);
         }
 
-        let io = match IoRaw::new(ioptr, len as usize) {
+        let raw = match IoRaw::new(ioptr, len as usize) {
             Ok(io) => io,
             Err(err) => {
                 // SAFETY:
@@ -311,7 +316,22 @@ fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
             }
         };
 
-        Ok(Bar {
+        // SAFETY:
+        // - `raw` is from `pci_iomap`
+        // - addresses from `pci_iomap` should be accesed through ioread/iowrite
+        let io = match unsafe { I::from_raw_cookie(raw) } {
+            Ok(io) => io,
+            Err(err) => {
+                // SAFETY:
+                // `pdev` is valid by the invariants of `Device`.
+                // `ioptr` is guaranteed to be the start of a valid I/O mapped memory region.
+                // `num` is checked for validity by a previous call to `Device::resource_len`.
+                unsafe { Self::do_release(pdev, ioptr, num) };
+                return Err(err);
+            }
+        };
+
+        Ok(RawBar {
             pdev: pdev.into(),
             io,
             num,
@@ -338,25 +358,24 @@ fn release(&self) {
     }
 }
 
-impl Bar {
+impl RawBar {
     fn index_is_valid(index: u32) -> bool {
         // A `struct pci_dev` owns an array of resources with at most `PCI_NUM_RESOURCES` entries.
         index < bindings::PCI_NUM_RESOURCES
     }
 }
 
-impl<const SIZE: usize> Drop for Bar<SIZE> {
+impl<const SIZE: usize, I: IoAccess<SIZE>> Drop for RawBar<SIZE, I> {
     fn drop(&mut self) {
         self.release();
     }
 }
 
-impl<const SIZE: usize> Deref for Bar<SIZE> {
-    type Target = Io<SIZE>;
+impl<const SIZE: usize, I: IoAccess<SIZE>> Deref for RawBar<SIZE, I> {
+    type Target = I;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: By the type invariant of `Self`, the MMIO range in `self.io` is properly mapped.
-        unsafe { Io::from_raw_ref(&self.io) }
+        &self.io
     }
 }
 
@@ -379,7 +398,7 @@ pub fn device_id(&self) -> u16 {
 
     /// Returns the size of the given PCI bar resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
-        if !Bar::index_is_valid(bar) {
+        if !RawBar::index_is_valid(bar) {
             return Err(EINVAL);
         }
 
@@ -389,22 +408,62 @@ pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_len(self.as_raw(), bar.try_into()?) })
     }
 
-    /// Mapps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
+    /// Maps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
     /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
     pub fn iomap_region_sized<const SIZE: usize>(
         &self,
         bar: u32,
         name: &CStr,
-    ) -> Result<Devres<Bar<SIZE>>> {
-        let bar = Bar::<SIZE>::new(self, bar, name)?;
+    ) -> Result<Devres<IoBar<SIZE>>> {
+        self.iomap_region_sized_hint::<SIZE, Io<SIZE>>(bar, name)
+    }
+
+    /// Maps an entire PCI-BAR after performing a region-request on it.
+    pub fn iomap_region(&self, bar: u32, name: &CStr) -> Result<Devres<IoBar>> {
+        self.iomap_region_sized::<0>(bar, name)
+    }
+
+    /// Maps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
+    /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
+    /// where it is known that the bar is [`MMIo`]
+    pub fn iomap_region_sized_mmio<const SIZE: usize>(
+        &self,
+        bar: u32,
+        name: &CStr,
+    ) -> Result<Devres<MMIoBar<SIZE>>> {
+        self.iomap_region_sized_hint::<SIZE, MMIo<SIZE>>(bar, name)
+    }
+
+    /// Maps an entire PCI-BAR after performing a region-request on it.
+    /// where it is known that the bar is [`MMIo`]
+    pub fn iomap_region_mmio(&self, bar: u32, name: &CStr) -> Result<Devres<MMIoBar>> {
+        self.iomap_region_sized_hint::<0, MMIo<0>>(bar, name)
+    }
+
+    /// Maps an entire PCI-BAR after performing a region-request where the
+    /// type of Io backend is known at compile time.
+    pub fn iomap_region_hint<I: IoAccess>(
+        &self,
+        bar: u32,
+        name: &CStr,
+    ) -> Result<Devres<RawBar<0, I>>> {
+        let bar = RawBar::<0, I>::new(self, bar, name)?;
         let devres = Devres::new(self.as_ref(), bar, GFP_KERNEL)?;
 
         Ok(devres)
     }
+    /// Maps an entire PCI-BAR after performing a region-request where the
+    /// type of Io backend is known at compile time. I/O operation bound checks
+    /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
+    pub fn iomap_region_sized_hint<const SIZE: usize, I: IoAccess<SIZE>>(
+        &self,
+        bar: u32,
+        name: &CStr,
+    ) -> Result<Devres<RawBar<SIZE, I>>> {
+        let bar = RawBar::<SIZE, I>::new(self, bar, name)?;
+        let devres = Devres::new(self.as_ref(), bar, GFP_KERNEL)?;
 
-    /// Mapps an entire PCI-BAR after performing a region-request on it.
-    pub fn iomap_region(&self, bar: u32, name: &CStr) -> Result<Devres<Bar>> {
-        self.iomap_region_sized::<0>(bar, name)
+        Ok(devres)
     }
 }
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index a8d292f4c1b3..b645155142db 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -18,7 +18,7 @@ impl Regs {
     const END: usize = 0x10;
 }
 
-type Bar0 = pci::Bar<{ Regs::END }>;
+type Bar0 = pci::IoBar<{ Regs::END }>;
 
 #[derive(Debug)]
 struct TestIndex(u8);
-- 
2.49.0

