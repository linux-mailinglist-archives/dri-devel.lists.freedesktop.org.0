Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51BA97CD8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B8D10E3E8;
	Wed, 23 Apr 2025 02:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Wed, 23 Apr 2025 02:36:02 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32D10E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 02:36:02 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-_3dPWgHpPRa4mZXnRLb--A-1; Tue,
 22 Apr 2025 22:29:26 -0400
X-MC-Unique: _3dPWgHpPRa4mZXnRLb--A-1
X-Mimecast-MFC-AGG-ID: _3dPWgHpPRa4mZXnRLb--A_1745375365
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 747521956094; Wed, 23 Apr 2025 02:29:25 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.98])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9A081180047F; Wed, 23 Apr 2025 02:29:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	christian.koenig@amd.com
Subject: [PATCH] drm/ttm/xe: drop unused force_alloc flag
Date: Wed, 23 Apr 2025 12:29:20 +1000
Message-ID: <20250423022920.27701-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DSM6VbtG8N8_2SfsXXZL5PqxLYRfH---5yedq343h2A_1745375365
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

This flag used to be used in the old memory tracking code, that
code got migrated into the vmwgfx driver[1], and then got removed
from the tree[2], but this piece got left behind.

[1] f07069da6b4c ("drm/ttm: move memory accounting into vmwgfx v4")
[2] 8aadeb8ad874 ("drm/vmwgfx: Remove the dedicated memory accounting")

Cleanup the dead code.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c    | 1 -
 drivers/gpu/drm/ttm/ttm_resource.c | 1 -
 drivers/gpu/drm/xe/xe_bo.c         | 4 +---
 drivers/gpu/drm/xe/xe_bo.h         | 2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c    | 2 +-
 include/drm/ttm/ttm_bo.h           | 2 --
 6 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_v=
m.c
index a194db83421d..bdfa6ecfef05 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -220,7 +220,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vm=
f,
 =09=09struct ttm_operation_ctx ctx =3D {
 =09=09=09.interruptible =3D true,
 =09=09=09.no_wait_gpu =3D false,
-=09=09=09.force_alloc =3D true
 =09=09};
=20
 =09=09ttm =3D bo->ttm;
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_r=
esource.c
index 7e5a60c55813..769b0ca9be47 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -548,7 +548,6 @@ int ttm_resource_manager_evict_all(struct ttm_device *b=
dev,
 =09struct ttm_operation_ctx ctx =3D {
 =09=09.interruptible =3D false,
 =09=09.no_wait_gpu =3D false,
-=09=09.force_alloc =3D true
 =09};
 =09struct dma_fence *fence;
 =09int ret;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 64f9c936eea0..32a5a6390f62 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2759,19 +2759,17 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 /**
  * xe_bo_evict - Evict an object to evict placement
  * @bo: The buffer object to migrate.
- * @force_alloc: Set force_alloc in ttm_operation_ctx
  *
  * On successful completion, the object memory will be moved to evict
  * placement. This function blocks until the object has been fully moved.
  *
  * Return: 0 on success. Negative error code on failure.
  */
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
+int xe_bo_evict(struct xe_bo *bo)
 {
 =09struct ttm_operation_ctx ctx =3D {
 =09=09.interruptible =3D false,
 =09=09.no_wait_gpu =3D false,
-=09=09.force_alloc =3D force_alloc,
 =09=09.gfp_retry_mayfail =3D true,
 =09};
 =09struct ttm_placement placement;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index ec3e4446d027..1a3734d9f8be 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -271,7 +271,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *re=
s);
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
=20
 int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
+int xe_bo_evict(struct xe_bo *bo);
=20
 int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_bu=
f.c
index f67803e15a0e..f06961575d8a 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -236,7 +236,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attac=
hment *attach)
 =09struct drm_gem_object *obj =3D attach->importer_priv;
 =09struct xe_bo *bo =3D gem_to_xe_bo(obj);
=20
-=09XE_WARN_ON(xe_bo_evict(bo, false));
+=09XE_WARN_ON(xe_bo_evict(bo));
 }
=20
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops =3D {
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 903cd1030110..cf027558b6db 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -172,7 +172,6 @@ struct ttm_bo_kmap_obj {
  * @gfp_retry_mayfail: Set the __GFP_RETRY_MAYFAIL when allocation pages.
  * @allow_res_evict: Allow eviction of reserved BOs. Can be used when mult=
iple
  * BOs share the same reservation object.
- * @force_alloc: Don't check the memory account during suspend or CPU page
  * faults. Should only be used by TTM internally.
  * @resv: Reservation object to allow reserved evictions with.
  * @bytes_moved: Statistics on how many bytes have been moved.
@@ -185,7 +184,6 @@ struct ttm_operation_ctx {
 =09bool no_wait_gpu;
 =09bool gfp_retry_mayfail;
 =09bool allow_res_evict;
-=09bool force_alloc;
 =09struct dma_resv *resv;
 =09uint64_t bytes_moved;
 };
--=20
2.48.1

