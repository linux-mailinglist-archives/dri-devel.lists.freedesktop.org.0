Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27866ACBC65
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 22:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF61310E58C;
	Mon,  2 Jun 2025 20:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CF410E58C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 20:40:27 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-nLzsl8NfO3Gx7wd6pCiu5A-1; Mon,
 02 Jun 2025 16:40:20 -0400
X-MC-Unique: nLzsl8NfO3Gx7wd6pCiu5A-1
X-Mimecast-MFC-AGG-ID: nLzsl8NfO3Gx7wd6pCiu5A_1748896818
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9E594180035E; Mon,  2 Jun 2025 20:40:18 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.101])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DB76918001D8; Mon,  2 Jun 2025 20:40:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] ttm/pool: allow debugfs dumps for numa pools.
Date: Tue,  3 Jun 2025 06:40:10 +1000
Message-ID: <20250602204013.1104258-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OgAgO0aQHJOwxFzTIw4ipzIrSFNsrw-uyzZWllXdmS4_1748896818
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

Currently you can't see per-device numa aware pools properly.

Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index ccc3b9a13e9e..43b69d061dff 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1253,7 +1253,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct se=
q_file *m)
 {
 =09unsigned int i;
=20
-=09if (!pool->use_dma_alloc) {
+=09if (!pool->use_dma_alloc && pool->nid =3D=3D NUMA_NO_NODE) {
 =09=09seq_puts(m, "unused\n");
 =09=09return 0;
 =09}
@@ -1262,7 +1262,12 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct s=
eq_file *m)
=20
 =09spin_lock(&shrinker_lock);
 =09for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
-=09=09seq_puts(m, "DMA ");
+=09=09if (!ttm_pool_select_type(pool, i, 0))
+=09=09=09continue;
+=09=09if (pool->use_dma_alloc)
+=09=09=09seq_puts(m, "DMA ");
+=09=09else
+=09=09=09seq_printf(m, "N%d ", pool->nid);
 =09=09switch (i) {
 =09=09case ttm_cached:
 =09=09=09seq_puts(m, "\t:");
--=20
2.43.5

