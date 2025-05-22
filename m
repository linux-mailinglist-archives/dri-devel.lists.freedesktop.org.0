Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FDDAC04E3
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AA29AF67;
	Thu, 22 May 2025 06:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316869AF8A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:43 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-8R7oO_3SPE29q725q_KPHw-1; Thu,
 22 May 2025 02:55:38 -0400
X-MC-Unique: 8R7oO_3SPE29q725q_KPHw-1
X-Mimecast-MFC-AGG-ID: 8R7oO_3SPE29q725q_KPHw_1747896937
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BED061800447; Thu, 22 May 2025 06:55:37 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2DB81958014; Thu, 22 May 2025 06:55:35 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/9] drm/qxl: avoid accessing iosys_map internals.
Date: Thu, 22 May 2025 16:52:14 +1000
Message-ID: <20250522065519.318013-6-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7pq_v7c40uz_7R4NzyjIifQajiUlUjde62XdpFl2_Uw_1747896937
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

This uses the new accessors to avoid touching the iosys_map internals.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 14 +++++++-------
 drivers/gpu/drm/qxl/qxl_draw.c    |  4 ++--
 drivers/gpu/drm/qxl/qxl_object.c  |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_di=
splay.c
index 70aff64ced87..e833b0bbff47 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -602,16 +602,16 @@ static struct qxl_bo *qxl_create_cursor(struct qxl_de=
vice *qdev,
 =09cursor.chunk.next_chunk =3D 0;
 =09cursor.chunk.prev_chunk =3D 0;
 =09cursor.chunk.data_size =3D size;
-=09if (cursor_map.is_iomem) {
-=09=09memcpy_toio(cursor_map.vaddr_iomem,
+=09if (iosys_map_is_iomem(&cursor_map)) {
+=09=09memcpy_toio(iosys_map_ioptr(&cursor_map),
 =09=09=09    &cursor, sizeof(cursor));
-=09=09memcpy_toio(cursor_map.vaddr_iomem + sizeof(cursor),
-=09=09=09    user_map.vaddr, size);
+=09=09memcpy_toio(iosys_map_ioptr(&cursor_map) + sizeof(cursor),
+=09=09=09    iosys_map_ptr(&user_map), size);
 =09} else {
-=09=09memcpy(cursor_map.vaddr,
+=09=09memcpy(iosys_map_ptr(&cursor_map),
 =09=09       &cursor, sizeof(cursor));
-=09=09memcpy(cursor_map.vaddr + sizeof(cursor),
-=09=09       user_map.vaddr, size);
+=09=09memcpy(iosys_map_ptr(&cursor_map) + sizeof(cursor),
+=09=09       iosys_map_ptr(&user_map), size);
 =09}
=20
 =09qxl_bo_vunmap_and_unpin(user_bo);
diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.=
c
index 3a3e127ce297..6000936bc8d0 100644
--- a/drivers/gpu/drm/qxl/qxl_draw.c
+++ b/drivers/gpu/drm/qxl/qxl_draw.c
@@ -52,7 +52,7 @@ static struct qxl_rect *drawable_set_clipping(struct qxl_=
device *qdev,
 =09ret =3D qxl_bo_vmap_locked(clips_bo, &map);
 =09if (ret)
 =09=09return NULL;
-=09dev_clips =3D map.vaddr; /* TODO: Use mapping abstraction properly */
+=09dev_clips =3D iosys_map_ptr(&map); /* TODO: Use mapping abstraction pro=
perly */
=20
 =09dev_clips->num_rects =3D num_clips;
 =09dev_clips->chunk.next_chunk =3D 0;
@@ -206,7 +206,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 =09ret =3D qxl_bo_vmap_locked(bo, &surface_map);
 =09if (ret)
 =09=09goto out_release_backoff;
-=09surface_base =3D surface_map.vaddr; /* TODO: Use mapping abstraction pr=
operly */
+=09surface_base =3D iosys_map_ptr(&surface_map); /* TODO: Use mapping abst=
raction properly */
=20
 =09ret =3D qxl_image_init(qdev, release, dimage, surface_base,
 =09=09=09     left - dumb_shadow_offset,
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_obj=
ect.c
index 66635c55cf85..dcc1f6393885 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -172,10 +172,10 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosy=
s_map *map)
 =09bo->map_count =3D 1;
=20
 =09/* TODO: Remove kptr in favor of map everywhere. */
-=09if (bo->map.is_iomem)
-=09=09bo->kptr =3D (void *)bo->map.vaddr_iomem;
+=09if (iosys_map_is_iomem(&bo->map))
+=09=09bo->kptr =3D (void *)iosys_map_ioptr(&bo->map);
 =09else
-=09=09bo->kptr =3D bo->map.vaddr;
+=09=09bo->kptr =3D iosys_map_ptr(&bo->map);
=20
 out:
 =09*map =3D bo->map;
@@ -230,7 +230,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 =09ret =3D qxl_bo_vmap_locked(bo, &bo_map);
 =09if (ret)
 =09=09return NULL;
-=09rptr =3D bo_map.vaddr; /* TODO: Use mapping abstraction properly */
+=09rptr =3D iosys_map_ptr(&bo_map); /* TODO: Use mapping abstraction prope=
rly */
=20
 =09rptr +=3D page_offset * PAGE_SIZE;
 =09return rptr;
--=20
2.49.0

