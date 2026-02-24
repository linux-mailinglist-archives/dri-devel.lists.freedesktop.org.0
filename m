Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL8aBZYInWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87D180E59
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F1810E46D;
	Tue, 24 Feb 2026 02:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E32B10E46D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:10:26 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-pma2DHanMN-KS2Yn8ng_PA-1; Mon,
 23 Feb 2026 21:10:21 -0500
X-MC-Unique: pma2DHanMN-KS2Yn8ng_PA-1
X-Mimecast-MFC-AGG-ID: pma2DHanMN-KS2Yn8ng_PA_1771899020
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C882918002CE; Tue, 24 Feb 2026 02:10:19 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 96BB930001BB; Tue, 24 Feb 2026 02:10:13 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 10/16] ttm: add objcg pointer to bo and tt (v2)
Date: Tue, 24 Feb 2026 12:06:27 +1000
Message-ID: <20260224020854.791201-11-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hlpJGEpDOgIvDXKvyLt__FVPjGUJ-2kirEQYpctt5x0_1771899020
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8A87D180E59
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

This just adds the obj cgroup pointer to the bo and tt structs,
and sets it between them.

Signed-off-by: Dave Airlie <airlied@redhat.com>

v2: add the put and a setter helper
---
 drivers/gpu/drm/ttm/ttm_bo.c |  2 ++
 drivers/gpu/drm/ttm/ttm_tt.c |  1 +
 include/drm/ttm/ttm_bo.h     | 20 ++++++++++++++++++++
 include/drm/ttm/ttm_tt.h     |  2 ++
 4 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 704af3cfc47a..4234bf7f1110 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -47,6 +47,7 @@
 #include <linux/atomic.h>
 #include <linux/cgroup_dmem.h>
 #include <linux/dma-resv.h>
+#include <linux/memcontrol.h>
=20
 #include "ttm_module.h"
 #include "ttm_bo_internal.h"
@@ -316,6 +317,7 @@ static void ttm_bo_release(struct kref *kref)
 =09=09dma_resv_unlock(bo->base.resv);
 =09}
=20
+=09obj_cgroup_put(bo->objcg);
 =09atomic_dec(&ttm_glob.bo_count);
 =09bo->destroy(bo);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index aa0f17fca770..1f68a7dc41f2 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -164,6 +164,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 =09ttm->caching =3D caching;
 =09ttm->restore =3D NULL;
 =09ttm->backup =3D NULL;
+=09ttm->objcg =3D bo->objcg;
 }
=20
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index ea745edc2882..af9c672486ab 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -135,6 +135,12 @@ struct ttm_buffer_object {
 =09 * reservation lock.
 =09 */
 =09struct sg_table *sg;
+
+=09/**
+=09 * @objcg: object cgroup to charge this to if it ends up using system m=
emory.
+=09 * NULL means don't charge.
+=09 */
+=09struct obj_cgroup *objcg;
 };
=20
 #define TTM_BO_MAP_IOMEM_MASK 0x80
@@ -334,6 +340,20 @@ ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_obj=
ect *bo)
 =09spin_unlock(&bo->bdev->lru_lock);
 }
=20
+/**
+ * ttm_bo_set_cgroup - assign a cgroup to a buffer object.
+ * @bo: The bo to set the cgroup for
+ * @objcg: the cgroup to set.
+ *
+ * This transfers the cgroup reference to the bo. From this
+ * point on the cgroup reference is owned by the ttm bo.
+ */
+static inline void ttm_bo_set_cgroup(struct ttm_buffer_object *bo,
+=09=09=09=09     struct obj_cgroup *objcg)
+{
+=09bo->objcg =3D objcg;
+}
+
 static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
 =09=09=09=09     struct ttm_resource *new_mem)
 {
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 15d4019685f6..c13fea4c2915 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -126,6 +126,8 @@ struct ttm_tt {
 =09enum ttm_caching caching;
 =09/** @restore: Partial restoration from backup state. TTM private */
 =09struct ttm_pool_tt_restore *restore;
+=09/** @objcg: Object cgroup for this TT allocation */
+=09struct obj_cgroup *objcg;
 };
=20
 /**
--=20
2.52.0

