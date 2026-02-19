Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKU2Fk8kl2mZvAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:55:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6B415FD24
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D10010E283;
	Thu, 19 Feb 2026 14:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wd6Ifn/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A6810E283
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:55:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D87E740565;
 Thu, 19 Feb 2026 14:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C87C4CEF7;
 Thu, 19 Feb 2026 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771512906;
 bh=raLPxlV9F8FTfo74PhysGAOWkotY/LlTueqi38TjxSQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Wd6Ifn/u2GUjn0JKXOwsCLJ58WFAa17fnraBVt1f57Sv6HtnP5eZquqx9Nb4qevRY
 W1mDSY7vSgJtyeTiH33wPNBCI2Hp72VNuGYn9uHKpKwWBv4K+CbDonR0mOikH/Mk8o
 3MyDvl0FkhpaTzZ0/p+wYqf0aopMb3FrcuahEXcHYYnuZcfbYtEPVluIg8iuO1+LLn
 zvVtQw1IlldnMFpYnrHHXWlb2I5rJ3kjsrR0FWmNAmqcT+7XUowzRJhQd2RAftdudp
 16JihmfEgPmmpTDtGLpUIsgv3l3MA9dfcFGT4oCnhXa0RowlBSTqePxU5KUDu7wsSC
 +16n0dxF7B33g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 15:55:02 +0100
Message-Id: <DGJ0WWM0F1ZR.OJ1VWJUDC6E8@kernel.org>
Subject: Re: [PATCH v4 1/6] rust: drm: add base GPUVM immediate mode
 abstraction
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
 <DGJ0IL3LLZRW.3JC9RY1GDIJA6@kernel.org> <aZchECrW8mPbZMq8@google.com>
In-Reply-To: <aZchECrW8mPbZMq8@google.com>
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
X-Rspamd-Queue-Id: AC6B415FD24
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 3:41 PM CET, Alice Ryhl wrote:
> On Thu, Feb 19, 2026 at 03:36:20PM +0100, Danilo Krummrich wrote:
>> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
>> > +/// A DRM GPU VA manager.
>> > +///
>> > +/// This object is refcounted, but the "core" is only accessible usin=
g a special unique handle. The
>> > +/// core consists of the `core` field and the GPUVM's interval tree.
>>=20
>> I think this is still a bit confusing, I think we should just rename Gpu=
VmCore
>> to UniqueGpuVm and rewrite this to something like:
>>=20
>> "The driver specific data of of `GpuVm` is only accessible through a
>> [`UniqueGpuVm`], which guarantees exclusive access."
>
> But it's not really the same as e.g. UniqueArc<_>, which implies that
> there are no normal Arc<_>s whatsoever. This one is just a special ref,
> but there may also be normal refs at the same time.

Fair enough, what about UniqueRefGpuVm then? I think that's more descriptiv=
e
than GpuVmCore.

>> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a =
Self {
>> > +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `G=
puVm<T>`. Caller ensures the
>> > +        // pointer is valid for 'a.
>> > +        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), Self=
, vm) }
>>=20
>> I'd pull the Opaque::cast_from() call out of the unsafe block.
>
> I think that's a bit verbose, and all existing uses do it inside the
> `container_of!`.
>
>> > +/// The manager for a GPUVM.
>>=20
>> This description seems a bit odd. In the end, the trait makes GPUVM awar=
e of
>> other driver specific types. So, maybe a better name would be
>> gpuvm::DriverAttributes, gpuvm::DriverTypes, gpuvm::DriverInfo or just
>> gpuvm::Driver. My favorite is gpuvm::DriverInfo.
>>=20
>> We should also change the doc-comment accordingly. Maybe somthing like: =
"This
>> trait make the [`GpuVm`] aware of the other driver specific DRM types."
>
> I mean, it doesn't just do that. The type implementing this is the type
> stored in the `core` field, so you really do get more than just some
> type relationships from it.

The only types subsequently added to this trait are VaData and VmBoData, i.=
e.
type relationships.

The trait is not related to the private data type T, i.e. it is theoretical=
ly
possible to have T for the private data and I: gpuvm::DriverInfo for the ty=
pe
relationships, right?.

>> > +pub trait DriverGpuVm: Sized {
>> > +    /// Parent `Driver` for this object.
>> > +    type Driver: drm::Driver<Object =3D Self::Object>;
>> > +
>> > +    /// The kind of GEM object stored in this GPUVM.
>> > +    type Object: IntoGEMObject;
>> > +}

