Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A5A97858
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66310E3AF;
	Tue, 22 Apr 2025 21:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b/zy3Ylj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3E10E3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:16:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E372A4A864;
 Tue, 22 Apr 2025 21:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309CAC4CEE9;
 Tue, 22 Apr 2025 21:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745356578;
 bh=w2t/dW01/cUfEQFYsETc4WwCMHtmzZognV2r9SYSusY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/zy3YljBuJHhFnALaU067U4iwalYE7S0OOvvE6i+4zic7pJ27e05Kj7McAOlq8a9
 Wrhxmy+k1niAUSLGaMAV1lbt0L7HPmO6iHkLylIriut89b3yDyzmzb1ysbDZ9fEpMq
 lh/aLe2yiP2GXits67xVi2RcXM4J5+OaTGLG3KmyIQYPSD9ox2wsjrOGeXMB7cn/QT
 dvUt74G4k0KRGpa14k+ZoifXpqWEaUJaYlLroCCIzv7jB2w8sEvQM1Incbyzkjgyo7
 SRS288vo9D0uBFjwgPwS5zOGg0CcM7jnZQ5SRe+fwo/vSJDFgGEaTKx+AnNkjef8Pd
 ETbwIleZRvcRQ==
Date: Tue, 22 Apr 2025 23:16:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 2/2] rust: drm: Add GPUVM abstraction
Message-ID: <aAgHGuzCZzh7YPz2@cassiopeiae>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
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

(Not a full review, but some things that took my attention from a brief look.)

On Tue, Apr 22, 2025 at 01:41:53PM -0300, Daniel Almeida wrote:
> diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..7a074d2c2160ebc5f92909236c5aaecb1853e45d
> --- /dev/null
> +++ b/rust/helpers/drm_gpuvm.c
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +#include <drm/drm_gpuvm.h>
> +
> +#ifdef CONFIG_DRM
> +#ifdef CONFIG_DRM_GPUVM

Why do we need those?

> +/// A transparent wrapper over
> +/// [`bindings::drm_gpuva_op_map`](https://docs.kernel.org/gpu/drm-mm.html#c.drm_gpuva_op_map)
> +///
> +/// Represents the map operation to be carried out by the driver.
> +#[repr(transparent)]
> +pub struct OpMap<T: DriverGpuVm>(bindings::drm_gpuva_op_map, PhantomData<T>);

struct drm_gpuva_op_map must be wrapped in an Opaque. Same for all other ops.

> +
> +impl<T: DriverGpuVm> OpMap<T> {
> +    /// Returns the base address of the new mapping.
> +    #[inline]
> +    pub fn addr(&self) -> u64 {
> +        self.0.va.addr
> +    }
> +
> +    /// Returns the range of the new mapping.
> +    #[inline]
> +    pub fn range(&self) -> u64 {
> +        self.0.va.range
> +    }
> +
> +    /// Returns the offset within the GEM object.
> +    #[inline]
> +    pub fn offset(&self) -> u64 {
> +        self.0.gem.offset
> +    }
> +
> +    /// Returns the GEM object to map.
> +    #[inline]
> +    pub fn object(&self) -> &<T::Driver as drv::Driver>::Object {

You can use drm::Driver instead, which reads much better.

> +        let p = <<T::Driver as drv::Driver>::Object as IntoGEMObject>::from_gem_obj(self.0.gem.obj);
> +        // SAFETY: The GEM object has an active reference for the lifetime of this op
> +        unsafe { &*p }
> +    }
> +
> +    /// A helper function to map and link a [ `GpuVa`] to a [`GpuVmBo`].
> +    pub fn map_and_link_va(

Why are these operations combined? Drivers may need to call them separately,
since they have different locking requirements.

> +        &mut self,
> +        gpuvm: &mut UpdatingGpuVm<'_, T>,
> +        gpuva: Pin<KBox<GpuVa<T>>>,
> +        gpuvmbo: &ARef<GpuVmBo<T>>,
> +    ) -> Result<(), Pin<KBox<GpuVa<T>>>> {
> +        // SAFETY: We are handing off the GpuVa ownership and it will not be moved.
> +        let p = KBox::leak(unsafe { Pin::into_inner_unchecked(gpuva) });
> +        // SAFETY: These C functions are called with the correct invariants
> +        unsafe {
> +            bindings::drm_gpuva_init_from_op(&mut p.gpuva, &mut self.0);
> +            if bindings::drm_gpuva_insert(gpuvm.0.gpuvm() as *mut _, &mut p.gpuva) != 0 {
> +                // EEXIST, return the GpuVa to the caller as an error
> +                return Err(Pin::new_unchecked(KBox::from_raw(p)));
> +            };

How do you ensure that the VM lock is held when there's a list of operations?

> +            // SAFETY: This takes a new reference to the gpuvmbo.
> +            bindings::drm_gpuva_link(&mut p.gpuva, &gpuvmbo.bo as *const _ as *mut _);

How do you ensure that the dma_resv lock is held?

> +        }
> +        Ok(())
> +    }
> +}
> +
> +/// A transparent wrapper over
> +/// [`bindings::drm_gpuva_op_remap`](https://docs.kernel.org/gpu/drm-mm.html#c.drm_gpuva_op_remap).
> +///
> +/// Represents a single remap operation generated by [`GpuVm`].
> +///
> +/// A remap operation is generated when an existing [`GpuVa`] mapping is split
> +/// by inserting a new one or by partially unmapping existing mappings. Hence,
> +/// it consists of a maximum of two maps and one unmap operation,
> +///
> +/// The unmap operation takes care of removing the original existing mapping.
> +/// The `prev` field is used to remap the preceding part and `next` is used to
> +/// remap the subsequent part.
> +///
> +/// If the start address of the new mapping aligns with the start address of the
> +/// old mapping, `prev` will be `None`. Similarly, if the end address of the new
> +/// mapping aligns with the end address of the old mapping, `next` will be
> +/// `None`.
> +///
> +/// Note: the reason for a dedicated remap operation, rather than arbitrary
> +/// unmap and map operations, is to give drivers the chance of extracting driver
> +/// specific data for creating the new mappings from the unmap operations's
> +/// [`GpuVa`] structure which typically is embedded in larger driver specific
> +/// structures.
> +#[repr(transparent)]
> +pub struct OpReMap<T: DriverGpuVm>(bindings::drm_gpuva_op_remap, PhantomData<T>);
> +
> +/// A transparent wrapper over
> +/// [`bindings::drm_gpuva_op_unmap`](https://docs.kernel.org/gpu/drm-mm.html#c.drm_gpuva_op_unmap).
> +///
> +/// Represents a single unmap operation generated by [`GpuVm`].
> +#[repr(transparent)]
> +pub struct OpUnMap<T: DriverGpuVm>(bindings::drm_gpuva_op_unmap, PhantomData<T>);
> +
> +impl<T: DriverGpuVm> OpUnMap<T> {
> +    /// Returns the GPU VA to unmap.
> +    #[inline]
> +    pub fn va(&self) -> Option<&GpuVa<T>> {
> +        if self.0.va.is_null() {
> +            return None;
> +        }
> +        // SAFETY: Container invariant is guaranteed for ops structs created for our types.
> +        let p = unsafe { crate::container_of!(self.0.va, GpuVa<T>, gpuva) as *mut GpuVa<T> };
> +        // SAFETY: The GpuVa object reference is valid per the op_unmap contract
> +        Some(unsafe { &*p })
> +    }
> +
> +    /// Indicates whether this [`GpuVa`] is physically contiguous with the
> +    /// original mapping request.
> +    ///
> +    /// Optionally, if `keep` is set, drivers may keep the actual page table
> +    /// mappings for this [`GpuVa`], adding the missing page table entries only and
> +    /// subsequently updating the VM accordingly.
> +    #[inline]
> +    pub fn keep(&self) -> bool {
> +        self.0.keep
> +    }
> +
> +    /// A helper to unmap and unlink a [`GpuVa`] from a [`GpuVmBo`].

A drm_gpuva_unmap() removes the VA from the internal interval tree, but
drm_gpuva_unlink() removes the VA from the VM_BO's GPUVA list.

> +    pub fn unmap_and_unlink_va(&mut self) -> Option<Pin<KBox<GpuVa<T>>>> {
> +        if self.0.va.is_null() {
> +            return None;
> +        }
> +        // SAFETY: Container invariant is guaranteed for ops structs created for our types.
> +        let p = unsafe { crate::container_of!(self.0.va, GpuVa<T>, gpuva) as *mut GpuVa<T> };
> +
> +        // SAFETY: The GpuVa object reference is valid per the op_unmap contract
> +        unsafe {
> +            bindings::drm_gpuva_unmap(&mut self.0);
> +            bindings::drm_gpuva_unlink(self.0.va);
> +        }

Same questions as in map_and_link_va().

> +
> +        // Unlinking/unmapping relinquishes ownership of the GpuVa object,
> +        // so clear the pointer
> +        self.0.va = core::ptr::null_mut();
> +        // SAFETY: The GpuVa object reference is valid per the op_unmap contract
> +        Some(unsafe { Pin::new_unchecked(KBox::from_raw(p)) })
> +    }
> +}
> +
> +impl<T: DriverGpuVm> OpReMap<T> {
> +    /// Returns the preceding part of a split mapping, if any.
> +    #[inline]
> +    pub fn prev_map(&mut self) -> Option<&mut OpMap<T>> {
> +        // SAFETY: The prev pointer must be valid if not-NULL per the op_remap contract
> +        unsafe { (self.0.prev as *mut OpMap<T>).as_mut() }
> +    }
> +
> +    /// Returns the subsequent part of a split mapping, if any.
> +    #[inline]
> +    pub fn next_map(&mut self) -> Option<&mut OpMap<T>> {
> +        // SAFETY: The next pointer must be valid if not-NULL per the op_remap contract
> +        unsafe { (self.0.next as *mut OpMap<T>).as_mut() }
> +    }
> +
> +    /// Returns the unmap operation for the original existing mapping.
> +    #[inline]
> +    pub fn unmap(&mut self) -> &mut OpUnMap<T> {
> +        // SAFETY: The unmap pointer is always valid per the op_remap contract
> +        unsafe { (self.0.unmap as *mut OpUnMap<T>).as_mut().unwrap() }
> +    }
> +}
> +
> +/// A GPU VA range.
> +///
> +/// Drivers can use `inner` to store additional data.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVa<T: DriverGpuVm> {
> +    #[pin]
> +    gpuva: bindings::drm_gpuva,

Should be wrapped in an Opaque.

> +    #[pin]
> +    inner: T::GpuVa,
> +    #[pin]
> +    _p: PhantomPinned,
> +}
> +
> +// SAFETY: This type is safe to zero-init (as far as C is concerned).
> +unsafe impl init::Zeroable for bindings::drm_gpuva {}
> +
> +impl<T: DriverGpuVm> GpuVa<T> {
> +    /// Creates a new GPU VA.
> +    pub fn new<E>(inner: impl PinInit<T::GpuVa, E>) -> Result<Pin<KBox<GpuVa<T>>>>
> +    where
> +        Error: From<E>,
> +    {
> +        KBox::try_pin_init(
> +            try_pin_init!(Self {
> +                gpuva <- init::zeroed(),
> +                inner <- inner,
> +                _p: PhantomPinned
> +            }),
> +            GFP_KERNEL,
> +        )
> +    }
> +
> +    /// Returns the start address of the GPU VA range.
> +    #[inline]
> +    pub fn addr(&self) -> u64 {
> +        self.gpuva.va.addr
> +    }
> +
> +    /// Returns the range of the GPU VA.
> +    #[inline]
> +    pub fn range(&self) -> u64 {
> +        self.gpuva.va.range
> +    }
> +
> +    /// Returns the offset within the GEM object.
> +    #[inline]
> +    pub fn offset(&self) -> u64 {
> +        self.gpuva.gem.offset
> +    }
> +}
> +
> +/// The connection between a GEM object and a VM.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVmBo<T: DriverGpuVm> {
> +    #[pin]
> +    bo: bindings::drm_gpuvm_bo,

Should be wrapped in an Opaque.

> +    #[pin]
> +    inner: T::GpuVmBo,
> +    #[pin]
> +    _p: PhantomPinned,
> +}
> +
> +impl<T: DriverGpuVm> GpuVmBo<T> {
> +    /// Return a reference to the inner driver data for this [`GpuVmBo`].
> +    pub fn inner(&self) -> &T::GpuVmBo {
> +        &self.inner
> +    }
> +}
> +
> +// SAFETY: DRM GpuVmBo objects are always reference counted and the get/put functions
> +// satisfy the requirements.
> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: The drm_gpuvm_get function satisfies the requirements for inc_ref().
> +        unsafe { bindings::drm_gpuvm_bo_get(&self.bo as *const _ as *mut _) };
> +    }
> +
> +    unsafe fn dec_ref(mut obj: NonNull<Self>) {
> +        // SAFETY: drm_gpuvm_bo_put() requires holding the gpuva lock, which is
> +        // the dma_resv lock by default.
> +        // The drm_gpuvm_put function satisfies the requirements for dec_ref().
> +        // (We do not support custom locks yet.)
> +        unsafe {
> +            let resv = (*obj.as_mut().bo.obj).resv;
> +            bindings::dma_resv_lock(resv, core::ptr::null_mut());
> +            bindings::drm_gpuvm_bo_put(&mut obj.as_mut().bo);
> +            bindings::dma_resv_unlock(resv);

What if the resv_lock is held already? Please also make sure to put multiple
unsafe calls each in a separate unsafe block.

> +        }
> +    }
> +}
> +
> +/// The DRM GPU VA Manager.
> +///
> +/// It keeps track of a GPU's virtual address space by using maple tree
> +/// structures.
> +///
> +/// Typically, an instance of [`GpuVm`] is embedded bigger, driver-specific
> +/// structures.
> +///
> +/// Drivers can pass addresses and ranges in arbitrary units, e.g.: bytes or
> +/// pages.
> +///
> +/// There should be one manager instance per GPU virtual address space.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVm<T: DriverGpuVm> {
> +    #[pin]
> +    gpuvm: Opaque<bindings::drm_gpuvm>,
> +    #[pin]
> +    inner: UnsafeCell<T>,

This looks a bit odd, why does this need UnsafeCell?

> +    #[pin]
> +    _p: PhantomPinned,
> +}
> +
> +/// # Safety
> +///
> +/// This function is only safe to be called from the GPUVM C code.
> +unsafe extern "C" fn vm_free_callback<T: DriverGpuVm>(raw_gpuvm: *mut bindings::drm_gpuvm) {
> +    // SAFETY: Container invariant is guaranteed for objects using our callback.
> +    let p = unsafe {
> +        crate::container_of!(
> +            raw_gpuvm as *mut Opaque<bindings::drm_gpuvm>,
> +            GpuVm<T>,
> +            gpuvm
> +        ) as *mut GpuVm<T>
> +    };
> +
> +    // SAFETY: p is guaranteed to be valid for drm_gpuvm objects using this callback.
> +    unsafe { drop(KBox::from_raw(p)) };
> +}
> +
> +/// # Safety
> +///
> +/// This function is only safe to be called from the GPUVM C code.
> +unsafe extern "C" fn vm_bo_alloc_callback<T: DriverGpuVm>() -> *mut bindings::drm_gpuvm_bo {
> +    let obj: Result<Pin<KBox<GpuVmBo<T>>>> = KBox::try_pin_init(
> +        try_pin_init!(GpuVmBo::<T> {
> +            bo <- init::zeroed(),
> +            inner <- T::GpuVmBo::new(),
> +            _p: PhantomPinned
> +        }),
> +        GFP_KERNEL,
> +    );
> +
> +    match obj {
> +        Ok(obj) =>
> +        // SAFETY: The DRM core will keep this object pinned.
> +        unsafe {
> +            let p = KBox::leak(Pin::into_inner_unchecked(obj));
> +            &mut p.bo
> +        },
> +        Err(_) => core::ptr::null_mut(),
> +    }
> +}
> +
> +/// # Safety
> +///
> +/// This function is only safe to be called from the GPUVM C code.
> +unsafe extern "C" fn vm_bo_free_callback<T: DriverGpuVm>(raw_vm_bo: *mut bindings::drm_gpuvm_bo) {
> +    // SAFETY: Container invariant is guaranteed for objects using this callback.
> +    let p = unsafe { crate::container_of!(raw_vm_bo, GpuVmBo<T>, bo) as *mut GpuVmBo<T> };
> +
> +    // SAFETY: p is guaranteed to be valid for drm_gpuvm_bo objects using this callback.
> +    unsafe { drop(KBox::from_raw(p)) };
> +}
> +
> +/// # Safety
> +///
> +/// This function is only safe to be called from the GPUVM C code.
> +unsafe extern "C" fn step_map_callback<T: DriverGpuVm>(
> +    op: *mut bindings::drm_gpuva_op,
> +    _priv: *mut core::ffi::c_void,
> +) -> core::ffi::c_int {
> +    // SAFETY: We know this is a map op, and OpMap is a transparent wrapper.
> +    let map = unsafe { &mut *((&mut (*op).__bindgen_anon_1.map) as *mut _ as *mut OpMap<T>) };

Please don't create (mutable) references to FFI objects, this happens in various
places.

> +    // SAFETY: This is a pointer to a StepContext created inline in sm_map(), which is
> +    // guaranteed to outlive this function.
> +    let ctx = unsafe { &mut *(_priv as *mut StepContext<'_, T>) };
> +
> +    from_result(|| {
> +        UpdatingGpuVm(ctx.gpuvm).step_map(map, ctx.ctx)?;
> +        Ok(0)
> +    })
> +}
> +
> +/// # Safety
> +///
> +/// This function is only safe to be called from the GPUVM C code.
> +unsafe extern "C" fn step_remap_callback<T: DriverGpuVm>(
> +    op: *mut bindings::drm_gpuva_op,
> +    _priv: *mut core::ffi::c_void,
> +) -> core::ffi::c_int {
> +    // SAFETY: We know this is a map op, and OpReMap is a transparent wrapper.
> +    let remap = unsafe { &mut *((&mut (*op).__bindgen_anon_1.remap) as *mut _ as *mut OpReMap<T>) };
> +    // SAFETY: This is a pointer to a StepContext created inline in sm_map(), which is
> +    // guaranteed to outlive this function.
> +    let ctx = unsafe { &mut *(_priv as *mut StepContext<'_, T>) };
> +
> +    let p_vm_bo = remap.unmap().va().unwrap().gpuva.vm_bo;
> +
> +    let res = {
> +        // SAFETY: vm_bo pointer must be valid and non-null by the step_remap invariants.
> +        // Since we grab a ref, this reference's lifetime is until the decref.
> +        let vm_bo_ref = unsafe {
> +            bindings::drm_gpuvm_bo_get(p_vm_bo);
> +            &*(crate::container_of!(p_vm_bo, GpuVmBo<T>, bo) as *mut GpuVmBo<T>)
> +        };
> +
> +        from_result(|| {
> +            UpdatingGpuVm(ctx.gpuvm).step_remap(remap, vm_bo_ref, ctx.ctx)?;
> +            Ok(0)
> +        })
> +    };
> +
> +    // SAFETY: We incremented the refcount above, and the Rust reference we took is
> +    // no longer in scope.
> +    unsafe { bindings::drm_gpuvm_bo_put(p_vm_bo) };
> +
> +    res
> +}
> +
> +/// # Safety
> +///
> +/// This function is only safe to be called from the GPUVM C code.
> +unsafe extern "C" fn step_unmap_callback<T: DriverGpuVm>(
> +    op: *mut bindings::drm_gpuva_op,
> +    _priv: *mut core::ffi::c_void,
> +) -> core::ffi::c_int {
> +    // SAFETY: We know this is a map op, and OpUnMap is a transparent wrapper.
> +    let unmap = unsafe { &mut *((&mut (*op).__bindgen_anon_1.unmap) as *mut _ as *mut OpUnMap<T>) };
> +    // SAFETY: This is a pointer to a StepContext created inline in sm_map(), which is
> +    // guaranteed to outlive this function.
> +    let ctx = unsafe { &mut *(_priv as *mut StepContext<'_, T>) };
> +
> +    from_result(|| {
> +        UpdatingGpuVm(ctx.gpuvm).step_unmap(unmap, ctx.ctx)?;
> +        Ok(0)
> +    })
> +}
> +
> +impl<T: DriverGpuVm> GpuVm<T> {
> +    const OPS: bindings::drm_gpuvm_ops = bindings::drm_gpuvm_ops {
> +        vm_free: Some(vm_free_callback::<T>),
> +        op_alloc: None,
> +        op_free: None,
> +        vm_bo_alloc: Some(vm_bo_alloc_callback::<T>),
> +        vm_bo_free: Some(vm_bo_free_callback::<T>),
> +        vm_bo_validate: None,
> +        sm_step_map: Some(step_map_callback::<T>),
> +        sm_step_remap: Some(step_remap_callback::<T>),
> +        sm_step_unmap: Some(step_unmap_callback::<T>),
> +    };
> +
> +    fn gpuvm(&self) -> *const bindings::drm_gpuvm {
> +        self.gpuvm.get()
> +    }
> +
> +    /// Creates a GPUVM instance.
> +    pub fn new<E>(
> +        name: &'static CStr,
> +        dev: &device::Device<T::Driver>,

You can use drm::Device instead.

> +        r_obj: &<T::Driver as drv::Driver>::Object,
> +        range: Range<u64>,
> +        reserve_range: Range<u64>,
> +        inner: impl PinInit<T, E>,
> +    ) -> Result<ARef<GpuVm<T>>>
> +    where
> +        Error: From<E>,
> +    {
> +        let obj: Pin<KBox<Self>> = KBox::try_pin_init(
> +            try_pin_init!(Self {
> +                // SAFETY: drm_gpuvm_init cannot fail and always initializes the member.
> +                gpuvm <- unsafe {
> +                    init::pin_init_from_closure(move |slot: *mut Opaque<bindings::drm_gpuvm> | {
> +                        // Zero-init required by drm_gpuvm_init.
> +                        *slot = core::mem::zeroed();
> +                        bindings::drm_gpuvm_init(
> +                            Opaque::raw_get(slot),
> +                            name.as_char_ptr(),
> +                            0,
> +                            dev.as_raw(),
> +                            r_obj.gem_obj() as *const _ as *mut _,
> +                            range.start,
> +                            range.end - range.start,
> +                            reserve_range.start,
> +                            reserve_range.end - reserve_range.start,
> +                            &Self::OPS
> +                        );
> +                        Ok(())
> +                    })
> +                },
> +                // SAFETY: Just passing through to the initializer argument.
> +                inner <- unsafe {
> +                    init::pin_init_from_closure(move |slot: *mut UnsafeCell<T> | {
> +                        inner.__pinned_init(slot as *mut _)
> +                    })
> +                },
> +                _p: PhantomPinned
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        // SAFETY: We never move out of the object.
> +        let vm_ref = unsafe {
> +            ARef::from_raw(NonNull::new_unchecked(KBox::leak(
> +                Pin::into_inner_unchecked(obj),
> +            )))
> +        };
> +
> +        Ok(vm_ref)
> +    }
> +
> +    /// Locks the VM, protecting its interval tree against concurrent accesses.
> +    ///
> +    /// Callers must prove that they have exclusive access to the VM by holding
> +    /// some guard type. This encodes the driver-specific locking requirements.
> +    ///
> +    /// It is up to the caller to ensure that the guard indeed provides the
> +    /// required locking.
> +    pub fn lock<U: ?Sized, B: Backend>(&self, _guard: &mut Guard<'_, U, B>) -> LockedGpuVm<'_, T> {
> +        LockedGpuVm { gpuvm: self }
> +    }
> +
> +    /// Returns true if the given object is external to the GPUVM, i.e.: if it
> +    /// does not share the DMA reservation object of the GPUVM.
> +    pub fn is_extobj(&self, obj: &impl IntoGEMObject) -> bool {
> +        let gem = obj.gem_obj() as *const _ as *mut _;
> +        // SAFETY: This is safe to call as long as the arguments are valid pointers.
> +        unsafe { bindings::drm_gpuvm_is_extobj(self.gpuvm() as *mut _, gem) }
> +    }
> +}
> +
> +// SAFETY: DRM GpuVm objects are always reference counted and the get/put functions
> +// satisfy the requirements.
> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: The drm_gpuvm_get function satisfies the requirements for inc_ref().
> +        unsafe { bindings::drm_gpuvm_get(&self.gpuvm as *const _ as *mut _) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The drm_gpuvm_put function satisfies the requirements for dec_ref().
> +        unsafe { bindings::drm_gpuvm_put(Opaque::raw_get(&(*obj.as_ptr()).gpuvm)) };
> +    }
> +}
> +
> +/// The object returned after a call to [`GpuVm::lock`].
> +///
> +/// This object has access to operations that modify the VM's interval tree.
> +pub struct LockedGpuVm<'a, T: DriverGpuVm> {
> +    gpuvm: &'a GpuVm<T>,
> +}
> +
> +impl<T: DriverGpuVm> LockedGpuVm<'_, T> {
> +    /// Finds the [`GpuVmBo`] object that connects `obj` to this VM.
> +    ///
> +    /// If found, increases the reference count of the GpuVmBo object
> +    /// accordingly.
> +    pub fn find_bo(&mut self, obj: &DriverObject<T>) -> Option<ARef<GpuVmBo<T>>> {
> +        // SAFETY: LockedGpuVm implies the right locks are held.
> +        let p = unsafe {
> +            bindings::drm_gpuvm_bo_find(
> +                self.gpuvm.gpuvm() as *mut _,
> +                obj.gem_obj() as *const _ as *mut _,
> +            )
> +        };
> +
> +        if p.is_null() {
> +            return None;
> +        }
> +
> +        // SAFETY: All the drm_gpuvm_bo objects in this GpuVm are always
> +        // allocated by us as GpuVmBo<T>.
> +        let p = unsafe { crate::container_of!(p, GpuVmBo<T>, bo) as *mut GpuVmBo<T> };
> +        // SAFETY: We checked for NULL above, and the types ensure that
> +        // this object was created by vm_bo_alloc_callback<T>.
> +        Some(unsafe { ARef::from_raw(NonNull::new_unchecked(p)) })
> +    }
> +
> +    /// Obtains the [`GpuVmBo`] object that connects `obj` to this VM.
> +    ///
> +    /// This connection is unique, so an instane of [`GpuVmBo`] will be
> +    /// allocated for `obj` once, and that instance will be returned from that
> +    /// point forward.
> +    pub fn obtain_bo(&mut self, obj: &DriverObject<T>) -> Result<ARef<GpuVmBo<T>>> {
> +        // SAFETY: LockedGpuVm implies the right locks are held.

No, this must be locked by the dma-resv or the GEM gpuva lock, not by the
GPUVM lock that protects the interval tree.

> +        let p = unsafe {
> +            bindings::drm_gpuvm_bo_obtain(
> +                self.gpuvm.gpuvm() as *mut _,
> +                obj.gem_obj() as *const _ as *mut _,
> +            )
> +        };
> +
> +        if p.is_null() {
> +            return Err(ENOMEM);
> +        }
> +
> +        // SAFETY: Container invariant is guaranteed for GpuVmBo objects for this GpuVm.
> +        let p = unsafe { crate::container_of!(p, GpuVmBo<T>, bo) as *mut GpuVmBo<T> };
> +        // SAFETY: We checked for NULL above, and the types ensure that
> +        // this object was created by vm_bo_alloc_callback<T>.
> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(p)) })
> +    }
> +
> +    /// Iterates the given range of the GPU VA space.
> +    ///
> +    /// This utilizes [`DriverGpuVm`] to call back into the driver providing the
> +    /// split and merge steps.
> +    ///
> +    /// A sequence of callbacks can contain map, unmap and remap operations, but
> +    /// the sequence of callbacks might also be empty if no operation is
> +    /// required, e.g. if the requested mapping already exists in the exact same
> +    /// way.
> +    ///
> +    /// There can be an arbitrary amount of unmap operations, a maximum of two
> +    /// remap operations and a single map operation. The latter one represents
> +    /// the original map operation requested by the caller.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// - `ctx`: A driver-specific context.
> +    /// - `req_obj`: The GEM object to map.
> +    /// - `req_addr`: The start address of the new mapping.
> +    /// - `req_range`: The range of the mapping.
> +    /// - `req_offset`: The offset into the GEM object.
> +    pub fn sm_map(
> +        &mut self,
> +        ctx: &mut T::StepContext,
> +        req_obj: &DriverObject<T>,
> +        req_addr: u64,
> +        req_range: u64,
> +        req_offset: u64,
> +    ) -> Result {
> +        let mut ctx = StepContext {
> +            ctx,
> +            gpuvm: self.gpuvm,
> +        };
> +
> +        // SAFETY: LockedGpuVm implies the right locks are held.
> +        to_result(unsafe {
> +            bindings::drm_gpuvm_sm_map(
> +                self.gpuvm.gpuvm() as *mut _,
> +                &mut ctx as *mut _ as *mut _,
> +                req_addr,
> +                req_range,
> +                req_obj.gem_obj() as *const _ as *mut _,
> +                req_offset,
> +            )
> +        })
> +    }
> +
> +    /// Iterates the given range of the GPU VA space.
> +    ///
> +    /// This utilizes [`DriverGpuVm`] to call back into the driver providing the
> +    /// operations to unmap and, if required, split existent mappings.
> +    ///
> +    /// A sequence of callbacks can contain unmap and remap operations,
> +    /// depending on whether there are actual overlapping mappings to split.
> +    ///
> +    /// There can be an arbitrary amount of unmap operations and a maximum of
> +    /// two remap operations.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// - `ctx`: A driver-specific context.
> +    /// - `req_addr`: The start address of the range to unmap.
> +    /// - `req_range`: The range of the mappings to unmap.
> +    pub fn sm_unmap(&mut self, ctx: &mut T::StepContext, req_addr: u64, req_range: u64) -> Result {
> +        let mut ctx = StepContext {
> +            ctx,
> +            gpuvm: self.gpuvm,
> +        };
> +
> +        // SAFETY: LockedGpuVm implies the right locks are held.
> +        to_result(unsafe {
> +            bindings::drm_gpuvm_sm_unmap(
> +                self.gpuvm.gpuvm() as *mut _,
> +                &mut ctx as *mut _ as *mut _,
> +                req_addr,
> +                req_range,
> +            )
> +        })
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for LockedGpuVm<'_, T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &T {
> +        // SAFETY: The existence of this LockedGpuVm implies the lock is held,
> +        // so this is the only reference.
> +        unsafe { &*self.gpuvm.inner.get() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> DerefMut for LockedGpuVm<'_, T> {
> +    fn deref_mut(&mut self) -> &mut T {
> +        // SAFETY: The existence of this UpdatingGpuVm implies the lock is held,
> +        // so this is the only reference.
> +        unsafe { &mut *self.gpuvm.inner.get() }
> +    }
> +}
> +
> +/// A state representing a GPU VM that is being updated.
> +pub struct UpdatingGpuVm<'a, T: DriverGpuVm>(&'a GpuVm<T>);

What does it mean to update a GPUVM instance? How is it different compared to a
LockedGpuVm?

> +
> +impl<T: DriverGpuVm> UpdatingGpuVm<'_, T> {}
> +
> +impl<T: DriverGpuVm> Deref for UpdatingGpuVm<'_, T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &T {
> +        // SAFETY: The existence of this UpdatingGpuVm implies the lock is held,
> +        // so this is the only reference.
> +        unsafe { &*self.0.inner.get() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> DerefMut for UpdatingGpuVm<'_, T> {
> +    fn deref_mut(&mut self) -> &mut T {
> +        // SAFETY: The existence of this UpdatingGpuVm implies the lock is held,
> +        // so this is the only reference.
> +        unsafe { &mut *self.0.inner.get() }
> +    }
> +}
> +
> +// SAFETY: All our trait methods take locks.
> +unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
> +// SAFETY: All our trait methods take locks.
> +unsafe impl<T: DriverGpuVm> Send for GpuVm<T> {}
> +
> +// SAFETY: All our trait methods take locks.
> +unsafe impl<T: DriverGpuVm> Sync for GpuVmBo<T> {}
> +// SAFETY: All our trait methods take locks.
> +unsafe impl<T: DriverGpuVm> Send for GpuVmBo<T> {}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index c44760a1332fa1ef875939b48e7af450f7372020..849dc1e577f15bfada11d6739dff48ac33813326 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -6,4 +6,6 @@
>  pub mod drv;
>  pub mod file;
>  pub mod gem;
> +#[cfg(CONFIG_DRM_GPUVM = "y")]
> +pub mod gpuvm;
>  pub mod ioctl;
> 
> -- 
> 2.49.0
> 
