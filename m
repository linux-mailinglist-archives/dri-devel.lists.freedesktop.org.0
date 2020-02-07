Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1615607B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 22:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428A6FDAE;
	Fri,  7 Feb 2020 21:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3E6E10D;
 Fri,  7 Feb 2020 21:07:51 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3dd18d0001>; Fri, 07 Feb 2020 13:07:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 13:07:51 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Feb 2020 13:07:51 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 21:07:51 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 7 Feb 2020 21:07:50 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.104]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e3dd1a60000>; Fri, 07 Feb 2020 13:07:50 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v4 1/3] drm/nouveau: Add format mod prop to base/ovly/nvdisp
Date: Fri, 7 Feb 2020 13:08:17 -0800
Message-ID: <20200207210819.15917-2-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207210819.15917-1-jajones@nvidia.com>
References: <20200207210819.15917-1-jajones@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581109646; bh=vD5CSPx0wnC+UIytFEnNbusvyKN0L0N9S1yYIRF+0yw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=PBjatU47G0/CM7LdzktatjneAzSB5tc621hpRLaesNmXEyRhoSVEF5h2Ny0TZSy/e
 luP/vm3fYsOOwvgE7d5aoUeUh06RvXg4lbMgbmQ/iZwSm7CowyEJiweK5tHJOnF6cG
 6H/zuSxmkoX7Cpgqvzc0bSeY0TqMzmEXOiGrguIOcjaAHnqxs/NCiPKf2j8o7+8kIo
 dwo4g7FrHSIJITCTGQecVUvVoMO5h4bsW0h2BqvPe7f1xPrrqZGhv/Pbs+d/o0fJib
 G3Va7Py7hyAVRF/sKHdI1MyiRClsDTZyVygq37Sd7S+5NEuuwQ7xn9zTJY5YLnKCy3
 /EPMMHAwvq/yg==
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Advertise support for the full list of format
modifiers supported by each class of NVIDIA
desktop GPU display hardware.  Stash the array
of modifiers in the nouveau_display struct for
use when validating userspace framebuffer
creation requests, which will be supportd in
a subsequent change.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  7 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 59 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  4 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 27 +++++++++-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c | 17 ++++++
 drivers/gpu/drm/nouveau/nouveau_display.h   |  2 +
 6 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 00a85f1e1a4a..025b8f996a0a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -262,7 +262,8 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	struct nv50_disp_base_channel_dma_v0 args = {
 		.head = head,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nouveau_display *disp = nouveau_display(drm->dev);
+	struct nv50_disp *disp50 = nv50_disp(drm->dev);
 	struct nv50_wndw *wndw;
 	int ret;
 
@@ -272,9 +273,9 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(&drm->client.device, &disp->disp.object,
 			       &oclass, head, &args, sizeof(args),
-			       disp->sync->bo.offset, &wndw->wndw);
+			       disp50->sync->bo.offset, &wndw->wndw);
 	if (ret) {
 		NV_ERROR(drm, "base%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a3dc2ba19fb2..f017d05072b8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2481,6 +2481,15 @@ nv50_display_create(struct drm_device *dev)
 	if (ret)
 		goto out;
 
+	/* Assign the correct format modifiers */
+	if (disp->disp->object.oclass >= TU102_DISP)
+		nouveau_display(dev)->format_modifiers = wndwc57e_modifiers;
+	else
+	if (disp->disp->object.oclass >= GF110_DISP)
+		nouveau_display(dev)->format_modifiers = disp90xx_modifiers;
+	else
+		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
+
 	/* create crtc objects to represent the hw heads */
 	if (disp->disp->object.oclass >= GV100_DISP)
 		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
@@ -2576,3 +2585,53 @@ nv50_display_create(struct drm_device *dev)
 		nv50_display_destroy(dev);
 	return ret;
 }
+
+/******************************************************************************
+ * Format modifiers
+ *****************************************************************************/
+
+/****************************************************************
+ *            Log2(block height) ----------------------------+  *
+ *            Page Kind ----------------------------------+  |  *
+ *            Gob Height/Page Kind Generation ------+     |  |  *
+ *                          Sector layout -------+  |     |  |  *
+ *                          Compression ------+  |  |     |  |  */
+const u64 disp50xx_modifiers[] = { /*         |  |  |     |  |  */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x7a, 5),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x78, 5),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 1, 0x70, 5),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+/****************************************************************
+ *            Log2(block height) ----------------------------+  *
+ *            Page Kind ----------------------------------+  |  *
+ *            Gob Height/Page Kind Generation ------+     |  |  *
+ *                          Sector layout -------+  |     |  |  *
+ *                          Compression ------+  |  |     |  |  */
+const u64 disp90xx_modifiers[] = { /*         |  |  |     |  |  */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 0, 0xfe, 5),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index d54fe00ac3a3..1743c3a76216 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -78,6 +78,10 @@ void nv50_dmac_destroy(struct nv50_dmac *);
 u32 *evo_wait(struct nv50_dmac *, int nr);
 void evo_kick(u32 *, struct nv50_dmac *);
 
+extern const u64 disp50xx_modifiers[];
+extern const u64 disp90xx_modifiers[];
+extern const u64 wndwc57e_modifiers[];
+
 #define evo_mthd(p, m, s) do {						\
 	const u32 _m = (m), _s = (s);					\
 	if (drm_debug_enabled(DRM_UT_KMS))				\
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 890315291b01..a424ecfdf8e9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -601,6 +601,29 @@ nv50_wndw_destroy(struct drm_plane *plane)
 	kfree(wndw);
 }
 
+/* This function assumes the format has already been validated against the plane
+ * and the modifier was validated against the device-wides modifier list at FB
+ * creation time.
+ */
+static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
+					    u32 format, u64 modifier)
+{
+	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	uint8_t i;
+
+	if (drm->client.device.info.chipset < 0xc0) {
+		const struct drm_format_info *info = drm_format_info(format);
+		const uint8_t kind = (modifier >> 12) & 0xff;
+
+		if (!format) return false;
+
+		for (i = 0; i < info->num_planes; i++)
+			if ((info->cpp[i] != 4) && kind != 0x70) return false;
+	}
+
+	return true;
+}
+
 const struct drm_plane_funcs
 nv50_wndw = {
 	.update_plane = drm_atomic_helper_update_plane,
@@ -609,6 +632,7 @@ nv50_wndw = {
 	.reset = nv50_wndw_reset,
 	.atomic_duplicate_state = nv50_wndw_atomic_duplicate_state,
 	.atomic_destroy_state = nv50_wndw_atomic_destroy_state,
+	.format_mod_supported = nv50_plane_format_mod_supported,
 };
 
 static int
@@ -656,7 +680,8 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 	for (nformat = 0; format[nformat]; nformat++);
 
 	ret = drm_universal_plane_init(dev, &wndw->plane, heads, &nv50_wndw,
-				       format, nformat, NULL,
+				       format, nformat,
+				       nouveau_display(dev)->format_modifiers,
 				       type, "%s-%d", name, index);
 	if (ret) {
 		kfree(*pwndw);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
index 35c9c52fab26..1d64741595ba 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
@@ -173,6 +173,23 @@ wndwc57e_ilut(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw, int size)
 	return true;
 }
 
+/****************************************************************
+ *            Log2(block height) ----------------------------+  *
+ *            Page Kind ----------------------------------+  |  *
+ *            Gob Height/Page Kind Generation ------+     |  |  *
+ *                          Sector layout -------+  |     |  |  *
+ *                          Compression ------+  |  |     |  |  */
+const u64 wndwc57e_modifiers[] = { /*         |  |  |     |  |  */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static const struct nv50_wndw_func
 wndwc57e = {
 	.acquire = wndwc37e_acquire,
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 6e8e66882e45..c54682f00b01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -47,6 +47,8 @@ struct nouveau_display {
 	struct drm_property *color_vibrance_property;
 
 	struct drm_atomic_state *suspend;
+
+	const u64 *format_modifiers;
 };
 
 static inline struct nouveau_display *
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
