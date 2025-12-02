Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA50C9AAF0
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6BA10E5B5;
	Tue,  2 Dec 2025 08:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rtiE3GB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9C10E5B1;
 Tue,  2 Dec 2025 08:29:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dLDTD0jlmz9t0n;
 Tue,  2 Dec 2025 09:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764664160; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3V+T3Om8mfxHZjoquX2SFCTJRc6COI8uBe9tXVns1o=;
 b=rtiE3GB6OQymRRXq6bWEORf0EfuPDtxS3sekTtzO4T8XZ5MLvkGt1Ac63OSi8pz4kbswXr
 yX/iz/4acIgH6RUpliPeKrVGPQnrMs4ZXxhU13MkAgCIPxHBH+/pm8Z/Cf3nSH4HQ8B/Bz
 ayg2P2whnMkKeJLXUzff2SV/iVSLS8+8FonRXw6WpYcXZ4ISMy2FqDLagUV/ezUoERrhXv
 zWyTuYkstLxtsa7rlL59fvFOO+uPnh2qr28MZUrbY+2Xl2t37pRdVa0fxXfdwI5/F/sg1r
 5Flw/byOkjwd8AVdjG0gHpG5fTsS2diT8CrO3d6uWKB+oAPFIHn+SRu5ItC5+w==
Message-ID: <1aaaa2fe56fc7598b653a5e45fc26aa0b8703ad5.camel@mailbox.org>
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 09:29:09 +0100
In-Reply-To: <aS3touSB1ZyR2hfM@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-10-phasta@kernel.org>
 <aS3touSB1ZyR2hfM@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 76ac2ab24f1c8917547
X-MBO-RS-META: 6eppcxqxqw1xf4rtz518s3ggqzj8e6aa
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

On Mon, 2025-12-01 at 11:33 -0800, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:50:12AM +0100, Philipp Stanner wrote:
> > There is a new dma_fence helper which simplifies testing for a fence's
> > signaled_flag. Use it in xe.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Doesn't apply on drm-misc-next. Suggestions about what to do about
that?


P.


>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 3 +--
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0 | 2 +-
> > =C2=A03 files changed, 5 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe=
_exec_queue.c
> > index cb5f204c08ed..06736f52fbaa 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(st=
ruct xe_exec_queue *q,
> > =C2=A0
> > =C2=A0	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > =C2=A0
> > -	if (q->last_fence &&
> > -	=C2=A0=C2=A0=C2=A0 test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fen=
ce->flags))
> > +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> > =C2=A0		xe_exec_queue_last_fence_put(q, vm);
> > =C2=A0
> > =C2=A0	fence =3D q->last_fence ? q->last_fence : dma_fence_get_stub();
> > @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_fo=
r_resume(struct xe_exec_queue *
> > =C2=A0
> > =C2=A0	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> > =C2=A0
> > -	if (q->last_fence &&
> > -	=C2=A0=C2=A0=C2=A0 test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fen=
ce->flags))
> > +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> > =C2=A0		xe_exec_queue_last_fence_put_unlocked(q);
> > =C2=A0
> > =C2=A0	fence =3D q->last_fence ? q->last_fence : dma_fence_get_stub();
> > @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_e=
xec_queue *q, struct xe_vm *vm)
> > =C2=A0
> > =C2=A0	fence =3D xe_exec_queue_last_fence_get(q, vm);
> > =C2=A0	if (fence) {
> > -		err =3D test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> > -			0 : -ETIME;
> > +		err =3D dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
> > =C2=A0		dma_fence_put(fence);
> > =C2=A0	}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 07f96bda638a..1ca2dec18e51 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syn=
cs, u32 num_syncs)
> > =C2=A0	for (i =3D 0; i < num_syncs; i++) {
> > =C2=A0		struct dma_fence *fence =3D syncs[i].fence;
> > =C2=A0
> > -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags))
> > +		if (fence && !dma_fence_test_signaled_flag(fence))
> > =C2=A0			return false;
> > =C2=A0	}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_=
sched_job.c
> > index d21bf8f26964..1c9ba49a325b 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fe=
nce, int error)
> > =C2=A0	bool signaled;
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(fence->lock, irq_flags);
> > -	signaled =3D test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> > +	signaled =3D dma_fence_test_signaled_flag(fence);
> > =C2=A0	if (!signaled)
> > =C2=A0		dma_fence_set_error(fence, error);
> > =C2=A0	spin_unlock_irqrestore(fence->lock, irq_flags);
> > --=20
> > 2.49.0
> >=20

