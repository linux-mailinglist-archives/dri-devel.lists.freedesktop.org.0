Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169D249C54
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C92B6E26C;
	Wed, 19 Aug 2020 11:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524986E252
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A6032311C;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837583;
 bh=OuHrQsTKAQYHSxtKVmSm5TQXrDj+rArWy1OIgkGGZMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GZuxIGWKRIllcpOBpRvBq282rKvRK6hXuwzZMfL5rgQsfvJoa04oVpqG4B0gRImJw
 ufOa7bIMlXfuRvXMd/g53zCpfCh2wRH6l4ZYlSNPks/IyZCYxjaKZENPCCaupzheLg
 WkL5+VB4W8W2V+NNS+qoOc0NftuTFf3QBUa3YLNg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Eubr-43; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 40/49] staging: hikey9xx/gpu: get rid of input/output macros
Date: Wed, 19 Aug 2020 13:46:08 +0200
Message-Id: <2fe984add98c7285d5500d45a2bca28569bc40c8.1597833138.git.mchehab+huawei@kernel.org>
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
 Xiubin Zhang <zhangxiubin1@huawei.com>, linaro-mm-sig@lists.linaro.org,
 Liuyao An <anliuyao@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPE headers define several macros for I/O. Get rid of
them by replacing by the Linux ones.

In the specific case of outp32(), I used this small
coccinelle script to change them to writel():

	@ rule1 @
	expression addr, val;
	@@
	-outp32(addr, val)
	+writel(val, addr)

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin960_dpe_reg.h   |  15 --
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   |  15 --
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     | 251 ++++++++++--------
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   |  24 +-
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c |  14 +-
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        |  24 +-
 drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c   |  20 +-
 7 files changed, 180 insertions(+), 183 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index f34d5af189f7..cd248bf15503 100644
--- a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -3218,21 +3218,6 @@ struct mipi_ifbc_division {
 
 /*****************************************************************************/
 
-#define outp32(addr, val) writel(val, addr)
-#define outp16(addr, val) writew(val, addr)
-#define outp8(addr, val) writeb(val, addr)
-#define outp(addr, val) outp32(addr, val)
-
-#define inp32(addr) readl(addr)
-#define inp16(addr) readw(addr)
-#define inp8(addr) readb(addr)
-#define inp(addr) inp32(addr)
-
-#define inpw(port) readw(port)
-#define outpw(port, val) writew(val, port)
-#define inpdw(port) readl(port)
-#define outpdw(port, val) writel(val, port)
-
 #ifndef ALIGN_DOWN
 #define ALIGN_DOWN(val, al)  ((val) & ~((al) - 1))
 #endif
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 4f24322ebc7f..aeae3720c889 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -4206,21 +4206,6 @@ struct mipi_ifbc_division {
 
 /*****************************************************************************/
 
-#define outp32(addr, val) writel(val, addr)
-#define outp16(addr, val) writew(val, addr)
-#define outp8(addr, val) writeb(val, addr)
-#define outp(addr, val) outp32(addr, val)
-
-#define inp32(addr) readl(addr)
-#define inp16(addr) readw(addr)
-#define inp8(addr) readb(addr)
-#define inp(addr) inp32(addr)
-
-#define inpw(port) readw(port)
-#define outpw(port, val) writew(val, port)
-#define inpdw(port) readl(port)
-#define outpdw(port, val) writel(val, port)
-
 #ifndef ALIGN_DOWN
 #define ALIGN_DOWN(val, al)  ((val) & ~((al) - 1))
 #endif
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index 0e3d192c3851..ac7924fd0fc9 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -123,10 +123,10 @@ void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs)
 	u32 mask = (1UL << bw) - 1UL;
 	u32 tmp = 0;
 
-	tmp = inp32(addr);
+	tmp = readl(addr);
 	tmp &= ~(mask << bs);
 
-	outp32(addr, tmp | ((val & mask) << bs));
+	writel(tmp | ((val & mask) << bs), addr);
 
 	if (g_debug_set_reg_val) {
 		printk(KERN_INFO "writel: [%p] = 0x%x\n", addr,
@@ -275,18 +275,16 @@ void init_ldi(struct dss_crtc *acrtc)
 
 	init_ldi_pxl_div(acrtc);
 
-	outp32(ldi_base + LDI_DPI0_HRZ_CTRL0,
-	       hfp | ((hbp + DSS_WIDTH(hsw)) << 16));
-	outp32(ldi_base + LDI_DPI0_HRZ_CTRL1, 0);
-	outp32(ldi_base + LDI_DPI0_HRZ_CTRL2, DSS_WIDTH(rect.w));
-	outp32(ldi_base + LDI_VRT_CTRL0,
-	       vfp | (vbp << 16));
-	outp32(ldi_base + LDI_VRT_CTRL1, DSS_HEIGHT(vsw));
-	outp32(ldi_base + LDI_VRT_CTRL2, DSS_HEIGHT(rect.h));
+	writel(hfp | ((hbp + DSS_WIDTH(hsw)) << 16),
+	       ldi_base + LDI_DPI0_HRZ_CTRL0);
+	writel(0, ldi_base + LDI_DPI0_HRZ_CTRL1);
+	writel(DSS_WIDTH(rect.w), ldi_base + LDI_DPI0_HRZ_CTRL2);
+	writel(vfp | (vbp << 16), ldi_base + LDI_VRT_CTRL0);
+	writel(DSS_HEIGHT(vsw), ldi_base + LDI_VRT_CTRL1);
+	writel(DSS_HEIGHT(rect.h), ldi_base + LDI_VRT_CTRL2);
 
-	outp32(ldi_base + LDI_PLR_CTRL,
-	       vsync_plr | (hsync_plr << 1) |
-		(pixelclk_plr << 2) | (data_en_plr << 3));
+	writel(vsync_plr | (hsync_plr << 1) | (pixelclk_plr << 2) | (data_en_plr << 3),
+	       ldi_base + LDI_PLR_CTRL);
 
 	/* bpp*/
 	set_reg(ldi_base + LDI_CTRL, acrtc->out_format, 2, 3);
@@ -294,10 +292,10 @@ void init_ldi(struct dss_crtc *acrtc)
 	set_reg(ldi_base + LDI_CTRL, acrtc->bgr_fmt, 1, 13);
 
 	/* for ddr pmqos*/
-	outp32(ldi_base + LDI_VINACT_MSK_LEN, vfp);
+	writel(vfp, ldi_base + LDI_VINACT_MSK_LEN);
 
 	/*cmd event sel*/
-	outp32(ldi_base + LDI_CMD_EVENT_SEL, 0x1);
+	writel(0x1, ldi_base + LDI_CMD_EVENT_SEL);
 
 	/* for 1Hz LCD and mipi command LCD*/
 	set_reg(ldi_base + LDI_DSI_CMD_MOD_CTRL, 0x1, 1, 1);
@@ -470,22 +468,25 @@ void init_dbuf(struct dss_crtc *acrtc)
 		thd_flux_req_aftdfs_out,
 		thd_dfs_ok);
 
-	outp32(dbuf_base + DBUF_FRM_SIZE, mode->hdisplay * mode->vdisplay);
-	outp32(dbuf_base + DBUF_FRM_HSIZE, DSS_WIDTH(mode->hdisplay));
-	outp32(dbuf_base + DBUF_SRAM_VALID_NUM, sram_valid_num);
+	writel(mode->hdisplay * mode->vdisplay, dbuf_base + DBUF_FRM_SIZE);
+	writel(DSS_WIDTH(mode->hdisplay), dbuf_base + DBUF_FRM_HSIZE);
+	writel(sram_valid_num, dbuf_base + DBUF_SRAM_VALID_NUM);
 
-	outp32(dbuf_base + DBUF_THD_RQOS, (thd_rqos_out << 16) | thd_rqos_in);
-	outp32(dbuf_base + DBUF_THD_WQOS, (thd_wqos_out << 16) | thd_wqos_in);
-	outp32(dbuf_base + DBUF_THD_CG, (thd_cg_out << 16) | thd_cg_in);
-	outp32(dbuf_base + DBUF_THD_OTHER, (thd_cg_hold << 16) | thd_wr_wait);
-	outp32(dbuf_base + DBUF_THD_FLUX_REQ_BEF, (thd_flux_req_befdfs_out << 16) | thd_flux_req_befdfs_in);
-	outp32(dbuf_base + DBUF_THD_FLUX_REQ_AFT, (thd_flux_req_aftdfs_out << 16) | thd_flux_req_aftdfs_in);
-	outp32(dbuf_base + DBUF_THD_DFS_OK, thd_dfs_ok);
-	outp32(dbuf_base + DBUF_FLUX_REQ_CTRL, (dfs_ok_mask << 1) | thd_flux_req_sw_en);
+	writel((thd_rqos_out << 16) | thd_rqos_in, dbuf_base + DBUF_THD_RQOS);
+	writel((thd_wqos_out << 16) | thd_wqos_in, dbuf_base + DBUF_THD_WQOS);
+	writel((thd_cg_out << 16) | thd_cg_in, dbuf_base + DBUF_THD_CG);
+	writel((thd_cg_hold << 16) | thd_wr_wait, dbuf_base + DBUF_THD_OTHER);
+	writel((thd_flux_req_befdfs_out << 16) | thd_flux_req_befdfs_in,
+               dbuf_base + DBUF_THD_FLUX_REQ_BEF);
+	writel((thd_flux_req_aftdfs_out << 16) | thd_flux_req_aftdfs_in,
+               dbuf_base + DBUF_THD_FLUX_REQ_AFT);
+	writel(thd_dfs_ok, dbuf_base + DBUF_THD_DFS_OK);
+	writel((dfs_ok_mask << 1) | thd_flux_req_sw_en,
+               dbuf_base + DBUF_FLUX_REQ_CTRL);
 
-	outp32(dbuf_base + DBUF_DFS_LP_CTRL, 0x1);
+	writel(0x1, dbuf_base + DBUF_DFS_LP_CTRL);
 	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970)
-		outp32(dbuf_base + DBUF_DFS_RAM_MANAGE, dfs_ram);
+		writel(dfs_ram, dbuf_base + DBUF_DFS_RAM_MANAGE);
 }
 
 void init_dpp(struct dss_crtc *acrtc)
@@ -508,10 +509,10 @@ void init_dpp(struct dss_crtc *acrtc)
 	dpp_base = ctx->base + DSS_DPP_OFFSET;
 	mctl_sys_base = ctx->base + DSS_MCTRL_SYS_OFFSET;
 
-	outp32(dpp_base + DPP_IMG_SIZE_BEF_SR,
-	       (DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
-	outp32(dpp_base + DPP_IMG_SIZE_AFT_SR,
-	       (DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
+	writel((DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay),
+	       dpp_base + DPP_IMG_SIZE_BEF_SR);
+	writel((DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay),
+	       dpp_base + DPP_IMG_SIZE_AFT_SR);
 }
 
 void enable_ldi(struct dss_crtc *acrtc)
@@ -563,22 +564,22 @@ void dpe_interrupt_clear(struct dss_crtc *acrtc)
 	dss_base = ctx->base;
 
 	clear = ~0;
-	outp32(dss_base + GLB_CPU_PDP_INTS, clear);
-	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS, clear);
-	outp32(dss_base + DSS_DPP_OFFSET + DPP_INTS, clear);
+	writel(clear, dss_base + GLB_CPU_PDP_INTS);
+	writel(clear, dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
+	writel(clear, dss_base + DSS_DPP_OFFSET + DPP_INTS);
 
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_MCTL_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_WCH0_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_WCH1_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH0_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH1_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH2_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH3_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH4_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH5_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH6_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH7_INTS, clear);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_DSS_GLB_INTS, clear);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_MCTL_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_WCH0_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_WCH1_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH0_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH1_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH2_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH3_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH4_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH5_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH6_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_RCH7_INTS);
+	writel(clear, dss_base + DSS_DBG_OFFSET + DBG_DSS_GLB_INTS);
 }
 
 void dpe_interrupt_unmask(struct dss_crtc *acrtc)
@@ -597,12 +598,12 @@ void dpe_interrupt_unmask(struct dss_crtc *acrtc)
 
 	unmask = ~0;
 	unmask &= ~(BIT_ITF0_INTS | BIT_MMU_IRPT_NS);
-	outp32(dss_base + GLB_CPU_PDP_INT_MSK, unmask);
+	writel(unmask, dss_base + GLB_CPU_PDP_INT_MSK);
 
 	unmask = ~0;
 	unmask &= ~(BIT_VSYNC | BIT_VACTIVE0_END | BIT_LDI_UNFLOW);
 
-	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, unmask);
+	writel(unmask, dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
 }
 
 void dpe_interrupt_mask(struct dss_crtc *acrtc)
@@ -620,21 +621,21 @@ void dpe_interrupt_mask(struct dss_crtc *acrtc)
 	dss_base = ctx->base;
 
 	mask = ~0;
-	outp32(dss_base + GLB_CPU_PDP_INT_MSK, mask);
-	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, mask);
-	outp32(dss_base + DSS_DPP_OFFSET + DPP_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_DSS_GLB_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_MCTL_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_WCH0_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_WCH1_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH0_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH1_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH2_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH3_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH4_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH5_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH6_INT_MSK, mask);
-	outp32(dss_base + DSS_DBG_OFFSET + DBG_RCH7_INT_MSK, mask);
+	writel(mask, dss_base + GLB_CPU_PDP_INT_MSK);
+	writel(mask, dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
+	writel(mask, dss_base + DSS_DPP_OFFSET + DPP_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_DSS_GLB_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_MCTL_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_WCH0_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_WCH1_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH0_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH1_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH2_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH3_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH4_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH5_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH6_INT_MSK);
+	writel(mask, dss_base + DSS_DBG_OFFSET + DBG_RCH7_INT_MSK);
 }
 
 int dpe_init(struct dss_crtc *acrtc)
@@ -692,7 +693,7 @@ void dpe_check_itf_status(struct dss_crtc *acrtc)
 	mctl_sys_base =  ctx->base + DSS_MCTRL_SYS_OFFSET;
 
 	while (1) {
-		tmp = inp32(mctl_sys_base + MCTL_MOD17_STATUS + itf_idx * 0x4);
+		tmp = readl(mctl_sys_base + MCTL_MOD17_STATUS + itf_idx * 0x4);
 		if (((tmp & 0x10) == 0x10) || delay_count > 100) {
 			is_timeout = (delay_count > 100) ? true : false;
 			delay_count = 0;
@@ -720,11 +721,11 @@ void dss_inner_clk_pdp_enable(struct dss_hw_ctx *ctx)
 	}
 	dss_base = ctx->base;
 
-	outp32(dss_base + DSS_IFBC_OFFSET + IFBC_MEM_CTRL, 0x00000088);
-	outp32(dss_base + DSS_DSC_OFFSET + DSC_MEM_CTRL, 0x00000888);
-	outp32(dss_base + DSS_LDI0_OFFSET + LDI_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_DBUF0_OFFSET + DBUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_DPP_DITHER_OFFSET + DITHER_MEM_CTRL, 0x00000008);
+	writel(0x00000088, dss_base + DSS_IFBC_OFFSET + IFBC_MEM_CTRL);
+	writel(0x00000888, dss_base + DSS_DSC_OFFSET + DSC_MEM_CTRL);
+	writel(0x00000008, dss_base + DSS_LDI0_OFFSET + LDI_MEM_CTRL);
+	writel(0x00000008, dss_base + DSS_DBUF0_OFFSET + DBUF_MEM_CTRL);
+	writel(0x00000008, dss_base + DSS_DPP_DITHER_OFFSET + DITHER_MEM_CTRL);
 }
 
 void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
@@ -739,61 +740,87 @@ void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
 	dss_base = ctx->base;
 
 	/*core/axi/mmbuf*/
-	outp32(dss_base + DSS_CMDLIST_OFFSET + CMD_MEM_CTRL, 0x00000008);  /*cmd mem*/
+	writel(0x00000008, dss_base + DSS_CMDLIST_OFFSET + CMD_MEM_CTRL);  /*cmd mem*/
 
-	outp32(dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_v0 ,scf mem*/
-	outp32(dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);/*rch_v0 ,scf mem*/
-	outp32(dss_base + DSS_RCH_VG0_ARSR_OFFSET + ARSR2P_LB_MEM_CTRL, 0x00000008);/*rch_v0 ,arsr2p mem*/
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + VPP_MEM_CTRL, 0x00000008);/*rch_v0 ,vpp mem*/
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_v0 ,dma_buf mem*/
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);/*rch_v0 ,afbcd mem*/
+	writel(0x00000088,
+	       dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_COEF_MEM_CTRL);/*rch_v0 ,scf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_LB_MEM_CTRL);/*rch_v0 ,scf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_VG0_ARSR_OFFSET + ARSR2P_LB_MEM_CTRL);/*rch_v0 ,arsr2p mem*/
+	writel(0x00000008, dss_base + DSS_RCH_VG0_DMA_OFFSET + VPP_MEM_CTRL);/*rch_v0 ,vpp mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_VG0_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_v0 ,dma_buf mem*/
+	writel(0x00008888, dss_base + DSS_RCH_VG0_DMA_OFFSET + AFBCD_MEM_CTRL);/*rch_v0 ,afbcd mem*/
 
-	outp32(dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_v1 ,scf mem*/
-	outp32(dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);/*rch_v1 ,scf mem*/
-	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_v1 ,dma_buf mem*/
-	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);/*rch_v1 ,afbcd mem*/
+	writel(0x00000088,
+	       dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_COEF_MEM_CTRL);/*rch_v1 ,scf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_LB_MEM_CTRL);/*rch_v1 ,scf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_VG1_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_v1 ,dma_buf mem*/
+	writel(0x00008888, dss_base + DSS_RCH_VG1_DMA_OFFSET + AFBCD_MEM_CTRL);/*rch_v1 ,afbcd mem*/
 
 	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
-		outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
-		outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
-		outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
-		outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
+		writel(0x88888888,
+		       dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL);
+		writel(0x00000888,
+		       dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL_1);
+		writel(0x88888888,
+		       dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL);
+		writel(0x00000888,
+		       dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL_1);
 	} else {
-		outp32(dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_v2 ,scf mem*/
-		outp32(dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);/*rch_v2 ,scf mem*/
+		writel(0x00000088,
+		       dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_COEF_MEM_CTRL);/*rch_v2 ,scf mem*/
+		writel(0x00000008,
+		       dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_LB_MEM_CTRL);/*rch_v2 ,scf mem*/
 	}
 
-	outp32(dss_base + DSS_RCH_VG2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_v2 ,dma_buf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_VG2_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_v2 ,dma_buf mem*/
 
-	outp32(dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_g0 ,scf mem*/
-	outp32(dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x0000008);/*rch_g0 ,scf mem*/
-	outp32(dss_base + DSS_RCH_G0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_g0 ,dma_buf mem*/
-	outp32(dss_base + DSS_RCH_G0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);/*rch_g0 ,afbcd mem*/
+	writel(0x00000088,
+	       dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_COEF_MEM_CTRL);/*rch_g0 ,scf mem*/
+	writel(0x0000008, dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_LB_MEM_CTRL);/*rch_g0 ,scf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_G0_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_g0 ,dma_buf mem*/
+	writel(0x00008888, dss_base + DSS_RCH_G0_DMA_OFFSET + AFBCD_MEM_CTRL);/*rch_g0 ,afbcd mem*/
 
-	outp32(dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_g1 ,scf mem*/
-	outp32(dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x0000008);/*rch_g1 ,scf mem*/
-	outp32(dss_base + DSS_RCH_G1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_g1 ,dma_buf mem*/
-	outp32(dss_base + DSS_RCH_G1_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);/*rch_g1 ,afbcd mem*/
+	writel(0x00000088,
+	       dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_COEF_MEM_CTRL);/*rch_g1 ,scf mem*/
+	writel(0x0000008, dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_LB_MEM_CTRL);/*rch_g1 ,scf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_G1_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_g1 ,dma_buf mem*/
+	writel(0x00008888, dss_base + DSS_RCH_G1_DMA_OFFSET + AFBCD_MEM_CTRL);/*rch_g1 ,afbcd mem*/
 
-	outp32(dss_base + DSS_RCH_D0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_d0 ,dma_buf mem*/
-	outp32(dss_base + DSS_RCH_D0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);/*rch_d0 ,afbcd mem*/
-	outp32(dss_base + DSS_RCH_D1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_d1 ,dma_buf mem*/
-	outp32(dss_base + DSS_RCH_D2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_d2 ,dma_buf mem*/
-	outp32(dss_base + DSS_RCH_D3_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_d3 ,dma_buf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_D0_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_d0 ,dma_buf mem*/
+	writel(0x00008888, dss_base + DSS_RCH_D0_DMA_OFFSET + AFBCD_MEM_CTRL);/*rch_d0 ,afbcd mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_D1_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_d1 ,dma_buf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_D2_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_d2 ,dma_buf mem*/
+	writel(0x00000008,
+	       dss_base + DSS_RCH_D3_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*rch_d3 ,dma_buf mem*/
 
-	outp32(dss_base + DSS_WCH0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*wch0 DMA/AFBCE mem*/
-	outp32(dss_base + DSS_WCH0_DMA_OFFSET + AFBCE_MEM_CTRL, 0x00000888);/*wch0 DMA/AFBCE mem*/
-	outp32(dss_base + DSS_WCH0_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);/*wch0 rot mem*/
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*wch1 DMA/AFBCE mem*/
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL, 0x00000888);/*wch1 DMA/AFBCE mem*/
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);/*wch1 rot mem*/
+	writel(0x00000008, dss_base + DSS_WCH0_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*wch0 DMA/AFBCE mem*/
+	writel(0x00000888, dss_base + DSS_WCH0_DMA_OFFSET + AFBCE_MEM_CTRL);/*wch0 DMA/AFBCE mem*/
+	writel(0x00000008, dss_base + DSS_WCH0_DMA_OFFSET + ROT_MEM_CTRL);/*wch0 rot mem*/
+	writel(0x00000008, dss_base + DSS_WCH1_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*wch1 DMA/AFBCE mem*/
+	writel(0x00000888, dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL);/*wch1 DMA/AFBCE mem*/
+	writel(0x00000008, dss_base + DSS_WCH1_DMA_OFFSET + ROT_MEM_CTRL);/*wch1 rot mem*/
 	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
-		outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_COEF_MEM_CTRL, 0x00000088);
-		outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_LB_MEM_CTRL, 0x00000008);
-		outp32(dss_base + GLB_DSS_MEM_CTRL, 0x02605550);
+		writel(0x00000088,
+		       dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_COEF_MEM_CTRL);
+		writel(0x00000008,
+		       dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_LB_MEM_CTRL);
+		writel(0x02605550, dss_base + GLB_DSS_MEM_CTRL);
 	} else {
-		outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*wch2 DMA/AFBCE mem*/
-		outp32(dss_base + DSS_WCH2_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);/*wch2 rot mem*/
+		writel(0x00000008,
+		       dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL);/*wch2 DMA/AFBCE mem*/
+		writel(0x00000008,
+		       dss_base + DSS_WCH2_DMA_OFFSET + ROT_MEM_CTRL);/*wch2 rot mem*/
 		//outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
 		//outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
 	}
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index 546da775f2fb..292e14d2edf5 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -215,7 +215,7 @@ int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, u64 pixel_clock)
 	frac = (u64)(ceil_temp * vco_freq_output - sys_clock_fref / refdiv * fbdiv) * refdiv * frac_range;
 	frac = (u64)frac / sys_clock_fref;
 
-	ppll7ctrl0 = inp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL0);
+	ppll7ctrl0 = readl(ctx->pmctrl_base + MIDIA_PPLL7_CTRL0);
 	ppll7ctrl0 &= ~MIDIA_PPLL7_FREQ_DEVIDER_MASK;
 
 	ppll7ctrl0_val = 0x0;
@@ -223,9 +223,9 @@ int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, u64 pixel_clock)
 	ppll7ctrl0_val &= MIDIA_PPLL7_FREQ_DEVIDER_MASK;
 	ppll7ctrl0 |= ppll7ctrl0_val;
 
-	outp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL0, ppll7ctrl0);
+	writel(ppll7ctrl0, ctx->pmctrl_base + MIDIA_PPLL7_CTRL0);
 
-	ppll7ctrl1 = inp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL1);
+	ppll7ctrl1 = readl(ctx->pmctrl_base + MIDIA_PPLL7_CTRL1);
 	ppll7ctrl1 &= ~MIDIA_PPLL7_FRAC_MODE_MASK;
 
 	ppll7ctrl1_val = 0x0;
@@ -233,7 +233,7 @@ int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, u64 pixel_clock)
 	ppll7ctrl1_val &= MIDIA_PPLL7_FRAC_MODE_MASK;
 	ppll7ctrl1 |= ppll7ctrl1_val;
 
-	outp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL1, ppll7ctrl1);
+	writel(ppll7ctrl1, ctx->pmctrl_base + MIDIA_PPLL7_CTRL1);
 
 	DRM_INFO("PLL7 set to (0x%0x, 0x%0x)\n", ppll7ctrl0, ppll7ctrl1);
 
@@ -438,16 +438,16 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 	u32 isr_s2 = 0;
 	u32 mask = 0;
 
-	isr_s1 = inp32(dss_base + GLB_CPU_PDP_INTS);
-	isr_s2 = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
+	isr_s1 = readl(dss_base + GLB_CPU_PDP_INTS);
+	isr_s2 = readl(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
 	DRM_INFO_ONCE("isr_s1 = 0x%x!\n", isr_s1);
 	DRM_INFO_ONCE("isr_s2 = 0x%x!\n", isr_s2);
 
-	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS, isr_s2);
-	outp32(dss_base + GLB_CPU_PDP_INTS, isr_s1);
+	writel(isr_s2, dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
+	writel(isr_s1, dss_base + GLB_CPU_PDP_INTS);
 
-	isr_s1 &= ~(inp32(dss_base + GLB_CPU_PDP_INT_MSK));
-	isr_s2 &= ~(inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK));
+	isr_s1 &= ~(readl(dss_base + GLB_CPU_PDP_INT_MSK));
+	isr_s2 &= ~(readl(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK));
 
 	if (isr_s2 & BIT_VACTIVE0_END) {
 		ctx->vactive0_end_flag++;
@@ -460,9 +460,9 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 	}
 
 	if (isr_s2 & BIT_LDI_UNFLOW) {
-		mask = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
+		mask = readl(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
 		mask |= BIT_LDI_UNFLOW;
-		outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, mask);
+		writel(mask, dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
 
 		DRM_ERROR("ldi underflow!\n");
 	}
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 58cbb1448306..60c43c153829 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -1298,10 +1298,10 @@ static void hisi_dss_qos_on(struct dss_hw_ctx *ctx)
 
 	noc_dss_base = ctx->noc_dss_base;
 
-	outp32(noc_dss_base + 0xc, 0x2);
-	outp32(noc_dss_base + 0x8c, 0x2);
-	outp32(noc_dss_base + 0x10c, 0x2);
-	outp32(noc_dss_base + 0x18c, 0x2);
+	writel(0x2, noc_dss_base + 0xc);
+	writel(0x2, noc_dss_base + 0x8c);
+	writel(0x2, noc_dss_base + 0x10c);
+	writel(0x2, noc_dss_base + 0x18c);
 }
 
 static void hisi_dss_mif_on(struct dss_hw_ctx *ctx)
@@ -1427,13 +1427,13 @@ void hisi_dss_unflow_handler(struct dss_hw_ctx *ctx, bool unmask)
 
 	dss_base = ctx->base;
 
-	tmp = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
+	tmp = readl(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
 	if (unmask)
 		tmp &= ~BIT_LDI_UNFLOW;
 	else
 		tmp |= BIT_LDI_UNFLOW;
 
-	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, tmp);
+	writel(tmp, dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
 }
 
 void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
@@ -1457,7 +1457,7 @@ void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
 		set_reg(mctl_base + MCTL_CTL_CLEAR, 0x1, 1, 0);
 
 	while (1) {
-		mctl_status = inp32(mctl_base + MCTL_CTL_STATUS);
+		mctl_status = readl(mctl_base + MCTL_CTL_STATUS);
 		if (((mctl_status & 0x10) == 0) || (delay_count > 500)) {
 			is_timeout = (delay_count > 100) ? true : false;
 			delay_count = 0;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index e7fb556befa1..5c6a9b78a1ec 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -279,10 +279,10 @@ static void set_reg(char __iomem *addr, uint32_t val, uint8_t bw,
 	u32 mask = (1UL << bw) - 1UL;
 	u32 tmp = 0;
 
-	tmp = inp32(addr);
+	tmp = readl(addr);
 	tmp &= ~(mask << bs);
 
-	outp32(addr, tmp | ((val & mask) << bs));
+	writel(tmp | ((val & mask) << bs), addr);
 }
 
 void dsi_set_output_client(struct drm_device *dev)
@@ -1078,11 +1078,11 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	set_reg(mipi_dsi_base + MIPIDSI_CLKMGR_CFG_OFFSET, dsi->phy.clk_division, 8, 0);
 	set_reg(mipi_dsi_base + MIPIDSI_CLKMGR_CFG_OFFSET, dsi->phy.clk_division, 8, 8);
 
-	outp32(mipi_dsi_base + MIPIDSI_PHY_RSTZ_OFFSET, 0x00000000);
+	writel(0x00000000, mipi_dsi_base + MIPIDSI_PHY_RSTZ_OFFSET);
 
-	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000000);
-	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000001);
-	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000000);
+	writel(0x00000000, mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET);
+	writel(0x00000001, mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET);
+	writel(0x00000000, mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET);
 
 #if defined(CONFIG_DRM_HISI_KIRIN970)
 	dsi_phy_tst_set(mipi_dsi_base, 0x0042, 0x21);
@@ -1194,12 +1194,12 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	}
 #endif
 
-	outp32(mipi_dsi_base + MIPIDSI_PHY_RSTZ_OFFSET, 0x00000007);
+	writel(0x00000007, mipi_dsi_base + MIPIDSI_PHY_RSTZ_OFFSET);
 
 	is_ready = false;
 	dw_jiffies = jiffies + HZ / 2;
 	do {
-		tmp = inp32(mipi_dsi_base + MIPIDSI_PHY_STATUS_OFFSET);
+		tmp = readl(mipi_dsi_base + MIPIDSI_PHY_STATUS_OFFSET);
 		if ((tmp & 0x00000001) == 0x00000001) {
 			is_ready = true;
 			break;
@@ -1223,7 +1223,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 	is_ready = false;
 	dw_jiffies = jiffies + HZ / 2;
 	do {
-		tmp = inp32(mipi_dsi_base + MIPIDSI_PHY_STATUS_OFFSET);
+		tmp = readl(mipi_dsi_base + MIPIDSI_PHY_STATUS_OFFSET);
 		if ((tmp & cmp_stopstate_val) == cmp_stopstate_val) {
 			is_ready = true;
 			break;
@@ -1383,7 +1383,7 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
 
 	/* dsi memory init */
 #if defined(CONFIG_DRM_HISI_KIRIN970)
-	outp32(mipi_dsi_base + DSI_MEM_CTRL, 0x02600008);
+	writel(0x02600008, mipi_dsi_base + DSI_MEM_CTRL);
 #endif
 
 	/* switch to cmd mode */
@@ -1422,7 +1422,7 @@ static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	DRM_DEBUG("pctrl_dphytx_stopcnt = %llu\n", pctrl_dphytx_stopcnt);
 
 	//FIXME:
-	outp32(dsi->ctx->pctrl_base + PERI_CTRL29, (u32)pctrl_dphytx_stopcnt);
+	writel((u32)pctrl_dphytx_stopcnt, dsi->ctx->pctrl_base + PERI_CTRL29);
 #endif
 
 	return 0;
@@ -2015,7 +2015,7 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 	DRM_INFO("dsi  cur_client is %d  <0->hdmi;1->panel>\n", dsi->cur_client);
 	/*dis-reset*/
 	/*ip_reset_dis_dsi0, ip_reset_dis_dsi1*/
-	outp32(ctx->peri_crg_base + PERRSTDIS3, 0x30000000);
+	writel(0x30000000, ctx->peri_crg_base + PERRSTDIS3);
 
 	ctx->dss_dphy0_ref_clk = devm_clk_get(&pdev->dev, "clk_txdphy0_ref");
 	if (IS_ERR(ctx->dss_dphy0_ref_clk)) {
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
index 519e8f0232de..c920734e6332 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
@@ -177,14 +177,14 @@ int hisi_pwm_set_backlight(struct backlight_device *bl, uint32_t bl_level)
 
 	bl_level = (bl_level * PWM_OUT_PRECISION) / bl_max;
 
-	outp32(pwm_base + PWM_LOCK_OFFSET, 0x1acce551);
-	outp32(pwm_base + PWM_CTL_OFFSET, 0x0);
-	outp32(pwm_base + PWM_CFG_OFFSET, 0x2);
-	outp32(pwm_base + PWM_PR0_OFFSET, 0x1);
-	outp32(pwm_base + PWM_PR1_OFFSET, 0x2);
-	outp32(pwm_base + PWM_CTL_OFFSET, 0x1);
-	outp32(pwm_base + PWM_C0_MR_OFFSET, (PWM_OUT_PRECISION - 1));
-	outp32(pwm_base + PWM_C0_MR0_OFFSET, bl_level);
+	writel(0x1acce551, pwm_base + PWM_LOCK_OFFSET);
+	writel(0x0, pwm_base + PWM_CTL_OFFSET);
+	writel(0x2, pwm_base + PWM_CFG_OFFSET);
+	writel(0x1, pwm_base + PWM_PR0_OFFSET);
+	writel(0x2, pwm_base + PWM_PR1_OFFSET);
+	writel(0x1, pwm_base + PWM_CTL_OFFSET);
+	writel((PWM_OUT_PRECISION - 1), pwm_base + PWM_C0_MR_OFFSET);
+	writel(bl_level, pwm_base + PWM_C0_MR0_OFFSET);
 
 	return 0;
 }
@@ -214,7 +214,7 @@ int hisi_pwm_on(void)
 		return 0;
 
 	// dis-reset pwm
-	outp32(peri_crg_base + PERRSTDIS2, 0x1);
+	writel(0x1, peri_crg_base + PERRSTDIS2);
 
 	clk_tmp = g_pwm_clk;
 	if (clk_tmp) {
@@ -276,7 +276,7 @@ int hisi_pwm_off(void)
 	}
 
 	//reset pwm
-	outp32(peri_crg_base + PERRSTEN2, 0x1);
+	writel(0x1, peri_crg_base + PERRSTEN2);
 
 	g_pwm_on = 0;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
