Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB6BE14BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485EB10E923;
	Thu, 16 Oct 2025 02:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35910E923
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:34:32 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-19lBeL2PMhecQc2Cov7WaQ-1; Wed,
 15 Oct 2025 22:33:25 -0400
X-MC-Unique: 19lBeL2PMhecQc2Cov7WaQ-1
X-Mimecast-MFC-AGG-ID: 19lBeL2PMhecQc2Cov7WaQ_1760582004
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C1E2918009C2; Thu, 16 Oct 2025 02:33:23 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.64])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 691361800446; Thu, 16 Oct 2025 02:33:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 09/16] ttm/pool: initialise the shrinker earlier
Date: Thu, 16 Oct 2025 12:31:37 +1000
Message-ID: <20251016023205.2303108-10-airlied@gmail.com>
In-Reply-To: <20251016023205.2303108-1-airlied@gmail.com>
References: <20251016023205.2303108-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rer5qq3yTy3y0kps1j9N7d-0dBodhrThFn7SEg6aasA_1760582004
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Later memcg enablement needs the shrinker initialised before the list lru,
Just move it for now.

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index b068b9715354..c990d4084208 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1381,6 +1381,17 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 =09spin_lock_init(&shrinker_lock);
 =09INIT_LIST_HEAD(&shrinker_list);
=20
+=09mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
+=09if (!mm_shrinker)
+=09=09return -ENOMEM;
+
+=09mm_shrinker->count_objects =3D ttm_pool_shrinker_count;
+=09mm_shrinker->scan_objects =3D ttm_pool_shrinker_scan;
+=09mm_shrinker->batch =3D TTM_SHRINKER_BATCH;
+=09mm_shrinker->seeks =3D 1;
+
+=09shrinker_register(mm_shrinker);
+
 =09for (i =3D 0; i < NR_PAGE_ORDERS; ++i) {
 =09=09ttm_pool_type_init(&global_write_combined[i], NULL,
 =09=09=09=09   ttm_write_combined, i);
@@ -1403,17 +1414,6 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 #endif
 #endif
=20
-=09mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
-=09if (!mm_shrinker)
-=09=09return -ENOMEM;
-
-=09mm_shrinker->count_objects =3D ttm_pool_shrinker_count;
-=09mm_shrinker->scan_objects =3D ttm_pool_shrinker_scan;
-=09mm_shrinker->batch =3D TTM_SHRINKER_BATCH;
-=09mm_shrinker->seeks =3D 1;
-
-=09shrinker_register(mm_shrinker);
-
 =09return 0;
 }
=20
--=20
2.51.0

