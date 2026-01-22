Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iINpHMqrcmkkogAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:59:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70456E58A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825FB10EB7B;
	Thu, 22 Jan 2026 22:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YoqgRqia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E638510EB7B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 22:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769122754; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R2LgV6nO61qyIBRzpT6fvAgaRGTX8pcchNo4cibRB71QoqR2Pn/Nn8UTO61h+CjEGDyVSLfa1AOGUo5TU8fK7oSVRPYf2WgXGR4H0VTKIJ5HmJ4R9fdj/zSmN79SuUzJOqa7y28vrmXdSdSlVZw0DEj7AVds9+1oZ5TtjJ5J++s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769122754;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6NxrSyB17i1u2lohsrtKjXZ/8YsKz352zKNyIofAbZg=; 
 b=Ucra3kxSV2TokKAzkaiJCKczeqGei3IQ+CHf8Xnt21GS9SwLPPFPgYVdry4T4Zpfm7samrB2FC37VeZEw6GVfYUVQhaveE03abjo4BeCeODW0Dm/OOHi4/LGFlXK9Lbvv+RFJS6PhQO+qKgHrXw3Xqk2n6Ij570++XGX3LbJVBg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769122754; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=6NxrSyB17i1u2lohsrtKjXZ/8YsKz352zKNyIofAbZg=;
 b=YoqgRqiaOJ+kpbSKWYgMqoSvI0/iIBAMs2cByfHHy8IKRzUF1jjqbxVplTYZKFGu
 YKVXOD6CedbubiNVGaHu1loqMIrQbiggr0r30QyyL/bZHbKYpIyoB7PHJabPx0W5GhM
 cRl533/rQmTAtDEecnHmCCme3EhsMsszLN3V4ax8=
Received: by mx.zohomail.com with SMTPS id 1769122751318268.23325911627626;
 Thu, 22 Jan 2026 14:59:11 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 6/6] rust: gpuvm: add GpuVmCore::sm_map()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260121-gpuvm-rust-v3-6-dd95c04aec35@google.com>
Date: Thu, 22 Jan 2026 19:58:34 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Asahi Lina <lina+kernel@asahilina.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C5177DB-CEBA-4DD5-8E93-DB39CB1F2079@collabora.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-6-dd95c04aec35@google.com>
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
	NEURAL_HAM(-0.00)[-0.931];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,asahilina.net:email]
X-Rspamd-Queue-Id: B70456E58A
X-Rspamd-Action: no action

Hi Alice,

> On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> Finally also add the operation for creating new mappings. Mapping
> operations need extra data in the context since they involve a vm_bo
> coming from the outside.
>=20
> Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> rust/kernel/drm/gpuvm/mod.rs    |   9 ++-
> rust/kernel/drm/gpuvm/sm_ops.rs | 154 =
++++++++++++++++++++++++++++++++++++++--
> 2 files changed, 157 insertions(+), 6 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gpuvm/mod.rs =
b/rust/kernel/drm/gpuvm/mod.rs
> index =
165a25666ccc3d62e59b73483d4eedff044423e9..557c0d629eec912a97fc4ef18495d5bf=
0807db0a 100644
> --- a/rust/kernel/drm/gpuvm/mod.rs
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -93,7 +93,7 @@ const fn vtable() -> &'static =
bindings::drm_gpuvm_ops {
>             vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
>             vm_bo_free: GpuVmBo::<T>::FREE_FN,
>             vm_bo_validate: None,
> -            sm_step_map: None,
> +            sm_step_map: Some(Self::sm_step_map),
>             sm_step_unmap: Some(Self::sm_step_unmap),
>             sm_step_remap: Some(Self::sm_step_remap),
>         }
> @@ -248,6 +248,13 @@ pub trait DriverGpuVm: Sized {
>     /// The private data passed to callbacks.
>     type SmContext<'ctx>;
>=20
> +    /// Indicates that a new mapping should be created.
> +    fn sm_step_map<'op, 'ctx>(
> +        &mut self,
> +        op: OpMap<'op, Self>,
> +        context: &mut Self::SmContext<'ctx>,
> +    ) -> Result<OpMapped<'op, Self>, Error>;
> +
>     /// Indicates that an existing mapping should be removed.
>     fn sm_step_unmap<'op, 'ctx>(
>         &mut self,
> diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs =
b/rust/kernel/drm/gpuvm/sm_ops.rs
> index =
3c29d10d63f0b0a1976c714a86d486948ba81a15..5f3c5d3918147a6962e5658443c34383=
5baa10b8 100644
> --- a/rust/kernel/drm/gpuvm/sm_ops.rs
> +++ b/rust/kernel/drm/gpuvm/sm_ops.rs
> @@ -8,6 +8,100 @@ struct SmData<'a, 'ctx, T: DriverGpuVm> {
>     user_context: &'a mut T::SmContext<'ctx>,
> }
>=20
> +#[repr(C)]
> +struct SmMapData<'a, 'ctx, T: DriverGpuVm> {
> +    sm_data: SmData<'a, 'ctx, T>,
> +    vm_bo: GpuVmBoResident<T>,
> +}
> +
> +/// The argument for [`GpuVmCore::sm_map`].
> +pub struct OpMapRequest<'a, 'ctx, T: DriverGpuVm> {
> +    /// Address in GPU virtual address space.
> +    pub addr: u64,
> +    /// Length of mapping to create.
> +    pub range: u64,
> +    /// Offset in GEM object.
> +    pub offset: u64,

I=E2=80=99d rename this gem_offset. A bit vague/confusing otherwise.

> +    /// The GEM object to map.
> +    pub vm_bo: GpuVmBoResident<T>,
> +    /// The user-provided context type.
> +    pub context: &'a mut T::SmContext<'ctx>,
> +}
> +
> +impl<'a, 'ctx, T: DriverGpuVm> OpMapRequest<'a, 'ctx, T> {
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
> +/// Represents an `sm_step_map` operation that has not yet been =
completed.

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
> +
> +        let _gpuva_guard =3D self.vm_bo().lock_gpuva();
> +        // SAFETY: The va is prepared for insertion, and we hold the =
GEM lock.
> +        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
> +
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
> /// Represents an `sm_step_unmap` operation that has not yet been =
completed.
> pub struct OpUnmap<'op, T: DriverGpuVm> {
>     op: &'op bindings::drm_gpuva_op_unmap,
> @@ -205,6 +299,30 @@ pub struct OpRemapped<'op, T> {
> }
>=20
> impl<T: DriverGpuVm> GpuVmCore<T> {
> +    /// Create a mapping, removing or remapping anything that =
overlaps.
> +    ///
> +    /// Internally calls the [`DriverGpuVm`] callbacks similar to =
[`Self::sm_unmap`], except that
> +    /// the [`DriverGpuVm::sm_step_map`] is called once to create the =
requested mapping.
> +    #[inline]
> +    pub fn sm_map(&mut self, req: OpMapRequest<'_, '_, T>) -> Result =
{
> +        let gpuvm =3D self.as_raw();
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
>     /// Remove any mappings in the given region.
>     ///
>     /// Internally calls [`DriverGpuVm::sm_step_unmap`] for ranges =
entirely contained within the
> @@ -218,19 +336,45 @@ pub fn sm_unmap(&mut self, addr: u64, length: =
u64, context: &mut T::SmContext<'_
>         };
>         // SAFETY:
>         // * raw_request() creates a valid request.
> -        // * The private data is valid to be interpreted as SmData.
> +        // * The private data is a valid SmData.
>         to_result(unsafe { bindings::drm_gpuvm_sm_unmap(gpuvm, (&raw =
mut p).cast(), addr, length) })
>     }
> }
>=20
> impl<T: DriverGpuVm> GpuVm<T> {
>     /// # Safety
> -    /// Must be called from `sm_unmap` with a pointer to `SmData`.
> +    /// Must be called from `sm_map` with a pointer to `SmMapData`.
> +    pub(super) unsafe extern "C" fn sm_step_map(
> +        op: *mut bindings::drm_gpuva_op,
> +        p: *mut c_void,
> +    ) -> c_int {
> +        // SAFETY: If we reach `sm_step_map` then we were called from =
`sm_map` which always passes
> +        // an `SmMapData` as private data.
> +        let p =3D unsafe { &mut *p.cast::<SmMapData<'_, '_, T>>() };
> +        let op =3D OpMap {
> +            // SAFETY: sm_step_map is called with a map operation.
> +            op: unsafe { &(*op).__bindgen_anon_1.map },
> +            vm_bo: &p.vm_bo,
> +            _invariant: PhantomData,
> +        };
> +        match p
> +            .sm_data
> +            .gpuvm
> +            .data()
> +            .sm_step_map(op, p.sm_data.user_context)
> +        {
> +            Ok(OpMapped { .. }) =3D> 0,
> +            Err(err) =3D> err.to_errno(),
> +        }
> +    }
> +
> +    /// # Safety
> +    /// Must be called from `sm_map` or `sm_unmap` with a pointer to =
`SmMapData` or `SmData`.
>     pub(super) unsafe extern "C" fn sm_step_unmap(
>         op: *mut bindings::drm_gpuva_op,
>         p: *mut c_void,
>     ) -> c_int {
> -        // SAFETY: The caller provides a pointer to `SmData`.
> +        // SAFETY: The caller provides a pointer that can be treated =
as `SmData`.
>         let p =3D unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
>         let op =3D OpUnmap {
>             // SAFETY: sm_step_unmap is called with an unmap =
operation.
> @@ -244,12 +388,12 @@ impl<T: DriverGpuVm> GpuVm<T> {
>     }
>=20
>     /// # Safety
> -    /// Must be called from `sm_unmap` with a pointer to `SmData`.
> +    /// Must be called from `sm_map` or `sm_unmap` with a pointer to =
`SmMapData` or `SmData`.
>     pub(super) unsafe extern "C" fn sm_step_remap(
>         op: *mut bindings::drm_gpuva_op,
>         p: *mut c_void,
>     ) -> c_int {
> -        // SAFETY: The caller provides a pointer to `SmData`.
> +        // SAFETY: The caller provides a pointer that can be treated =
as `SmData`.
>         let p =3D unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
>         let op =3D OpRemap {
>             // SAFETY: sm_step_remap is called with a remap operation.
>=20
> --=20
> 2.52.0.457.g6b5491de43-goog
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

