Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNMjLxiErWkx3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447712308EE
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0610E17C;
	Sun,  8 Mar 2026 14:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="JczRkV5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFA310E3F6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 20:36:27 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id C5AED240101
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 21:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
 t=1772829385; bh=j2O3V7AMyLa1yZB24Ti+OpRWtDSQYTYoVDhod0crmqg=;
 h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
 MIME-Version:OpenPGP:From;
 b=JczRkV5dnjjb8KPpea3ksVlbDnUaV0aMZqH9slwu1krN1xb/KMCZjgGpAEitJyMRK
 4DjC1oA7XwN1ph330iM41P/mY7fCizknxXhnFwaYip5utHygB39eomP9+EeSbTMMDg
 iw3x6+FUAf8mtQU175ObJPyWt4DpH5BymJAQNfyQ2Zwyk2n4xDXdxdjDJ2T2dm4RqN
 mIsrSi2LdJyQv65mBC9J+vBx0UZHoUX5rGOg0UF3TG3KpDj0QUMZoD0NQohfiSzClN
 spoM/svrfjaUaijqncxDydaIDWTetlUuiu/5pd5e85Ji6syO1xgsorqcQMxRSn01fF
 NNqS9H9J97yTw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4fSJ8k4b6hz9rxN;
 Fri,  6 Mar 2026 21:36:22 +0100 (CET)
Message-ID: <088970fb441a9ed0ad57b3fa43d30cc0bb5b2db4.camel@posteo.de>
Subject: Re: [PATCH v2 3/4] rust: add basic serial device bus abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Miguel
 Ojeda	 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Kari Argillander	 <kari.argillander@gmail.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>,  Viresh Kumar <viresh.kumar@linaro.org>,
 Boqun Feng <boqun@kernel.org>, David Airlie <airlied@gmail.com>,  Simona
 Vetter <simona@ffwll.ch>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Date: Fri, 06 Mar 2026 20:36:24 +0000
In-Reply-To: <20260306-rust_serdev-v2-3-e9b23b42b255@posteo.de>
References: <20260306-rust_serdev-v2-0-e9b23b42b255@posteo.de>
 <20260306-rust_serdev-v2-3-e9b23b42b255@posteo.de>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-PF5TUwaOf//AV1lgh2Mq"
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc;
 preference=encrypt
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 447712308EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[41];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:kari.argillander@gmail.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:boqun@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:kariargillander@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,linaro.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,posteo.de:dkim,posteo.de:email,posteo.de:mid]
X-Rspamd-Action: no action


--=-PF5TUwaOf//AV1lgh2Mq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-03-06 at 19:35 +0000, Markus Probst wrote:
> Implement the basic serial device bus abstractions required to write a
> serial device bus device driver with or without the need for initial devi=
ce
> data. This includes the following data structures:
>=20
> The `serdev::Driver` trait represents the interface to the driver.
>=20
> The `serdev::Device` abstraction represents a `struct serdev_device`.
>=20
> In order to provide the Serdev specific parts to a generic
> `driver::Registration` the `driver::RegistrationOps` trait is
> implemented by `serdev::Adapter`.
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/serdev.c           |  22 ++
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/serdev.rs           | 533 ++++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 559 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 083cc44aa952..ab521ba42673 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -80,6 +80,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/sched.h>
>  #include <linux/security.h>
> +#include <linux/serdev.h>
>  #include <linux/slab.h>
>  #include <linux/sys_soc.h>
>  #include <linux/task_work.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a..9b87e9591cfd 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -53,6 +53,7 @@
>  #include "regulator.c"
>  #include "scatterlist.c"
>  #include "security.c"
> +#include "serdev.c"
>  #include "signal.c"
>  #include "slab.c"
>  #include "spinlock.c"
> diff --git a/rust/helpers/serdev.c b/rust/helpers/serdev.c
> new file mode 100644
> index 000000000000..c52b78ca3fc7
> --- /dev/null
> +++ b/rust/helpers/serdev.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/serdev.h>
> +
> +__rust_helper
> +void rust_helper_serdev_device_driver_unregister(struct serdev_device_dr=
iver *sdrv)
> +{
> +	serdev_device_driver_unregister(sdrv);
> +}
> +
> +__rust_helper
> +void rust_helper_serdev_device_put(struct serdev_device *serdev)
> +{
> +	serdev_device_put(serdev);
> +}
> +
> +__rust_helper
> +void rust_helper_serdev_device_set_client_ops(struct serdev_device *serd=
ev,
> +					      const struct serdev_device_ops *ops)
> +{
> +	serdev_device_set_client_ops(serdev, ops);
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3da92f18f4ee..1d337e112922 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -140,6 +140,8 @@
>  pub mod scatterlist;
>  pub mod security;
>  pub mod seq_file;
> +#[cfg(CONFIG_SERIAL_DEV_BUS)]
> +pub mod serdev;
>  pub mod sizes;
>  pub mod slice;
>  #[cfg(CONFIG_SOC_BUS)]
> diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
> new file mode 100644
> index 000000000000..cba5fb6245f7
> --- /dev/null
> +++ b/rust/kernel/serdev.rs
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the serial device bus.
> +//!
> +//! C header: [`include/linux/serdev.h`](srctree/include/linux/serdev.h)
> +
> +use crate::{
> +    acpi,
> +    device,
> +    devres,
> +    driver,
> +    error::{from_result, to_result, VTABLE_DEFAULT_ERROR},
> +    of,
> +    prelude::*,
> +    sync::Completion,
> +    time::{msecs_to_jiffies, Jiffies, Msecs},
> +    types::{AlwaysRefCounted, ForeignOwnable, Opaque}, //
> +};
> +
> +use core::{
> +    cell::UnsafeCell,
> +    marker::PhantomData,
> +    mem::offset_of,
> +    num::NonZero,
> +    ptr::NonNull, //
> +};
> +
> +/// Parity bit to use with a serial device.
> +#[repr(u32)]
> +pub enum Parity {
> +    /// No parity bit.
> +    None =3D bindings::serdev_parity_SERDEV_PARITY_NONE,
> +    /// Even partiy.
> +    Even =3D bindings::serdev_parity_SERDEV_PARITY_EVEN,
> +    /// Odd parity.
> +    Odd =3D bindings::serdev_parity_SERDEV_PARITY_ODD,
> +}
> +
> +/// Timeout in Jiffies.
> +pub enum Timeout {
> +    /// Wait for a specific amount of [`Jiffies`].
> +    Jiffies(NonZero<Jiffies>),
> +    /// Wait for a specific amount of [`Msecs`].
> +    Milliseconds(NonZero<Msecs>),
> +    /// Wait as long as possible.
> +    ///
> +    /// This is equivalent to [`kernel::task::MAX_SCHEDULE_TIMEOUT`].
> +    Max,
> +}
> +
> +impl Timeout {
> +    fn into_jiffies(self) -> isize {
> +        match self {
> +            Self::Jiffies(value) =3D> value.get().try_into().unwrap_or_d=
efault(),
> +            Self::Milliseconds(value) =3D> {
> +                msecs_to_jiffies(value.get()).try_into().unwrap_or_defau=
lt()
> +            }
> +            Self::Max =3D> 0,
> +        }
> +    }
> +}
> +
> +/// An adapter for the registration of serial device bus device drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY:
> +// - `bindings::serdev_device_driver` is a C type declared as `repr(C)`.
> +// - `Drvdata<T>` is the type of the driver's device private data.
> +// - `struct serdev_device_driver` embeds a `struct device_driver`.
> +// - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `=
struct device_driver`.
> +unsafe impl<T: Driver + 'static> driver::DriverLayout for Adapter<T> {
> +    type DriverType =3D bindings::serdev_device_driver;
> +    type DriverData =3D T;
> +    const DEVICE_DRIVER_OFFSET: usize =3D core::mem::offset_of!(Self::Dr=
iverType, driver);
> +}
> +
> +// SAFETY: A call to `unregister` for a given instance of `DriverType` i=
s guaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> =
{
> +    unsafe fn register(
> +        sdrv: &Opaque<Self::DriverType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        let of_table =3D match T::OF_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };
> +
> +        let acpi_table =3D match T::ACPI_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };
> +
> +        // SAFETY: It's safe to set the fields of `struct serdev_device_=
driver` on initialization.
> +        unsafe {
> +            (*sdrv.get()).driver.name =3D name.as_char_ptr();
> +            (*sdrv.get()).probe =3D Some(Self::probe_callback);
> +            (*sdrv.get()).remove =3D Some(Self::remove_callback);
> +            (*sdrv.get()).driver.of_match_table =3D of_table;
> +            (*sdrv.get()).driver.acpi_match_table =3D acpi_table;
> +        }
> +
> +        // SAFETY: `sdrv` is guaranteed to be a valid `DriverType`.
> +        to_result(unsafe { bindings::__serdev_device_driver_register(sdr=
v.get(), module.0) })
> +    }
> +
> +    unsafe fn unregister(sdrv: &Opaque<Self::DriverType>) {
> +        // SAFETY: `sdrv` is guaranteed to be a valid `DriverType`.
> +        unsafe { bindings::serdev_device_driver_unregister(sdrv.get()) }=
;
> +    }
> +}
> +
> +#[pin_data]
> +struct PrivateData {
> +    #[pin]
> +    probe_complete: Completion,
> +    error: UnsafeCell<bool>,
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    const OPS: &'static bindings::serdev_device_ops =3D &bindings::serde=
v_device_ops {
> +        receive_buf: if T::HAS_RECEIVE {
> +            Some(Self::receive_buf_callback)
> +        } else {
> +            None
> +        },
> +        write_wakeup: Some(bindings::serdev_device_write_wakeup),
> +    };
> +
> +    extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> =
kernel::ffi::c_int {
> +        // SAFETY: The serial device bus only ever calls the probe callb=
ack with a valid pointer to
> +        // a `struct serdev_device`.
> +        //
> +        // INVARIANT: `sdev` is valid for the duration of `probe_callbac=
k()`.
> +        let sdev =3D unsafe { &*sdev.cast::<Device<device::CoreInternal>=
>() };
> +        let id_info =3D <Self as driver::Adapter>::id_info(sdev.as_ref()=
);
> +
> +        from_result(|| {
> +            let private_data =3D devres::register(
> +                sdev.as_ref(),
> +                try_pin_init!(PrivateData {
> +                    probe_complete <- Completion::new(),
> +                    error: false.into(),
> +                }),
> +                GFP_KERNEL,
> +            )?;
> +
> +            // SAFETY: `sdev.as_raw()` is guaranteed to be a valid point=
er to `serdev_device`.
> +            unsafe {
> +                (*sdev.as_raw()).private_data =3D
> +                    (&raw const *private_data).cast::<c_void>().cast_mut=
()
> +            };
> +
> +            // SAFETY: `sdev.as_raw()` is guaranteed to be a valid point=
er to `serdev_device`.
> +            unsafe { bindings::serdev_device_set_client_ops(sdev.as_raw(=
), Self::OPS) };
> +
> +            // SAFETY: The serial device bus only ever calls the probe c=
allback with a valid pointer
> +            // to a `serdev_device`.
> +            to_result(unsafe {
> +                bindings::devm_serdev_device_open(sdev.as_ref().as_raw()=
, sdev.as_raw())
> +            })?;
> +
> +            let data =3D T::probe(sdev, id_info);
> +            let result =3D sdev.as_ref().set_drvdata(data);
> +
> +            // SAFETY: We have exclusive access to `private_data.error`.
> +            unsafe { *private_data.error.get() =3D result.is_err() };
> +
> +            private_data.probe_complete.complete_all();
> +
> +            result.map(|()| 0)
> +        })
> +    }
> +
> +    extern "C" fn remove_callback(sdev: *mut bindings::serdev_device) {
> +        // SAFETY: The serial device bus only ever calls the remove call=
back with a valid pointer
> +        // to a `struct serdev_device`.
> +        //
> +        // INVARIANT: `sdev` is valid for the duration of `remove_callba=
ck()`.
> +        let sdev =3D unsafe { &*sdev.cast::<Device<device::CoreInternal>=
>() };
> +
> +        // SAFETY: `remove_callback` is only ever called after a success=
ful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drv=
data()` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        let data =3D unsafe { sdev.as_ref().drvdata_borrow::<T>() };
> +
> +        T::unbind(sdev, data);
> +
> +        // SAFETY:
> +        // - `sdev.as_raw()` is guaranteed to be a pointer to a valid `s=
erdev_device`.
> +        // - `remove_callback` is only ever called after a successful ca=
ll to
> +        //   `probe_callback`, hence it's guaranteed that `private_data`=
 is a valid pointer to
> +        //   `PrivateData` and is stored in a `Pin<KBox<PrivateData>>`.
> +        // - `private_data` will not be accessed after this function.
> +        drop(unsafe { <Pin<KBox<PrivateData>>>::from_foreign((*sdev.as_r=
aw()).private_data) });
It seems I forgot to remove this drop statement. Please ignore it.

Thanks
- Markus Probst

> +    }
> +
> +    extern "C" fn receive_buf_callback(
> +        sdev: *mut bindings::serdev_device,
> +        buf: *const u8,
> +        length: usize,
> +    ) -> usize {
> +        // SAFETY: The serial device bus only ever calls the receive buf=
 callback with a valid
> +        // pointer to a `struct serdev_device`.
> +        //
> +        // INVARIANT: `sdev` is valid for the duration of `receive_buf_c=
allback()`.
> +        let sdev =3D unsafe { &*sdev.cast::<Device<device::CoreInternal>=
>() };
> +
> +        // SAFETY: `receive_buf_callback` is only ever called after a su=
ccessful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drv=
data()` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        let data =3D unsafe { sdev.as_ref().drvdata_borrow::<T>() };
> +
> +        // SAFETY:
> +        // - The serial device bus only ever calls the receive buf callb=
ack with a valid pointer to
> +        //   a `struct serdev_device`.
> +        // - `receive_buf_callback` is only ever called after a successf=
ul call to
> +        //   `probe_callback`, hence it's guaranteed that `sdev.private_=
data` is a pointer
> +        //   to a valid `PrivateData`.
> +        let private_data =3D unsafe { &*(*sdev.as_raw()).private_data.ca=
st::<PrivateData>() };
> +
> +        private_data.probe_complete.complete_all();
> +
> +        // SAFETY: No one has exclusive access to `private_data.error`.
> +        if unsafe { *private_data.error.get() } {
> +            return length;
> +        }
> +
> +        // SAFETY: `buf` is guaranteed to be non-null and has the size o=
f `length`.
> +        let buf =3D unsafe { core::slice::from_raw_parts(buf, length) };
> +
> +        T::receive(sdev, data, buf)
> +    }
> +}
> +
> +impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
> +    type IdInfo =3D T::IdInfo;
> +
> +    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
> +        T::OF_ID_TABLE
> +    }
> +
> +    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
> +        T::ACPI_ID_TABLE
> +    }
> +}
> +
> +/// Declares a kernel module that exposes a single serial device bus dev=
ice driver.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// kernel::module_serdev_device_driver! {
> +///     type: MyDriver,
> +///     name: "Module name",
> +///     authors: ["Author name"],
> +///     description: "Description",
> +///     license: "GPL v2",
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! module_serdev_device_driver {
> +    ($($f:tt)*) =3D> {
> +        $crate::module_driver!(<T>, $crate::serdev::Adapter<T>, { $($f)*=
 });
> +    };
> +}
> +
> +/// The serial device bus device driver trait.
> +///
> +/// Drivers must implement this trait in order to get a serial device bu=
s device driver registered.
> +///
> +/// # Examples
> +///
> +///```
> +/// # use kernel::{
> +///     acpi,
> +///     bindings,
> +///     device::{
> +///         Bound,
> +///         Core, //
> +///     },
> +///     of,
> +///     serdev, //
> +/// };
> +///
> +/// struct MyDriver;
> +///
> +/// kernel::of_device_table!(
> +///     OF_TABLE,
> +///     MODULE_OF_TABLE,
> +///     <MyDriver as serdev::Driver>::IdInfo,
> +///     [
> +///         (of::DeviceId::new(c"test,device"), ())
> +///     ]
> +/// );
> +///
> +/// kernel::acpi_device_table!(
> +///     ACPI_TABLE,
> +///     MODULE_ACPI_TABLE,
> +///     <MyDriver as serdev::Driver>::IdInfo,
> +///     [
> +///         (acpi::DeviceId::new(c"LNUXBEEF"), ())
> +///     ]
> +/// );
> +///
> +/// #[vtable]
> +/// impl serdev::Driver for MyDriver {
> +///     type IdInfo =3D ();
> +///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D Some(&O=
F_TABLE);
> +///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Som=
e(&ACPI_TABLE);
> +///
> +///     fn probe(
> +///         sdev: &serdev::Device<Core>,
> +///         _id_info: Option<&Self::IdInfo>,
> +///     ) -> impl PinInit<Self, Error> {
> +///         sdev.set_baudrate(115200);
> +///         sdev.write_all(b"Hello\n", serdev::Timeout::Max)?;
> +///         Ok(MyDriver)
> +///     }
> +/// }
> +///```
> +#[vtable]
> +pub trait Driver: Send {
> +    /// The type holding driver private data about each device id suppor=
ted by the driver.
> +    // TODO: Use associated_type_defaults once stabilized:
> +    //
> +    // ```
> +    // type IdInfo: 'static =3D ();
> +    // ```
> +    type IdInfo: 'static;
> +
> +    /// The table of OF device ids supported by the driver.
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// The table of ACPI device ids supported by the driver.
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// Serial device bus device driver probe.
> +    ///
> +    /// Called when a new serial device bus device is added or discovere=
d.
> +    /// Implementers should attempt to initialize the device here.
> +    fn probe(
> +        sdev: &Device<device::Core>,
> +        id_info: Option<&Self::IdInfo>,
> +    ) -> impl PinInit<Self, Error>;
> +
> +    /// Serial device bus device driver unbind.
> +    ///
> +    /// Called when a [`Device`] is unbound from its bound [`Driver`]. I=
mplementing this callback
> +    /// is optional.
> +    ///
> +    /// This callback serves as a place for drivers to perform teardown =
operations that require a
> +    /// `&Device<Core>` or `&Device<Bound>` reference. For instance.
> +    ///
> +    /// Otherwise, release operations for driver resources should be per=
formed in `Self::drop`.
> +    fn unbind(sdev: &Device<device::Core>, this: Pin<&Self>) {
> +        let _ =3D (sdev, this);
> +    }
> +
> +    /// Serial device bus device data receive callback.
> +    ///
> +    /// Called when data got received from device.
> +    ///
> +    /// Returns the number of bytes accepted.
> +    fn receive(sdev: &Device<device::Bound>, this: Pin<&Self>, data: &[u=
8]) -> usize {
> +        let _ =3D (sdev, this, data);
> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }
> +}
> +
> +/// The serial device bus device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct serde=
v_device`. The
> +/// implementation abstracts the usage of an already existing C `struct =
serdev_device` within Rust
> +/// code that we get passed from the C side.
> +///
> +/// # Invariants
> +///
> +/// A [`Device`] instance represents a valid `struct serdev_device` crea=
ted by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct Device<Ctx: device::DeviceContext =3D device::Normal>(
> +    Opaque<bindings::serdev_device>,
> +    PhantomData<Ctx>,
> +);
> +
> +impl<Ctx: device::DeviceContext> Device<Ctx> {
> +    fn as_raw(&self) -> *mut bindings::serdev_device {
> +        self.0.get()
> +    }
> +}
> +
> +impl Device<device::Bound> {
> +    /// Set the baudrate in bits per second.
> +    ///
> +    /// Common baudrates are 115200, 9600, 19200, 57600, 4800.
> +    ///
> +    /// Use [`Device::write_flush`] before calling this if you have writ=
ten data prior to this call.
> +    pub fn set_baudrate(&self, speed: u32) -> Result<(), u32> {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `serdev_device`.
> +        let ret =3D unsafe { bindings::serdev_device_set_baudrate(self.a=
s_raw(), speed) };
> +        if ret =3D=3D speed {
> +            Ok(())
> +        } else {
> +            Err(ret)
> +        }
> +    }
> +
> +    /// Set if flow control should be enabled.
> +    ///
> +    /// Use [`Device::write_flush`] before calling this if you have writ=
ten data prior to this call.
> +    pub fn set_flow_control(&self, enable: bool) {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `serdev_device`.
> +        unsafe { bindings::serdev_device_set_flow_control(self.as_raw(),=
 enable) };
> +    }
> +
> +    /// Set parity to use.
> +    ///
> +    /// Use [`Device::write_flush`] before calling this if you have writ=
ten data prior to this call.
> +    pub fn set_parity(&self, parity: Parity) -> Result {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `serdev_device`.
> +        to_result(unsafe { bindings::serdev_device_set_parity(self.as_ra=
w(), parity as u32) })
> +    }
> +
> +    /// Write data to the serial device until the controller has accepte=
d all the data or has
> +    /// been interrupted by a timeout or signal.
> +    ///
> +    /// Note that any accepted data has only been buffered by the contro=
ller. Use
> +    /// [ Device::wait_until_sent`] to make sure the controller write bu=
ffer has actually been
> +    /// emptied.
> +    ///
> +    /// Returns the number of bytes written (less than `data.len()` if i=
nterrupted).
> +    /// [`kernel::error::code::ETIMEDOUT`] or [`kernel::error::code::ERE=
STARTSYS`] if interrupted
> +    /// before any bytes were written.
> +    pub fn write_all(&self, data: &[u8], timeout: Timeout) -> Result<usi=
ze> {
> +        // SAFETY:
> +        // - `self.as_raw()` is guaranteed to be a pointer to a valid `s=
erdev_device`.
> +        // - `data.as_ptr()` is guaranteed to be a valid array pointer w=
ith the size of
> +        //   `data.len()`.
> +        let ret =3D unsafe {
> +            bindings::serdev_device_write(
> +                self.as_raw(),
> +                data.as_ptr(),
> +                data.len(),
> +                timeout.into_jiffies(),
> +            )
> +        };
> +        // CAST: negative return values are guaranteed to be between `-M=
AX_ERRNO` and `-1`,
> +        // which always fit into a `i32`.
> +        to_result(ret as i32).map(|()| ret.unsigned_abs())
> +    }
> +
> +    /// Write data to the serial device.
> +    ///
> +    /// If you want to write until the controller has accepted all the d=
ata, use
> +    /// [`Device::write_all`].
> +    ///
> +    /// Note that any accepted data has only been buffered by the contro=
ller. Use
> +    /// [ Device::wait_until_sent`] to make sure the controller write bu=
ffer has actually been
> +    /// emptied.
> +    ///
> +    /// Returns the number of bytes written (less than `data.len()` if n=
ot enough room in the
> +    /// write buffer).
> +    pub fn write(&self, data: &[u8]) -> Result<u32> {
> +        // SAFETY:
> +        // - `self.as_raw()` is guaranteed to be a pointer to a valid `s=
erdev_device`.
> +        // - `data.as_ptr()` is guaranteed to be a valid array pointer w=
ith the size of
> +        //   `data.len()`.
> +        let ret =3D
> +            unsafe { bindings::serdev_device_write_buf(self.as_raw(), da=
ta.as_ptr(), data.len()) };
> +
> +        to_result(ret as i32).map(|()| ret.unsigned_abs())
> +    }
> +
> +    /// Send data to the serial device immediately.
> +    ///
> +    /// Note that this doesn't guarantee that the data has been transmit=
ted.
> +    /// Use [`Device::wait_until_sent`] for this purpose.
> +    pub fn write_flush(&self) {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `serdev_device`.
> +        unsafe { bindings::serdev_device_write_flush(self.as_raw()) };
> +    }
> +
> +    /// Wait for the data to be sent.
> +    ///
> +    /// After this function, the write buffer of the controller should b=
e empty.
> +    pub fn wait_until_sent(&self, timeout: Timeout) {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `serdev_device`.
> +        unsafe { bindings::serdev_device_wait_until_sent(self.as_raw(), =
timeout.into_jiffies()) };
> +    }
> +}
> +
> +// SAFETY: `serdev::Device` is a transparent wrapper of `struct serdev_d=
evice`.
> +// The offset is guaranteed to point to a valid device field inside `ser=
dev::Device`.
> +unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Dev=
ice<Ctx> {
> +    const OFFSET: usize =3D offset_of!(bindings::serdev_device, dev);
> +}
> +
> +// SAFETY: `Device` is a transparent wrapper of a type that doesn't depe=
nd on `Device`'s generic
> +// argument.
> +kernel::impl_device_context_deref!(unsafe { Device });
> +kernel::impl_device_context_into_aref!(Device);
> +
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        self.as_ref().inc_ref();
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.
> +        unsafe { bindings::serdev_device_put(obj.cast().as_ptr()) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<C=
tx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct serdev_device`.
> +        let dev =3D unsafe { &raw mut (*self.as_raw()).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +// SAFETY: A `Device` is always reference-counted and can be released fr=
om any thread.
> +unsafe impl Send for Device {}
> +
> +// SAFETY: `Device` can be shared among threads because all methods of `=
Device`
> +// (i.e. `Device<Normal>) are thread safe.
> +unsafe impl Sync for Device {}

--=-PF5TUwaOf//AV1lgh2Mq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmrOsMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSsiIQALNGzqaENBsRwZBmeBI1
WUFd9PW909Cy0jf6XQkCrdBEephIjoldQtNKI2UjuqkhHg+fO7vrty1gwirgbl2E
Au3wcnG4cJOflXMEvuIBAL0j9ZtgOX1qEEdBFzgbcF9C4C3klIFdsLlN4IKf3vxw
ajKSFieSHQLRkHXsBs8OCDYblifsUZtgf/60J4LHN6Wqq40Op57Ld6oLDr2hqsLo
t+qPvrsWIQleDTW4nua55VlIJF+3gNkZ2VsQcMOtFZ+qZC6G/NtCPCR1W/KUb8Fs
23oHC5P6EVnk7HGAeTji+KMN2FqZBkvsIJNozgqxhxWNy5gsVxhCAMTjHDIU2YUI
U1559f8FzCyOmbV0FoCPipG7jVmwlkBVdoluWeMUBLmsJz6VUXgeSLCA4vceak6k
LccczD70O0TcO3W/tq0VLeaWk00Sbqbd2U/Uv2sQdAsRazr1H7G7nJ72h/ay7ipq
CFEqEfUMxWPkcAGJD99cPtYiRTSub+LkNqR7kiuhZrB4T8QICqfMPfsTVmcYaKAx
8hAN02X6Pta7csUwa8RWJ5u/BVj6EW1ooQfY0rKHxAFvKpYtFCLnt0DVeVM8Z7+P
qiQT043EobkaL40/Tz9HnxzOGTiX67FCLLsqDP1k9pT48p7/qBYnjIjWHo1F+wJH
ovfLDdFhdjHw3b+3pFzT6Vw8
=wCue
-----END PGP SIGNATURE-----

--=-PF5TUwaOf//AV1lgh2Mq--
