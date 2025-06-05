Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFBEACEA0C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 08:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B262710E794;
	Thu,  5 Jun 2025 06:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6F510E266
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 06:20:13 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-Sjc8qb7uNCmlH7miCxYZnw-1; Thu,
 05 Jun 2025 02:20:11 -0400
X-MC-Unique: Sjc8qb7uNCmlH7miCxYZnw-1
X-Mimecast-MFC-AGG-ID: Sjc8qb7uNCmlH7miCxYZnw_1749104410
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3C64F1801BC6; Thu,  5 Jun 2025 06:20:10 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.101])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 50FAB19560AE; Thu,  5 Jun 2025 06:20:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH 3/5] ttm/pool: drop numa specific pools
Date: Thu,  5 Jun 2025 16:19:23 +1000
Message-ID: <20250605061951.1234583-4-airlied@gmail.com>
In-Reply-To: <20250605061951.1234583-1-airlied@gmail.com>
References: <20250605061951.1234583-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2iKWTN4DVsPM-1lIeemFc-15JEi2FSiu5Auz3FvmE-Q_1749104410
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

The list_lru will now handle numa for us, so need to keep
separate pool types for it. Just consoldiate into the global ones.

This adds a debugfs change to avoid dumping non-existant orders due
to this change.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 785b141d18df..ad06f2f8fd2d 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -388,17 +388,11 @@ static struct ttm_pool_type *ttm_pool_select_type(str=
uct ttm_pool *pool,
 #ifdef CONFIG_X86
 =09switch (caching) {
 =09case ttm_write_combined:
-=09=09if (pool->nid !=3D NUMA_NO_NODE)
-=09=09=09return &pool->caching[caching].orders[order];
-
 =09=09if (pool->use_dma32)
 =09=09=09return &global_dma32_write_combined[order];
=20
 =09=09return &global_write_combined[order];
 =09case ttm_uncached:
-=09=09if (pool->nid !=3D NUMA_NO_NODE)
-=09=09=09return &pool->caching[caching].orders[order];
-
 =09=09if (pool->use_dma32)
 =09=09=09return &global_dma32_uncached[order];
=20
@@ -1291,6 +1285,8 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct se=
q_file *m)
 =09for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 =09=09if (!ttm_pool_select_type(pool, i, 0))
 =09=09=09continue;
+=09=09if (pool->caching[i].orders[0].pool !=3D pool)
+=09=09=09continue;
 =09=09if (pool->use_dma_alloc)
 =09=09=09seq_puts(m, "DMA ");
 =09=09else
--=20
2.49.0

