Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A096BB7A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F95110E77B;
	Wed,  4 Sep 2024 12:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Xbz4Jj5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8D5710E74C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=wbqaT
 CXNZqurZ6/CcmWY0R6WbNpn+ghSIgpopvHspxA=; b=Xbz4Jj5NShZ611oWTZ9Ww
 5OJFvWHLmzxAv9VcMLXnz65CXcmINdiUz2dVbHt50fqxmhwq+U1DnWdhvqBJVxcp
 yG3+6S/WPZnYh/5HF68ySqjmVV+Amff+sbTptGgeNYfcVmUaruJpAmkoKACs5+9Q
 MQuhnqo6ItB6caX0y4mMFA=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-0 (Coremail) with SMTP id
 _____wA3HxFgTNhmiRMZCA--.50872S12; 
 Wed, 04 Sep 2024 20:02:54 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: detlev.casanova@collabora.com
Cc: sjoerd@collabora.com, sebastian.reichel@collabora.com, heiko@sntech.de,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 10/11] drm/rockchip: vop2: Add support for rk3576
Date: Wed,  4 Sep 2024 20:02:37 +0800
Message-Id: <20240904120238.3856782-11-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904120238.3856782-1-andyshrk@163.com>
References: <20240904120238.3856782-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3HxFgTNhmiRMZCA--.50872S12
X-Coremail-Antispam: 1Uf129KBjvAXoWDCFW3Jry5CFyDZrW8ArykGrg_yoW7GFW7Xo
 W3CrnIqryxt34Sk395Gr17XFyxWF40kws7ur17AFyak3y3X3y5Cry0q3ZIvF47tay5CF4r
 A3sYq3WrZFWfZw1xn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI9a9DUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g5QXmWX0KXmJgACsX
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

From: Andy Yan <andy.yan@rock-chips.com>

VOP2 on rk3576:
Three video ports:
VP0 Max 4096x2160
VP1 Max 2560x1600
VP2 Max 1920x1080

2 4K Cluster windows with AFBC/RFBC, line RGB and YUV
4 Esmart windows with line RGB/YUV support:
Esmart0/1: 4K
Esmart2/3: 2k, or worked together as a single 4K plane at shared
line buffer mode.

Compared to the previous VOP, another difference is that each VP
has its own independent vsync interrupt number.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Add platform specific callback

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 144 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  87 ++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 890 ++++++++++++++++++-
 3 files changed, 1052 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d0b763b0dd6c..d529cee721b0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1177,6 +1177,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		&fb->format->format,
 		afbc_en ? "AFBC" : "", &yrgb_mst);
 
+	if (vop2->version >= VOP_VERSION_RK3576)
+		vop2_win_write(win, VOP2_WIN_VP_SEL, vp->id);
+
 	if (vop2_cluster_window(win))
 		vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, half_block_en);
 
@@ -1241,6 +1244,11 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		else
 			vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 0);
 
+		if (vop2->version >= VOP_VERSION_RK3576) {
+			vop2_win_write(win, VOP2_WIN_AFBC_PLD_OFFSET_EN, 1);
+			vop2_win_write(win, VOP2_WIN_AFBC_PLD_OFFSET, yrgb_mst);
+		}
+
 		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en);
 		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
@@ -1909,6 +1917,56 @@ static const struct drm_crtc_funcs vop2_crtc_funcs = {
 	.late_register = vop2_crtc_late_register,
 };
 
+static irqreturn_t rk3576_vp_isr(int irq, void *data)
+{
+	struct vop2_video_port *vp = data;
+	struct vop2 *vop2 = vp->vop2;
+	struct drm_crtc *crtc = &vp->crtc;
+	uint32_t irqs;
+	int ret = IRQ_NONE;
+
+	/*
+	 * The irq is shared with the iommu. If the runtime-pm state of the
+	 * vop2-device is disabled the irq has to be targeted at the iommu.
+	 */
+	if (!pm_runtime_get_if_in_use(vop2->dev))
+		return IRQ_NONE;
+
+	irqs = vop2_readl(vop2, RK3568_VP_INT_STATUS(vp->id));
+	vop2_writel(vop2, RK3568_VP_INT_CLR(vp->id), irqs << 16 | irqs);
+
+	if (irqs & VP_INT_DSP_HOLD_VALID) {
+		complete(&vp->dsp_hold_completion);
+		ret = IRQ_HANDLED;
+	}
+
+	if (irqs & VP_INT_FS_FIELD) {
+		drm_crtc_handle_vblank(crtc);
+		spin_lock(&crtc->dev->event_lock);
+		if (vp->event) {
+			u32 val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
+
+			if (!(val & BIT(vp->id))) {
+				drm_crtc_send_vblank_event(crtc, vp->event);
+				vp->event = NULL;
+				drm_crtc_vblank_put(crtc);
+			}
+		}
+		spin_unlock(&crtc->dev->event_lock);
+
+		ret = IRQ_HANDLED;
+	}
+
+	if (irqs & VP_INT_POST_BUF_EMPTY) {
+		drm_err_ratelimited(vop2->drm, "POST_BUF_EMPTY irq err at vp%d\n", vp->id);
+		ret = IRQ_HANDLED;
+	}
+
+	pm_runtime_put(vop2->dev);
+
+	return ret;
+}
+
 static irqreturn_t vop2_isr(int irq, void *data)
 {
 	struct vop2 *vop2 = data;
@@ -1924,41 +1982,43 @@ static irqreturn_t vop2_isr(int irq, void *data)
 	if (!pm_runtime_get_if_in_use(vop2->dev))
 		return IRQ_NONE;
 
-	for (i = 0; i < vop2_data->nr_vps; i++) {
-		struct vop2_video_port *vp = &vop2->vps[i];
-		struct drm_crtc *crtc = &vp->crtc;
-		u32 irqs;
+	if (vop2->version < VOP_VERSION_RK3576) {
+		for (i = 0; i < vop2_data->nr_vps; i++) {
+			struct vop2_video_port *vp = &vop2->vps[i];
+			struct drm_crtc *crtc = &vp->crtc;
+			u32 irqs;
 
-		irqs = vop2_readl(vop2, RK3568_VP_INT_STATUS(vp->id));
-		vop2_writel(vop2, RK3568_VP_INT_CLR(vp->id), irqs << 16 | irqs);
+			irqs = vop2_readl(vop2, RK3568_VP_INT_STATUS(vp->id));
+			vop2_writel(vop2, RK3568_VP_INT_CLR(vp->id), irqs << 16 | irqs);
 
-		if (irqs & VP_INT_DSP_HOLD_VALID) {
-			complete(&vp->dsp_hold_completion);
-			ret = IRQ_HANDLED;
-		}
-
-		if (irqs & VP_INT_FS_FIELD) {
-			drm_crtc_handle_vblank(crtc);
-			spin_lock(&crtc->dev->event_lock);
-			if (vp->event) {
-				u32 val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
+			if (irqs & VP_INT_DSP_HOLD_VALID) {
+				complete(&vp->dsp_hold_completion);
+				ret = IRQ_HANDLED;
+			}
 
-				if (!(val & BIT(vp->id))) {
-					drm_crtc_send_vblank_event(crtc, vp->event);
-					vp->event = NULL;
-					drm_crtc_vblank_put(crtc);
+			if (irqs & VP_INT_FS_FIELD) {
+				drm_crtc_handle_vblank(crtc);
+				spin_lock(&crtc->dev->event_lock);
+				if (vp->event) {
+					u32 val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
+
+					if (!(val & BIT(vp->id))) {
+						drm_crtc_send_vblank_event(crtc, vp->event);
+						vp->event = NULL;
+						drm_crtc_vblank_put(crtc);
+					}
 				}
-			}
-			spin_unlock(&crtc->dev->event_lock);
+				spin_unlock(&crtc->dev->event_lock);
 
-			ret = IRQ_HANDLED;
-		}
+				ret = IRQ_HANDLED;
+			}
 
-		if (irqs & VP_INT_POST_BUF_EMPTY) {
-			drm_err_ratelimited(vop2->drm,
-					    "POST_BUF_EMPTY irq err at vp%d\n",
-					    vp->id);
-			ret = IRQ_HANDLED;
+			if (irqs & VP_INT_POST_BUF_EMPTY) {
+				drm_err_ratelimited(vop2->drm,
+						    "POST_BUF_EMPTY irq err at vp%d\n",
+						    vp->id);
+				ret = IRQ_HANDLED;
+			}
 		}
 	}
 
@@ -2443,6 +2503,32 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (vop2->version >= VOP_VERSION_RK3576) {
+		struct drm_crtc *crtc;
+
+		drm_for_each_crtc(crtc, drm) {
+			struct vop2_video_port *vp = to_vop2_video_port(crtc);
+			int vp_irq;
+			const char *irq_name = devm_kasprintf(dev, GFP_KERNEL, "vop-vp%d", vp->id);
+
+			if (!irq_name)
+				return -ENOMEM;
+
+			vp_irq = platform_get_irq_byname(pdev, irq_name);
+			if (vp_irq < 0) {
+				DRM_DEV_ERROR(dev, "cannot find irq for vop2 vp%d\n", vp->id);
+				return vp_irq;
+			}
+
+			ret = devm_request_irq(dev, vp_irq, rk3576_vp_isr, IRQF_SHARED, irq_name,
+					       vp);
+			if (ret) {
+				DRM_DEV_ERROR(dev, "request irq for vop2 vp%d failed\n", vp->id);
+				return ret;
+			}
+		}
+	}
+
 	ret = vop2_find_rgb_encoder(vop2);
 	if (ret >= 0) {
 		vop2->rgb = rockchip_rgb_init(dev, &vop2->vps[ret].crtc,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 064167afebf4..e2485c2285ad 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -44,6 +44,13 @@ enum win_dly_mode {
 	VOP2_DLY_MODE_MAX,
 };
 
+enum vop2_dly_module {
+	VOP2_DLY_WIN,           /** Win delay cycle for this VP */
+	VOP2_DLY_LAYER_MIX,     /** Layer Mix delay cycle for this VP */
+	VOP2_DLY_HDR_MIX,       /** HDR delay cycle for this VP */
+	VOP2_DLY_MAX,
+};
+
 enum vop2_scale_up_mode {
 	VOP2_SCALE_UP_NRST_NBOR,
 	VOP2_SCALE_UP_BIL,
@@ -137,16 +144,22 @@ enum vop2_win_regs {
 	VOP2_WIN_AFBC_UV_SWAP,
 	VOP2_WIN_AFBC_AUTO_GATING_EN,
 	VOP2_WIN_AFBC_BLOCK_SPLIT_EN,
+	VOP2_WIN_AFBC_PLD_OFFSET_EN,
 	VOP2_WIN_AFBC_PIC_VIR_WIDTH,
 	VOP2_WIN_AFBC_TILE_NUM,
 	VOP2_WIN_AFBC_PIC_OFFSET,
 	VOP2_WIN_AFBC_PIC_SIZE,
 	VOP2_WIN_AFBC_DSP_OFFSET,
+	VOP2_WIN_AFBC_PLD_OFFSET,
 	VOP2_WIN_AFBC_TRANSFORM_OFFSET,
 	VOP2_WIN_AFBC_HDR_PTR,
 	VOP2_WIN_AFBC_HALF_BLOCK_EN,
 	VOP2_WIN_AFBC_ROTATE_270,
 	VOP2_WIN_AFBC_ROTATE_90,
+
+	VOP2_WIN_VP_SEL,
+	VOP2_WIN_DLY_NUM,
+
 	VOP2_WIN_MAX_REG,
 };
 
@@ -208,6 +221,10 @@ struct vop2_video_port_data {
 	struct vop_rect max_output;
 	const u8 pre_scan_max_dly[4];
 	unsigned int offset;
+	/**
+	 * @pixel_rate: pixel per cycle
+	 */
+	u8 pixel_rate;
 };
 
 struct vop2_video_port {
@@ -365,10 +382,13 @@ enum dst_factor_mode {
 #define RK3568_REG_CFG_DONE			0x000
 #define RK3568_VERSION_INFO			0x004
 #define RK3568_SYS_AUTO_GATING_CTRL		0x008
+#define RK3576_SYS_MMU_CTRL_IMD			0x020
 #define RK3568_SYS_AXI_LUT_CTRL			0x024
 #define RK3568_DSP_IF_EN			0x028
+#define RK3576_SYS_PORT_CTRL_IMD		0x028
 #define RK3568_DSP_IF_CTRL			0x02c
 #define RK3568_DSP_IF_POL			0x030
+#define RK3576_SYS_CLUSTER_PD_CTRL_IMD		0x030
 #define RK3588_SYS_PD_CTRL			0x034
 #define RK3568_WB_CTRL				0x40
 #define RK3568_WB_XSCAL_FACTOR			0x44
@@ -388,6 +408,55 @@ enum dst_factor_mode {
 #define RK3568_VP_INT_CLR(vp)			(0xA4 + (vp) * 0x10)
 #define RK3568_VP_INT_STATUS(vp)		(0xA8 + (vp) * 0x10)
 #define RK3568_VP_INT_RAW_STATUS(vp)		(0xAC + (vp) * 0x10)
+#define RK3576_WB_CTRL				0x100
+#define RK3576_WB_XSCAL_FACTOR			0x104
+#define RK3576_WB_YRGB_MST			0x108
+#define RK3576_WB_CBR_MST			0x10C
+#define RK3576_WB_VIR_STRIDE			0x110
+#define RK3576_WB_TIMEOUT_CTRL			0x114
+#define RK3576_MIPI0_IF_CTRL			0x180
+#define RK3576_HDMI0_IF_CTRL			0x184
+#define RK3576_EDP0_IF_CTRL			0x188
+#define RK3576_DP0_IF_CTRL			0x18C
+#define RK3576_RGB_IF_CTRL			0x194
+#define RK3576_DP1_IF_CTRL			0x1A4
+#define RK3576_DP2_IF_CTRL			0x1B0
+
+/* Extra OVL register definition */
+#define RK3576_SYS_EXTRA_ALPHA_CTRL		0x500
+#define RK3576_CLUSTER0_MIX_SRC_COLOR_CTRL	0x530
+#define RK3576_CLUSTER0_MIX_DST_COLOR_CTRL	0x534
+#define RK3576_CLUSTER0_MIX_SRC_ALPHA_CTRL	0x538
+#define RK3576_CLUSTER0_MIX_DST_ALPHA_CTRL	0x53c
+#define RK3576_CLUSTER1_MIX_SRC_COLOR_CTRL	0x540
+#define RK3576_CLUSTER1_MIX_DST_COLOR_CTRL	0x544
+#define RK3576_CLUSTER1_MIX_SRC_ALPHA_CTRL	0x548
+#define RK3576_CLUSTER1_MIX_DST_ALPHA_CTRL	0x54c
+
+/* OVL registers for Video Port definition */
+#define RK3576_OVL_CTRL(vp)			(0x600 + (vp) * 0x100)
+#define RK3576_OVL_LAYER_SEL(vp)		(0x604 + (vp) * 0x100)
+#define RK3576_OVL_MIX0_SRC_COLOR_CTRL(vp)	(0x620 + (vp) * 0x100)
+#define RK3576_OVL_MIX0_DST_COLOR_CTRL(vp)	(0x624 + (vp) * 0x100)
+#define RK3576_OVL_MIX0_SRC_ALPHA_CTRL(vp)	(0x628 + (vp) * 0x100)
+#define RK3576_OVL_MIX0_DST_ALPHA_CTRL(vp)	(0x62C + (vp) * 0x100)
+#define RK3576_OVL_MIX1_SRC_COLOR_CTRL(vp)	(0x630 + (vp) * 0x100)
+#define RK3576_OVL_MIX1_DST_COLOR_CTRL(vp)	(0x634 + (vp) * 0x100)
+#define RK3576_OVL_MIX1_SRC_ALPHA_CTRL(vp)	(0x638 + (vp) * 0x100)
+#define RK3576_OVL_MIX1_DST_ALPHA_CTRL(vp)	(0x63C + (vp) * 0x100)
+#define RK3576_OVL_MIX2_SRC_COLOR_CTRL(vp)	(0x640 + (vp) * 0x100)
+#define RK3576_OVL_MIX2_DST_COLOR_CTRL(vp)	(0x644 + (vp) * 0x100)
+#define RK3576_OVL_MIX2_SRC_ALPHA_CTRL(vp)	(0x648 + (vp) * 0x100)
+#define RK3576_OVL_MIX2_DST_ALPHA_CTRL(vp)	(0x64C + (vp) * 0x100)
+#define RK3576_EXTRA_OVL_SRC_COLOR_CTRL(vp)	(0x650 + (vp) * 0x100)
+#define RK3576_EXTRA_OVL_DST_COLOR_CTRL(vp)	(0x654 + (vp) * 0x100)
+#define RK3576_EXTRA_OVL_SRC_ALPHA_CTRL(vp)	(0x658 + (vp) * 0x100)
+#define RK3576_EXTRA_OVL_DST_ALPHA_CTRL(vp)	(0x65C + (vp) * 0x100)
+#define RK3576_OVL_HDR_SRC_COLOR_CTRL(vp)	(0x660 + (vp) * 0x100)
+#define RK3576_OVL_HDR_DST_COLOR_CTRL(vp)	(0x664 + (vp) * 0x100)
+#define RK3576_OVL_HDR_SRC_ALPHA_CTRL(vp)	(0x668 + (vp) * 0x100)
+#define RK3576_OVL_HDR_DST_ALPHA_CTRL(vp)	(0x66C + (vp) * 0x100)
+#define RK3576_OVL_BG_MIX_CTRL(vp)		(0x670 + (vp) * 0x100)
 
 /* Video Port registers definition */
 #define RK3568_VP0_CTRL_BASE			0x0C00
@@ -469,7 +538,11 @@ enum dst_factor_mode {
 #define RK3568_CLUSTER_WIN_AFBCD_DSP_OFFSET	0x68
 #define RK3568_CLUSTER_WIN_AFBCD_CTRL		0x6C
 
+#define RK3576_CLUSTER_WIN_AFBCD_PLD_PTR_OFFSET	0x78
+
 #define RK3568_CLUSTER_CTRL			0x100
+#define RK3576_CLUSTER_PORT_SEL_IMD		0x1F4
+#define RK3576_CLUSTER_DLY_NUM			0x1F8
 
 /* (E)smart register definition, offset relative to window base */
 #define RK3568_SMART_CTRL0			0x00
@@ -519,6 +592,9 @@ enum dst_factor_mode {
 #define RK3568_SMART_REGION3_SCL_FACTOR_CBR	0xC8
 #define RK3568_SMART_REGION3_SCL_OFFSET		0xCC
 #define RK3568_SMART_COLOR_KEY_CTRL		0xD0
+#define RK3576_SMART_ALPHA_MAP			0xD8
+#define RK3576_SMART_PORT_SEL_IMD		0xF4
+#define RK3576_SMART_DLY_NUM			0xF8
 
 /* HDR register definition */
 #define RK3568_HDR_LUT_CTRL			0x2000
@@ -662,6 +738,17 @@ enum dst_factor_mode {
 
 #define POLFLAG_DCLK_INV	BIT(3)
 
+#define RK3576_OVL_CTRL__YUV_MODE			BIT(0)
+#define RK3576_OVL_BG_MIX_CTRL__BG_DLY			GENMASK(31, 24)
+
+#define RK3576_DSP_IF_CFG_DONE_IMD			BIT(31)
+#define RK3576_DSP_IF_DCLK_SEL_OUT			BIT(21)
+#define RK3576_DSP_IF_PCLK_DIV				BIT(20)
+#define RK3576_DSP_IF_PIN_POL				GENMASK(5, 4)
+#define RK3576_DSP_IF_MUX				GENMASK(3, 2)
+#define RK3576_DSP_IF_CLK_OUT_EN			BIT(1)
+#define RK3576_DSP_IF_EN				BIT(0)
+
 enum vop2_layer_phy_id {
 	ROCKCHIP_VOP2_CLUSTER0 = 0,
 	ROCKCHIP_VOP2_CLUSTER1,
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 48cd29399df4..67e792dffcdc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -70,6 +70,37 @@ static const uint32_t formats_cluster[] = {
 	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
 };
 
+/*
+ * The cluster windows on rk3576 support:
+ * RGB: linear mode and afbc
+ * YUV: linear mode and rfbc
+ * rfbc is a rockchip defined non-linear mode, produced by
+ * Video decoder
+ */
+static const uint32_t formats_rk3576_cluster[] = {
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV21, /* yvu420_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV61, /* yvu422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV42, /* yvu444_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
+	DRM_FORMAT_NV20, /* yuv422_10bit linear mode, 2 plane, no padding */
+	DRM_FORMAT_NV30, /* yuv444_10bit linear mode, 2 plane, no padding */
+};
+
 static const uint32_t formats_esmart[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -116,6 +147,41 @@ static const uint32_t formats_rk356x_esmart[] = {
 	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
 };
 
+/*
+ * Add XRGB2101010/ARGB2101010ARGB1555/XRGB1555
+ */
+static const uint32_t formats_rk3576_esmart[] = {
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV21, /* yvu420_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV61, /* yvu422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV20, /* yuv422_10bit linear mode, 2 plane, no padding */
+	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV42, /* yvu444_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV30, /* yuv444_10bit linear mode, 2 plane, no padding */
+	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
+	DRM_FORMAT_YVYU, /* yuv422_8bit[YVYU] linear mode */
+	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
+	DRM_FORMAT_YUYV, /* yuv422_8bit[YUYV] linear mode */
+	DRM_FORMAT_UYVY, /* yuv422_8bit[UYVY] linear mode */
+};
+
 static const uint32_t formats_smart[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -169,6 +235,48 @@ static const uint64_t format_modifiers_afbc[] = {
 	DRM_FORMAT_MOD_INVALID,
 };
 
+/* used from rk3576, afbc 32*8 half mode */
+static const uint64_t format_modifiers_rk3576_afbc[] = {
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPLIT),
+
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_YTR |
+				AFBC_FORMAT_MOD_SPLIT),
+
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_CBR |
+				AFBC_FORMAT_MOD_SPLIT),
+
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_CBR |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_YTR |
+				AFBC_FORMAT_MOD_CBR |
+				AFBC_FORMAT_MOD_SPLIT),
+
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_YTR |
+				AFBC_FORMAT_MOD_CBR |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+
+	/* SPLIT mandates SPARSE, RGB modes mandates YTR */
+	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+				AFBC_FORMAT_MOD_YTR |
+				AFBC_FORMAT_MOD_SPARSE |
+				AFBC_FORMAT_MOD_SPLIT),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
+};
+
 static const struct reg_field rk3568_vop_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
@@ -293,6 +401,136 @@ static const struct reg_field rk3568_vop_smart_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_AFBC_ROTATE_90] = { .reg = 0xffffffff },
 };
 
+static const struct reg_field rk3576_vop_cluster_regs[VOP2_WIN_MAX_REG] = {
+	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
+	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
+	[VOP2_WIN_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 14, 14),
+	[VOP2_WIN_UV_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 17, 17),
+	[VOP2_WIN_DITHER_UP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 18, 18),
+	[VOP2_WIN_ACT_INFO] = REG_FIELD(RK3568_CLUSTER_WIN_ACT_INFO, 0, 31),
+	[VOP2_WIN_DSP_INFO] = REG_FIELD(RK3568_CLUSTER_WIN_DSP_INFO, 0, 31),
+	[VOP2_WIN_DSP_ST] = REG_FIELD(RK3568_CLUSTER_WIN_DSP_ST, 0, 31),
+	[VOP2_WIN_YRGB_MST] = REG_FIELD(RK3568_CLUSTER_WIN_YRGB_MST, 0, 31),
+	[VOP2_WIN_UV_MST] = REG_FIELD(RK3568_CLUSTER_WIN_CBR_MST, 0, 31),
+	[VOP2_WIN_YUV_CLIP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 19, 19),
+	[VOP2_WIN_YRGB_VIR] = REG_FIELD(RK3568_CLUSTER_WIN_VIR, 0, 15),
+	[VOP2_WIN_UV_VIR] = REG_FIELD(RK3568_CLUSTER_WIN_VIR, 16, 31),
+	[VOP2_WIN_Y2R_EN] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 8, 8),
+	[VOP2_WIN_R2Y_EN] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 9, 9),
+	[VOP2_WIN_CSC_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 10, 11),
+	[VOP2_WIN_VP_SEL] = REG_FIELD(RK3576_CLUSTER_PORT_SEL_IMD, 0, 1),
+	[VOP2_WIN_DLY_NUM] = REG_FIELD(RK3576_CLUSTER_DLY_NUM, 0, 7),
+
+	/* Scale */
+	[VOP2_WIN_SCALE_YRGB_X] = REG_FIELD(RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB, 0, 15),
+	[VOP2_WIN_SCALE_YRGB_Y] = REG_FIELD(RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB, 16, 31),
+	[VOP2_WIN_BIC_COE_SEL] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 2, 3),
+	[VOP2_WIN_YRGB_VER_SCL_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 14, 15),
+	[VOP2_WIN_YRGB_HOR_SCL_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 22, 23),
+	[VOP2_WIN_VSD_YRGB_GT2] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 28, 28),
+	[VOP2_WIN_VSD_YRGB_GT4] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL1, 29, 29),
+
+	/* cluster regs */
+	[VOP2_WIN_AFBC_ENABLE] = REG_FIELD(RK3568_CLUSTER_CTRL, 1, 1),
+	[VOP2_WIN_CLUSTER_ENABLE] = REG_FIELD(RK3568_CLUSTER_CTRL, 0, 0),
+	[VOP2_WIN_CLUSTER_LB_MODE] = REG_FIELD(RK3568_CLUSTER_CTRL, 4, 7),
+
+	/* afbc regs */
+	[VOP2_WIN_AFBC_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 2, 6),
+	[VOP2_WIN_AFBC_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 9, 9),
+	[VOP2_WIN_AFBC_UV_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 10, 10),
+	[VOP2_WIN_AFBC_AUTO_GATING_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_OUTPUT_CTRL, 4, 4),
+	[VOP2_WIN_AFBC_HALF_BLOCK_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 7, 7),
+	[VOP2_WIN_AFBC_BLOCK_SPLIT_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 8, 8),
+	[VOP2_WIN_AFBC_PLD_OFFSET_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 16, 16),
+	[VOP2_WIN_AFBC_HDR_PTR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_HDR_PTR, 0, 31),
+	[VOP2_WIN_AFBC_PIC_SIZE] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_SIZE, 0, 31),
+	[VOP2_WIN_AFBC_PIC_VIR_WIDTH] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 0, 15),
+	[VOP2_WIN_AFBC_TILE_NUM] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 16, 31),
+	[VOP2_WIN_AFBC_PIC_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_OFFSET, 0, 31),
+	[VOP2_WIN_AFBC_DSP_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_DSP_OFFSET, 0, 31),
+	[VOP2_WIN_AFBC_PLD_OFFSET] = REG_FIELD(RK3576_CLUSTER_WIN_AFBCD_PLD_PTR_OFFSET, 0, 31),
+	[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET, 0, 31),
+	[VOP2_WIN_AFBC_ROTATE_90] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 0, 0),
+	[VOP2_WIN_AFBC_ROTATE_270] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 1, 1),
+	[VOP2_WIN_XMIRROR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 2, 2),
+	[VOP2_WIN_YMIRROR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_ROTATE_MODE, 3, 3),
+	[VOP2_WIN_COLOR_KEY] = { .reg = 0xffffffff },
+	[VOP2_WIN_COLOR_KEY_EN] = { .reg = 0xffffffff },
+	[VOP2_WIN_SCALE_CBCR_X] = { .reg = 0xffffffff },
+	[VOP2_WIN_SCALE_CBCR_Y] = { .reg = 0xffffffff },
+	[VOP2_WIN_YRGB_HSCL_FILTER_MODE] = { .reg = 0xffffffff },
+	[VOP2_WIN_YRGB_VSCL_FILTER_MODE] = { .reg = 0xffffffff },
+	[VOP2_WIN_CBCR_VER_SCL_MODE] = { .reg = 0xffffffff },
+	[VOP2_WIN_CBCR_HSCL_FILTER_MODE] = { .reg = 0xffffffff },
+	[VOP2_WIN_CBCR_HOR_SCL_MODE] = { .reg = 0xffffffff },
+	[VOP2_WIN_CBCR_VSCL_FILTER_MODE] = { .reg = 0xffffffff },
+	[VOP2_WIN_VSD_CBCR_GT2] = { .reg = 0xffffffff },
+	[VOP2_WIN_VSD_CBCR_GT4] = { .reg = 0xffffffff },
+};
+
+static const struct reg_field rk3576_vop_smart_regs[VOP2_WIN_MAX_REG] = {
+	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 0, 0),
+	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 1, 5),
+	[VOP2_WIN_DITHER_UP] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 12, 12),
+	[VOP2_WIN_RB_SWAP] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 14, 14),
+	[VOP2_WIN_UV_SWAP] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 16, 16),
+	[VOP2_WIN_ACT_INFO] = REG_FIELD(RK3568_SMART_REGION0_ACT_INFO, 0, 31),
+	[VOP2_WIN_DSP_INFO] = REG_FIELD(RK3568_SMART_REGION0_DSP_INFO, 0, 31),
+	[VOP2_WIN_DSP_ST] = REG_FIELD(RK3568_SMART_REGION0_DSP_ST, 0, 28),
+	[VOP2_WIN_YRGB_MST] = REG_FIELD(RK3568_SMART_REGION0_YRGB_MST, 0, 31),
+	[VOP2_WIN_UV_MST] = REG_FIELD(RK3568_SMART_REGION0_CBR_MST, 0, 31),
+	[VOP2_WIN_YUV_CLIP] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 17, 17),
+	[VOP2_WIN_YRGB_VIR] = REG_FIELD(RK3568_SMART_REGION0_VIR, 0, 15),
+	[VOP2_WIN_UV_VIR] = REG_FIELD(RK3568_SMART_REGION0_VIR, 16, 31),
+	[VOP2_WIN_Y2R_EN] = REG_FIELD(RK3568_SMART_CTRL0, 0, 0),
+	[VOP2_WIN_R2Y_EN] = REG_FIELD(RK3568_SMART_CTRL0, 1, 1),
+	[VOP2_WIN_CSC_MODE] = REG_FIELD(RK3568_SMART_CTRL0, 2, 3),
+	[VOP2_WIN_YMIRROR] = REG_FIELD(RK3568_SMART_CTRL1, 31, 31),
+	[VOP2_WIN_COLOR_KEY] = REG_FIELD(RK3568_SMART_COLOR_KEY_CTRL, 0, 29),
+	[VOP2_WIN_COLOR_KEY_EN] = REG_FIELD(RK3568_SMART_COLOR_KEY_CTRL, 31, 31),
+	[VOP2_WIN_VP_SEL] = REG_FIELD(RK3576_SMART_PORT_SEL_IMD, 0, 1),
+	[VOP2_WIN_DLY_NUM] = REG_FIELD(RK3576_SMART_DLY_NUM, 0, 7),
+
+	/* Scale */
+	[VOP2_WIN_SCALE_YRGB_X] = REG_FIELD(RK3568_SMART_REGION0_SCL_FACTOR_YRGB, 0, 15),
+	[VOP2_WIN_SCALE_YRGB_Y] = REG_FIELD(RK3568_SMART_REGION0_SCL_FACTOR_YRGB, 16, 31),
+	[VOP2_WIN_SCALE_CBCR_X] = REG_FIELD(RK3568_SMART_REGION0_SCL_FACTOR_CBR, 0, 15),
+	[VOP2_WIN_SCALE_CBCR_Y] = REG_FIELD(RK3568_SMART_REGION0_SCL_FACTOR_CBR, 16, 31),
+	[VOP2_WIN_YRGB_HOR_SCL_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 0, 1),
+	[VOP2_WIN_YRGB_HSCL_FILTER_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 2, 3),
+	[VOP2_WIN_YRGB_VER_SCL_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 4, 5),
+	[VOP2_WIN_YRGB_VSCL_FILTER_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 6, 7),
+	[VOP2_WIN_CBCR_HOR_SCL_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 8, 9),
+	[VOP2_WIN_CBCR_HSCL_FILTER_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 10, 11),
+	[VOP2_WIN_CBCR_VER_SCL_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 12, 13),
+	[VOP2_WIN_CBCR_VSCL_FILTER_MODE] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 14, 15),
+	[VOP2_WIN_BIC_COE_SEL] = REG_FIELD(RK3568_SMART_REGION0_SCL_CTRL, 16, 17),
+	[VOP2_WIN_VSD_YRGB_GT2] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 8, 8),
+	[VOP2_WIN_VSD_YRGB_GT4] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 9, 9),
+	[VOP2_WIN_VSD_CBCR_GT2] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 10, 10),
+	[VOP2_WIN_VSD_CBCR_GT4] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 11, 11),
+	[VOP2_WIN_XMIRROR] = { .reg = 0xffffffff },
+	[VOP2_WIN_CLUSTER_ENABLE] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_ENABLE] = { .reg = 0xffffffff },
+	[VOP2_WIN_CLUSTER_LB_MODE] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_FORMAT] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_RB_SWAP] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_UV_SWAP] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_AUTO_GATING_EN] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_BLOCK_SPLIT_EN] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_PIC_VIR_WIDTH] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_TILE_NUM] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_PIC_OFFSET] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_PIC_SIZE] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_DSP_OFFSET] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_HDR_PTR] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_HALF_BLOCK_EN] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_ROTATE_270] = { .reg = 0xffffffff },
+	[VOP2_WIN_AFBC_ROTATE_90] = { .reg = 0xffffffff },
+};
+
 static const struct vop2_video_port_data rk3568_vop_video_ports[] = {
 	{
 		.id = 0,
@@ -688,27 +926,314 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
 		.base = 0x1e00,
-		.layer_sel_id =  { 7, 7, 7, 7 },
+		.layer_sel_id =  { 7, 7, 7, 7 },
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+		.dly = { 23, 45, 48 },
+	},
+};
+
+static const struct vop2_regs_dump rk3588_regs_dump[] = {
+	{
+		.name = "SYS",
+		.base = RK3568_REG_CFG_DONE,
+		.size = 0x100,
+		.en_reg  = 0,
+		.en_val = 0,
+		.en_mask = 0
+	}, {
+		.name = "OVL",
+		.base = RK3568_OVL_CTRL,
+		.size = 0x100,
+		.en_reg = 0,
+		.en_val = 0,
+		.en_mask = 0,
+	}, {
+		.name = "VP0",
+		.base = RK3568_VP0_CTRL_BASE,
+		.size = 0x100,
+		.en_reg = RK3568_VP_DSP_CTRL,
+		.en_val = 0,
+		.en_mask = RK3568_VP_DSP_CTRL__STANDBY,
+	}, {
+		.name = "VP1",
+		.base = RK3568_VP1_CTRL_BASE,
+		.size = 0x100,
+		.en_reg = RK3568_VP_DSP_CTRL,
+		.en_val = 0,
+		.en_mask = RK3568_VP_DSP_CTRL__STANDBY,
+	}, {
+		.name = "VP2",
+		.base = RK3568_VP2_CTRL_BASE,
+		.size = 0x100,
+		.en_reg = RK3568_VP_DSP_CTRL,
+		.en_val = 0,
+		.en_mask = RK3568_VP_DSP_CTRL__STANDBY,
+
+	}, {
+		.name = "VP3",
+		.base = RK3588_VP3_CTRL_BASE,
+		.size = 0x100,
+		.en_reg = RK3568_VP_DSP_CTRL,
+		.en_val = 0,
+		.en_mask = RK3568_VP_DSP_CTRL__STANDBY,
+	}, {
+		.name = "Cluster0",
+		.base = RK3568_CLUSTER0_CTRL_BASE,
+		.size = 0x110,
+		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
+		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+	}, {
+		.name = "Cluster1",
+		.base = RK3568_CLUSTER1_CTRL_BASE,
+		.size = 0x110,
+		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
+		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+	}, {
+		.name = "Cluster2",
+		.base = RK3588_CLUSTER2_CTRL_BASE,
+		.size = 0x110,
+		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
+		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+	}, {
+		.name = "Cluster3",
+		.base = RK3588_CLUSTER3_CTRL_BASE,
+		.size = 0x110,
+		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
+		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
+	}, {
+		.name = "Esmart0",
+		.base = RK3568_ESMART0_CTRL_BASE,
+		.size = 0xf0,
+		.en_reg = RK3568_SMART_REGION0_CTRL,
+		.en_val = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+		.en_mask = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+	}, {
+		.name = "Esmart1",
+		.base = RK3568_ESMART1_CTRL_BASE,
+		.size = 0xf0,
+		.en_reg = RK3568_SMART_REGION0_CTRL,
+		.en_val = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+		.en_mask = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+	}, {
+		.name = "Esmart2",
+		.base = RK3588_ESMART2_CTRL_BASE,
+		.size = 0xf0,
+		.en_reg = RK3568_SMART_REGION0_CTRL,
+		.en_val = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+		.en_mask = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+	}, {
+		.name = "Esmart3",
+		.base = RK3588_ESMART3_CTRL_BASE,
+		.size = 0xf0,
+		.en_reg = RK3568_SMART_REGION0_CTRL,
+		.en_val = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+		.en_mask = RK3568_SMART_REGION0_CTRL__WIN0_EN,
+	},
+};
+
+static const struct vop2_video_port_data rk3576_vop_video_ports[] = {
+	{
+		.id = 0,
+		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
+		.gamma_lut_len = 1024,
+		.cubic_lut_len = 9 * 9 * 9, /* 9x9x9 */
+		.max_output = { 4096, 2304 },
+		/* win layer_mix hdr  */
+		.pre_scan_max_dly = { 10, 8, 2, 0 },
+		.offset = 0xc00,
+		.pixel_rate = 2,
+	}, {
+		.id = 1,
+		.feature = VOP2_VP_FEATURE_OUTPUT_10BIT,
+		.gamma_lut_len = 1024,
+		.cubic_lut_len = 729, /* 9x9x9 */
+		.max_output = { 2560, 1600 },
+		/* win layer_mix hdr  */
+		.pre_scan_max_dly = { 10, 6, 0, 0 },
+		.offset = 0xd00,
+		.pixel_rate = 1,
+	}, {
+		.id = 2,
+		.gamma_lut_len = 1024,
+		.max_output = { 1920, 1080 },
+		/* win layer_mix hdr  */
+		.pre_scan_max_dly = { 10, 6, 0, 0 },
+		.offset = 0xe00,
+		.pixel_rate = 1,
+	},
+};
+
+/*
+ * rk3576 vop with 2 cluster, 4 esmart win.
+ * Every cluster can work as 4K win or split into two win.
+ * All win in cluster support AFBCD.
+ *
+ * Every esmart win support 4 Multi-region.
+ *
+ * VP0 can use Cluster0/1 and Esmart0/2
+ * VP1 can use Cluster0/1 and Esmart1/3
+ * VP2 can use Esmart0/1/2/3
+ *
+ * Scale filter mode:
+ *
+ * * Cluster:
+ * * Support prescale down:
+ * * H/V: gt2/avg2 or gt4/avg4
+ * * After prescale down:
+ *	* nearest-neighbor/bilinear/multi-phase filter for scale up
+ *	* nearest-neighbor/bilinear/multi-phase filter for scale down
+ *
+ * * Esmart:
+ * * Support prescale down:
+ * * H: gt2/avg2 or gt4/avg4
+ * * V: gt2 or gt4
+ * * After prescale down:
+ *	* nearest-neighbor/bilinear/bicubic for scale up
+ *	* nearest-neighbor/bilinear for scale down
+ *
+ * AXI config::
+ *
+ * * Cluster0 win0: 0xa,  0xb       [AXI0]
+ * * Cluster0 win1: 0xc,  0xd       [AXI0]
+ * * Cluster1 win0: 0x6,  0x7       [AXI0]
+ * * Cluster1 win1: 0x8,  0x9       [AXI0]
+ * * Esmart0:       0x10, 0x11      [AXI0]
+ * * Esmart1:       0x12, 0x13      [AXI0]
+ * * Esmart2:       0xa,  0xb       [AXI1]
+ * * Esmart3:       0xc,  0xd       [AXI1]
+ * * Lut dma rid:   0x1,  0x2,  0x3 [AXI0]
+ * * DCI dma rid:   0x4             [AXI0]
+ * * Metadata rid:  0x5             [AXI0]
+ *
+ * * Limit:
+ * * (1) 0x0 and 0xf can't be used;
+ * * (2) cluster and lut/dci/metadata rid must smaller than 0xf, If Cluster rid is bigger than 0xf,
+ * * VOP will dead at the system bandwidth very terrible scene.
+ */
+static const struct vop2_win_data rk3576_vop_win_data[] = {
+	{
+		.name = "Cluster0-win0",
+		.phys_id = ROCKCHIP_VOP2_CLUSTER0,
+		.base = 0x1000,
+		.possible_vp_mask = BIT(0) | BIT(1),
+		.formats = formats_rk3576_cluster,
+		.nformats = ARRAY_SIZE(formats_rk3576_cluster),
+		.format_modifiers = format_modifiers_rk3576_afbc,
+		.layer_sel_id = { 0, 0, 0xf, 0xf },
+		.supported_rotations =  DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
+		.max_upscale_factor = 4,
+		.max_downscale_factor = 4,
+		.type = DRM_PLANE_TYPE_PRIMARY,
+		.feature = WIN_FEATURE_AFBDC | WIN_FEATURE_CLUSTER,
+	}, {
+		.name = "Cluster1-win0",
+		.phys_id = ROCKCHIP_VOP2_CLUSTER1,
+		.base = 0x1200,
+		.possible_vp_mask = BIT(0) | BIT(1),
+		.formats = formats_rk3576_cluster,
+		.nformats = ARRAY_SIZE(formats_rk3576_cluster),
+		.format_modifiers = format_modifiers_rk3576_afbc,
+		.layer_sel_id = { 1, 1, 0xf, 0xf },
+		.supported_rotations =  DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_PRIMARY,
+		.max_upscale_factor = 4,
+		.max_downscale_factor = 4,
+		.feature = WIN_FEATURE_AFBDC | WIN_FEATURE_CLUSTER,
+	}, {
+		.name = "Esmart0-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART0,
+		.base = 0x1800,
+		.possible_vp_mask = BIT(0) | BIT(2),
+		.formats = formats_rk3576_esmart,
+		.nformats = ARRAY_SIZE(formats_rk3576_esmart),
+		.format_modifiers = format_modifiers,
+		.layer_sel_id = { 2, 0xf, 0, 0xf },
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+	}, {
+		.name = "Esmart1-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART1,
+		.base = 0x1a00,
+		.possible_vp_mask = BIT(1) | BIT(2),
+		.formats = formats_rk3576_esmart,
+		.nformats = ARRAY_SIZE(formats_rk3576_esmart),
+		.format_modifiers = format_modifiers,
+		.layer_sel_id = { 0xf, 2, 1, 0xf },
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+	}, {
+		.name = "Esmart2-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART2,
+		.base = 0x1c00,
+		.possible_vp_mask = BIT(0) | BIT(2),
+		.formats = formats_rk3576_esmart,
+		.nformats = ARRAY_SIZE(formats_rk3576_esmart),
+		.format_modifiers = format_modifiers,
+		.layer_sel_id = { 3, 0xf, 2, 0xf },
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+	}, {
+		.name = "Esmart3-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART3,
+		.base = 0x1e00,
+		.possible_vp_mask = BIT(1) | BIT(2),
+		.formats = formats_rk3576_esmart,
+		.nformats = ARRAY_SIZE(formats_rk3576_esmart),
+		.format_modifiers = format_modifiers,
+		.layer_sel_id = { 0xf, 3, 3, 0xf },
 		.supported_rotations = DRM_MODE_REFLECT_Y,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.max_upscale_factor = 8,
 		.max_downscale_factor = 8,
-		.dly = { 23, 45, 48 },
 	},
 };
 
-static const struct vop2_regs_dump rk3588_regs_dump[] = {
+static const struct vop2_regs_dump rk3576_regs_dump[] = {
 	{
 		.name = "SYS",
 		.base = RK3568_REG_CFG_DONE,
-		.size = 0x100,
+		.size = 0x200,
 		.en_reg  = 0,
 		.en_val = 0,
 		.en_mask = 0
 	}, {
-		.name = "OVL",
-		.base = RK3568_OVL_CTRL,
-		.size = 0x100,
+		.name = "OVL_SYS",
+		.base = RK3576_SYS_EXTRA_ALPHA_CTRL,
+		.size = 0x50,
+		.en_reg = 0,
+		.en_val = 0,
+		.en_mask = 0,
+	}, {
+		.name = "OVL_VP0",
+		.base = RK3576_OVL_CTRL(0),
+		.size = 0x80,
+		.en_reg = 0,
+		.en_val = 0,
+		.en_mask = 0,
+	}, {
+		.name = "OVL_VP1",
+		.base = RK3576_OVL_CTRL(1),
+		.size = 0x80,
+		.en_reg = 0,
+		.en_val = 0,
+		.en_mask = 0,
+	}, {
+		.name = "OVL_VP2",
+		.base = RK3576_OVL_CTRL(2),
+		.size = 0x80,
 		.en_reg = 0,
 		.en_val = 0,
 		.en_mask = 0,
@@ -733,39 +1258,17 @@ static const struct vop2_regs_dump rk3588_regs_dump[] = {
 		.en_reg = RK3568_VP_DSP_CTRL,
 		.en_val = 0,
 		.en_mask = RK3568_VP_DSP_CTRL__STANDBY,
-
-	}, {
-		.name = "VP3",
-		.base = RK3588_VP3_CTRL_BASE,
-		.size = 0x100,
-		.en_reg = RK3568_VP_DSP_CTRL,
-		.en_val = 0,
-		.en_mask = RK3568_VP_DSP_CTRL__STANDBY,
 	}, {
 		.name = "Cluster0",
 		.base = RK3568_CLUSTER0_CTRL_BASE,
-		.size = 0x110,
+		.size = 0x200,
 		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
 		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
 		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
 	}, {
 		.name = "Cluster1",
 		.base = RK3568_CLUSTER1_CTRL_BASE,
-		.size = 0x110,
-		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
-		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
-		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
-	}, {
-		.name = "Cluster2",
-		.base = RK3588_CLUSTER2_CTRL_BASE,
-		.size = 0x110,
-		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
-		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
-		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
-	}, {
-		.name = "Cluster3",
-		.base = RK3588_CLUSTER3_CTRL_BASE,
-		.size = 0x110,
+		.size = 0x200,
 		.en_reg = RK3568_CLUSTER_WIN_CTRL0,
 		.en_val = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
 		.en_mask = RK3568_CLUSTER_WIN_CTRL0__WIN0_EN,
@@ -1129,6 +1632,84 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
 	return clock;
 }
 
+static unsigned long rk3576_vop2_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
+{
+	struct vop2 *vop2 = vp->vop2;
+	struct drm_crtc *crtc = &vp->crtc;
+	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
+	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
+	u8 port_pix_rate = vp->data->pixel_rate;
+	int dclk_core_div, dclk_out_div, if_pixclk_div, if_dclk_sel;
+	u32 ctrl, vp_clk_div, reg, dclk_div;
+	unsigned long dclk_in_rate, dclk_core_rate;
+
+	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV420 || adjusted_mode->crtc_clock > 600000)
+		dclk_div = 2;
+	else
+		dclk_div = 1;
+
+	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLCLK)
+		dclk_core_rate = adjusted_mode->crtc_clock / 2;
+	else
+		dclk_core_rate = adjusted_mode->crtc_clock / port_pix_rate;
+
+	dclk_in_rate = adjusted_mode->crtc_clock / dclk_div;
+
+	dclk_core_div = dclk_in_rate > dclk_core_rate ? 1 : 0;
+
+	if (vop2_output_if_is_edp(id))
+		if_pixclk_div = port_pix_rate == 2 ? RK3576_DSP_IF_PCLK_DIV : 0;
+	else
+		if_pixclk_div = port_pix_rate == 1 ? RK3576_DSP_IF_PCLK_DIV : 0;
+
+	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV420) {
+		if_dclk_sel = RK3576_DSP_IF_DCLK_SEL_OUT;
+		dclk_out_div = 1;
+	} else {
+		if_dclk_sel = 0;
+		dclk_out_div = 0;
+	}
+
+	switch (id) {
+	case ROCKCHIP_VOP2_EP_HDMI0:
+		reg = RK3576_HDMI0_IF_CTRL;
+		break;
+	case ROCKCHIP_VOP2_EP_EDP0:
+		reg = RK3576_EDP0_IF_CTRL;
+		break;
+	case ROCKCHIP_VOP2_EP_MIPI0:
+		reg = RK3576_MIPI0_IF_CTRL;
+		break;
+	case ROCKCHIP_VOP2_EP_DP0:
+		reg = RK3576_DP0_IF_CTRL;
+		break;
+	case ROCKCHIP_VOP2_EP_DP1:
+		reg = RK3576_DP1_IF_CTRL;
+		break;
+	default:
+		drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
+		return 0;
+	}
+
+	ctrl = vop2_readl(vop2, reg);
+	ctrl &= ~RK3576_DSP_IF_DCLK_SEL_OUT;
+	ctrl &= ~RK3576_DSP_IF_PCLK_DIV;
+	ctrl &= ~RK3576_DSP_IF_MUX;
+	ctrl |= RK3576_DSP_IF_CFG_DONE_IMD;
+	ctrl |= if_dclk_sel | if_pixclk_div;
+	ctrl |= RK3576_DSP_IF_CLK_OUT_EN | RK3576_DSP_IF_EN;
+	ctrl |= FIELD_PREP(RK3576_DSP_IF_MUX, vp->id);
+	ctrl |= FIELD_PREP(RK3576_DSP_IF_PIN_POL, polflags);
+	vop2_writel(vop2, reg, ctrl);
+
+	vp_clk_div = FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_CORE_DIV, dclk_core_div);
+	vp_clk_div |= FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_OUT_DIV, dclk_out_div);
+
+	vop2_vp_write(vp, RK3588_VP_CLK_CTRL, vp_clk_div);
+
+	return dclk_in_rate * 1000LL;
+}
+
 static bool is_opaque(u16 alpha)
 {
 	return (alpha >> 8) == 0xff;
@@ -1215,6 +1796,7 @@ static void vop2_setup_cluster_alpha(struct vop2 *vop2, struct vop2_win *main_wi
 	struct drm_plane_state *bottom_win_pstate;
 	bool src_pixel_alpha_en = false;
 	u16 src_glb_alpha_val, dst_glb_alpha_val;
+	u32 src_color_ctrl_reg, dst_color_ctrl_reg, src_alpha_ctrl_reg, dst_alpha_ctrl_reg;
 	bool premulti_en = false;
 	bool swap = false;
 
@@ -1235,14 +1817,23 @@ static void vop2_setup_cluster_alpha(struct vop2 *vop2, struct vop2_win *main_wi
 	vop2_parse_alpha(&alpha_config, &alpha);
 
 	alpha.src_color_ctrl.bits.src_dst_swap = swap;
-	vop2_writel(vop2, RK3568_CLUSTER0_MIX_SRC_COLOR_CTRL + offset,
-		    alpha.src_color_ctrl.val);
-	vop2_writel(vop2, RK3568_CLUSTER0_MIX_DST_COLOR_CTRL + offset,
-		    alpha.dst_color_ctrl.val);
-	vop2_writel(vop2, RK3568_CLUSTER0_MIX_SRC_ALPHA_CTRL + offset,
-		    alpha.src_alpha_ctrl.val);
-	vop2_writel(vop2, RK3568_CLUSTER0_MIX_DST_ALPHA_CTRL + offset,
-		    alpha.dst_alpha_ctrl.val);
+
+	if (vop2->version <= VOP_VERSION_RK3588) {
+		src_color_ctrl_reg = RK3568_CLUSTER0_MIX_SRC_COLOR_CTRL;
+		dst_color_ctrl_reg = RK3568_CLUSTER0_MIX_DST_COLOR_CTRL;
+		src_alpha_ctrl_reg = RK3568_CLUSTER0_MIX_SRC_ALPHA_CTRL;
+		dst_alpha_ctrl_reg = RK3568_CLUSTER0_MIX_DST_ALPHA_CTRL;
+	} else {
+		src_color_ctrl_reg = RK3576_CLUSTER0_MIX_SRC_COLOR_CTRL;
+		dst_color_ctrl_reg = RK3576_CLUSTER0_MIX_DST_COLOR_CTRL;
+		src_alpha_ctrl_reg = RK3576_CLUSTER0_MIX_SRC_ALPHA_CTRL;
+		dst_alpha_ctrl_reg = RK3576_CLUSTER0_MIX_DST_ALPHA_CTRL;
+	}
+
+	vop2_writel(vop2, src_color_ctrl_reg + offset, alpha.src_color_ctrl.val);
+	vop2_writel(vop2, dst_color_ctrl_reg + offset, alpha.dst_color_ctrl.val);
+	vop2_writel(vop2, src_alpha_ctrl_reg + offset, alpha.src_alpha_ctrl.val);
+	vop2_writel(vop2, dst_alpha_ctrl_reg + offset, alpha.dst_alpha_ctrl.val);
 }
 
 static void rk3568_vop2_setup_alpha(struct vop2_video_port *vp)
@@ -1534,6 +2125,177 @@ static void rk3568_vop2_setup_overlay(struct vop2_video_port *vp)
 	rk3568_vop2_setup_dly_for_windows(vp);
 }
 
+static void rk3576_vop2_setup_alpha(struct vop2_video_port *vp)
+{
+	struct vop2 *vop2 = vp->vop2;
+	struct drm_framebuffer *fb;
+	struct vop2_alpha_config alpha_config;
+	struct vop2_alpha alpha;
+	struct drm_plane *plane;
+	int pixel_alpha_en;
+	int premulti_en, gpremulti_en = 0;
+	u32 offset;
+	bool bottom_layer_alpha_en = false;
+	u32 dst_global_alpha = DRM_BLEND_ALPHA_OPAQUE;
+
+	alpha_config.dst_pixel_alpha_en = true; /* alpha value need transfer to next mix */
+
+	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
+		struct vop2_win *win = to_vop2_win(plane);
+
+		if (plane->state->normalized_zpos == 0 &&
+		    !is_opaque(plane->state->alpha) &&
+		    !vop2_cluster_window(win)) {
+			/*
+			 * If bottom layer have global alpha effect [except cluster layer,
+			 * because cluster have deal with bottom layer global alpha value
+			 * at cluster mix], bottom layer mix need deal with global alpha.
+			 */
+			bottom_layer_alpha_en = true;
+			dst_global_alpha = plane->state->alpha;
+		}
+	}
+
+	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
+		struct vop2_win *win = to_vop2_win(plane);
+		int zpos = plane->state->normalized_zpos;
+
+		if (plane->state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
+			premulti_en = 1;
+		else
+			premulti_en = 0;
+
+		plane = &win->base;
+		fb = plane->state->fb;
+
+		pixel_alpha_en = fb->format->has_alpha;
+
+		alpha_config.src_premulti_en = premulti_en;
+
+		if (bottom_layer_alpha_en && zpos == 1) {
+			gpremulti_en = premulti_en;
+			/* Cd = Cs + (1 - As) * Cd * Agd */
+			alpha_config.dst_premulti_en = false;
+			alpha_config.src_pixel_alpha_en = pixel_alpha_en;
+			alpha_config.src_glb_alpha_value = plane->state->alpha;
+			alpha_config.dst_glb_alpha_value = dst_global_alpha;
+		} else if (vop2_cluster_window(win)) {
+			/* Mix output data only have pixel alpha */
+			alpha_config.dst_premulti_en = true;
+			alpha_config.src_pixel_alpha_en = true;
+			alpha_config.src_glb_alpha_value = DRM_BLEND_ALPHA_OPAQUE;
+			alpha_config.dst_glb_alpha_value = DRM_BLEND_ALPHA_OPAQUE;
+		} else {
+			/* Cd = Cs + (1 - As) * Cd */
+			alpha_config.dst_premulti_en = true;
+			alpha_config.src_pixel_alpha_en = pixel_alpha_en;
+			alpha_config.src_glb_alpha_value = plane->state->alpha;
+			alpha_config.dst_glb_alpha_value = DRM_BLEND_ALPHA_OPAQUE;
+		}
+
+		vop2_parse_alpha(&alpha_config, &alpha);
+
+		offset = (zpos - 1) * 0x10;
+		vop2_writel(vop2, RK3576_OVL_MIX0_SRC_COLOR_CTRL(vp->id) + offset,
+			    alpha.src_color_ctrl.val);
+		vop2_writel(vop2, RK3576_OVL_MIX0_DST_COLOR_CTRL(vp->id) + offset,
+			    alpha.dst_color_ctrl.val);
+		vop2_writel(vop2, RK3576_OVL_MIX0_SRC_ALPHA_CTRL(vp->id) + offset,
+			    alpha.src_alpha_ctrl.val);
+		vop2_writel(vop2, RK3576_OVL_MIX0_DST_ALPHA_CTRL(vp->id) + offset,
+			    alpha.dst_alpha_ctrl.val);
+	}
+
+	if (vp->id == 0) {
+		if (bottom_layer_alpha_en) {
+			/* Transfer pixel alpha to hdr mix */
+			alpha_config.src_premulti_en = gpremulti_en;
+			alpha_config.dst_premulti_en = true;
+			alpha_config.src_pixel_alpha_en = true;
+			alpha_config.src_glb_alpha_value = DRM_BLEND_ALPHA_OPAQUE;
+			alpha_config.dst_glb_alpha_value = DRM_BLEND_ALPHA_OPAQUE;
+			vop2_parse_alpha(&alpha_config, &alpha);
+
+			vop2_writel(vop2, RK3576_OVL_HDR_SRC_COLOR_CTRL(vp->id),
+				    alpha.src_color_ctrl.val);
+			vop2_writel(vop2, RK3576_OVL_HDR_DST_COLOR_CTRL(vp->id),
+				    alpha.dst_color_ctrl.val);
+			vop2_writel(vop2, RK3576_OVL_HDR_SRC_ALPHA_CTRL(vp->id),
+				    alpha.src_alpha_ctrl.val);
+			vop2_writel(vop2, RK3576_OVL_HDR_DST_ALPHA_CTRL(vp->id),
+				    alpha.dst_alpha_ctrl.val);
+		} else {
+			vop2_writel(vop2, RK3576_OVL_HDR_SRC_COLOR_CTRL(vp->id), 0);
+		}
+	}
+}
+
+static void rk3576_vop2_setup_layer_mixer(struct vop2_video_port *vp)
+{
+	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
+	struct vop2 *vop2 = vp->vop2;
+	struct drm_plane *plane;
+	u32 layer_sel = 0xffff;
+	u32 ovl_ctrl;
+
+	ovl_ctrl = vop2_readl(vop2, RK3576_OVL_CTRL(vp->id));
+	if (vcstate->yuv_overlay)
+		ovl_ctrl |= RK3576_OVL_CTRL__YUV_MODE;
+	else
+		ovl_ctrl &= ~RK3576_OVL_CTRL__YUV_MODE;
+
+	vop2_writel(vop2, RK3576_OVL_CTRL(vp->id), ovl_ctrl);
+
+	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
+		struct vop2_win *win = to_vop2_win(plane);
+
+		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos,
+							  0xf);
+		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(plane->state->normalized_zpos,
+							 win->data->layer_sel_id[vp->id]);
+	}
+
+	vop2_writel(vop2, RK3576_OVL_LAYER_SEL(vp->id), layer_sel);
+}
+
+static void rk3576_vop2_setup_dly_for_windows(struct vop2_video_port *vp)
+{
+	struct drm_plane *plane;
+	struct vop2_win *win;
+
+	drm_atomic_crtc_for_each_plane(plane, &vp->crtc) {
+		win = to_vop2_win(plane);
+		vop2_win_write(win, VOP2_WIN_DLY_NUM, 0);
+	}
+}
+
+static void rk3576_vop2_setup_overlay(struct vop2_video_port *vp)
+{
+	struct vop2 *vop2 = vp->vop2;
+	struct drm_crtc *crtc = &vp->crtc;
+	struct drm_plane *plane;
+
+	vp->win_mask = 0;
+
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		struct vop2_win *win = to_vop2_win(plane);
+
+		win->delay = win->data->dly[VOP2_DLY_MODE_DEFAULT];
+
+		vp->win_mask |= BIT(win->data->phys_id);
+
+		if (vop2_cluster_window(win))
+			vop2_setup_cluster_alpha(vop2, win);
+	}
+
+	if (!vp->win_mask)
+		return;
+
+	rk3576_vop2_setup_layer_mixer(vp);
+	rk3576_vop2_setup_alpha(vp);
+	rk3576_vop2_setup_dly_for_windows(vp);
+}
+
 static void rk3568_vop2_setup_bg_dly(struct vop2_video_port *vp)
 {
 	struct drm_crtc *crtc = &vp->crtc;
@@ -1551,6 +2313,26 @@ static void rk3568_vop2_setup_bg_dly(struct vop2_video_port *vp)
 	vop2_vp_write(vp, RK3568_VP_PRE_SCAN_HTIMING, pre_scan_dly);
 }
 
+static void rk3576_vop2_setup_bg_dly(struct vop2_video_port *vp)
+{
+	struct drm_crtc *crtc = &vp->crtc;
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	u16 hdisplay = mode->crtc_hdisplay;
+	u16 hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
+	u32 bg_dly;
+	u32 pre_scan_dly;
+
+	bg_dly = vp->data->pre_scan_max_dly[VOP2_DLY_WIN] +
+	vp->data->pre_scan_max_dly[VOP2_DLY_LAYER_MIX] +
+	vp->data->pre_scan_max_dly[VOP2_DLY_HDR_MIX];
+
+	vop2_writel(vp->vop2, RK3576_OVL_BG_MIX_CTRL(vp->id),
+		    FIELD_PREP(RK3576_OVL_BG_MIX_CTRL__BG_DLY, bg_dly));
+
+	pre_scan_dly = ((bg_dly + (hdisplay >> 1) - 1) << 16) | hsync_len;
+	vop2_vp_write(vp, RK3568_VP_PRE_SCAN_HTIMING, pre_scan_dly);
+}
+
 static const struct vop2_ops rk3568_vop_ops = {
 	.setup_intf_mux = rk3568_set_intf_mux,
 	.setup_bg_dly = rk3568_vop2_setup_bg_dly,
@@ -1563,6 +2345,12 @@ static const struct vop2_ops rk3588_vop_ops = {
 	.setup_overlay = rk3568_vop2_setup_overlay,
 };
 
+static const struct vop2_ops rk3576_vop_ops = {
+	.setup_intf_mux = rk3576_vop2_set_intf_mux,
+	.setup_bg_dly = rk3576_vop2_setup_bg_dly,
+	.setup_overlay = rk3576_vop2_setup_overlay,
+};
+
 static const struct vop2_data rk3566_vop = {
 	.version = VOP_VERSION_RK3568,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF,
@@ -1621,6 +2409,25 @@ static const struct vop2_data rk3588_vop = {
 	.soc_id = 3588,
 };
 
+static const struct vop2_data rk3576_vop = {
+	.version = VOP_VERSION_RK3576,
+	.feature = VOP2_FEATURE_HAS_SYS_PMU,
+	.nr_vps = 3,
+	.max_input = { 4096, 4320 },
+	.max_output = { 4096, 4320 },
+	.vp = rk3576_vop_video_ports,
+	.win = rk3576_vop_win_data,
+	.win_size = ARRAY_SIZE(rk3576_vop_win_data),
+	.cluster_reg = rk3576_vop_cluster_regs,
+	.nr_cluster_regs = ARRAY_SIZE(rk3576_vop_cluster_regs),
+	.smart_reg = rk3576_vop_smart_regs,
+	.nr_smart_regs = ARRAY_SIZE(rk3576_vop_smart_regs),
+	.regs_dump = rk3576_regs_dump,
+	.regs_dump_size = ARRAY_SIZE(rk3576_regs_dump),
+	.ops = &rk3576_vop_ops,
+	.soc_id = 3576,
+};
+
 static const struct of_device_id vop2_dt_match[] = {
 	{
 		.compatible = "rockchip,rk3566-vop",
@@ -1630,7 +2437,10 @@ static const struct of_device_id vop2_dt_match[] = {
 		.data = &rk3568_vop,
 	}, {
 		.compatible = "rockchip,rk3588-vop",
-		.data = &rk3588_vop
+		.data = &rk3588_vop,
+	}, {
+		.compatible = "rockchip,rk3576-vop",
+		.data = &rk3576_vop
 	}, {
 	},
 };
-- 
2.34.1

