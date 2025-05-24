Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262BAC313E
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 22:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F8B10E13A;
	Sat, 24 May 2025 20:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NE7i+xwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A853010E15D;
 Sat, 24 May 2025 20:33:32 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7c5b2472969so101200485a.1; 
 Sat, 24 May 2025 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748118812; x=1748723612; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ifoon9IxFiouGz8CqKtmOZmA7QiWiaDusLiL7/M/4/Y=;
 b=NE7i+xwupYOWbqhiCrtc3p5Fon+1zWVud2aE4TWxwzL8bDFauA0GeVSFBKwIQL64Ox
 iigpDBZRxShcBXtHqHVpnwaLjxwZXlvhvRYQsR9vgaMZRgiXOPOqcj3FT/QBBCOQvWh2
 BssuVg+Rt2slDubFHgizvzJiQmkN/u7FxyTObVz7IE+41yEmNDVcNRs0+f6HUmf09eBS
 KFa9NJlGEDLYOQPqO6Zda9VUdjaW7a0U61zW9eqi9CFpo9FsfVgmETuTtGxROW/Pq/Ki
 SCmMZ0mxd1tOjiGsUKjPn4rSMsGRJ4Jr1VR/4tixsHPc5VHloaUb7V1psRb5rBKFKNQA
 6BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748118812; x=1748723612;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ifoon9IxFiouGz8CqKtmOZmA7QiWiaDusLiL7/M/4/Y=;
 b=gg1+nYsUxzJw+bTiiBC6QguZGot2EDig/AwWi7Vpuj7Hb4g7JbmntsHbpbJVLXQq7q
 x0cGU/SQ636jZUNSktptp9RGH6nWBkVtLAO82KdMnfkK8CrT9r8Ry5bovH5rKIJqanuR
 hmDGzC5K3MgvGc+6U+B13rPC/PR+d+gqsaUkhlic4+19OGiOSeypdmNiB9c+iZxMEBqK
 pmhoQM7krw1H8ZCDc/1oO5fuMfU+jNMihNXkLXMWwxprPIFOwwozCDdiJ+veRmA/+2yr
 3kcVqQPFWPcC3vsACggxuwNIgaNdNRkOp0lDDHh6+AJuVQyTFZznPZphQ6PhWv7yDUSe
 0RDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMTzUKFKgy85/K4YfnNf7FhSnYJMHRsV/sz4e/OOH5RFoZIcsCVQpAUr/X6fo1ff3DA6iMJko6bQ==@lists.freedesktop.org,
 AJvYcCXlC8pU3vT9kYLR4KF+3osqui+kzjpH4etD6dh3xpKZLkItbjfv3LYyUDjKt2BzXryMQBySOIo75qM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkj79zS9MukGho5IHuMudEIHc8H5keBoukz3sKH6BSwxDkC+Fa
 9fLgG9lyeH5b7VokwTSR0v+vEgsR3q1Nir0/CeslIZgP53kCIdbcR0tamGsALwbr91E=
X-Gm-Gg: ASbGnctx/qSI9uwhTsGb9ugEvCiLQ72nUD6dOKhcioUoo38VefF5Uvuz1L7AGIIXPrz
 imNb7LMUEls64YXpwQjNYCR2zYdIOpysfH42ACq6hR0iZIoU/RwRT8aS2lYauUeVXu1r8lwq9dY
 sbaVcergNoYitq/8EMlfZmGlyfyxZeqI8N0f75PHuqYpm827acYpHEqhZDy/+T+HTwLo8UGgNMW
 5zZfKPjT6KMKNAbPo9UuFeYWATaXkcvvIOP/8yPV3nOzuHs9RkRsZ72HjW229la/CPq8cilETLF
 /+KOCEJ1VrhsZnGZzXZab/Vu8X3PviCdyC8YoT0a26Rbuv0DPyEkX/CSIiETiPkm/1tOt0fWxW4
 Q6/doqtytGmW8/MAoCXR1s09WcSrYzCsU0slhWqweyNdzOO225wJIauN4kgw67C7llIpz/bJHQY
 Ce10o=
X-Google-Smtp-Source: AGHT+IFMh5W/q7hGYv8OuYbTzU3wr3bMIx26mFk1t3CO6+VlG0sdIdFy9pzmEYD2gThQbbXe/b3NJA==
X-Received: by 2002:a05:620a:4244:b0:7c7:a5b7:b288 with SMTP id
 af79cd13be357-7ceecbd370dmr523782185a.19.1748118811438; 
 Sat, 24 May 2025 13:33:31 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5be7:7c00:8563:e370:791f:7436])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467d7fd1sm1379590085a.29.2025.05.24.13.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 13:33:30 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 24 May 2025 16:33:04 -0400
Subject: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
In-Reply-To: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible and rename
`kernel::c_str!` to `c_str_avoid_literals` to clarify its intended use.

Closes: https://github.com/Rust-for-Linux/linux/issues/1075
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/nova-core/driver.rs      |  2 +-
 drivers/net/phy/ax88796b_rust.rs     |  7 +++----
 drivers/net/phy/qt2025.rs            |  5 ++---
 rust/kernel/devres.rs                |  2 +-
 rust/kernel/firmware.rs              |  6 +++---
 rust/kernel/kunit.rs                 |  7 ++++---
 rust/kernel/net/phy.rs               |  6 ++----
 rust/kernel/platform.rs              |  4 ++--
 rust/kernel/str.rs                   | 38 ++++++++++++++++++++++++------------
 rust/kernel/sync.rs                  |  7 +++----
 rust/kernel/sync/lock/global.rs      |  3 ++-
 rust/macros/kunit.rs                 |  6 +++---
 rust/macros/module.rs                |  2 +-
 samples/rust/rust_driver_faux.rs     |  4 ++--
 samples/rust/rust_driver_pci.rs      |  4 ++--
 samples/rust/rust_driver_platform.rs |  4 ++--
 samples/rust/rust_misc_device.rs     |  3 +--
 17 files changed, 59 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267..776970049974 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -33,7 +33,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0"))?;
+        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?;
 
         let this = KBox::pin_init(
             try_pin_init!(Self {
diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index bc73ebccc2aa..2d24628a4e58 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -5,7 +5,6 @@
 //!
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
 use kernel::{
-    c_str,
     net::phy::{self, reg::C22, DeviceId, Driver},
     prelude::*,
     uapi,
@@ -41,7 +40,7 @@ fn asix_soft_reset(dev: &mut phy::Device) -> Result {
 #[vtable]
 impl Driver for PhyAX88772A {
     const FLAGS: u32 = phy::flags::IS_INTERNAL;
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88772A");
+    const NAME: &'static CStr = c"Asix Electronics AX88772A";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1861);
 
     // AX88772A is not working properly with some old switches (NETGEAR EN 108TP):
@@ -105,7 +104,7 @@ fn link_change_notify(dev: &mut phy::Device) {
 #[vtable]
 impl Driver for PhyAX88772C {
     const FLAGS: u32 = phy::flags::IS_INTERNAL;
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88772C");
+    const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
     fn suspend(dev: &mut phy::Device) -> Result {
@@ -125,7 +124,7 @@ fn soft_reset(dev: &mut phy::Device) -> Result {
 
 #[vtable]
 impl Driver for PhyAX88796B {
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88796B");
+    const NAME: &'static CStr = c"Asix Electronics AX88796B";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
 
     fn soft_reset(dev: &mut phy::Device) -> Result {
diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 0b9400dcb4c1..9ccc75f70219 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -9,7 +9,6 @@
 //!
 //! The QT2025 PHY integrates an Intel 8051 micro-controller.
 
-use kernel::c_str;
 use kernel::error::code;
 use kernel::firmware::Firmware;
 use kernel::net::phy::{
@@ -36,7 +35,7 @@
 
 #[vtable]
 impl Driver for PhyQT2025 {
-    const NAME: &'static CStr = c_str!("QT2025 10Gpbs SFP+");
+    const NAME: &'static CStr = c"QT2025 10Gpbs SFP+";
     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x0043a400);
 
     fn probe(dev: &mut phy::Device) -> Result<()> {
@@ -69,7 +68,7 @@ fn probe(dev: &mut phy::Device) -> Result<()> {
         // The micro-controller will start running from the boot ROM.
         dev.write(C45::new(Mmd::PCS, 0xe854), 0x00c0)?;
 
-        let fw = Firmware::request(c_str!("qt2025-2.0.3.3.fw"), dev.as_ref())?;
+        let fw = Firmware::request(c"qt2025-2.0.3.3.fw", dev.as_ref())?;
         if fw.data().len() > SZ_16K + SZ_8K {
             return Err(code::EFBIG);
         }
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index ddb1ce4a78d9..8735b227f0d3 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -45,7 +45,7 @@ struct DevresInner<T> {
 /// # Example
 ///
 /// ```no_run
-/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw}};
+/// # use kernel::{bindings, device::Device, devres::Devres, io::{Io, IoRaw}};
 /// # use core::ops::Deref;
 ///
 /// // See also [`pci::Bar`] for a real example.
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 582ab648b14c..09fd3a27bcf0 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -51,13 +51,13 @@ fn request_nowarn() -> Self {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{c_str, device::Device, firmware::Firmware};
+/// # use kernel::{device::Device, firmware::Firmware};
 ///
 /// # fn no_run() -> Result<(), Error> {
 /// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
 /// # let dev = unsafe { Device::get_device(core::ptr::null_mut()) };
 ///
-/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev)?;
+/// let fw = Firmware::request(c"path/to/firmware.bin", &dev)?;
 /// let blob = fw.data();
 ///
 /// # Ok(())
@@ -203,7 +203,7 @@ macro_rules! module_firmware {
     ($($builder:tt)*) => {
         const _: () = {
             const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
-                $crate::c_str!("")
+                c""
             } else {
                 <LocalModule as $crate::ModuleMetadata>::NAME
             };
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index e5621d596ed3..09148e982f48 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -58,9 +58,10 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
-            static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
+            static FILE: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($file);
             static LINE: i32 = core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
+            static CONDITION: &'static $crate::str::CStr =
+                $crate::c_str_avoid_literals!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
@@ -222,7 +223,7 @@ pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
 /// }
 ///
 /// static mut KUNIT_TEST_CASES: [kernel::bindings::kunit_case; 2] = [
-///     kernel::kunit::kunit_case(kernel::c_str!("name"), test_fn),
+///     kernel::kunit::kunit_case(c"name", test_fn),
 ///     kernel::kunit::kunit_case_null(),
 /// ];
 /// kernel::kunit_unsafe_test_suite!(suite_name, KUNIT_TEST_CASES);
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 652e060e47bd..8129419a3931 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -780,7 +780,6 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -799,7 +798,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 /// # }
@@ -808,7 +807,6 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
-/// use kernel::c_str;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -828,7 +826,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// #[vtable]
 /// impl phy::Driver for PhySample {
-///     const NAME: &'static CStr = c_str!("PhySample");
+///     const NAME: &'static CStr = c"PhySample";
 ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
 /// }
 ///
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index fd4a494f30e8..7163fc468b32 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -124,7 +124,7 @@ macro_rules! module_platform_driver {
 /// # Example
 ///
 ///```
-/// # use kernel::{bindings, c_str, device::Core, of, platform};
+/// # use kernel::{bindings, device::Core, of, platform};
 ///
 /// struct MyDriver;
 ///
@@ -133,7 +133,7 @@ macro_rules! module_platform_driver {
 ///     MODULE_OF_TABLE,
 ///     <MyDriver as platform::Driver>::IdInfo,
 ///     [
-///         (of::DeviceId::new(c_str!("test,device")), ())
+///         (of::DeviceId::new(c"test,device"), ())
 ///     ]
 /// );
 ///
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 586644912414..0385d927fcd5 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -266,15 +266,14 @@ impl fmt::Display for crate::fmt::Adapter<&CStr> {
     /// Formats printable ASCII characters, escaping the rest.
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::prelude::fmt;
     /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
-    /// let penguin = c_str!("🐧");
+    /// let penguin = c"🐧";
     /// let s = CString::try_from_fmt(fmt!("{}", penguin))?;
     /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
-    /// let ascii = c_str!("so \"cool\"");
+    /// let ascii = c"so \"cool\"";
     /// let s = CString::try_from_fmt(fmt!("{}", ascii))?;
     /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())
@@ -365,25 +364,38 @@ fn as_ref(&self) -> &BStr {
     }
 }
 
-/// Creates a new [`CStr`] from a string literal.
+/// Creates a static C string wrapper at compile time.
 ///
-/// The string literal should not contain any `NUL` bytes.
+/// Rust supports C string literals since Rust 1.77, and they should be used instead of this macro
+/// where possible. This macro exists to allow static *non-literal* C strings to be created at
+/// compile time. This is most often used in other macros.
+///
+/// # Panics
+///
+/// This macro panics if the operand contains an interior `NUL` byte.
 ///
 /// # Examples
 ///
 /// ```
-/// # use kernel::c_str;
+/// # use kernel::c_str_avoid_literals;
 /// # use kernel::str::CStr;
-/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
+/// const MY_CSTR: &CStr = c_str_avoid_literals!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
-macro_rules! c_str {
+macro_rules! c_str_avoid_literals {
+    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
+    // that would trigger when the literal is at the top of several macro expansions. That would be
+    // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
-        const S: &str = concat!($str, "\0");
-        const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
-            Ok(v) => v,
-            Err(_) => panic!("string contains interior NUL"),
-        };
+        const S: &'static str = concat!($str, "\0");
+        const C: &'static $crate::str::CStr =
+            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
+                Ok(v) => v,
+                Err(err) => {
+                    let _: core::ffi::FromBytesWithNulError = err;
+                    panic!("string contains interior NUL")
+                }
+            };
         C
     }};
 }
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 36a719015583..424864fb448f 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -41,7 +41,6 @@ impl LockClassKey {
     ///
     /// # Example
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::alloc::KBox;
     /// # use kernel::types::ForeignOwnable;
     /// # use kernel::sync::{LockClassKey, SpinLock};
@@ -53,7 +52,7 @@ impl LockClassKey {
     /// {
     ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
     ///         0,
-    ///         c_str!("my_spinlock"),
+    ///         c"my_spinlock",
     ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
     ///         // `from_foreign()` has not yet been called.
     ///         unsafe { <Pin<KBox<LockClassKey>> as ForeignOwnable>::borrow(key_ptr) }
@@ -106,9 +105,9 @@ macro_rules! static_lock_class {
 #[macro_export]
 macro_rules! optional_name {
     () => {
-        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
+        $crate::c_str_avoid_literals!(::core::concat!(::core::file!(), ":", ::core::line!()))
     };
     ($name:literal) => {
-        $crate::c_str!($name)
+        $crate::c_str_avoid_literals!($name)
     };
 }
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 79d0ef7fda86..0ca23b12427c 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -267,7 +267,8 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr = $crate::c_str!(::core::stringify!($name));
+            const NAME: &'static $crate::str::CStr =
+                $crate::c_str_avoid_literals!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
 
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 99ccac82edde..56469fdcee3f 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -89,8 +89,8 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     // unsafe extern "C" fn kunit_rust_wrapper_bar(_test: *mut kernel::bindings::kunit) { bar(); }
     //
     // static mut TEST_CASES: [kernel::bindings::kunit_case; 3] = [
-    //     kernel::kunit::kunit_case(kernel::c_str!("foo"), kunit_rust_wrapper_foo),
-    //     kernel::kunit::kunit_case(kernel::c_str!("bar"), kunit_rust_wrapper_bar),
+    //     kernel::kunit::kunit_case(c"foo", kunit_rust_wrapper_foo),
+    //     kernel::kunit::kunit_case(c"bar", kunit_rust_wrapper_bar),
     //     kernel::kunit::kunit_case_null(),
     // ];
     //
@@ -106,7 +106,7 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
         writeln!(kunit_macros, "{kunit_wrapper}").unwrap();
         writeln!(
             test_cases,
-            "    kernel::kunit::kunit_case(kernel::c_str!(\"{test}\"), {kunit_wrapper_fn_name}),"
+            "    kernel::kunit::kunit_case(c\"{test}\", {kunit_wrapper_fn_name}),",
         )
         .unwrap();
     }
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 44e5cb108cea..7b71d6d99d5c 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -232,7 +232,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             type LocalModule = {type_};
 
             impl kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
+                const NAME: &'static kernel::str::CStr = c\"{name}\";
             }}
 
             // Double nested modules, since then nobody can access the public items inside.
diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
index ecc9fd378cbd..23add3160693 100644
--- a/samples/rust/rust_driver_faux.rs
+++ b/samples/rust/rust_driver_faux.rs
@@ -2,7 +2,7 @@
 
 //! Rust faux device sample.
 
-use kernel::{c_str, faux, prelude::*, Module};
+use kernel::{faux, prelude::*, Module};
 
 module! {
     type: SampleModule,
@@ -20,7 +20,7 @@ impl Module for SampleModule {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Initialising Rust Faux Device Sample\n");
 
-        let reg = faux::Registration::new(c_str!("rust-faux-sample-device"), None)?;
+        let reg = faux::Registration::new(c"rust-faux-sample-device", None)?;
 
         dev_info!(reg.as_ref(), "Hello from faux device!\n");
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 2bb260aebc9e..8da48c1c3c2d 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,7 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, c_str, device::Core, devres::Devres, pci, prelude::*, types::ARef};
+use kernel::{bindings, device::Core, devres::Devres, pci, prelude::*, types::ARef};
 
 struct Regs;
 
@@ -73,7 +73,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> Result<Pin<KBox<Self>
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = pdev.iomap_region_sized::<{ Regs::END }>(0, c_str!("rust_driver_pci"))?;
+        let bar = pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci")?;
 
         let drvdata = KBox::new(
             Self {
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 8b42b3cfb363..e6487a970a59 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -2,7 +2,7 @@
 
 //! Rust Platform driver sample.
 
-use kernel::{c_str, device::Core, of, platform, prelude::*, types::ARef};
+use kernel::{device::Core, of, platform, prelude::*, types::ARef};
 
 struct SampleDriver {
     pdev: ARef<platform::Device>,
@@ -14,7 +14,7 @@ struct SampleDriver {
     OF_TABLE,
     MODULE_OF_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("test,rust-device")), Info(42))]
+    [(of::DeviceId::new(c"test,rust-device"), Info(42))]
 );
 
 impl platform::Driver for SampleDriver {
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08..12b64296e912 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -98,7 +98,6 @@
 use core::pin::Pin;
 
 use kernel::{
-    c_str,
     device::Device,
     fs::File,
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
@@ -133,7 +132,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         pr_info!("Initialising Rust Misc Device Sample\n");
 
         let options = MiscDeviceOptions {
-            name: c_str!("rust-misc-device"),
+            name: c"rust-misc-device",
         };
 
         try_pin_init!(Self {

-- 
2.49.0

