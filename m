Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28197BDEDF8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C6810E7FB;
	Wed, 15 Oct 2025 13:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="FtzFxiYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0FE10E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1760536675; x=1761141475; i=natalie.vock@gmx.de;
 bh=hG1fUmL7OJVNPhaJfVBsNvVIBAQF65hB+fnvTAOcc+s=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FtzFxiYyh6PPlwipZ6Dwrg6V5OVK18Hx5RpkuMb6BtHw14qBcfwIArbIDxDvrBQ/
 l7ggO+DktL66oZDG4zmsflZgBJFq1GSd7KWNAfIv2iSlaMtcHgXAiDp3G5WNPaauR
 HVWSg5F30i3VcHP4Vf4v1P6VbvJFFQ2cvqbJrG/oj+NT33UpENFuFIPTHEZy1rJXr
 iogSBtSAo1LAcrWczIArzWQIiUwEuYjWdolHsP7pvoDR/ahsjwYTmMJuEEbyMgRu6
 bM2/SOMc1AKQmiTZ3go+nCjwt8snN/zU2wbpshDtFSLxHRokdqu91p8VlaJ4D0EAE
 gr8sRPC6Q4/8atO1qA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwfWa-1uJpLF1sCY-00tL4m; Wed, 15
 Oct 2025 15:57:55 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 15 Oct 2025 15:57:32 +0200
Subject: [PATCH v2 5/5] drm/ttm: Use common ancestor of evictor and evictee
 as limit pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251015-dmemcg-aggressive-protect-v2-5-36644fb4e37f@gmx.de>
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
X-Provags-ID: V03:K1:uvKRVvDSBRpvipu3rLSafkwzrkLBC/Lo16GSTti0ZkshSHOSvfv
 UGbG+WTCPdG78JZvgidLyiwGX033BsXp+ASNdfWBNGu7C9/OLMX46GUcqV+woQS5vX8hZnC
 735A22jLAoxhGl19gryss4BAzOWv8QBMzZybcB8zdyeJ5Z1bANFEW6yJCtXF0d7TuvDTZ0z
 ADnUaSwKnX2FgKX/2Ei/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZLl/15xN0q0=;TD5yJGgvWEtfJaj6eLjMjOatca4
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

When checking whether to skip certain buffers because they're protected
by dmem.low, we're checking the effective protection of the evictee's
cgroup, but depending on how the evictor's cgroup relates to the
evictee's, the semantics of effective protection values change.

When testing against cgroups from different subtrees, page_counter's
recursive protection propagates memory protection afforded to a parent
down to the child cgroups, even if the children were not explicitly
protected. This prevents cgroups whose parents were afforded no
protection from stealing memory from cgroups whose parents were afforded
more protection, without users having to explicitly propagate this
protection.

However, if we always calculate protection from the root cgroup, this
breaks prioritization of sibling cgroups: If one cgroup was explicitly
protected and its siblings were not, the protected cgroup should get
higher priority, i.e. the protected cgroup should be able to steal from
unprotected siblings. This only works if we restrict the protection
calculation to the subtree shared by evictor and evictee.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7f7872ab2090cc8db188e08ddfdcd12fe924f743..bc88941c0aadb9a1d6fbaa470c=
cdeae4f91c41fb 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -524,13 +524,29 @@ struct ttm_bo_evict_walk {
=20
 static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_o=
bject *bo)
 {
+	struct dmem_cgroup_pool_state *limit_pool;
 	struct ttm_bo_evict_walk *evict_walk =3D
 		container_of(walk, typeof(*evict_walk), walk);
 	s64 lret;
=20
-	if (!dmem_cgroup_state_evict_valuable(evict_walk->alloc_state->limit_poo=
l,
-					      bo->resource->css, evict_walk->try_low,
-					      &evict_walk->hit_low))
+	/*
+	 * If only_evict_unprotected is set, then we're trying to evict unprotec=
ted
+	 * buffers in favor of a protected allocation for charge_pool. Explicitl=
y skip
+	 * buffers belonging to the same cgroup here - that cgroup is definitely=
 protected,
+	 * even though dmem_cgroup_state_evict_valuable would allow the eviction=
 because a
+	 * cgroup is always allowed to evict from itself even if it is protected=
.
+	 */
+	if (evict_walk->alloc_state->only_evict_unprotected &&
+			bo->resource->css =3D=3D evict_walk->alloc_state->charge_pool)
+		return 0;
+
+	limit_pool =3D evict_walk->alloc_state->limit_pool;
+	if (!limit_pool)
+		limit_pool =3D dmem_cgroup_common_ancestor(bo->resource->css,
+							 evict_walk->alloc_state->charge_pool);
+
+	if (!dmem_cgroup_state_evict_valuable(limit_pool, bo->resource->css,
+					      evict_walk->try_low, &evict_walk->hit_low))
 		return 0;
=20
 	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk-=
>place))

=2D-=20
2.51.0

