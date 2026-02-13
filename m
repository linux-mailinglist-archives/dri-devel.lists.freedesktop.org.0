Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ASb6IBnrjmkCGAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:12:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD413452F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B87D10E7B7;
	Fri, 13 Feb 2026 09:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="k8JGlxdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C8210E7B7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770973966;
 bh=nJ7JF16f6th+tdi+t/ywIq/bwidP/BUPrORzxmThshM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k8JGlxdQCp4PdebYsNcDUMVuWR/QXdaqvjSvSyZ0dZiDubG2cK3D/OCML76nRwQ76
 hDgzWitba0gU/V2vwodVJQ+YvZ0QCndUpPYXGNVlH20lQoqliZuzisqTlqMAPPOrQ3
 /RAsW0IwilTpSKHI47Z8gS2jsJA9QDy13fgl+nbpsNZbd6MSPI7T3dEv9MMsn2pJZR
 WTgVIn8x12/ro4oG0QNAXf1S53/MFEbH0zA9ZVOASkDnyPXYjEJTtey/96AUjXD0Uo
 fXXcg4zEu73kl+2Oi3ZW0zdvBJeJv4id5eOjpxJAOEbWesX+yybmTnB47BBzEO/o1+
 //2wNERN+mc1w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E2A5D17E12E2;
 Fri, 13 Feb 2026 10:12:45 +0100 (CET)
Date: Fri, 13 Feb 2026 10:12:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
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
Message-ID: <20260213101238.3e9c95e5@fedora>
In-Reply-To: <CAPaKu7TNz83z=Y43tnb+yrSUMKbD6ztLZvtQ80Wzzqps4jkK4g@mail.gmail.com>
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-10-boris.brezillon@collabora.com>
 <CAPaKu7TNz83z=Y43tnb+yrSUMKbD6ztLZvtQ80Wzzqps4jkK4g@mail.gmail.com>
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:olvaffe@gmail.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: E4FD413452F
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 16:43:29 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Wed, Feb 11, 2026 at 12:22=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> [...]
> > +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object=
 *bo)
> > +{
> > +       struct panthor_device *ptdev =3D container_of(bo->base.dev, str=
uct panthor_device, base);
> > +       struct panthor_vm *vm =3D NULL;
> > +       struct drm_gpuvm_bo *vm_bo;
> > +
> > +       dma_resv_assert_held(bo->base.resv);
> > +       lockdep_assert_held(&bo->base.gpuva.lock);
> > +
> > +       drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> > +               /* We're only supposed to have one vm_bo in the list if=
 we get there. */ =20
> A bo that is validated in one vm but evicted in another is considered
> PANTHOR_GEM_GPU_MAPPED_PRIVATE by is_gpu_mapped. We should check for
> vm_bo->evicted too.

Absolutely, I'll fix that.

>=20
>=20
> > +               drm_WARN_ON(&ptdev->base, vm);
> > +               vm =3D container_of(vm_bo->vm, struct panthor_vm, base);
> > +
> > +               mutex_lock(&ptdev->reclaim.lock);
> > +               drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->bas=
e);
> > +               if (list_empty(&vm->reclaim.lru_node))
> > +                       list_move(&vm->reclaim.lru_node, &ptdev->reclai=
m.vms);
> > +               mutex_unlock(&ptdev->reclaim.lock);
> > +       }
> > +} =20

