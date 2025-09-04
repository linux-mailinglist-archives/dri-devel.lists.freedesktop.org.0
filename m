Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC3B42F95
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4225B10E29D;
	Thu,  4 Sep 2025 02:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9877610E29D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:16:58 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-j3beHJb6N3Oxrp_5k0b2DQ-1; Wed,
 03 Sep 2025 22:16:56 -0400
X-MC-Unique: j3beHJb6N3Oxrp_5k0b2DQ-1
X-Mimecast-MFC-AGG-ID: j3beHJb6N3Oxrp_5k0b2DQ_1756952215
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4260118004D8; Thu,  4 Sep 2025 02:16:55 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.135])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E3E6F1800452; Thu,  4 Sep 2025 02:16:52 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH 2/4] amdgpu: populate buffers before exporting them.
Date: Thu,  4 Sep 2025 12:16:40 +1000
Message-ID: <20250904021643.2050497-2-airlied@gmail.com>
In-Reply-To: <20250904021643.2050497-1-airlied@gmail.com>
References: <20250904021643.2050497-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: luUJLMl6FbpyewoCGfaiJzmWNxo88qIpmJTROj-W0fU_1756952215
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

Reviewed-by: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_dma_buf.c
index ce27cb5bb05e..8561ad7f6180 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -343,11 +343,23 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_ge=
m_object *gobj,
 {
 =09struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
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
 =09if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
 =09    bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
 =09=09return ERR_PTR(-EPERM);
=20
+=09ret =3D ttm_bo_setup_export(&bo->tbo, &ctx);
+=09if (ret)
+=09=09return ERR_PTR(ret);
+
 =09buf =3D drm_gem_prime_export(gobj, flags);
 =09if (!IS_ERR(buf))
 =09=09buf->ops =3D &amdgpu_dmabuf_ops;
--=20
2.50.1

