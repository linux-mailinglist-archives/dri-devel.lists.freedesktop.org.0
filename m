Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNL6KqSEpWkCDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C31D8BC9
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8156410E4C5;
	Mon,  2 Mar 2026 12:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="kaY+Kisa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524010E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772455058; x=1773059858; i=natalie.vock@gmx.de;
 bh=aUYokgifpChaBPO/PEB/XUhiw+8++ZGbVVrqk9w4EAk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kaY+Kisa99tyL7xUrV299APlcL1hZoWTMqgJSNQbFoN7Nm+76c96fVoMDdUHqeYv
 U3PzDL28TAOYAOwkelHkOC0PSS6d1pCwDIe5wTIXzVU7tRTRQ9LmZgDipxyiijzNy
 V+6AvUrs9wPuoErbhi+NdkQl9KelIX2p7kiW0owCiWcSMG1KGZb9SSKdQl4pzCv2G
 HvKGRIlbc11cfSEtHTCJk97x6gno4FKWXTFa6VFbg35FKkxI73i0HvN3Erv+zG2wv
 xSlHlTn/4dkCWxzVQFArxY4dlxgiUuobUJiBTwJzemkC4ux1x6FcaRBhbT9IiUc+S
 tuY+Ce+toA1HYRLLww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1vYocU0Opk-00sCsk; Mon, 02
 Mar 2026 13:37:38 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 02 Mar 2026 13:37:07 +0100
Subject: [PATCH v5 5/6] drm/ttm: Be more aggressive when allocating below
 protection limit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260302-dmemcg-aggressive-protect-v5-5-ffd3a2602309@gmx.de>
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
X-Provags-ID: V03:K1:BrTq5P+hv7paXnIwrWbmqIT5NSYbu/F/WLVIhbCHdYY5YAzsUoK
 vls/mmPbizL0jweae7KzZuDwOEgBBUuMZ1si4zgi/w7QRh+PRJkmCUwuIKMbEsNl4XcrcBo
 TnEdnze3yZCfs5S2Sf6a3rXT2BGOG6X0/TZ0J06oBjvOXKe17XrCJYU/dSCZJik9rdggJnH
 yOMx5Gre9GmNOLJnv73Pg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TXwmVa7nXbI=;ZL4L0hg5vFSNPgvFni0l5x/ypXT
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
X-Rspamd-Queue-Id: 508C31D8BC9
X-Rspamd-Action: no action

When the cgroup's memory usage is below the low/min limit and allocation
fails, try evicting some unprotected buffers to make space. Otherwise,
application buffers may be forced to go into GTT even though usage is
below the corresponding low/min limit, if other applications filled VRAM
with their allocations first.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c | 52 +++++++++++++++++++++++++++++++++++++++=
=2D----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 53c4de4bcc1e3..86f99237f6490 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -494,6 +494,10 @@ struct ttm_bo_alloc_state {
 	struct dmem_cgroup_pool_state *charge_pool;
 	/** @limit_pool: Which pool limit we should test against */
 	struct dmem_cgroup_pool_state *limit_pool;
+	/** @only_evict_unprotected: If only unprotected BOs, i.e. BOs whose cgr=
oup
+	 *  is exceeding its dmem low/min protection, should be considered for e=
viction
+	 */
+	bool only_evict_unprotected;
 };
=20
 /**
@@ -598,8 +602,12 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev=
,
 	evict_walk.walk.arg.trylock_only =3D true;
 	lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
=20
-	/* One more attempt if we hit low limit? */
-	if (!lret && evict_walk.hit_low) {
+	/* If we failed to find enough BOs to evict, but we skipped over
+	 * some BOs because they were covered by dmem low protection, retry
+	 * evicting these protected BOs too, except if we're told not to
+	 * consider protected BOs at all.
+	 */
+	if (!lret && evict_walk.hit_low && !state->only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
 	}
@@ -620,7 +628,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	} while (!lret && evict_walk.evicted);
=20
 	/* We hit the low limit? Try once more */
-	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
+	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
+			!state->only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		goto retry;
 	}
@@ -730,7 +739,7 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_obj=
ect *bo,
 				 struct ttm_resource **res,
 				 struct ttm_bo_alloc_state *alloc_state)
 {
-	bool may_evict;
+	bool may_evict, below_low;
 	int ret;
=20
 	may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
@@ -749,9 +758,42 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_ob=
ject *bo,
 		return ret;
 	}
=20
+	/*
+	 * cgroup protection plays a special role in eviction.
+	 * Conceptually, protection of memory via the dmem cgroup controller
+	 * entitles the protected cgroup to use a certain amount of memory.
+	 * There are two types of protection - the 'low' limit is a
+	 * "best-effort" protection, whereas the 'min' limit provides a hard
+	 * guarantee that memory within the cgroup's allowance will not be
+	 * evicted under any circumstance.
+	 *
+	 * To faithfully model this concept in TTM, we also need to take cgroup
+	 * protection into account when allocating. When allocation in one
+	 * place fails, TTM will default to trying other places first before
+	 * evicting.
+	 * If the allocation is covered by dmem cgroup protection, however,
+	 * this prevents the allocation from using the memory it is "entitled"
+	 * to. To make sure unprotected allocations cannot push new protected
+	 * allocations out of places they are "entitled" to use, we should
+	 * evict buffers not covered by any cgroup protection, if this
+	 * allocation is covered by cgroup protection.
+	 *
+	 * Buffers covered by 'min' protection are a special case - the 'min'
+	 * limit is a stronger guarantee than 'low', and thus buffers protected
+	 * by 'low' but not 'min' should also be considered for eviction.
+	 * Buffers protected by 'min' will never be considered for eviction
+	 * anyway, so the regular eviction path should be triggered here.
+	 * Buffers protected by 'low' but not 'min' will take a special
+	 * eviction path that only evicts buffers covered by neither 'low' or
+	 * 'min' protections.
+	 */
+	may_evict |=3D dmem_cgroup_below_min(NULL, alloc_state->charge_pool);
+	below_low =3D dmem_cgroup_below_low(NULL, alloc_state->charge_pool);
+	alloc_state->only_evict_unprotected =3D !may_evict && below_low;
+
 	ret =3D ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
 	if (ret) {
-		if (ret =3D=3D -ENOSPC && may_evict)
+		if (ret =3D=3D -ENOSPC && (may_evict || below_low))
 			ret =3D -EBUSY;
 		return ret;
 	}

=2D-=20
2.53.0

