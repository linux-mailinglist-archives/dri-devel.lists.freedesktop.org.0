Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8444EAC04E8
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D465796541;
	Thu, 22 May 2025 06:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B86012BD57
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:44 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-215-vf-P_vhMPyia1LyQ7mZCtA-1; Thu,
 22 May 2025 02:55:41 -0400
X-MC-Unique: vf-P_vhMPyia1LyQ7mZCtA-1
X-Mimecast-MFC-AGG-ID: vf-P_vhMPyia1LyQ7mZCtA_1747896940
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4A794180036F; Thu, 22 May 2025 06:55:40 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 74C331958014; Thu, 22 May 2025 06:55:38 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] drm/ttm: avoid accessing iosys_map internals.
Date: Thu, 22 May 2025 16:52:15 +1000
Message-ID: <20250522065519.318013-7-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GWu4Pd6L87xxKHYZOOQYu3OiGO3U6UCKYA468Zk3ihA_1747896940
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

This uses the new accessors to use iosys_map.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c  | 12 ++++++------
 drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++----
 drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo=
_util.c
index 15cab9bda17f..ba7075fa9876 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -99,10 +99,10 @@ void ttm_move_memcpy(bool clear,
 =09if (clear) {
 =09=09for (i =3D 0; i < num_pages; ++i) {
 =09=09=09dst_ops->map_local(dst_iter, &dst_map, i);
-=09=09=09if (dst_map.is_iomem)
-=09=09=09=09memset_io(dst_map.vaddr_iomem, 0, PAGE_SIZE);
+=09=09=09if (iosys_map_is_iomem(&dst_map))
+=09=09=09=09memset_io(iosys_map_ioptr(&dst_map), 0, PAGE_SIZE);
 =09=09=09else
-=09=09=09=09memset(dst_map.vaddr, 0, PAGE_SIZE);
+=09=09=09=09memset(iosys_map_ptr(&dst_map), 0, PAGE_SIZE);
 =09=09=09if (dst_ops->unmap_local)
 =09=09=09=09dst_ops->unmap_local(dst_iter, &dst_map);
 =09=09}
@@ -544,10 +544,10 @@ void ttm_bo_vunmap(struct ttm_buffer_object *bo, stru=
ct iosys_map *map)
 =09if (iosys_map_is_null(map))
 =09=09return;
=20
-=09if (!map->is_iomem)
-=09=09vunmap(map->vaddr);
+=09if (!iosys_map_is_iomem(map))
+=09=09vunmap(iosys_map_ptr(map));
 =09else if (!mem->bus.addr)
-=09=09iounmap(map->vaddr_iomem);
+=09=09iounmap(iosys_map_ioptr(map));
 =09iosys_map_clear(map);
=20
 =09ttm_mem_io_free(bo->bdev, bo->resource);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_r=
esource.c
index 769b0ca9be47..0e7b4c6c16f8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -742,7 +742,7 @@ static void ttm_kmap_iter_iomap_map_local(struct ttm_km=
ap_iter *iter,
 static void ttm_kmap_iter_iomap_unmap_local(struct ttm_kmap_iter *iter,
 =09=09=09=09=09    struct iosys_map *map)
 {
-=09io_mapping_unmap_local(map->vaddr_iomem);
+=09io_mapping_unmap_local(iosys_map_ioptr(map));
 }
=20
 static const struct ttm_kmap_iter_ops ttm_kmap_iter_io_ops =3D {
@@ -886,10 +886,10 @@ ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_lin=
ear_io *iter_io,
 =09=09=09     struct ttm_resource *mem)
 {
 =09if (iter_io->needs_unmap && iosys_map_is_set(&iter_io->dmap)) {
-=09=09if (iter_io->dmap.is_iomem)
-=09=09=09iounmap(iter_io->dmap.vaddr_iomem);
+=09=09if (iosys_map_is_iomem(&iter_io->dmap))
+=09=09=09iounmap(iosys_map_ioptr(&iter_io->dmap));
 =09=09else
-=09=09=09memunmap(iter_io->dmap.vaddr);
+=09=09=09memunmap(iosys_map_ptr(&iter_io->dmap));
 =09}
=20
 =09ttm_mem_io_free(bdev, mem);
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index df0aa6c4b8b8..ff9856e41b43 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -495,7 +495,7 @@ static void ttm_kmap_iter_tt_map_local(struct ttm_kmap_=
iter *iter,
 static void ttm_kmap_iter_tt_unmap_local(struct ttm_kmap_iter *iter,
 =09=09=09=09=09 struct iosys_map *map)
 {
-=09kunmap_local(map->vaddr);
+=09kunmap_local(iosys_map_ptr(map));
 }
=20
 static const struct ttm_kmap_iter_ops ttm_kmap_iter_tt_ops =3D {
--=20
2.49.0

