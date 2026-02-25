Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULw5D+7mnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF57197114
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B671510E751;
	Wed, 25 Feb 2026 12:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="CFFQjS+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5183410E74E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772021462; x=1772626262; i=natalie.vock@gmx.de;
 bh=GdD2TPmei07PYZ4nSrdugsl0wHU70n0KXlrs+lnc9J8=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CFFQjS+TpGW27l7sbAdgDuhqrMoqBsB6koQVZ9vsGhxQoYCR98Nye4m8Xht0D2po
 Drdq6SZFZHmxZ2IfpRrw1guRpu0t8HMCohAcwUbdKoxp6QWjO5eN0p5VWMkglWiMn
 yVweM36J0hYk1mENCQ6ITfqC9prwWjy9PVOpHR3iO0B305O3GrgW7q7obRd36rs7I
 WZG/th61VGc2+V7DOgBhRxwA9JjBceI8Ud3CeK0VR1O4cV7xO6OL84HXtWfYS50s0
 yuRm3mv7FQdiWpWBjHwmXpU1QXf1uE2Tm7t1b8ZdByFzQFoQZLvz5wvGwjKRA67fs
 FyTO+9rBnvVkXgDDbA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUUm-1vMyJW2FIq-00ba3C; Wed, 25
 Feb 2026 13:11:02 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 25 Feb 2026 13:10:50 +0100
Subject: [PATCH v4 6/6] drm/ttm: Use common ancestor of evictor and evictee
 as limit pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260225-dmemcg-aggressive-protect-v4-6-de847ab35184@gmx.de>
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
X-Provags-ID: V03:K1:NyKgsjqAJHx5JYuze/5yIIoLKYehoV/2tkOPORuPOjm+EEcLAOa
 azE7iKdp7cHbLtpg7yFpPeB6guOTITGlyYUgYkHtG/ikx5QiMd4Sj2e8N31+EjcMukHpkts
 29XRKzMtguj5G3JRaypGqOUa/25kvb8JNG37C9BJpLzW7jCVh6REtewI6HipNaHJmvCNr7I
 YM3wthmfrTImVlUln7QvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UfVKB9Ravzs=;SFByoyTPl/4YDsfumIMulgq/HTz
 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
 mWarEicBNcbNtSJYzRufFP+ATy76lNFQEWIcZX
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
X-Rspamd-Queue-Id: DBF57197114
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
 drivers/gpu/drm/ttm/ttm_bo.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 401a6846b470f..12c3241704895 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -526,13 +526,42 @@ struct ttm_bo_evict_walk {
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
2.53.0

