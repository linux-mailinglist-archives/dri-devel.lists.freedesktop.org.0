Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0BCD0852
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA5B10F035;
	Fri, 19 Dec 2025 15:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WUSPcwLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC7710F02A;
 Fri, 19 Dec 2025 15:35:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A84F42B80;
 Fri, 19 Dec 2025 15:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC39C4CEF1;
 Fri, 19 Dec 2025 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766158510;
 bh=XqVFVdT5Lvfd9WE1C2Ab+JTQaZ16Qoe9Aw4jzm+ggtQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=WUSPcwLH89aHug94e7Pg+8gwdqqZ5uL2uioQmOjI/sVZaQ0rVvtk4cJIk7qrSUclY
 liiCbCJkmNxwl1lhn9Zch2VvFeJv/hRK9MiDqRkydFA7dQ3UwjVi9Zcf5d+uG4GzhO
 zThGF9IhZyMgQ60lFLe8Q33e2fJpxlHCCGoGykDoj51EwXfl3vNlcAa4TykJYG7DLi
 ogOn1OU4jhva1xEntIYjijHFHGV+9hwvA/g/+FPKpWjvYi6OMDCuEhdALjK7zUcDUw
 2K3a+93dyyzCr3nYCa7MP0zdRJTrgTToTvVbO4VQVtv9ArRwmubObdjUCjmgfGGaUG
 DHPC826vXNtWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 16:35:00 +0100
Message-Id: <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Steven Price" <steven.price@arm.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Frank Binns" <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Lyude Paul" <lyude@redhat.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
In-Reply-To: <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
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

On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..18b7dbd2e32c3162455b344e7=
2ec2940c632cc6b
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
> +     return drm_gpuvm_get(obj);
> +}
> +
> +void rust_helper_drm_gpuva_init_from_op(struct drm_gpuva *va, struct drm=
_gpuva_op_map *op)
> +{
> +     drm_gpuva_init_from_op(va, op);
> +}
> +
> +struct drm_gpuvm_bo *rust_helper_drm_gpuvm_bo_get(struct drm_gpuvm_bo *v=
m_bo)
> +{
> +     return drm_gpuvm_bo_get(vm_bo);
> +}
> +
> +void rust_helper_drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
> +{
> +     return drm_gpuvm_exec_unlock(vm_exec);
> +}
> +
> +bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
> +                                  struct drm_gem_object *obj)
> +{
> +     return drm_gpuvm_is_extobj(gpuvm, obj);
> +}
> +
> +int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ct=
x *ctx)
> +{
> +     return dma_resv_lock(obj, ctx);
> +}
> +
> +void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> +{
> +     dma_resv_unlock(obj);
> +}

The dma_resv_*() helpers should go into their own file and should not depen=
d on
CONFIG_DRM_GPUVM.

> +
> +#endif // CONFIG_DRM_GPUVM
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 551da6c9b5064c324d6f62bafcec672c6c6f5bee..91f45155eb9c2c4e92b56ee1a=
bf7d45188873f3c 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -26,6 +26,7 @@
>  #include "device.c"
>  #include "dma.c"
>  #include "drm.c"
> +#include "drm_gpuvm.c"
>  #include "err.c"
>  #include "irq.c"
>  #include "fs.c"
> diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..9834dbb938a3622e46048e9b8=
e06bc6bf03aa0d2
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM GPUVM in immediate mode
> +//!
> +//! Rust abstractions for using GPUVM in immediate mode. This is when th=
e GPUVM state is updated
> +//! during `run_job()`, i.e., in the DMA fence signalling critical path,=
 to ensure that the GPUVM
> +//! and the GPU's virtual address space has the same state at all times.

Just a note: once we got the modes of operation section in place on the C s=
ide,
we should refer to it from here.

> +//!
> +//! C header: [`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.=
h)
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

Kernel vertical style.

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
> +/// This object is refcounted, but the "core" is only accessible using a=
 special unique handle. The
> +/// core consists of the `core` field and the GPUVM's interval tree.

I think this is a bit confusing, the 'core' field seems to be the drivers
private data that is protected with the same lock as the GPUVM's interval t=
ree,
so I'd just call it 'data', or 'protected_data', etc.

Establishing the term 'core' as a state to refer to the private data and th=
e
interval tree being accessible makes sense to me.

> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVm<T: DriverGpuVm> {
> +    #[pin]
> +    vm: Opaque<bindings::drm_gpuvm>,
> +    /// Accessed only through the [`GpuVmCore`] reference.
> +    core: UnsafeCell<T>,
> +    /// Shared data not protected by any lock.
> +    #[pin]
> +    shared_data: T::SharedData,

I think it deserves some documentation to have two separate driver private =
data
fields.

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
> +                    // SAFETY: These arguments are valid. `vm` is valid =
until refcount drops to
> +                    // zero.
> +                    unsafe {
> +                        bindings::drm_gpuvm_init(
> +                            vm,
> +                            name.as_char_ptr(),
> +                            bindings::drm_gpuvm_flags_DRM_GPUVM_IMMEDIAT=
E_MODE
> +                                | bindings::drm_gpuvm_flags_DRM_GPUVM_RE=
SV_PROTECTED,
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

There are some other intentionally incomplete safety comments that just say
"dox" as mentioned in the commit message. Given that this has a comment, ju=
st a
quick reminder to rework this one as well.

> +    }
> +
> +    /// Access this [`GpuVm`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`, the pointer must reference a valid [`G=
puVm<T>`].

The pointer must reference a valid struct drm_gpuvm that is embedded withti=
n a
GpuVm<T>.

> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a Sel=
f {
> +        // SAFETY: `drm_gpuvm` is first field and `repr(C)`.

Reminder: This needs some expansion.

> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get a raw pointer.

I assume you intend to expand some of the comments a bit, here I'd say some=
thing
like "Returns a raw pointer to the embedded `struct drm_gpuvm`.

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

Missing period. I'd also say "The length of the GPU's virtual address space=
.".

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
> +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> +    #[inline]
> +    pub fn obtain(
> +        &self,
> +        obj: &T::Object,
> +        data: impl PinInit<T::VmBoData>,
> +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
> +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> +    }

Does this method make sense? We usually preallocate a VM_BO, then enter the
fence signalling critical path and then obtain the VM_BO.

> +
> +    /// Prepare this GPUVM.
> +    #[inline]
> +    pub fn prepare(&self, num_fences: u32) -> impl PinInit<GpuVmExec<'_,=
 T>, Error> {
> +        try_pin_init!(GpuVmExec {
> +            exec <- Opaque::try_ffi_init(|exec: *mut bindings::drm_gpuvm=
_exec| {
> +                // SAFETY: exec is valid but unused memory, so we can wr=
ite.
> +                unsafe {
> +                    ptr::write_bytes(exec, 0u8, 1usize);
> +                    ptr::write(&raw mut (*exec).vm, self.as_raw());
> +                    ptr::write(&raw mut (*exec).flags, bindings::DRM_EXE=
C_INTERRUPTIBLE_WAIT);
> +                    ptr::write(&raw mut (*exec).num_fences, num_fences);
> +                }
> +
> +                // SAFETY: We can prepare the GPUVM.
> +                to_result(unsafe { bindings::drm_gpuvm_exec_lock(exec) }=
)
> +            }),
> +            _gpuvm: PhantomData,
> +        })
> +    }
> +
> +    /// Clean up buffer objects that are no longer used.
> +    #[inline]
> +    pub fn deferred_cleanup(&self) {
> +        // SAFETY: Always safe to perform deferred cleanup.
> +        unsafe { bindings::drm_gpuvm_bo_deferred_cleanup(self.as_raw()) =
}
> +    }
> +
> +    /// Check if this GEM object is an external object for this GPUVM.
> +    #[inline]
> +    pub fn is_extobj(&self, obj: &T::Object) -> bool {
> +        // SAFETY: We may call this with any GPUVM and GEM object.
> +        unsafe { bindings::drm_gpuvm_is_extobj(self.as_raw(), obj.as_raw=
()) }
> +    }
> +
> +    /// Free this GPUVM.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Called when refcount hits zero.
> +    unsafe extern "C" fn vm_free(me: *mut bindings::drm_gpuvm) {
> +        // SAFETY: GPUVM was allocated with KBox and can now be freed.
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

I think you forgot to complete the sentence.

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

Hm..it seems more natural to me to deref to &GpuVm<T> and provide data() an=
d
data_mut().

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
> +    /// For in kernel memory management only (e.g. copying, clearing mem=
ory).
> +    Kernel =3D bindings::dma_resv_usage_DMA_RESV_USAGE_KERNEL,
> +    /// Implicit write synchronization for userspace submissions.
> +    Write =3D bindings::dma_resv_usage_DMA_RESV_USAGE_WRITE,
> +    /// Implicit read synchronization for userspace submissions.
> +    Read =3D bindings::dma_resv_usage_DMA_RESV_USAGE_READ,
> +    /// No implicit sync (e.g. preemption fences, page table updates, TL=
B flushes).
> +    Bookkeep =3D bindings::dma_resv_usage_DMA_RESV_USAGE_BOOKKEEP,
> +}

That belongs into a dma_resv abstraction instead.

> +
> +/// A lock guard for the GPUVM's resv lock.
> +///
> +/// This guard provides access to the extobj and evicted lists.
> +///
> +/// # Invariants
> +///
> +/// Holds the GPUVM resv lock.
> +pub struct GpuvmResvLockGuard<'a, T: DriverGpuVm>(&'a GpuVm<T>);
> +
> +impl<T: DriverGpuVm> GpuVm<T> {
> +    /// Lock the VM's resv lock.
> +    #[inline]
> +    pub fn resv_lock(&self) -> GpuvmResvLockGuard<'_, T> {
> +        // SAFETY: It's always ok to lock the resv lock.
> +        unsafe { bindings::dma_resv_lock(self.raw_resv_lock(), ptr::null=
_mut()) };
> +        // INVARIANTS: We took the lock.
> +        GpuvmResvLockGuard(self)
> +    }
> +
> +    #[inline]
> +    fn raw_resv_lock(&self) -> *mut bindings::dma_resv {
> +        // SAFETY: `r_obj` is immutable and valid for duration of GPUVM.
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
> diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm_o=
ps.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..c0dbd4675de644a3b1cbe7d52=
8194ca7fb471848
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
> +///  /**
> +///   * @va: structure containing address and range of a map
> +///   * operation
> +///   */
> +///  struct {
> +///          /**
> +///           * @va.addr: the base address of the new mapping
> +///           */
> +///          u64 addr;
> +///
> +///          /**
> +///           * @va.range: the range of the new mapping
> +///           */
> +///          u64 range;
> +///  } va;
> +///
> +///  /**
> +///   * @gem: structure containing the &drm_gem_object and it's offset
> +///   */
> +///  struct {
> +///          /**
> +///           * @gem.offset: the offset within the &drm_gem_object
> +///           */
> +///          u64 offset;
> +///
> +///          /**
> +///           * @gem.obj: the &drm_gem_object to map
> +///           */
> +///          struct drm_gem_object *obj;
> +///  } gem;
> +/// };
> +/// ```
> +pub struct OpMap<'op, T: DriverGpuVm> {
> +    op: &'op bindings::drm_gpuva_op_map,
> +    // Since these abstractions are designed for immediate mode, the VM =
BO needs to be
> +    // pre-allocated, so we always have it available when we reach this =
point.
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
> +        unsafe { <T::Object as IntoGEMObject>::from_raw(self.op.gem.obj)=
 }
> +    }
> +
> +    /// The [`GpuVmBo`] that the new VA will be associated with.
> +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> +        self.vm_bo
> +    }
> +
> +    /// Use the pre-allocated VA to carry out this map operation.
> +    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl PinInit<T::VaDa=
ta>) -> OpMapped<'op, T> {
> +        let va =3D va.prepare(va_data);
> +        // SAFETY: By the type invariants we may access the interval tre=
e.
> +        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va=
, self.op) };
> +        // SAFETY: The GEM object is valid, so the mutex is properly ini=
tialized.
> +        unsafe { bindings::mutex_lock(&raw mut (*self.op.gem.obj).gpuva.=
lock) };

This seems to be used at least twice, maybe a helper that takes a closure
between the raw mutex_lock() and mutex_unlock() is appropriate?

> +        // SAFETY: The va is prepared for insertion, and we hold the GEM=
 lock.
> +        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
> +        // SAFETY: We took the mutex above, so we may unlock it.
> +        unsafe { bindings::mutex_unlock(&raw mut (*self.op.gem.obj).gpuv=
a.lock) };
> +        OpMapped {
> +            _invariant: self._invariant,
> +        }
> +    }
> +}
> +
> +/// Represents a completed [`OpMap`] operation.

Can you please add a brief comment what this type is used for?

Also, we have lots of new types to represent a certain state. Can you pleas=
e
list all of them in a global documentation section explaining the states?

I think it would be nice if we could use the type state pattern, but it see=
ms
it would be quite unergonomic.

> +pub struct OpMapped<'op, T> {
> +    _invariant: PhantomData<*mut &'op mut T>,
> +}

<snip>

> +/// A pre-allocated [`GpuVmBo`] object.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData`, has =
a refcount of one, and is
> +/// absent from any gem, extobj, or evict lists.
> +pub(super) struct GpuVmBoAlloc<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> +
> +impl<T: DriverGpuVm> GpuVmBoAlloc<T> {
> +    /// Create a new pre-allocated [`GpuVmBo`].
> +    ///
> +    /// It's intentional that the initializer is infallible because `drm=
_gpuvm_bo_put` will call
> +    /// drop on the data, so we don't have a way to free it when the dat=
a is missing.
> +    #[inline]
> +    pub(super) fn new(
> +        gpuvm: &GpuVm<T>,
> +        gem: &T::Object,
> +        value: impl PinInit<T::VmBoData>,
> +    ) -> Result<GpuVmBoAlloc<T>, AllocError> {
> +        // SAFETY: The provided gpuvm and gem ptrs are valid for the dur=
ation of this call.
> +        let raw_ptr =3D unsafe {
> +            bindings::drm_gpuvm_bo_create(gpuvm.as_raw(), gem.as_raw()).=
cast::<GpuVmBo<T>>()
> +        };
> +        // CAST: `GpuVmBoAlloc::vm_bo_alloc` ensures that this memory wa=
s allocated with the layout
> +        // of `GpuVmBo<T>`.
> +        let ptr =3D NonNull::new(raw_ptr).ok_or(AllocError)?;
> +        // SAFETY: `ptr->data` is a valid pinned location.
> +        let Ok(()) =3D unsafe { value.__pinned_init(&raw mut (*raw_ptr).=
data) };
> +        // INVARIANTS: We just created the vm_bo so it's absent from lis=
ts, and the data is valid
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
> +    /// Look up whether there is an existing [`GpuVmBo`] for this gem ob=
ject.
> +    #[inline]
> +    pub(super) fn obtain(self) -> GpuVmBoObtain<T> {
> +        let me =3D ManuallyDrop::new(self);
> +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> +        let ptr =3D unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me.a=
s_raw()) };
> +
> +        // If the vm_bo does not already exist, ensure that it's in the =
extobj list.
> +        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj()) {
> +            let _resv_lock =3D me.gpuvm().resv_lock();
> +            // SAFETY: We hold the GPUVMs resv lock.
> +            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
> +        }
> +
> +        // INVARIANTS: Valid `drm_gpuvm_bo` in the GEM list.
> +        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a non-n=
ull ptr
> +        GpuVmBoObtain(unsafe { NonNull::new_unchecked(ptr.cast()) })
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmBoAlloc<T> {
> +    type Target =3D GpuVmBo<T>;
> +    #[inline]
> +    fn deref(&self) -> &GpuVmBo<T> {
> +        // SAFETY: By the type invariants we may deref while `Self` exis=
ts.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: It's safe to perform a deferred put in any context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };

This does not need to be deferred, no?

> +    }
> +}
> +
> +/// A [`GpuVmBo`] object in the GEM list.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and i=
s present in the gem list.
> +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);

How is this different from GpuVmBo? The only object that is not in the GEM =
list
should be GpuVmBoAlloc, i.e. the preallocated one.

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
> +        // SAFETY: By the type invariants we may deref while `Self` exis=
ts.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Drop for GpuVmBoObtain<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: It's safe to perform a deferred put in any context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> +    }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 1b82b6945edf25b947afc08300e211bd97150d6b..a4b6c5430198571ec701af2ef=
452cc9ac55870e6 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -6,6 +6,7 @@
>  pub mod driver;
>  pub mod file;
>  pub mod gem;
> +pub mod gpuvm;
>  pub mod ioctl;
> =20
>  pub use self::device::Device;
>
> --=20
> 2.52.0.487.g5c8c507ade-goog
