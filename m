Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO5IIvTbkmn3zAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:57:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B93141BBB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E2310E1B6;
	Mon, 16 Feb 2026 08:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V6VdsYkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAA410E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771232239;
 bh=Q2wZ05+kkbpTiaWuLV2p79VJg8YBx8ve3kJWksjnV4U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V6VdsYkwhO2T6ofbx21wM2gFf5qoFcJTfQu2YLrgp4JwL5Qe4iG/rNt0WQMSABc3i
 0sd9LULh8XWr62useoiKP8w79SLaz+PY2Mobolg10WgBshYGqYIKRpDRldHYAq/pxd
 jxO2BaSyCWkh/lCGmlo7g5M0JHNDZ3A0Y/DqbwV7CWa0iZ//+Ix1j97AWn0Mxrejxq
 muy9ZkiLRRudTnUEaDtBrJmfGjXtl6RHWaqRY/d7TyKZKeiTJaNrS+5xY84l2E1a1l
 QiOLrxePMOr3iEMdg4177AZp6Z6BbT5FokpT4AgnkZWUYHKqZFTUCH9dteM/XQ0PZS
 jBUVswYnAikfA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A5E8017E131F;
 Mon, 16 Feb 2026 09:57:18 +0100 (CET)
Date: Mon, 16 Feb 2026 09:57:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, Chris Diamand
 <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com
Subject: Re: [PATCH v3 9/9] drm/panthor: Add a GEM shrinker
Message-ID: <20260216095714.40a7e5ec@fedora>
In-Reply-To: <aY9oM5MY6Jntm3oy@sobremesa>
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-10-boris.brezillon@collabora.com>
 <aY9oM5MY6Jntm3oy@sobremesa>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:adrian.larumbe@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: E1B93141BBB
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 18:23:34 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> > +static int remap_evicted_vma(struct drm_gpuvm_bo *vm_bo,
> > +			     struct panthor_vma *evicted_vma,
> > +			     struct panthor_vm_op_ctx *op_ctx)
> > +{
> > +	struct panthor_vm *vm =3D container_of(vm_bo->vm, struct panthor_vm, =
base);
> > +	struct panthor_gem_object *bo =3D to_panthor_bo(vm_bo->obj);
> > +	struct drm_gpuva *va;
> > +	bool found =3D false;
> > +	int ret;
> > +
> > +	ret =3D panthor_vm_op_ctx_prealloc_pts(op_ctx);
> > +	if (ret)
> > +		goto out_cleanup;
> > +
> > +	/* Take op_lock to protect against va insertion/removal. */
> > +	mutex_lock(&vm->op_lock);
> > +	drm_gpuvm_bo_for_each_va(va, vm_bo) {
> > +		struct panthor_vma *vma =3D container_of(va, struct panthor_vma, bas=
e);
> > +
> > +		if (vma !=3D evicted_vma)
> > +			continue;
> > +
> > +		/* We can't rely solely on pointer equality, because the VMA might h=
ave been
> > +		 * freed and a new one allocated at the same address. If the evicted=
 bit
> > +		 * is still set, we're sure it's our VMA, because population/evictio=
n is
> > +		 * serialized with the BO resv lock.
> > +		 */ =20
>=20
> At first I thought to avoid having VM_BIND operations change the VM's VMA=
's in the interval between
> select_evicted_vma() and remap_evicted_vma(), maybe you could take the VM=
's operation lock around both of them
> in panthor_vm_restore_vmas(). But because the same lock is taken in the d=
ma signalling path and
> panthor_vm_op_ctx_prealloc_pts() can sleep, then we cannot do that. Maybe=
 you could add a note clarifying this?

Sure, how about

index 78b875a59d1e..9ce4077bef8e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2395,7 +2395,11 @@ static int remap_evicted_vma(struct drm_gpuvm_bo *vm=
_bo,
        if (ret)
                goto out_cleanup;
=20
-       /* Take op_lock to protect against va insertion/removal. */
+       /* Take op_lock to protect against va insertion/removal. Note that =
the
+        * evicted_vma selection was done with the same lock held, but we h=
ad
+        * to release it so we can allocate PTs, because this very same lock
+        * is taken in a DMA-signalling path.
+        */
        mutex_lock(&vm->op_lock);
        drm_gpuvm_bo_for_each_va(va, vm_bo) {
                struct panthor_vma *vma =3D container_of(va, struct panthor=
_vma, base);
@@ -2403,10 +2407,11 @@ static int remap_evicted_vma(struct drm_gpuvm_bo *v=
m_bo,
                if (vma !=3D evicted_vma)
                        continue;
=20
-               /* We can't rely solely on pointer equality, because the VM=
A might have been
-                * freed and a new one allocated at the same address. If th=
e evicted bit
-                * is still set, we're sure it's our VMA, because populatio=
n/eviction is
-                * serialized with the BO resv lock.
+               /* Because we had to release the lock between the evicted_v=
ma selection
+                * and its repopulation, we can't rely solely on pointer eq=
uality (the
+                * VMA might have been freed and a new one allocated at the=
 same address).
+                * If the evicted bit is still set, we're sure it's our VMA=
, because
+                * population/eviction is serialized with the BO resv lock.
                 */
                if (vma->evicted)
                        found =3D true;

?

