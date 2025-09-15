Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B3B57B39
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC5510E480;
	Mon, 15 Sep 2025 12:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="CM85Vv0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF7210E480
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1757939824; x=1758544624; i=natalie.vock@gmx.de;
 bh=epRqrzMYIJ42Su2yf0gERWDvkTskROJAh193mo+5m8Y=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CM85Vv0o7mjRy8ce9uQHYB0qOuFm+T7JgYW80Q6dIQ7QgCbdViCXfmQsYCEtjBnR
 tNHhyFTBAg7hnbYyywD4k6/LUIP70+0YcX+b26CzO8j0gKPmhyjrupAg9ovIrSudj
 p3zJ5psIy4heC1pQtLVHsymqiF3R4jvapRE2nRkUimeWuYIdDbhSc5gfgFT4hVSuF
 0YHSV+iKFbFexgyVgP0wv8rKwq8kaFIp4SLQ2eUw3HNN0R6lCGcX+kL/gU1tTU9fJ
 9UlM3sUYwmahq9ErjbV+w+b0vKeUSgPaFyoGxqogHjQW7kj09Z+vtV6hzcPtRuOjS
 EGEacR6npagBtkPLsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe9s-1umg6g169O-00VeQY; Mon, 15
 Sep 2025 14:37:04 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 15 Sep 2025 14:36:31 +0200
Subject: [PATCH 4/4] drm/ttm: Use common ancestor of evictor and evictee as
 limit pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20250915-dmemcg-aggressive-protect-v1-4-2f3353bfcdac@gmx.de>
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
In-Reply-To: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
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
X-Provags-ID: V03:K1:Zo5PT55vqafFwu/DR8lNS72JlaCru8dzSwUYN3aCE//CnRX1B7w
 NrB8f/Dl/7ZZWEeMiVfeFbWU/K5gqf0qo/6ZPkv3v7lOYqJpql6eA/ZAV2d6De1DMC7Sxlf
 mZeFs0kP7soJg9pqXHhf3R8sloQO8TQN6xh+tKMYLuB139R1EHSSLjnt5uxbdEF/+ZLSgqr
 fEbQ7jRKqpHNI8E/oyS4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pAWAVKKc5eg=;iQmlAw4XJ3t9xVTdvR6/Kmi8bZm
 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
 X5tSNu9Vw+l7rnNkcNE70+mjRZOhpU2w==
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
 drivers/gpu/drm/ttm/ttm_bo.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d20ff41411c08cd97b4467f603751f483d1c7ff4..47dd5600c1a7d59dcccfec0d99=
8b87c2d470df40 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -512,15 +512,34 @@ struct ttm_bo_evict_walk {
 	bool try_low;
 	/** @hit_low: If we cannot evict a bo when @try_low is false (first pass=
) */
 	bool hit_low;
+	/** @only_evict_unprotected: If eviction should be restricted to unprote=
cted BOs */
+	bool only_evict_unprotected;
 };
=20
 static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_o=
bject *bo)
 {
+	struct dmem_cgroup_pool_state *limit_pool;
 	struct ttm_bo_evict_walk *evict_walk =3D
 		container_of(walk, typeof(*evict_walk), walk);
 	s64 lret;
=20
-	if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo->resour=
ce->css,
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
+	if (evict_walk->only_evict_unprotected &&
+			bo->resource->css =3D=3D evict_walk->charge_pool)
+		return 0;
+
+	limit_pool =3D evict_walk->limit_pool;
+	if (!limit_pool)
+		limit_pool =3D dmem_cgroup_common_ancestor(bo->resource->css,
+							 evict_walk->charge_pool);
+
+	if (!dmem_cgroup_state_evict_valuable(limit_pool, bo->resource->css,
 					      evict_walk->try_low, &evict_walk->hit_low))
 		return 0;
=20
@@ -580,6 +599,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 		.res =3D res,
 		.charge_pool =3D charge_pool,
 		.limit_pool =3D limit_pool,
+		.only_evict_unprotected =3D only_evict_unprotected,
 	};
 	s64 lret;
=20

=2D-=20
2.51.0

