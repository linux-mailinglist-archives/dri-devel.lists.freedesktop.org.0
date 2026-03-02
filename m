Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE0pIaiEpWkCDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:38:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390AD1D8BEF
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0757310E4C4;
	Mon,  2 Mar 2026 12:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="QuT7KO98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8C110E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772455059; x=1773059859; i=natalie.vock@gmx.de;
 bh=7syQO1SWpI/aFoH7QGUdhqKQYRN5D9E2zCGKsw5a/Y0=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QuT7KO98e8wAaaKrggUV0A8lTGy6MWtQ9TGlAYBMQ8Ajr9W6FgMCNvjmLFwWYVOe
 LLZUC8DZPhNREPzVF9n6ZsAGiE+778n8//Hm0rUe+ws4qLsk/RP5ZGP38GzxikT34
 d1bqHJwRGzzOsUTR65oKo0z95aO1JsPwKIWJhJQkexGBqxtxhnpgXBkIXHrwwsIMx
 L892ffCEe2Ny8+371wKwiq61GDOe9uFB/pAoBv3HeiuAJ+628ZhNACDgPxoeNBSh/
 wnkApKWRuMND+AdKlQgdCcktPAlRAD5TFJPjs2E2n2u6dBAo1vfF3+iLSFUoK/FV2
 4Pi44vW5bHM+33crlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1vpNZH16s8-000WIg; Mon, 02
 Mar 2026 13:37:39 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 02 Mar 2026 13:37:08 +0100
Subject: [PATCH v5 6/6] drm/ttm: Use common ancestor of evictor and evictee
 as limit pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260302-dmemcg-aggressive-protect-v5-6-ffd3a2602309@gmx.de>
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
X-Provags-ID: V03:K1:InDs2d32a9VfGYkuypjyYYttNT80AULKFd+mX2B81jhw/0nnt59
 00lfuMo0M2/e0aDUTKiXCjq+x+vkFP5CzYhQ73vE+DJJTmJtd3gOkcWRAcmJJrVurMss4kL
 ssk5wSu+UqynYVEUEeTxKg0LXAPk6ZfamVeA40bdOWySwrLpaqy4b1xNrbq19/KyiY7YSdt
 vdtDzcFAAKGlvSBdEJ/2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oM+VQ7A14DI=;/8Sh8jekz02+mMK/K+VrONFZymt
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
X-Rspamd-Queue-Id: 390AD1D8BEF
X-Rspamd-Action: no action

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
 drivers/gpu/drm/ttm/ttm_bo.c | 43 +++++++++++++++++++++++++++++++++++++++=
+---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 86f99237f6490..53b53a2791725 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -528,11 +528,48 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk=
, struct ttm_buffer_object *
 {
 	struct ttm_bo_evict_walk *evict_walk =3D
 		container_of(walk, typeof(*evict_walk), walk);
+	struct dmem_cgroup_pool_state *limit_pool, *ancestor =3D NULL;
+	bool evict_valuable;
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
+	if (!limit_pool) {
+		ancestor =3D dmem_cgroup_common_ancestor(bo->resource->css,
+						       evict_walk->alloc_state->charge_pool);
+		limit_pool =3D ancestor;
+	}
+
+	evict_valuable =3D dmem_cgroup_state_evict_valuable(limit_pool, bo->reso=
urce->css,
+							  evict_walk->try_low,
+							  &evict_walk->hit_low);
+	if (ancestor)
+		dmem_cgroup_pool_state_put(ancestor);
+
+	if (!evict_valuable)
 		return 0;
=20
 	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk-=
>place))

=2D-=20
2.53.0

