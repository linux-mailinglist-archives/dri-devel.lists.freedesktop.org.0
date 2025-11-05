Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B808C355F4
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 12:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A1B10E701;
	Wed,  5 Nov 2025 11:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="layoS3wZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E345A10E701
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 11:33:08 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d1jqj1vq5z9v5H;
 Wed,  5 Nov 2025 12:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762342385; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAe/QvWhI1MqiiGrLuDwK+dWilyj6go0MLW+FJxZFr8=;
 b=layoS3wZ1E/R5/4e55fNksT8U95Y5c1eSSahctFSDDT6sdb5ekBCD+wwgSVrCanuecLSCL
 BdlJs1NZWPVtE4/TKphbqY40WkLXEZKovq8xUFwHg0Q/u1QfNPq2KqTA3v6cotCYoeXfTT
 hBu6bo0lQpygxKHjCqWEMRIAjClGMRclgFpIthJ7Z0F6aBUp9OnWw29RieIA7x0F3HS4K+
 lAW28AFBqYu9BBWgTUXNuzA6EO4Kpio0G09wcruJStGWOxpzCRvtegR78i9tUezP2TYsCx
 h7GlJplJC5hAmrECWpz7sD4O72aUdcIgP/tppzBpP/5CnAMEBlh+hIYRngwV1A==
Message-ID: <1801bdee8236678f0284a0d71b8742d92708605a.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Date: Wed, 05 Nov 2025 12:32:57 +0100
In-Reply-To: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 9kpsr57q38skypbbg7hubxkkafkg9jfk
X-MBO-RS-ID: 616a0a032e0b215b8f8
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

On Tue, 2025-11-04 at 10:53 +0100, Pierre-Eric Pelloux-Prayer wrote:
> The Mesa issue referenced below pointed out a possible deadlock:
>=20
> [ 1231.611031]=C2=A0 Possible interrupt unsafe locking scenario:
>=20
> [ 1231.611033]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> [ 1231.611034]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> [ 1231.611035]=C2=A0=C2=A0 lock(&xa->xa_lock#17);
> [ 1231.611038]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_disable();
> [ 1231.611039]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> [ 1231.611041]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&xa->xa_lock#17=
);
> [ 1231.611044]=C2=A0=C2=A0 <Interrupt>
> [ 1231.611045]=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> [ 1231.611047]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *** DEADLOCK ***
>=20
> In this example, CPU0 would be any function accessing job->dependencies
> through the xa_* functions that doesn't disable interrupts (eg:
> drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).
>=20
> CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
> callback so in an interrupt context. It will deadlock when trying to
> grab the xa_lock which is already held by CPU0.
>=20
> Replacing all xa_* usage by their xa_*_irq counterparts would fix
> this issue, but Christian pointed out another issue: dma_fence_signal
> takes fence.lock and so does dma_fence_add_callback.
>=20
> =C2=A0 dma_fence_signal() // locks f1.lock
> =C2=A0 -> drm_sched_entity_kill_jobs_cb()
> =C2=A0 -> foreach dependencies
> =C2=A0=C2=A0=C2=A0=C2=A0 -> dma_fence_add_callback() // locks f2.lock
>=20
> This will deadlock if f1 and f2 share the same spinlock.
>=20
> To fix both issues, the code iterating on dependencies and re-arming them
> is moved out to drm_sched_entity_kill_jobs_work.
>=20
> v2: reworded commit message (Philipp)
> v3: added Fixes tag (Philipp)
>=20
> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Pushed to drm-misc-fixes.

Thx, Pierre-Eric!


P.
