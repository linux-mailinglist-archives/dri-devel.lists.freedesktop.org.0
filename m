Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1D8541D6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 04:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73AA10E0B8;
	Wed, 14 Feb 2024 03:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com (unknown [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4810E18C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 03:40:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-uMrnBmYwPqGPjBRTjOjRaA-1; Tue,
 13 Feb 2024 22:40:40 -0500
X-MC-Unique: uMrnBmYwPqGPjBRTjOjRaA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36E451C05147;
 Wed, 14 Feb 2024 03:40:40 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30E23492BC6;
 Wed, 14 Feb 2024 03:40:38 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: add kconfig option to enable GSP paths by default
Date: Wed, 14 Feb 2024 13:40:36 +1000
Message-ID: <20240214034036.660921-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 3 +++
 2 files changed, 11 insertions(+)

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
index a41735ab6068..fadbb89ffff2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2313,6 +2313,9 @@ r535_gsp_load(struct nvkm_gsp *gsp, int ver, const st=
ruct nvkm_gsp_fwif *fwif)
 =09struct nvkm_subdev *subdev =3D &gsp->subdev;
 =09int ret;
=20
+#if IS_ENABLED(CONFIG_DRM_NOUVEAU_GSP_DEFAULT)
+=09fwif->enable =3D true;
+#endif
 =09if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", fwif->enable))
 =09=09return -EINVAL;
=20
--=20
2.43.0

