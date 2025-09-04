Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E99DB42F97
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415F910E224;
	Thu,  4 Sep 2025 02:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADDD10E224
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:17:07 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-FYxMlBf6OqCsPpFrTN-VbA-1; Wed,
 03 Sep 2025 22:17:03 -0400
X-MC-Unique: FYxMlBf6OqCsPpFrTN-VbA-1
X-Mimecast-MFC-AGG-ID: FYxMlBf6OqCsPpFrTN-VbA_1756952222
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D40441956096; Thu,  4 Sep 2025 02:17:02 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4F3281800452; Thu,  4 Sep 2025 02:16:59 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/4] xe: populate buffers before exporting them.
Date: Thu,  4 Sep 2025 12:16:42 +1000
Message-ID: <20250904021643.2050497-4-airlied@gmail.com>
In-Reply-To: <20250904021643.2050497-1-airlied@gmail.com>
References: <20250904021643.2050497-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6ohdYYxrvUh4A17NZj69EZAzGLNmlIQ5wQk-FANSdKY_1756952222
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

Before exporting a buffer, make sure it has been populated with
pages at least once.

Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_bu=
f.c
index 346f857f3837..71b70e17bddd 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -191,10 +191,22 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_ob=
ject *obj, int flags)
 {
 =09struct xe_bo *bo =3D gem_to_xe_bo(obj);
 =09struct dma_buf *buf;
+=09struct ttm_operation_ctx ctx =3D {
+=09=09.interruptible =3D true,
+=09=09.no_wait_gpu =3D true,
+=09=09/* We opt to avoid OOM on system pages allocations */
+=09=09.gfp_retry_mayfail =3D true,
+=09=09.allow_res_evict =3D false,
+=09};
+=09int ret;
=20
 =09if (bo->vm)
 =09=09return ERR_PTR(-EPERM);
=20
+=09ret =3D ttm_bo_setup_export(&bo->ttm, &ctx);
+=09if (ret)
+=09=09return ERR_PTR(ret);
+
 =09buf =3D drm_gem_prime_export(obj, flags);
 =09if (!IS_ERR(buf))
 =09=09buf->ops =3D &xe_dmabuf_ops;
--=20
2.50.1

