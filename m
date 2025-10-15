Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A663BBDEDF5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D924010E7F8;
	Wed, 15 Oct 2025 13:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="H8ehayJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256CE10E7F8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1760536673; x=1761141473; i=natalie.vock@gmx.de;
 bh=1eJ+mCGgXSmAe94aalrGHGYk7Pz+JQwnW+YxjTtji90=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=H8ehayJSTy8f97gK9JtAfbeP0/1ZQMDfFPmLjNDY9GHiDsNGVGjttqaYd2XDPpkh
 hEOuGEowSjK3MqbDSerI1Z/1GsFJjmS7wnNhFAOYxyY79tK6bjF+iNGLrBC4UehV+
 jHwkTNXWqe3mwjJ9jBkHy22a7h315sLUAzSwOy2iHedwAaU9Fi2/PfqqrWWhCSlau
 IXFs/DzFh/2N1BVCyadE8TayWiFgUdOZJBQmomjK6rnei077HjkE+ZWEFmTyyn6FP
 VkQpXXv2QbwnpwvuKBPY3KVEUQNqnu1M8kDHhuDw2nyOasQ2epLmgnrjQP4cqcrGa
 PIDSk1llTvVbOO/XZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2DxE-1u5TrD1kDO-017aAS; Wed, 15
 Oct 2025 15:57:53 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 15 Oct 2025 15:57:30 +0200
Subject: [PATCH v2 3/5] drm/ttm: Make a helper for attempting allocation in
 a place
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251015-dmemcg-aggressive-protect-v2-3-36644fb4e37f@gmx.de>
References: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
In-Reply-To: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
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
X-Mailer: b4 0.14.2
X-Provags-ID: V03:K1:hicDq9iuzyg+tNfxw3wIZcXwNL0ATaToG5Rvh4S4FcP0gl/Dry3
 VDrFr+tpLmLZSn7Dy5LDvbP4QtV5x56mS1dnq2bdsRzzMrjpDSQhpvl5W47+Z2fVV97VILS
 zNZIGCFk4lNijpy3WIZPQb4IUgLlF4F8tseZNLUAUcpt6mNCQ4FbNiLvHYuBlFh+hQH6hyy
 MOU7sjUxNiuwgCQDT5Qvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/LsN5GMoO3E=;Lb38LSaEMW2FVu9scK42GsEIlpR
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
index f4d9e68b21e70cb25d0db5e79391233e1dc72221..829d99479883594f8be5b9ceed=
4cc53c4864ace5 100644
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
2.51.0

