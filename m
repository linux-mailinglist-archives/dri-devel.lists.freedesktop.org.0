Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD0A63309
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 02:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E7510E080;
	Sun, 16 Mar 2025 01:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="Q051WPht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0BE10E080
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 01:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1742087372; x=1742346572;
 bh=MqmS0orb2WnUl2paHYYKtX6297b3GG+ztGyGpJUohpU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=Q051WPhtp2O0j1ZA1aNGhOakQJhGFb3efJhsoJ68TIwCbOYc+8JvfwoMrWBQBwZbM
 J0sl8xC7pUvkNdI5RGYJXRKVzuTzPNO09Dsggabg4C6ZIeLYXx3RadCi8/JVh8qUwM
 zJ7zG+opIm5M0zH3mOLAjueHSZ8SRv1knw4MElnY68KMwGcmPhTsYHqJGqgEAGS29g
 lgi0WH5YwyYXEsZIzrSBmuTs9RHn/qRkFk7xLhJ7R0HuPrEb9pYIVoaKhTWI4NNkco
 TWCgHLJf8ZmZkWCA6G+jazc5rHLHQlMBFplIRw+ULFQuNaQ9x3XWXtRirX2Smjf5Z0
 kgoc+NYrTV+Hg==
Date: Sun, 16 Mar 2025 01:09:27 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 1/3] rust: core abstractions for HID drivers
Message-ID: <87v7s9hjcy.fsf@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: f342f64941e007e2a1ca4b858f36b51900ebc90e
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

On Thu, 13 Mar, 2025 17:54:57 +0100 "Benjamin Tissoires" <bentiss@kernel.or=
g> wrote:
> On Mar 13 2025, Rahul Rameshbabu wrote:
>> These abstractions enable the development of HID drivers in Rust by bind=
ing
>> with the HID core C API. They provide Rust types that map to the
>> equivalents in C. In this initial draft, only hid_device and hid_device_=
id
>> are provided direct Rust type equivalents. hid_driver is specially wrapp=
ed
>> with a custom Driver type. The module_hid_driver! macro provides analogo=
us
>> functionality to its C equivalent.
>>
>> Future work for these abstractions would include more bindings for commo=
n
>> HID-related types, such as hid_field, hid_report_enum, and hid_report.
>
> Yes, but you can also bypass this as a first step in the same way we do
> for HID-BPF: we just consider everything to be a stream of bytes, and
> we only care about .report_fixup() and .raw_event().
>

Thanks, I took a look at struct hid_bpf_ops and how it is used in
drivers/hid/bpf/hid_bpf_dispatch.c. Would you then suggest doing this
for the C-Rust layer and just having pure Rust code for handling the
stream of bytes, instead of doing more C-Rust bindings? This is
something that can be discussed after implementing a Rust abstraction
with a "simple" reference HID driver.

>> Providing Rust equivalents to useful core HID functions will also be
>> necessary for HID driver development in Rust.
>
> Yeah, you'll need the back and forth communication with the HID device,
> but this can come in later.
>
>>
>> Some concerns with this initial draft
>>   - The need for a DeviceId and DeviceIdShallow type.
>>     + DeviceIdShallow is used to guarantee the safety requirement for th=
e
>>       Sync trait.
>>   - The create_hid_driver call in the module_hid_driver! macro does not =
use
>>     Pin semantics for passing the ID_TABLE. I could not get Pin semantic=
s
>>     to work in a const fn. I get a feeling this might be safe but need h=
elp
>>     reviewing this.
>>
>> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
>> ---
>>  drivers/hid/Kconfig             |   8 ++
>>  rust/bindings/bindings_helper.h |   1 +
>>  rust/kernel/hid.rs              | 245 ++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs              |   2 +
>>  4 files changed, 256 insertions(+)
>>  create mode 100644 rust/kernel/hid.rs
>>
>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>> index b53eb569bd49..e085964c7ffc 100644
>> --- a/drivers/hid/Kconfig
>> +++ b/drivers/hid/Kconfig
>> @@ -714,6 +714,14 @@ config HID_MEGAWORLD_FF
>>  =09Say Y here if you have a Mega World based game controller and want
>>  =09to have force feedback support for it.
>>
>> +config RUST_HID_ABSTRACTIONS
>> +=09bool "Rust HID abstractions support"
>> +=09depends on RUST
>> +=09depends on HID=3Dy
>
> naive question: does it has to be 'y', some distributions are using 'm'.
>

My distribution of choice uses 'm' as well. I probably should double
check how the #[cfg(CONFIG_RUST_HID_ABSTRACTIONS)] Rust attribute works.
I think the problem here is that all the Rust abstrations today get
compiled into the kernel image, so if the HID Rust abstrations depend on
a module, that sort of breaks the abstration that components compiled
into the kernel as built-in do not depend on symbols from a module.

I believe there are a number of other Rust abstractions that fall into
this problem. CONFIG_RUST_FW_LOADER_ABSTRACTIONS is one such example. I
would definitely be interested in discussion on how to solve this
problem in general for the Rust abstractions.

>> +=09help
>> +=09Adds support needed for HID drivers written in Rust. It provides a
>> +=09wrapper around the C hid core.
>> +
>>  config HID_REDRAGON
>>  =09tristate "Redragon keyboards"
>>  =09default !EXPERT
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_he=
lper.h
>> index 55354e4dec14..e2e95afe9f4a 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -16,6 +16,7 @@
>>  #include <linux/file.h>
>>  #include <linux/firmware.h>
>>  #include <linux/fs.h>
>> +#include <linux/hid.h>
>>  #include <linux/jiffies.h>
>>  #include <linux/jump_label.h>
>>  #include <linux/mdio.h>
>> diff --git a/rust/kernel/hid.rs b/rust/kernel/hid.rs
>> new file mode 100644
>> index 000000000000..f13476b49e7d
>> --- /dev/null
>> +++ b/rust/kernel/hid.rs
>> @@ -0,0 +1,245 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
>> +
>> +use crate::{error::*, prelude::*, types::Opaque};
>> +use core::marker::PhantomData;
>> +
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::hid_device>);
>> +
>> +impl Device {
>> +    unsafe fn from_ptr<'a>(ptr: *mut bindings::hid_device) -> &'a mut S=
elf {
>> +        let ptr =3D ptr.cast::<Self>();
>> +
>> +        unsafe { &mut *ptr }
>> +    }
>> +
>> +    pub fn vendor(&self) -> u32 {
>> +        let hdev =3D self.0.get();
>> +
>> +        unsafe { (*hdev).vendor }
>> +    }
>> +
>> +    pub fn product(&self) -> u32 {
>> +        let hdev =3D self.0.get();
>> +
>> +        unsafe { (*hdev).product }
>> +    }
>
> I know this is a RFC, but there are a lot more of interesting fields
> you'll want to export.
>
> Can/Should this be automated somehow?
>

That would be interesting. I am not sure there is a path for automation
of this right now. This is a similar problem to C++ with
setters/getters. I would be interested if someone from the Rust for
Linux side has any commentary on this topic.

>> +}
>> +
>> +#[repr(transparent)]
>> +pub struct DeviceIdShallow(Opaque<bindings::hid_device_id>);
>> +
>> +// SAFETY: `DeviceIdShallow` doesn't expose any &self method to access =
internal data, so it's safe to
>> +// share `&DriverVTable` across execution context boundaries.
>> +unsafe impl Sync for DeviceIdShallow {}
>> +
>> +impl DeviceIdShallow {
>
> I have a hard time understanding the "DeviceId" part.
>
> In struct hid_device, we have a .id field which is incremented for every
> new device. I assume this is different, but this still confuses me.
>
> If that's the rust way of doing it that's fine of course.
>
> [few minutes later] Oh, so you are mapping struct hid_device_id :)
> Why dropping the 'HID' in front?

This has to do with module scoping in Rust (similar to namespaces in C++
as an analogy). The way I would reference this in HID drivers would be
hid::DeviceId vs hid::HidDeviceId. I think, because of this, its more
common among the Rust abstraction to drop the name of the subsystem in
the type name prefixes.

>
> I guess the docs would explain that in the actual submission.
>

I'll work an adding proper documentation in my next RFC revision. I
wanted to get this initial RFC out just to make sure I am on the right
path.

>
>> +    pub const fn new() -> Self {
>> +        DeviceIdShallow(Opaque::new(bindings::hid_device_id {
>> +            // SAFETY: The rest is zeroed out to initialize `struct hid=
_device_id`,
>> +            // sets `Option<&F>` to be `None`.
>> +            ..unsafe { ::core::mem::MaybeUninit::<bindings::hid_device_=
id>::zeroed().assume_init() }
>> +        }))
>> +    }
>> +
>> +    pub const fn new_usb(vendor: u32, product: u32) -> Self {
>
> We probably need the group here as well.
>

  #define HID_USB_DEVICE(ven, prod)=09=09=09=09\
    .bus =3D BUS_USB, .vendor =3D (ven), .product =3D (prod)

When we use HID_USB_DEVICE to instantiate a hid_device_id element in the
.id_table, the C macro does not populate the .group field. Is the ideal
for anything new in the HID subsystem to explicitly specify groups?
Through git blaming, I found 070748ed0b52 ("HID: Create a generic device
group"). The commit description was very useful.

  Devices that do not have a special driver are handled by the generic
  driver. This patch does the same thing using device groups; Instead of
  forcing a particular driver, the appropriate driver is picked up by
  udev. As a consequence, one can now move a device from generic to
  specific handling by a simple rebind.

I assume we want to explicitly specify group going forward for matching
with the generic driver or not and for rebinding purposes with udev?

>> +        DeviceIdShallow(Opaque::new(bindings::hid_device_id {
>> +            bus: 0x3, /* BUS_USB */
>
> group???
>
>> +            vendor: vendor,
>> +            product: product,
>> +            // SAFETY: The rest is zeroed out to initialize `struct hid=
_device_id`,
>> +            // sets `Option<&F>` to be `None`.
>> +            ..unsafe { ::core::mem::MaybeUninit::<bindings::hid_device_=
id>::zeroed().assume_init() }
>> +        }))
>> +    }
>> +
>> +    const unsafe fn as_ptr(&self) -> *const bindings::hid_device_id {
>> +        self.0.get()
>> +    }
>> +}
>> +
>> +#[repr(transparent)]
>> +pub struct DeviceId(Opaque<bindings::hid_device_id>);
>> +
>> +impl DeviceId {
>> +    unsafe fn from_ptr<'a>(ptr: *mut bindings::hid_device_id) -> &'a mu=
t Self {
>> +        let ptr =3D ptr.cast::<Self>();
>> +
>> +        unsafe { &mut *ptr }
>> +    }
>> +
>> +    unsafe fn from_const_ptr<'a>(ptr: *const bindings::hid_device_id) -=
> &'a Self {
>> +        let ptr =3D ptr.cast::<Self>();
>> +
>> +        unsafe { &(*ptr) }
>> +    }
>> +
>> +    pub fn vendor(&self) -> u32 {
>> +        let hdev_id =3D self.0.get();
>> +
>> +        unsafe { (*hdev_id).vendor }
>> +    }
>> +
>> +    pub fn product(&self) -> u32 {
>> +        let hdev_id =3D self.0.get();
>> +
>> +        unsafe { (*hdev_id).product }
>> +    }
>
> Again, you need the group and the bus at least.
>

Will add throw those and more in my next revision.

>> +}
>> +
>> +/*
>> +#[repr(transparent)]
>> +pub struct Field(Opaque<bindings::hid_field>);
>> +
>> +#[repr(transparent)]
>> +pub struct ReportEnum(Opaque<bindings::hid_report_enum>);
>> +
>> +#[repr(transparent)]
>> +pub struct Report(Opaque<bindings::hid_report>);
>> +*/
>> +
>> +#[vtable]
>> +pub trait Driver {
>> +    fn probe(_dev: &mut Device, _id: &DeviceId) -> Result {
>> +        build_error!(VTABLE_DEFAULT_ERROR)
>> +    }
>> +
>> +    fn remove(_dev: &mut Device) {
>> +    }
>> +}
>> +
>> +struct Adapter<T: Driver> {
>> +    _p: PhantomData<T>,
>> +}
>> +
>> +impl<T: Driver> Adapter<T> {
>> +    unsafe extern "C" fn probe_callback(
>> +        hdev: *mut bindings::hid_device,
>> +        hdev_id: *const bindings::hid_device_id,
>> +    ) -> crate::ffi::c_int {
>> +        from_result(|| {
>> +            let dev =3D unsafe { Device::from_ptr(hdev) };
>> +            let dev_id =3D unsafe { DeviceId::from_const_ptr(hdev_id) }=
;
>> +            T::probe(dev, dev_id)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn remove_callback(hdev: *mut bindings::hid_devic=
e) {
>> +        let dev =3D unsafe { Device::from_ptr(hdev) };
>> +        T::remove(dev);
>> +    }
>> +}
>> +
>> +#[repr(transparent)]
>> +pub struct DriverVTable(Opaque<bindings::hid_driver>);
>> +
>> +// SAFETY: `DriverVTable` doesn't expose any &self method to access int=
ernal data, so it's safe to
>> +// share `&DriverVTable` across execution context boundaries.
>> +unsafe impl Sync for DriverVTable {}
>> +
>> +pub const fn create_hid_driver<T: Driver>(
>> +    name: &'static CStr,
>> +    id_table: &'static DeviceIdShallow,
>> +) -> DriverVTable {
>> +    DriverVTable(Opaque::new(bindings::hid_driver {
>> +        name: name.as_char_ptr().cast_mut(),
>> +        id_table: unsafe { id_table.as_ptr() },
>> +        probe: if T::HAS_PROBE {
>> +            Some(Adapter::<T>::probe_callback)
>> +        } else {
>> +            None
>> +        },
>> +        remove: if T::HAS_REMOVE {
>> +            Some(Adapter::<T>::remove_callback)
>> +        } else {
>> +            None
>> +        },
>> +        // SAFETY: The rest is zeroed out to initialize `struct hid_dri=
ver`,
>> +        // sets `Option<&F>` to be `None`.
>> +        ..unsafe { core::mem::MaybeUninit::<bindings::hid_driver>::zero=
ed().assume_init() }
>> +    }))
>> +}
>> +
>> +pub struct Registration {
>> +    driver: Pin<&'static mut DriverVTable>,
>> +}
>> +
>> +unsafe impl Send for Registration {}
>> +
>> +impl Registration {
>> +    pub fn register(
>> +        module: &'static crate::ThisModule,
>> +        driver: Pin<&'static mut DriverVTable>,
>> +        name: &'static CStr,
>> +    ) -> Result<Self> {
>> +        to_result(unsafe {
>> +            bindings::__hid_register_driver(driver.0.get(), module.0, n=
ame.as_char_ptr())
>> +        })?;
>> +
>> +        Ok(Registration { driver })
>> +    }
>> +}
>> +
>> +impl Drop for Registration {
>> +    fn drop(&mut self) {
>> +        unsafe {
>> +            bindings::hid_unregister_driver(self.driver.0.get())
>> +        };
>> +    }
>> +}
>> +
>> +#[macro_export]
>> +macro_rules! usb_device {
>> +    (vendor: $vendor:expr, product: $product:expr $(,)?) =3D> {
>> +        $crate::hid::DeviceIdShallow::new_usb($vendor, $product)
>> +    }
>> +}
>> +
>> +#[macro_export]
>> +macro_rules! module_hid_driver {
>> +    (@replace_expr $_t:tt $sub:expr) =3D> {$sub};
>> +
>> +    (@count_devices $($x:expr),*) =3D> {
>> +        0usize $(+ $crate::module_hid_driver!(@replace_expr $x 1usize))=
*
>> +    };
>> +
>> +    (driver: $driver:ident, id_table: [$($dev_id:expr),+ $(,)?], name: =
$name:tt, $($f:tt)*) =3D> {
>> +        struct Module {
>> +            _reg: $crate::hid::Registration,
>> +        }
>> +
>> +        $crate::prelude::module! {
>> +            type: Module,
>> +            name: $name,
>> +            $($f)*
>> +        }
>> +
>> +        const _: () =3D {
>> +            static NAME: &$crate::str::CStr =3D $crate::c_str!($name);
>> +
>> +            static ID_TABLE: [$crate::hid::DeviceIdShallow;
>> +                $crate::module_hid_driver!(@count_devices $($dev_id),+)=
 + 1] =3D [
>> +                $($dev_id),+,
>> +                $crate::hid::DeviceIdShallow::new(),
>> +            ];
>> +
>> +            static mut DRIVER: $crate::hid::DriverVTable =3D
>> +                $crate::hid::create_hid_driver::<$driver>(NAME, unsafe =
{ &ID_TABLE[0] });
>> +
>> +            impl $crate::Module for Module {
>> +                fn init(module: &'static $crate::ThisModule) -> Result<=
Self> {
>> +                    let driver =3D unsafe { &mut DRIVER };
>> +                    let mut reg =3D $crate::hid::Registration::register=
(
>> +                        module,
>> +                        ::core::pin::Pin::static_mut(driver),
>> +                        NAME,
>> +                    )?;
>> +                    Ok(Module { _reg: reg })
>> +                }
>> +            }
>> +        };
>> +    }
>> +}
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 496ed32b0911..51b8c2689264 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -49,6 +49,8 @@
>>  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
>>  pub mod firmware;
>>  pub mod fs;
>> +#[cfg(CONFIG_RUST_HID_ABSTRACTIONS)]
>> +pub mod hid;
>>  pub mod init;
>>  pub mod io;
>>  pub mod ioctl;
>> --
>> 2.47.2
>>
>>
>
> Cheers,
> Benjamin

Thanks so much for the review,
Rahul Rameshbabu

