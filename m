Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30153A5FCB6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5517B10E8F5;
	Thu, 13 Mar 2025 16:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kkAGfLuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591A610E8F9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E81245C6054;
 Thu, 13 Mar 2025 16:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60125C4CEDD;
 Thu, 13 Mar 2025 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741884903;
 bh=G1h9jvt0+jldq7TLjoq8Jf7dRNT0Ko06Xk2sclw2PKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kkAGfLuUFraq9896+u7XIt5x1VhThOnaf6Kl8wWg2Utsj3fVhiBb6Qv5JSiyq1lbY
 QpwunPjKyV1idhFvQXQk5dWspA2EsTJ5pv2NCoLSjrLaGZ6vvEovdj6F3DJKXLVYmL
 8KDBtrdcB1LulnJbwLjxQQ/827owZb4DVGdtkBnneQ/3+2gD3hch8iDz0zwKzZMuJe
 Hud05Kgn40UL5GOt28W5+ZB/pjS274GafiU8VTuvNUo3tzfhTj7jDu7/j71vmtHhf9
 7wKgS++W3/JKGebaWnIMhaS+fhjGgKcg3Qpq0Cluum3/4m51BG2UeEk7bApXnJUKOZ
 T+I3BILho4D+Q==
Date: Thu, 13 Mar 2025 17:54:57 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Kosina <jikos@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH RFC 1/3] rust: core abstractions for HID drivers
Message-ID: <c553saxi6iq67tew5emn6ofghjb6haaosyi2hv5zzz66ol7pup@5fwshcz3jxh5>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
 <20250313160220.6410-4-sergeantsagara@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313160220.6410-4-sergeantsagara@protonmail.com>
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

On Mar 13 2025, Rahul Rameshbabu wrote:
> These abstractions enable the development of HID drivers in Rust by binding
> with the HID core C API. They provide Rust types that map to the
> equivalents in C. In this initial draft, only hid_device and hid_device_id
> are provided direct Rust type equivalents. hid_driver is specially wrapped
> with a custom Driver type. The module_hid_driver! macro provides analogous
> functionality to its C equivalent.
> 
> Future work for these abstractions would include more bindings for common
> HID-related types, such as hid_field, hid_report_enum, and hid_report.

Yes, but you can also bypass this as a first step in the same way we do
for HID-BPF: we just consider everything to be a stream of bytes, and
we only care about .report_fixup() and .raw_event().

> Providing Rust equivalents to useful core HID functions will also be
> necessary for HID driver development in Rust.

Yeah, you'll need the back and forth communication with the HID device,
but this can come in later.

> 
> Some concerns with this initial draft
>   - The need for a DeviceId and DeviceIdShallow type.
>     + DeviceIdShallow is used to guarantee the safety requirement for the
>       Sync trait.
>   - The create_hid_driver call in the module_hid_driver! macro does not use
>     Pin semantics for passing the ID_TABLE. I could not get Pin semantics
>     to work in a const fn. I get a feeling this might be safe but need help
>     reviewing this.
> 
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
>  drivers/hid/Kconfig             |   8 ++
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/hid.rs              | 245 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  4 files changed, 256 insertions(+)
>  create mode 100644 rust/kernel/hid.rs
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index b53eb569bd49..e085964c7ffc 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -714,6 +714,14 @@ config HID_MEGAWORLD_FF
>  	Say Y here if you have a Mega World based game controller and want
>  	to have force feedback support for it.
>  
> +config RUST_HID_ABSTRACTIONS
> +	bool "Rust HID abstractions support"
> +	depends on RUST
> +	depends on HID=y

naive question: does it has to be 'y', some distributions are using 'm'.

> +	help
> +	Adds support needed for HID drivers written in Rust. It provides a
> +	wrapper around the C hid core.
> +
>  config HID_REDRAGON
>  	tristate "Redragon keyboards"
>  	default !EXPERT
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 55354e4dec14..e2e95afe9f4a 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -16,6 +16,7 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/hid.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/kernel/hid.rs b/rust/kernel/hid.rs
> new file mode 100644
> index 000000000000..f13476b49e7d
> --- /dev/null
> +++ b/rust/kernel/hid.rs
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
> +
> +use crate::{error::*, prelude::*, types::Opaque};
> +use core::marker::PhantomData;
> +
> +#[repr(transparent)]
> +pub struct Device(Opaque<bindings::hid_device>);
> +
> +impl Device {
> +    unsafe fn from_ptr<'a>(ptr: *mut bindings::hid_device) -> &'a mut Self {
> +        let ptr = ptr.cast::<Self>();
> +
> +        unsafe { &mut *ptr }
> +    }
> +
> +    pub fn vendor(&self) -> u32 {
> +        let hdev = self.0.get();
> +
> +        unsafe { (*hdev).vendor }
> +    }
> +
> +    pub fn product(&self) -> u32 {
> +        let hdev = self.0.get();
> +
> +        unsafe { (*hdev).product }
> +    }

I know this is a RFC, but there are a lot more of interesting fields
you'll want to export.

Can/Should this be automated somehow?

> +}
> +
> +#[repr(transparent)]
> +pub struct DeviceIdShallow(Opaque<bindings::hid_device_id>);
> +
> +// SAFETY: `DeviceIdShallow` doesn't expose any &self method to access internal data, so it's safe to
> +// share `&DriverVTable` across execution context boundaries.
> +unsafe impl Sync for DeviceIdShallow {}
> +
> +impl DeviceIdShallow {

I have a hard time understanding the "DeviceId" part.

In struct hid_device, we have a .id field which is incremented for every
new device. I assume this is different, but this still confuses me.

If that's the rust way of doing it that's fine of course.

[few minutes later] Oh, so you are mapping struct hid_device_id :)
Why dropping the 'HID' in front?

I guess the docs would explain that in the actual submission.


> +    pub const fn new() -> Self {
> +        DeviceIdShallow(Opaque::new(bindings::hid_device_id {
> +            // SAFETY: The rest is zeroed out to initialize `struct hid_device_id`,
> +            // sets `Option<&F>` to be `None`.
> +            ..unsafe { ::core::mem::MaybeUninit::<bindings::hid_device_id>::zeroed().assume_init() }
> +        }))
> +    }
> +
> +    pub const fn new_usb(vendor: u32, product: u32) -> Self {

We probably need the group here as well.

> +        DeviceIdShallow(Opaque::new(bindings::hid_device_id {
> +            bus: 0x3, /* BUS_USB */

group???

> +            vendor: vendor,
> +            product: product,
> +            // SAFETY: The rest is zeroed out to initialize `struct hid_device_id`,
> +            // sets `Option<&F>` to be `None`.
> +            ..unsafe { ::core::mem::MaybeUninit::<bindings::hid_device_id>::zeroed().assume_init() }
> +        }))
> +    }
> +
> +    const unsafe fn as_ptr(&self) -> *const bindings::hid_device_id {
> +        self.0.get()
> +    }
> +}
> +
> +#[repr(transparent)]
> +pub struct DeviceId(Opaque<bindings::hid_device_id>);
> +
> +impl DeviceId {
> +    unsafe fn from_ptr<'a>(ptr: *mut bindings::hid_device_id) -> &'a mut Self {
> +        let ptr = ptr.cast::<Self>();
> +
> +        unsafe { &mut *ptr }
> +    }
> +
> +    unsafe fn from_const_ptr<'a>(ptr: *const bindings::hid_device_id) -> &'a Self {
> +        let ptr = ptr.cast::<Self>();
> +
> +        unsafe { &(*ptr) }
> +    }
> +
> +    pub fn vendor(&self) -> u32 {
> +        let hdev_id = self.0.get();
> +
> +        unsafe { (*hdev_id).vendor }
> +    }
> +
> +    pub fn product(&self) -> u32 {
> +        let hdev_id = self.0.get();
> +
> +        unsafe { (*hdev_id).product }
> +    }

Again, you need the group and the bus at least.

> +}
> +
> +/*
> +#[repr(transparent)]
> +pub struct Field(Opaque<bindings::hid_field>);
> +
> +#[repr(transparent)]
> +pub struct ReportEnum(Opaque<bindings::hid_report_enum>);
> +
> +#[repr(transparent)]
> +pub struct Report(Opaque<bindings::hid_report>);
> +*/
> +
> +#[vtable]
> +pub trait Driver {
> +    fn probe(_dev: &mut Device, _id: &DeviceId) -> Result {
> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }
> +
> +    fn remove(_dev: &mut Device) {
> +    }
> +}
> +
> +struct Adapter<T: Driver> {
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: Driver> Adapter<T> {
> +    unsafe extern "C" fn probe_callback(
> +        hdev: *mut bindings::hid_device,
> +        hdev_id: *const bindings::hid_device_id,
> +    ) -> crate::ffi::c_int {
> +        from_result(|| {
> +            let dev = unsafe { Device::from_ptr(hdev) };
> +            let dev_id = unsafe { DeviceId::from_const_ptr(hdev_id) };
> +            T::probe(dev, dev_id)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn remove_callback(hdev: *mut bindings::hid_device) {
> +        let dev = unsafe { Device::from_ptr(hdev) };
> +        T::remove(dev);
> +    }
> +}
> +
> +#[repr(transparent)]
> +pub struct DriverVTable(Opaque<bindings::hid_driver>);
> +
> +// SAFETY: `DriverVTable` doesn't expose any &self method to access internal data, so it's safe to
> +// share `&DriverVTable` across execution context boundaries.
> +unsafe impl Sync for DriverVTable {}
> +
> +pub const fn create_hid_driver<T: Driver>(
> +    name: &'static CStr,
> +    id_table: &'static DeviceIdShallow,
> +) -> DriverVTable {
> +    DriverVTable(Opaque::new(bindings::hid_driver {
> +        name: name.as_char_ptr().cast_mut(),
> +        id_table: unsafe { id_table.as_ptr() },
> +        probe: if T::HAS_PROBE {
> +            Some(Adapter::<T>::probe_callback)
> +        } else {
> +            None
> +        },
> +        remove: if T::HAS_REMOVE {
> +            Some(Adapter::<T>::remove_callback)
> +        } else {
> +            None
> +        },
> +        // SAFETY: The rest is zeroed out to initialize `struct hid_driver`,
> +        // sets `Option<&F>` to be `None`.
> +        ..unsafe { core::mem::MaybeUninit::<bindings::hid_driver>::zeroed().assume_init() }
> +    }))
> +}
> +
> +pub struct Registration {
> +    driver: Pin<&'static mut DriverVTable>,
> +}
> +
> +unsafe impl Send for Registration {}
> +
> +impl Registration {
> +    pub fn register(
> +        module: &'static crate::ThisModule,
> +        driver: Pin<&'static mut DriverVTable>,
> +        name: &'static CStr,
> +    ) -> Result<Self> {
> +        to_result(unsafe {
> +            bindings::__hid_register_driver(driver.0.get(), module.0, name.as_char_ptr())
> +        })?;
> +
> +        Ok(Registration { driver })
> +    }
> +}
> +
> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        unsafe {
> +            bindings::hid_unregister_driver(self.driver.0.get())
> +        };
> +    }
> +}
> +
> +#[macro_export]
> +macro_rules! usb_device {
> +    (vendor: $vendor:expr, product: $product:expr $(,)?) => {
> +        $crate::hid::DeviceIdShallow::new_usb($vendor, $product)
> +    }
> +}
> +
> +#[macro_export]
> +macro_rules! module_hid_driver {
> +    (@replace_expr $_t:tt $sub:expr) => {$sub};
> +
> +    (@count_devices $($x:expr),*) => {
> +        0usize $(+ $crate::module_hid_driver!(@replace_expr $x 1usize))*
> +    };
> +
> +    (driver: $driver:ident, id_table: [$($dev_id:expr),+ $(,)?], name: $name:tt, $($f:tt)*) => {
> +        struct Module {
> +            _reg: $crate::hid::Registration,
> +        }
> +
> +        $crate::prelude::module! {
> +            type: Module,
> +            name: $name,
> +            $($f)*
> +        }
> +
> +        const _: () = {
> +            static NAME: &$crate::str::CStr = $crate::c_str!($name);
> +
> +            static ID_TABLE: [$crate::hid::DeviceIdShallow;
> +                $crate::module_hid_driver!(@count_devices $($dev_id),+) + 1] = [
> +                $($dev_id),+,
> +                $crate::hid::DeviceIdShallow::new(),
> +            ];
> +
> +            static mut DRIVER: $crate::hid::DriverVTable =
> +                $crate::hid::create_hid_driver::<$driver>(NAME, unsafe { &ID_TABLE[0] });
> +
> +            impl $crate::Module for Module {
> +                fn init(module: &'static $crate::ThisModule) -> Result<Self> {
> +                    let driver = unsafe { &mut DRIVER };
> +                    let mut reg = $crate::hid::Registration::register(
> +                        module,
> +                        ::core::pin::Pin::static_mut(driver),
> +                        NAME,
> +                    )?;
> +                    Ok(Module { _reg: reg })
> +                }
> +            }
> +        };
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911..51b8c2689264 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -49,6 +49,8 @@
>  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
>  pub mod firmware;
>  pub mod fs;
> +#[cfg(CONFIG_RUST_HID_ABSTRACTIONS)]
> +pub mod hid;
>  pub mod init;
>  pub mod io;
>  pub mod ioctl;
> -- 
> 2.47.2
> 
> 

Cheers,
Benjamin
