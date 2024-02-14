Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42F8541ED
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 05:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96C710E17C;
	Wed, 14 Feb 2024 04:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276110E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 04:06:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-VbkaK8xqPDGGbmF6XwaRbA-1; Tue, 13 Feb 2024 23:06:35 -0500
X-MC-Unique: VbkaK8xqPDGGbmF6XwaRbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 212648353E1;
 Wed, 14 Feb 2024 04:06:35 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BAEB1BDD1;
 Wed, 14 Feb 2024 04:06:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: add kconfig option to enable GSP paths by default
Date: Wed, 14 Feb 2024 14:06:32 +1000
Message-ID: <20240214040632.661069-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

Turing and Ampere will continue to use the old paths by default,
but we should allow distros to decide what the policy is.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/Kconfig                | 8 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kcon=
fig
index 1e6aaf95ff7c..ceef470c9fbf 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -100,3 +100,11 @@ config DRM_NOUVEAU_SVM
 =09help
 =09  Say Y here if you want to enable experimental support for
 =09  Shared Virtual Memory (SVM).
+
+config DRM_NOUVEAU_GSP_DEFAULT
+=09bool "Use GSP firmware for Turing/Ampere (needs firmware installed)"
+=09depends on DRM_NOUVEAU
+=09default n
+=09help
+=09  Say Y here if you want to use the GSP codepaths by default on
+=09  Turing and Ampere GPUs.
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index a41735ab6068..a64c81385682 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2312,8 +2312,12 @@ r535_gsp_load(struct nvkm_gsp *gsp, int ver, const s=
truct nvkm_gsp_fwif *fwif)
 {
 =09struct nvkm_subdev *subdev =3D &gsp->subdev;
 =09int ret;
+=09bool enable_gsp =3D fwif->enable;
=20
-=09if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", fwif->enable))
+#if IS_ENABLED(CONFIG_DRM_NOUVEAU_GSP_DEFAULT)
+=09enable_gsp =3D true;
+#endif
+=09if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", enable_gsp))
 =09=09return -EINVAL;
=20
 =09if ((ret =3D r535_gsp_load_fw(gsp, "gsp", fwif->ver, &gsp->fws.rm)) ||
--=20
2.43.0

