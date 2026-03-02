Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF3SLKqEpWkCDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:38:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A51D8BF8
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A83A10E4C7;
	Mon,  2 Mar 2026 12:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="B3w2XDWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2653310E4C2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772455056; x=1773059856; i=natalie.vock@gmx.de;
 bh=8TCv6lo9qjoBor47WxSM0xiRMOiQQhswBmpaSIZiQcc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=B3w2XDWxF2rYfFX3uyk7f9zv5rm9wrFudBxFs18f2R6wdPuaf/P4NrNrCkdPt0Cn
 8ZsjacdUf69SZR3QMV82Y2pQDBCKK2Llh/cyark62PVmwnF4MbjNkZJIcq0jPtE+g
 tAhqP8gwt3ZJZec1NOp75CVw+L0YZdcJckbAPnDY4TaKY3yp6zH8tvXbaNNrV7ooX
 Aog8IhW3ucbhnqRvwxc4RGUXh38esDMCiUITpUIpHaz6esGObI6eDWavscwZzKi0Z
 Cy23BfGHeqRwOlo+SMQcWULwdbCPlnvVOcwYiBAFJipF90GFxggkeve3XN+M6HVwU
 7D4EIbwt+2WuyV33sA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE6L-1wHC6e3wlP-00SBfd; Mon, 02
 Mar 2026 13:37:36 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 02 Mar 2026 13:37:05 +0100
Subject: [PATCH v5 3/6] drm/ttm: Extract code for attempting allocation in
 a place
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260302-dmemcg-aggressive-protect-v5-3-ffd3a2602309@gmx.de>
References: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
In-Reply-To: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
To: Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Natalie Vock <natalie.vock@gmx.de>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:5/2SNmBX8IL2B0PZlAAFlLXfAzI0NVptdZW0svB1l755lbsmuoH
 velD8ujtr0sQjxhzWLskICEOj7AJ+QP6bVQccLT8IwSXXp/goDMZlklUKlOZHmUz5dxU5qf
 JHB5JGy4D6Nl86ZbxC8MNRe2UD7CXf4YRhpc/weF8SHVYLH4hZ/AoxPV3uEyEbs/apyIB6p
 ZTFVK5nau5n9qaZ9iW1zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8000rrIMdvM=;55mEJGPn4p48N52XM9N4A6k9+rN
 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
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,m:natalie.vock@gmx.de,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmx.de,igalia.com];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim,gmx.de:email,igalia.com:email]
X-Rspamd-Queue-Id: 1D3A51D8BF8
X-Rspamd-Action: no action

Move all code for attempting allocation for a specific place to
ttm_bo_alloc_place. With subsequent patches, this logic is going to get
more complicated, so it helps readability to have this separate.

ttm_bo_alloc_at_place takes a pointer to a struct ttm_bo_alloc_state.
This struct holds various state produced by the allocation (e.g. cgroup
resource associated with the allocation) that the caller needs to keep
track of (and potentially dispose of). This is just the limiting cgroup
pool for now, but future patches will add more state needing to be tracked=
.

ttm_bo_alloc_at_place also communicates via return codes if eviction
using ttm_bo_evict_alloc should be attempted. This is preparation for
attempting eviction in more cases than just force_space being set.

No functional change intended.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 104 +++++++++++++++++++++++++++++++++-----=
=2D----
 1 file changed, 81 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index acb9197db8798..3e62cab51f870 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -489,6 +489,11 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struc=
t ttm_resource_manager *man
 	return ret;
 }
=20
+struct ttm_bo_alloc_state {
+	/** @limit_pool: Which pool limit we should test against */
+	struct dmem_cgroup_pool_state *limit_pool;
+};
+
 /**
  * struct ttm_bo_evict_walk - Parameters for the evict walk.
  */
@@ -504,12 +509,13 @@ struct ttm_bo_evict_walk {
 	/** @evicted: Number of successful evictions. */
 	unsigned long evicted;
=20
-	/** @limit_pool: Which pool limit we should test against */
-	struct dmem_cgroup_pool_state *limit_pool;
 	/** @try_low: Whether we should attempt to evict BO's with low watermark=
 threshold */
 	bool try_low;
 	/** @hit_low: If we cannot evict a bo when @try_low is false (first pass=
) */
 	bool hit_low;
+
+	/** @alloc_state: State associated with the allocation attempt. */
+	struct ttm_bo_alloc_state *alloc_state;
 };
=20
 static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_o=
bject *bo)
@@ -518,8 +524,9 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, =
struct ttm_buffer_object *
 		container_of(walk, typeof(*evict_walk), walk);
 	s64 lret;
=20
-	if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo->resour=
ce->css,
-					      evict_walk->try_low, &evict_walk->hit_low))
+	if (!dmem_cgroup_state_evict_valuable(evict_walk->alloc_state->limit_poo=
l,
+					      bo->resource->css, evict_walk->try_low,
+					      &evict_walk->hit_low))
 		return 0;
=20
 	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk-=
>place))
@@ -561,7 +568,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 			      struct ttm_operation_ctx *ctx,
 			      struct ww_acquire_ctx *ticket,
 			      struct ttm_resource **res,
-			      struct dmem_cgroup_pool_state *limit_pool)
+			      struct ttm_bo_alloc_state *state)
 {
 	struct ttm_bo_evict_walk evict_walk =3D {
 		.walk =3D {
@@ -574,7 +581,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 		.place =3D place,
 		.evictor =3D evictor,
 		.res =3D res,
-		.limit_pool =3D limit_pool,
+		.alloc_state =3D state,
 	};
 	s64 lret;
=20
@@ -689,6 +696,58 @@ static int ttm_bo_add_pipelined_eviction_fences(struc=
t ttm_buffer_object *bo,
 	return dma_resv_reserve_fences(bo->base.resv, 1);
 }
=20
+
+/**
+ * ttm_bo_alloc_at_place - Attempt allocating a BO's backing store in a p=
lace
+ *
+ * @bo: The buffer to allocate the backing store of
+ * @place: The place to attempt allocation in
+ * @ctx: ttm_operation_ctx associated with this allocation
+ * @force_space: If we should evict buffers to force space
+ * @res: On allocation success, the resulting struct ttm_resource.
+ * @alloc_state: Object holding allocation state such as charged cgroups.
+ *
+ * Returns:
+ * -EBUSY: No space available, but allocation should be retried with ttm_=
bo_evict_alloc.
+ * -ENOSPC: No space available, allocation should not be retried.
+ * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
+ *
+ */
+static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
+				 const struct ttm_place *place,
+				 struct ttm_operation_ctx *ctx,
+				 bool force_space,
+				 struct ttm_resource **res,
+				 struct ttm_bo_alloc_state *alloc_state)
+{
+	bool may_evict;
+	int ret;
+
+	may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
+
+	ret =3D ttm_resource_alloc(bo, place, res,
+				 force_space ? &alloc_state->limit_pool : NULL);
+
+	if (ret) {
+		/*
+		 * -EAGAIN means the charge failed, which we treat like an
+		 * allocation failure. Therefore, return an error code indicating
+		 * the allocation failed - either -EBUSY if the allocation should
+		 * be retried with eviction, or -ENOSPC if there should be no second
+		 * attempt.
+		 */
+		if (ret =3D=3D -EAGAIN)
+			return may_evict ? -EBUSY : -ENOSPC;
+
+		if (ret =3D=3D -ENOSPC && may_evict)
+			return -EBUSY;
+
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * ttm_bo_alloc_resource - Allocate backing store for a BO
  *
@@ -725,9 +784,8 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
=20
 	for (i =3D 0; i < placement->num_placement; ++i) {
 		const struct ttm_place *place =3D &placement->placement[i];
-		struct dmem_cgroup_pool_state *limit_pool =3D NULL;
+		struct ttm_bo_alloc_state alloc_state =3D {};
 		struct ttm_resource_manager *man;
-		bool may_evict;
=20
 		man =3D ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
@@ -737,25 +795,25 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
bject *bo,
 				    TTM_PL_FLAG_FALLBACK))
 			continue;
=20
-		may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
-		ret =3D ttm_resource_alloc(bo, place, res, force_space ? &limit_pool : =
NULL);
-		if (ret) {
-			if (ret !=3D -ENOSPC && ret !=3D -EAGAIN) {
-				dmem_cgroup_pool_state_put(limit_pool);
-				return ret;
-			}
-			if (!may_evict) {
-				dmem_cgroup_pool_state_put(limit_pool);
-				continue;
-			}
+		ret =3D ttm_bo_alloc_at_place(bo, place, ctx, force_space,
+				res, &alloc_state);
=20
+		if (ret =3D=3D -ENOSPC) {
+			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
+			continue;
+		} else if (ret =3D=3D -EBUSY) {
 			ret =3D ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
-						 ticket, res, limit_pool);
-			dmem_cgroup_pool_state_put(limit_pool);
+						 ticket, res, &alloc_state);
+
+			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
+
 			if (ret =3D=3D -EBUSY)
 				continue;
-			if (ret)
-				return ret;
+			else if (ret)
+				return;
+		} else if (ret) {
+			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
+			return ret;
 		}
=20
 		ret =3D ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu)=
;

=2D-=20
2.53.0

