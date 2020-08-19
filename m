Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF24249C32
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742C6E223;
	Wed, 19 Aug 2020 11:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C3E6E217
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17F1822B40;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=oGWGSlXE6B6nkn4KhA/fJuyX0Tb0fZzkJdtSK1EuSh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wCkNn+vMGRsAvIGGpN1UAXYIBZUXT3odo/LMOKyC9v9jKgJ8eFKuFlaB7D1h2VkYK
 a2rIJRu4jfunnQWy2NKRBY1KMO9klktcKnJH180L19rMkYrKen28HGETklCnGdcxLM
 BWaZErxVnt6jdJ+Y4YqeluJHCEkzCeYzAZG+003Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00EuaX-03; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 15/49] staging: hikey9xx/gpu: get rid of some ifdefs
Date: Wed, 19 Aug 2020 13:45:43 +0200
Message-Id: <0d77c3397e01d1d623b012c29988bbd01544ce45.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some #ifdefs there for non-existing CONFIG_ options
(nor even at the downstream code).

Let's get rid of those. It can be re-added later if ever needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     | 36 -------------------
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.h     |  4 ---
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c | 14 --------
 3 files changed, 54 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index 887c5d609ab6..8aa43619c888 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -275,17 +275,8 @@ void init_ldi(struct dss_crtc *acrtc)
 
 	/*ldi_data_gate(ctx, true);*/
 
-#ifdef CONFIG_HISI_FB_LDI_COLORBAR_USED
-	/* colorbar width*/
-	set_reg(ldi_base + LDI_CTRL, DSS_WIDTH(0x3c), 7, 6);
-	/* colorbar ort*/
-	set_reg(ldi_base + LDI_WORK_MODE, 0x0, 1, 1);
-	/* colorbar enable*/
-	set_reg(ldi_base + LDI_WORK_MODE, 0x0, 1, 0);
-#else
 	/* normal*/
 	set_reg(ldi_base + LDI_WORK_MODE, 0x1, 1, 0);
-#endif
 
 	/* ldi disable*/
 	set_reg(ldi_base + LDI_CTRL, 0x0, 1, 0);
@@ -493,33 +484,6 @@ void init_dpp(struct dss_crtc *acrtc)
 		(DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
 	outp32(dpp_base + DPP_IMG_SIZE_AFT_SR,
 		(DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
-
-#ifdef CONFIG_HISI_FB_DPP_COLORBAR_USED
-	#if defined (CONFIG_HISI_FB_970)
-	outp32(dpp_base + DPP_CLRBAR_CTRL, (0x30 << 24) | (0 << 1) | 0x1);
-	set_reg(dpp_base + DPP_CLRBAR_1ST_CLR, 0x3FF00000, 30, 0); //Red
-	set_reg(dpp_base + DPP_CLRBAR_2ND_CLR, 0x000FFC00, 30, 0); //Green
-	set_reg(dpp_base + DPP_CLRBAR_3RD_CLR, 0x000003FF, 30, 0); //Blue
-	#else
-	void __iomem *mctl_base;
-	outp32(dpp_base + DPP_CLRBAR_CTRL, (0x30 << 24) | (0 << 1) | 0x1);
-	set_reg(dpp_base + DPP_CLRBAR_1ST_CLR, 0xFF, 8, 16);
-	set_reg(dpp_base + DPP_CLRBAR_2ND_CLR, 0xFF, 8, 8);
-	set_reg(dpp_base + DPP_CLRBAR_3RD_CLR, 0xFF, 8, 0);
-
-	mctl_base = ctx->base +
-		g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
-
-	set_reg(mctl_base + MCTL_CTL_MUTEX, 0x1, 1, 0);
-	set_reg(mctl_base + MCTL_CTL_EN, 0x1, 32, 0);
-	set_reg(mctl_base + MCTL_CTL_TOP, 0x2, 32, 0); /*auto mode*/
-	set_reg(mctl_base + MCTL_CTL_DBG, 0xB13A00, 32, 0);
-
-	set_reg(mctl_base + MCTL_CTL_MUTEX_ITF, 0x1, 2, 0);
-	set_reg(mctl_sys_base + MCTL_OV0_FLUSH_EN, 0x8, 4, 0);
-	set_reg(mctl_base + MCTL_CTL_MUTEX, 0x0, 1, 0);
-	#endif
-#endif
 }
 
 void enable_ldi(struct dss_crtc *acrtc)
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
index b0bcc5d7a0c1..5ef5c6c6edbb 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
@@ -21,10 +21,6 @@
 #endif
 #include "kirin_drm_drv.h"
 
-/*#define CONFIG_HISI_FB_OV_BASE_USED*/
-/*#define CONFIG_HISI_FB_DPP_COLORBAR_USED*/
-/*#define CONFIG_HISI_FB_LDI_COLORBAR_USED*/
-
 void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs);
 uint32_t set_bits32(uint32_t old_val, uint32_t val, uint8_t bw, uint8_t bs);
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index a1f58c5f7239..6246316d81b0 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -1211,14 +1211,8 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 		set_reg(ovl0_base + OVL_SIZE, (xres - 1) |
 			((yres - 1) << 16), 32, 0);
 
-#ifdef CONFIG_HISI_FB_OV_BASE_USED
-		DRM_INFO("CONFIG_HISI_FB_OV_BASE_USED !!. \n");
-		set_reg(ovl0_base + OV_BG_COLOR_RGB, 0x3FF00000, 32, 0);
-		set_reg(ovl0_base + OV_BG_COLOR_A, 0x3FF, 32, 0);
-#else
 		set_reg(ovl0_base + OV_BG_COLOR_RGB, 0x00000000, 32, 0);
 		set_reg(ovl0_base + OV_BG_COLOR_A, 0x00000000, 32, 0);
-#endif
 		set_reg(ovl0_base + OV_DST_STARTPOS, 0x0, 32, 0);
 		set_reg(ovl0_base + OV_DST_ENDPOS, (xres - 1) |
 			((yres - 1) << 16), 32, 0);
@@ -1228,11 +1222,7 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 		set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x1, 32, 0);
 		set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x0, 32, 0);
 		set_reg(ovl0_base + OVL_SIZE, (xres - 1) | ((yres - 1) << 16), 32, 0);
-#ifdef CONFIG_HISI_FB_OV_BASE_USED
-		set_reg(ovl0_base + OVL_BG_COLOR, 0xFFFF0000, 32, 0);
-#else
 		set_reg(ovl0_base + OVL_BG_COLOR, 0xFF000000, 32, 0);
-#endif
 		set_reg(ovl0_base + OVL_DST_STARTPOS, 0x0, 32, 0);
 		set_reg(ovl0_base + OVL_DST_ENDPOS, (xres - 1) | ((yres - 1) << 16), 32, 0);
 		set_reg(ovl0_base + OVL_GCFG, 0x10001, 32, 0);
@@ -1559,10 +1549,6 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	bpp = fb->bits_per_pixel / 8;
 	stride = fb->pitches[0];
 
-#if defined(CONFIG_HISI_FB_LDI_COLORBAR_USED) || defined(CONFIG_HISI_FB_DPP_COLORBAR_USED) || defined(CONFIG_HISI_FB_OV_BASE_USED)
-	return;
-#endif
-
 #ifndef CMA_BUFFER_USED
 	if (fbdev)
 		display_addr = (u32)fbdev->smem_start + src_y * stride;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
