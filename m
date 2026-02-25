Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BoYD/zmnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D153D19711C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C36A10E750;
	Wed, 25 Feb 2026 12:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="Z0swi7LP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA2510E750
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772021482; x=1772626282; i=natalie.vock@gmx.de;
 bh=q8d/INciGs3GtpmGMXofrGqKkK5LmgQ1t/UI/+v7EsM=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Z0swi7LPUtbMUk8qjGpPVhft/sedzlfsXROBgVPsefBx8k7Q8lqKuVnCYkhx7vUc
 5L4yIZJxmaiu9fXXmDISLpRssF95dr1XqRmtAaMLTYMNFQkKdwZifPwzyBYA8jD4P
 jfljNUv20VZ7ACSMPgcd0dlmpeVPjTwRQlpBwxoZCUMtM0jvlR5C0VqfcAuZNQ94d
 C/HvwJmcDYVnVJpXvKyVemLtOuCNQLBgXJ2LTqa6nT6+QE1sqcFDBaoUBCIin1esK
 xoljVXDUtrvwGEHvfubiYXTANhaUBEHtWijdYec5PJcnSSYWQ6YMU2pjZtFxZ+x9T
 Jf3qGiR4QTLee2BtYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5GE1-1vlLrE1rCn-00vjMt; Wed, 25
 Feb 2026 13:11:01 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Wed, 25 Feb 2026 13:10:49 +0100
Subject: [PATCH v4 5/6] drm/ttm: Be more aggressive when allocating below
 protection limit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20260225-dmemcg-aggressive-protect-v4-5-de847ab35184@gmx.de>
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
X-Provags-ID: V03:K1:lHOa+lMXM29tMcaWUwOZ6RWmyTVoksV3EGMhrd43NPxAiTI8Mnm
 bYXelh2r6AFNPJSCGz/UjsfnbS8MK5T8MBaqBN/xRzBuyv3DVzlv6//881UKY9AlwsMc3KV
 fcoBcbuR1VgTOwmRJ6L9rOa1aH779Vt16dIpjvT29yyH2enMYNhmamzF9WseNKVqYjaL2y4
 WNOAuyYPMvexTYAGZLDag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p6dD6nOkA2c=;EaDq0wItOu6l5XjOh1nifNo6GW2
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
X-Rspamd-Queue-Id: D153D19711C
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
index a8914d20b0c32..401a6846b470f 100644
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
@@ -590,8 +594,12 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev=
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
@@ -612,7 +620,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	} while (!lret && evict_walk.evicted);
=20
 	/* We hit the low limit? Try once more */
-	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
+	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
+			!state->only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		goto retry;
 	}
@@ -722,7 +731,7 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_obj=
ect *bo,
 				 struct ttm_resource **res,
 				 struct ttm_bo_alloc_state *alloc_state)
 {
-	bool may_evict;
+	bool may_evict, below_low =3D false;
 	int ret;
=20
 	may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
@@ -741,10 +750,43 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_o=
bject *bo,
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
=20
 	if (ret) {
-		if (ret =3D=3D -ENOSPC && may_evict)
+		if (ret =3D=3D -ENOSPC && (may_evict || below_low))
 			ret =3D -EBUSY;
 		return ret;
 	}

=2D-=20
2.53.0

