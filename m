Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313BAE09AB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 17:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D1510EA86;
	Thu, 19 Jun 2025 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a3+SB8Fs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD93410EA82;
 Thu, 19 Jun 2025 15:06:45 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4a5840ec53dso10087991cf.0; 
 Thu, 19 Jun 2025 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750345605; x=1750950405; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N+MLp/Wyw+FMmIoAUSP2P3WuAVxaRgs45Kjlyv6CyTI=;
 b=a3+SB8FsWB2MwuM0iJ4W+QldcP6AVAtjvvGghfFT5kGyTunjj/8Kga2D4dzQzddOL8
 frHqvIDPr+3VyaUBH6k7typrIerb+n6Vywxt4CQbWiHNhW1yqRNOdaiNhvr1YeR2bkHN
 ghmCDN9oJkYXvTHWossEWwU1u2dIM7zVw5eGl9eAIZNbdy+PVEzFuyiKpEg5DkCHUNH+
 ncvZS0vrmHj4nTMbMd4qlx4Ln44jXxWGr8TR4eXPieDhvtS+PHxkjTUDea+O6FuN5d7K
 jN+x4HrS9xl8RcxrM77mgp9uvL1OKQaaUtP2aPi21TZM1JcQ6ExtQ3XWaljHfCNXSkuT
 C1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750345605; x=1750950405;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+MLp/Wyw+FMmIoAUSP2P3WuAVxaRgs45Kjlyv6CyTI=;
 b=D/6yatOrBF7Hs6dxkVjIYqwmbVyBqltBXFP7qzyc5+IZ8fOjMs6XcXRuGuYCtgvHDa
 UjvYjSKWP8xWJcgc4jsS/+pYfGyY64pzwp8I9NUuyfkcky7ZxNQLPWhq10cqsxyriSkd
 GZGjjx1mcGTR/83xfK1+Y+mZefKqqJMpgOcR67KXl1i6GodhyVZPUY2FKgcxD+9XGlju
 vCRvvOofO6PfkCtwFqxIrT3pTXx1SjiindX0hK9K3MoN7XuK+l6osQuiKyRXpN+kY6M2
 JdkcRapoWG9Ikx2BWa4SI8oqBMhg/zC0inzZ8P7uBnsegvSeIzkRIvrKYSO96yFskhPe
 NuJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOHjtY/+Z+RIPcQTT7xRsEfIsGDPnB1rszj6JqurM+oSXkfnMMqsk3vGVUSrArxZH8981vuFm54Q==@lists.freedesktop.org,
 AJvYcCXv7cpovGVjLE/pN3DDIRA2h1vJ4zlAld+A+4miheUpfYMwJm9MbaVuNfepPS4GRfGfvE9IwAMbBSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8BiZIC2iAnZqh3FCckdpUOBUoOAyBIgkN5jWmC+24PXDpQ2JJ
 4+but/vYWGbZDa+xFLVZaN48jAWHFoOmo67Kvj7Ijs+YpOVvtO6L/LgW
X-Gm-Gg: ASbGncttENBSC1aib1jhms6tjQRaTnYwZ185/Ku1oLj+4r9KPknGS/dyq64SaOj7gPv
 z/Q1VZrtbGDUv06YFqArcK0BXqGC7a/lSEUi9HNhCcNJbyfRLbl+AwRcXNtU1KKwLyyprCp/k3N
 D2wAC6RMOMGfeqLdawb3uNoyj1QZ9vXMKV24qok2k/z1MyLcAzSUcPQ444qQucq3mxyMFSM8iGI
 1nGYQb9XlggL+GcUfmIboPfhV8c5pD5rqDS5A31Agf+aEe4SqfxZ1X3m2XeO2b6P6sKpt7k+BAb
 daHtJibjjAQm+DJzdMSjhGrYdZWUdIeQt/11tA/k1M0HObcMnIXWkcwk5StOb4DFTSA9M1lmAda
 1jWKz7zwhlg==
X-Google-Smtp-Source: AGHT+IEIBl9XIMHrJ5og8oP/l3Yc1XPQQjJbdZ6bZEBoEIEuuRSD4EWvq6wtLdoVF2ZgNgXM1ksG3A==
X-Received: by 2002:a05:622a:1890:b0:4a6:fa8e:50a8 with SMTP id
 d75a77b69052e-4a73c4fcea9mr360959781cf.2.1750345604456; 
 Thu, 19 Jun 2025 08:06:44 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:5c8a:fc6a:b57c:e57f])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a7785aaacdsm250531cf.39.2025.06.19.08.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 08:06:43 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 19 Jun 2025 11:06:29 -0400
Subject: [PATCH v12 5/5] rust: remove core::ffi::CStr reexport
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250619-cstr-core-v12-5-80c9c7b45900@gmail.com>
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
In-Reply-To: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
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
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
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

Clean up references to `kernel::str::CStr`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/drm_panic_qr.rs       |  3 ++-
 drivers/gpu/nova-core/firmware.rs     |  2 +-
 drivers/gpu/nova-core/nova_core.rs    |  2 +-
 drivers/net/phy/ax88796b_rust.rs      |  1 +
 drivers/net/phy/qt2025.rs             |  1 +
 rust/kernel/auxiliary.rs              |  2 +-
 rust/kernel/clk.rs                    |  3 +--
 rust/kernel/configfs.rs               |  1 +
 rust/kernel/cpufreq.rs                |  3 ++-
 rust/kernel/device.rs                 |  3 +--
 rust/kernel/driver.rs                 |  4 ++--
 rust/kernel/drm/driver.rs             |  3 ++-
 rust/kernel/error.rs                  |  6 ++----
 rust/kernel/faux.rs                   |  5 ++++-
 rust/kernel/firmware.rs               | 15 ++++-----------
 rust/kernel/kunit.rs                  |  6 +++---
 rust/kernel/lib.rs                    |  2 +-
 rust/kernel/miscdevice.rs             |  3 +--
 rust/kernel/net/phy.rs                |  4 +++-
 rust/kernel/of.rs                     |  3 ++-
 rust/kernel/pci.rs                    |  2 +-
 rust/kernel/platform.rs               |  2 +-
 rust/kernel/prelude.rs                |  5 +----
 rust/kernel/str.rs                    |  8 +++-----
 rust/kernel/sync/condvar.rs           |  4 ++--
 rust/kernel/sync/lock.rs              |  4 ++--
 rust/kernel/sync/lock/global.rs       |  5 +++--
 rust/kernel/sync/poll.rs              |  1 +
 rust/kernel/workqueue.rs              |  1 +
 rust/macros/module.rs                 |  2 +-
 samples/rust/rust_configfs.rs         |  2 ++
 samples/rust/rust_driver_auxiliary.rs |  5 +++--
 32 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 01e8ba9e6de1..aa27c266213e 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -27,7 +27,8 @@
 //! * <https://github.com/erwanvivien/fast_qr>
 //! * <https://github.com/bjguillot/qr>
 
-use kernel::{prelude::*, str::CStr};
+use core::ffi::CStr;
+use kernel::prelude::*;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
 struct Version(usize);
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4b8a38358a4f..562ad048ff99 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -66,7 +66,7 @@ const fn make_entry_chipset(self, chipset: &str) -> Self {
     }
 
     pub(crate) const fn create(
-        module_name: &'static kernel::str::CStr,
+        module_name: &'static core::ffi::CStr,
     ) -> firmware::ModInfoBuilder<N> {
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 618632f0abcc..29b7ae8581e6 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -8,7 +8,7 @@
 mod regs;
 mod util;
 
-pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..68b8e30ae296 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -4,6 +4,7 @@
 //! Rust Asix PHYs driver
 //!
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
+use core::ffi::CStr;
 use kernel::{
     net::phy::{self, reg::C22, DeviceId, Driver},
     prelude::*,
diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 9ccc75f70219..78ce2866f2b6 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -9,6 +9,7 @@
 //!
 //! The QT2025 PHY integrates an Intel 8051 micro-controller.
 
+use core::ffi::CStr;
 use kernel::error::code;
 use kernel::firmware::Firmware;
 use kernel::net::phy::{
diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 89d961407adb..ff29077d9c2f 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -10,11 +10,11 @@
     driver,
     error::{to_result, Result},
     prelude::*,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
     ThisModule,
 };
 use core::{
+    ffi::CStr,
     marker::PhantomData,
     ptr::{addr_of_mut, NonNull},
 };
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index c43a2aa154b6..bad49ecb30ed 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -78,10 +78,9 @@ mod common_clk {
     use crate::{
         device::Device,
         error::{from_err_ptr, to_result, Result},
-        prelude::*,
     };
 
-    use core::{ops::Deref, ptr};
+    use core::{ffi::CStr, ops::Deref, ptr};
 
     /// A reference-counted clock.
     ///
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 9c99fee19a5c..1eb46c6d5508 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -118,6 +118,7 @@
 use crate::sync::ArcBorrow;
 use crate::types::Opaque;
 use core::cell::UnsafeCell;
+use core::ffi::CStr;
 use core::marker::PhantomData;
 
 /// A configfs subsystem.
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index b53769e6cee5..ecc183de3133 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -26,6 +26,7 @@
 
 use core::{
     cell::UnsafeCell,
+    ffi::CStr,
     marker::PhantomData,
     mem::MaybeUninit,
     ops::{Deref, DerefMut},
@@ -853,7 +854,7 @@ fn register_em(_policy: &mut Policy) {
 ///
 /// #[vtable]
 /// impl cpufreq::Driver for SampleDriver {
-///     const NAME: &'static CStr = c"cpufreq-sample";
+///     const NAME: &'static core::ffi::CStr = c"cpufreq-sample";
 ///     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
 ///     const BOOST_ENABLED: bool = true;
 ///
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index d2b6c1ce02a5..ad5e60e96d98 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,10 +6,9 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
-use core::{fmt, marker::PhantomData, ptr};
+use core::{ffi::CStr, fmt, marker::PhantomData, ptr};
 
 #[cfg(CONFIG_PRINTK)]
 use crate::str::CStrExt as _;
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index ec9166cedfa7..9926664d9ba2 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -6,8 +6,8 @@
 //! register using the [`Registration`] class.
 
 use crate::error::{Error, Result};
-use crate::{device, of, str::CStr, try_pin_init, types::Opaque, ThisModule};
-use core::pin::Pin;
+use crate::{device, of, try_pin_init, types::Opaque, ThisModule};
+use core::{ffi::CStr, pin::Pin};
 use pin_init::{pin_data, pinned_drop, PinInit};
 
 /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index acb638086131..4c30933051c7 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -10,11 +10,12 @@
     drm,
     error::{to_result, Result},
     prelude::*,
-    str::CStr,
     types::ARef,
 };
 use macros::vtable;
 
+use core::ffi::CStr;
+
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
 
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 933c048c04f1..b2b46d26f7b7 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,11 +4,9 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](srctree/include/uapi/asm-generic/errno-base.h)
 
-use crate::{
-    alloc::{layout::LayoutError, AllocError},
-    str::CStr,
-};
+use crate::alloc::{layout::LayoutError, AllocError};
 
+use core::ffi::CStr;
 use core::fmt;
 use core::num::NonZeroI32;
 use core::num::TryFromIntError;
diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 8a50fcd4c9bb..d9e5cd265101 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -7,7 +7,10 @@
 //! C header: [`include/linux/device/faux.h`]
 
 use crate::{bindings, device, error::code::*, prelude::*};
-use core::ptr::{addr_of_mut, null, null_mut, NonNull};
+use core::{
+    ffi::CStr,
+    ptr::{addr_of_mut, null, null_mut, NonNull},
+};
 
 /// The registration of a faux device.
 ///
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 09fd3a27bcf0..4ba5e5589d7b 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -4,15 +4,8 @@
 //!
 //! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
 
-use crate::{
-    bindings,
-    device::Device,
-    error::Error,
-    error::Result,
-    ffi,
-    str::{CStr, CStrExt as _},
-};
-use core::ptr::NonNull;
+use crate::{bindings, device::Device, error::Error, error::Result, ffi, str::CStrExt as _};
+use core::{ffi::CStr, ptr::NonNull};
 
 /// # Invariants
 ///
@@ -168,7 +161,7 @@ unsafe impl Sync for Firmware {}
 ///     const DIR: &'static str = "vendor/chip/";
 ///     const FILES: [&'static str; 3] = [ "foo", "bar", "baz" ];
 ///
-///     const fn create(module_name: &'static kernel::str::CStr) -> firmware::ModInfoBuilder<N> {
+///     const fn create(module_name: &'static core::ffi::CStr) -> firmware::ModInfoBuilder<N> {
 ///         let mut builder = firmware::ModInfoBuilder::new(module_name);
 ///
 ///         let mut i = 0;
@@ -202,7 +195,7 @@ macro_rules! module_firmware {
     // this macro. Hence, we can neither use `expr` nor `ty`.
     ($($builder:tt)*) => {
         const _: () = {
-            const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
+            const __MODULE_FIRMWARE_PREFIX: &'static ::core::ffi::CStr = if cfg!(MODULE) {
                 c""
             } else {
                 <LocalModule as $crate::ModuleMetadata>::NAME
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 2bab61910f1e..5504a6216d19 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -57,9 +57,9 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
-            static FILE: &'static $crate::str::CStr = $file;
+            static FILE: &'static ::core::ffi::CStr = $file;
             static LINE: i32 = ::core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr =
+            static CONDITION: &'static ::core::ffi::CStr =
                 $crate::str_to_cstr!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
@@ -195,7 +195,7 @@ pub fn is_test_result_ok(t: impl TestResult) -> bool {
 /// Use [`kunit_case_null`] to generate such a delimiter.
 #[doc(hidden)]
 pub const fn kunit_case(
-    name: &'static kernel::str::CStr,
+    name: &'static core::ffi::CStr,
     run_case: unsafe extern "C" fn(*mut kernel::bindings::kunit),
 ) -> kernel::bindings::kunit_case {
     kernel::bindings::kunit_case {
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index aadcfaa5c759..3a7e935dd1fc 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -166,7 +166,7 @@ fn init(module: &'static ThisModule) -> impl pin_init::PinInit<Self, error::Erro
 /// Metadata attached to a [`Module`] or [`InPlaceModule`].
 pub trait ModuleMetadata {
     /// The name of the module as specified in the `module!` macro.
-    const NAME: &'static crate::str::CStr;
+    const NAME: &'static core::ffi::CStr;
 }
 
 /// Equivalent to `THIS_MODULE` in the C API.
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 00e148d9ea97..6919c884e5d2 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -17,10 +17,9 @@
     mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{ffi::CStr, marker::PhantomData, mem::MaybeUninit, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 5e654403c21b..468b0e038bc9 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -7,7 +7,7 @@
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
 use crate::{error::*, prelude::*, types::Opaque};
-use core::{marker::PhantomData, ptr::addr_of_mut};
+use core::{ffi::CStr, marker::PhantomData, ptr::addr_of_mut};
 
 pub mod reg;
 
@@ -781,6 +781,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
+/// use core::ffi::CStr;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -808,6 +809,7 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
+/// use core::ffi::CStr;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 12ea65df46de..087ac8e05551 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -2,7 +2,8 @@
 
 //! Device Tree / Open Firmware abstractions.
 
-use crate::{bindings, device_id::RawDeviceId, prelude::*};
+use crate::{bindings, device_id::RawDeviceId};
+use core::ffi::CStr;
 
 /// IdTable type for OF drivers.
 pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 8435f8132e38..86b5f666e22b 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -13,11 +13,11 @@
     error::{to_result, Result},
     io::Io,
     io::IoRaw,
-    str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
 use core::{
+    ffi::CStr,
     marker::PhantomData,
     ops::Deref,
     ptr::{addr_of_mut, NonNull},
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 338b8d7c65ee..ccf52274142a 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -9,12 +9,12 @@
     error::{to_result, Result},
     of,
     prelude::*,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
     ThisModule,
 };
 
 use core::{
+    ffi::CStr,
     marker::PhantomData,
     ptr::{addr_of_mut, NonNull},
 };
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 244b660fa835..3f7ca5a95160 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -40,10 +40,7 @@
 
 pub use super::error::{code::*, Error, Result};
 
-pub use super::{
-    str::{CStr, CStrExt as _},
-    ThisModule,
-};
+pub use super::{str::CStrExt as _, ThisModule};
 
 pub use super::init::InPlaceInit;
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 9908b09868bc..a64ce7cd8fc8 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::ffi::CStr;
 use core::fmt::{self, Write};
 use core::ops::{Deref, DerefMut, Index};
 
@@ -175,8 +176,6 @@ macro_rules! b_str {
     }};
 }
 
-pub use core::ffi::CStr;
-
 /// Returns a C pointer to the string.
 // It is a free function rather than a method on an extension trait because:
 //
@@ -267,7 +266,6 @@ impl crate::fmt::Display for CStr {
     ///
     /// ```
     /// # use kernel::prelude::fmt;
-    /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
     /// let penguin = c"🐧";
     /// let s = CString::try_from_fmt(fmt!("{}", penguin))?;
@@ -376,8 +374,8 @@ fn as_ref(&self) -> &BStr {
 /// # Examples
 ///
 /// ```
+/// # use core::ffi::CStr;
 /// # use kernel::str_to_cstr;
-/// # use kernel::str::CStr;
 /// const MY_CSTR: &CStr = str_to_cstr!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
@@ -387,7 +385,7 @@ macro_rules! str_to_cstr {
     // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
         const S: &str = concat!($str, "\0");
-        const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
+        const C: &core::ffi::CStr = match core::ffi::CStr::from_bytes_with_nul(S.as_bytes()) {
             Ok(v) => v,
             Err(_) => panic!("string contains interior NUL"),
         };
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 0b6bc7f2878d..09bc35feb451 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -8,14 +8,14 @@
 use super::{lock::Backend, lock::Guard, LockClassKey};
 use crate::{
     ffi::{c_int, c_long},
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     task::{
         MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
     },
     time::Jiffies,
     types::Opaque,
 };
-use core::{marker::PhantomPinned, pin::Pin, ptr};
+use core::{ffi::CStr, marker::PhantomPinned, pin::Pin, ptr};
 use pin_init::{pin_data, pin_init, PinInit};
 
 /// Creates a [`CondVar`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index a777a22976e0..21deff0bb13b 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,10 +7,10 @@
 
 use super::LockClassKey;
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
-use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
+use core::{cell::UnsafeCell, ffi::CStr, marker::PhantomPinned, pin::Pin};
 use pin_init::{pin_data, pin_init, PinInit};
 
 pub mod mutex;
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 9caa9b419f09..ab5a3947fdd6 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -5,13 +5,14 @@
 //! Support for defining statics containing locks.
 
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     sync::lock::{Backend, Guard, Lock},
     sync::{LockClassKey, LockedBy},
     types::Opaque,
 };
 use core::{
     cell::UnsafeCell,
+    ffi::CStr,
     marker::{PhantomData, PhantomPinned},
     pin::Pin,
 };
@@ -267,7 +268,7 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr =
+            const NAME: &'static ::core::ffi::CStr =
                 $crate::str_to_cstr!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d7e6e59e124b..bf2fb24d04ea 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -11,6 +11,7 @@
     sync::{CondVar, LockClassKey},
     types::Opaque,
 };
+use core::ffi::CStr;
 use core::ops::Deref;
 
 /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index dbec533fd31f..bb3f917204f8 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -135,6 +135,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::{prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
+use core::ffi::CStr;
 use core::marker::PhantomData;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index ec528cd86db5..5ed01f95db53 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -234,7 +234,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             type LocalModule = {type_};
 
             impl ::kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static ::kernel::str::CStr = c\"{name}\";
+                const NAME: &'static ::core::ffi::CStr = c\"{name}\";
             }}
 
             // Double nested modules, since then nobody can access the public items inside.
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index 4f362be5c7df..29514806bc27 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -10,6 +10,8 @@
 use kernel::prelude::*;
 use kernel::sync::Mutex;
 
+use core::ffi::CStr;
+
 module! {
     type: RustConfigfs,
     name: "rust_configfs",
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 0b38729bbab7..691df473d2fd 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -5,10 +5,11 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    auxiliary, bindings, device::Core, driver, error::Error, pci, prelude::*, str::CStr,
-    InPlaceModule,
+    auxiliary, bindings, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
 };
 
+use core::ffi::CStr;
+
 use pin_init::PinInit;
 
 const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;

-- 
2.50.0

