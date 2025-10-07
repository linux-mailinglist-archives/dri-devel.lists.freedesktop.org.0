Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC9BBFF77
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 03:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531410E31B;
	Tue,  7 Oct 2025 01:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4745610E31B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 01:32:17 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-XLHO8f6kPUyh_331VudUfw-1; Mon,
 06 Oct 2025 21:32:14 -0400
X-MC-Unique: XLHO8f6kPUyh_331VudUfw-1
X-Mimecast-MFC-AGG-ID: XLHO8f6kPUyh_331VudUfw_1759800733
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2243F180045C; Tue,  7 Oct 2025 01:32:13 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.82])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BF97D180047F; Tue,  7 Oct 2025 01:32:10 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Date: Tue,  7 Oct 2025 11:32:07 +1000
Message-ID: <20251007013207.1469618-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bSBSIq73WWCnCqa6wS9x_yjERNHEUoW5VWfJhvIF5Bs_1759800733
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

Ben gave me this idea before he finished up, and I just didn't
think to write it out. This adds a config option that if enabled
will stop the 535 firmware being requested, so that it won't
end up in the initramfs.

This option should only be enabled if you are on a distro with
a new enough linux-firmware with the 570 firmware contained in it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/Kconfig                 | 9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c | 2 ++
 6 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kcon=
fig
index c88776d1e784..fd56458189dd 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -39,6 +39,15 @@ config NOUVEAU_PLATFORM_DRIVER
 =09  Support for Nouveau platform driver, used for SoC GPUs as found
 =09  on NVIDIA Tegra K1.
=20
+config DRM_NOUVEAU_570_ONLY
+=09bool "Only support 570 firmware, don't add 535 to the initrd."
+=09depends on DRM_NOUVEAU
+=09default n
+=09help
+          Nouveau can support 535 and 570 firmwares, but that means both
+          will end up in initramfs, bloating it. If you can guarantee you
+          have the 570 in your distro or install, enable this option.
+
 config NOUVEAU_DEBUG
 =09int "Maximum debug level"
 =09depends on DRM_NOUVEAU
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ad102.c
index 35d1fcef520b..452c1e4f4095 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -53,11 +53,13 @@ ad102_gsp_new(struct nvkm_device *device, enum nvkm_sub=
dev_type type, int inst,
 =09return nvkm_gsp_new_(ad102_gsps, device, type, inst, pgsp);
 }
=20
+#ifndef CONFIG_DRM_NOUVEAU_570_ONLY
 NVKM_GSP_FIRMWARE_BOOTER(ad102, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ad103, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ad104, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ad106, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ad107, 535.113.01);
+#endif
=20
 NVKM_GSP_FIRMWARE_BOOTER(ad102, 570.144);
 NVKM_GSP_FIRMWARE_BOOTER(ad103, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga100.c
index d201e8697226..d8410f3c65da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -71,5 +71,7 @@ ga100_gsp_new(struct nvkm_device *device, enum nvkm_subde=
v_type type, int inst,
 =09return nvkm_gsp_new_(ga100_gsps, device, type, inst, pgsp);
 }
=20
+#ifndef CONFIG_DRM_NOUVEAU_570_ONLY
 NVKM_GSP_FIRMWARE_BOOTER(ga100, 535.113.01);
+#endif
 NVKM_GSP_FIRMWARE_BOOTER(ga100, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga102.c
index 917f7e2f6c46..55e58373ca6d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -187,11 +187,13 @@ ga102_gsp_new(struct nvkm_device *device, enum nvkm_s=
ubdev_type type, int inst,
 =09return nvkm_gsp_new_(ga102_gsps, device, type, inst, pgsp);
 }
=20
+#ifndef CONFIG_DRM_NOUVEAU_570_ONLY
 NVKM_GSP_FIRMWARE_BOOTER(ga102, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ga103, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ga104, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ga106, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ga107, 535.113.01);
+#endif
=20
 NVKM_GSP_FIRMWARE_BOOTER(ga102, 570.144);
 NVKM_GSP_FIRMWARE_BOOTER(ga103, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu102.c
index 81e56da0474a..691453ddf191 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -436,9 +436,11 @@ tu102_gsp_new(struct nvkm_device *device, enum nvkm_su=
bdev_type type, int inst,
 =09return nvkm_gsp_new_(tu102_gsps, device, type, inst, pgsp);
 }
=20
+#ifndef CONFIG_DRM_NOUVEAU_570_ONLY
 NVKM_GSP_FIRMWARE_BOOTER(tu102, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(tu104, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(tu106, 535.113.01);
+#endif
=20
 NVKM_GSP_FIRMWARE_BOOTER(tu102, 570.144);
 NVKM_GSP_FIRMWARE_BOOTER(tu104, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu116.c
index 97eb046c25d0..fd142c17a9d0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -54,8 +54,10 @@ tu116_gsp_new(struct nvkm_device *device, enum nvkm_subd=
ev_type type, int inst,
 =09return nvkm_gsp_new_(tu116_gsps, device, type, inst, pgsp);
 }
=20
+#ifndef CONFIG_DRM_NOUVEAU_570_ONLY
 NVKM_GSP_FIRMWARE_BOOTER(tu116, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(tu117, 535.113.01);
+#endif
=20
 NVKM_GSP_FIRMWARE_BOOTER(tu116, 570.144);
 NVKM_GSP_FIRMWARE_BOOTER(tu117, 570.144);
--=20
2.51.0

