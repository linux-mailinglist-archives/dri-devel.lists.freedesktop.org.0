Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5FC46A4F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432A610E38A;
	Mon, 10 Nov 2025 12:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="Oj6YhE+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB8010E388
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762778352; x=1763383152; i=natalie.vock@gmx.de;
 bh=JKlo9HKxHlYxG2f9lbxHJShF/Go9FQec3Gnid/13xwc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Oj6YhE+ZTVnRgvCIb8H+7VfRHMOrVsBlr2tYepmj9oSs0Q2jXb6F+zPg+B2lxbZp
 PAJGe1OvSA38IRwK2HhXPQOH/5QmiBUGt4VeIodw1G5Pf35/oYGLm/Q7pyqBYDLps
 /0hR6oaVy7hYYE5HEpc4r+EQE0bN+4QM0vdxXqjav3amhBb2es2T9RwrYa9+NNbqF
 /W6kFecAYrSN7hIPodgBMOTEuerfoyyBGEQKR0aUQPrC4ELWA46UFdjQohq2Eaob/
 ANdu3kShJFicMDgmFpzcpRFd1bNG/hMClFmg+e+MK1BMeWazLF551dDn3I/mgXVOe
 fTCOnWKWn2UTKIaXEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.42.49.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYqv-1wBUpg3p0N-014pri; Mon, 10
 Nov 2025 13:39:12 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 10 Nov 2025 13:37:34 +0100
Subject: [PATCH v3 5/5] drm/ttm: Use common ancestor of evictor and evictee
 as limit pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251110-dmemcg-aggressive-protect-v3-5-219ffcfc54e9@gmx.de>
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
X-Provags-ID: V03:K1:Teth9jLrGLsrQycmCiMQkQtegAUJYkN0q7GARFCcoxb3egVe93D
 slljaM2zikVQFsVm81dAS9SOF1V0pwguNNb/1WFnyzrG3ccmvbNDLUV2VfgRLTIjCu9xUgi
 1oqIwEqeBAxwb0AUMD9apUNwjtOWL9fbuCvZl3KB57Q23IO9mfzW6iHflv5eQpORckXrYow
 PXZmkl+Rvscvsg+u13OTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Nrfx7SS/2Ms=;5oX/JFNMZFL/9+ybs7t/Sm1b/Ed
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
 drivers/gpu/drm/ttm/ttm_bo.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd467c965e1bc..50ed4bffd3437 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -524,13 +524,42 @@ struct ttm_bo_evict_walk {
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
+	/*
+	 * If there is no explicit limit pool, find the root of the shared subtr=
ee between
+	 * evictor and evictee. This is important so that recursive protection r=
ules can
+	 * apply properly: Recursive protection distributes cgroup protection af=
forded
+	 * to a parent cgroup but not used explicitly by a child cgroup between =
all child
+	 * cgroups (see docs of effective_protection in mm/page_counter.c). Howe=
ver, when
+	 * direct siblings compete for memory, siblings that were explicitly pro=
tected
+	 * should get prioritized over siblings that weren't. This only happens =
correctly
+	 * when the root of the shared subtree is passed to
+	 * dmem_cgroup_state_evict_valuable. Otherwise, the effective-protection
+	 * calculation cannot distinguish direct siblings from unrelated subtree=
s and the
+	 * calculated protection ends up wrong.
+	 */
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
2.51.2

