Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A287B3D861
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 06:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F419F10E06F;
	Mon,  1 Sep 2025 04:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8110E06F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 04:56:34 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-XyeW6x27NvWwoZqB-BW6Kg-1; Mon,
 01 Sep 2025 00:56:28 -0400
X-MC-Unique: XyeW6x27NvWwoZqB-BW6Kg-1
X-Mimecast-MFC-AGG-ID: XyeW6x27NvWwoZqB-BW6Kg_1756702587
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E279D18004D4; Mon,  1 Sep 2025 04:56:26 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 60757180044F; Mon,  1 Sep 2025 04:56:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH] amdgpu/ttm: make sure exported objects are populated
Date: Mon,  1 Sep 2025 14:56:18 +1000
Message-ID: <20250901045618.1853752-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VMI0LsXvduolrW8GH5b0lkMg-gzoyk3Hk_IKEHiB3YI_1756702587
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

While discussing cgroups we noticed a problem where you could export
a BO to a dma-buf without having it ever being backed or accounted for.

This meant in low memory situations or eventually with cgroups, a
lower privledged process might cause the compositor to try and allocate
a lot of memory on it's behalf and this could fail. At least make
sure the exporter has managed to allocate the RAM at least once
before exporting the object.

This only applies currently to TTM_PL_SYSTEM objects, because
GTT objects get populated on first validate, and VRAM doesn't
use TT.

TODO:
other drivers?
split this into two?

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  5 ++++
 drivers/gpu/drm/ttm/ttm_bo.c                | 28 +++++++++++++++++++++
 include/drm/ttm/ttm_bo.h                    |  1 +
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_dma_buf.c
index ce27cb5bb05e..d0f578d0ae6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -343,11 +343,16 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_ge=
m_object *gobj,
 {
 =09struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
 =09struct dma_buf *buf;
+=09int ret;
=20
 =09if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
 =09    bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
 =09=09return ERR_PTR(-EPERM);
=20
+=09ret =3D ttm_bo_setup_export(&bo->tbo);
+=09if (ret)
+=09=09return ERR_PTR(ret);
+
 =09buf =3D drm_gem_prime_export(gobj, flags);
 =09if (!IS_ERR(buf))
 =09=09buf->ops =3D &amdgpu_dmabuf_ops;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 273757974b9f..bf98e28a8bda 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1284,3 +1284,31 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
 =09return 0;
 }
 EXPORT_SYMBOL(ttm_bo_populate);
+
+int ttm_bo_setup_export(struct ttm_buffer_object *bo)
+{
+=09struct ttm_operation_ctx ctx =3D {
+=09=09.interruptible =3D false,
+=09=09.no_wait_gpu =3D true,
+=09=09/* We opt to avoid OOM on system pages allocations */
+=09=09.gfp_retry_mayfail =3D true,
+=09=09.allow_res_evict =3D false,
+=09};
+
+=09int ret;
+
+=09if (!bo->ttm)
+=09=09return 0;
+
+=09if (bo->ttm && ttm_tt_is_populated(bo->ttm))
+=09=09return 0;
+
+=09ret =3D ttm_bo_reserve(bo, false, false, NULL);
+=09if (ret !=3D 0)
+=09=09return ret;
+
+=09ret =3D ttm_bo_populate(bo, bo->resource->placement & TTM_PL_FLAG_MEMCG=
, &ctx);
+=09ttm_bo_unreserve(bo);
+=09return ret;
+}
+EXPORT_SYMBOL(ttm_bo_setup_export);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index c33b3667ae76..5cdd89da9ef5 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -473,6 +473,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
 =09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx);
+int ttm_bo_setup_export(struct ttm_buffer_object *bo);
=20
 /* Driver LRU walk helpers initially targeted for shrinking. */
=20
--=20
2.50.1

