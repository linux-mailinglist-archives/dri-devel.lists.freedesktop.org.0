Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FDAC9AEC
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 14:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED37210E11D;
	Sat, 31 May 2025 12:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="TXPlul1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Sat, 31 May 2025 12:27:11 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9227910E07A
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 12:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748693519; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NQFC0AIUY23FUQjQz62ed9qK5rpwaVURBiwk3dkDm82WhPJGCOJKKbfcP+vlRPBS/1DU/WCh4gWSA6UK9wlX4uSl9ZvSShgsKqW+NTtFDvtuxzxNAUAm5UpwjNfkOCck0MBxrR3b2cFFjN3mO2JC/xb2NgqZp74gv1mzdgzLhII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748693519;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NYhJiwF0tBtC7BJnrVq4lhX1cQwG9XLjgrh95lCEAF8=; 
 b=R39n6y6IEwGkmMkC+XD7su8I642KC2vuar7b3J8ErQo9niEVyq/jjWv8mz13LmOYs+9/ksnm3lxpaqhDiz+WyKAo1uXvBNL2WAZFXMTsR0SIdQmDThbYAuNrCSw9FqX/ImDTNCQDux+Ocs+NKt/hAR9vVAlofEJ+MDqJgLKsj7Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748693519; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NYhJiwF0tBtC7BJnrVq4lhX1cQwG9XLjgrh95lCEAF8=;
 b=TXPlul1F6op3zLbL2y6z9iqPSXYOMf1WvhOe25kxqDfE72r6pspOW89nHTzBaI01
 7+KUoAX8KN+lmxDkRFyx3t+4a/fqTxGj4gCvrhmTs7sDhgX6JIghMuWcUcNyfHfrccb
 pDN7a/Fg4NJDBg08WhNoIZVWGrk5icvYU1dIdY0i5JGzDHZMTNbc02NwwVrcrOjrfsu
 S6zyJtNrwZ6dlY7A8PQrXktKqw5tUtnwH/HnurkA6i+2DCNFNJVnmFfA7JpMYCKAyZQ
 5RWarM3/2N9QwVNiLWKLWuCmIBrCiRcrpjDVMCwh6qdhwchqP0RYiiRp/nJ4Y5lVvIO
 +h8QjqcBiQ==
Received: by mx.zohomail.com with SMTPS id 1748693516762703.3998524129344;
 Sat, 31 May 2025 05:11:56 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Justin Green <greenjustin@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] drm/mediatek: only announce AFBC if really supported
Date: Sat, 31 May 2025 20:11:40 +0800
Message-ID: <20250531121140.387661-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <20250531121140.387661-1-uwu@icenowy.me>+zmo_0_
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

Currently even the SoC's OVL does not declare the support of AFBC, AFBC
is still announced to the userspace within the IN_FORMATS blob, which
breaks modern Wayland compositors like KWin Wayland and others.

Gate passing modifiers to drm_universal_plane_init() behind querying the
driver of the hardware block for AFBC support.

Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
Patch tested on MT8183, on which KWin Wayland 5.27.12 is fixed.

In addition, I tried to fake supports_afbc in mt8183_ovl_driver_data and
mt8183_ovl_2l_driver_data, then KWin Wayland gets broken again and
modetest also shows the AFBC modifier in IN_FORMATS.

 drivers/gpu/drm/mediatek/mtk_crtc.c     | 3 ++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h | 9 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 +++++++
 drivers/gpu/drm/mediatek/mtk_plane.c    | 7 +++++--
 drivers/gpu/drm/mediatek/mtk_plane.h    | 3 ++-
 7 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 8f6fba4217ece..53359c2465b65 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -930,7 +930,8 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 				mtk_ddp_comp_supported_rotations(comp),
 				mtk_ddp_comp_get_blend_modes(comp),
 				mtk_ddp_comp_get_formats(comp),
-				mtk_ddp_comp_get_num_formats(comp), i);
+				mtk_ddp_comp_get_num_formats(comp),
+				mtk_ddp_comp_is_afbc_supported(comp), i);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index edc6417639e64..ac6620e10262e 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -366,6 +366,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.get_blend_modes = mtk_ovl_get_blend_modes,
 	.get_formats = mtk_ovl_get_formats,
 	.get_num_formats = mtk_ovl_get_num_formats,
+	.is_afbc_supported = mtk_ovl_is_afbc_supported,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_postmask = {
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 39720b27f4e9e..7289b3dcf22f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -83,6 +83,7 @@ struct mtk_ddp_comp_funcs {
 	u32 (*get_blend_modes)(struct device *dev);
 	const u32 *(*get_formats)(struct device *dev);
 	size_t (*get_num_formats)(struct device *dev);
+	bool (*is_afbc_supported)(struct device *dev);
 	void (*connect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
@@ -294,6 +295,14 @@ size_t mtk_ddp_comp_get_num_formats(struct mtk_ddp_comp *comp)
 	return 0;
 }
 
+static inline bool mtk_ddp_comp_is_afbc_supported(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->is_afbc_supported)
+		return comp->funcs->is_afbc_supported(comp->dev);
+
+	return false;
+}
+
 static inline bool mtk_ddp_comp_add(struct mtk_ddp_comp *comp, struct mtk_mutex *mutex)
 {
 	if (comp->funcs && comp->funcs->add) {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 04217a36939cd..679d413bf10be 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -106,6 +106,7 @@ void mtk_ovl_disable_vblank(struct device *dev);
 u32 mtk_ovl_get_blend_modes(struct device *dev);
 const u32 *mtk_ovl_get_formats(struct device *dev);
 size_t mtk_ovl_get_num_formats(struct device *dev);
+bool mtk_ovl_is_afbc_supported(struct device *dev);
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index d0581c4e3c999..e0236353d4997 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -236,6 +236,13 @@ size_t mtk_ovl_get_num_formats(struct device *dev)
 	return ovl->data->num_formats;
 }
 
+bool mtk_ovl_is_afbc_supported(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->supports_afbc;
+}
+
 int mtk_ovl_clk_enable(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 655106bbb76d3..e08b771bc25e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -321,7 +321,8 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 blend_modes,
-		   const u32 *formats, size_t num_formats, unsigned int plane_idx)
+		   const u32 *formats, size_t num_formats,
+		   bool supports_afbc, unsigned int plane_idx)
 {
 	int err;
 
@@ -332,7 +333,9 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 
 	err = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &mtk_plane_funcs, formats,
-				       num_formats, modifiers, type, NULL);
+				       num_formats,
+				       supports_afbc ? modifiers : NULL,
+				       type, NULL);
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 3b13b89989c7e..95c5fa5295d8a 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -49,5 +49,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 blend_modes,
-		   const u32 *formats, size_t num_formats, unsigned int plane_idx);
+		   const u32 *formats, size_t num_formats,
+		   bool supports_afbc, unsigned int plane_idx);
 #endif
-- 
2.49.0

