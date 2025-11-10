Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E135C46A45
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26A410E382;
	Mon, 10 Nov 2025 12:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="fv9q1E5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B32A10E387
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762778349; x=1763383149; i=natalie.vock@gmx.de;
 bh=0Kc8zBhmv61GNFKms8woUXkDZaIzdqdGo8mxhO+VZVs=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fv9q1E5ClHKqNiRR0j+1XhUhnQoQdfCODSOVMWYh98Cp+UlklEELVVqZZP2j00kV
 sx7xo4RvpAjVkIc+aNS6PGRZ5yaqJOZ+fPhZelU0d/LA6O4gs/9fSPKUHsgl5nW6A
 PMGnjsFxbuY3WRJeZzK3arpmxYLPpQvb2J42yT6V4Oi8h/PtLfCA44v/E2s6RuWvX
 gL2w4usUUVey+ojlKNArmQLQDtskNf5qzxVGJWbBUjFiggflUkJnGkCFXIOocLiBB
 6ziOo2iLXN27CShWs+yUgLSogziWPRE7WF57BQL6/Jth84qM4C4bCCfC5gXzBMOuV
 jBU2q9mxugu2nlwWxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.42.49.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8QWA-1vE1KW44PI-00BEAP; Mon, 10
 Nov 2025 13:39:09 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 10 Nov 2025 13:37:32 +0100
Subject: [PATCH v3 3/5] drm/ttm: Make a helper for attempting allocation in
 a place
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251110-dmemcg-aggressive-protect-v3-3-219ffcfc54e9@gmx.de>
References: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
In-Reply-To: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
To: Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:NymmWpQXkFIGXZWfuIXpA4fDD+aOUp1/qFN5UEF2ipqBi5k6Af4
 l8+lH2d3XuktMtFcvcVVBBxnwSA7P/Xa9iJ61F8QUCmFXdqnLYhbkPhU6DIIyKNRoPguBhx
 0iMnIoi19urVReHXcTOsvEJnUZFpdpvaW/ClHkdp67OSPIEjp6k24rScHyfyN6c7jJVuFaE
 RGWv70Xu3Xh/U0ld+YHPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f7sJB+Ooofs=;7SspkXziE0/7gct46veU68sgxBz
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

ttm_bo_alloc_place is a new helper function to make an attempt at
allocating a bo's resource in a specific place. It also makes decisions
on whether eviction should be attempted: If -ENOSPC is returned,
allocation should not be retried.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 98 +++++++++++++++++++++++++++++++++------=
=2D----
 1 file changed, 73 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f4d9e68b21e70..829d994798835 100644
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
+	/** @alloc_state: */
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
@@ -688,6 +695,47 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_ob=
ject *bo,
 	return ret;
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
+ * -EBUSY: No space available, but allocation should be retried with evic=
tion.
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
+		if ((ret =3D=3D -ENOSPC || ret =3D=3D -EAGAIN) && may_evict)
+			ret =3D -EBUSY;
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * ttm_bo_alloc_resource - Allocate backing store for a BO
  *
@@ -713,7 +761,9 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
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
@@ -724,9 +774,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
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
@@ -736,25 +783,26 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
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
+				if (ret !=3D -ENOSPC && ret !=3D -EBUSY)
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
 		ret =3D ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);

=2D-=20
2.51.2

