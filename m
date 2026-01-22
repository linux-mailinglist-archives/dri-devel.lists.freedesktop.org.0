Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PCfOGaocmnaoQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:44:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5966E439
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD4710EB5C;
	Thu, 22 Jan 2026 22:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WuC4vJSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FC510EB5C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 22:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769121886; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GarmfWTBD7QB/jWQUL9+KziAvxxTWLRKTdYb0S9LHQK3NakOmtllS+7loivyAvabLnBEF/fkImmgx9IDCctp5EMHCB6PKG7r/UDKDGJ7Ph224wI0K/nTCjA2WrzW5gaCduHy5kjRvN5tUUZP/6gox+SRUO/uoc+zy/CHeXV90s8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769121886;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=eec2mK91JKY4bZAzlteozj9r7LGU7+wFH86wrLlHrMU=; 
 b=Tw6o0nR7uUl9mUTv8U9OklaNrInO/o35ZKg31sPS4QEHwcRqHeIzMTa59OZiaPWbWEabNDS5IsCB22YWL7eW8YHmthQS1/zDC4AjwooWZIonN4yZWsSdU1+12DO2FlA7vEWmUPL4Tv4aQt+5TCQ5E5rSXlY99ArnZxMa5ZvgmVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769121886; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=eec2mK91JKY4bZAzlteozj9r7LGU7+wFH86wrLlHrMU=;
 b=WuC4vJSqr9XEPH9UqB/dtSkZhW6Vjhb5WW88wRiwnPtvrFlqaVj1xFkgf18G2WP8
 0IyISwSK1T2jus4IcgzVAFNWC2dQ+rH7ewYC6VE6KcFsx9EEhLfuh0lvxDy8r5VNRDq
 r4sWjYSL3DltRaPGJOk2c7KNtXiNlewxVOHdVJLU=
Received: by mx.zohomail.com with SMTPS id 1769121884481881.3622087118862;
 Thu, 22 Jan 2026 14:44:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 5/6] rust: gpuvm: add GpuVmCore::sm_unmap()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260121-gpuvm-rust-v3-5-dd95c04aec35@google.com>
Date: Thu, 22 Jan 2026 19:43:11 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Asahi Lina <lina+kernel@asahilina.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <180E0324-383E-4813-8CD0-CA15EC3B3EFB@collabora.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-5-dd95c04aec35@google.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.932];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,asahilina.net:email,op.next:url]
X-Rspamd-Queue-Id: 4F5966E439
X-Rspamd-Action: no action

Hi Alice,

> On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> Add the entrypoint for unmapping ranges in the GPUVM, and provide
> callbacks and VA types for the implementation.
>=20
> Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> rust/kernel/drm/gpuvm/mod.rs    |  30 ++++-
> rust/kernel/drm/gpuvm/sm_ops.rs | 264 =
++++++++++++++++++++++++++++++++++++++++
> rust/kernel/drm/gpuvm/va.rs     |   1 -
> rust/kernel/drm/gpuvm/vm_bo.rs  |   8 ++
> 4 files changed, 298 insertions(+), 5 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gpuvm/mod.rs =
b/rust/kernel/drm/gpuvm/mod.rs
> index =
2179ddd717d8728bbe231bd94ea7b5d1e2652543..165a25666ccc3d62e59b73483d4eedff=
044423e9 100644
> --- a/rust/kernel/drm/gpuvm/mod.rs
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -18,6 +18,7 @@
>     bindings,
>     drm,
>     drm::gem::IntoGEMObject,
> +    error::to_result,
>     prelude::*,
>     sync::aref::{
>         ARef,
> @@ -28,6 +29,7 @@
>=20
> use core::{
>     cell::UnsafeCell,
> +    marker::PhantomData,
>     mem::{
>         ManuallyDrop,
>         MaybeUninit, //
> @@ -43,12 +45,15 @@
>     }, //
> };
>=20
> -mod va;
> -pub use self::va::*;
> +mod sm_ops;
> +pub use self::sm_ops::*;
>=20
> mod vm_bo;
> pub use self::vm_bo::*;
>=20
> +mod va;
> +pub use self::va::*;
> +
> /// A DRM GPU VA manager.
> ///
> /// This object is refcounted, but the "core" is only accessible using =
a special unique handle. The
> @@ -89,8 +94,8 @@ const fn vtable() -> &'static =
bindings::drm_gpuvm_ops {
>             vm_bo_free: GpuVmBo::<T>::FREE_FN,
>             vm_bo_validate: None,
>             sm_step_map: None,
> -            sm_step_unmap: None,
> -            sm_step_remap: None,
> +            sm_step_unmap: Some(Self::sm_step_unmap),
> +            sm_step_remap: Some(Self::sm_step_remap),
>         }
>     }
>=20
> @@ -239,6 +244,23 @@ pub trait DriverGpuVm: Sized {
>=20
>     /// Data stored with each `struct drm_gpuvm_bo`.
>     type VmBoData;
> +
> +    /// The private data passed to callbacks.
> +    type SmContext<'ctx>;

As I said, this lifetime fixed an issue that Deborah was having. Thanks =
a lot!

> +
> +    /// Indicates that an existing mapping should be removed.
> +    fn sm_step_unmap<'op, 'ctx>(
> +        &mut self,
> +        op: OpUnmap<'op, Self>,
> +        context: &mut Self::SmContext<'ctx>,
> +    ) -> Result<OpUnmapped<'op, Self>, Error>;
> +
> +    /// Indicates that an existing mapping should be split up.
> +    fn sm_step_remap<'op, 'ctx>(
> +        &mut self,
> +        op: OpRemap<'op, Self>,
> +        context: &mut Self::SmContext<'ctx>,
> +    ) -> Result<OpRemapped<'op, Self>, Error>;
> }
>=20
> /// The core of the DRM GPU VA manager.
> diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs =
b/rust/kernel/drm/gpuvm/sm_ops.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..3c29d10d63f0b0a1976c714a86d48694=
8ba81a15
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/sm_ops.rs
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +use super::*;
> +
> +/// The actual data that gets threaded through the callbacks.
> +struct SmData<'a, 'ctx, T: DriverGpuVm> {
> +    gpuvm: &'a mut GpuVmCore<T>,
> +    user_context: &'a mut T::SmContext<'ctx>,
> +}
> +
> +/// Represents an `sm_step_unmap` operation that has not yet been =
completed.
> +pub struct OpUnmap<'op, T: DriverGpuVm> {
> +    op: &'op bindings::drm_gpuva_op_unmap,
> +    _invariant: PhantomData<*mut &'op mut T>,

Would have been cool to explain why we have a pointer in this =
PhantomData.

Same elsewhere, IMHO. Helps with maintainability in the future.

(To be honest, I=E2=80=99m not really sure what=E2=80=99s going on =
here..)


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
> +/// Represents an `sm_step_remap` operation that has not yet been =
completed.
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

We should probably link to the Rust VA type using [`GpuVa`] or =
something? Nbd either way.

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
> +        let gpuva_guard =3D self.vm_bo().lock_gpuva();
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
> +        drop(gpuva_guard);
> +
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
> +    /// Remove any mappings in the given region.
> +    ///
> +    /// Internally calls [`DriverGpuVm::sm_step_unmap`] for ranges =
entirely contained within the
> +    /// given range, and [`DriverGpuVm::sm_step_remap`] for ranges =
that overlap with the range.
> +    #[inline]
> +    pub fn sm_unmap(&mut self, addr: u64, length: u64, context: &mut =
T::SmContext<'_>) -> Result {
> +        let gpuvm =3D self.as_raw();
> +        let mut p =3D SmData {
> +            gpuvm: self,
> +            user_context: context,
> +        };
> +        // SAFETY:
> +        // * raw_request() creates a valid request.
> +        // * The private data is valid to be interpreted as SmData.
> +        to_result(unsafe { bindings::drm_gpuvm_sm_unmap(gpuvm, (&raw =
mut p).cast(), addr, length) })
> +    }
> +}
> +
> +impl<T: DriverGpuVm> GpuVm<T> {
> +    /// # Safety
> +    /// Must be called from `sm_unmap` with a pointer to `SmData`.
> +    pub(super) unsafe extern "C" fn sm_step_unmap(
> +        op: *mut bindings::drm_gpuva_op,
> +        p: *mut c_void,
> +    ) -> c_int {
> +        // SAFETY: The caller provides a pointer to `SmData`.
> +        let p =3D unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
> +        let op =3D OpUnmap {
> +            // SAFETY: sm_step_unmap is called with an unmap =
operation.
> +            op: unsafe { &(*op).__bindgen_anon_1.unmap },
> +            _invariant: PhantomData,
> +        };
> +        match p.gpuvm.data().sm_step_unmap(op, p.user_context) {
> +            Ok(OpUnmapped { .. }) =3D> 0,
> +            Err(err) =3D> err.to_errno(),
> +        }
> +    }
> +
> +    /// # Safety
> +    /// Must be called from `sm_unmap` with a pointer to `SmData`.
> +    pub(super) unsafe extern "C" fn sm_step_remap(
> +        op: *mut bindings::drm_gpuva_op,
> +        p: *mut c_void,
> +    ) -> c_int {
> +        // SAFETY: The caller provides a pointer to `SmData`.
> +        let p =3D unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
> +        let op =3D OpRemap {
> +            // SAFETY: sm_step_remap is called with a remap =
operation.
> +            op: unsafe { &(*op).__bindgen_anon_1.remap },
> +            _invariant: PhantomData,
> +        };
> +        match p.gpuvm.data().sm_step_remap(op, p.user_context) {
> +            Ok(OpRemapped { .. }) =3D> 0,
> +            Err(err) =3D> err.to_errno(),
> +        }
> +    }
> +}
> diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
> index =
c96796a6b2c8c7c4b5475324562968ca0f07fd09..a31122ff22282186a1d76d4bb085714f=
6465722b 100644
> --- a/rust/kernel/drm/gpuvm/va.rs
> +++ b/rust/kernel/drm/gpuvm/va.rs
> @@ -1,6 +1,5 @@
> // SPDX-License-Identifier: GPL-2.0 OR MIT
>=20
> -#![expect(dead_code)]
> use super::*;
>=20
> /// Represents that a range of a GEM object is mapped in this =
[`GpuVm`] instance.
> diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs =
b/rust/kernel/drm/gpuvm/vm_bo.rs
> index =
310fa569b5bd43f0f872ff859b3624377b93d651..f600dfb15379233111b5893f6aa85a12=
e6c9e131 100644
> --- a/rust/kernel/drm/gpuvm/vm_bo.rs
> +++ b/rust/kernel/drm/gpuvm/vm_bo.rs
> @@ -101,6 +101,14 @@ pub fn obj(&self) -> &T::Object {
>     pub fn data(&self) -> &T::VmBoData {
>         &self.data
>     }
> +
> +    pub(super) fn lock_gpuva(&self) -> crate::sync::MutexGuard<'_, =
()> {
> +        // SAFETY: The GEM object is valid.
> +        let ptr =3D unsafe { &raw mut =
(*self.obj().as_raw()).gpuva.lock };
> +        // SAFETY: The GEM object is valid, so the mutex is properly =
initialized.
> +        let mutex =3D unsafe { crate::sync::Mutex::from_raw(ptr) };
> +        mutex.lock()
> +    }
> }
>=20
> /// A pre-allocated [`GpuVmBo`] object.
>=20
> --=20
> 2.52.0.457.g6b5491de43-goog
>=20
>=20


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

