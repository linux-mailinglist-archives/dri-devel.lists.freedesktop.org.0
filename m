Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KOQN/GGmGnKJQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 17:08:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012A1692ED
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 17:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A28610E80F;
	Fri, 20 Feb 2026 16:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BDQJbxeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA86E10E80F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 16:08:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7F10743B01;
 Fri, 20 Feb 2026 16:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550F5C19421;
 Fri, 20 Feb 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771603693;
 bh=UuWmFuz2m0mN4cMlxdeJvkzkx5VgTQVuM6TTLhpowr8=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=BDQJbxeob9xDYgpdgCGDiBLLFhNY8g1cPoZS2tcPBj9mGd/aXJbKOPvaB/eGlpJ4x
 vAj2XePUs3AhJxwNGcF/lghrwWDftMuP0OjobiYfXHW2IIQ4RXF7cP+h37ynZKvS/i
 /5lNb/lgeVuBR0MoVcpIDYgr9JSU/U30hlnR3/2B+DKQTO913m2cfHi8PndKHPm1IE
 +t669Gg/X0hjisK6olYM2a2X2TeVbb1j+emMEV/0Yz3p4Cjx4SiwAIgfWBgAoUKLj/
 I5uX0RlFnrv6c84I+p+COEtJ7lpGv8I3bTt6n3sLEHs4+BQEmXr29X6ykXeTXd3gsy
 rmjoIi6bfruew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 17:08:09 +0100
Message-Id: <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org> <aZgYY_fetgz_GDR8@google.com>
In-Reply-To: <aZgYY_fetgz_GDR8@google.com>
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
X-Rspamd-Queue-Id: 4012A1692ED
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 9:16 AM CET, Alice Ryhl wrote:
>> > +    /// Access this [`GpuVmBo`] from a raw pointer.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// For the duration of `'a`, the pointer must reference a valid =
`drm_gpuvm_bo` associated with
>> > +    /// a [`GpuVm<T>`].
>> > +    #[inline]
>> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &=
'a Self {
>>=20
>> I think this a good candidate for crate private, as we don't want driver=
s to use
>> this, but still use it in other DRM core modules.
>>=20
>> > +        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
>> > +        unsafe { &*ptr.cast() }
>> > +    }
>> > +
>> > +    /// Returns a raw pointer to underlying C value.
>> > +    #[inline]
>> > +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
>>=20
>> Less important, but probably also only needed in core DRM code.
>
> For cases like these two, I do think one can run into cases where you
> want them to be public. E.g. the vma confusion bugfix uses a raw pointer
> for now:
> https://lore.kernel.org/all/20260218-binder-vma-check-v2-1-60f9d695a990@g=
oogle.com/

I think we should make them public once actually needed.

> I'm generally not so worried about methods like these being public
> because they can't be used without unsafe.

Yeah, but my experience is that drivers can get very creative in figuring o=
ut
how to abuse APIs. I think it's best to keep the surface for this as small =
as
possible.

>> > +/// A [`GpuVmBo`] object in the GEM list.
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` an=
d is present in the gem list.
>> > +pub struct GpuVmBoRegistered<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
>>=20
>> I know that I proposed to rename this from GpuVmBoResident to GpuVmBoReg=
istered
>> in a drive-by comment on v3.
>>=20
>> But now that I have a closer look, I think it would be nice to just have=
 GpuVmBo
>> being the registered one and GpuVmBoAlloc being the pre-allocated one.
>>=20
>> As it is currently, I think it is bad to ever present a &GpuVmBo to a dr=
iver
>> because it implies that we don't know whether it is a pre-allocated one =
or a
>> "normal", registered one. But we do always know.
>
> Actually, I think GpuVmBo is already the registered one.
> GpuVmBoRegistered is just ARef<GpuVmBo<T>>.

GpuVmBoAlloc<T> dereferences to GpuVmBo<T>, so currently it is not.

>> For instance, in patch 6 we give out &'op GpuVmBo<T>, but it actually ca=
rries
>> the invariant of being registered.
>>=20
>> Of course, we could fix this by giving out a &'op GpuVmBoRegistered<T> i=
nstead,
>> but it would be nice to not have drivers be in touch with a type that ca=
n be one
>> or the other.
>>=20
>> I know that the current GpuVmBo<T> also serves the purpose of storing co=
mmon
>> code. Maybe we can make it private, call it GpuVmBoInner<T> and have inl=
ine
>> forwarding methods for GpuVmBo<T> and GpuVmBoAlloc<T>. This is slightly =
more
>> overhead in this implementation due to the forwarding methods, but less
>> ambiguity for drivers, which I think is more important.
>
> I think we should keep the current state that GpuVmBo is registered, and
> only GpuVmBoAlloc is not. That is most useful.

We seem to agree then: What I want is that from a driver perspective there =
is
only GpuVmBo<T> (which is the registered thing) and GpuVmBoAlloc<T> which i=
s the
pre-allocated thing, i.e.  no separate GpuVmBoRegistered<T> type.
