Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBA8430B09
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2516E48F;
	Sun, 17 Oct 2021 17:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519E6E429
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 10:19:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y3so30965555wrl.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 03:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hwFw3KSOmFiX0jDKgCBFOOAzZucouZSHWBD6hErSS2c=;
 b=NZ2qCNiVNN534TGDb627laBg2VKhnod2XI3343uhSWsh5QJN54vVBqunR8cYEF0lTb
 Uep5ZC3KYsHlXjBhomz0jLe34/xBUMPU/vQIQV6gJaR3ivjpRTHGQptXqVxAXGziSsWp
 25KsE7pNBB0LPuU1uT5DVIf2vyTPsEziUPqpNmZzSBNXiAVtT0mGkLKApd6CicAuYd8L
 mNntmGNFXPouQdpVYAJICCo0yw7XWfXELfP12LKKnb1zsiVONjsSjuQ1lcseoGB7EFND
 T3S0Ykh8SOpFQotQM/kvaSbuv6o0biOs0ZbcLFIiTDRwHxA4vsiXInqqRbL4XZ4tR5Rn
 4HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hwFw3KSOmFiX0jDKgCBFOOAzZucouZSHWBD6hErSS2c=;
 b=NclALdk+7LgaaOvE0rdjaQmrZY76RfEFZolwhGdeRD5/3Ve2+unhlF63PrpxC3EJOu
 Ng2VHDCpPYAkG3B5LXnCCVkHyKjBndmtY+PFIyFW1v04b4iG4XQ3JAMBBRq0KGdQaxEv
 Oh95Y3MSyOUQgwQcdOLiqwG6aNzNPJc+2ePgZXh1wNhzOeVDbnK2V/PgW+l6uvlgLXPA
 ti5dDyBAAYz1uAFHCF0/euOMH3aDZfZvDAOXnzH7fYj2lsiiWd9u7K3RNfSOwZsbtzz1
 lCr8Eqj8j/3+5WpFrCS/S03Rkt2FnP3hhXaXYegYtEsrKaeE9HcUy2MqVcC3xh0/Mrsj
 rDAg==
X-Gm-Message-State: AOAM533bHBwYw7+mHkA3bdhh3UN748WR2zjwNTTrj18ehMomoQo6G3NA
 q8IMBsQ5clPeJUomwPX6jYg=
X-Google-Smtp-Source: ABdhPJx1fsfubV6viIRglPcZF8FVS/F2cZBhy2jVN6YliaxdyhmEY/ou9/K1Qxe2JpSUW2CtWZM9qQ==
X-Received: by 2002:adf:cf04:: with SMTP id o4mr21044277wrj.129.1634379566461; 
 Sat, 16 Oct 2021 03:19:26 -0700 (PDT)
Received: from apple.sigmaris.info (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id k13sm2920926wrp.86.2021.10.16.03.19.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 Oct 2021 03:19:26 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Hugh Cole-Baker <sigmaris@gmail.com>
Subject: [PATCH 2/3] drm/rockchip: support gamma control on RK3399
Date: Sat, 16 Oct 2021 11:18:51 +0100
Message-Id: <c1e5fabdbd92745e4fe8f543b236b0d3c2009be4.1634378097.git.sigmaris@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1634378097.git.sigmaris@gmail.com>
References: <cover.1634378097.git.sigmaris@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 17 Oct 2021 17:06:15 +0000
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
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 89 +++++++++++++++------
 1 file changed, 63 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba9e14da41b4..937ad82abe69 100644
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

