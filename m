Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A76B7FB5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2633010E5F6;
	Mon, 13 Mar 2023 17:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D4810E5F6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 17:50:09 +0000 (UTC)
Received: from 2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 (2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:c4a8:7e10:391:f3ff])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gfxstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C57FB6602179;
 Mon, 13 Mar 2023 17:50:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678729807;
 bh=xAoSrt6ok3rZEBjY+weW5rQvZBVH8IFHlHFW3Km1xIE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oSWXTgrlnOu+4tRAuaTAhAxxQPeXH9BthRHi10Q9cQbXmnkh3bucEb9d2wQJZCWD1
 1z2j9H6C9DXjOv5OEyK4Sj2jinbBdVER4qizvl/SDiNngN4X2GK8ibY5HMN/jUiM0K
 Lgb6wuw6jRM3dxATRJR2vIIU09devvxy61sEzOWeK1nF1Hze8dC35r9dSuGxJ6P9Yc
 ubFZnsGEb/WR1Wv+c0FzKfGuK2UsjxOC/6d/SCbm6mqA6pSMvvmy447L/+HmcuH2gC
 fdCmebbYSohZS2wJXNt1zOCWQ2qcBzDZexbOxd7dTRFDn4ZnANbAx4hk0gT+L5AsRJ
 FJff+kwAI+EYA==
Message-ID: <5a0db63c043adc47b289b3f1d22935a0a63c926e.camel@collabora.com>
Subject: Re: [PATCH RFC 03/18] rust: drm: file: Add File abstraction
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: Asahi Lina <lina@asahilina.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Luben Tuikov <luben.tuikov@amd.com>, Jarkko
 Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Date: Mon, 13 Mar 2023 12:49:57 -0500
In-Reply-To: <28fa3f97-4c7c-212e-2be2-fb1c05f7f576@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-3-917ff5bc80a8@asahilina.net>
 <9ba89e97155400fb379f5101ccb8960d0bcbc025.camel@collabora.com>
 <28fa3f97-4c7c-212e-2be2-fb1c05f7f576@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2023-03-10 at 07:16 +0900, Asahi Lina wrote:
> On 10/03/2023 06.16, Faith Ekstrand wrote:
> > On Tue, 2023-03-07 at 23:25 +0900, Asahi Lina wrote:
> > > A DRM File is the DRM counterpart to a kernel file structure,
> > > representing an open DRM file descriptor. Add a Rust abstraction
> > > to
> > > allow drivers to implement their own File types that implement
> > > the
> > > DriverFile trait.
> > >=20
> > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > ---
> > > =C2=A0rust/bindings/bindings_helper.h |=C2=A0=C2=A0 1 +
> > > =C2=A0rust/kernel/drm/drv.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 ++-
> > > =C2=A0rust/kernel/drm/file.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 113
> > > ++++++++++++++++++++++++++++++++++++++++
> > > =C2=A0rust/kernel/drm/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A04 files changed, 120 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/rust/bindings/bindings_helper.h
> > > b/rust/bindings/bindings_helper.h
> > > index 2a999138c4ae..7d7828faf89c 100644
> > > --- a/rust/bindings/bindings_helper.h
> > > +++ b/rust/bindings/bindings_helper.h
> > > @@ -8,6 +8,7 @@
> > > =C2=A0
> > > =C2=A0#include <drm/drm_device.h>
> > > =C2=A0#include <drm/drm_drv.h>
> > > +#include <drm/drm_file.h>
> > > =C2=A0#include <drm/drm_ioctl.h>
> > > =C2=A0#include <linux/delay.h>
> > > =C2=A0#include <linux/device.h>
> > > diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> > > index 29a465515dc9..1dcb651e1417 100644
> > > --- a/rust/kernel/drm/drv.rs
> > > +++ b/rust/kernel/drm/drv.rs
> > > @@ -144,6 +144,9 @@ pub trait Driver {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 /// Should be either `drm::gem::Object<T>` o=
r
> > > `drm::gem::shmem::Object<T>`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 type Object: AllocImpl;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0 /// The type used to represent a DRM File (client=
)
> > > +=C2=A0=C2=A0=C2=A0 type File: drm::file::DriverFile;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0 /// Driver metadata
> > > =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: DriverInfo;
> > > =C2=A0
> > > @@ -213,8 +216,8 @@ macro_rules! drm_device_register {
> > > =C2=A0impl<T: Driver> Registration<T> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 const VTABLE: bindings::drm_driver =3D drm_l=
egacy_fields! {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 load: None,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open: None, // TODO: File=
 abstraction
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 postclose: None, // TODO:=
 File abstraction
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open: Some(drm::file::ope=
n_callback::<T::File>),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 postclose:
> > > Some(drm::file::postclose_callback::<T::File>),
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lastclose: None,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unload: None,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release: None,
> > > diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
> > > new file mode 100644
> > > index 000000000000..48751e93c38a
> > > --- /dev/null
> > > +++ b/rust/kernel/drm/file.rs
> > > @@ -0,0 +1,113 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +
> > > +//! DRM File objects.
> > > +//!
> > > +//! C header:
> > > [`include/linux/drm/drm_file.h`](../../../../include/linux/drm/dr
> > > m_fi
> > > le.h)
> > > +
> > > +use crate::{bindings, drm, error::Result};
> > > +use alloc::boxed::Box;
> > > +use core::marker::PhantomData;
> > > +use core::ops::Deref;
> > > +
> > > +/// Trait that must be implemented by DRM drivers to represent a
> > > DRM
> > > File (a client instance).
> > > +pub trait DriverFile {
> > > +=C2=A0=C2=A0=C2=A0 /// The parent `Driver` implementation for this
> > > `DriverFile`.
> > > +=C2=A0=C2=A0=C2=A0 type Driver: drm::drv::Driver;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /// Open a new file (called when a client opens t=
he DRM
> > > device).
> > > +=C2=A0=C2=A0=C2=A0 fn open(device: &drm::device::Device<Self::Driver=
>) ->
> > > Result<Box<Self>>;
> > > +}
> > > +
> > > +/// An open DRM File.
> > > +///
> > > +/// # Invariants
> > > +/// `raw` is a valid pointer to a `drm_file` struct.
> > > +#[repr(transparent)]
> > > +pub struct File<T: DriverFile> {
> > > +=C2=A0=C2=A0=C2=A0 raw: *mut bindings::drm_file,
> > > +=C2=A0=C2=A0=C2=A0 _p: PhantomData<T>,
> > > +}
> > > +
> > > +pub(super) unsafe extern "C" fn open_callback<T: DriverFile>(
> > > +=C2=A0=C2=A0=C2=A0 raw_dev: *mut bindings::drm_device,
> > > +=C2=A0=C2=A0=C2=A0 raw_file: *mut bindings::drm_file,
> > > +) -> core::ffi::c_int {
> > > +=C2=A0=C2=A0=C2=A0 let drm =3D core::mem::ManuallyDrop::new(unsafe {
> > > drm::device::Device::from_raw(raw_dev) });
> >=20
> > Maybe you can help educate me a bit here... This feels like a
> > really
> > sketchy pattern.=C2=A0 We're creating a Device from a pointer, an
> > operation
> > which inherently consumes a reference but then marking it
> > ManuallyDrop
> > so drm_device_put() never gets called.=C2=A0 It took me a while but I
> > think
> > I figured out what you're trying to do: Make it so all the Rust
> > stuff
> > works with Device, not drm_device but it still feels really wrong.=C2=
=A0
> > It
> > works, it just feels like there's a lot of unsafe abstraction
> > juggling
> > happening here and I expect this operation is going to be pretty
> > common
> > in the Rust abstraction layer.
>=20
> So I think this is going to be a pretty common pattern in this kind
> of
> abstraction. The problem is that, of course, in C there is no
> distinction between an owned reference and a borrowed one. Here we
> have
> a borrowed reference to a struct drm_device, and we need to turn it
> into
> a &Device (which is the Rust equivalent type). But for &Device to
> exist
> we need a Device to exist in the first place, and Device normally
> implies ownership of the underlying drm_device.

Thanks! Putting it in terms of borrow really helps clear up the
difference.

> We could just acquire a reference here, but then we're needlessly
> grabbing a ref only to drop it at the end of the function, which is
> pointless when the caller is holding another reference for us while
> the
> callback runs. And of course Rust likes to claim to offer zero-cost
> abstractions, so it would be kind of sad to have to do that... ^^

Yeah, I agree we don't want to take extra references.

> Just doing drm::device::Device::from_raw(raw_dev) is a ticking time
> bomb, because we haven't acquired a reference (which would normally
> be
> required). If that Device ever gets dropped, we've messed up the
> refcounting and stolen the caller's reference. We could try to ensure
> it
> gets passed to core::mem::forget in all paths out, but that gets
> error-prone very quickly when trying to cover error paths. So
> instead,
> we put it into a ManuallyDrop. That takes care of neutering the ref
> drop, so we don't have to worry about messing that up. Then the only
> remaining safety requirement is that that the ManuallyDrop<Device>
> never
> escape the callback function, and that's easy to ensure: we only pass
> a
> &ref to the user (which via auto-deref ends up being a &Device), and
> then nothing bad can happen. If the user wants an owned reference to
> the
> device to keep around, they can call .clone() on it and that's when
> the
> incref happens.
>=20
> Basically, ManuallyDrop<T> where T is a reference counted type
> represents a borrowed reference to a T coming from the C side. You
> can
> see another use of this pattern in gem::Object, which contains a
> ManuallyDrop<Device> that represents a borrowed reference to the
> device
> that owns that object. The DRM core (as far as I know!) guarantees
> that
> DRM devices outlive all of their GEM objects, so we can materialize a
> borrowed reference and as long as it never leaves the GEM object, it
> will be sound. Then we can take &Device references from it whenever
> we
> want, and the usual Rust borrow checker rules ensure we can't do
> something illegal.

Ok, that all matches my understanding of what I thought was going on. I
do wonder if it would be good to wrap this up in a

struct DeviceBorrow {
   dev: ManuallyDrop<Device>
}

impl DeviceBorrow {
   pub unsafe fn from_raw(*mut bindings::drm_device) -> DeviceBorrow;
}

impl Deref<Device> for DeviceBorrow {
   ...
}

with documentation, etc.  Seeing a ManuallyDrop which is never dropped
sets my rust senses tingling.  Maybe that's too much typing for each
object?  I don't want to add a bunch of extra work but this seems like
a pretty common pattern we're going to hit everywhere.

~Faith
