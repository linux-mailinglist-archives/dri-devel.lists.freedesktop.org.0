Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFDCC+zmnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1780197104
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0636610E74E;
	Wed, 25 Feb 2026 12:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="a2xvT07V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285E10E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772021460; x=1772626260; i=natalie.vock@gmx.de;
 bh=DGZ31b6YaOPYiGiwT9RQbQAuVbhXx0d+e/PWb+Ieyqk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=a2xvT07VFRXM9jGXHU6EggCdzKPI4LT7nkMm1F8HldBA9WJWh7xqz6vQzk/HPBdc
 8hYsg85LiSStOYS4bgyB9PLTMuw2Dxkv2d2dthtuax6k92exbAZyOUT5Zk7Z3YjWU
 5OsjCP1UWcs/OLpXhby+GuCRnsI0jDC5WmahA52jED9Z876SSiFONXrVroGH7/xeU
 BNWMdr2tBkTdjL2fZwx85Cvm4PjDhIGPthMTWGHoHi4SnNrcjUiwN+GrxQQD+9OBs
 ZM7Q4Wf5WCKj38eqmz95sjmBtd01muGV3jyKNTa8NEEiE457NFmz+i7ZjKhAm+llD
 LpWE7/StwzzAT2p0tg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKKX-1vxgi50ykb-003ck7; Wed, 25
 Feb 2026 13:11:00 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 25 Feb 2026 13:10:48 +0100
Subject: [PATCH v4 4/6] drm/ttm: Split cgroup charge and resource
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260225-dmemcg-aggressive-protect-v4-4-de847ab35184@gmx.de>
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
X-Provags-ID: V03:K1:G/f1uLTYHFdLLaBC+GUT7JL77ID0dq69cwVlsbnvdhfECKf3V7E
 MW9FndRukPoudBWluK4bi4DeY5YfOqN3D8Df9J2HHQ7KlSs8E7ZfdUkefiyFDSdHkOfDCJ1
 0h0KYSthwtFP+G9ST27A+pkoAtgPrYXWKkHBpaDF1Yn0GJNQ3Ol8CJq7qV7XtJh9eb6mN7M
 32Z4RxN2fyIKSDd/a90dQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:25ITU8EtPc4=;nKHVdN6Qz1FyZHIDR1lA3KbJMac
 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
 526/qzWOa+OKuHByP+RkUSvMlzGN7
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
X-Rspamd-Queue-Id: D1780197104
X-Rspamd-Action: no action

Coupling resource allocation and cgroup charging is racy when charging
succeeds, but subsequent resource allocation fails. Certain eviction
decisions are made on the basis of whether the allocating cgroup is
protected, i.e. within its min/low limits, but with the charge being
tied to resource allocation (and uncharged when the resource allocation
fails), this check is done at a poin where the allocation is not actually
charged to the cgroup.

This is subtly wrong if the allocation were to cause the cgroup to exceed
the min/low protection, but it's even more wrong if the same cgroup tries
allocating multiple buffers concurrently: In this case, the min/low
protection may pass for all allocation attempts when the real min/low
protection covers only some, or potentially none of the allocated
buffers.

Instead, charge the allocation to the cgroup once and keep the charge
for as long as we try to allocate a ttm_resource, and only undo the charge
if allocating the resource is ultimately unsuccessful and we move on to
a different ttm_place.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c       | 28 +++++++++++++++-------
 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++++++------=
=2D----
 include/drm/ttm/ttm_resource.h     |  6 ++++-
 3 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 48dbaaa46824c..a8914d20b0c32 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -490,6 +490,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct=
 ttm_resource_manager *man
 }
=20
 struct ttm_bo_alloc_state {
+	/** @charge_pool: The memory pool the resource is charged to */
+	struct dmem_cgroup_pool_state *charge_pool;
 	/** @limit_pool: Which pool limit we should test against */
 	struct dmem_cgroup_pool_state *limit_pool;
 };
@@ -546,7 +548,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, =
struct ttm_buffer_object *
 	evict_walk->evicted++;
 	if (evict_walk->res)
 		lret =3D ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
-					  evict_walk->res, NULL);
+					  evict_walk->res, evict_walk->alloc_state->charge_pool);
 	if (lret =3D=3D 0)
 		return 1;
 out:
@@ -724,10 +726,8 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_ob=
ject *bo,
 	int ret;
=20
 	may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
-
-	ret =3D ttm_resource_alloc(bo, place, res,
-				 force_space ? &alloc_state->limit_pool : NULL);
-
+	ret =3D ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
+				      force_space ? &alloc_state->limit_pool : NULL);
 	if (ret) {
 		/*
 		 * -EAGAIN means the charge failed, which we treat like an
@@ -737,14 +737,23 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_o=
bject *bo,
 		 * attempt.
 		 */
 		if (ret =3D=3D -EAGAIN)
-			return may_evict ? -EBUSY : -ENOSPC;
+			ret =3D may_evict ? -EBUSY : -ENOSPC;
+		return ret;
+	}
=20
-		if (ret =3D=3D -ENOSPC && may_evict)
-			return -EBUSY;
+	ret =3D ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
=20
+	if (ret) {
+		if (ret =3D=3D -ENOSPC && may_evict)
+			ret =3D -EBUSY;
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
@@ -799,6 +808,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
 				res, &alloc_state);
=20
 		if (ret =3D=3D -ENOSPC) {
+			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
 			continue;
 		} else if (ret =3D=3D -EBUSY) {
@@ -808,11 +818,13 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
bject *bo,
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
=20
 			if (ret) {
+				dmem_cgroup_pool_state_put(alloc_state.charge_pool);
 				if (ret !=3D -EBUSY)
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
index 192fca24f37e4..a8a836f6e376a 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -373,30 +373,52 @@ void ttm_resource_fini(struct ttm_resource_manager *=
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
index 33e80f30b8b82..549b5b796884d 100644
=2D-- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -456,10 +456,14 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
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
2.53.0

