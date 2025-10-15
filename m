Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F456BDEE5F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D4410E807;
	Wed, 15 Oct 2025 14:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="bF+GQeja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5E910E807
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1760537009; x=1761141809; i=natalie.vock@gmx.de;
 bh=ZfXFDXTVVcVjH9CbKFppb74hdNyo76DwCcqC4Pzs9V0=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bF+GQeja0NPA/L70+ucGguBQENURKad2YSsdtmyjwQVwXXrSGkYTpGjryzz5E8WW
 lZklQyVMgADyTCECOEish1Q2jKOUo+32RtfuGIP7XFIQsYRLpvE2TWkBJXLkqem7g
 J81WMLdxL34PDbYX34XPj/+5PTzzmabdijOP87CzYMRd7JtYHhzx4qRuFFOMsbM6K
 2/FuxNfLOwSqVbje4d93emSREfd7M8OEOJPFfqUUeAp8ECv2rwEUhpLBhIcYwGkmq
 9RSYRjBRzP+Pc2bW3Sc61nuFfUi4wZO8ARJNMXCQ40lQbRa32lqjQNucKZnwtN0vg
 CK5N6aS5d68E7suvSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnaoZ-1uPUe71ajt-00o7D9; Wed, 15
 Oct 2025 15:57:54 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 15 Oct 2025 15:57:31 +0200
Subject: [PATCH v2 4/5] drm/ttm: Be more aggressive when allocating below
 protection limit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251015-dmemcg-aggressive-protect-v2-4-36644fb4e37f@gmx.de>
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
X-Provags-ID: V03:K1:IaLmcoicxgJQOJuORepvvkU8I/vYfXLT34YonRdGR7iPe7LMtLF
 jQlYLm/yPTDmsoN+JKwReIqTBw3enCLZbcl0Ol9r2lVtUmIfQPDviHX7EYTm8ClLcQi0CKI
 RIgXg98JF4FDyReICxtMICOdawthPET4qyXDJcA6bN717zYs0d9UNqH8SQaghpWeClipYGW
 T6d4uKjfk9xhGnhqJUiAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1c3RbUxY6Hw=;SM9Hu/HCWwHVVMJoa2gU4poRH/h
 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
 8N6ZA==
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

When the cgroup's memory usage is below the low/min limit and allocation
fails, try evicting some unprotected buffers to make space. Otherwise,
application buffers may be forced to go into GTT even though usage is
below the corresponding low/min limit, if other applications filled VRAM
with their allocations first.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c       | 43 ++++++++++++++++++++++++++++-----=
-
 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++++++------=
=2D----
 include/drm/ttm/ttm_resource.h     |  6 ++++-
 3 files changed, 76 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 829d99479883594f8be5b9ceed4cc53c4864ace5..7f7872ab2090cc8db188e08ddf=
dcd12fe924f743 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -490,8 +490,12 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struc=
t ttm_resource_manager *man
 }
=20
 struct ttm_bo_alloc_state {
+	/** @charge_pool: The memory pool the resource is charged to */
+	struct dmem_cgroup_pool_state *charge_pool;
 	/** @limit_pool: Which pool limit we should test against */
 	struct dmem_cgroup_pool_state *limit_pool;
+	/** @only_evict_unprotected: If eviction should be restricted to unprote=
cted BOs */
+	bool only_evict_unprotected;
 };
=20
 /**
@@ -546,7 +550,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, =
struct ttm_buffer_object *
 	evict_walk->evicted++;
 	if (evict_walk->res)
 		lret =3D ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
-					  evict_walk->res, NULL);
+					  evict_walk->res, evict_walk->alloc_state->charge_pool);
 	if (lret =3D=3D 0)
 		return 1;
 out:
@@ -589,7 +593,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
=20
 	/* One more attempt if we hit low limit? */
-	if (!lret && evict_walk.hit_low) {
+	if (!lret && evict_walk.hit_low && !state->only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
 	}
@@ -610,7 +614,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	} while (!lret && evict_walk.evicted);
=20
 	/* We hit the low limit? Try once more */
-	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
+	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
+			!state->only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		goto retry;
 	}
@@ -719,20 +724,40 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_o=
bject *bo,
 				 struct ttm_resource **res,
 				 struct ttm_bo_alloc_state *alloc_state)
 {
-	bool may_evict;
+	bool may_evict, is_protected =3D false;
 	int ret;
=20
 	may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
+	ret =3D ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
+				      force_space ? &alloc_state->limit_pool : NULL);
+	if (ret) {
+		/*
+		 * -EAGAIN means the charge failed, which we treat like an
+		 * allocation failure. Allocation failures are indicated
+		 * by -ENOSPC, so return that instead.
+		 */
+		if (ret =3D=3D -EAGAIN && !may_evict)
+			ret =3D -ENOSPC;
+		return ret;
+	}
=20
-	ret =3D ttm_resource_alloc(bo, place, res,
-				 force_space ? &alloc_state->limit_pool : NULL);
+	is_protected =3D dmem_cgroup_below_min(NULL, alloc_state->charge_pool) |=
|
+		       dmem_cgroup_below_low(NULL, alloc_state->charge_pool);
+	ret =3D ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
+	alloc_state->only_evict_unprotected =3D !may_evict && is_protected;
=20
 	if (ret) {
-		if ((ret =3D=3D -ENOSPC || ret =3D=3D -EAGAIN) && may_evict)
+		if ((ret =3D=3D -ENOSPC || ret =3D=3D -EAGAIN) &&
+				(may_evict || is_protected))
 			ret =3D -EBUSY;
 		return ret;
 	}
=20
+	/*
+	 * Ownership of charge_pool has been transferred to the TTM resource,
+	 * don't make the caller think we still hold a reference to it.
+	 */
+	alloc_state->charge_pool =3D NULL;
 	return 0;
 }
=20
@@ -787,6 +812,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
 				res, &alloc_state);
=20
 		if (ret =3D=3D -ENOSPC) {
+			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
 			continue;
 		} else if (ret =3D=3D -EBUSY) {
@@ -796,11 +822,14 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
bject *bo,
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
=20
 			if (ret) {
+				dmem_cgroup_pool_state_put(
+						alloc_state.charge_pool);
 				if (ret !=3D -ENOSPC && ret !=3D -EBUSY)
 					return ret;
 				continue;
 			}
 		} else if (ret) {
+			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
 			return ret;
 		}
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_=
resource.c
index e2c82ad07eb44b5e88bf5b5db1ef54dd6d27823b..fcfa8b51b033745f46a01e40a9=
dc83e0c69165fc 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -372,30 +372,52 @@ void ttm_resource_fini(struct ttm_resource_manager *=
man,
 }
 EXPORT_SYMBOL(ttm_resource_fini);
=20
+/**
+ * ttm_resource_try_charge - charge a resource manager's cgroup pool
+ * @bo: buffer for which an allocation should be charged
+ * @place: where the allocation is attempted to be placed
+ * @ret_pool: on charge success, the pool that was charged
+ * @ret_limit_pool: on charge failure, the pool responsible for the failu=
re
+ *
+ * Should be used to charge cgroups before attempting resource allocation=
.
+ * When charging succeeds, the value of ret_pool should be passed to
+ * ttm_resource_alloc.
+ *
+ * Returns: 0 on charge success, negative errno on failure.
+ */
+int ttm_resource_try_charge(struct ttm_buffer_object *bo,
+			    const struct ttm_place *place,
+			    struct dmem_cgroup_pool_state **ret_pool,
+			    struct dmem_cgroup_pool_state **ret_limit_pool)
+{
+	struct ttm_resource_manager *man =3D
+		ttm_manager_type(bo->bdev, place->mem_type);
+
+	if (!man->cg) {
+		*ret_pool =3D NULL;
+		if (ret_limit_pool)
+			*ret_limit_pool =3D NULL;
+		return 0;
+	}
+
+	return dmem_cgroup_try_charge(man->cg, bo->base.size, ret_pool,
+				      ret_limit_pool);
+}
+
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res_ptr,
-		       struct dmem_cgroup_pool_state **ret_limit_pool)
+		       struct dmem_cgroup_pool_state *charge_pool)
 {
 	struct ttm_resource_manager *man =3D
 		ttm_manager_type(bo->bdev, place->mem_type);
-	struct dmem_cgroup_pool_state *pool =3D NULL;
 	int ret;
=20
-	if (man->cg) {
-		ret =3D dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, ret_limit=
_pool);
-		if (ret)
-			return ret;
-	}
-
 	ret =3D man->func->alloc(man, bo, place, res_ptr);
-	if (ret) {
-		if (pool)
-			dmem_cgroup_uncharge(pool, bo->base.size);
+	if (ret)
 		return ret;
-	}
=20
-	(*res_ptr)->css =3D pool;
+	(*res_ptr)->css =3D charge_pool;
=20
 	spin_lock(&bo->bdev->lru_lock);
 	ttm_resource_add_bulk_move(*res_ptr, bo);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource=
.h
index e52bba15012f78e352f392232ac2e89a83afd311..3aef7efdd7cfb8fd93071db85e=
632b975b53cf81 100644
=2D-- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -442,10 +442,14 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 void ttm_resource_fini(struct ttm_resource_manager *man,
 		       struct ttm_resource *res);
=20
+int ttm_resource_try_charge(struct ttm_buffer_object *bo,
+			    const struct ttm_place *place,
+			    struct dmem_cgroup_pool_state **ret_pool,
+			    struct dmem_cgroup_pool_state **ret_limit_pool);
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res,
-		       struct dmem_cgroup_pool_state **ret_limit_pool);
+		       struct dmem_cgroup_pool_state *charge_pool);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource =
**res);
 bool ttm_resource_intersects(struct ttm_device *bdev,
 			     struct ttm_resource *res,

=2D-=20
2.51.0

