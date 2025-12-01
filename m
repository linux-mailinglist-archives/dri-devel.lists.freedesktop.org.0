Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07AC9800E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DD810E2B2;
	Mon,  1 Dec 2025 15:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="k0+R5m1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90B10E06B;
 Mon,  1 Dec 2025 15:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764602193; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=m8AgadcPtSQoUjSPLfit5+N7YToR5dSmhosVAhdI/UQkvP1fVudaRKehOGciWz5Mbfr49qntgfQaLHDpwmxetBvsh4BHJPdG3jVeS4QF69sTA6wfLIi7alHi6VxjEHlOXb+D09cXiHm0svZImX5NC9mEFYMz3Pf//G3qwLUq0JU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764602193;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=e0aRStyAnTdIP+6SOdWetIxjmi1/+sy5CZuVHgKv+t4=; 
 b=XMmvA+GQecQ+H1YPdNa0XuWVw+yLWb4jPzTtK/HVdT1FklKyWZDNrOoFe9K7jLCV+HsLkYhbD79gHalfrSUtHVGjFoPWYXfBDbl7N+ACJAT13saYFSadhUT/XTPcqKAgFunxg39SVUM53SQlQOf7wXEyxu1agYe/WO8MB9qwxWY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764602193; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=e0aRStyAnTdIP+6SOdWetIxjmi1/+sy5CZuVHgKv+t4=;
 b=k0+R5m1W9cX5DzmNLdepX3EZpSPIqBgoZqpoo2yEjAJ9Dn//AX4fg8KhTHrblFRf
 UsgOfZvN4ETuUE14AJvuUBGqEi3VtwRDrsfFsw8gZ9/AgL9cO0R0yk6clvxSeYIu+V0
 UTtFiQgS5l27WXK6i5iKqksICiWIN6GXzBebnaHc=
Received: by mx.zohomail.com with SMTPS id 1764602190844706.8767950430706;
 Mon, 1 Dec 2025 07:16:30 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
Date: Mon, 1 Dec 2025 12:16:09 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3727982A-91A4-447C-B53C-B6037DA02FF9@collabora.com>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
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

Hi Alice,

I find it a bit weird that we reverted to v1, given that the previous =
gpuvm
attempt was v3. No big deal though.


> On 28 Nov 2025, at 11:14, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> Add a GPUVM abstraction to be used by Rust GPU drivers.
>=20
> GPUVM keeps track of a GPU's virtual address (VA) space and manages =
the
> corresponding virtual mappings represented by "GPU VA" objects. It =
also
> keeps track of the gem::Object<T> used to back the mappings through
> GpuVmBo<T>.
>=20
> This abstraction is only usable by drivers that wish to use GPUVM in
> immediate mode. This allows us to build the locking scheme into the =
API
> design. It means that the GEM mutex is used for the GEM gpuva list, =
and
> that the resv lock is used for the extobj list. The evicted list is =
not
> yet used in this version.
>=20
> This abstraction provides a special handle called the GpuVmCore, which
> is a wrapper around ARef<GpuVm> that provides access to the interval
> tree. Generally, all changes to the address space requires mutable
> access to this unique handle.
>=20
> Some of the safety comments are still somewhat WIP, but I think the =
API
> should be sound as-is.
>=20
> Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> MAINTAINERS                     |   1 +
> rust/bindings/bindings_helper.h |   2 +
> rust/helpers/drm_gpuvm.c        |  43 ++++
> rust/helpers/helpers.c          |   1 +
> rust/kernel/drm/gpuvm/mod.rs    | 394 =
+++++++++++++++++++++++++++++++++
> rust/kernel/drm/gpuvm/sm_ops.rs | 469 =
++++++++++++++++++++++++++++++++++++++++
> rust/kernel/drm/gpuvm/va.rs     | 148 +++++++++++++
> rust/kernel/drm/gpuvm/vm_bo.rs  | 213 ++++++++++++++++++
> rust/kernel/drm/mod.rs          |   1 +
> 9 files changed, 1272 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index =
952aed4619c25d395c12962e559d6cd3362f64a7..946629eb9ebf19922bbe782fed37be07=
067d6bf2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8591,6 +8591,7 @@ S: Supported
> T: git https://gitlab.freedesktop.org/drm/misc/kernel.git
> F: drivers/gpu/drm/drm_gpuvm.c
> F: include/drm/drm_gpuvm.h
> +F: rust/kernel/drm/gpuvm/
>=20
> DRM LOG
> M: Jocelyn Falempe <jfalempe@redhat.com>
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index =
2e43c66635a2c9f31bd99b9817bd2d6ab89fbcf2..c776ae198e1db91f010f88ff1d1c888a=
3036a87f 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -33,6 +33,7 @@
> #include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> #include <drm/drm_gem.h>
> +#include <drm/drm_gpuvm.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/auxiliary_bus.h>
> @@ -103,6 +104,7 @@ const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM =3D =
___GFP_HIGHMEM;
> const gfp_t RUST_CONST_HELPER___GFP_NOWARN =3D ___GFP_NOWARN;
> const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D =
BLK_FEAT_ROTATIONAL;
> const fop_flags_t RUST_CONST_HELPER_FOP_UNSIGNED_OFFSET =3D =
FOP_UNSIGNED_OFFSET;
> +const u32 RUST_CONST_HELPER_DRM_EXEC_INTERRUPTIBLE_WAIT =3D =
DRM_EXEC_INTERRUPTIBLE_WAIT;
>=20
> const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_PRESENT;
>=20
> diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
> new file mode 100644
> index =
0000000000000000000000000000000000000000..18b7dbd2e32c3162455b344e72ec2940=
c632cc6b
> --- /dev/null
> +++ b/rust/helpers/drm_gpuvm.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +#ifdef CONFIG_DRM_GPUVM
> +
> +#include <drm/drm_gpuvm.h>
> +
> +struct drm_gpuvm *rust_helper_drm_gpuvm_get(struct drm_gpuvm *obj)
> +{
> + return drm_gpuvm_get(obj);
> +}
> +
> +void rust_helper_drm_gpuva_init_from_op(struct drm_gpuva *va, struct =
drm_gpuva_op_map *op)
> +{
> + drm_gpuva_init_from_op(va, op);
> +}
> +
> +struct drm_gpuvm_bo *rust_helper_drm_gpuvm_bo_get(struct drm_gpuvm_bo =
*vm_bo)
> +{
> + return drm_gpuvm_bo_get(vm_bo);
> +}
> +
> +void rust_helper_drm_gpuvm_exec_unlock(struct drm_gpuvm_exec =
*vm_exec)
> +{
> + return drm_gpuvm_exec_unlock(vm_exec);
> +}
> +
> +bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
> +     struct drm_gem_object *obj)
> +{
> + return drm_gpuvm_is_extobj(gpuvm, obj);
> +}
> +
> +int rust_helper_dma_resv_lock(struct dma_resv *obj, struct =
ww_acquire_ctx *ctx)
> +{
> + return dma_resv_lock(obj, ctx);
> +}
> +
> +void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> +{
> + dma_resv_unlock(obj);
> +}
> +
> +#endif // CONFIG_DRM_GPUVM
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index =
551da6c9b5064c324d6f62bafcec672c6c6f5bee..91f45155eb9c2c4e92b56ee1abf7d451=
88873f3c 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -26,6 +26,7 @@
> #include "device.c"
> #include "dma.c"
> #include "drm.c"
> +#include "drm_gpuvm.c"
> #include "err.c"
> #include "irq.c"
> #include "fs.c"
> diff --git a/rust/kernel/drm/gpuvm/mod.rs =
b/rust/kernel/drm/gpuvm/mod.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..9834dbb938a3622e46048e9b8e06bc6b=
f03aa0d2
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM GPUVM in immediate mode
> +//!
> +//! Rust abstractions for using GPUVM in immediate mode. This is when =
the GPUVM state is updated
> +//! during `run_job()`, i.e., in the DMA fence signalling critical =
path, to ensure that the GPUVM

IMHO: We should initially target synchronous VM_BINDS, which are the =
opposite
of what you described above.


> +//! and the GPU's virtual address space has the same state at all =
times.
> +//!
> +//! C header: =
[`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
> +
> +use kernel::{
> +    alloc::{AllocError, Flags as AllocFlags},
> +    bindings, drm,
> +    drm::gem::IntoGEMObject,
> +    error::to_result,
> +    prelude::*,
> +    sync::aref::{ARef, AlwaysRefCounted},
> +    types::Opaque,
> +};
> +
> +use core::{
> +    cell::UnsafeCell,
> +    marker::PhantomData,
> +    mem::{ManuallyDrop, MaybeUninit},
> +    ops::{Deref, DerefMut, Range},
> +    ptr::{self, NonNull},
> +};
> +
> +mod sm_ops;
> +pub use self::sm_ops::*;
> +
> +mod vm_bo;
> +pub use self::vm_bo::*;
> +
> +mod va;
> +pub use self::va::*;
> +
> +/// A DRM GPU VA manager.
> +///
> +/// This object is refcounted, but the "core" is only accessible =
using a special unique handle. The

I wonder if `Owned<T>` is a good fit here? IIUC, Owned<T> can be =
refcounted,
but there is only ever one handle on the Rust side? If so, this seems to =
be
what we want here?


> +/// core consists of the `core` field and the GPUVM's interval tree.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVm<T: DriverGpuVm> {
> +    #[pin]
> +    vm: Opaque<bindings::drm_gpuvm>,
> +    /// Accessed only through the [`GpuVmCore`] reference.
> +    core: UnsafeCell<T>,

This UnsafeCell has been here since Lina=E2=80=99s version. I must say I =
never
understood why, and perhaps now is a good time to clarify it given the =
changes
we=E2=80=99re making w.r.t to the =E2=80=9Cunique handle=E2=80=9D thing.

This is just some driver private data. It=E2=80=99s never shared with C. =
I am not
sure why we need this wrapper.

> +    /// Shared data not protected by any lock.
> +    #[pin]
> +    shared_data: T::SharedData,

Should we deref to this?

> +}
> +
> +// SAFETY: dox
> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: dox
> +        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: dox
> +        unsafe { bindings::drm_gpuvm_put((*obj.as_ptr()).vm.get()) };
> +    }
> +}
> +
> +impl<T: DriverGpuVm> GpuVm<T> {
> +    const fn vtable() -> &'static bindings::drm_gpuvm_ops {
> +        &bindings::drm_gpuvm_ops {
> +            vm_free: Some(Self::vm_free),
> +            op_alloc: None,
> +            op_free: None,
> +            vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
> +            vm_bo_free: GpuVmBo::<T>::FREE_FN,
> +            vm_bo_validate: None,
> +            sm_step_map: Some(Self::sm_step_map),
> +            sm_step_unmap: Some(Self::sm_step_unmap),
> +            sm_step_remap: Some(Self::sm_step_remap),
> +        }
> +    }
> +
> +    /// Creates a GPUVM instance.
> +    #[expect(clippy::new_ret_no_self)]
> +    pub fn new<E>(
> +        name: &'static CStr,
> +        dev: &drm::Device<T::Driver>,
> +        r_obj: &T::Object,

Can we call this =E2=80=9Creservation_object=E2=80=9D, or similar?

We should probably briefly explain what it does, perhaps linking to the =
C docs.


> +        range: Range<u64>,
> +        reserve_range: Range<u64>,
> +        core: T,
> +        shared: impl PinInit<T::SharedData, E>,
> +    ) -> Result<GpuVmCore<T>, E>
> +    where
> +        E: From<AllocError>,
> +        E: From<core::convert::Infallible>,
> +    {
> +        let obj =3D KBox::try_pin_init::<E>(
> +            try_pin_init!(Self {
> +                core <- UnsafeCell::new(core),
> +                shared_data <- shared,
> +                vm <- Opaque::ffi_init(|vm| {
> +                    // SAFETY: These arguments are valid. `vm` is =
valid until refcount drops to
> +                    // zero.
> +                    unsafe {
> +                        bindings::drm_gpuvm_init(
> +                            vm,
> +                            name.as_char_ptr(),
> +                            =
bindings::drm_gpuvm_flags_DRM_GPUVM_IMMEDIATE_MODE
> +                                | =
bindings::drm_gpuvm_flags_DRM_GPUVM_RESV_PROTECTED,
> +                            dev.as_raw(),
> +                            r_obj.as_raw(),
> +                            range.start,
> +                            range.end - range.start,
> +                            reserve_range.start,
> +                            reserve_range.end - reserve_range.start,
> +                            const { Self::vtable() },
> +                        )
> +                    }
> +                }),
> +            }? E),
> +            GFP_KERNEL,
> +        )?;
> +        // SAFETY: This transfers the initial refcount to the ARef.
> +        Ok(GpuVmCore(unsafe {
> +            ARef::from_raw(NonNull::new_unchecked(KBox::into_raw(
> +                Pin::into_inner_unchecked(obj),
> +            )))
> +        }))
> +    }
> +
> +    /// Access this [`GpuVm`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`, the pointer must reference a valid =
[`GpuVm<T>`].
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a =
Self {
> +        // SAFETY: `drm_gpuvm` is first field and `repr(C)`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get a raw pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm {
> +        self.vm.get()
> +    }
> +
> +    /// Access the shared data.
> +    #[inline]
> +    pub fn shared(&self) -> &T::SharedData {
> +        &self.shared_data
> +    }
> +
> +    /// The start of the VA space.
> +    #[inline]
> +    pub fn va_start(&self) -> u64 {
> +        // SAFETY: Safe by the type invariant of `GpuVm<T>`.
> +        unsafe { (*self.as_raw()).mm_start }
> +    }
> +
> +    /// The length of the address space
> +    #[inline]
> +    pub fn va_length(&self) -> u64 {
> +        // SAFETY: Safe by the type invariant of `GpuVm<T>`.
> +        unsafe { (*self.as_raw()).mm_range }
> +    }
> +
> +    /// Returns the range of the GPU virtual address space.
> +    #[inline]
> +    pub fn va_range(&self) -> Range<u64> {
> +        let start =3D self.va_start();
> +        let end =3D start + self.va_length();
> +        Range { start, end }
> +    }
> +


I wonder if we should expose the methods below at this moment. We will =
not need
them in Tyr until we start submitting jobs. This is still a bit in the =
future.

I say this for a few reasons:

a) Philipp is still working on the fence abstractions,

b) As a result from the above, we are taking raw fence pointers,

c) Onur is working on a WW Mutex abstraction [0] that includes a Rust
implementation of drm_exec (under another name, and useful in other =
contexts
outside of DRM). Should we use them here?

I think your current design with the ExecToken is also ok and perhaps we =
should
stick to it, but it's good to at least discuss this with the others.


> +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> +    #[inline]
> +    pub fn obtain(
> +        &self,
> +        obj: &T::Object,
> +        data: impl PinInit<T::VmBoData>,
> +    ) -> Result<GpuVmBoObtain<T>, AllocError> {

Perhaps this should be called GpuVmBo? That=E2=80=99s what you want to =
=E2=80=9Cobtain=E2=80=9D in the first place.

This is indeed a question, by the way.

> +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> +    }
> +
> +    /// Prepare this GPUVM.
> +    #[inline]
> +    pub fn prepare(&self, num_fences: u32) -> impl =
PinInit<GpuVmExec<'_, T>, Error> {

> +        try_pin_init!(GpuVmExec {
> +            exec <- Opaque::try_ffi_init(|exec: *mut =
bindings::drm_gpuvm_exec| {
> +                // SAFETY: exec is valid but unused memory, so we can =
write.
> +                unsafe {
> +                    ptr::write_bytes(exec, 0u8, 1usize);
> +                    ptr::write(&raw mut (*exec).vm, self.as_raw());
> +                    ptr::write(&raw mut (*exec).flags, =
bindings::DRM_EXEC_INTERRUPTIBLE_WAIT);
> +                    ptr::write(&raw mut (*exec).num_fences, =
num_fences);
> +                }
> +
> +                // SAFETY: We can prepare the GPUVM.
> +                to_result(unsafe { =
bindings::drm_gpuvm_exec_lock(exec) })
> +            }),
> +            _gpuvm: PhantomData,
> +        })
> +    }
> +
> +    /// Clean up buffer objects that are no longer used.
> +    #[inline]
> +    pub fn deferred_cleanup(&self) {
> +        // SAFETY: Always safe to perform deferred cleanup.
> +        unsafe { =
bindings::drm_gpuvm_bo_deferred_cleanup(self.as_raw()) }
> +    }
> +
> +    /// Check if this GEM object is an external object for this =
GPUVM.
> +    #[inline]
> +    pub fn is_extobj(&self, obj: &T::Object) -> bool {
> +        // SAFETY: We may call this with any GPUVM and GEM object.
> +        unsafe { bindings::drm_gpuvm_is_extobj(self.as_raw(), =
obj.as_raw()) }
> +    }
> +
> +    /// Free this GPUVM.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Called when refcount hits zero.
> +    unsafe extern "C" fn vm_free(me: *mut bindings::drm_gpuvm) {
> +        // SAFETY: GPUVM was allocated with KBox and can now be =
freed.
> +        drop(unsafe { KBox::<Self>::from_raw(me.cast()) })
> +    }
> +}
> +
> +/// The manager for a GPUVM.
> +pub trait DriverGpuVm: Sized {
> +    /// Parent `Driver` for this object.
> +    type Driver: drm::Driver;
> +
> +    /// The kind of GEM object stored in this GPUVM.
> +    type Object: IntoGEMObject;
> +
> +    /// Data stored in the [`GpuVm`] that is fully shared.
> +    type SharedData;
> +
> +    /// Data stored with each `struct drm_gpuvm_bo`.
> +    type VmBoData;
> +
> +    /// Data stored with each `struct drm_gpuva`.
> +    type VaData;
> +
> +    /// The private data passed to callbacks.
> +    type SmContext;
> +
> +    /// Indicates that a new mapping should be created.
> +    fn sm_step_map<'op>(
> +        &mut self,
> +        op: OpMap<'op, Self>,
> +        context: &mut Self::SmContext,
> +    ) -> Result<OpMapped<'op, Self>, Error>;
> +
> +    /// Indicates that an existing mapping should be removed.
> +    fn sm_step_unmap<'op>(
> +        &mut self,
> +        op: OpUnmap<'op, Self>,
> +        context: &mut Self::SmContext,
> +    ) -> Result<OpUnmapped<'op, Self>, Error>;
> +
> +    /// Indicates that an existing mapping should be split up.
> +    fn sm_step_remap<'op>(
> +        &mut self,
> +        op: OpRemap<'op, Self>,
> +        context: &mut Self::SmContext,
> +    ) -> Result<OpRemapped<'op, Self>, Error>;
> +}
> +
> +/// The core of the DRM GPU VA manager.
> +///
> +/// This object is the reference to the GPUVM that
> +///
> +/// # Invariants
> +///
> +/// This object owns the core.
> +pub struct GpuVmCore<T: DriverGpuVm>(ARef<GpuVm<T>>);
> +
> +impl<T: DriverGpuVm> GpuVmCore<T> {
> +    /// Get a reference without access to `core`.
> +    #[inline]
> +    pub fn gpuvm(&self) -> &GpuVm<T> {
> +        &self.0
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmCore<T> {
> +    type Target =3D T;
> +    #[inline]
> +    fn deref(&self) -> &T {
> +        // SAFETY: By the type invariants we may access `core`.
> +        unsafe { &*self.0.core.get() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> DerefMut for GpuVmCore<T> {
> +    #[inline]
> +    fn deref_mut(&mut self) -> &mut T {
> +        // SAFETY: By the type invariants we may access `core`.
> +        unsafe { &mut *self.0.core.get() }
> +    }
> +}
> +
> +/// The exec token for preparing the objects.
> +#[pin_data(PinnedDrop)]
> +pub struct GpuVmExec<'a, T: DriverGpuVm> {
> +    #[pin]
> +    exec: Opaque<bindings::drm_gpuvm_exec>,
> +    _gpuvm: PhantomData<&'a mut GpuVm<T>>,
> +}
> +
> +impl<'a, T: DriverGpuVm> GpuVmExec<'a, T> {
> +    /// Add a fence.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `fence` arg must be valid.
> +    pub unsafe fn resv_add_fence(
> +        &self,
> +        // TODO: use a safe fence abstraction
> +        fence: *mut bindings::dma_fence,
> +        private_usage: DmaResvUsage,
> +        extobj_usage: DmaResvUsage,
> +    ) {
> +        // SAFETY: Caller ensures fence is ok.
> +        unsafe {
> +            bindings::drm_gpuvm_resv_add_fence(
> +                (*self.exec.get()).vm,
> +                &raw mut (*self.exec.get()).exec,
> +                fence,
> +                private_usage as u32,
> +                extobj_usage as u32,
> +            )
> +        }
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<'a, T: DriverGpuVm> PinnedDrop for GpuVmExec<'a, T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: We hold the lock, so it's safe to unlock.
> +        unsafe { bindings::drm_gpuvm_exec_unlock(self.exec.get()) };
> +    }
> +}
> +
> +/// How the fence will be used.
> +#[repr(u32)]
> +pub enum DmaResvUsage {
> +    /// For in kernel memory management only (e.g. copying, clearing =
memory).
> +    Kernel =3D bindings::dma_resv_usage_DMA_RESV_USAGE_KERNEL,
> +    /// Implicit write synchronization for userspace submissions.
> +    Write =3D bindings::dma_resv_usage_DMA_RESV_USAGE_WRITE,
> +    /// Implicit read synchronization for userspace submissions.
> +    Read =3D bindings::dma_resv_usage_DMA_RESV_USAGE_READ,
> +    /// No implicit sync (e.g. preemption fences, page table updates, =
TLB flushes).
> +    Bookkeep =3D bindings::dma_resv_usage_DMA_RESV_USAGE_BOOKKEEP,
> +}
> +
> +/// A lock guard for the GPUVM's resv lock.
> +///
> +/// This guard provides access to the extobj and evicted lists.

Should we bother with evicted objects at this stage?

> +///
> +/// # Invariants
> +///
> +/// Holds the GPUVM resv lock.
> +pub struct GpuvmResvLockGuard<'a, T: DriverGpuVm>(&'a GpuVm<T>);
> +
> +impl<T: DriverGpuVm> GpuVm<T> {
> +    /// Lock the VM's resv lock.

More docs here would be nice.

> +    #[inline]
> +    pub fn resv_lock(&self) -> GpuvmResvLockGuard<'_, T> {
> +        // SAFETY: It's always ok to lock the resv lock.
> +        unsafe { bindings::dma_resv_lock(self.raw_resv_lock(), =
ptr::null_mut()) };
> +        // INVARIANTS: We took the lock.
> +        GpuvmResvLockGuard(self)
> +    }

You can call this more than once and deadlock. Perhaps we should warn =
about this, or forbid it?

i.e.:

if self.resv_is_locked {
  return Err(EALREADY)
}

> +
> +    #[inline]
> +    fn raw_resv_lock(&self) -> *mut bindings::dma_resv {
> +        // SAFETY: `r_obj` is immutable and valid for duration of =
GPUVM.
> +        unsafe { (*(*self.as_raw()).r_obj).resv }
> +    }
> +}
> +
> +impl<'a, T: DriverGpuVm> Drop for GpuvmResvLockGuard<'a, T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: We hold the lock so we can release it.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_resv_lock()) };
> +    }
> +}
> diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs =
b/rust/kernel/drm/gpuvm/sm_ops.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..c0dbd4675de644a3b1cbe7d528194ca7=
fb471848
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/sm_ops.rs
> @@ -0,0 +1,469 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +#![allow(clippy::tabs_in_doc_comments)]
> +
> +use super::*;
> +
> +struct SmData<'a, T: DriverGpuVm> {
> +    gpuvm: &'a mut GpuVmCore<T>,
> +    user_context: &'a mut T::SmContext,
> +}
> +
> +#[repr(C)]
> +struct SmMapData<'a, T: DriverGpuVm> {
> +    sm_data: SmData<'a, T>,
> +    vm_bo: GpuVmBoObtain<T>,
> +}
> +
> +/// The argument for [`GpuVmCore::sm_map`].
> +pub struct OpMapRequest<'a, T: DriverGpuVm> {
> +    /// Address in GPU virtual address space.
> +    pub addr: u64,
> +    /// Length of mapping to create.
> +    pub range: u64,
> +    /// Offset in GEM object.

"in the GEM object."

> +    pub offset: u64,
> +    /// The GEM object to map.
> +    pub vm_bo: GpuVmBoObtain<T>,
> +    /// The user-provided context type.
> +    pub context: &'a mut T::SmContext,
> +}
> +
> +impl<'a, T: DriverGpuVm> OpMapRequest<'a, T> {
> +    fn raw_request(&self) -> bindings::drm_gpuvm_map_req {
> +        bindings::drm_gpuvm_map_req {
> +            map: bindings::drm_gpuva_op_map {
> +                va: bindings::drm_gpuva_op_map__bindgen_ty_1 {
> +                    addr: self.addr,
> +                    range: self.range,
> +                },
> +                gem: bindings::drm_gpuva_op_map__bindgen_ty_2 {
> +                    offset: self.offset,
> +                    obj: self.vm_bo.obj().as_raw(),
> +                },
> +            },
> +        }
> +    }
> +}
> +
> +/// ```
> +/// struct drm_gpuva_op_map {
> +/// /**
> +/// * @va: structure containing address and range of a map
> +/// * operation
> +/// */
> +/// struct {
> +/// /**
> +/// * @va.addr: the base address of the new mapping
> +/// */
> +/// u64 addr;
> +///
> +/// /**
> +/// * @va.range: the range of the new mapping
> +/// */
> +/// u64 range;
> +/// } va;
> +///
> +/// /**
> +/// * @gem: structure containing the &drm_gem_object and it's offset
> +/// */
> +/// struct {
> +/// /**
> +/// * @gem.offset: the offset within the &drm_gem_object
> +/// */
> +/// u64 offset;
> +///
> +/// /**
> +/// * @gem.obj: the &drm_gem_object to map
> +/// */
> +/// struct drm_gem_object *obj;
> +/// } gem;
> +/// };
> +/// ```

I think we can improve the docs above a bit.

> +pub struct OpMap<'op, T: DriverGpuVm> {
> +    op: &'op bindings::drm_gpuva_op_map,
> +    // Since these abstractions are designed for immediate mode, the =
VM BO needs to be
> +    // pre-allocated, so we always have it available when we reach =
this point.
> +    vm_bo: &'op GpuVmBo<T>,
> +    _invariant: PhantomData<*mut &'op mut T>,
> +}
> +
> +impl<'op, T: DriverGpuVm> OpMap<'op, T> {
> +    /// The base address of the new mapping.
> +    pub fn addr(&self) -> u64 {
> +        self.op.va.addr
> +    }
> +
> +    /// The length of the new mapping.
> +    pub fn length(&self) -> u64 {
> +        self.op.va.range
> +    }
> +
> +    /// The offset within the [`drm_gem_object`](crate::gem::Object).
> +    pub fn gem_offset(&self) -> u64 {
> +        self.op.gem.offset
> +    }
> +
> +    /// The [`drm_gem_object`](crate::gem::Object) to map.
> +    pub fn obj(&self) -> &T::Object {
> +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> +        unsafe { <T::Object as =
IntoGEMObject>::from_raw(self.op.gem.obj) }
> +    }
> +
> +    /// The [`GpuVmBo`] that the new VA will be associated with.
> +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> +        self.vm_bo
> +    }
> +
> +    /// Use the pre-allocated VA to carry out this map operation.
> +    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl =
PinInit<T::VaData>) -> OpMapped<'op, T> {
> +        let va =3D va.prepare(va_data);
> +        // SAFETY: By the type invariants we may access the interval =
tree.
> +        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), =
va, self.op) };
> +        // SAFETY: The GEM object is valid, so the mutex is properly =
initialized.

> +        unsafe { bindings::mutex_lock(&raw mut =
(*self.op.gem.obj).gpuva.lock) };

Should we use Fujita=E2=80=99s might_sleep() support here?

> +        // SAFETY: The va is prepared for insertion, and we hold the =
GEM lock.
> +        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
> +        // SAFETY: We took the mutex above, so we may unlock it.
> +        unsafe { bindings::mutex_unlock(&raw mut =
(*self.op.gem.obj).gpuva.lock) };
> +        OpMapped {
> +            _invariant: self._invariant,
> +        }
> +    }
> +}
> +
> +/// Represents a completed [`OpMap`] operation.
> +pub struct OpMapped<'op, T> {
> +    _invariant: PhantomData<*mut &'op mut T>,
> +}
> +
> +/// ```
> +/// struct drm_gpuva_op_unmap {
> +/// /**
> +/// * @va: the &drm_gpuva to unmap
> +/// */
> +/// struct drm_gpuva *va;
> +///
> +/// /**
> +/// * @keep:
> +/// *
> +/// * Indicates whether this &drm_gpuva is physically contiguous with =
the
> +/// * original mapping request.
> +/// *
> +/// * Optionally, if &keep is set, drivers may keep the actual page =
table
> +/// * mappings for this &drm_gpuva, adding the missing page table =
entries
> +/// * only and update the &drm_gpuvm accordingly.
> +/// */
> +/// bool keep;
> +/// };
> +/// ```

I think the docs could improve here ^

> +pub struct OpUnmap<'op, T: DriverGpuVm> {
> +    op: &'op bindings::drm_gpuva_op_unmap,
> +    _invariant: PhantomData<*mut &'op mut T>,
> +}
> +
> +impl<'op, T: DriverGpuVm> OpUnmap<'op, T> {
> +    /// Indicates whether this `drm_gpuva` is physically contiguous =
with the
> +    /// original mapping request.
> +    ///
> +    /// Optionally, if `keep` is set, drivers may keep the actual =
page table
> +    /// mappings for this `drm_gpuva`, adding the missing page table =
entries
> +    /// only and update the `drm_gpuvm` accordingly.
> +    pub fn keep(&self) -> bool {
> +        self.op.keep
> +    }
> +
> +    /// The range being unmapped.
> +    pub fn va(&self) -> &GpuVa<T> {
> +        // SAFETY: This is a valid va.
> +        unsafe { GpuVa::<T>::from_raw(self.op.va) }
> +    }
> +
> +    /// Remove the VA.
> +    pub fn remove(self) -> (OpUnmapped<'op, T>, GpuVaRemoved<T>) {
> +        // SAFETY: The op references a valid drm_gpuva in the GPUVM.
> +        unsafe { bindings::drm_gpuva_unmap(self.op) };
> +        // SAFETY: The va is no longer in the interval tree so we may =
unlink it.
> +        unsafe { bindings::drm_gpuva_unlink_defer(self.op.va) };
> +
> +        // SAFETY: We just removed this va from the `GpuVm<T>`.
> +        let va =3D unsafe { GpuVaRemoved::from_raw(self.op.va) };
> +
> +        (
> +            OpUnmapped {
> +                _invariant: self._invariant,
> +            },
> +            va,
> +        )
> +    }
> +}
> +
> +/// Represents a completed [`OpUnmap`] operation.
> +pub struct OpUnmapped<'op, T> {
> +    _invariant: PhantomData<*mut &'op mut T>,
> +}
> +
> +/// ```
> +/// struct drm_gpuva_op_remap {
> +/// /**
> +/// * @prev: the preceding part of a split mapping
> +/// */
> +/// struct drm_gpuva_op_map *prev;
> +///
> +/// /**
> +/// * @next: the subsequent part of a split mapping
> +/// */
> +/// struct drm_gpuva_op_map *next;
> +///
> +/// /**
> +/// * @unmap: the unmap operation for the original existing mapping
> +/// */
> +/// struct drm_gpuva_op_unmap *unmap;
> +/// };
> +/// ```
> +pub struct OpRemap<'op, T: DriverGpuVm> {
> +    op: &'op bindings::drm_gpuva_op_remap,
> +    _invariant: PhantomData<*mut &'op mut T>,
> +}
> +
> +impl<'op, T: DriverGpuVm> OpRemap<'op, T> {
> +    /// The preceding part of a split mapping.
> +    #[inline]
> +    pub fn prev(&self) -> Option<&OpRemapMapData> {
> +        // SAFETY: We checked for null, so the pointer must be valid.
> +        NonNull::new(self.op.prev).map(|ptr| unsafe { =
OpRemapMapData::from_raw(ptr) })
> +    }
> +
> +    /// The subsequent part of a split mapping.
> +    #[inline]
> +    pub fn next(&self) -> Option<&OpRemapMapData> {
> +        // SAFETY: We checked for null, so the pointer must be valid.
> +        NonNull::new(self.op.next).map(|ptr| unsafe { =
OpRemapMapData::from_raw(ptr) })
> +    }
> +
> +    /// Indicates whether the `drm_gpuva` being removed is physically =
contiguous with the original
> +    /// mapping request.
> +    ///
> +    /// Optionally, if `keep` is set, drivers may keep the actual =
page table mappings for this
> +    /// `drm_gpuva`, adding the missing page table entries only and =
update the `drm_gpuvm`
> +    /// accordingly.
> +    #[inline]
> +    pub fn keep(&self) -> bool {
> +        // SAFETY: The unmap pointer is always valid.
> +        unsafe { (*self.op.unmap).keep }
> +    }
> +
> +    /// The range being unmapped.
> +    #[inline]
> +    pub fn va_to_unmap(&self) -> &GpuVa<T> {
> +        // SAFETY: This is a valid va.
> +        unsafe { GpuVa::<T>::from_raw((*self.op.unmap).va) }
> +    }
> +
> +    /// The [`drm_gem_object`](crate::gem::Object) whose VA is being =
remapped.
> +    #[inline]
> +    pub fn obj(&self) -> &T::Object {
> +        self.va_to_unmap().obj()
> +    }
> +
> +    /// The [`GpuVmBo`] that is being remapped.
> +    #[inline]
> +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> +        self.va_to_unmap().vm_bo()
> +    }
> +
> +    /// Update the GPUVM to perform the remapping.
> +    pub fn remap(
> +        self,
> +        va_alloc: [GpuVaAlloc<T>; 2],
> +        prev_data: impl PinInit<T::VaData>,
> +        next_data: impl PinInit<T::VaData>,
> +    ) -> (OpRemapped<'op, T>, OpRemapRet<T>) {
> +        let [va1, va2] =3D va_alloc;
> +
> +        let mut unused_va =3D None;
> +        let mut prev_ptr =3D ptr::null_mut();
> +        let mut next_ptr =3D ptr::null_mut();
> +        if self.prev().is_some() {
> +            prev_ptr =3D va1.prepare(prev_data);
> +        } else {
> +            unused_va =3D Some(va1);
> +        }
> +        if self.next().is_some() {
> +            next_ptr =3D va2.prepare(next_data);
> +        } else {
> +            unused_va =3D Some(va2);
> +        }
> +
> +        // SAFETY: the pointers are non-null when required
> +        unsafe { bindings::drm_gpuva_remap(prev_ptr, next_ptr, =
self.op) };
> +
> +        // SAFETY: The GEM object is valid, so the mutex is properly =
initialized.
> +        unsafe { bindings::mutex_lock(&raw mut =
(*self.obj().as_raw()).gpuva.lock) };
> +        if !prev_ptr.is_null() {
> +            // SAFETY: The prev_ptr is a valid drm_gpuva prepared for =
insertion. The vm_bo is still
> +            // valid as the not-yet-unlinked gpuva holds a refcount =
on the vm_bo.
> +            unsafe { bindings::drm_gpuva_link(prev_ptr, =
self.vm_bo().as_raw()) };
> +        }
> +        if !next_ptr.is_null() {
> +            // SAFETY: The next_ptr is a valid drm_gpuva prepared for =
insertion. The vm_bo is still
> +            // valid as the not-yet-unlinked gpuva holds a refcount =
on the vm_bo.
> +            unsafe { bindings::drm_gpuva_link(next_ptr, =
self.vm_bo().as_raw()) };
> +        }
> +        // SAFETY: We took the mutex above, so we may unlock it.
> +        unsafe { bindings::mutex_unlock(&raw mut =
(*self.obj().as_raw()).gpuva.lock) };
> +        // SAFETY: The va is no longer in the interval tree so we may =
unlink it.
> +        unsafe { =
bindings::drm_gpuva_unlink_defer((*self.op.unmap).va) };
> +
> +        (
> +            OpRemapped {
> +                _invariant: self._invariant,
> +            },
> +            OpRemapRet {
> +                // SAFETY: We just removed this va from the =
`GpuVm<T>`.
> +                unmapped_va: unsafe { =
GpuVaRemoved::from_raw((*self.op.unmap).va) },
> +                unused_va,
> +            },
> +        )
> +    }
> +}
> +
> +/// Part of an [`OpRemap`] that represents a new mapping.
> +#[repr(transparent)]
> +pub struct OpRemapMapData(bindings::drm_gpuva_op_map);
> +
> +impl OpRemapMapData {
> +    /// # Safety
> +    /// Must reference a valid `drm_gpuva_op_map` for duration of =
`'a`.
> +    unsafe fn from_raw<'a>(ptr: NonNull<bindings::drm_gpuva_op_map>) =
-> &'a Self {
> +        // SAFETY: ok per safety requirements
> +        unsafe { ptr.cast().as_ref() }
> +    }
> +
> +    /// The base address of the new mapping.
> +    pub fn addr(&self) -> u64 {
> +        self.0.va.addr
> +    }
> +
> +    /// The length of the new mapping.
> +    pub fn length(&self) -> u64 {
> +        self.0.va.range
> +    }
> +
> +    /// The offset within the [`drm_gem_object`](crate::gem::Object).
> +    pub fn gem_offset(&self) -> u64 {
> +        self.0.gem.offset
> +    }
> +}
> +
> +/// Struct containing objects removed or not used by =
[`OpRemap::remap`].
> +pub struct OpRemapRet<T: DriverGpuVm> {
> +    /// The `drm_gpuva` that was removed.
> +    pub unmapped_va: GpuVaRemoved<T>,
> +    /// If the remap did not split the region into two pieces, then =
the unused `drm_gpuva` is
> +    /// returned here.
> +    pub unused_va: Option<GpuVaAlloc<T>>,
> +}
> +
> +/// Represents a completed [`OpRemap`] operation.
> +pub struct OpRemapped<'op, T> {
> +    _invariant: PhantomData<*mut &'op mut T>,
> +}
> +
> +impl<T: DriverGpuVm> GpuVmCore<T> {
> +    /// Create a mapping, removing or remapping anything that =
overlaps.
> +    #[inline]
> +    pub fn sm_map(&mut self, req: OpMapRequest<'_, T>) -> Result {

I wonder if we should keep this =E2=80=9Csm=E2=80=9D prefix. Perhaps
=E2=80=9Cmap_region=E2=80=9D or =E2=80=9Cmap_range=E2=80=9D would be =
better names IMHO.

> +        let gpuvm =3D self.gpuvm().as_raw();
> +        let raw_req =3D req.raw_request();
> +        let mut p =3D SmMapData {
> +            sm_data: SmData {
> +                gpuvm: self,
> +                user_context: req.context,
> +            },
> +            vm_bo: req.vm_bo,
> +        };
> +        // SAFETY:
> +        // * raw_request() creates a valid request.
> +        // * The private data is valid to be interpreted as both =
SmData and SmMapData since the
> +        //   first field of SmMapData is SmData.
> +        to_result(unsafe {
> +            bindings::drm_gpuvm_sm_map(gpuvm, (&raw mut p).cast(), =
&raw const raw_req)
> +        })
> +    }
> +
> +    /// Remove any mappings in the given region.
> +    #[inline]
> +    pub fn sm_unmap(&mut self, addr: u64, length: u64, context: &mut =
T::SmContext) -> Result {

Same here

> +        let gpuvm =3D self.gpuvm().as_raw();
> +        let mut p =3D SmData {
> +            gpuvm: self,
> +            user_context: context,
> +        };
> +        // SAFETY:
> +        // * raw_request() creates a valid request.
> +        // * The private data is valid to be interpreted as only =
SmData, but drm_gpuvm_sm_unmap()
> +        //   never calls sm_step_map().
> +        to_result(unsafe { bindings::drm_gpuvm_sm_unmap(gpuvm, (&raw =
mut p).cast(), addr, length) })
> +    }
> +}
> +
> +impl<T: DriverGpuVm> GpuVm<T> {
> +    /// # Safety
> +    /// Must be called from `sm_map`.
> +    pub(super) unsafe extern "C" fn sm_step_map(
> +        op: *mut bindings::drm_gpuva_op,
> +        p: *mut c_void,
> +    ) -> c_int {
> +        // SAFETY: If we reach `sm_step_map` then we were called from =
`sm_map` which always passes
> +        // an `SmMapData` as private data.
> +        let p =3D unsafe { &mut *p.cast::<SmMapData<'_, T>>() };
> +        let op =3D OpMap {
> +            // SAFETY: sm_step_map is called with a map operation.
> +            op: unsafe { &(*op).__bindgen_anon_1.map },
> +            vm_bo: &p.vm_bo,
> +            _invariant: PhantomData,
> +        };
> +        match p.sm_data.gpuvm.sm_step_map(op, p.sm_data.user_context) =
{
> +            Ok(OpMapped { .. }) =3D> 0,
> +            Err(err) =3D> err.to_errno(),
> +        }
> +    }
> +    /// # Safety
> +    /// Must be called from `sm_map` or `sm_unmap`.
> +    pub(super) unsafe extern "C" fn sm_step_unmap(
> +        op: *mut bindings::drm_gpuva_op,
> +        p: *mut c_void,
> +    ) -> c_int {
> +        // SAFETY: If we reach `sm_step_unmap` then we were called =
from `sm_map` or `sm_unmap` which passes either
> +        // an `SmMapData` or `SmData` as private data. Both cases can =
be cast to `SmData`.
> +        let p =3D unsafe { &mut *p.cast::<SmData<'_, T>>() };
> +        let op =3D OpUnmap {
> +            // SAFETY: sm_step_unmap is called with an unmap =
operation.
> +            op: unsafe { &(*op).__bindgen_anon_1.unmap },
> +            _invariant: PhantomData,
> +        };
> +        match p.gpuvm.sm_step_unmap(op, p.user_context) {
> +            Ok(OpUnmapped { .. }) =3D> 0,
> +            Err(err) =3D> err.to_errno(),
> +        }
> +    }
> +    /// # Safety
> +    /// Must be called from `sm_map` or `sm_unmap`.
> +    pub(super) unsafe extern "C" fn sm_step_remap(
> +        op: *mut bindings::drm_gpuva_op,
> +        p: *mut c_void,
> +    ) -> c_int {
> +        // SAFETY: If we reach `sm_step_remap` then we were called =
from `sm_map` or `sm_unmap` which passes either
> +        // an `SmMapData` or `SmData` as private data. Both cases can =
be cast to `SmData`.
> +        let p =3D unsafe { &mut *p.cast::<SmData<'_, T>>() };
> +        let op =3D OpRemap {
> +            // SAFETY: sm_step_remap is called with a remap =
operation.
> +            op: unsafe { &(*op).__bindgen_anon_1.remap },
> +            _invariant: PhantomData,
> +        };
> +        match p.gpuvm.sm_step_remap(op, p.user_context) {
> +            Ok(OpRemapped { .. }) =3D> 0,
> +            Err(err) =3D> err.to_errno(),
> +        }
> +    }
> +}
> diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..a31122ff22282186a1d76d4bb085714f=
6465722b
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/va.rs
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +use super::*;
> +
> +/// Represents that a range of a GEM object is mapped in this =
[`GpuVm`] instance.
> +///
> +/// Does not assume that GEM lock is held.
> +///
> +/// # Invariants
> +///
> +/// This is a valid `drm_gpuva` that is resident in the [`GpuVm`] =
instance.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVa<T: DriverGpuVm> {
> +    #[pin]
> +    inner: Opaque<bindings::drm_gpuva>,
> +    #[pin]
> +    data: T::VaData,
> +}
> +
> +impl<T: DriverGpuVm> GpuVa<T> {
> +    /// Access this [`GpuVa`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`, the pointer must reference a valid =
`drm_gpuva` associated with a
> +    /// [`GpuVm<T>`].
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuva) -> &'a =
Self {
> +        // SAFETY: `drm_gpuva` is first field and `repr(C)`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuva {
> +        self.inner.get()
> +    }
> +
> +    /// Returns the address of this mapping in the GPU virtual =
address space.
> +    #[inline]
> +    pub fn addr(&self) -> u64 {
> +        // SAFETY: The `va.addr` field of `drm_gpuva` is immutable.
> +        unsafe { (*self.as_raw()).va.addr }
> +    }
> +
> +    /// Returns the length of this mapping.
> +    #[inline]
> +    pub fn length(&self) -> u64 {
> +        // SAFETY: The `va.range` field of `drm_gpuva` is immutable.
> +        unsafe { (*self.as_raw()).va.range }
> +    }
> +
> +    /// Returns `addr..addr+length`.
> +    #[inline]
> +    pub fn range(&self) -> Range<u64> {
> +        let addr =3D self.addr();
> +        addr..addr + self.length()
> +    }
> +
> +    /// Returns the offset within the GEM object.
> +    #[inline]
> +    pub fn gem_offset(&self) -> u64 {
> +        // SAFETY: The `gem.offset` field of `drm_gpuva` is =
immutable.
> +        unsafe { (*self.as_raw()).gem.offset }
> +    }
> +
> +    /// Returns the GEM object.
> +    #[inline]
> +    pub fn obj(&self) -> &T::Object {
> +        // SAFETY: The `gem.offset` field of `drm_gpuva` is =
immutable.
> +        unsafe { <T::Object as =
IntoGEMObject>::from_raw((*self.as_raw()).gem.obj) }
> +    }
> +
> +    /// Returns the underlying [`GpuVmBo`] object that backs this =
[`GpuVa`].
> +    #[inline]
> +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> +        // SAFETY: The `vm_bo` field has been set and is immutable =
for the duration in which this
> +        // `drm_gpuva` is resident in the VM.
> +        unsafe { GpuVmBo::from_raw((*self.as_raw()).vm_bo) }
> +    }
> +}
> +
> +/// A pre-allocated [`GpuVa`] object.
> +///
> +/// # Invariants
> +///
> +/// The memory is zeroed.
> +pub struct GpuVaAlloc<T: DriverGpuVm>(KBox<MaybeUninit<GpuVa<T>>>);
> +
> +impl<T: DriverGpuVm> GpuVaAlloc<T> {
> +    /// Pre-allocate a [`GpuVa`] object.
> +    pub fn new(flags: AllocFlags) -> Result<GpuVaAlloc<T>, =
AllocError> {
> +        // INVARIANTS: Memory allocated with __GFP_ZERO.
> +        Ok(GpuVaAlloc(KBox::new_uninit(flags | __GFP_ZERO)?))
> +    }
> +
> +    /// Prepare this `drm_gpuva` for insertion into the GPUVM.
> +    pub(super) fn prepare(mut self, va_data: impl PinInit<T::VaData>) =
-> *mut bindings::drm_gpuva {
> +        let va_ptr =3D MaybeUninit::as_mut_ptr(&mut self.0);
> +        // SAFETY: The `data` field is pinned.
> +        let Ok(()) =3D unsafe { va_data.__pinned_init(&raw mut =
(*va_ptr).data) };
> +        KBox::into_raw(self.0).cast()
> +    }
> +}
> +
> +/// A [`GpuVa`] object that has been removed.
> +///
> +/// # Invariants
> +///
> +/// The `drm_gpuva` is not resident in the [`GpuVm`].
> +pub struct GpuVaRemoved<T: DriverGpuVm>(KBox<GpuVa<T>>);
> +
> +impl<T: DriverGpuVm> GpuVaRemoved<T> {
> +    /// Convert a raw pointer into a [`GpuVaRemoved`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// Must have been removed from a [`GpuVm<T>`].
> +    pub(super) unsafe fn from_raw(ptr: *mut bindings::drm_gpuva) -> =
Self {
> +        // SAFETY: Since it has been removed we can take ownership of =
allocation.
> +        GpuVaRemoved(unsafe { KBox::from_raw(ptr.cast()) })
> +    }
> +
> +    /// Take ownership of the VA data.
> +    pub fn into_inner(self) -> T::VaData
> +    where
> +        T::VaData: Unpin,
> +    {
> +        KBox::into_inner(self.0).data
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVaRemoved<T> {
> +    type Target =3D T::VaData;
> +    fn deref(&self) -> &T::VaData {
> +        &self.0.data
> +    }
> +}
> +
> +impl<T: DriverGpuVm> DerefMut for GpuVaRemoved<T>
> +where
> +    T::VaData: Unpin,
> +{
> +    fn deref_mut(&mut self) -> &mut T::VaData {
> +        &mut self.0.data
> +    }
> +}
> diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs =
b/rust/kernel/drm/gpuvm/vm_bo.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..f21aa17ea4f42c4a2b57b1f3a57a18dd=
2c3c8b7b
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/vm_bo.rs
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +use super::*;
> +
> +/// Represents that a given GEM object has at least one mapping on =
this [`GpuVm`] instance.
> +///
> +/// Does not assume that GEM lock is held.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVmBo<T: DriverGpuVm> {

Oh, we already have GpuVmBo, and GpuVmBoObtain. I see.

> +    #[pin]
> +    inner: Opaque<bindings::drm_gpuvm_bo>,
> +    #[pin]
> +    data: T::VmBoData,
> +}
> +
> +impl<T: DriverGpuVm> GpuVmBo<T> {
> +    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> *mut =
bindings::drm_gpuvm_bo> =3D {
> +        use core::alloc::Layout;
> +        let base =3D Layout::new::<bindings::drm_gpuvm_bo>();
> +        let rust =3D Layout::new::<Self>();
> +        assert!(base.size() <=3D rust.size());

We should default to something else instead of panicking IMHO.

> +        if base.size() !=3D rust.size() || base.align() !=3D =
rust.align() {
> +            Some(Self::vm_bo_alloc)
> +        } else {
> +            // This causes GPUVM to allocate a `GpuVmBo<T>` with =
`kzalloc(sizeof(drm_gpuvm_bo))`.
> +            None
> +        }
> +    };
> +
> +    pub(super) const FREE_FN: Option<unsafe extern "C" fn(*mut =
bindings::drm_gpuvm_bo)> =3D {
> +        if core::mem::needs_drop::<Self>() {
> +            Some(Self::vm_bo_free)
> +        } else {
> +            // This causes GPUVM to free a `GpuVmBo<T>` with `kfree`.
> +            None
> +        }
> +    };
> +
> +    /// Custom function for allocating a `drm_gpuvm_bo`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Always safe to call. Unsafe to match function pointer type in =
C struct.
> +    unsafe extern "C" fn vm_bo_alloc() -> *mut bindings::drm_gpuvm_bo =
{
> +        KBox::<Self>::new_uninit(GFP_KERNEL | __GFP_ZERO)
> +            .map(KBox::into_raw)
> +            .unwrap_or(ptr::null_mut())
> +            .cast()
> +    }
> +
> +    /// Custom function for freeing a `drm_gpuvm_bo`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The pointer must have been allocated with =
[`GpuVmBo::ALLOC_FN`], and must not be used after
> +    /// this call.
> +    unsafe extern "C" fn vm_bo_free(ptr: *mut bindings::drm_gpuvm_bo) =
{
> +        // SAFETY:
> +        // * The ptr was allocated from kmalloc with the layout of =
`GpuVmBo<T>`.
> +        // * `ptr->inner` has no destructor.
> +        // * `ptr->data` contains a valid `T::VmBoData` that we can =
drop.
> +        drop(unsafe { KBox::<Self>::from_raw(ptr.cast()) });
> +    }
> +
> +    /// Access this [`GpuVmBo`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`, the pointer must reference a valid =
`drm_gpuvm_bo` associated with
> +    /// a [`GpuVm<T>`].
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> =
&'a Self {
> +        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        self.inner.get()
> +    }
> +
> +    /// The [`GpuVm`] that this GEM object is mapped in.
> +    #[inline]
> +    pub fn gpuvm(&self) -> &GpuVm<T> {
> +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> +        unsafe { GpuVm::<T>::from_raw((*self.inner.get()).vm) }
> +    }
> +
> +    /// The [`drm_gem_object`](crate::gem::Object) for these =
mappings.
> +    #[inline]
> +    pub fn obj(&self) -> &T::Object {
> +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> +        unsafe { <T::Object as =
IntoGEMObject>::from_raw((*self.inner.get()).obj) }
> +    }
> +
> +    /// The driver data with this buffer object.
> +    #[inline]
> +    pub fn data(&self) -> &T::VmBoData {
> +        &self.data
> +    }
> +}
> +
> +/// A pre-allocated [`GpuVmBo`] object.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData`, =
has a refcount of one, and is
> +/// absent from any gem, extobj, or evict lists.
> +pub(super) struct GpuVmBoAlloc<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> +
> +impl<T: DriverGpuVm> GpuVmBoAlloc<T> {
> +    /// Create a new pre-allocated [`GpuVmBo`].
> +    ///
> +    /// It's intentional that the initializer is infallible because =
`drm_gpuvm_bo_put` will call
> +    /// drop on the data, so we don't have a way to free it when the =
data is missing.
> +    #[inline]
> +    pub(super) fn new(
> +        gpuvm: &GpuVm<T>,
> +        gem: &T::Object,
> +        value: impl PinInit<T::VmBoData>,
> +    ) -> Result<GpuVmBoAlloc<T>, AllocError> {
> +        // SAFETY: The provided gpuvm and gem ptrs are valid for the =
duration of this call.
> +        let raw_ptr =3D unsafe {
> +            bindings::drm_gpuvm_bo_create(gpuvm.as_raw(), =
gem.as_raw()).cast::<GpuVmBo<T>>()
> +        };
> +        // CAST: `GpuVmBoAlloc::vm_bo_alloc` ensures that this memory =
was allocated with the layout
> +        // of `GpuVmBo<T>`.
> +        let ptr =3D NonNull::new(raw_ptr).ok_or(AllocError)?;
> +        // SAFETY: `ptr->data` is a valid pinned location.
> +        let Ok(()) =3D unsafe { value.__pinned_init(&raw mut =
(*raw_ptr).data) };
> +        // INVARIANTS: We just created the vm_bo so it's absent from =
lists, and the data is valid
> +        // as we just initialized it.
> +        Ok(GpuVmBoAlloc(ptr))
> +    }
> +
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub(super) fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
> +        unsafe { (*self.0.as_ptr()).inner.get() }
> +    }
> +
> +    /// Look up whether there is an existing [`GpuVmBo`] for this gem =
object.
> +    #[inline]
> +    pub(super) fn obtain(self) -> GpuVmBoObtain<T> {
> +        let me =3D ManuallyDrop::new(self);
> +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> +        let ptr =3D unsafe { =
bindings::drm_gpuvm_bo_obtain_prealloc(me.as_raw()) };
> +
> +        // If the vm_bo does not already exist, ensure that it's in =
the extobj list.
> +        if ptr::eq(ptr, me.as_raw()) && =
me.gpuvm().is_extobj(me.obj()) {
> +            let _resv_lock =3D me.gpuvm().resv_lock();
> +            // SAFETY: We hold the GPUVMs resv lock.
> +            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
> +        }
> +
> +        // INVARIANTS: Valid `drm_gpuvm_bo` in the GEM list.
> +        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a =
non-null ptr
> +        GpuVmBoObtain(unsafe { NonNull::new_unchecked(ptr.cast()) })
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmBoAlloc<T> {
> +    type Target =3D GpuVmBo<T>;
> +    #[inline]
> +    fn deref(&self) -> &GpuVmBo<T> {
> +        // SAFETY: By the type invariants we may deref while `Self` =
exists.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: It's safe to perform a deferred put in any =
context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) =
};
> +    }
> +}
> +
> +/// A [`GpuVmBo`] object in the GEM list.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` =
and is present in the gem list.
> +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> +
> +impl<T: DriverGpuVm> GpuVmBoObtain<T> {
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
> +        unsafe { (*self.0.as_ptr()).inner.get() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmBoObtain<T> {
> +    type Target =3D GpuVmBo<T>;
> +    #[inline]
> +    fn deref(&self) -> &GpuVmBo<T> {
> +        // SAFETY: By the type invariants we may deref while `Self` =
exists.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Drop for GpuVmBoObtain<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: It's safe to perform a deferred put in any =
context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) =
};
> +    }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index =
1b82b6945edf25b947afc08300e211bd97150d6b..a4b6c5430198571ec701af2ef452cc9a=
c55870e6 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -6,6 +6,7 @@
> pub mod driver;
> pub mod file;
> pub mod gem;
> +pub mod gpuvm;
> pub mod ioctl;
>=20
> pub use self::device::Device;
>=20
> --=20
> 2.52.0.487.g5c8c507ade-goog
>=20
>=20


My overall opinion is that we=E2=80=99re adding a lot of things that =
will only be
relevant when we=E2=80=99re more advanced on the job submission front. =
This
includes the things that Phillip is working on (i.e.: Fences + =
JobQueue).

Perhaps we should keep this iteration downstream (so we=E2=80=99re sure =
it works
when the time comes) and focus on synchronous VM_BINDS upstream.
The Tyr demo that you=E2=80=99ve tested this on is very helpful for this =
purpose.

Thoughts?

=E2=80=94 Daniel

[0]: =
https://lore.kernel.org/rust-for-linux/20251201102855.4413-1-work@onurozka=
n.dev/T/#m43dc9256c4b18dc8955df968bf0712fc7a9d24c6

