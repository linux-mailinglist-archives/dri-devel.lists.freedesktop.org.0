Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEFXEfBil2mnxgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:22:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E7161EA9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADD410E73A;
	Thu, 19 Feb 2026 19:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UF9WAmSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F610E73A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:22:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A08A60054;
 Thu, 19 Feb 2026 19:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB3DC4CEF7;
 Thu, 19 Feb 2026 19:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771528938;
 bh=W3ZS+i4Di872LQ0S4OOaNbHiSvr0uLsqYRcd3yHifcM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=UF9WAmSXzQ/eqO1LE8Vz1b5m/RrIi/LHq3p3o1rsthcb3K1k+Acfjh5ri8C3fc2F0
 N//Qai93xXHf6cy6S+EJHzpyRrqZRroniwrF+uomWKq/+oth/e/r+ZX1b0xVJUfWfV
 DzZVkOT+/+v94L/q1B2Fx27cF58ni9KN+HsPcGfQ7etGqsKwbTjwCiWuRJizgBFoC2
 FTL/chwkLRSIxuJ2rG5SsjdXR+UFyPBuiGu1nTaKve1XvsJBgB7Lh/x4yQV3LM/7YV
 vij3/tdnJlMZkll6CLyFjO0JAFmD9T5eHbjIj1a/nPJ0owpDu/bJlLorodItju0716
 MO+dklMJDf+6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 20:22:14 +0100
Message-Id: <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
In-Reply-To: <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
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
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: A43E7161EA9
X-Rspamd-Action: no action

On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> +/// Represents that a given GEM object has at least one mapping on this =
[`GpuVm`] instance.
> +///
> +/// Does not assume that GEM lock is held.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVmBo<T: DriverGpuVm> {
> +    #[pin]
> +    inner: Opaque<bindings::drm_gpuvm_bo>,
> +    #[pin]
> +    data: T::VmBoData,
> +}
> +
> +impl<T: DriverGpuVm> GpuVmBo<T> {
> +    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> *mut bin=
dings::drm_gpuvm_bo> =3D {
> +        use core::alloc::Layout;
> +        let base =3D Layout::new::<bindings::drm_gpuvm_bo>();
> +        let rust =3D Layout::new::<Self>();
> +        assert!(base.size() <=3D rust.size());
> +        if base.size() !=3D rust.size() || base.align() !=3D rust.align(=
) {
> +            Some(Self::vm_bo_alloc)
> +        } else {
> +            // This causes GPUVM to allocate a `GpuVmBo<T>` with `kzallo=
c(sizeof(drm_gpuvm_bo))`.
> +            None

So, if T::VmBoData is a ZST *and* needs drop, we may end up allocating on t=
he C
side and freeing on the Rust side.

I assume this is intentional and there is nothing wrong with it, but withou=
t a
comment it might be a bit subtle.

Another subtlety is that vm_bo_free() and vm_bo_alloc() assume that inner i=
s
always the first member. I'd probably add a brief comment why this even has=
 to
be the case, i.e. vm_bo_alloc() does not return *mut c_void, but *mut
bindings::drm_gpuvm_bo.

> +        }
> +    };
> +
> +    pub(super) const FREE_FN: Option<unsafe extern "C" fn(*mut bindings:=
:drm_gpuvm_bo)> =3D {
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
> +    /// Always safe to call.
> +    unsafe extern "C" fn vm_bo_alloc() -> *mut bindings::drm_gpuvm_bo {
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
> +    /// The pointer must have been allocated with [`GpuVmBo::ALLOC_FN`],=
 and must not be used after
> +    /// this call.
> +    unsafe extern "C" fn vm_bo_free(ptr: *mut bindings::drm_gpuvm_bo) {
> +        // SAFETY:
> +        // * The ptr was allocated from kmalloc with the layout of `GpuV=
mBo<T>`.
> +        // * `ptr->inner` has no destructor.
> +        // * `ptr->data` contains a valid `T::VmBoData` that we can drop=
.
> +        drop(unsafe { KBox::<Self>::from_raw(ptr.cast()) });
> +    }
> +
> +    /// Access this [`GpuVmBo`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`, the pointer must reference a valid `dr=
m_gpuvm_bo` associated with
> +    /// a [`GpuVm<T>`].
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &'a =
Self {

I think this a good candidate for crate private, as we don't want drivers t=
o use
this, but still use it in other DRM core modules.

> +        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {

Less important, but probably also only needed in core DRM code.

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
> +    /// The [`drm_gem_object`](crate::gem::Object) for these mappings.
> +    #[inline]
> +    pub fn obj(&self) -> &T::Object {
> +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> +        unsafe { <T::Object as IntoGEMObject>::from_raw((*self.inner.get=
()).obj) }
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
> +        // CAST: `GpuVmBoAlloc::vm_bo_alloc` ensures that this memory wa=
s allocated with the layout
> +        // of `GpuVmBo<T>`. The type is repr(C), so `container_of` is no=
t required.
> +        // SAFETY: The provided gpuvm and gem ptrs are valid for the dur=
ation of this call.
> +        let raw_ptr =3D unsafe {
> +            bindings::drm_gpuvm_bo_create(gpuvm.as_raw(), gem.as_raw()).=
cast::<GpuVmBo<T>>()
> +        };
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
> +    pub(super) fn obtain(self) -> GpuVmBoRegistered<T> {
> +        let me =3D ManuallyDrop::new(self);
> +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> +        let ptr =3D unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me.a=
s_raw()) };
> +
> +        // Add the vm_bo to the extobj list if it's an external object, =
and if the vm_bo does not
> +        // already exist. (If we are using an existing vm_bo, it's alrea=
dy in the extobj list.)
> +        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj()) {
> +            let resv_lock =3D me.gpuvm().raw_resv();
> +            // SAFETY: The GPUVM is still alive, so its resv lock is too=
.
> +            unsafe { bindings::dma_resv_lock(resv_lock, ptr::null_mut())=
 };

Maybe add a TODO to replace this with a proper lock guard once available?

> +            // SAFETY: We hold the GPUVMs resv lock.
> +            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
> +            // SAFETY: We took the lock, so we can unlock it.
> +            unsafe { bindings::dma_resv_unlock(resv_lock) };
> +        }
> +
> +        // INVARIANTS: Valid `drm_gpuvm_bo` in the GEM list.
> +        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a non-n=
ull ptr
> +        GpuVmBoRegistered(unsafe { NonNull::new_unchecked(ptr.cast()) })
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
> +        // TODO: Call drm_gpuvm_bo_destroy_not_in_lists() directly.
> +        // SAFETY: It's safe to perform a deferred put in any context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> +    }
> +}
> +
> +/// A [`GpuVmBo`] object in the GEM list.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and i=
s present in the gem list.
> +pub struct GpuVmBoRegistered<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);

I know that I proposed to rename this from GpuVmBoResident to GpuVmBoRegist=
ered
in a drive-by comment on v3.

But now that I have a closer look, I think it would be nice to just have Gp=
uVmBo
being the registered one and GpuVmBoAlloc being the pre-allocated one.

As it is currently, I think it is bad to ever present a &GpuVmBo to a drive=
r
because it implies that we don't know whether it is a pre-allocated one or =
a
"normal", registered one. But we do always know.

For instance, in patch 6 we give out &'op GpuVmBo<T>, but it actually carri=
es
the invariant of being registered.

Of course, we could fix this by giving out a &'op GpuVmBoRegistered<T> inst=
ead,
but it would be nice to not have drivers be in touch with a type that can b=
e one
or the other.

I know that the current GpuVmBo<T> also serves the purpose of storing commo=
n
code. Maybe we can make it private, call it GpuVmBoInner<T> and have inline
forwarding methods for GpuVmBo<T> and GpuVmBoAlloc<T>. This is slightly mor=
e
overhead in this implementation due to the forwarding methods, but less
ambiguity for drivers, which I think is more important.

> +impl<T: DriverGpuVm> GpuVmBoRegistered<T> {
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
> +        unsafe { (*self.0.as_ptr()).inner.get() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmBoRegistered<T> {
> +    type Target =3D GpuVmBo<T>;
> +    #[inline]
> +    fn deref(&self) -> &GpuVmBo<T> {
> +        // SAFETY: By the type invariants we may deref while `Self` exis=
ts.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Drop for GpuVmBoRegistered<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: It's safe to perform a deferred put in any context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> +    }
> +}
