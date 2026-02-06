Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kaBIFGxMhmnxLgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:17:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A6D1030F0
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044A710E8FB;
	Fri,  6 Feb 2026 20:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="PGAerKwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9115110E8FB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 20:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770409058; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JaxAksM5QlKxOAunQgtlV3fBBvzeWi2SGi6tix+OZoOwE7smiMsBugFiVrRaQfNIfOwF8PV5Mz5uplZ39dA7u6jOUmbwwIgTqhJW39yk8Hh5GBKHbgpeb5jSu2f/IPPvI9sR2wLgYZi7nvrv2U32HQYXcp/CgZTOPOTOwx/KJZ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770409058;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KpnCgsohyPIIa4ZRNhXrjq+kv0xG6+JAdk3vWA+4KRk=; 
 b=O+dZFC67dDLF2bpeK2/HLomI7SryIK90KryOOxjxHuuOpK81N2N+dGEdcoYZcBsIuyI4NC4ySDEJlbbriSU/DiY+N14zijXsHfhs43RT0jalmXcrcBhe0WcY1G4LlDn9eLkbD6cocXH+eDWYNuN+gDx9WT5TT8h2u/aXntLZq2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770409057; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=KpnCgsohyPIIa4ZRNhXrjq+kv0xG6+JAdk3vWA+4KRk=;
 b=PGAerKwNPGJPG54KHjdPNl6ZGhiazCYPnI8hMRNoTedpy2vqQ89Fnsx+cVzT3XFc
 rPiJHpeSHCwzZUJZDF+BKj6cmhfEElLLZ2IrytPa/RDhFyCwSSmYl+7NOC22FMVqnR5
 ux1L/JMxrX/H9nrEUbOFTYq/Z9gOGYVKgIhzvl3s=
Received: by mx.zohomail.com with SMTPS id 17704090553493.1968830592744553;
 Fri, 6 Feb 2026 12:17:35 -0800 (PST)
Date: Fri, 6 Feb 2026 12:17:34 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Asahi Lina <lina+kernel@asahilina.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 6/6] rust: gpuvm: add GpuVmCore::sm_map()
Message-ID: <aYZMXiv4GvyjPxoa@um790>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-6-8364d104ff40@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-gpuvm-rust-v4-6-8364d104ff40@google.com>
X-ZohoMail-Sender: Deborah Brouwer
X-ZM-MESSAGEID: 1770408352599127500
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.887];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asahilina.net:email,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 90A6D1030F0
X-Rspamd-Action: no action

Hi Alice, I got a build error testing gpuvm v4 with Tyr.

On Fri, Jan 30, 2026 at 02:24:15PM +0000, Alice Ryhl wrote:
> Finally also add the operation for creating new mappings. Mapping
> operations need extra data in the context since they involve a vm_bo
> coming from the outside.
> 
> Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
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
> +        unsafe { <T::Object as IntoGEMObject>::from_raw(self.op.gem.obj) }
> +    }
> +
> +    /// The [`GpuVmBo`] that the new VA will be associated with.
> +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> +        self.vm_bo
> +    }
> +
> +    /// Use the pre-allocated VA to carry out this map operation.
> +    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl PinInit<T::VaData>) -> OpMapped<'op, T> {
> +        let va = va.prepare(va_data);
> +        // SAFETY: By the type invariants we may access the interval tree.
> +        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va, self.op) };
> +
> +        let _gpuva_guard = self.vm_bo().lock_gpuva();
> +        // SAFETY: The va is prepared for insertion, and we hold the GEM lock.
> +        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
> +
> +        OpMapped {
> +            _invariant: self._invariant,
> +        }

error[E0308]: mismatched types
  --> rust/kernel/drm/gpuvm/sm_ops.rs:98:25
   |
98 |             _invariant: self._invariant,
   |                         ^^^^^^^^^^^^^^^ expected `PhantomData<*mut &mut T>`, found `PhantomData<fn(&mut T) -> fn(&mut T)>`
   |
   = note: expected struct `core::marker::PhantomData<*mut &mut T>`
              found struct `core::marker::PhantomData<fn(&'op mut T) -> fn(&'op mut T)>`

Updating the PhantomData type for OpMapped to match OpMap
seems to fix it.

Deborah

