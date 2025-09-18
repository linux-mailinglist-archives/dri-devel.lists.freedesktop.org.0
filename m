Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF18B826C0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC94010E5CD;
	Thu, 18 Sep 2025 00:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Exbg2cAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1910E5CD;
 Thu, 18 Sep 2025 00:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758156327;
 bh=Xsr1TXo9ITqadODnuH6d5Q8m8OTyieQYDP/O4IymH6M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Exbg2cAq/GkXtbYJmSkL1HipIYaKV51LJIs4MPkEL+s6r0bKDdGOzk2IHa+06v3x7
 T5cWNm3mY9lSlPg/uVHHJxhYdgPCQCsYH84u6WM/5+o1W1sQ0QJK045sd7Du6StHz5
 JkwYiVj5Z4Hv3bvSe8PKfcjjyWI8RilhxTJNFm5nEH5X3UaPIZEidu+MLDHH7Yadyb
 Kysol69PnOTFnd6NwuHwCXTvntlzJ9uxiSgWRjoglO5aXXXh21MIaQl+Z83RgFTuII
 encURga1Xxtpx2EBxUIBneUFyvlRexD8CUoSd4aNMJciaonkaoEH0KMCSiA2pUpu3p
 ngT4AKq0tdI4Q==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FA3B17E1389;
 Thu, 18 Sep 2025 02:45:19 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:26 -0400
Subject: [PATCH RFC v2 17/20] drm/vkms: Rename existing color pipeline
 helpers to contain "pre_blend"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-17-ac4471b44758@collabora.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
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

Rename the existing color pipeline helpers so they contain "pre_blend"
in the name to make them clearly distinguishable from the post-blend
helpers when they're introduced.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c | 8 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h     | 2 +-
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 0191ac44dec0a9513e001b304f6ead32a96cdb8c..5924ae2bd40fc904048f99bc9b96308140709e25 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -14,7 +14,9 @@ static const u64 supported_tfs =
 
 #define MAX_COLOR_PIPELINE_OPS 4
 
-static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+static int
+vkms_initialize_pre_blend_color_pipeline(struct drm_plane *plane,
+					 struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
 	struct drm_device *dev = plane->dev;
@@ -96,13 +98,13 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 	return ret;
 }
 
-int vkms_initialize_colorops(struct drm_plane *plane)
+int vkms_initialize_pre_blend_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipeline;
 	int ret;
 
 	/* Add color pipeline */
-	ret = vkms_initialize_color_pipeline(plane, &pipeline);
+	ret = vkms_initialize_pre_blend_color_pipeline(plane, &pipeline);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 55440ec6db5209741af1443d4e49e9471e6795c9..37ee569474223b2cf01e3cc0e4f119777533ae23 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -305,6 +305,6 @@ void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_output *vkms_out);
 
 /* Colorops */
-int vkms_initialize_colorops(struct drm_plane *plane);
+int vkms_initialize_pre_blend_colorops(struct drm_plane *plane);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index db8d26810afa8d8fcab48a6db2e691255f26a8a6..8e63a07a7e1b0a350361d0b03b7911bfa9ce3dcc 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -232,7 +232,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  DRM_COLOR_YCBCR_BT601,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
-	vkms_initialize_colorops(&plane->base);
+	vkms_initialize_pre_blend_colorops(&plane->base);
 
 	return plane;
 }

-- 
2.50.1

