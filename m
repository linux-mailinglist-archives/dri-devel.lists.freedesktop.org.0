Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBaoD62EpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:38:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27161D8C0D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7745410E4CA;
	Mon,  2 Mar 2026 12:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="mP4gn2vP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA4710E4C2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772455057; x=1773059857; i=natalie.vock@gmx.de;
 bh=GaLeTiPWwkQ6DfTAkLsmf1cuoBpcbNlyI6s7S0zjS9M=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mP4gn2vPpkIXGslOr3rv4n3PHz3NIYCus3FFM7PLc2Tkj2Ele2zTtIrhMR85+fdE
 RLshNAyx7FroS2nIalVwjLHCQNFe6MGDu68o4ryIXtA6ceu9+gISL9Vzf2MAhS9zz
 F7WSI55ELyfw4+Q/32m/4zPdFpTpeHjy3RZrvpzuobsARnNQ5gu5/XzteXjZQOJG1
 ldwTWnfXTWecTOkxAnP6498dyOX8e41p0J1Et0qwbuWaPJhij4/T75wq05+V2VZ/W
 O242lJJ8XBiI1/6mIZCOGHeeN/o/0i+RrjFZMqGdyQSgv814HsfMd9QJ7EIJIPA0U
 1uwlUhB9dkys69WV1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3Rs-1wGMdK3yta-00RMrE; Mon, 02
 Mar 2026 13:37:37 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 02 Mar 2026 13:37:06 +0100
Subject: [PATCH v5 4/6] drm/ttm: Split cgroup charge and resource
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260302-dmemcg-aggressive-protect-v5-4-ffd3a2602309@gmx.de>
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
 Natalie Vock <natalie.vock@gmx.de>
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:EShs2RheNUh5wNS456MR7dEbYyXFJADwkKjOpfVbxM0oX+Yrgv4
 ekLPunRTY/4JE4qb63nrdxDIXWJPI3pRuhxfiw8wFgzW1r7Y+yc/MsOEJU7vX/o9tfWcpTf
 yQbhIZ/L1CyP1LgzXGaAVacPw6bcBBDjfam6JV5AoHoYf6tDxIb2prGQ/l8JBDcC7X2XLxL
 Y4xOOn6+O61bpJEDFNQvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WMB+6an+xjw=;/Ud1bvy7Rfdl4s3oA0M0714m3n8
 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
 B6QSFvEsr1PJ6DvwtRHXm6xC9tuct
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
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,m:natalie.vock@gmx.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmx.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim,gmx.de:email]
X-Rspamd-Queue-Id: E27161D8C0D
X-Rspamd-Action: no action

Coupling resource allocation and cgroup charging is racy when charging
succeeds, but subsequent resource allocation fails. Certain eviction
decisions are made on the basis of whether the allocating cgroup is
protected, i.e. within its min/low limits, but with the charge being
tied to resource allocation (and uncharged when the resource allocation
fails), this check is done at a point where the allocation is not actually
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
 drivers/gpu/drm/ttm/ttm_bo.c       | 45 +++++++++++++++++++++++++--------=
=2D-
 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++++++------=
=2D----
 include/drm/ttm/ttm_resource.h     |  6 ++++-
 3 files changed, 73 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3e62cab51f870..53c4de4bcc1e3 100644
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
@@ -544,9 +546,17 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk,=
 struct ttm_buffer_object *
 		goto out;
=20
 	evict_walk->evicted++;
+	if (!evict_walk->alloc_state->charge_pool) {
+		lret =3D ttm_resource_try_charge(bo, evict_walk->place,
+					       &evict_walk->alloc_state->charge_pool, NULL);
+		if (lret =3D=3D -EAGAIN)
+			return -EBUSY;
+		else if (lret)
+			return lret;
+	}
 	if (evict_walk->res)
 		lret =3D ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
-					  evict_walk->res, NULL);
+					  evict_walk->res, evict_walk->alloc_state->charge_pool);
 	if (lret =3D=3D 0)
 		return 1;
 out:
@@ -724,10 +734,8 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_ob=
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
@@ -737,14 +745,22 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_o=
bject *bo,
 		 * attempt.
 		 */
 		if (ret =3D=3D -EAGAIN)
-			return may_evict ? -EBUSY : -ENOSPC;
+			ret =3D may_evict ? -EBUSY : -ENOSPC;
+		return ret;
+	}
=20
+	ret =3D ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
+	if (ret) {
 		if (ret =3D=3D -ENOSPC && may_evict)
-			return -EBUSY;
-
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
@@ -799,6 +815,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
 				res, &alloc_state);
=20
 		if (ret =3D=3D -ENOSPC) {
+			dmem_cgroup_uncharge(alloc_state.charge_pool, bo->base.size);
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
 			continue;
 		} else if (ret =3D=3D -EBUSY) {
@@ -807,11 +824,15 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
bject *bo,
=20
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
=20
-			if (ret =3D=3D -EBUSY)
-				continue;
-			else if (ret)
-				return;
+			if (ret) {
+				dmem_cgroup_uncharge(alloc_state.charge_pool,
+						bo->base.size);
+				if (ret =3D=3D -EBUSY)
+					continue;
+				return ret;
+			}
 		} else if (ret) {
+			dmem_cgroup_uncharge(alloc_state.charge_pool, bo->base.size);
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

