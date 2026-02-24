Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HyZM74InWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:11:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A1A180EC9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2B810E47B;
	Tue, 24 Feb 2026 02:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7375210E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:11:07 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-422-vrMaxZtWOamwfNix5OMg8A-1; Mon,
 23 Feb 2026 21:11:04 -0500
X-MC-Unique: vrMaxZtWOamwfNix5OMg8A-1
X-Mimecast-MFC-AGG-ID: vrMaxZtWOamwfNix5OMg8A_1771899063
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED9421956095; Tue, 24 Feb 2026 02:11:02 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9F43C30001BB; Tue, 24 Feb 2026 02:10:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 16/16] xe: create a flag to enable memcg accounting for XE as
 well.
Date: Tue, 24 Feb 2026 12:06:33 +1000
Message-ID: <20260224020854.791201-17-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DhIO_ptJxCyKv-jIWmTrE5JwxNsz8Fd41hOoDl7aYkM_1771899063
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lankhorst.se:email]
X-Rspamd-Queue-Id: 48A1A180EC9
X-Rspamd-Action: no action

From: Maarten Lankhorst <dev@lankhorst.se>

This adds support for memcg accounting to ttm object used by xe driver.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 10 +++++++---
 drivers/gpu/drm/xe/xe_bo.h  |  1 +
 drivers/gpu/drm/xe/xe_lrc.c |  3 ++-
 drivers/gpu/drm/xe/xe_oa.c  |  3 ++-
 drivers/gpu/drm/xe/xe_pt.c  |  3 ++-
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fae2d738ecd2..44ad97b7e0c1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -56,6 +56,7 @@ static const struct ttm_place sys_placement_flags =3D {
 =09.flags =3D 0,
 };
=20
+/* TTM_PL_FLAG_MEMCG is not set, those placements are used for eviction */
 static struct ttm_placement sys_placement =3D {
 =09.num_placement =3D 1,
 =09.placement =3D &sys_placement_flags,
@@ -194,8 +195,8 @@ static void try_add_system(struct xe_device *xe, struct=
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
@@ -2216,6 +2217,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe,=
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
@@ -3193,7 +3197,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void =
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
index c914ab719f20..2c2a93d018fe 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -52,6 +52,7 @@
 #define XE_BO_FLAG_CPU_ADDR_MIRROR=09BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM=09BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION=09BIT(26)
+#define XE_BO_FLAG_ACCOUNTED=09=09BIT(27)
=20
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST=09BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b0f037bc227f..e4f2d6db18b3 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1466,7 +1466,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_=
hw_engine *hwe,
 =09=09   XE_BO_FLAG_GGTT_INVALIDATE;
=20
 =09if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspac=
e */
-=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER=
_VRAM;
+=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER=
_VRAM |
+=09=09=09    XE_BO_FLAG_ACCOUNTED;
=20
 =09lrc->bo =3D xe_bo_create_pin_map_novm(xe, tile,
 =09=09=09=09=09    bo_size,
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4dd3f29933cf..2606395aafdd 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -887,7 +887,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *s=
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
index 13b355fadd58..c1157dd56923 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -122,7 +122,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_=
tile *tile,
 =09=09   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 =09=09   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 =09if (vm->xef) /* userspace */
-=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER=
_VRAM;
+=09=09bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER=
_VRAM |
+=09=09=09    XE_BO_FLAG_ACCOUNTED;
=20
 =09pt->level =3D level;
=20
--=20
2.52.0

