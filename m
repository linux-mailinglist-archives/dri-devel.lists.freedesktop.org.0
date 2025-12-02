Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B822C9BA45
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9A210E658;
	Tue,  2 Dec 2025 13:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Ur0QWbxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D76410E07B;
 Tue,  2 Dec 2025 13:42:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764682964; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=J5deUpTOyfLgWnRYXLaCiZ03EGaxwW0kt/0yekjjDNostrWcaRdy0yOgBdL0doJiqIssx/0yAKflWnrl6Ac9TDoiAAm5Brhm6sYegPEyHEioe3JYe8zvrc9LvUW4DYAcwuq0z9oMcJgl8xM+qsk1oD+ik2JlvZBYvVN8B+sGSSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764682964;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yxkYvGGrptWLGrGGwE3MPFxIX3T7694Py55+2kGg0W4=; 
 b=Fi1N2V9tGzzIMAYbDcKDXVs+e40qBPSTDoN5Bw3/gp1tgCQhaC0O6NROEl65Ufb4jdQvMjhqULM1I4WLL04BafQaD6wzlZM3/Wbyirwxroz/JKi1JmVcreSw5p+RbECfSnOtsXsi6nVaGTmoGyIBHmJRU0wJ7bj7/3ahvJxs4wQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764682964; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=yxkYvGGrptWLGrGGwE3MPFxIX3T7694Py55+2kGg0W4=;
 b=Ur0QWbxyte3VimXITPe7fKzCdcPj497RtWW093nZ3y4JuyzsjvgKxHLIozCWfwqw
 HiIxPXzSjkRcWbsxjlFsvANrzaXFKHiPinFznThI/GPIIZ8hZKCwjjn6YmlSv4OYC5t
 W14f3yELfaok3Y5GRLhmUgX6jkmWXogjPnoj0Obc=
Received: by mx.zohomail.com with SMTPS id 1764682962561352.7419515680556;
 Tue, 2 Dec 2025 05:42:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aS6lz12BIysBVHSV@google.com>
Date: Tue, 2 Dec 2025 10:42:23 -0300
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
Message-Id: <A15F2FAB-3D7C-4DF6-9399-DCFCF34C4D8F@collabora.com>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <3727982A-91A4-447C-B53C-B6037DA02FF9@collabora.com>
 <aS6lz12BIysBVHSV@google.com>
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



> On 2 Dec 2025, at 05:39, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Mon, Dec 01, 2025 at 12:16:09PM -0300, Daniel Almeida wrote:
>> Hi Alice,
>>=20
>> I find it a bit weird that we reverted to v1, given that the previous =
gpuvm
>> attempt was v3. No big deal though.
>>=20
>>=20
>>> On 28 Nov 2025, at 11:14, Alice Ryhl <aliceryhl@google.com> wrote:
>>>=20
>>> Add a GPUVM abstraction to be used by Rust GPU drivers.
>>>=20
>>> GPUVM keeps track of a GPU's virtual address (VA) space and manages =
the
>>> corresponding virtual mappings represented by "GPU VA" objects. It =
also
>>> keeps track of the gem::Object<T> used to back the mappings through
>>> GpuVmBo<T>.
>>>=20
>>> This abstraction is only usable by drivers that wish to use GPUVM in
>>> immediate mode. This allows us to build the locking scheme into the =
API
>>> design. It means that the GEM mutex is used for the GEM gpuva list, =
and
>>> that the resv lock is used for the extobj list. The evicted list is =
not
>>> yet used in this version.
>>>=20
>>> This abstraction provides a special handle called the GpuVmCore, =
which
>>> is a wrapper around ARef<GpuVm> that provides access to the interval
>>> tree. Generally, all changes to the address space requires mutable
>>> access to this unique handle.
>>>=20
>>> Some of the safety comments are still somewhat WIP, but I think the =
API
>>> should be sound as-is.
>>>=20
>>> Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
>>> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
>>> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>=20
>>> +//! DRM GPUVM in immediate mode
>>> +//!
>>> +//! Rust abstractions for using GPUVM in immediate mode. This is =
when the GPUVM state is updated
>>> +//! during `run_job()`, i.e., in the DMA fence signalling critical =
path, to ensure that the GPUVM
>>=20
>> IMHO: We should initially target synchronous VM_BINDS, which are the =
opposite
>> of what you described above.
>=20
> Immediate mode is a locking scheme. We have to pick one of them
> regardless of whether we do async VM_BIND yet.
>=20
> (Well ok immediate mode is not just a locking scheme: it also =
determines
> whether vm_bo cleanup is postponed or not.)
>=20
>>> +/// A DRM GPU VA manager.
>>> +///
>>> +/// This object is refcounted, but the "core" is only accessible =
using a special unique handle. The
>>=20
>> I wonder if `Owned<T>` is a good fit here? IIUC, Owned<T> can be =
refcounted,
>> but there is only ever one handle on the Rust side? If so, this seems =
to be
>> what we want here?
>=20
> Yes, Owned<T> is probably a good fit.
>=20
>>> +/// core consists of the `core` field and the GPUVM's interval =
tree.
>>> +#[repr(C)]
>>> +#[pin_data]
>>> +pub struct GpuVm<T: DriverGpuVm> {
>>> +    #[pin]
>>> +    vm: Opaque<bindings::drm_gpuvm>,
>>> +    /// Accessed only through the [`GpuVmCore`] reference.
>>> +    core: UnsafeCell<T>,
>>=20
>> This UnsafeCell has been here since Lina=E2=80=99s version. I must =
say I never
>> understood why, and perhaps now is a good time to clarify it given =
the changes
>> we=E2=80=99re making w.r.t to the =E2=80=9Cunique handle=E2=80=9D =
thing.
>>=20
>> This is just some driver private data. It=E2=80=99s never shared with =
C. I am not
>> sure why we need this wrapper.
>=20
> The sm_step_* methods receive a `&mut T`. This is UB if other code has
> an `&GpuVm<T>` and the `T` is not wrapped in an `UnsafeCell` because
> `&GpuVm<T>` implies that the data is not modified.
>=20
>>> +    /// Shared data not protected by any lock.
>>> +    #[pin]
>>> +    shared_data: T::SharedData,
>>=20
>> Should we deref to this?
>=20
> We can do that.
>=20
>>> +    /// Creates a GPUVM instance.
>>> +    #[expect(clippy::new_ret_no_self)]
>>> +    pub fn new<E>(
>>> +        name: &'static CStr,
>>> +        dev: &drm::Device<T::Driver>,
>>> +        r_obj: &T::Object,
>>=20
>> Can we call this =E2=80=9Creservation_object=E2=80=9D, or similar?
>>=20
>> We should probably briefly explain what it does, perhaps linking to =
the C docs.
>=20
> Yeah agreed, more docs are probably warranted here.
>=20
>> I wonder if we should expose the methods below at this moment. We =
will not need
>> them in Tyr until we start submitting jobs. This is still a bit in =
the future.
>>=20
>> I say this for a few reasons:
>>=20
>> a) Philipp is still working on the fence abstractions,
>>=20
>> b) As a result from the above, we are taking raw fence pointers,
>>=20
>> c) Onur is working on a WW Mutex abstraction [0] that includes a Rust
>> implementation of drm_exec (under another name, and useful in other =
contexts
>> outside of DRM). Should we use them here?
>>=20
>> I think your current design with the ExecToken is also ok and perhaps =
we should
>> stick to it, but it's good to at least discuss this with the others.
>=20
> I don't think we can postpone adding the "obtain" method. It's =
required
> to call sm_map, which is needed for VM_BIND.
>=20
>>> +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
>>> +    #[inline]
>>> +    pub fn obtain(
>>> +        &self,
>>> +        obj: &T::Object,
>>> +        data: impl PinInit<T::VmBoData>,
>>> +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
>>=20
>> Perhaps this should be called GpuVmBo? That=E2=80=99s what you want =
to =E2=80=9Cobtain=E2=80=9D in the first place.
>>=20
>> This is indeed a question, by the way.
>=20
> One could possibly use Owned<_> here.
>=20
>>> +/// A lock guard for the GPUVM's resv lock.
>>> +///
>>> +/// This guard provides access to the extobj and evicted lists.
>>=20
>> Should we bother with evicted objects at this stage?
>=20
> The abstractions don't actually support them right now. The resv lock =
is
> currently only here because it's used internally in these =
abstractions.
> It won't be useful to drivers until we add evicted objects.
>=20
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// Holds the GPUVM resv lock.
>>> +pub struct GpuvmResvLockGuard<'a, T: DriverGpuVm>(&'a GpuVm<T>);
>>> +
>>> +impl<T: DriverGpuVm> GpuVm<T> {
>>> +    /// Lock the VM's resv lock.
>>=20
>> More docs here would be nice.
>>=20
>>> +    #[inline]
>>> +    pub fn resv_lock(&self) -> GpuvmResvLockGuard<'_, T> {
>>> +        // SAFETY: It's always ok to lock the resv lock.
>>> +        unsafe { bindings::dma_resv_lock(self.raw_resv_lock(), =
ptr::null_mut()) };
>>> +        // INVARIANTS: We took the lock.
>>> +        GpuvmResvLockGuard(self)
>>> +    }
>>=20
>> You can call this more than once and deadlock. Perhaps we should warn =
about this, or forbid it?
>=20
> Same as any other lock. I don't think we need to do anything special.
>=20
>>> +    /// Use the pre-allocated VA to carry out this map operation.
>>> +    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl =
PinInit<T::VaData>) -> OpMapped<'op, T> {
>>> +        let va =3D va.prepare(va_data);
>>> +        // SAFETY: By the type invariants we may access the =
interval tree.
>>> +        unsafe { =
bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va, self.op) };
>>> +        // SAFETY: The GEM object is valid, so the mutex is =
properly initialized.
>>=20
>>> +        unsafe { bindings::mutex_lock(&raw mut =
(*self.op.gem.obj).gpuva.lock) };
>>=20
>> Should we use Fujita=E2=80=99s might_sleep() support here?
>=20
> Could make sense yeah.
>=20
>>> +/// ```
>>> +/// struct drm_gpuva_op_unmap {
>>> +/// /**
>>> +/// * @va: the &drm_gpuva to unmap
>>> +/// */
>>> +/// struct drm_gpuva *va;
>>> +///
>>> +/// /**
>>> +/// * @keep:
>>> +/// *
>>> +/// * Indicates whether this &drm_gpuva is physically contiguous =
with the
>>> +/// * original mapping request.
>>> +/// *
>>> +/// * Optionally, if &keep is set, drivers may keep the actual page =
table
>>> +/// * mappings for this &drm_gpuva, adding the missing page table =
entries
>>> +/// * only and update the &drm_gpuvm accordingly.
>>> +/// */
>>> +/// bool keep;
>>> +/// };
>>> +/// ```
>>=20
>> I think the docs could improve here ^
>=20
> Yeah I can look at it.
>=20
>>> +impl<T: DriverGpuVm> GpuVmCore<T> {
>>> +    /// Create a mapping, removing or remapping anything that =
overlaps.
>>> +    #[inline]
>>> +    pub fn sm_map(&mut self, req: OpMapRequest<'_, T>) -> Result {
>>=20
>> I wonder if we should keep this =E2=80=9Csm=E2=80=9D prefix. Perhaps
>> =E2=80=9Cmap_region=E2=80=9D or =E2=80=9Cmap_range=E2=80=9D would be =
better names IMHO.
>=20
> I'll wait for Danilo to weigh in on this. I'm not sure where "sm"
> actually comes from.

sm probably is a reference to =E2=80=9Csplit/merge=E2=80=9D.

>=20
>>> +/// Represents that a given GEM object has at least one mapping on =
this [`GpuVm`] instance.
>>> +///
>>> +/// Does not assume that GEM lock is held.
>>> +#[repr(C)]
>>> +#[pin_data]
>>> +pub struct GpuVmBo<T: DriverGpuVm> {
>>=20
>> Oh, we already have GpuVmBo, and GpuVmBoObtain. I see.
>=20
> Yeah, GpuVmBoObtain and GpuVmBoAlloc are pointers to GpuVmBo.
>=20
>>> +    #[pin]
>>> +    inner: Opaque<bindings::drm_gpuvm_bo>,
>>> +    #[pin]
>>> +    data: T::VmBoData,
>>> +}
>>> +
>>> +impl<T: DriverGpuVm> GpuVmBo<T> {
>>> +    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> =
*mut bindings::drm_gpuvm_bo> =3D {
>>> +        use core::alloc::Layout;
>>> +        let base =3D Layout::new::<bindings::drm_gpuvm_bo>();
>>> +        let rust =3D Layout::new::<Self>();
>>> +        assert!(base.size() <=3D rust.size());
>>=20
>> We should default to something else instead of panicking IMHO.
>=20
> This is const context, which makes it a build assertion.
>=20
>> My overall opinion is that we=E2=80=99re adding a lot of things that =
will only be
>> relevant when we=E2=80=99re more advanced on the job submission =
front. This
>> includes the things that Phillip is working on (i.e.: Fences + =
JobQueue).
>>=20
>> Perhaps we should keep this iteration downstream (so we=E2=80=99re =
sure it works
>> when the time comes) and focus on synchronous VM_BINDS upstream.
>> The Tyr demo that you=E2=80=99ve tested this on is very helpful for =
this purpose.
>=20
> Yeah let's split out the prepare, GpuVmExec, and resv_add_fence stuff =
to
> a separate patch.

Ack

>=20
> I don't think sync vs async VM_BIND changes much in which methods or
> structs are required here. Only difference is whether you call the
> methods from a workqueue or not.
>=20
> Alice


