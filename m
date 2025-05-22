Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3CAC04ED
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA03C97FF7;
	Thu, 22 May 2025 06:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2899A9AF61
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:38 +0000 (UTC)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-1b8ExwgZNOuiftxNRofnIA-1; Thu,
 22 May 2025 02:55:36 -0400
X-MC-Unique: 1b8ExwgZNOuiftxNRofnIA-1
X-Mimecast-MFC-AGG-ID: 1b8ExwgZNOuiftxNRofnIA_1747896935
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 36BE81954235; Thu, 22 May 2025 06:55:35 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 61C201958014; Thu, 22 May 2025 06:55:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/9] drm/xe: avoid accessing internals of iosys_map
Date: Thu, 22 May 2025 16:52:13 +1000
Message-ID: <20250522065519.318013-5-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D980weFO_VoVOXxQiEuME_WKUIcUjlJ02wNVS_DtY8U_1747896935
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

This uses the new accessors to avoid touch iosys_map internals.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                  |  8 ++++----
 drivers/gpu/drm/xe/xe_eu_stall.c            |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  2 +-
 drivers/gpu/drm/xe/xe_map.h                 | 12 ++++++------
 drivers/gpu/drm/xe/xe_memirq.c              | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_oa.c                  |  4 ++--
 drivers/gpu/drm/xe/xe_pt.c                  |  4 ++--
 drivers/gpu/drm/xe/xe_sa.c                  |  8 ++++----
 9 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/=
xe/display/intel_fbdev_fb.c
index e8191562d122..ad2681c90efb 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -101,7 +101,7 @@ int intel_fbdev_fb_fill_info(struct intel_display *disp=
lay, struct fb_info *info
 =09}
 =09XE_WARN_ON(iosys_map_is_null(&obj->vmap));
=20
-=09info->screen_base =3D obj->vmap.vaddr_iomem;
+=09info->screen_base =3D iosys_map_ioptr(&obj->vmap);
 =09info->screen_size =3D obj->ttm.base.size;
=20
 =09return 0;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..c83a54708495 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1249,7 +1249,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 =09=09=09unmap =3D true;
 =09=09}
=20
-=09=09xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
+=09=09xe_map_memcpy_from(xe, iosys_map_ptr(&backup->vmap), &bo->vmap, 0,
 =09=09=09=09   bo->size);
 =09}
=20
@@ -1342,7 +1342,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 =09=09=09unmap =3D true;
 =09=09}
=20
-=09=09xe_map_memcpy_to(xe, &bo->vmap, 0, backup->vmap.vaddr,
+=09=09xe_map_memcpy_to(xe, &bo->vmap, 0, iosys_map_ptr(&backup->vmap),
 =09=09=09=09 bo->size);
 =09}
=20
@@ -2226,9 +2226,9 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe=
, struct xe_tile *tile, str
 =09=09=09=09      XE_BO_FLAG_PINNED_NORESTORE);
=20
 =09xe_assert(xe, IS_DGFX(xe));
-=09xe_assert(xe, !(*src)->vmap.is_iomem);
+=09xe_assert(xe, !iosys_map_is_iomem(&(*src)->vmap));
=20
-=09bo =3D xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr,
+=09bo =3D xe_managed_bo_create_from_data(xe, tile, iosys_map_ptr(&(*src)->=
vmap),
 =09=09=09=09=09    (*src)->size, dst_flags);
 =09if (IS_ERR(bo))
 =09=09return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_st=
all.c
index 96732613b4b7..d8f900efac95 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -741,7 +741,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_d=
ata_stream *stream,
 =09for_each_dss_steering(xecore, gt, group, instance) {
 =09=09xecore_buf =3D &stream->xecore_buf[xecore];
 =09=09vaddr_offset =3D xecore * stream->per_xecore_buf_size;
-=09=09xecore_buf->vaddr =3D stream->bo->vmap.vaddr + vaddr_offset;
+=09=09xecore_buf->vaddr =3D iosys_map_ptr(&stream->bo->vmap) + vaddr_offse=
t;
 =09}
 =09return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.=
c
index 18c623992035..c7ad56774c99 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1068,7 +1068,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 =09=09goto out;
 =09}
=20
-=09memset(pc->bo->vmap.vaddr, 0, size);
+=09memset(iosys_map_ptr(&pc->bo->vmap), 0, size);
 =09slpc_shared_data_write(pc, header.size, size);
=20
 =09earlier =3D ktime_get();
diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index f62e0c8b67ab..37842c02c7f9 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -49,10 +49,10 @@ static inline u32 xe_map_read32(struct xe_device *xe, s=
truct iosys_map *map)
 {
 =09xe_device_assert_mem_access(xe);
=20
-=09if (map->is_iomem)
-=09=09return readl(map->vaddr_iomem);
+=09if (iosys_map_is_iomem(map))
+=09=09return readl(iosys_map_ioptr(map));
 =09else
-=09=09return READ_ONCE(*(u32 *)map->vaddr);
+=09=09return READ_ONCE(*(u32 *)iosys_map_ptr(map));
 }
=20
 static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *=
map,
@@ -60,10 +60,10 @@ static inline void xe_map_write32(struct xe_device *xe,=
 struct iosys_map *map,
 {
 =09xe_device_assert_mem_access(xe);
=20
-=09if (map->is_iomem)
-=09=09writel(val, map->vaddr_iomem);
+=09if (iosys_map_is_iomem(map))
+=09=09writel(val, iosys_map_ioptr(map));
 =09else
-=09=09*(u32 *)map->vaddr =3D val;
+=09=09*(u32 *)iosys_map_ptr(map) =3D val;
 }
=20
 #define xe_map_rd(xe__, map__, offset__, type__) ({=09=09=09\
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.=
c
index 49c45ec3e83c..458955c75e04 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -198,9 +198,9 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 =09memirq->status =3D IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OF=
FSET(0));
 =09memirq->mask =3D IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFS=
ET);
=20
-=09memirq_assert(memirq, !memirq->source.is_iomem);
-=09memirq_assert(memirq, !memirq->status.is_iomem);
-=09memirq_assert(memirq, !memirq->mask.is_iomem);
+=09memirq_assert(memirq, !iosys_map_is_iomem(&memirq->source));
+=09memirq_assert(memirq, !iosys_map_is_iomem(&memirq->status));
+=09memirq_assert(memirq, !iosys_map_is_iomem(&memirq->mask));
=20
 =09memirq_debug(memirq, "page offsets: bo %#x bo_size %zu source %#x statu=
s %#x\n",
 =09=09     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
@@ -418,7 +418,7 @@ static bool memirq_received(struct xe_memirq *memirq, s=
truct iosys_map *vector,
 static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_=
map *status,
 =09=09=09=09   struct xe_hw_engine *hwe)
 {
-=09memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
+=09memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, iosys_map_ptr(s=
tatus));
=20
 =09if (memirq_received(memirq, status, ilog2(GT_RENDER_USER_INTERRUPT), hw=
e->name))
 =09=09xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
@@ -429,7 +429,7 @@ static void memirq_dispatch_guc(struct xe_memirq *memir=
q, struct iosys_map *stat
 {
 =09const char *name =3D guc_name(guc);
=20
-=09memirq_debug(memirq, "STATUS %s %*ph\n", name, 16, status->vaddr);
+=09memirq_debug(memirq, "STATUS %s %*ph\n", name, 16, iosys_map_ptr(status=
));
=20
 =09if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
 =09=09xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
@@ -479,9 +479,9 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 =09if (!memirq->bo)
 =09=09return;
=20
-=09memirq_assert(memirq, !memirq->source.is_iomem);
-=09memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
-=09memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
+=09memirq_assert(memirq, !iosys_map_is_iomem(&memirq->source));
+=09memirq_debug(memirq, "SOURCE %*ph\n", 32, iosys_map_ptr(&memirq->source=
));
+=09memirq_debug(memirq, "SOURCE %*ph\n", 32, iosys_map_ptr(&memirq->source=
) + 32);
=20
 =09for_each_gt(gt, xe, gtid) {
 =09=09if (gt->tile !=3D tile)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fb842fa0552e..99424d790d84 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -880,8 +880,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *s=
tream, size_t size)
=20
 =09stream->oa_buffer.bo =3D bo;
 =09/* mmap implementation requires OA buffer to be in system memory */
-=09xe_assert(stream->oa->xe, bo->vmap.is_iomem =3D=3D 0);
-=09stream->oa_buffer.vaddr =3D bo->vmap.vaddr;
+=09xe_assert(stream->oa->xe, iosys_map_is_iomem(&bo->vmap) =3D=3D 0);
+=09stream->oa_buffer.vaddr =3D iosys_map_ptr(&bo->vmap);
 =09return 0;
 }
=20
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b42cf5d1b20c..af0992aea6b4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1723,12 +1723,12 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate=
_pt_update *pt_update,
 =09u64 empty =3D __xe_pt_empty_pte(tile, vm, update->pt->level);
 =09int i;
=20
-=09if (map && map->is_iomem)
+=09if (map && iosys_map_is_iomem(map))
 =09=09for (i =3D 0; i < num_qwords; ++i)
 =09=09=09xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
 =09=09=09=09  sizeof(u64), u64, empty);
 =09else if (map)
-=09=09memset64(map->vaddr + qword_ofs * sizeof(u64), empty,
+=09=09memset64(iosys_map_ptr(map) + qword_ofs * sizeof(u64), empty,
 =09=09=09 num_qwords);
 =09else
 =09=09memset64(ptr, empty, num_qwords);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 1d43e183ca21..4ac335c68242 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -68,15 +68,15 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe=
_tile *tile, u32 size, u3
 =09=09return ERR_CAST(bo);
 =09}
 =09sa_manager->bo =3D bo;
-=09sa_manager->is_iomem =3D bo->vmap.is_iomem;
+=09sa_manager->is_iomem =3D iosys_map_is_iomem(&bo->vmap);
 =09sa_manager->gpu_addr =3D xe_bo_ggtt_addr(bo);
=20
-=09if (bo->vmap.is_iomem) {
+=09if (iosys_map_is_iomem(&bo->vmap)) {
 =09=09sa_manager->cpu_ptr =3D kvzalloc(managed_size, GFP_KERNEL);
 =09=09if (!sa_manager->cpu_ptr)
 =09=09=09return ERR_PTR(-ENOMEM);
 =09} else {
-=09=09sa_manager->cpu_ptr =3D bo->vmap.vaddr;
+=09=09sa_manager->cpu_ptr =3D iosys_map_ptr(&bo->vmap);
 =09=09memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
 =09}
=20
@@ -116,7 +116,7 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 =09struct xe_sa_manager *sa_manager =3D to_xe_sa_manager(sa_bo->manager);
 =09struct xe_device *xe =3D tile_to_xe(sa_manager->bo->tile);
=20
-=09if (!sa_manager->bo->vmap.is_iomem)
+=09if (!iosys_map_is_iomem(&sa_manager->bo->vmap))
 =09=09return;
=20
 =09xe_map_memcpy_to(xe, &sa_manager->bo->vmap, drm_suballoc_soffset(sa_bo)=
,
--=20
2.49.0

