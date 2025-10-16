Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B404BE146B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5774810E918;
	Thu, 16 Oct 2025 02:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDE210E918
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:32:54 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-_kRmQUWTNEKOGKWXbItbOQ-1; Wed,
 15 Oct 2025 22:32:48 -0400
X-MC-Unique: _kRmQUWTNEKOGKWXbItbOQ-1
X-Mimecast-MFC-AGG-ID: _kRmQUWTNEKOGKWXbItbOQ_1760581966
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B1BA8195609F; Thu, 16 Oct 2025 02:32:46 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.64])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2F34B180057D; Thu, 16 Oct 2025 02:32:39 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 04/16] ttm/pool: drop numa specific pools
Date: Thu, 16 Oct 2025 12:31:32 +1000
Message-ID: <20251016023205.2303108-5-airlied@gmail.com>
In-Reply-To: <20251016023205.2303108-1-airlied@gmail.com>
References: <20251016023205.2303108-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YVbbmAUayxTJj37uV-4gxSbHsekqNxGItKm3HHqRJsY_1760581966
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
 drivers/gpu/drm/ttm/ttm_pool.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index e236f78c5d9d..02c19395080c 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -396,17 +396,11 @@ static struct ttm_pool_type *ttm_pool_select_type(str=
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
@@ -1281,7 +1275,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct se=
q_file *m)
 {
 =09unsigned int i;
=20
-=09if (!pool->use_dma_alloc && pool->nid =3D=3D NUMA_NO_NODE) {
+=09if (!pool->use_dma_alloc) {
 =09=09seq_puts(m, "unused\n");
 =09=09return 0;
 =09}
@@ -1292,10 +1286,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct s=
eq_file *m)
 =09for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 =09=09if (!ttm_pool_select_type(pool, i, 0))
 =09=09=09continue;
-=09=09if (pool->use_dma_alloc)
-=09=09=09seq_puts(m, "DMA ");
-=09=09else
-=09=09=09seq_printf(m, "N%d ", pool->nid);
+=09=09seq_puts(m, "DMA ");
 =09=09switch (i) {
 =09=09case ttm_cached:
 =09=09=09seq_puts(m, "\t:");
--=20
2.51.0

