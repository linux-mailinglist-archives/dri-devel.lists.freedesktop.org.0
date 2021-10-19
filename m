Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED44340F3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 23:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C566E055;
	Tue, 19 Oct 2021 21:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99A6E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 21:58:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso5837226wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2/puQXisdIHy96scnY39dLOhAgOrf8qFIVS4zmDucw=;
 b=mdJBK7nOU5EfOez2g0KuQcjPX1mqo1Yu1pyUoN+Yonchoy51OiK+gS5SHgjrEoxpOG
 sDimMoXQXXfpFuyMt5InbeCA1ma78VxZZywXFdfahXW4HKbUjs2tnVUa+itAc40a/Lut
 NxF/KtplJGjsU6gnEIouvEaFfzpcZMzpxv8D9kRUTed0sDtlerGTRROHvnHK6Pw2okZY
 QRFluqjW3Vn4uKF7VXKbxGVFIj+s47JoFGFp45q5EuEIhsZUbBnh5vSeuhbfmUIGk//P
 gFNhLcrUXRMbHK5TsyZLzZ7hZifip4eO5zDxP0adM8Pl2bLFIKMZ31phyOxVwysjxCxu
 PDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2/puQXisdIHy96scnY39dLOhAgOrf8qFIVS4zmDucw=;
 b=Weel40j1hOzCUtWoZ1VX2/NqYwTevDIPo7Lf+t1jzIwjElTXYCgCva0DGPiJB2bUIi
 MnisLRNUn/bwvGLbtY/9lIhkLRvTeF7UjH8ZPKTbd051sit9kTQDROuRLbOCp3+MBxZi
 VmJfhiGXaIFgqY4mPg2FQQGUr6AicqC1NdBWnT2D13Fh6ycG8Pri55Iw2MxNFmnbVTVn
 PAVp6+KQdhDQEKcto6uPXrverg6Z4r9fGw/vVSc4nWxV3+P1AZ+X07ufDfKGEmccWzZe
 KsaiAkYL8+fm9dBV4bmlCVoZxidGEWBkY6h5o1k8MYsEBCYnqYc9RnbyIJx2Hqxe7+H9
 jKdw==
X-Gm-Message-State: AOAM5317N4V+znYUufD351++7prw671eqgJBTSa2vGF1GszqjBYDbUX5
 rlAPaQ7GRVyE3hq5tfFFThE=
X-Google-Smtp-Source: ABdhPJyH6EYKD5Zz7cAvlgR25QY6isGkEOndRqrg115y3IbztxMbNkQ417bBT6OIYq5kolH2WJ4Otw==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr7158510wms.97.1634680737804; 
 Tue, 19 Oct 2021 14:58:57 -0700 (PDT)
Received: from apple.sigmaris.info (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id s3sm178540wrm.40.2021.10.19.14.58.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 14:58:57 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
 Hugh Cole-Baker <sigmaris@gmail.com>
Subject: [PATCH v2 2/3] drm/rockchip: support gamma control on RK3399
Date: Tue, 19 Oct 2021 22:58:42 +0100
Message-Id: <20211019215843.42718-3-sigmaris@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211019215843.42718-1-sigmaris@gmail.com>
References: <20211019215843.42718-1-sigmaris@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The RK3399 has a 1024-entry gamma LUT with 10 bits per component on its
"big" VOP and a 256-entry, 8 bit per component LUT on the "little" VOP.
Compared to the RK3288, it no longer requires disabling gamma while
updating the LUT. On the RK3399, the LUT can be updated at any time as
the hardware has two LUT buffers, one can be written while the other is
in use. A swap of the buffers is triggered by writing 1 to the
update_gamma_lut register.

Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
---

Changes from v1: Moved the vop_crtc_gamma_set call to the end of
vop_crtc_atomic_enable after the clocks and CRTC are enabled.

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 105 +++++++++++++-------
 1 file changed, 71 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba9e14da41b4..e2c97f1b26da 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -66,6 +67,9 @@
 #define VOP_REG_SET(vop, group, name, v) \
 		    vop_reg_set(vop, &vop->data->group->name, 0, ~0, v, #name)
 
+#define VOP_HAS_REG(vop, group, name) \
+		(!!(vop->data->group->name.mask))
+
 #define VOP_INTR_SET_TYPE(vop, name, type, v) \
 	do { \
 		int i, reg = 0, mask = 0; \
@@ -1204,17 +1208,22 @@ static bool vop_dsp_lut_is_enabled(struct vop *vop)
 	return vop_read_reg(vop, 0, &vop->data->common->dsp_lut_en);
 }
 
+static u32 vop_lut_buffer_index(struct vop *vop)
+{
+	return vop_read_reg(vop, 0, &vop->data->common->lut_buffer_index);
+}
+
 static void vop_crtc_write_gamma_lut(struct vop *vop, struct drm_crtc *crtc)
 {
 	struct drm_color_lut *lut = crtc->state->gamma_lut->data;
-	unsigned int i;
+	unsigned int i, bpc = ilog2(vop->data->lut_size);
 
 	for (i = 0; i < crtc->gamma_size; i++) {
 		u32 word;
 
-		word = (drm_color_lut_extract(lut[i].red, 10) << 20) |
-		       (drm_color_lut_extract(lut[i].green, 10) << 10) |
-			drm_color_lut_extract(lut[i].blue, 10);
+		word = (drm_color_lut_extract(lut[i].red, bpc) << (2 * bpc)) |
+		       (drm_color_lut_extract(lut[i].green, bpc) << bpc) |
+			drm_color_lut_extract(lut[i].blue, bpc);
 		writel(word, vop->lut_regs + i * 4);
 	}
 }
@@ -1224,38 +1233,66 @@ static void vop_crtc_gamma_set(struct vop *vop, struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *state = crtc->state;
 	unsigned int idle;
+	u32 lut_idx, old_idx;
 	int ret;
 
 	if (!vop->lut_regs)
 		return;
-	/*
-	 * To disable gamma (gamma_lut is null) or to write
-	 * an update to the LUT, clear dsp_lut_en.
-	 */
-	spin_lock(&vop->reg_lock);
-	VOP_REG_SET(vop, common, dsp_lut_en, 0);
-	vop_cfg_done(vop);
-	spin_unlock(&vop->reg_lock);
 
-	/*
-	 * In order to write the LUT to the internal memory,
-	 * we need to first make sure the dsp_lut_en bit is cleared.
-	 */
-	ret = readx_poll_timeout(vop_dsp_lut_is_enabled, vop,
-				 idle, !idle, 5, 30 * 1000);
-	if (ret) {
-		DRM_DEV_ERROR(vop->dev, "display LUT RAM enable timeout!\n");
-		return;
-	}
+	if (!state->gamma_lut || !VOP_HAS_REG(vop, common, update_gamma_lut)) {
+		/*
+		 * To disable gamma (gamma_lut is null) or to write
+		 * an update to the LUT, clear dsp_lut_en.
+		 */
+		spin_lock(&vop->reg_lock);
+		VOP_REG_SET(vop, common, dsp_lut_en, 0);
+		vop_cfg_done(vop);
+		spin_unlock(&vop->reg_lock);
 
-	if (!state->gamma_lut)
-		return;
+		/*
+		 * In order to write the LUT to the internal memory,
+		 * we need to first make sure the dsp_lut_en bit is cleared.
+		 */
+		ret = readx_poll_timeout(vop_dsp_lut_is_enabled, vop,
+					 idle, !idle, 5, 30 * 1000);
+		if (ret) {
+			DRM_DEV_ERROR(vop->dev, "display LUT RAM enable timeout!\n");
+			return;
+		}
+
+		if (!state->gamma_lut)
+			return;
+	} else {
+		/*
+		 * On RK3399 the gamma LUT can updated without clearing dsp_lut_en,
+		 * by setting update_gamma_lut then waiting for lut_buffer_index change
+		 */
+		old_idx = vop_lut_buffer_index(vop);
+	}
 
 	spin_lock(&vop->reg_lock);
 	vop_crtc_write_gamma_lut(vop, crtc);
 	VOP_REG_SET(vop, common, dsp_lut_en, 1);
+	VOP_REG_SET(vop, common, update_gamma_lut, 1);
 	vop_cfg_done(vop);
 	spin_unlock(&vop->reg_lock);
+
+	if (VOP_HAS_REG(vop, common, update_gamma_lut)) {
+		ret = readx_poll_timeout(vop_lut_buffer_index, vop,
+					 lut_idx, lut_idx != old_idx, 5, 30 * 1000);
+		if (ret) {
+			DRM_DEV_ERROR(vop->dev, "gamma LUT update timeout!\n");
+			return;
+		}
+
+		/*
+		 * update_gamma_lut is auto cleared by HW, but write 0 to clear the bit
+		 * in our backup of the regs.
+		 */
+		spin_lock(&vop->reg_lock);
+		VOP_REG_SET(vop, common, update_gamma_lut, 0);
+		spin_unlock(&vop->reg_lock);
+	}
 }
 
 static void vop_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -1305,14 +1342,6 @@ static void vop_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	/*
-	 * If we have a GAMMA LUT in the state, then let's make sure
-	 * it's updated. We might be coming out of suspend,
-	 * which means the LUT internal memory needs to be re-written.
-	 */
-	if (crtc->state->gamma_lut)
-		vop_crtc_gamma_set(vop, crtc, old_state);
-
 	mutex_lock(&vop->vop_lock);
 
 	WARN_ON(vop->event);
@@ -1403,6 +1432,14 @@ static void vop_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	VOP_REG_SET(vop, common, standby, 0);
 	mutex_unlock(&vop->vop_lock);
+
+	/*
+	 * If we have a GAMMA LUT in the state, then let's make sure
+	 * it's updated. We might be coming out of suspend,
+	 * which means the LUT internal memory needs to be re-written.
+	 */
+	if (crtc->state->gamma_lut)
+		vop_crtc_gamma_set(vop, crtc, old_state);
 }
 
 static bool vop_fs_irq_is_pending(struct vop *vop)
@@ -2125,8 +2162,8 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (res) {
-		if (!vop_data->lut_size) {
-			DRM_DEV_ERROR(dev, "no gamma LUT size defined\n");
+		if (vop_data->lut_size != 1024 && vop_data->lut_size != 256) {
+			DRM_DEV_ERROR(dev, "unsupported gamma LUT size %d\n", vop_data->lut_size);
 			return -EINVAL;
 		}
 		vop->lut_regs = devm_ioremap_resource(dev, res);
-- 
2.24.3 (Apple Git-128)

