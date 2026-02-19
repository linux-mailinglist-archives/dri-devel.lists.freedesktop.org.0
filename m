Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJXLKewfl2nwuwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:36:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5E15F970
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D68D10E6E8;
	Thu, 19 Feb 2026 14:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XZNNiI6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95910E6E8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:36:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E8D9160145;
 Thu, 19 Feb 2026 14:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78253C4CEF7;
 Thu, 19 Feb 2026 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771511784;
 bh=U2h2fXNq15bonU/KsOObw8GNtWEaVPPYqkxrii9vizc=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=XZNNiI6Rz6imH5O12Lk7KKFRXfS2dFCRKz2nUJDHS9/3PiSgqvtlz6Pjlywmx7cgM
 msZhhuGCsA5jBO7aD58zJIgVRn2jFYZjm1Gu1WOtjAVc77mTdTLt6m/pZuFlI3JO2X
 M0QHBcExPY+g6gftvCqT0gbbrAlT2AQJe92M/tz68mpsMteBORDyzKk4bEfREmqNcB
 EDrt19LHu3b1/DCsgwGY8zptjGlbKJKljfidY7BZjsHK9LCaHpfr/IhFH67meJkxxU
 t7m2go690IBO/U1h8FPWWvh5x8jdFmlBY0OEFKavmioys8NDrI0OHGQMfbgH7o6/72
 tPSChGf39Np8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 15:36:20 +0100
Message-Id: <DGJ0IL3LLZRW.3JC9RY1GDIJA6@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/6] rust: drm: add base GPUVM immediate mode
 abstraction
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
In-Reply-To: <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 22F5E15F970
X-Rspamd-Action: no action

On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> +/// A DRM GPU VA manager.
> +///
> +/// This object is refcounted, but the "core" is only accessible using a=
 special unique handle. The
> +/// core consists of the `core` field and the GPUVM's interval tree.

I think this is still a bit confusing, I think we should just rename GpuVmC=
ore
to UniqueGpuVm and rewrite this to something like:

"The driver specific data of of `GpuVm` is only accessible through a
[`UniqueGpuVm`], which guarantees exclusive access."

> +/// # Invariants
> +///
> +/// * Stored in an allocation managed by the refcount in `self.vm`.
> +/// * Access to `data` and the gpuvm interval tree is controlled via the=
 [`GpuVmCore`] type.
> +#[pin_data]
> +pub struct GpuVm<T: DriverGpuVm> {
> +    #[pin]
> +    vm: Opaque<bindings::drm_gpuvm>,
> +    /// Accessed only through the [`GpuVmCore`] reference.
> +    data: UnsafeCell<T>,
> +}
> +
> +// SAFETY: By type invariants, the allocation is managed by the refcount=
 in `self.vm`.
> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: By type invariants, the allocation is managed by the =
refcount in `self.vm`.
> +        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: By type invariants, the allocation is managed by the =
refcount in `self.vm`.
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
> +            vm_bo_alloc: None,
> +            vm_bo_free: None,
> +            vm_bo_validate: None,
> +            sm_step_map: None,
> +            sm_step_unmap: None,
> +            sm_step_remap: None,
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
> +        data: T,

Let's be flexibile and also accept an impl PinInit<T, E> instead.

> +    ) -> Result<GpuVmCore<T>, E>
> +    where
> +        E: From<AllocError>,
> +        E: From<core::convert::Infallible>,
> +    {
> +        let obj =3D KBox::try_pin_init::<E>(
> +            try_pin_init!(Self {
> +                data: UnsafeCell::new(data),
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
> +    }
> +
> +    /// Access this [`GpuVm`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The pointer must reference the `struct drm_gpuvm` in a valid [`G=
puVm<T>`] that remains
> +    /// valid for at least `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a Sel=
f {
> +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuV=
m<T>`. Caller ensures the
> +        // pointer is valid for 'a.
> +        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), Self, v=
m) }

I'd pull the Opaque::cast_from() call out of the unsafe block.

> +    }
> +
> +    /// Returns a raw pointer to the embedded `struct drm_gpuvm`.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm {
> +        self.vm.get()
> +    }
> +
> +    /// The start of the VA space.
> +    #[inline]
> +    pub fn va_start(&self) -> u64 {
> +        // SAFETY: The `mm_start` field is immutable.
> +        unsafe { (*self.as_raw()).mm_start }
> +    }
> +
> +    /// The length of the GPU's virtual address space.
> +    #[inline]
> +    pub fn va_length(&self) -> u64 {
> +        // SAFETY: The `mm_range` field is immutable.
> +        unsafe { (*self.as_raw()).mm_range }
> +    }
> +
> +    /// Returns the range of the GPU virtual address space.
> +    #[inline]
> +    pub fn va_range(&self) -> Range<u64> {
> +        let start =3D self.va_start();
> +        // OVERFLOW: This reconstructs the Range<u64> passed to the cons=
tructor, so it won't fail.
> +        let end =3D start + self.va_length();
> +        Range { start, end }
> +    }
> +
> +    /// Clean up buffer objects that are no longer used.
> +    #[inline]
> +    pub fn deferred_cleanup(&self) {
> +        // SAFETY: This GPUVM uses immediate mode.
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
> +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuV=
m<T>`.
> +        let me =3D unsafe { kernel::container_of!(Opaque::cast_from(me),=
 Self, vm).cast_mut() };
> +        // SAFETY: By type invariants we can free it when refcount hits =
zero.
> +        drop(unsafe { KBox::from_raw(me) })
> +    }
> +}
> +
> +/// The manager for a GPUVM.

This description seems a bit odd. In the end, the trait makes GPUVM aware o=
f
other driver specific types. So, maybe a better name would be
gpuvm::DriverAttributes, gpuvm::DriverTypes, gpuvm::DriverInfo or just
gpuvm::Driver. My favorite is gpuvm::DriverInfo.

We should also change the doc-comment accordingly. Maybe somthing like: "Th=
is
trait make the [`GpuVm`] aware of the other driver specific DRM types."

> +pub trait DriverGpuVm: Sized {
> +    /// Parent `Driver` for this object.
> +    type Driver: drm::Driver<Object =3D Self::Object>;
> +
> +    /// The kind of GEM object stored in this GPUVM.
> +    type Object: IntoGEMObject;
> +}
