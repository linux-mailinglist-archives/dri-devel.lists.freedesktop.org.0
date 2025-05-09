Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB8AB08AC
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A1C10E262;
	Fri,  9 May 2025 03:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VCNZl0ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492F810E262;
 Fri,  9 May 2025 03:16:56 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-6063462098eso1017897eaf.0; 
 Thu, 08 May 2025 20:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760615; x=1747365415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xc7BzZfYEb+VFNTMq0je73w2/39IbT5bTX8c0mAg458=;
 b=VCNZl0ng+VOfgWcYwMzcpwvtTFFCPXnjoUaSmEvHyI4aVrUQ0XzPJnhxQIdKpAdYnP
 X7sgIuvYH8vBlmL3NV3ScNYHO0sRkd77bude0KgvD8Bx7Omo5MfARwvmax8/3Oedp1ZG
 M6B2ozbK5kcpG5CHsgcHXy15ohpPTakZohBehSYhkrCb4Zkyjtb+FnAsBznG/54fy+xj
 6oElu1KZ4/ay6sq511UgPWCEXk03q2woZ1/BRd2UWDxxTggppCBdYZzQ5g4RKLKw8oge
 7aFTZXqPqZkZnpJqaRzWC9bblT/Hj2cIPYzYXC7bFu5kjBz4N7eLB8YnZ1+WODIYhVbM
 2nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760615; x=1747365415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xc7BzZfYEb+VFNTMq0je73w2/39IbT5bTX8c0mAg458=;
 b=pskdNzUrc8xXdsE333RogdI92dVZmwxi/JbfJsspNLmZjXVZgB2JiB2sAzbHttZGb1
 u0kRqAz79i4qvVLczCQof7d2V5EHD93EtUHxOiocU2Oqjh/Oqqu1wz37vJJGgC4TaVQD
 ekvlBigOJp854BBKifuZAtshgURF2Tn/dX461RmC1NSA040UEXWHhukI2eurP3Alf8n2
 FETILOcIDCH4SRuy1ZL9oeCeWTmwm2dHs9JYMRNTvJ8WMCqi1aYeiCH5+tLFENthz0G4
 4X2AZI9Gs8OUHqMRvqaVECYv7o2w2MZYsFL2vNZc7z9PBVR9AOIjbIaSzDR/w4CPZoSF
 TtAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnnkWvMfuLgIdYnOzNHSqVOjs+0JW9MqMpH256MOnjd7u7T/ZJVCQltOOrOZUxKSFZYLH5G9eftx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR5QgAv0xwZoHl6YvPY+y+f8hbn9dx0bmX1zGrIdeyxrstrhZj
 1cUJOG0y/+IcMy8GHTXsHR0rIbwUBdEv1d7KR8WufV1TQjWKujCV
X-Gm-Gg: ASbGncsI2w11K8r+/CuLxJvQ84gFfcL7pptS8dzaVNYBFyBB7JyknfGMNBu9ESNp9td
 0GZIx/RMT3Fif1MiqYPLnkxJ5fuMx65O4Dm9AA/UxY1+XcvhMLqAMBR5XqEa8iM2UG01mntsHQQ
 QbMgtFYQcYB3oF6pZCPjeEvpkza5w8xEcoJkueLNYU1XfYZdliZBj6AdZyftzo7s63EMaFl7elq
 AvUO0hUmss6LoUcdwjZv2b/8BsOhbTsK54jJpLfqyci4hUbMt3lUoHYmh4R1koUtD+42qDxN3/G
 qmEFZ8cTEBpecoWNfqxLXfGPailL+jvFpnO4zdb2WTJjINVeANn1cg89umFGO93bs6NAnrWFSSJ
 1Z9MIborRZQI0
X-Google-Smtp-Source: AGHT+IFCRJsr2OGQOgUW1EnBwtCSztfQBP0xfRtzoRTkbZzNHfWmUa5GFKAnIMjv8o+M8+sslDuuDA==
X-Received: by 2002:a05:6820:c8a:b0:608:3ee9:13a4 with SMTP id
 006d021491bc7-6084b61bc85mr1314471eaf.5.1746760615396; 
 Thu, 08 May 2025 20:16:55 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:55 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 08/11] rust: pci: make Bar generic over Io
Date: Thu,  8 May 2025 22:15:21 -0500
Message-ID: <20250509031524.2604087-9-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
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

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/pci.rs | 88 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index c97d6d470b28..7e592db99073 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -11,8 +11,7 @@
     devres::Devres,
     driver,
     error::{to_result, Result},
-    io::Io,
-    io::IoRaw,
+    io::{Io, IoAccess, IoRaw, MMIo, PortIo},
     str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
@@ -259,15 +258,25 @@ pub struct Device<Ctx: device::DeviceContext = device::Normal>(
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
+    original_ioptr: usize,
+    io: I,
     num: i32,
 }
 
-impl<const SIZE: usize> Bar<SIZE> {
+/// a pci bar that can be either PortIo or MMIo
+pub type IoBar<const SIZE: usize = 0> = RawBar<SIZE, Io<SIZE>>;
+
+/// a pci bar that maps a [`PortIo`].
+pub type MMIoBar<const SIZE: usize = 0> = RawBar<SIZE, MMIo<SIZE>>;
+
+/// a pci bar that maps a [`MMIo`].
+pub type PIoBar<const SIZE: usize = 0> = RawBar<SIZE, PortIo<SIZE>>;
+
+impl<const SIZE: usize, I: IoAccess<SIZE>> RawBar<SIZE, I> {
     fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
         let len = pdev.resource_len(num)?;
         if len == 0 {
@@ -299,7 +308,22 @@ fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
             return Err(ENOMEM);
         }
 
-        let io = match IoRaw::new(ioptr, len as usize) {
+        let raw = match IoRaw::new(ioptr, len as usize) {
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
+        // SAFETY:
+        // - `raw` is from `pci_iomap`
+        // - addresses from `pci_iomap` should be accesed through ioread/iowrite
+        let io = match unsafe { I::from_raw_cookie(raw) } {
             Ok(io) => io,
             Err(err) => {
                 // SAFETY:
@@ -311,8 +335,9 @@ fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
             }
         };
 
-        Ok(Bar {
+        Ok(RawBar {
             pdev: pdev.into(),
+            original_ioptr: ioptr,
             io,
             num,
         })
@@ -334,29 +359,28 @@ unsafe fn do_release(pdev: &Device, ioptr: usize, num: i32) {
 
     fn release(&self) {
         // SAFETY: The safety requirements are guaranteed by the type invariant of `self.pdev`.
-        unsafe { Self::do_release(&self.pdev, self.io.addr(), self.num) };
+        unsafe { Self::do_release(&self.pdev, self.original_ioptr, self.num) };
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
-        unsafe { Io::from_raw(&self.io) }
+        &self.io
     }
 }
 
@@ -379,7 +403,7 @@ pub fn device_id(&self) -> u16 {
 
     /// Returns the size of the given PCI bar resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
-        if !Bar::index_is_valid(bar) {
+        if !RawBar::index_is_valid(bar) {
             return Err(EINVAL);
         }
 
@@ -395,17 +419,43 @@ pub fn iomap_region_sized<const SIZE: usize>(
         &self,
         bar: u32,
         name: &CStr,
-    ) -> Result<Devres<Bar<SIZE>>> {
-        let bar = Bar::<SIZE>::new(self, bar, name)?;
+    ) -> Result<Devres<IoBar<SIZE>>> {
+        let bar = RawBar::<SIZE, _>::new(self, bar, name)?;
         let devres = Devres::new(self.as_ref(), bar, GFP_KERNEL)?;
 
         Ok(devres)
     }
 
     /// Mapps an entire PCI-BAR after performing a region-request on it.
-    pub fn iomap_region(&self, bar: u32, name: &CStr) -> Result<Devres<Bar>> {
+    pub fn iomap_region(&self, bar: u32, name: &CStr) -> Result<Devres<IoBar>> {
         self.iomap_region_sized::<0>(bar, name)
     }
+
+    /// Maps an entire PCI-BAR after performing a region-request` where the
+    /// type of Io backend is known at compile time.
+    pub fn iomap_region_hint<I: IoAccess>(
+        &self,
+        bar: u32,
+        name: &CStr,
+    ) -> Result<Devres<RawBar<0, I>>> {
+        let bar = RawBar::<0, I>::new(self, bar, name)?;
+        let devres = Devres::new(self.as_ref(), bar, GFP_KERNEL)?;
+
+        Ok(devres)
+    }
+    /// Maps an entire PCI-BAR after performing a region-request` where the
+    /// type of Io backend is known at compile time. I/O operation bound checks
+    /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
+    pub fn iomap_region_sized_hint<const SIZE: usize, I: IoAccess<SIZE>>(
+        &self,
+        bar: u32,
+        name: &CStr,
+    ) -> Result<Devres<RawBar<SIZE, I>>> {
+        let bar = RawBar::<SIZE, I>::new(self, bar, name)?;
+        let devres = Devres::new(self.as_ref(), bar, GFP_KERNEL)?;
+
+        Ok(devres)
+    }
 }
 
 impl Device<device::Core> {
-- 
2.49.0

