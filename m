Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D35C8DA0F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D7410E7F4;
	Thu, 27 Nov 2025 09:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jLMIxK76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BAE10E7F4;
 Thu, 27 Nov 2025 09:48:12 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dHBSS6Tfrz9tlN;
 Thu, 27 Nov 2025 10:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764236888; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQYSvusihxhAEhdU9CYjb1IJ74ERkj/ScwDBukN3aU4=;
 b=jLMIxK760nk1jr6W+dythNSXScSQUSIn0bfNZKLsnQsoUsP4h3ywir/eSZ27UsyXpnUHGt
 HKR1ydCo5vb0KXtgiU6+xBvKyCoskn4oBuzTQs9zRcXr4JqHMSNdo9tohHXFRZPmyaLuPE
 fotHp0J55AqD+/ghCBzme2ktHRL56A/js86yI4JIJmo+MHuOaH5QumXvHmc8mWASePQ8Ys
 I9DkcZ+wxN5w0xPnu1wseU7+VBp/jfR6Z2ugni7+QL0aVcoKFRF9QYlIY8o9GfvPOCf5Gz
 dg4RXwx8zURlAGa2kAFYPgo3xhFLy361bSBJz6mMLjboBiGUb7+PvOGVjcDFdA==
Message-ID: <d46f753e660694ab46c65409a5e43f050b7eb2d9.camel@mailbox.org>
Subject: Re: [PATCH 2/6] amd/amdkfd: Ignore return code of dma_fence_signal()
From: Philipp Stanner <phasta@mailbox.org>
To: "Kuehling, Felix" <felix.kuehling@amd.com>, Philipp Stanner
 <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo
 Padovan <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Date: Thu, 27 Nov 2025 10:48:00 +0100
In-Reply-To: <cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-4-phasta@kernel.org>
 <cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 0128008008b612f56f4
X-MBO-RS-META: iynpcy9qgfczj4y13orf1zbr8bhxik1n
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-11-26 at 16:24 -0500, Kuehling, Felix wrote:
>=20
> On 2025-11-26 08:19, Philipp Stanner wrote:
> > The return code of dma_fence_signal() is not really useful as there is
> > nothing reasonable to do if a fence was already signaled. That return
> > code shall be removed from the kernel.
> >=20
> > Ignore dma_fence_signal()'s return code.
>=20
> I think this is not correct. Looking at the comment in=20
> evict_process_worker, we use the return value to decide a race=20
> conditions where multiple threads are trying to signal the eviction=20
> fence. Only one of them should schedule the restore work. And the other=
=20
> ones need to increment the reference count to keep evictions balanced.

Thank you for pointing that out. Seems then amdkfd is the only user who
actually relies on the feature. See below

>=20
> Regards,
> =C2=A0=C2=A0 Felix
>=20
>=20
> >=20
> > Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 ++---
> > =C2=A0 1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_process.c
> > index ddfe30c13e9d..950fafa4b3c3 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > @@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p=
, struct kfd_node *node,
> > =C2=A0 static int signal_eviction_fence(struct kfd_process *p)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct dma_fence *ef;
> > -	int ret;
> > =C2=A0=20
> > =C2=A0=C2=A0	rcu_read_lock();
> > =C2=A0=C2=A0	ef =3D dma_fence_get_rcu_safe(&p->ef);
> > @@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_pro=
cess *p)
> > =C2=A0=C2=A0	if (!ef)
> > =C2=A0=C2=A0		return -EINVAL;
> > =C2=A0=20
> > -	ret =3D dma_fence_signal(ef);
> > +	dma_fence_signal(ef);

The issue now is that dma_fence_signal()'s return code is actually non-
racy, because check + bit-set are protected by lock.

Christian's new spinlock series would add a lock function for fences:
https://lore.kernel.org/dri-devel/20251113145332.16805-5-christian.koenig@a=
md.com/


So I suppose this should work:

dma_fence_lock_irqsave(ef, flags);
if (dma_fence_test_signaled_flag(ef)) {
	dma_fence_unlock_irqrestore(ef, flags);
	return true;
}
dma_fence_signal_locked(ef);
dma_fence_unlock_irqrestore(ef, flags);

return false;


+ some cosmetic adjustments for the boolean of course.


Would that fly and be reasonable? @Felix, Christian.


P.
