Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC76B42F94
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2394110E226;
	Thu,  4 Sep 2025 02:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6005310E224
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:16:56 +0000 (UTC)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-peRf7BoQMp-NHaayXs0uXg-1; Wed,
 03 Sep 2025 22:16:51 -0400
X-MC-Unique: peRf7BoQMp-NHaayXs0uXg-1
X-Mimecast-MFC-AGG-ID: peRf7BoQMp-NHaayXs0uXg_1756952210
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 871A319560AD; Thu,  4 Sep 2025 02:16:50 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 394A21800452; Thu,  4 Sep 2025 02:16:46 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH 1/4] ttm/bo: add an API to populate a bo before exporting.
Date: Thu,  4 Sep 2025 12:16:39 +1000
Message-ID: <20250904021643.2050497-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yHtC7jTsqEj7JTAX2qwa95bzQZfZetnePkc9BLurysk_1756952210
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

Reviewed-by: Christian Koenig <christian.koenig@amd.com>
Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 15 +++++++++++++++
 include/drm/ttm/ttm_bo.h     |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 273757974b9f..a815c7478d3f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1284,3 +1284,18 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
 =09return 0;
 }
 EXPORT_SYMBOL(ttm_bo_populate);
+
+int ttm_bo_setup_export(struct ttm_buffer_object *bo,
+=09=09=09struct ttm_operation_ctx *ctx)
+{
+=09int ret;
+
+=09ret =3D ttm_bo_reserve(bo, false, false, NULL);
+=09if (ret !=3D 0)
+=09=09return ret;
+
+=09ret =3D ttm_bo_populate(bo, bo->resource->placement & TTM_PL_FLAG_MEMCG=
, ctx);
+=09ttm_bo_unreserve(bo);
+=09return ret;
+}
+EXPORT_SYMBOL(ttm_bo_setup_export);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index c33b3667ae76..cdc9f5d1b420 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -473,6 +473,8 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
 int ttm_bo_populate(struct ttm_buffer_object *bo,
 =09=09    bool memcg_account,
 =09=09    struct ttm_operation_ctx *ctx);
+int ttm_bo_setup_export(struct ttm_buffer_object *bo,
+=09=09=09struct ttm_operation_ctx *ctx);
=20
 /* Driver LRU walk helpers initially targeted for shrinking. */
=20
--=20
2.50.1

