Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A537EAEFC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 12:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EA310E204;
	Tue, 14 Nov 2023 11:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F3A510E204
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JJDkv
 24hHzhL3K17KTAhcbp3d3fqONP6I9J86CC5jUY=; b=Tw0zY38+MlVcZYgyAv7LN
 68stCVMI0UEddw07tpazLxeBtakFMrkDospVYL6ez3dLHGKtT6wNMcT9U18OTq/l
 gM51dpKXU8X5fd1OwfT991Blg5cLDM5R5us03n05gUOmgIoIUXNKTa6L0sNvt+3z
 /Hoay9o7SEQ5YtSnRBuZ1Q=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wDXHyv4WVNlSjNjDA--.57954S2;
 Tue, 14 Nov 2023 19:29:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH 09/11] drm/rockchip: vop2: Add support for rk3588
Date: Tue, 14 Nov 2023 19:28:55 +0800
Message-Id: <20231114112855.1771372-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114112534.1770731-1-andyshrk@163.com>
References: <20231114112534.1770731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXHyv4WVNlSjNjDA--.57954S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfXFy8Wr1rtr4UCFW5GF17ZFb_yoW5CF1kXo
 W7C3W3Xw1rtw1fCwsrWr1Sqa43uw4xAa1xurZrZws3XanIgw4UKryIqasFvF12y3yakFW3
 Ar1vqw1rXFWfA3Wxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU31vVDUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEAAoXl8YMdm7pQAAsX
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

VOP2 on rk3588:

Four video ports:
VP0 Max 4096x2160
VP1 Max 4096x2160
VP2 Max 4096x2160
VP3 Max 2048x1080

4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
4 4K Esmart windows with line RGB/YUV support

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 324 ++++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  57 ++++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 215 ++++++++++++
 include/dt-bindings/soc/rockchip,vop2.h      |   4 +
 4 files changed, 593 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 0d7dc543bef3..ba61c0233937 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -191,6 +191,9 @@ struct vop2 {
 	struct regmap *map;
 
 	struct regmap *sys_grf;
+	struct regmap *vop_grf;
+	struct regmap *vo1_grf;
+	struct regmap *sys_pmu;
 
 	/* physical map length of vop2 register */
 	u32 len;
@@ -209,6 +212,7 @@ struct vop2 {
 	unsigned int enable_count;
 	struct clk *hclk;
 	struct clk *aclk;
+	struct clk *pclk;
 
 	/* optional internal rgb encoder */
 	struct rockchip_rgb *rgb;
@@ -217,6 +221,13 @@ struct vop2 {
 	struct vop2_win win[];
 };
 
+#define vop2_output_if_is_hdmi(x)	(x == ROCKCHIP_VOP2_EP_HDMI0 || x == ROCKCHIP_VOP2_EP_HDMI1)
+#define vop2_output_if_is_dp(x)		(x == ROCKCHIP_VOP2_EP_DP0 || x == ROCKCHIP_VOP2_EP_DP1)
+#define vop2_output_if_is_edp(x)	(x == ROCKCHIP_VOP2_EP_EDP0 || x == ROCKCHIP_VOP2_EP_EDP1)
+#define vop2_output_if_is_mipi(x)	(x == ROCKCHIP_VOP2_EP_MIPI0 || x == ROCKCHIP_VOP2_EP_MIPI1)
+#define vop2_output_if_is_lvds(x)	(x == ROCKCHIP_VOP2_EP_LVDS0 || x == ROCKCHIP_VOP2_EP_LVDS1)
+#define vop2_output_if_is_dpi(x)	(x == ROCKCHIP_VOP2_EP_RGB0)
+
 static const struct regmap_config vop2_regmap_config;
 
 static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
@@ -271,9 +282,12 @@ static bool vop2_cluster_window(const struct vop2_win *win)
 static void vop2_cfg_done(struct vop2_video_port *vp)
 {
 	struct vop2 *vop2 = vp->vop2;
+	u32 val;
 
-	regmap_set_bits(vop2->map, RK3568_REG_CFG_DONE,
-			BIT(vp->id) | RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
+	val = BIT(vp->id) | (BIT(vp->id) << 16) |
+		RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN;
+
+	regmap_set_bits(vop2->map, RK3568_REG_CFG_DONE, val);
 }
 
 static void vop2_win_disable(struct vop2_win *win)
@@ -863,13 +877,32 @@ static int vop2_core_clks_prepare_enable(struct vop2 *vop2)
 		goto err;
 	}
 
+	ret = clk_prepare_enable(vop2->pclk);
+	if (ret < 0) {
+		drm_err(vop2->drm, "failed to enable pclk - %d\n", ret);
+		goto err1;
+	}
+
 	return 0;
+err1:
+	clk_disable_unprepare(vop2->aclk);
 err:
 	clk_disable_unprepare(vop2->hclk);
 
 	return ret;
 }
 
+static void vop2_power_domain_all_on(struct vop2 *vop2)
+{
+	u32 pd;
+
+	pd = vop2_readl(vop2, RK3588_SYS_PD_CTRL);
+	pd &= ~(VOP2_PD_CLUSTER0 | VOP2_PD_CLUSTER1 | VOP2_PD_CLUSTER2 |
+		VOP2_PD_CLUSTER3 | VOP2_PD_ESMART);
+
+	vop2_writel(vop2, RK3588_SYS_PD_CTRL, pd);
+}
+
 static void vop2_enable(struct vop2 *vop2)
 {
 	int ret;
@@ -901,6 +934,9 @@ static void vop2_enable(struct vop2 *vop2)
 	if (vop2->data->soc_id == 3566)
 		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
 
+	if (vop2->data->soc_id == 3588)
+		vop2_power_domain_all_on(vop2);
+
 	vop2_writel(vop2, RK3568_REG_CFG_DONE, RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
 
 	/*
@@ -926,6 +962,7 @@ static void vop2_disable(struct vop2 *vop2)
 
 	pm_runtime_put_sync(vop2->dev);
 
+	clk_disable_unprepare(vop2->pclk);
 	clk_disable_unprepare(vop2->aclk);
 	clk_disable_unprepare(vop2->hclk);
 }
@@ -1293,7 +1330,11 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 1);
 		vop2_win_write(win, VOP2_WIN_AFBC_FORMAT, afbc_format);
 		vop2_win_write(win, VOP2_WIN_AFBC_UV_SWAP, uv_swap);
-		vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 0);
+		if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+			vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 0);
+		else
+			vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 1);
+
 		vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 0);
 		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en);
 		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
@@ -1481,10 +1522,10 @@ static void vop2_post_config(struct drm_crtc *crtc)
 	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
 }
 
-static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
-				u32 polflags)
+static unsigned long rk3568_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
 {
 	struct vop2 *vop2 = vp->vop2;
+	struct drm_crtc *crtc = &vp->crtc;
 	u32 die, dip;
 
 	die = vop2_readl(vop2, RK3568_DSP_IF_EN);
@@ -1546,13 +1587,257 @@ static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
 		break;
 	default:
 		drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
-		return;
+		return 0;
+	}
+
+	dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
+
+	vop2_writel(vop2, RK3568_DSP_IF_EN, die);
+	vop2_writel(vop2, RK3568_DSP_IF_POL, dip);
+
+	return crtc->state->adjusted_mode.crtc_clock  * 1000LL;
+}
+
+/*
+ * calc the dclk on rk3588
+ * the available div of dclk is 1, 2, 4
+ */
+static unsigned long vop2_calc_dclk(unsigned long child_clk, unsigned long max_dclk)
+{
+	if (child_clk * 4 <= max_dclk)
+		return child_clk * 4;
+	else if (child_clk * 2 <= max_dclk)
+		return child_clk * 2;
+	else if (child_clk <= max_dclk)
+		return child_clk;
+	else
+		return 0;
+}
+
+/*
+ * 4 pixclk/cycle on rk3588
+ * RGB/eDP/HDMI: if_pixclk >= dclk_core
+ * DP: dp_pixclk = dclk_out <= dclk_core
+ * DSI: mipi_pixclk <= dclk_out <= dclk_core
+ */
+static unsigned long vop2_calc_cru_cfg(struct vop2_video_port *vp, int id,
+				       int *dclk_core_div, int *dclk_out_div,
+				       int *if_pixclk_div, int *if_dclk_div)
+{
+	struct vop2 *vop2 = vp->vop2;
+	struct drm_crtc *crtc = &vp->crtc;
+	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
+	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
+	int output_mode = vcstate->output_mode;
+	unsigned long v_pixclk = adjusted_mode->crtc_clock * 1000LL; /* video timing pixclk */
+	unsigned long dclk_core_rate = v_pixclk >> 2;
+	unsigned long dclk_rate = v_pixclk;
+	unsigned long dclk_out_rate;
+	unsigned long if_dclk_rate;
+	unsigned long if_pixclk_rate;
+	int K = 1;
+
+	if (vop2_output_if_is_hdmi(id)) {
+		/*
+		 * K = 2: dclk_core = if_pixclk_rate > if_dclk_rate
+		 * K = 1: dclk_core = hdmie_edp_dclk > if_pixclk_rate
+		 */
+		if (output_mode == ROCKCHIP_OUT_MODE_YUV420) {
+			dclk_rate = dclk_rate >> 1;
+			K = 2;
+		}
+
+		if_pixclk_rate = (dclk_core_rate << 1) / K;
+		if_dclk_rate = dclk_core_rate / K;
+
+		*if_pixclk_div = dclk_rate / if_pixclk_rate;
+		*if_dclk_div = dclk_rate / if_dclk_rate;
+		*dclk_core_div = dclk_rate / dclk_core_rate;
+	} else if (vop2_output_if_is_edp(id)) {
+		/* edp_pixclk = edp_dclk > dclk_core */
+		if_pixclk_rate = v_pixclk / K;
+		if_dclk_rate = v_pixclk / K;
+		dclk_rate = if_pixclk_rate * K;
+		*dclk_core_div = dclk_rate / dclk_core_rate;
+		*if_pixclk_div = dclk_rate / if_pixclk_rate;
+		*if_dclk_div = *if_pixclk_div;
+	} else if (vop2_output_if_is_dp(id)) {
+		if (output_mode == ROCKCHIP_OUT_MODE_YUV420)
+			dclk_out_rate = v_pixclk >> 3;
+		else
+			dclk_out_rate = v_pixclk >> 2;
+
+		dclk_rate = vop2_calc_dclk(dclk_out_rate, 600000);
+		if (!dclk_rate) {
+			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld KHZ\n",
+				dclk_out_rate);
+			return -EINVAL;
+		}
+		*dclk_out_div = dclk_rate / dclk_out_rate;
+		*dclk_core_div = dclk_rate / dclk_core_rate;
+	} else if (vop2_output_if_is_mipi(id)) {
+		if_pixclk_rate = dclk_core_rate / K;
+		/* dclk_core = dclk_out * K = if_pixclk * K = v_pixclk / 4 */
+		dclk_out_rate = if_pixclk_rate;
+		/* dclk_rate = N * dclk_core_rate N = (1,2,4 ), we get a little factor here */
+		dclk_rate = vop2_calc_dclk(dclk_out_rate, 600000);
+		if (!dclk_rate) {
+			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld KHZ\n",
+				dclk_out_rate);
+			return -EINVAL;
+		}
+		*dclk_out_div = dclk_rate / dclk_out_rate;
+		*dclk_core_div = dclk_rate / dclk_core_rate;
+		*if_pixclk_div = 1;       /*mipi pixclk == dclk_out*/
+	} else if (vop2_output_if_is_dpi(id)) {
+		dclk_rate = v_pixclk;
+		*dclk_core_div = dclk_rate / dclk_core_rate;
+	}
+
+	*if_pixclk_div = ilog2(*if_pixclk_div);
+	*if_dclk_div = ilog2(*if_dclk_div);
+	*dclk_core_div = ilog2(*dclk_core_div);
+	*dclk_out_div = ilog2(*dclk_out_div);
+
+	drm_dbg(vop2->drm, "dclk:%ld, pixclk_div;%d,dclk_div:%d\n",
+		dclk_rate, *if_pixclk_div, *if_dclk_div);
+
+	return dclk_rate;
+}
+
+/*
+ * MIPI port mux on rk3588:
+ * 0: Video Port2
+ * 1: Video Port3
+ * 3: Video Port 1(MIPI1 only)
+ */
+static u32 rk3588_get_mipi_port_mux(int vp_id)
+{
+	if (vp_id == 1)
+		return 3;
+	else if (vp_id == 3)
+		return 1;
+	else
+		return 0;
+}
+
+static u32 rk3588_get_hdmi_pol(u32 flags)
+{
+	u32 val;
+
+	val = (flags & DRM_MODE_FLAG_NHSYNC) ? BIT(HSYNC_POSITIVE) : 0;
+	val |= (flags & DRM_MODE_FLAG_NVSYNC) ? BIT(VSYNC_POSITIVE) : 0;
+
+	return val;
+}
+
+static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
+{
+	struct vop2 *vop2 = vp->vop2;
+	int dclk_core_div, dclk_out_div, if_pixclk_div, if_dclk_div;
+	unsigned long clock;
+	u32 die, dip, div, vp_clk_div, val;
+
+	clock = vop2_calc_cru_cfg(vp, id, &dclk_core_div, &dclk_out_div,
+				  &if_pixclk_div, &if_dclk_div);
+
+	vp_clk_div = FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_CORE_DIV, dclk_core_div);
+	vp_clk_div |= FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_OUT_DIV, dclk_out_div);
+
+	die = vop2_readl(vop2, RK3568_DSP_IF_EN);
+	dip = vop2_readl(vop2, RK3568_DSP_IF_POL);
+	div = vop2_readl(vop2, RK3568_DSP_IF_CTRL);
+
+	switch (id) {
+	case ROCKCHIP_VOP2_EP_HDMI0:
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_HDMI0 |
+			    FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX, vp->id);
+		val = rk3588_get_hdmi_pol(polflags);
+		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 1, 1));
+		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0, HIWORD_UPDATE(val, 6, 5));
+		break;
+	case ROCKCHIP_VOP2_EP_HDMI1:
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV, if_dclk_div);
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV, if_pixclk_div);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_HDMI1 |
+			    FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX, vp->id);
+		val = rk3588_get_hdmi_pol(polflags);
+		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 4, 4));
+		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0, HIWORD_UPDATE(val, 8, 7));
+		break;
+	case ROCKCHIP_VOP2_EP_EDP0:
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_EDP0 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX, vp->id);
+		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 0, 0));
+		break;
+	case ROCKCHIP_VOP2_EP_EDP1:
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
+		div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_EDP1 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX, vp->id);
+		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 3, 3));
+		break;
+	case ROCKCHIP_VOP2_EP_MIPI0:
+		div |= FIELD_PREP(RK3588_DSP_IF_MIPI0_PCLK_DIV, if_pixclk_div);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI0_MUX;
+		val = rk3588_get_mipi_port_mux(vp->id);
+		die |= RK3588_SYS_DSP_INFACE_EN_MIPI0 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI0_MUX, !!val);
+		break;
+	case ROCKCHIP_VOP2_EP_MIPI1:
+		div |= FIELD_PREP(RK3588_DSP_IF_MIPI1_PCLK_DIV, if_pixclk_div);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
+		val = rk3588_get_mipi_port_mux(vp->id);
+		die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, val);
+		break;
+	case ROCKCHIP_VOP2_EP_DP0:
+		die &= ~RK3588_SYS_DSP_INFACE_EN_DP0_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_DP0 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_DP0_MUX, vp->id);
+		dip &= ~RK3588_DSP_IF_POL__DP0_PIN_POL;
+		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP0_PIN_POL, polflags);
+		break;
+	case ROCKCHIP_VOP2_EP_DP1:
+		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
+		dip &= ~RK3588_DSP_IF_POL__DP1_PIN_POL;
+		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP1_PIN_POL, polflags);
+		break;
+	default:
+		drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
+		return 0;
 	}
 
 	dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
 
+	vop2_vp_write(vp, RK3588_VP_CLK_CTRL, vp_clk_div);
 	vop2_writel(vop2, RK3568_DSP_IF_EN, die);
+	vop2_writel(vop2, RK3568_DSP_IF_CTRL, div);
 	vop2_writel(vop2, RK3568_DSP_IF_POL, dip);
+
+	return clock;
+}
+
+static unsigned long vop2_set_intf_mux(struct vop2_video_port *vp, int ep_id, u32 polflags)
+{
+	struct vop2 *vop2 = vp->vop2;
+
+	if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+		return rk3568_set_intf_mux(vp, ep_id, polflags);
+	else if (vop2->data->soc_id == 3588)
+		return rk3588_set_intf_mux(vp, ep_id, polflags);
+	else
+		return 0;
 }
 
 static int us_to_vertical_line(struct drm_display_mode *mode, int us)
@@ -1622,7 +1907,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
 		struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
 
-		rk3568_set_intf_mux(vp, rkencoder->crtc_endpoint_id, polflags);
+		clock = vop2_set_intf_mux(vp, rkencoder->crtc_endpoint_id, polflags);
 	}
 
 	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
@@ -2011,6 +2296,14 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 			port_sel &= ~RK3568_OVL_PORT_SEL__CLUSTER1;
 			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__CLUSTER1, vp->id);
 			break;
+		case ROCKCHIP_VOP2_CLUSTER2:
+			port_sel &= ~RK3588_OVL_PORT_SEL__CLUSTER2;
+			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__CLUSTER2, vp->id);
+			break;
+		case ROCKCHIP_VOP2_CLUSTER3:
+			port_sel &= ~RK3588_OVL_PORT_SEL__CLUSTER3;
+			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__CLUSTER3, vp->id);
+			break;
 		case ROCKCHIP_VOP2_ESMART0:
 			port_sel &= ~RK3568_OVL_PORT_SEL__ESMART0;
 			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__ESMART0, vp->id);
@@ -2019,6 +2312,14 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 			port_sel &= ~RK3568_OVL_PORT_SEL__ESMART1;
 			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__ESMART1, vp->id);
 			break;
+		case ROCKCHIP_VOP2_ESMART2:
+			port_sel &= ~RK3588_OVL_PORT_SEL__ESMART2;
+			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__ESMART2, vp->id);
+			break;
+		case ROCKCHIP_VOP2_ESMART3:
+			port_sel &= ~RK3588_OVL_PORT_SEL__ESMART3;
+			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SEL__ESMART3, vp->id);
+			break;
 		case ROCKCHIP_VOP2_SMART0:
 			port_sel &= ~RK3568_OVL_PORT_SEL__SMART0;
 			port_sel |= FIELD_PREP(RK3568_OVL_PORT_SEL__SMART0, vp->id);
@@ -2760,6 +3061,9 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	vop2->sys_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
+	vop2->vop_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vop-grf");
+	vop2->vo1_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vo1-grf");
+	vop2->sys_pmu = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,pmu");
 
 	vop2->hclk = devm_clk_get(vop2->dev, "hclk");
 	if (IS_ERR(vop2->hclk)) {
@@ -2773,6 +3077,12 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(vop2->aclk);
 	}
 
+	vop2->pclk = devm_clk_get_optional(vop2->dev, "pclk_vop");
+	if (IS_ERR(vop2->pclk)) {
+		drm_err(vop2->drm, "failed to get pclk source\n");
+		return PTR_ERR(vop2->pclk);
+	}
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0) {
 		drm_err(vop2->drm, "cannot find irq for vop2\n");
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 7175f46a2014..2fffe580b215 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -16,6 +16,7 @@
 #define WIN_FEATURE_AFBDC		BIT(0)
 #define WIN_FEATURE_CLUSTER		BIT(1)
 
+#define HIWORD_UPDATE(v, h, l)  ((GENMASK(h, l) << 16) | ((v) << (l)))
 /*
  *  the delay number of a window in different mode.
  */
@@ -38,6 +39,18 @@ enum vop2_scale_down_mode {
 	VOP2_SCALE_DOWN_AVG,
 };
 
+/*
+ * vop2 internal power domain id,
+ * should be all none zero, 0 will be treat as invalid;
+ */
+#define VOP2_PD_CLUSTER0	BIT(0)
+#define VOP2_PD_CLUSTER1	BIT(1)
+#define VOP2_PD_CLUSTER2	BIT(2)
+#define VOP2_PD_CLUSTER3	BIT(3)
+#define VOP2_PD_DSC_8K		BIT(5)
+#define VOP2_PD_DSC_4K		BIT(6)
+#define VOP2_PD_ESMART		BIT(7)
+
 enum vop2_win_regs {
 	VOP2_WIN_ENABLE,
 	VOP2_WIN_FORMAT,
@@ -192,6 +205,11 @@ enum dst_factor_mode {
 };
 
 #define RK3568_GRF_VO_CON1			0x0364
+
+#define RK3588_GRF_SOC_CON1			0x0304
+#define RK3588_GRF_VOP_CON2			0x08
+#define RK3588_GRF_VO1_CON0			0x00
+
 /* System registers definition */
 #define RK3568_REG_CFG_DONE			0x000
 #define RK3568_VERSION_INFO			0x004
@@ -200,6 +218,7 @@ enum dst_factor_mode {
 #define RK3568_DSP_IF_EN			0x028
 #define RK3568_DSP_IF_CTRL			0x02c
 #define RK3568_DSP_IF_POL			0x030
+#define RK3588_SYS_PD_CTRL			0x034
 #define RK3568_WB_CTRL				0x40
 #define RK3568_WB_XSCAL_FACTOR			0x44
 #define RK3568_WB_YRGB_MST			0x48
@@ -223,6 +242,7 @@ enum dst_factor_mode {
 #define RK3568_VP_DSP_CTRL			0x00
 #define RK3568_VP_MIPI_CTRL			0x04
 #define RK3568_VP_COLOR_BAR_CTRL		0x08
+#define RK3588_VP_CLK_CTRL			0x0C
 #define RK3568_VP_3D_LUT_CTRL			0x10
 #define RK3568_VP_3D_LUT_MST			0x20
 #define RK3568_VP_DSP_BG			0x2C
@@ -364,6 +384,9 @@ enum dst_factor_mode {
 #define RK3568_VP_DSP_CTRL__CORE_DCLK_DIV		BIT(4)
 #define RK3568_VP_DSP_CTRL__OUT_MODE			GENMASK(3, 0)
 
+#define RK3588_VP_CLK_CTRL__DCLK_OUT_DIV		GENMASK(3, 2)
+#define RK3588_VP_CLK_CTRL__DCLK_CORE_DIV		GENMASK(1, 0)
+
 #define RK3568_VP_POST_SCL_CTRL__VSCALEDOWN		BIT(1)
 #define RK3568_VP_POST_SCL_CTRL__HSCALEDOWN		BIT(0)
 
@@ -382,11 +405,37 @@ enum dst_factor_mode {
 #define RK3568_SYS_DSP_INFACE_EN_HDMI			BIT(1)
 #define RK3568_SYS_DSP_INFACE_EN_RGB			BIT(0)
 
+#define RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX		GENMASK(22, 21)
+#define RK3588_SYS_DSP_INFACE_EN_MIPI0_MUX		GENMASK(20, 20)
+#define RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX		GENMASK(19, 18)
+#define RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX		GENMASK(17, 16)
+#define RK3588_SYS_DSP_INFACE_EN_DP1_MUX		GENMASK(15, 14)
+#define RK3588_SYS_DSP_INFACE_EN_DP0_MUX		GENMASK(13, 12)
+#define RK3588_SYS_DSP_INFACE_EN_DPI			GENMASK(9, 8)
+#define RK3588_SYS_DSP_INFACE_EN_MIPI1			BIT(7)
+#define RK3588_SYS_DSP_INFACE_EN_MIPI0			BIT(6)
+#define RK3588_SYS_DSP_INFACE_EN_HDMI1			BIT(5)
+#define RK3588_SYS_DSP_INFACE_EN_EDP1			BIT(4)
+#define RK3588_SYS_DSP_INFACE_EN_HDMI0			BIT(3)
+#define RK3588_SYS_DSP_INFACE_EN_EDP0			BIT(2)
+#define RK3588_SYS_DSP_INFACE_EN_DP1			BIT(1)
+#define RK3588_SYS_DSP_INFACE_EN_DP0			BIT(0)
+
+#define RK3588_DSP_IF_MIPI1_PCLK_DIV			GENMASK(27, 26)
+#define RK3588_DSP_IF_MIPI0_PCLK_DIV			GENMASK(25, 24)
+#define RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV		GENMASK(22, 22)
+#define RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV		GENMASK(21, 20)
+#define RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV		GENMASK(18, 18)
+#define RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV		GENMASK(17, 16)
+
 #define RK3568_DSP_IF_POL__MIPI_PIN_POL			GENMASK(19, 16)
 #define RK3568_DSP_IF_POL__EDP_PIN_POL			GENMASK(15, 12)
 #define RK3568_DSP_IF_POL__HDMI_PIN_POL			GENMASK(7, 4)
 #define RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL		GENMASK(3, 0)
 
+#define RK3588_DSP_IF_POL__DP1_PIN_POL			GENMASK(14, 12)
+#define RK3588_DSP_IF_POL__DP0_PIN_POL			GENMASK(10, 8)
+
 #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2_PHASE_LOCK	BIT(5)
 #define RK3568_VP0_MIPI_CTRL__DCLK_DIV2			BIT(4)
 
@@ -407,8 +456,12 @@ enum dst_factor_mode {
 #define RK3568_OVL_PORT_SEL__SEL_PORT			GENMASK(31, 16)
 #define RK3568_OVL_PORT_SEL__SMART1			GENMASK(31, 30)
 #define RK3568_OVL_PORT_SEL__SMART0			GENMASK(29, 28)
+#define RK3588_OVL_PORT_SEL__ESMART3			GENMASK(31, 30)
+#define RK3588_OVL_PORT_SEL__ESMART2			GENMASK(29, 28)
 #define RK3568_OVL_PORT_SEL__ESMART1			GENMASK(27, 26)
 #define RK3568_OVL_PORT_SEL__ESMART0			GENMASK(25, 24)
+#define RK3588_OVL_PORT_SEL__CLUSTER3			GENMASK(23, 22)
+#define RK3588_OVL_PORT_SEL__CLUSTER2			GENMASK(21, 20)
 #define RK3568_OVL_PORT_SEL__CLUSTER1			GENMASK(19, 18)
 #define RK3568_OVL_PORT_SEL__CLUSTER0			GENMASK(17, 16)
 #define RK3568_OVL_PORT_SET__PORT2_MUX			GENMASK(11, 8)
@@ -421,6 +474,10 @@ enum dst_factor_mode {
 #define RK3568_CLUSTER_DLY_NUM__CLUSTER0_1		GENMASK(15, 8)
 #define RK3568_CLUSTER_DLY_NUM__CLUSTER0_0		GENMASK(7, 0)
 
+#define RK3568_CLUSTER_WIN_CTRL0__WIN0_EN		BIT(0)
+
+#define RK3568_SMART_REGION0_CTRL__WIN0_EN		BIT(0)
+
 #define RK3568_SMART_DLY_NUM__SMART1			GENMASK(31, 24)
 #define RK3568_SMART_DLY_NUM__SMART0			GENMASK(23, 16)
 #define RK3568_SMART_DLY_NUM__ESMART1			GENMASK(15, 8)
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 22288ad7f326..4745a9260cf8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -34,6 +34,28 @@ static const uint32_t formats_cluster[] = {
 	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
 };
 
+static const uint32_t formats_esmart[] = {
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
+	DRM_FORMAT_YVYU, /* yuv422_8bit[YVYU] linear mode */
+	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
+	DRM_FORMAT_YUYV, /* yuv422_8bit[YUYV] linear mode */
+	DRM_FORMAT_UYVY, /* yuv422_8bit[UYVY] linear mode */
+};
+
 static const uint32_t formats_rk356x_esmart[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -234,6 +256,186 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 	},
 };
 
+static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
+	{
+		.id = 0,
+		.feature = VOP_FEATURE_OUTPUT_10BIT,
+		.gamma_lut_len = 1024,
+		.cubic_lut_len = 9 * 9 * 9, /* 9x9x9 */
+		.max_output = { 4096, 2304 },
+		/* hdr2sdr sdr2hdr hdr2hdr sdr2sdr */
+		.pre_scan_max_dly = { 76, 65, 65, 54 },
+		.offset = 0xc00,
+	}, {
+		.id = 1,
+		.feature = VOP_FEATURE_OUTPUT_10BIT,
+		.gamma_lut_len = 1024,
+		.cubic_lut_len = 729, /* 9x9x9 */
+		.max_output = { 4096, 2304 },
+		.pre_scan_max_dly = { 76, 65, 65, 54 },
+		.offset = 0xd00,
+	}, {
+		.id = 2,
+		.feature = VOP_FEATURE_OUTPUT_10BIT,
+		.gamma_lut_len = 1024,
+		.cubic_lut_len = 17 * 17 * 17, /* 17x17x17 */
+		.max_output = { 4096, 2304 },
+		.pre_scan_max_dly = { 52, 52, 52, 52 },
+		.offset = 0xe00,
+	}, {
+		.id = 3,
+		.gamma_lut_len = 1024,
+		.max_output = { 2048, 1536 },
+		.pre_scan_max_dly = { 52, 52, 52, 52 },
+		.offset = 0xf00,
+	},
+};
+
+/*
+ * rk3588 vop with 4 cluster, 4 esmart win.
+ * Every cluster can work as 4K win or split into two win.
+ * All win in cluster support AFBCD.
+ *
+ * Every esmart win and smart win support 4 Multi-region.
+ *
+ * Scale filter mode:
+ *
+ * * Cluster:  bicubic for horizontal scale up, others use bilinear
+ * * ESmart:
+ *    * nearest-neighbor/bilinear/bicubic for scale up
+ *    * nearest-neighbor/bilinear/average for scale down
+ *
+ * AXI Read ID assignment:
+ * Two AXI bus:
+ * AXI0 is a read/write bus with a higher performance.
+ * AXI1 is a read only bus.
+ *
+ * Every window on a AXI bus must assigned two unique
+ * read id(yrgb_id/uv_id, valid id are 0x1~0xe).
+ *
+ * AXI0:
+ * Cluster0/1, Esmart0/1, WriteBack
+ *
+ * AXI 1:
+ * Cluster2/3, Esmart2/3
+ *
+ */
+static const struct vop2_win_data rk3588_vop_win_data[] = {
+	{
+		.name = "Cluster0-win0",
+		.phys_id = ROCKCHIP_VOP2_CLUSTER0,
+		.base = 0x1000,
+		.formats = formats_cluster,
+		.nformats = ARRAY_SIZE(formats_cluster),
+		.format_modifiers = format_modifiers_afbc,
+		.layer_sel_id = 0,
+		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
+				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
+		.max_upscale_factor = 4,
+		.max_downscale_factor = 4,
+		.dly = { 4, 26, 29 },
+		.type = DRM_PLANE_TYPE_PRIMARY,
+		.feature = WIN_FEATURE_AFBDC | WIN_FEATURE_CLUSTER,
+	}, {
+		.name = "Cluster1-win0",
+		.phys_id = ROCKCHIP_VOP2_CLUSTER1,
+		.base = 0x1200,
+		.formats = formats_cluster,
+		.nformats = ARRAY_SIZE(formats_cluster),
+		.format_modifiers = format_modifiers_afbc,
+		.layer_sel_id = 1,
+		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
+				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_PRIMARY,
+		.max_upscale_factor = 4,
+		.max_downscale_factor = 4,
+		.dly = { 4, 26, 29 },
+		.feature = WIN_FEATURE_AFBDC | WIN_FEATURE_CLUSTER,
+	}, {
+		.name = "Cluster2-win0",
+		.phys_id = ROCKCHIP_VOP2_CLUSTER2,
+		.base = 0x1400,
+		.formats = formats_cluster,
+		.nformats = ARRAY_SIZE(formats_cluster),
+		.format_modifiers = format_modifiers_afbc,
+		.layer_sel_id = 4,
+		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
+				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_PRIMARY,
+		.max_upscale_factor = 4,
+		.max_downscale_factor = 4,
+		.dly = { 4, 26, 29 },
+		.feature = WIN_FEATURE_AFBDC | WIN_FEATURE_CLUSTER,
+	}, {
+		.name = "Cluster3-win0",
+		.phys_id = ROCKCHIP_VOP2_CLUSTER3,
+		.base = 0x1600,
+		.formats = formats_cluster,
+		.nformats = ARRAY_SIZE(formats_cluster),
+		.format_modifiers = format_modifiers_afbc,
+		.layer_sel_id = 5,
+		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
+				       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_PRIMARY,
+		.max_upscale_factor = 4,
+		.max_downscale_factor = 4,
+		.dly = { 4, 26, 29 },
+		.feature = WIN_FEATURE_AFBDC | WIN_FEATURE_CLUSTER,
+	}, {
+		.name = "Esmart0-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART0,
+		.formats = formats_esmart,
+		.nformats = ARRAY_SIZE(formats_esmart),
+		.format_modifiers = format_modifiers,
+		.base = 0x1800,
+		.layer_sel_id = 2,
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+		.dly = { 23, 45, 48 },
+	}, {
+		.name = "Esmart1-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART1,
+		.formats = formats_esmart,
+		.nformats = ARRAY_SIZE(formats_esmart),
+		.format_modifiers = format_modifiers,
+		.base = 0x1a00,
+		.layer_sel_id = 3,
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+		.dly = { 23, 45, 48 },
+	}, {
+		.name = "Esmart2-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART2,
+		.base = 0x1c00,
+		.formats = formats_esmart,
+		.nformats = ARRAY_SIZE(formats_esmart),
+		.format_modifiers = format_modifiers,
+		.layer_sel_id = 6,
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+		.dly = { 23, 45, 48 },
+	}, {
+		.name = "Esmart3-win0",
+		.phys_id = ROCKCHIP_VOP2_ESMART3,
+		.formats = formats_esmart,
+		.nformats = ARRAY_SIZE(formats_esmart),
+		.format_modifiers = format_modifiers,
+		.base = 0x1e00,
+		.layer_sel_id = 7,
+		.supported_rotations = DRM_MODE_REFLECT_Y,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.max_upscale_factor = 8,
+		.max_downscale_factor = 8,
+		.dly = { 23, 45, 48 },
+	},
+};
+
 static const struct vop2_data rk3566_vop = {
 	.nr_vps = 3,
 	.max_input = { 4096, 2304 },
@@ -254,6 +456,16 @@ static const struct vop2_data rk3568_vop = {
 	.soc_id = 3568,
 };
 
+static const struct vop2_data rk3588_vop = {
+	.nr_vps = 4,
+	.max_input = { 4096, 4320 },
+	.max_output = { 4096, 4320 },
+	.vp = rk3588_vop_video_ports,
+	.win = rk3588_vop_win_data,
+	.win_size = ARRAY_SIZE(rk3588_vop_win_data),
+	.soc_id = 3588,
+};
+
 static const struct of_device_id vop2_dt_match[] = {
 	{
 		.compatible = "rockchip,rk3566-vop",
@@ -261,6 +473,9 @@ static const struct of_device_id vop2_dt_match[] = {
 	}, {
 		.compatible = "rockchip,rk3568-vop",
 		.data = &rk3568_vop,
+	}, {
+		.compatible = "rockchip,rk3588-vop",
+		.data = &rk3588_vop
 	}, {
 	},
 };
diff --git a/include/dt-bindings/soc/rockchip,vop2.h b/include/dt-bindings/soc/rockchip,vop2.h
index 6e66a802b96a..668f199df9f0 100644
--- a/include/dt-bindings/soc/rockchip,vop2.h
+++ b/include/dt-bindings/soc/rockchip,vop2.h
@@ -10,5 +10,9 @@
 #define ROCKCHIP_VOP2_EP_LVDS0	5
 #define ROCKCHIP_VOP2_EP_MIPI1	6
 #define ROCKCHIP_VOP2_EP_LVDS1	7
+#define ROCKCHIP_VOP2_EP_HDMI1	8
+#define ROCKCHIP_VOP2_EP_EDP1	9
+#define ROCKCHIP_VOP2_EP_DP0	10
+#define ROCKCHIP_VOP2_EP_DP1	11
 
 #endif /* __DT_BINDINGS_ROCKCHIP_VOP2_H */
-- 
2.34.1

