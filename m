Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD93BE1498
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F2810E91F;
	Thu, 16 Oct 2025 02:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062BD10E920
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:33:38 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-myyh8p_XM4Sfp_MMbCxomw-1; Wed,
 15 Oct 2025 22:33:32 -0400
X-MC-Unique: myyh8p_XM4Sfp_MMbCxomw-1
X-Mimecast-MFC-AGG-ID: myyh8p_XM4Sfp_MMbCxomw_1760582011
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3BB141956048; Thu, 16 Oct 2025 02:33:31 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.64])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8959B1800579; Thu, 16 Oct 2025 02:33:24 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 10/16] ttm: add objcg pointer to bo and tt (v2)
Date: Thu, 16 Oct 2025 12:31:38 +1000
Message-ID: <20251016023205.2303108-11-airlied@gmail.com>
In-Reply-To: <20251016023205.2303108-1-airlied@gmail.com>
References: <20251016023205.2303108-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7xeG-uJaxAHx4A4r0EGhPAesDM3iMTLmISf7NZDk-hU_1760582011
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
index 5d84af5e0d74..073a1840ed9d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -45,6 +45,7 @@
 #include <linux/atomic.h>
 #include <linux/cgroup_dmem.h>
 #include <linux/dma-resv.h>
+#include <linux/memcontrol.h>
=20
 #include "ttm_module.h"
 #include "ttm_bo_internal.h"
@@ -314,6 +315,7 @@ static void ttm_bo_release(struct kref *kref)
 =09=09dma_resv_unlock(bo->base.resv);
 =09}
=20
+=09obj_cgroup_put(bo->objcg);
 =09atomic_dec(&ttm_glob.bo_count);
 =09bo->destroy(bo);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 8f38de3b2f1c..0c54d5e2bfdd 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -162,6 +162,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 =09ttm->caching =3D caching;
 =09ttm->restore =3D NULL;
 =09ttm->backup =3D NULL;
+=09ttm->objcg =3D bo->objcg;
 }
=20
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 60676f2c1077..154805627065 100644
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
2.51.0

