Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBBB42F96
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861510E2B7;
	Thu,  4 Sep 2025 02:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91E810E2B7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:17:02 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-SuttSl3pM1ChxMx_zSz5hg-1; Wed,
 03 Sep 2025 22:16:59 -0400
X-MC-Unique: SuttSl3pM1ChxMx_zSz5hg-1
X-Mimecast-MFC-AGG-ID: SuttSl3pM1ChxMx_zSz5hg_1756952218
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AE1C71800451
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:16:58 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C18A01800452; Thu,  4 Sep 2025 02:16:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
Subject: [PATCH 3/4] nouveau: populate buffers before exporting them.
Date: Thu,  4 Sep 2025 12:16:41 +1000
Message-ID: <20250904021643.2050497-3-airlied@gmail.com>
In-Reply-To: <20250904021643.2050497-1-airlied@gmail.com>
References: <20250904021643.2050497-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -_lVslTzFtWNJzc8EGzq1IKwTQlNBCl_cCLUz-o9cuw_1756952218
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

Before exporting a buffer, make sure it has been populated with
pages at least once.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouv=
eau/nouveau_prime.c
index cd95446d6851..caab60fc62f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -108,9 +108,21 @@ struct dma_buf *nouveau_gem_prime_export(struct drm_ge=
m_object *gobj,
 =09=09=09=09=09 int flags)
 {
 =09struct nouveau_bo *nvbo =3D nouveau_gem_object(gobj);
+=09struct ttm_operation_ctx ctx =3D {
+=09=09.interruptible =3D true,
+=09=09.no_wait_gpu =3D true,
+=09=09/* We opt to avoid OOM on system pages allocations */
+=09=09.gfp_retry_mayfail =3D true,
+=09=09.allow_res_evict =3D false,
+=09};
+=09int ret;
=20
 =09if (nvbo->no_share)
 =09=09return ERR_PTR(-EPERM);
=20
+=09ret =3D ttm_bo_setup_export(&nvbo->bo, &ctx);
+=09if (ret)
+=09=09return ERR_PTR(ret);
+
 =09return drm_gem_prime_export(gobj, flags);
 }
--=20
2.50.1

