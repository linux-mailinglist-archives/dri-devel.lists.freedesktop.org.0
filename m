Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE56A5FAE0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B17510E8E3;
	Thu, 13 Mar 2025 16:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="f4j+wNB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Thu, 13 Mar 2025 16:11:19 UTC
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8CA10E8E3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1741881820; x=1742141020;
 bh=xILv2bEEr10gYM5OUsCRiMfhcplESrJ2O+L7nHoU4zg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=f4j+wNB21WzE3L5Ph1e8pChHKhXPBo+AFNQzD7q+ooSOSaBXb1bDyD4kVt7hlPF3p
 uk8vaTFYyMuE87LI0Wm89b521or8Z/gN/u8HGN56xZ5kT5Nh+MLs0UiEmGMkxXItv7
 MvRsSCDECzqWnAnFAo9vzXVnxSA9vxBlzz5ChqxDFu0Zqe1vTSKXC4uTPNvZZeNAPu
 bOOtjVzRhKJFRVSxBOnUAn+YIk0tQvPk5kgeU8S1HlFPJXMumiYZ87EBY5GoVun0BG
 di3zMKeE514rM2FeJgUYJcMAmfADqZmyH+GTtxjyhAZaWG3gBzAkN+Btr2ZAQK6Bqw
 7o11GqWn/kVIQ==
Date: Thu, 13 Mar 2025 16:03:35 +0000
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH RFC 1/3] rust: core abstractions for HID drivers
Message-ID: <20250313160220.6410-4-sergeantsagara@protonmail.com>
In-Reply-To: <20250313160220.6410-2-sergeantsagara@protonmail.com>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 58e5f15e4d4b1f3f057aaf90b658d81faaf96ccb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

These abstractions enable the development of HID drivers in Rust by binding
with the HID core C API. They provide Rust types that map to the
equivalents in C. In this initial draft, only hid_device and hid_device_id
are provided direct Rust type equivalents. hid_driver is specially wrapped
with a custom Driver type. The module_hid_driver! macro provides analogous
functionality to its C equivalent.

Future work for these abstractions would include more bindings for common
HID-related types, such as hid_field, hid_report_enum, and hid_report.
Providing Rust equivalents to useful core HID functions will also be
necessary for HID driver development in Rust.

Some concerns with this initial draft
  - The need for a DeviceId and DeviceIdShallow type.
    + DeviceIdShallow is used to guarantee the safety requirement for the
      Sync trait.
  - The create_hid_driver call in the module_hid_driver! macro does not use
    Pin semantics for passing the ID_TABLE. I could not get Pin semantics
    to work in a const fn. I get a feeling this might be safe but need help
    reviewing this.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 drivers/hid/Kconfig             |   8 ++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/hid.rs              | 245 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 4 files changed, 256 insertions(+)
 create mode 100644 rust/kernel/hid.rs

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index b53eb569bd49..e085964c7ffc 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -714,6 +714,14 @@ config HID_MEGAWORLD_FF
 =09Say Y here if you have a Mega World based game controller and want
 =09to have force feedback support for it.
=20
+config RUST_HID_ABSTRACTIONS
+=09bool "Rust HID abstractions support"
+=09depends on RUST
+=09depends on HID=3Dy
+=09help
+=09Adds support needed for HID drivers written in Rust. It provides a
+=09wrapper around the C hid core.
+
 config HID_REDRAGON
 =09tristate "Redragon keyboards"
 =09default !EXPERT
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 55354e4dec14..e2e95afe9f4a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -16,6 +16,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/hid.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/kernel/hid.rs b/rust/kernel/hid.rs
new file mode 100644
index 000000000000..f13476b49e7d
--- /dev/null
+++ b/rust/kernel/hid.rs
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
+
+use crate::{error::*, prelude::*, types::Opaque};
+use core::marker::PhantomData;
+
+#[repr(transparent)]
+pub struct Device(Opaque<bindings::hid_device>);
+
+impl Device {
+    unsafe fn from_ptr<'a>(ptr: *mut bindings::hid_device) -> &'a mut Self=
 {
+        let ptr =3D ptr.cast::<Self>();
+
+        unsafe { &mut *ptr }
+    }
+
+    pub fn vendor(&self) -> u32 {
+        let hdev =3D self.0.get();
+
+        unsafe { (*hdev).vendor }
+    }
+
+    pub fn product(&self) -> u32 {
+        let hdev =3D self.0.get();
+
+        unsafe { (*hdev).product }
+    }
+}
+
+#[repr(transparent)]
+pub struct DeviceIdShallow(Opaque<bindings::hid_device_id>);
+
+// SAFETY: `DeviceIdShallow` doesn't expose any &self method to access int=
ernal data, so it's safe to
+// share `&DriverVTable` across execution context boundaries.
+unsafe impl Sync for DeviceIdShallow {}
+
+impl DeviceIdShallow {
+    pub const fn new() -> Self {
+        DeviceIdShallow(Opaque::new(bindings::hid_device_id {
+            // SAFETY: The rest is zeroed out to initialize `struct hid_de=
vice_id`,
+            // sets `Option<&F>` to be `None`.
+            ..unsafe { ::core::mem::MaybeUninit::<bindings::hid_device_id>=
::zeroed().assume_init() }
+        }))
+    }
+
+    pub const fn new_usb(vendor: u32, product: u32) -> Self {
+        DeviceIdShallow(Opaque::new(bindings::hid_device_id {
+            bus: 0x3, /* BUS_USB */
+            vendor: vendor,
+            product: product,
+            // SAFETY: The rest is zeroed out to initialize `struct hid_de=
vice_id`,
+            // sets `Option<&F>` to be `None`.
+            ..unsafe { ::core::mem::MaybeUninit::<bindings::hid_device_id>=
::zeroed().assume_init() }
+        }))
+    }
+
+    const unsafe fn as_ptr(&self) -> *const bindings::hid_device_id {
+        self.0.get()
+    }
+}
+
+#[repr(transparent)]
+pub struct DeviceId(Opaque<bindings::hid_device_id>);
+
+impl DeviceId {
+    unsafe fn from_ptr<'a>(ptr: *mut bindings::hid_device_id) -> &'a mut S=
elf {
+        let ptr =3D ptr.cast::<Self>();
+
+        unsafe { &mut *ptr }
+    }
+
+    unsafe fn from_const_ptr<'a>(ptr: *const bindings::hid_device_id) -> &=
'a Self {
+        let ptr =3D ptr.cast::<Self>();
+
+        unsafe { &(*ptr) }
+    }
+
+    pub fn vendor(&self) -> u32 {
+        let hdev_id =3D self.0.get();
+
+        unsafe { (*hdev_id).vendor }
+    }
+
+    pub fn product(&self) -> u32 {
+        let hdev_id =3D self.0.get();
+
+        unsafe { (*hdev_id).product }
+    }
+}
+
+/*
+#[repr(transparent)]
+pub struct Field(Opaque<bindings::hid_field>);
+
+#[repr(transparent)]
+pub struct ReportEnum(Opaque<bindings::hid_report_enum>);
+
+#[repr(transparent)]
+pub struct Report(Opaque<bindings::hid_report>);
+*/
+
+#[vtable]
+pub trait Driver {
+    fn probe(_dev: &mut Device, _id: &DeviceId) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    fn remove(_dev: &mut Device) {
+    }
+}
+
+struct Adapter<T: Driver> {
+    _p: PhantomData<T>,
+}
+
+impl<T: Driver> Adapter<T> {
+    unsafe extern "C" fn probe_callback(
+        hdev: *mut bindings::hid_device,
+        hdev_id: *const bindings::hid_device_id,
+    ) -> crate::ffi::c_int {
+        from_result(|| {
+            let dev =3D unsafe { Device::from_ptr(hdev) };
+            let dev_id =3D unsafe { DeviceId::from_const_ptr(hdev_id) };
+            T::probe(dev, dev_id)?;
+            Ok(0)
+        })
+    }
+
+    unsafe extern "C" fn remove_callback(hdev: *mut bindings::hid_device) =
{
+        let dev =3D unsafe { Device::from_ptr(hdev) };
+        T::remove(dev);
+    }
+}
+
+#[repr(transparent)]
+pub struct DriverVTable(Opaque<bindings::hid_driver>);
+
+// SAFETY: `DriverVTable` doesn't expose any &self method to access intern=
al data, so it's safe to
+// share `&DriverVTable` across execution context boundaries.
+unsafe impl Sync for DriverVTable {}
+
+pub const fn create_hid_driver<T: Driver>(
+    name: &'static CStr,
+    id_table: &'static DeviceIdShallow,
+) -> DriverVTable {
+    DriverVTable(Opaque::new(bindings::hid_driver {
+        name: name.as_char_ptr().cast_mut(),
+        id_table: unsafe { id_table.as_ptr() },
+        probe: if T::HAS_PROBE {
+            Some(Adapter::<T>::probe_callback)
+        } else {
+            None
+        },
+        remove: if T::HAS_REMOVE {
+            Some(Adapter::<T>::remove_callback)
+        } else {
+            None
+        },
+        // SAFETY: The rest is zeroed out to initialize `struct hid_driver=
`,
+        // sets `Option<&F>` to be `None`.
+        ..unsafe { core::mem::MaybeUninit::<bindings::hid_driver>::zeroed(=
).assume_init() }
+    }))
+}
+
+pub struct Registration {
+    driver: Pin<&'static mut DriverVTable>,
+}
+
+unsafe impl Send for Registration {}
+
+impl Registration {
+    pub fn register(
+        module: &'static crate::ThisModule,
+        driver: Pin<&'static mut DriverVTable>,
+        name: &'static CStr,
+    ) -> Result<Self> {
+        to_result(unsafe {
+            bindings::__hid_register_driver(driver.0.get(), module.0, name=
.as_char_ptr())
+        })?;
+
+        Ok(Registration { driver })
+    }
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        unsafe {
+            bindings::hid_unregister_driver(self.driver.0.get())
+        };
+    }
+}
+
+#[macro_export]
+macro_rules! usb_device {
+    (vendor: $vendor:expr, product: $product:expr $(,)?) =3D> {
+        $crate::hid::DeviceIdShallow::new_usb($vendor, $product)
+    }
+}
+
+#[macro_export]
+macro_rules! module_hid_driver {
+    (@replace_expr $_t:tt $sub:expr) =3D> {$sub};
+
+    (@count_devices $($x:expr),*) =3D> {
+        0usize $(+ $crate::module_hid_driver!(@replace_expr $x 1usize))*
+    };
+
+    (driver: $driver:ident, id_table: [$($dev_id:expr),+ $(,)?], name: $na=
me:tt, $($f:tt)*) =3D> {
+        struct Module {
+            _reg: $crate::hid::Registration,
+        }
+
+        $crate::prelude::module! {
+            type: Module,
+            name: $name,
+            $($f)*
+        }
+
+        const _: () =3D {
+            static NAME: &$crate::str::CStr =3D $crate::c_str!($name);
+
+            static ID_TABLE: [$crate::hid::DeviceIdShallow;
+                $crate::module_hid_driver!(@count_devices $($dev_id),+) + =
1] =3D [
+                $($dev_id),+,
+                $crate::hid::DeviceIdShallow::new(),
+            ];
+
+            static mut DRIVER: $crate::hid::DriverVTable =3D
+                $crate::hid::create_hid_driver::<$driver>(NAME, unsafe { &=
ID_TABLE[0] });
+
+            impl $crate::Module for Module {
+                fn init(module: &'static $crate::ThisModule) -> Result<Sel=
f> {
+                    let driver =3D unsafe { &mut DRIVER };
+                    let mut reg =3D $crate::hid::Registration::register(
+                        module,
+                        ::core::pin::Pin::static_mut(driver),
+                        NAME,
+                    )?;
+                    Ok(Module { _reg: reg })
+                }
+            }
+        };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..51b8c2689264 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -49,6 +49,8 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+#[cfg(CONFIG_RUST_HID_ABSTRACTIONS)]
+pub mod hid;
 pub mod init;
 pub mod io;
 pub mod ioctl;
--=20
2.47.2


