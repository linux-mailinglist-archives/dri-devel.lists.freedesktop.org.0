Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F159E59B4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE4510E3BD;
	Thu,  5 Dec 2024 15:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LzxdZBZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038A410E3BD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:30:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733412607; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V5EHsqKRMXqE2nUOGvFU2jOOUzIp/pRR6tcEqX2oJapOvHygW9zJqIaQ1VXLuPMH+gHLkN94yxzyunri8gf67MqROXzUQnEc8IUzty3SAS8fKvT+2aR+rqsc1mKc56vIsMK26rN/uXMSFy6gZm0GOhzuT/DTEIx1A8l5Svj0Ryg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733412607;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ao2UlA9D5zYNkRb26w2mSmGbiR50MLqfuY2Is6j0DkA=; 
 b=gAek+vm0F5BUFrZ70IxrQhFXR/2pOZ4PSIpBPjHI5ok+L5HcVFfWMnKxd8gqH8FnANsBvyGi+7e8+LNUe8vsryEvozPfa9A7W/DJsvxSZtkkD+UPhyHIeIMRCerbME95jxKkvmI+l572tFj6Wj3zVaeaRhtUXtQIliNAfJlZbGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733412607; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Ao2UlA9D5zYNkRb26w2mSmGbiR50MLqfuY2Is6j0DkA=;
 b=LzxdZBZpK9/kIv3uBS3iUoLByS24+GgboZo5R51o8YZnwnlXBKz63RRq+HbRmD5Y
 Oh1IFycTpZ+/4sd2h5lPMfiySn5SggynH1CVnOVsnWkNETl2Uwc/hFJfMB3XEltSPpM
 ax6cub9iH/nehfTV8eb04Gbo5uOKg+p7KoiGJOwg=
Received: by mx.zohomail.com with SMTPS id 1733412605170227.73946059541254;
 Thu, 5 Dec 2024 07:30:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 33/35] WIP: rust: drm/kms: Add VblankSupport
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-34-lyude@redhat.com>
Date: Thu, 5 Dec 2024 12:29:45 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD0FB134-5FFD-419A-9B66-85ED2EB6554A@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-34-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-ZohoMailClient: External
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

Hi Lyude,

> On 30 Sep 2024, at 20:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This commit adds bindings for implementing vblank support for a =
driver's
> CRTCs. These bindings are optional, to account for the fact that not =
all
> drivers have dedicated hardware vblanks.
>=20
> In order to accomplish this, we introduce the VblankSupport trait =
which can
> be implemented on DriverCrtc by drivers which support vblanks. This =
works
> in the same way as the main Kms trait - drivers which don't support
> hardware vblanks can simply pass PhantomData<Self> to the associated =
type
> on DriverCrtc. If a driver chooses to implement VblankSupport, =
VblankImpl
> will be implemented by DRM automatically - and can be passed to the
> VblankImpl associated type on DriverCrtc.
>=20
> Additionally, we gate methods which only apply to vblank-supporting =
drivers
> by introducing a VblankDriverCrtc trait that is automatically =
implemented
> by DRM for CRTC drivers implementing VblankSupport. This works =
basically in
> the same way as Kms and KmsDriver, but for CRTCs.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> Notes:
>=20
> * One thing to keep in mind: this trait is implemented on the CRTC as
>  opposed to the KMS driver due to the possibility that a driver may =
have
>  multiple different types of CRTCs. As a result, it's not impossible =
that
>  there could potentially be differences in each type's vblank hardware
>  implementation. In theory this could lead to a driver mistakenly only
>  implementing VblankSupport for some CRTCs and not others, which isn't
>  really defined behavior in DRM. As such, one of the dependencies in =
the
>  branch for this patch series preview is a fix to ensure that DRM
>  disallows registering drivers that make this mistake.
>=20
> TODO:
>=20
> * Technically this patch introduces a soundness issue. We currently =
allow
>  access to a kernel::drm::Device (through UnregisteredKmsDevice's =
Deref
>  implementation) within the kernel::drm::kms::Kms::create_objects =
trait
>  method. A caller could potentially access an uninitialized mutex by
>  calling Crtc::vblank_lock() within this context.
>  My solution for this is likely going to be adding unregistered =
variants
>  of Crtc and other mode-objects that don't have access to the full set =
of
>  methods on mode objects.

IIUC, you were already thinking about UnregisteredCrtcs in a previous =
commit
for a different reason, so this is all the more reason to have it.

>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h |   1 +
> rust/helpers/drm/drm.c          |   2 +
> rust/helpers/drm/vblank.c       |   8 +
> rust/kernel/drm/kms.rs          |  20 +-
> rust/kernel/drm/kms/crtc.rs     |  28 +-
> rust/kernel/drm/kms/vblank.rs   | 454 ++++++++++++++++++++++++++++++++
> 6 files changed, 505 insertions(+), 8 deletions(-)
> create mode 100644 rust/helpers/drm/vblank.c
> create mode 100644 rust/kernel/drm/kms/vblank.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 7c324003c3885..191eb24b32234 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -22,6 +22,7 @@
> #include <drm/drm_mode_object.h>
> #include <drm/drm_ioctl.h>
> #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> #include <kunit/test.h>
> #include <linux/blk-mq.h>
> #include <linux/blk_types.h>
> diff --git a/rust/helpers/drm/drm.c b/rust/helpers/drm/drm.c
> index 365f6807774d4..5d4498e01fd3e 100644
> --- a/rust/helpers/drm/drm.c
> +++ b/rust/helpers/drm/drm.c
> @@ -2,7 +2,9 @@
>=20
> #ifdef CONFIG_DRM_KMS_HELPER
> #include "atomic.c"
> +#include "vblank.c"
> #endif
> +
> #include "gem.c"
> #ifdef CONFIG_DRM_GEM_SHMEM_HELPER
> #include "gem_shmem_helper.c"
> diff --git a/rust/helpers/drm/vblank.c b/rust/helpers/drm/vblank.c
> new file mode 100644
> index 0000000000000..165db7ac5b4da
> --- /dev/null
> +++ b/rust/helpers/drm/vblank.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_vblank.h>
> +
> +struct drm_vblank_crtc *rust_helper_drm_crtc_vblank_crtc(struct =
drm_crtc *crtc)
> +{
> + return drm_crtc_vblank_crtc(crtc);
> +}
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index d0745b44ba9b6..e13f35d9e223f 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -9,6 +9,7 @@
> pub mod fbdev;
> pub mod framebuffer;
> pub mod plane;
> +pub mod vblank;
>=20
> use crate::{
>     drm::{
> @@ -28,6 +29,7 @@
>     ptr::{self, NonNull},
>     mem::{self, ManuallyDrop},
>     marker::PhantomData,
> +    cell::Cell,
> };
> use bindings;
>=20
> @@ -84,6 +86,13 @@ unsafe fn setup_fbdev(drm: &Device<Self::Driver>, =
mode_config_info: &ModeConfigI
> /// state required during the initialization process of a [`Device`].
> pub struct UnregisteredKmsDevice<'a, T: Driver> {
>     drm: &'a Device<T>,
> +    // TODO: Get rid of this - I think the solution we came up on the =
C side to just make it so that
> +    // DRM is a bit more consistent with verifying whether all CRTCs =
have this implemented or not -
> +    // meaning we don't need to keep track of this and can just make =
the vblank setup conditional on
> +    // the implementation of `VblankSupport`.
> +    // Note that this also applies to headless devices - those are =
literally the same but
> +    // `dev.num_crtc()` =3D 0
> +    pub(crate) has_vblanks: Cell<bool>,

Why `Cell` here? For interior mutability? Maybe it=E2=80=99d be good to =
add a comment explaining why.

Also, like I commented before, have you considered AtomicBool?

> }
>=20
> impl<'a, T: Driver> Deref for UnregisteredKmsDevice<'a, T> {
> @@ -103,6 +112,7 @@ impl<'a, T: Driver> UnregisteredKmsDevice<'a, T> {
>     pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
>         Self {
>             drm,
> +            has_vblanks: Cell::new(false)
>         }
>     }
> }
> @@ -190,6 +200,11 @@ unsafe fn setup_kms(drm: &Device<Self::Driver>) =
-> Result<ModeConfigInfo> {
>=20
>         T::create_objects(&drm)?;
>=20
> +        if drm.has_vblanks.get() {
> +            // SAFETY: `has_vblank` is only true if CRTCs with vblank =
support were registered
> +            to_result(unsafe { =
bindings::drm_vblank_init(drm.as_raw(), drm.num_crtcs()) })?;
> +        }
> +
>         // TODO: Eventually add a hook to customize how state readback =
happens, for now just reset
>         // SAFETY: Since all static modesetting objects were created =
in `T::create_objects()`, and
>         // that is the only place they can be created, this fulfills =
the C API requirements.
> @@ -262,10 +277,7 @@ pub fn num_plane(&self) -> u32 {
>         unsafe { (*self.as_raw()).mode_config.num_total_plane as u32 }
>     }
>=20
> -    /// Return the number of registered CRTCs
> -    /// TODO: while `num_crtc` is of i32, that type actually makes =
literally no sense here and just
> -    /// causes problems and unecessary casts. Same for num_plane(). =
So, fix that at some point (we
> -    /// will never get n < 0 anyway)
> +    /// Return the number of registered [`Crtc`](crtc::Crtc) objects =
on this [`Device`].

Maybe this change should be present in the patch that introduced =
`num_crtcs()`?

Also, you should keep the comment you had about the cast but using =
=E2=80=9C//=E2=80=9C above the actual statement,
not docs (i.e. =E2=80=9C///=E2=80=9C) on the fn item.

>     #[inline]
>     pub fn num_crtcs(&self) -> u32 {
>         // SAFETY:
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index ef1b331f742d0..74e7b666d828c 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -8,7 +8,8 @@
>     ModeObject,
>     StaticModeObject,
>     KmsDriver,
> -    UnregisteredKmsDevice
> +    UnregisteredKmsDevice,
> +    vblank::*
> };
> use crate::{
>     bindings,
> @@ -62,13 +63,13 @@ pub trait DriverCrtc: Send + Sync + Sized {
>             cursor_set2: None,
>             cursor_set: None,
>             destroy: Some(crtc_destroy_callback::<Self>),
> -            disable_vblank: None,
> +            disable_vblank: <Self::VblankImpl as =
VblankImpl>::VBLANK_OPS.disable_vblank,
>             early_unregister: None,
> -            enable_vblank: None,
> +            enable_vblank: <Self::VblankImpl as =
VblankImpl>::VBLANK_OPS.enable_vblank,
>             gamma_set: None, // TODO
>             get_crc_sources: None,
>             get_vblank_counter: None,
> -            get_vblank_timestamp: None,
> +            get_vblank_timestamp: <Self::VblankImpl as =
VblankImpl>::VBLANK_OPS.get_vblank_timestamp,
>             late_register: None,
>             page_flip: Some(bindings::drm_atomic_helper_page_flip),
>             page_flip_target: None,
> @@ -113,6 +114,12 @@ pub trait DriverCrtc: Send + Sync + Sized {
>     /// See [`DriverCrtcState`] for more info.
>     type State: DriverCrtcState;
>=20
> +    /// The driver's optional hardware vblank implementation
> +    ///
> +    /// See [`VblankSupport`] for more info. Drivers that don't care =
about this can just pass
> +    /// [`PhantomData<Self>`].
> +    type VblankImpl: VblankImpl<Crtc =3D Self>;
> +
>     /// The constructor for creating a [`Crtc`] using this =
[`DriverCrtc`] implementation.
>     ///
>     /// Drivers may use this to instantiate their [`DriverCrtc`] =
object.
> @@ -281,6 +288,10 @@ pub fn new<'a, 'b: 'a, P, C>(
>         P: DriverPlane<Driver =3D T::Driver>,
>         C: DriverPlane<Driver =3D T::Driver>
>     {
> +        if Self::has_vblank() {
> +            dev.has_vblanks.set(true)
> +        }
> +
>         let this =3D Box::try_pin_init(
>             try_pin_init!(Self {
>                 crtc: Opaque::new(bindings::drm_crtc {
> @@ -343,6 +354,15 @@ pub fn from_opaque<'a, D>(opaque: &'a =
OpaqueCrtc<D>) -> &'a Self
>         Self::try_from_opaque(opaque)
>             .expect("Passed OpaqueCrtc does not share this DriverCrtc =
implementation")
>     }
> +
> +    pub(crate) fn get_vblank_ptr(&self) -> *mut =
bindings::drm_vblank_crtc {
> +        // SAFETY: FFI Call with no special requirements
> +        unsafe { bindings::drm_crtc_vblank_crtc(self.as_raw()) }

Like elsewhere in this series, this =E2=80=9Cno special requirements=E2=80=
=9D is also a poor fit.

You should mention how as_raw() makes sure that we are passing in a =
valid pointer.

> +    }
> +
> +    pub(crate) const fn has_vblank() -> bool {
> +        T::OPS.funcs.enable_vblank.is_some()
> +    }
> }
>=20
> /// A trait implemented by any type that acts as a [`struct drm_crtc`] =
interface.
> diff --git a/rust/kernel/drm/kms/vblank.rs =
b/rust/kernel/drm/kms/vblank.rs
> new file mode 100644
> index 0000000000000..29dce38053a49
> --- /dev/null
> +++ b/rust/kernel/drm/kms/vblank.rs
> @@ -0,0 +1,454 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! Rust bindings for KMS vblank support
> +
> +use core::{
> +    marker::*,
> +    mem::{self, ManuallyDrop},
> +    ops::{Drop, Deref},
> +    ptr::{self, NonNull, null_mut}
> +};
> +use kernel::{
> +    time::Ktime,
> +    types::Opaque,
> +    error::{from_result, to_result},
> +    prelude::*,
> +    drm::device::Device,
> +    irq::*
> +};
> +use super::{
> +    crtc::*,
> +    KmsRef,
> +    ModeObject,
> +    KmsDriver,
> +};
> +use bindings;
> +
> +/// The main trait for a driver to implement hardware vblank support =
for a [`Crtc`].
> +///
> +/// # Invariants
> +///
> +/// C FFI callbacks generated using this trait can safely assume that =
input pointers to
> +/// [`struct drm_crtc`] are always contained within a =
[`Crtc<Self::Crtc>`].
> +///
> +/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
> +pub trait VblankSupport: Sized {
> +    /// The parent [`DriverCrtc`].
> +    type Crtc: VblankDriverCrtc<VblankImpl =3D Self>;
> +
> +    /// Enable vblank interrupts for this [`DriverCrtc`].
> +    fn enable_vblank(
> +        crtc: &Crtc<Self::Crtc>,
> +        vblank_guard: &VblankGuard<'_, Self::Crtc>,
> +        irq: IrqDisabled<'_>

Oh, this seems to depend on your spinlock irq series.

> +    ) -> Result;
> +
> +    /// Disable vblank interrupts for this [`DriverCrtc`].
> +    fn disable_vblank(
> +        crtc: &Crtc<Self::Crtc>,
> +        vblank_guard: &VblankGuard<'_, Self::Crtc>,

Can you add docs describing what this argument is for?

> +        irq: IrqDisabled<'_>
> +    );
> +
> +    /// Retrieve the current vblank timestamp for this [`Crtc`]
> +    ///
> +    /// If this function is being called from the driver's vblank =
interrupt handler,
> +    /// `handling_vblank_irq` will be [`Some`].

What will be Some? You probably refactored a bit and this is now stale.

Btw, this can apparently be called from different places with different =
semantics. Maybe
flesh out the docs some more?

> +    fn get_vblank_timestamp(
> +        crtc: &Crtc<Self::Crtc>,
> +        in_vblank_irq: bool,
> +    ) -> Option<VblankTimestamp>;
> +}
> +
> +/// Trait used for CRTC vblank (or lack there-of) implementations. =
Implemented internally.
> +///
> +/// Drivers interested in implementing vblank support should refer to =
[`VblankSupport`], drivers
> +/// that don't have vblank support can use [`PhantomData`].
> +pub trait VblankImpl {
> +    /// The parent [`DriverCrtc`].
> +    type Crtc: DriverCrtc<VblankImpl =3D Self>;
> +
> +    /// The generated [`VblankOps`].
> +    const VBLANK_OPS: VblankOps;
> +}
> +
> +/// C FFI callbacks for vblank management.
> +///
> +/// Created internally by DRM.
> +#[derive(Default)]
> +pub struct VblankOps {
> +    pub(crate) enable_vblank: Option<unsafe extern "C" fn(crtc: *mut =
bindings::drm_crtc) -> i32>,
> +    pub(crate) disable_vblank: Option<unsafe extern "C" fn(crtc: *mut =
bindings::drm_crtc)>,
> +    pub(crate) get_vblank_timestamp: Option<
> +        unsafe extern "C" fn(
> +            crtc: *mut bindings::drm_crtc,
> +            max_error: *mut i32,
> +            vblank_time: *mut bindings::ktime_t,
> +            in_vblank_irq: bool,
> +        ) -> bool
> +    >
> +}
> +
> +impl<T: VblankSupport> VblankImpl for T {
> +    type Crtc =3D T::Crtc;
> +
> +    const VBLANK_OPS: VblankOps =3D VblankOps {
> +        enable_vblank: Some(enable_vblank_callback::<T>),
> +        disable_vblank: Some(disable_vblank_callback::<T>),
> +        get_vblank_timestamp: =
Some(get_vblank_timestamp_callback::<T>)
> +    };
> +}
> +
> +impl<T> VblankImpl for PhantomData<T>
> +where
> +    T: DriverCrtc<VblankImpl =3D PhantomData<T>>
> +{
> +    type Crtc =3D T;
> +
> +    const VBLANK_OPS: VblankOps =3D VblankOps {
> +        enable_vblank: None,
> +        disable_vblank: None,
> +        get_vblank_timestamp: None,
> +    };
> +}
> +
> +unsafe extern "C" fn enable_vblank_callback<T: VblankSupport>(
> +    crtc: *mut bindings::drm_crtc,
> +) -> i32 {
> +    // SAFETY: We're guaranteed that `crtc` is of type =
`Crtc<T::Crtc>` by type invariants.
> +    let crtc =3D unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
> +
> +    // SAFETY: This callback happens with IRQs disabled
> +    let irq =3D unsafe { IrqDisabled::new() };
> +
> +    // SAFETY: This callback happens with `vbl_lock` already held
> +    let vblank_guard =3D ManuallyDrop::new(unsafe { =
VblankGuard::new(crtc, irq) });
> +
> +    from_result(|| T::enable_vblank(crtc, &vblank_guard, irq).map(|_| =
0))
> +}
> +
> +unsafe extern "C" fn disable_vblank_callback<T: VblankSupport>(
> +    crtc: *mut bindings::drm_crtc,
> +) {
> +    // SAFETY: We're guaranteed that `crtc` is of type =
`Crtc<T::Crtc>` by type invariants.
> +    let crtc =3D unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
> +
> +    // SAFETY: This callback happens with IRQs disabled
> +    let irq =3D unsafe { IrqDisabled::new() };
> +
> +    // SAFETY: This call happens with `vbl_lock` already held
> +    let vblank_guard =3D ManuallyDrop::new(unsafe { =
VblankGuard::new(crtc, irq) });

Every time you use ManuallyDrop, you should point out why you need it =
and
where the value will actually be dropped.

> +
> +    T::disable_vblank(crtc, &vblank_guard, irq);
> +}
> +
> +unsafe extern "C" fn get_vblank_timestamp_callback<T: VblankSupport>(
> +    crtc: *mut bindings::drm_crtc,
> +    max_error: *mut i32,
> +    vblank_time: *mut bindings::ktime_t,
> +    in_vblank_irq: bool
> +) -> bool {
> +    // SAFETY: We're guaranteed `crtc` is of type `Crtc<T::Crtc>` by =
type invariance
> +    let crtc =3D unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
> +
> +    if let Some(timestamp) =3D T::get_vblank_timestamp(crtc, =
in_vblank_irq) {
> +        // SAFETY: Both of these pointers are guaranteed by the C API =
to be valid
> +        unsafe {
> +            (*max_error) =3D timestamp.max_error;
> +            (*vblank_time) =3D timestamp.time.to_ns();
> +        };
> +
> +        true
> +    } else {
> +        false
> +    }
> +}
> +
> +/// A vblank timestamp.
> +///
> +/// This type is used by [`VblankSupport::get_vblank_timestamp`] for =
the implementor to return the
> +/// current vblank timestamp for the hardware.
> +#[derive(Copy, Clone)]
> +pub struct VblankTimestamp {
> +    /// The actual vblank timestamp, accuracy to within =
[`Self::max_error`] nanoseconds
> +    pub time: Ktime,
> +
> +    /// Maximum allowable timestamp error in nanoseconds
> +    pub max_error: i32,
> +}
> +
> +/// A trait for [`DriverCrtc`] implementations with hardware vblank =
support.
> +///
> +/// This trait is implemented internally by DRM for any =
[`DriverCrtc`] implementation that
> +/// implements [`VblankSupport`]. It is used to expose =
hardware-vblank driver exclusive methods and
> +/// data to users.
> +pub trait VblankDriverCrtc: DriverCrtc {}
> +
> +impl<T, V> VblankDriverCrtc for T
> +where
> +    T: DriverCrtc<VblankImpl =3D V>,
> +    V: VblankSupport<Crtc =3D T> {}
> +
> +impl<T: VblankDriverCrtc> Crtc<T> {
> +    /// Retrieve a reference to the [`VblankCrtc`] for this [`Crtc`].
> +    pub(crate) fn vblank_crtc(&self) -> &VblankCrtc<T> {
> +        // SAFETY: Casting is safe via `VblankCrtc`s type invariants.
> +        unsafe { &*self.get_vblank_ptr().cast() }

Quite a lot going on in a single statement. Please break this into =
multiple lines.

> +    }
> +
> +    /// Access vblank related infrastructure for a [`Crtc`].
> +    ///
> +    /// This function explicitly locks the device's vblank lock, and =
allows access to controlling
> +    /// the vblank configuration for this CRTC. The lock is dropped =
once [`VblankGuard`] is
> +    /// dropped.
> +    pub fn vblank_lock<'a>(&'a self, irq: IrqDisabled<'a>) -> =
VblankGuard<'a, T> {
> +        // SAFETY: `vbl_lock` is initialized for as long as `Crtc` is =
available to users
> +        unsafe { bindings::spin_lock(&mut =
(*self.drm_dev().as_raw()).vbl_lock) };
> +
> +        // SAFETY: We just acquired vbl_lock above
> +        unsafe { VblankGuard::new(self, irq) }
> +    }
> +
> +    /// Trigger a vblank event on this [`Crtc`].
> +    ///
> +    /// Drivers should use this in their vblank interrupt handlers to =
update the vblank counter and
> +    /// send any signals that may be pending.
> +    ///
> +    /// Returns whether or not the vblank event was handled.
> +    #[inline]
> +    pub fn handle_vblank(&self) -> bool {
> +        // SAFETY: FFI call with no special requirements
> +        unsafe { bindings::drm_crtc_handle_vblank(self.as_raw()) }
> +    }
> +
> +    /// Forbid vblank events for a [`Crtc`].
> +    ///
> +    /// This function disables vblank events for a [`Crtc`], even if =
[`VblankRef`] objects exist.

Do these `VblankRef` objects remain valid?

> +    #[inline]
> +    pub fn vblank_off(&self) {
> +        // SAFETY: FFI call with no special requirements
> +        unsafe { bindings::drm_crtc_vblank_off(self.as_raw()) }
> +    }
> +
> +    /// Allow vblank events for a [`Crtc`].
> +    ///
> +    /// This function allows users to enable vblank events and =
acquire [`VblankRef`] objects again.
> +    #[inline]
> +    pub fn vblank_on(&self) {
> +        // SAFETY: FFI call with no special requirements
> +        unsafe { bindings::drm_crtc_vblank_on(self.as_raw()) }
> +    }
> +
> +    /// Enable vblank events for a [`Crtc`].
> +    ///
> +    /// Returns a [`VblankRef`] which will allow vblank events to be =
sent until it is dropped. Note
> +    /// that vblank events may still be disabled by =
[`Self::vblank_off`].

This is a bit confusing. You can send events after calling `vblank_off`? =
What happens then, do these get ignored?

Maybe worth considering if this behavior should be disallowed in Rust. =
Note that you can use the type state pattern
to encode whether vblank events are enabled.

=20
> +    #[must_use =3D "Vblanks are only enabled until the result from =
this function is dropped"]
> +    pub fn vblank_get(&self) -> Result<VblankRef<'_, T>> {
> +        VblankRef::new(self)
> +    }
> +}
> +
> +/// Common methods available on any [`CrtcState`] whose [`Crtc`] =
implements [`VblankSupport`].
> +///
> +/// This trait is implemented automatically by DRM for any =
[`DriverCrtc`] implementation that
> +/// implements [`VblankSupport`].
> +pub trait RawVblankCrtcState: AsRawCrtcState {
> +    /// Return the [`PendingVblankEvent`] for this CRTC state, if =
there is one.
> +    fn get_pending_vblank_event(&mut self) -> =
Option<PendingVblankEvent<'_, Self>>
> +    where
> +        Self: Sized,
> +    {
> +        // SAFETY: The driver is the only one that will ever modify =
this data, and since our
> +        // interface follows rust's data aliasing rules that means =
this is safe to read
> +        let event_ptr =3D unsafe { (*self.as_raw()).event };
> +
> +        (!event_ptr.is_null()).then_some(PendingVblankEvent(self))
> +    }
> +}
> +
> +impl<T, C> RawVblankCrtcState for T
> +where
> +    T: AsRawCrtcState<Crtc =3D Crtc<C>>,
> +    C: VblankDriverCrtc {}
> +
> +/// A pending vblank event from an atomic state
> +pub struct PendingVblankEvent<'a, T: RawVblankCrtcState>(&'a mut T);
> +
> +impl<'a, T: RawVblankCrtcState> PendingVblankEvent<'a, T> {
> +    /// Send this [`PendingVblankEvent`].
> +    ///
> +    /// A [`PendingVblankEvent`] can only be sent once, so this =
function consumes the
> +    /// [`PendingVblankEvent`].
> +    pub fn send<C>(self)
> +    where
> +        T: RawVblankCrtcState<Crtc =3D Crtc<C>>,
> +        C: VblankDriverCrtc
> +    {
> +        let crtc: &Crtc<C> =3D self.0.crtc();
> +        let event_lock =3D crtc.drm_dev().event_lock();
> +
> +        with_irqs_disabled(|irq| {
> +            let _guard =3D event_lock.lock_with(irq);
> +
> +            // SAFETY:
> +            // * We now hold the appropriate lock to call this =
function
> +            // * Vblanks are enabled as proved by `vbl_ref`, as per =
the C api requirements
> +            // * Our interface is proof that `event` is non-null
> +            unsafe {
> +                bindings::drm_crtc_send_vblank_event(crtc.as_raw(), =
(*self.0.as_raw()).event)
> +            };
> +        });
> +
> +        // SAFETY: The mutable reference in `self.state` is proof =
that it is safe to mutate this,
> +        // and DRM expects us to set this to NULL once we've sent the =
vblank event.
> +        unsafe { (*self.0.as_raw()).event =3D null_mut() };
> +    }
> +
> +    /// Arm this [`PendingVblankEvent`] to be sent later by the =
CRTC's vblank interrupt handler.
> +    ///
> +    /// A [`PendingVblankEvent`] can only be armed once, so this =
function consumes the
> +    /// [`PendingVblankEvent`]. As well, it requires a [`VblankRef`] =
so that vblank interrupts
> +    /// remain enabled until the [`PendingVblankEvent`] has been sent =
out by the driver's vblank
> +    /// interrupt handler.
> +    pub fn arm<C>(self, vbl_ref: VblankRef<'_, C>)
> +    where
> +        T: RawVblankCrtcState<Crtc =3D Crtc<C>>,
> +        C: VblankDriverCrtc
> +    {
> +        let crtc: &Crtc<C> =3D self.0.crtc();
> +        let event_lock =3D crtc.drm_dev().event_lock();
> +
> +        with_irqs_disabled(|irq| {
> +            let _guard =3D event_lock.lock_with(irq);
> +
> +            // SAFETY:
> +            // * We now hold the appropriate lock to call this =
function
> +            // * Vblanks are enabled as proved by `vbl_ref`, as per =
the C api requirements
> +            // * Our interface is proof that `event` is non-null
> +            unsafe {
> +                bindings::drm_crtc_arm_vblank_event(crtc.as_raw(), =
(*self.0.as_raw()).event)
> +            };
> +        });
> +
> +        // SAFETY: The mutable reference in `self.state` is proof =
that it is safe to mutate this,
> +        // and DRM expects us to set this to NULL once we've armed =
the vblank event.
> +        unsafe { (*self.0.as_raw()).event =3D null_mut() };
> +
> +        // DRM took ownership of `vbl_ref` after we called =
`drm_crtc_arm_vblank_event`
> +        mem::forget(vbl_ref);
> +    }
> +}
> +
> +/// A borrowed vblank reference.
> +///
> +/// This object keeps the vblank reference count for a [`Crtc`] =
incremented for as long as it
> +/// exists, enabling vblank interrupts for said [`Crtc`] until all =
references are dropped, or
> +/// [`Crtc::vblank_off`] is called - whichever comes first.
> +pub struct VblankRef<'a, T: VblankDriverCrtc>(&'a Crtc<T>);
> +
> +impl<T: VblankDriverCrtc> Drop for VblankRef<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: FFI call with no special requirements
> +        unsafe { bindings::drm_crtc_vblank_put(self.0.as_raw()) };
> +    }
> +}
> +
> +impl<'a, T: VblankDriverCrtc> VblankRef<'a, T> {
> +    fn new(crtc: &'a Crtc<T>) -> Result<Self> {
> +        // SAFETY: FFI call with no special requirements
> +        to_result(unsafe { =
bindings::drm_crtc_vblank_get(crtc.as_raw()) })?;
> +
> +        Ok(Self(crtc))
> +    }
> +}
> +
> +/// The base wrapper for [`drm_vblank_crtc`].
> +///
> +/// Users will rarely interact with this object directly, it is a =
simple wrapper around
> +/// [`drm_vblank_crtc`] which provides access to methods and data =
that is not protected by a lock.
> +///
> +/// # Invariants
> +///
> +/// This type has an identical data layout to [`drm_vblank_crtc`].
> +///
> +/// [`drm_vblank_crtc`]: srctree/include/drm/drm_vblank.h
> +#[repr(transparent)]
> +pub struct VblankCrtc<T>(Opaque<bindings::drm_vblank_crtc>, =
PhantomData<T>);
> +
> +impl<T: VblankDriverCrtc> VblankCrtc<T> {
> +    pub(crate) fn as_raw(&self) -> *mut bindings::drm_vblank_crtc {
> +        // SAFETY: Our data layouts are identical via =
#[repr(transparent)]
> +        unsafe { self.0.get() }
> +    }
> +
> +    // SAFETY: The caller promises that `ptr` points to a valid =
instance of
> +    // `bindings::drm_vblank_crtc`, and that access to this structure =
has been properly serialized
> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut =
bindings::drm_vblank_crtc) -> &'a Self {
> +        // SAFETY: Our data layouts are identical via =
#[repr(transparent)]
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns the [`Device`] for this [`VblankGuard`]
> +    pub fn drm_dev(&self) -> &Device<T::Driver> {
> +        // SAFETY: `drm` is initialized, invariant and valid =
throughout our lifetime
> +        unsafe { Device::borrow((*self.as_raw()).dev) }
> +    }
> +}
> +
> +// NOTE: This type does not use a `Guard` because the mutex is not =
contained within the same
> +// structure as the relevant CRTC
> +/// An interface for accessing and controlling vblank related state =
for a [`Crtc`].
> +///
> +/// This type may be returned from some [`VblankSupport`] callbacks, =
or manually via
> +/// [`Crtc::vblank_lock`]. It provides access to methods and data =
which require
> +/// [`drm_device.vbl_lock`] be held.
> +///
> +/// # Invariants
> +///
> +/// - [`drm_device.vbl_lock`] is acquired whenever an instance of =
this type exists.
> +/// - Shares the invariants of [`VblankCrtc`].
> +///
> +/// [`drm_device.vbl_lock`]: srctree/include/drm/drm_device.h
> +#[repr(transparent)]
> +pub struct VblankGuard<'a, T: VblankDriverCrtc>(&'a VblankCrtc<T>);
> +
> +impl<'a, T: VblankDriverCrtc> VblankGuard<'a, T> {
> +    /// Construct a new [`VblankGuard`]
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must have already acquired =
[`drm_device.vbl_lock`].
> +    ///
> +    /// [`drm_device.vbl_lock`]: srctree/include/drm/drm_device.h
> +    pub(crate) unsafe fn new(
> +        crtc: &'a Crtc<T>,
> +        _irq: IrqDisabled<'a>
> +    ) -> Self {
> +        Self(crtc.vblank_crtc())
> +    }
> +
> +    /// Returns the duration of a single scanout frame in ns
> +    pub fn frame_duration(&self) -> i32 {
> +        // SAFETY: We hold the appropriate lock for this read via our =
type invariants.
> +        unsafe { (*self.as_raw()).framedur_ns }
> +    }
> +}
> +
> +impl<T: VblankDriverCrtc> Deref for VblankGuard<'_, T> {
> +    type Target =3D VblankCrtc<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T: VblankDriverCrtc> Drop for VblankGuard<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY:
> +        // - We acquired this spinlock when creating this object
> +        // - This lock is guaranteed to be initialized for as long as =
our DRM device is exposed to
> +        //   users.

Where is the call to lock the spinlock? If the user is supposed to lock =
it externally before `new()`, but
we explicitly call `spin_unlock` in `drop` then this is very confusing =
and error-prone.


> +        unsafe { bindings::spin_unlock(&mut =
(*self.drm_dev().as_raw()).vbl_lock) }
> +    }
> +}
> --=20
> 2.46.1
>=20

=E2=80=94 Daniel

