Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26BCBE14C5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB9910E926;
	Thu, 16 Oct 2025 02:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F6B10E926
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:35:22 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-qoQYfMKvMq60pCV184ftqQ-1; Wed,
 15 Oct 2025 22:34:16 -0400
X-MC-Unique: qoQYfMKvMq60pCV184ftqQ-1
X-Mimecast-MFC-AGG-ID: qoQYfMKvMq60pCV184ftqQ_1760582054
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7686B180065F; Thu, 16 Oct 2025 02:34:14 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.64])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0814F1800353; Thu, 16 Oct 2025 02:34:07 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 16/16] xe: create a flag to enable memcg accounting for XE as
 well.
Date: Thu, 16 Oct 2025 12:31:44 +1000
Message-ID: <20251016023205.2303108-17-airlied@gmail.com>
In-Reply-To: <20251016023205.2303108-1-airlied@gmail.com>
References: <20251016023205.2303108-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BSJsAbF0boSUKD3CxsGe8rBkK4joQ30pX3CtFAl6fzA_1760582054
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

From: Maarten Lankhorst <dev@lankhorst.se>

This adds support for memcg accounting to ttm object used by xe driver.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 16 +++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h  |  1 +
 drivers/gpu/drm/xe/xe_lrc.c |  3 ++-
 drivers/gpu/drm/xe/xe_oa.c  |  3 ++-
 drivers/gpu/drm/xe/xe_pt.c  |  3 ++-
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 95e607842474..8a511077708d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -54,6 +54,7 @@ static const struct ttm_place sys_placement_flags =3D {
 =09.flags =3D 0,
 };
=20
+/* TTM_PL_FLAG_MEMCG is not set, those placements are used for eviction */
 static struct ttm_placement sys_placement =3D {
 =09.num_placement =3D 1,
 =09.placement =3D &sys_placement_flags,
@@ -188,8 +189,8 @@ static void try_add_system(struct xe_device *xe, struct=
 xe_bo *bo,
=20
 =09=09bo->placements[*c] =3D (struct ttm_place) {
 =09=09=09.mem_type =3D XE_PL_TT,
-=09=09=09.flags =3D (bo_flags & XE_BO_FLAG_VRAM_MASK) ?
-=09=09=09TTM_PL_FLAG_FALLBACK : 0,
+=09=09=09.flags =3D TTM_PL_FLAG_MEMCG | ((bo_flags & XE_BO_FLAG_VRAM_MASK)=
 ?
+=09=09=09TTM_PL_FLAG_FALLBACK : 0),
 =09=09};
 =09=09*c +=3D 1;
 =09}
@@ -1695,6 +1696,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_objec=
t *ttm_bo)
=20
 static void xe_gem_object_free(struct drm_gem_object *obj)
 {
+=09struct xe_bo *bo =3D gem_to_xe_bo(obj);
+
 =09/* Our BO reference counting scheme works as follows:
 =09 *
 =09 * The gem object kref is typically used throughout the driver,
@@ -1708,8 +1711,8 @@ static void xe_gem_object_free(struct drm_gem_object =
*obj)
 =09 * driver ttm callbacks is allowed to use the ttm_buffer_object
 =09 * refcount directly if needed.
 =09 */
-=09__xe_bo_vunmap(gem_to_xe_bo(obj));
-=09ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
+=09__xe_bo_vunmap(bo);
+=09ttm_bo_put(&bo->ttm);
 }
=20
 static void xe_gem_object_close(struct drm_gem_object *obj,
@@ -2176,6 +2179,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe,=
 struct xe_bo *bo,
 =09placement =3D (type =3D=3D ttm_bo_type_sg ||
 =09=09     bo->flags & XE_BO_FLAG_DEFER_BACKING) ? &sys_placement :
 =09=09&bo->placement;
+
+=09if (bo->flags & XE_BO_FLAG_ACCOUNTED)
+=09=09ttm_bo_set_cgroup(&bo->ttm, get_obj_cgroup_from_current());
 =09err =3D ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
 =09=09=09=09   placement, alignment,
 =09=09=09=09   &ctx, NULL, resv, xe_ttm_bo_destroy);
@@ -3149,7 +3155,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void =
*data,
 =09if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
 =09=09return -EINVAL;
=20
-=09bo_flags =3D 0;
+=09bo_flags =3D XE_BO_FLAG_ACCOUNTED;
 =09if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
 =09=09bo_flags |=3D XE_BO_FLAG_DEFER_BACKING;
=20
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a77af42b5f9e..fc1e7d0ebf1c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -49,6 +49,7 @@
 #define XE_BO_FLAG_GGTT2=09=09BIT(22)
 #define XE_BO_FLAG_GGTT3=09=09BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR=09BIT(24)
+#define XE_BO_FLAG_ACCOUNTED=09=09BIT(25)
=20
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST=09BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 47e9df775072..db7707256039 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1413,7 +1413,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_=
hw_engine *hwe,
 =09bo_flags =3D XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
 =09=09   XE_BO_FLAG_GGTT_INVALIDATE;
 =09if (vm && vm->xef) /* userspace */
-=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE;
+=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE |
+=09=09=09    XE_BO_FLAG_ACCOUNTED;
=20
 =09lrc->bo =3D xe_bo_create_pin_map_novm(xe, tile,
 =09=09=09=09=09    bo_size,
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a4894eb0d7f3..5b455397e1d8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -885,7 +885,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *s=
tream, size_t size)
=20
 =09bo =3D xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
 =09=09=09=09       size, ttm_bo_type_kernel,
-=09=09=09=09       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, false);
+=09=09=09=09       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT |
+=09=09=09=09       XE_BO_FLAG_ACCOUNTED, false);
 =09if (IS_ERR(bo))
 =09=09return PTR_ERR(bo);
=20
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..3fc11019ffa2 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -122,7 +122,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_=
tile *tile,
 =09=09   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 =09=09   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 =09if (vm->xef) /* userspace */
-=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE;
+=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE |
+=09=09=09    XE_BO_FLAG_ACCOUNTED;
=20
 =09pt->level =3D level;
=20
--=20
2.51.0

