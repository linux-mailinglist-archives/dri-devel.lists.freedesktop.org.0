Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862CA06C0B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 04:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54F010ECBF;
	Thu,  9 Jan 2025 03:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="gj2j7du2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12781.qiye.163.com (mail-m12781.qiye.163.com
 [115.236.127.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9320010ECBD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 03:28:12 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 82c01a34;
 Thu, 9 Jan 2025 11:28:08 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 06/20] drm/rockchip: analogix_dp: Use formalized struct
 definition for grf field
Date: Thu,  9 Jan 2025 11:27:11 +0800
Message-Id: <20250109032725.1102465-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxDGVZLGhlIHxhLQ09NH0lWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a94491aec3b03a3kunm82c01a34
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nkk6Hzo5PDIISBQLSwEoTA4K
 SilPCRBVSlVKTEhNSEJISUJLTklNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTkpLNwY+
DKIM-Signature: a=rsa-sha256;
 b=gj2j7du2lgUC8FsEYjlNk0EF+EGdzcJxCv14mHYWHGvg2njHUvCv83Ee3v2sDLWJnuDRjlcvmeg+j4E/3G+PXTUYRw69OxU/DoQ4/fDN/xEEmagXiqfk9pQ5j2lYsAYxi3sqKL/WMT5dmjb3y8s0+3ZRArpvAMglkxs5MvJaLPg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=LNtsL2GR6L/1htWd9bk9PdlyS2eSHU0LlujE5D2Suwc=;
 h=date:mime-version:subject:message-id:from;
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

The formalized struct definition will makes grf field operations more
concise and easier to extend.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Initialize struct rockchip_dp_chip_data rk3399_edp/rk3288_dp in order
  of its members
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 77 +++++++++++--------
 1 file changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8114c3238609..eef1ff0f3a13 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -32,26 +32,29 @@
 
 #include "rockchip_drm_drv.h"
 
-#define RK3288_GRF_SOC_CON6		0x25c
-#define RK3288_EDP_LCDC_SEL		BIT(5)
-#define RK3399_GRF_SOC_CON20		0x6250
-#define RK3399_EDP_LCDC_SEL		BIT(5)
-
-#define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
-
 #define PSR_WAIT_LINE_FLAG_TIMEOUT_MS	100
 
+#define GRF_REG_FIELD(_reg, _lsb, _msb) {	\
+				.reg = _reg,	\
+				.lsb = _lsb,	\
+				.msb = _msb,	\
+				.valid = true,	\
+				}
+
+struct rockchip_grf_reg_field {
+	u32 reg;
+	u32 lsb;
+	u32 msb;
+	bool valid;
+};
+
 /**
  * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
- * @lcdsel_grf_reg: grf register offset of lcdc select
- * @lcdsel_big: reg value of selecting vop big for eDP
- * @lcdsel_lit: reg value of selecting vop little for eDP
+ * @lcdc_sel: grf register field of lcdc_sel
  * @chip_type: specific chip type
  */
 struct rockchip_dp_chip_data {
-	u32	lcdsel_grf_reg;
-	u32	lcdsel_big;
-	u32	lcdsel_lit;
+	const struct rockchip_grf_reg_field lcdc_sel;
 	u32	chip_type;
 };
 
@@ -84,6 +87,26 @@ static struct rockchip_dp_device *pdata_encoder_to_dp(struct analogix_dp_plat_da
 	return container_of(plat_data, struct rockchip_dp_device, plat_data);
 }
 
+static int rockchip_grf_write(struct regmap *grf, u32 reg, u32 mask, u32 val)
+{
+	return regmap_write(grf, reg, (mask << 16) | (val & mask));
+}
+
+static int rockchip_grf_field_write(struct regmap *grf,
+				    const struct rockchip_grf_reg_field *field,
+				    u32 val)
+{
+	u32 mask;
+
+	if (!field->valid)
+		return 0;
+
+	mask = GENMASK(field->msb, field->lsb);
+	val <<= field->lsb;
+
+	return rockchip_grf_write(grf, field->reg, mask, val);
+}
+
 static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
 {
 	reset_control_assert(dp->rst);
@@ -182,7 +205,6 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int ret;
-	u32 val;
 
 	crtc = rockchip_dp_drm_get_new_crtc(encoder, state);
 	if (!crtc)
@@ -193,24 +215,19 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
-	if (ret < 0)
-		return;
-
-	if (ret)
-		val = dp->data->lcdsel_lit;
-	else
-		val = dp->data->lcdsel_big;
-
-	drm_dbg_core(dp->drm_dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
-
 	ret = clk_prepare_enable(dp->grfclk);
 	if (ret < 0) {
 		drm_err(dp->drm_dev, "failed to enable grfclk %d\n", ret);
 		return;
 	}
 
-	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	if (ret < 0)
+		return;
+
+	drm_dbg_core(dp->drm_dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
+
+	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, ret);
 	if (ret != 0)
 		drm_err(dp->drm_dev, "Could not write to GRF: %d\n", ret);
 
@@ -449,16 +466,12 @@ static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
 		rockchip_dp_resume, NULL);
 
 static const struct rockchip_dp_chip_data rk3399_edp = {
-	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
-	.lcdsel_big = HIWORD_UPDATE(0, RK3399_EDP_LCDC_SEL),
-	.lcdsel_lit = HIWORD_UPDATE(RK3399_EDP_LCDC_SEL, RK3399_EDP_LCDC_SEL),
+	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
 	.chip_type = RK3399_EDP,
 };
 
 static const struct rockchip_dp_chip_data rk3288_dp = {
-	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
-	.lcdsel_big = HIWORD_UPDATE(0, RK3288_EDP_LCDC_SEL),
-	.lcdsel_lit = HIWORD_UPDATE(RK3288_EDP_LCDC_SEL, RK3288_EDP_LCDC_SEL),
+	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
 	.chip_type = RK3288_DP,
 };
 
-- 
2.34.1

