Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKvPD+XmnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27421970E3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D299110E74B;
	Wed, 25 Feb 2026 12:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="negHqezT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE1010E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772021459; x=1772626259; i=natalie.vock@gmx.de;
 bh=ZKBVeNrG1+wua9m7e2us0j8w9wwo0pC08OyTTfGFRSg=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=negHqezTl37BxMCIE657nCRknCkdV6LeQTs43J8XzfHQd2uR3R+jG7/8HADV5U/e
 c8K6doqU7tqNCShttxwGs7VXUHcrcy3SnwDdyRfUCjDwb23H/9JwBcZDtx7JMpz3t
 GzD/teeQFuOPu++kjM6R29hKoPT3Qb1QT2DfdT/4kbuDG7uv8AoNVpUsTbGDU6tjQ
 X1vUMyrdnxRdfihkMSfNzeP/T/tg2A3fp3m5H+iVyhGghGBaqH1e9ohHiyuokXPTG
 Az4ttKz02Ix4nIzRptRM6BB+p4csD5R1IkcO863bVQm0BT/eKZC3uiIyA/Jbz1ltD
 hezjrILg35SQnxgotg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbg4-1w9SGN0Ivs-00X5zC; Wed, 25
 Feb 2026 13:10:59 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 25 Feb 2026 13:10:47 +0100
Subject: [PATCH v4 3/6] drm/ttm: Extract code for attempting allocation in
 a place
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260225-dmemcg-aggressive-protect-v4-3-de847ab35184@gmx.de>
References: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
In-Reply-To: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
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
 Natalie Vock <natalie.vock@gmx.de>
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:x1aT9sqWo6PzdWrNduB47rRLejXSoPLhW6kzaNkARRY0p2IL9Oa
 avw3o+QpY27kAapyRSwv57eEJiAgJ+p2grcFAt9z39+zjwmNrMYCL3EC5/pP+VzV9HPqRtt
 W/EL98pKN6z9CYViG3pQwVjzvPu65vwN2yD14lWSfUC7k5QK5w1T8Tz9Z9s09RFBExtD5/6
 rqjZMRn68PFaDdHJ6w2eA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wPtC0xL2RdM=;yygb4ue8mTZSq4a2V2O+lfqFxEt
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,m:natalie.vock@gmx.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmx.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E27421970E3
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
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 109 +++++++++++++++++++++++++++++++++-----=
=2D----
 1 file changed, 84 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index acb9197db8798..48dbaaa46824c 100644
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
@@ -714,7 +773,9 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
 				 bool force_space,
 				 struct ttm_resource **res)
 {
+	struct ttm_bo_alloc_state alloc_state =3D {0};
 	struct ttm_device *bdev =3D bo->bdev;
+	struct ttm_resource_manager *man;
 	struct ww_acquire_ctx *ticket;
 	int i, ret;
=20
@@ -725,9 +786,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
=20
 	for (i =3D 0; i < placement->num_placement; ++i) {
 		const struct ttm_place *place =3D &placement->placement[i];
-		struct dmem_cgroup_pool_state *limit_pool =3D NULL;
-		struct ttm_resource_manager *man;
-		bool may_evict;
=20
 		man =3D ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
@@ -737,25 +795,26 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
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
-			if (ret =3D=3D -EBUSY)
+						 ticket, res, &alloc_state);
+
+			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
+
+			if (ret) {
+				if (ret !=3D -EBUSY)
+					return ret;
 				continue;
-			if (ret)
-				return ret;
+			}
+		} else if (ret) {
+			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
+			return ret;
 		}
=20
 		ret =3D ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu)=
;

=2D-=20
2.53.0

