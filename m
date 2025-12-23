Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BACDA391
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD7910E293;
	Tue, 23 Dec 2025 18:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="X1zc5Jl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AA310E293
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766513025; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TEjXMV0etinSW8M8AxxxrGyPGZqXkIJC5ciStPwfiaMK69nPBU0emQVwkht0I1TaKgWMMQR4MqOP67rOziGhMLeYyMxh7DjXsrf74z2GBLsTdmYVNjj+UsdOwYwH9KZyjcfwTQNJN6Tmqxmg8O2+jhpz9nbn6nYZjPz1Zlsbtxs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766513025;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ijsNqJ/70EN71R3BVRUG56ZJmjfyXgVIF1SuaeXTr7g=; 
 b=igCjyftLnsb/a8I7NqQotyrFgC0Fn+Mq2xXwQPOXTY9tAaqKQfb4F5ugUfbFBS2mB7vhRkYXlj+d2vOCSbvwLyH/YOUc63PVtZtoJT8t4vX956QOQDaqyDa8jIJAXAm1ytr5prJV6PwY8O/PDatgQH/ZNsyBOT1OU9eUPQqQl6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766513025; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ijsNqJ/70EN71R3BVRUG56ZJmjfyXgVIF1SuaeXTr7g=;
 b=X1zc5Jl80gzBsx3JUoeDBMHldCMk3ju/4A+LL9yd5gMN6qcWUgPIuCmhm2X0Mw30
 KAHtB4EUAHqI2Exkor/1kTksQ05XK4SNRb9P62mRUUmBm2e9AgRFeFjM4kaFIW7pMX9
 CazMthSD4jhJpBTq71U+nOpcTkVSwoqsQdbCgSag=
Received: by mx.zohomail.com with SMTPS id 1766513023665673.0680314256373;
 Tue, 23 Dec 2025 10:03:43 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:38 -0300
Subject: [PATCH v3 18/21] drm/vkms: Rename existing color pipeline helpers
 to contain "plane"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-18-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=2834;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=KYz5wMMzVLd2SIZeeSoKXiwrpNlBnDQ02lbiiWEro+k=;
 b=TxDXkdnWnCgHcCuWU/72ICAoXziIPVRr27YV5VQDtSLTm9PhA3UQU05rUsSDEkXnyNifvJIkU
 I37enLuFXh8CBR6smYEZSSrsGDuipiSs5Vv+oAwLOraxTcUPwd9RWGQ
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Rename the existing color pipeline helpers so they contain "plane" in
the name to make them clearly distinguishable from the crtc helpers when
they're introduced.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c | 7 ++++---
 drivers/gpu/drm/vkms/vkms_drv.h     | 2 +-
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 5c3ffc78aea06..dd6120434690e 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -14,7 +14,8 @@ static const u64 supported_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 4
 
-static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+static int vkms_initialize_plane_color_pipeline(struct drm_plane *plane,
+						struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
 	struct drm_device *dev = plane->dev;
@@ -101,13 +102,13 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 	return ret;
 }
 
-int vkms_initialize_colorops(struct drm_plane *plane)
+int vkms_initialize_plane_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipeline;
 	int ret;
 
 	/* Add color pipeline */
-	ret = vkms_initialize_color_pipeline(plane, &pipeline);
+	ret = vkms_initialize_plane_color_pipeline(plane, &pipeline);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0933e4ce0ff03..bdeb52623f4d6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -324,6 +324,6 @@ void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_output *vkms_out);
 
 /* Colorops */
-int vkms_initialize_colorops(struct drm_plane *plane);
+int vkms_initialize_plane_colorops(struct drm_plane *plane);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 19fe6acad306e..82be1b862c1da 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -247,7 +247,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
 	if (vkms_config_plane_get_default_pipeline(plane_cfg))
-		vkms_initialize_colorops(&plane->base);
+		vkms_initialize_plane_colorops(&plane->base);
 
 	return plane;
 }

-- 
2.51.0

