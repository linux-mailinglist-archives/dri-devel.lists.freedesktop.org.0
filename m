Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349D7A08698
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 06:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046B10EFA0;
	Fri, 10 Jan 2025 05:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X0fo6UOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDBD10E4E2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:39:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D32775C5D9B;
 Fri, 10 Jan 2025 05:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1FFCC4CEF3;
 Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736487596;
 bh=UG2CGnCqyKNIaJi2VKXNevl3o4wYKM6RlSnmqk38Sgo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=X0fo6UOp8sj6MzyBZxiqWtXtvm5UUYNtCFYAbpur8gkRX6HSI9IStsmFHImRIPzQz
 frq9aci6WYW92IBrebMNk8nj7SHDiEWUWIwv/CNDMkDjjU2BCbN/z/tmnUnUsKfPVh
 trPFUfI4ceowTjy9/NhdyHzUowJmesmEiOwg5ncPXGZTbHmdB8aHuaJ3a5IGQ9juzv
 HbLq2cd0O/yWrjC3sAzntHH6TbpirNS+Cn2DSX8QvrMv5OT4nKO+xloYsXM5Zpkp1Y
 qwUQHF/sTmh3AUhDUPdO3Plv0WXNMlzMazIRKsj5K4+9zBA+hz/UVEujwnRTOInXAC
 VqKDvFDoivDWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E769BE77188;
 Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:39:56 +0800
Subject: [PATCH 06/11] drm: meson: add meson_dw_hdmi support for S4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-6-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=19811;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=WtQmA6Oy2yV+LVYGHtPBPe9Fmnab2MVpSkcVYbGAx6E=;
 b=OXgye7NZ5HKzlo+5WNe2i78vhVyJf8xmH4H1CQE+WoYY5v1TTtfye7tYw1fzSrvHoRkdZsjl1
 yLrWl0WCTGuBluQBJXpMmMYagFTofrJfiFZTgPZeGgtpC7Dx0cmkash
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
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
Reply-To: ao.xu@amlogic.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ao Xu <ao.xu@amlogic.com>

Add S4 dw_hdmi register access method.
Adjust clock, power domain, and PHY configurations
to support HDMI on the S4.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 244 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/meson/meson_dw_hdmi.h | 126 ++++++++++++++++++
 2 files changed, 329 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 0d7c68b29dfff43ef276734368b15da9ee497919..bf59e68bba498620dd6e503de4e5e087637c17a0 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/arm-smccc.h>
 
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_atomic_helper.h>
@@ -90,29 +91,6 @@
  * - CEC Management
  */
 
-/* TOP Block Communication Channel */
-#define HDMITX_TOP_ADDR_REG	0x0
-#define HDMITX_TOP_DATA_REG	0x4
-#define HDMITX_TOP_CTRL_REG	0x8
-#define HDMITX_TOP_G12A_OFFSET	0x8000
-
-/* Controller Communication Channel */
-#define HDMITX_DWC_ADDR_REG	0x10
-#define HDMITX_DWC_DATA_REG	0x14
-#define HDMITX_DWC_CTRL_REG	0x18
-
-/* HHI Registers */
-#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
-#define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
-#define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
-#define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
-#define  PHY_CNTL1_INIT		0x03900000
-#define  PHY_INVERT		BIT(17)
-#define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
-#define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb */
-#define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
-#define HHI_HDMI_PHY_CNTL5	0x3b4 /* 0xed */
-
 static DEFINE_SPINLOCK(reg_lock);
 
 enum meson_venc_source {
@@ -185,6 +163,39 @@ static unsigned int dw_hdmi_g12a_top_read(struct meson_dw_hdmi *dw_hdmi,
 	return readl(dw_hdmi->hdmitx + HDMITX_TOP_G12A_OFFSET + (addr << 2));
 }
 
+static unsigned int dw_hdmi_s4_top_read(struct meson_dw_hdmi *dw_hdmi,
+					  unsigned int addr)
+{
+	struct arm_smccc_res res;
+	unsigned int val;
+
+	switch (addr) {
+	case HDMITX_TOP_SKP_CNTL_STAT:
+	case HDMITX_TOP_NONCE_0:
+	case HDMITX_TOP_NONCE_1:
+	case HDMITX_TOP_NONCE_2:
+	case HDMITX_TOP_NONCE_3:
+	case HDMITX_TOP_PKF_0:
+	case HDMITX_TOP_PKF_1:
+	case HDMITX_TOP_PKF_2:
+	case HDMITX_TOP_PKF_3:
+	case HDMITX_TOP_DUK_0:
+	case HDMITX_TOP_DUK_1:
+	case HDMITX_TOP_DUK_2:
+	case HDMITX_TOP_DUK_3:
+	case HDMITX_TOP_HDCP22_BSOD:
+		addr |= TOP_SEC_OFFSET_MASK;
+		arm_smccc_smc(HDMI_SEC_READ_REG, (unsigned long)addr, 0, 0, 0, 0, 0, 0, &res);
+		val = (unsigned int)((res.a0) & 0xffffffff);
+		break;
+	default:
+		val = readl(dw_hdmi->hdmitx + HDMITX_TOP_S4_OFFSET + (addr << 2));
+		break;
+	}
+
+	return val;
+}
+
 static inline void dw_hdmi_top_write(struct meson_dw_hdmi *dw_hdmi,
 				     unsigned int addr, unsigned int data)
 {
@@ -208,6 +219,35 @@ static inline void dw_hdmi_g12a_top_write(struct meson_dw_hdmi *dw_hdmi,
 	writel(data, dw_hdmi->hdmitx + HDMITX_TOP_G12A_OFFSET + (addr << 2));
 }
 
+static inline void dw_hdmi_s4_top_write(struct meson_dw_hdmi *dw_hdmi,
+					  unsigned int addr, unsigned int data)
+{
+	struct arm_smccc_res res;
+
+	switch (addr) {
+	case HDMITX_TOP_SKP_CNTL_STAT:
+	case HDMITX_TOP_NONCE_0:
+	case HDMITX_TOP_NONCE_1:
+	case HDMITX_TOP_NONCE_2:
+	case HDMITX_TOP_NONCE_3:
+	case HDMITX_TOP_PKF_0:
+	case HDMITX_TOP_PKF_1:
+	case HDMITX_TOP_PKF_2:
+	case HDMITX_TOP_PKF_3:
+	case HDMITX_TOP_DUK_0:
+	case HDMITX_TOP_DUK_1:
+	case HDMITX_TOP_DUK_2:
+	case HDMITX_TOP_DUK_3:
+	case HDMITX_TOP_HDCP22_BSOD:
+		addr |= TOP_SEC_OFFSET_MASK;
+		arm_smccc_smc(HDMI_SEC_WRITE_REG, (unsigned long)addr, data, 0, 0, 0, 0, 0, &res);
+		break;
+	default:
+		writel(data, dw_hdmi->hdmitx + HDMITX_TOP_S4_OFFSET + (addr << 2));
+		break;
+	}
+}
+
 /* Helper to change specific bits in PHY registers */
 static inline void dw_hdmi_top_write_bits(struct meson_dw_hdmi *dw_hdmi,
 					  unsigned int addr,
@@ -249,6 +289,38 @@ static unsigned int dw_hdmi_g12a_dwc_read(struct meson_dw_hdmi *dw_hdmi,
 	return readb(dw_hdmi->hdmitx + addr);
 }
 
+static unsigned int dw_hdmi_s4_dwc_read(struct meson_dw_hdmi *dw_hdmi,
+					  unsigned int addr)
+{
+	struct arm_smccc_res res;
+	unsigned int val;
+
+	switch (addr) {
+	case HDMITX_DWC_MC_CLKDIS:
+	case HDMITX_DWC_A_HDCPCFG0:
+	case HDMITX_DWC_A_HDCPCFG1:
+	case HDMITX_DWC_HDCPREG_SEED0:
+	case HDMITX_DWC_HDCPREG_SEED1:
+	case HDMITX_DWC_HDCPREG_DPK0:
+	case HDMITX_DWC_HDCPREG_DPK1:
+	case HDMITX_DWC_HDCPREG_DPK2:
+	case HDMITX_DWC_HDCPREG_DPK3:
+	case HDMITX_DWC_HDCPREG_DPK4:
+	case HDMITX_DWC_HDCPREG_DPK5:
+	case HDMITX_DWC_HDCPREG_DPK6:
+	case HDMITX_DWC_HDCP22REG_CTRL:
+		addr |= DWC_SEC_OFFSET_MASK;
+		arm_smccc_smc(HDMI_SEC_READ_REG, (unsigned long)addr, 0, 0, 0, 0, 0, 0, &res);
+		val = (unsigned int)((res.a0) & 0xffffffff);
+		break;
+	default:
+		val = readb(dw_hdmi->hdmitx + addr);
+		break;
+	}
+
+	return val;
+}
+
 static inline void dw_hdmi_dwc_write(struct meson_dw_hdmi *dw_hdmi,
 				     unsigned int addr, unsigned int data)
 {
@@ -272,6 +344,34 @@ static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
 	writeb(data, dw_hdmi->hdmitx + addr);
 }
 
+static inline void dw_hdmi_s4_dwc_write(struct meson_dw_hdmi *dw_hdmi,
+					  unsigned int addr, unsigned int data)
+{
+	struct arm_smccc_res res;
+
+	switch (addr) {
+	case HDMITX_DWC_MC_CLKDIS:
+	case HDMITX_DWC_A_HDCPCFG0:
+	case HDMITX_DWC_A_HDCPCFG1:
+	case HDMITX_DWC_HDCPREG_SEED0:
+	case HDMITX_DWC_HDCPREG_SEED1:
+	case HDMITX_DWC_HDCPREG_DPK0:
+	case HDMITX_DWC_HDCPREG_DPK1:
+	case HDMITX_DWC_HDCPREG_DPK2:
+	case HDMITX_DWC_HDCPREG_DPK3:
+	case HDMITX_DWC_HDCPREG_DPK4:
+	case HDMITX_DWC_HDCPREG_DPK5:
+	case HDMITX_DWC_HDCPREG_DPK6:
+	case HDMITX_DWC_HDCP22REG_CTRL:
+		addr |= DWC_SEC_OFFSET_MASK;
+		arm_smccc_smc(HDMI_SEC_WRITE_REG, (unsigned long)addr, data, 0, 0, 0, 0, 0, &res);
+		break;
+	default:
+		writeb(data, dw_hdmi->hdmitx + addr);
+		break;
+	}
+}
+
 /* Bridge */
 
 /* Setup PHY bandwidth modes */
@@ -337,6 +437,23 @@ static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
 			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL3, 0x2ab0ff3b);
 			regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL5, 0x00000003);
 		}
+	} else if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-s4-dw-hdmi")) {
+		if (pixel_clock >= 371250) {
+			/* 5.94Gbps, 4.5Gbps, 3.7125Gbps */
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL5, 0x0000080b);
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL0, 0x37eb65c4);
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL3, 0x2ab0ff3b);
+		} else if (pixel_clock >= 297000) {
+			/* 2.97Gbps */
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL5, 0x00000003);
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL0, 0x33eb42a2);
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL3, 0x2ab0ff3b);
+		} else {
+			/* 1.485Gbps, and below */
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL5, 0x00000003);
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL0, 0x33eb4252);
+			regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL3, 0x2ab0ff3b);
+		}
 	}
 }
 
@@ -344,13 +461,23 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
 {
 	struct meson_drm *priv = dw_hdmi->priv;
 
-	/* Enable and software reset */
-	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0xf);
+	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-s4-dw-hdmi")) {
+		/* Enable and software reset */
+		regmap_update_bits(priv->hhi, ANACTRL_HDMIPHY_CTRL1, 0xf, 0xf);
 
-	mdelay(2);
+		mdelay(2);
 
-	/* Enable and unreset */
-	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0xe);
+		/* Enable and unreset */
+		regmap_update_bits(priv->hhi, ANACTRL_HDMIPHY_CTRL1, 0xf, 0xe);
+	} else {
+		/* Enable and software reset */
+		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0xf);
+
+		mdelay(2);
+
+		/* Enable and unreset */
+		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0xe);
+	}
 
 	mdelay(2);
 }
@@ -396,7 +523,10 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
 
 	/* Disable clock, fifo, fifo_wr */
-	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
+	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-s4-dw-hdmi"))
+		regmap_update_bits(priv->hhi, ANACTRL_HDMIPHY_CTRL1, 0xf, 0);
+	else
+		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
 
 	dw_hdmi_set_high_tmds_clock_ratio(hdmi, display);
 
@@ -449,8 +579,15 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi,
 	DRM_DEBUG_DRIVER("\n");
 
 	/* Fallback to init mode */
-	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, dw_hdmi->data->cntl1_init);
-	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, dw_hdmi->data->cntl0_init);
+	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-s4-dw-hdmi")) {
+		regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL1,
+			     dw_hdmi->data->cntl1_init);
+		regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL0,
+			     dw_hdmi->data->cntl0_init);
+	} else {
+		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, dw_hdmi->data->cntl1_init);
+		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, dw_hdmi->data->cntl0_init);
+	}
 }
 
 static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
@@ -595,23 +732,36 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.cntl1_init = PHY_CNTL1_INIT,
 };
 
+static const struct meson_dw_hdmi_data meson_dw_hdmi_s4_data = {
+	.top_read = dw_hdmi_s4_top_read,
+	.top_write = dw_hdmi_s4_top_write,
+	.dwc_read = dw_hdmi_s4_dwc_read,
+	.dwc_write = dw_hdmi_s4_dwc_write,
+	.cntl0_init = 0x0,
+	.cntl1_init = PHY_CNTL1_INIT,
+};
+
 static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
 
-	/* Enable clocks */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
-
-	/* Bring HDMITX MEM output of power down */
-	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
-
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_update_bits(priv->hhi, CLKCTRL_HDMI_CLK_CTRL, 0xffff, 0x100);
+		regmap_update_bits(priv->pwrctrl, PWRCTRL_MEM_PD11, 0xff << 8, 0);
+	} else {
+		/* Enable clocks */
+		regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
+		/* Bring HDMITX MEM output of power down */
+		regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
+	}
 	/* Reset HDMITX APB & TX & PHY */
 	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
 	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
 	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
 
 	/* Enable APB3 fail on error */
-	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) &&
+	    !meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
 		writel_bits_relaxed(BIT(15), BIT(15),
 				    meson_dw_hdmi->hdmitx + HDMITX_TOP_CTRL_REG);
 		writel_bits_relaxed(BIT(15), BIT(15),
@@ -631,8 +781,15 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
 
 	/* Setup PHY */
-	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
-	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
+	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-s4-dw-hdmi")) {
+		regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL1,
+			     meson_dw_hdmi->data->cntl1_init);
+		regmap_write(priv->hhi, ANACTRL_HDMIPHY_CTRL0,
+			     meson_dw_hdmi->data->cntl0_init);
+	} else {
+		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
+		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
+	}
 
 	/* Enable HDMI-TX Interrupt */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
@@ -766,10 +923,13 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->ycbcr_420_allowed = true;
 	dw_plat_data->disable_cec = true;
 	dw_plat_data->output_port = 1;
+	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-s4-dw-hdmi"))
+		dw_plat_data->phy_force_vendor = 1;
 
 	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
+	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi") ||
+	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-s4-dw-hdmi"))
 		dw_plat_data->use_drm_infoframe = true;
 
 	platform_set_drvdata(pdev, meson_dw_hdmi);
@@ -850,6 +1010,8 @@ static const struct of_device_id meson_dw_hdmi_of_table[] = {
 	  .data = &meson_dw_hdmi_gxl_data },
 	{ .compatible = "amlogic,meson-g12a-dw-hdmi",
 	  .data = &meson_dw_hdmi_g12a_data },
+	{ .compatible = "amlogic,meson-s4-dw-hdmi",
+	  .data = &meson_dw_hdmi_s4_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson_dw_hdmi_of_table);
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.h b/drivers/gpu/drm/meson/meson_dw_hdmi.h
index 08e1c14e4ea07c694f2c5fccbbf593661a8a3feb..66203b59e5e0ca67463ec5c79165e757f3a24406 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.h
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.h
@@ -8,6 +8,16 @@
 #ifndef __MESON_DW_HDMI_H
 #define __MESON_DW_HDMI_H
 
+/* TOP-level wrapper registers addresses
+ * bit24: 1 means secure access
+ * bit28: 1 means DWC, 0 means TOP
+ */
+#define TOP_SEC_OFFSET_MASK                     BIT(24)
+#define DWC_SEC_OFFSET_MASK                     (BIT(24) | BIT(28))
+
+#define HDMI_SEC_READ_REG                       (0x82000018)
+#define HDMI_SEC_WRITE_REG                      (0x82000019)
+
 /*
  * Bit 15-10: RW Reserved. Default 1 starting from G12A
  * Bit 9 RW sw_reset_i2c starting from G12A
@@ -157,4 +167,120 @@
  */
 #define HDMITX_TOP_STAT0                        (0x00E)
 
+#define HDMITX_TOP_SKP_CNTL_STAT                (0x010)
+#define HDMITX_TOP_NONCE_0                      (0x011)
+#define HDMITX_TOP_NONCE_1                      (0x012)
+#define HDMITX_TOP_NONCE_2                      (0x013)
+#define HDMITX_TOP_NONCE_3                      (0x014)
+#define HDMITX_TOP_PKF_0                        (0x015)
+#define HDMITX_TOP_PKF_1                        (0x016)
+#define HDMITX_TOP_PKF_2                        (0x017)
+#define HDMITX_TOP_PKF_3                        (0x018)
+#define HDMITX_TOP_DUK_0                        (0x019)
+#define HDMITX_TOP_DUK_1                        (0x01A)
+#define HDMITX_TOP_DUK_2                        (0x01B)
+#define HDMITX_TOP_DUK_3                        (0x01C)
+
+/* [26:24] infilter_ddc_intern_clk_divide */
+/* [23:16] infilter_ddc_sample_clk_divide */
+/* [10: 8] infilter_cec_intern_clk_divide */
+/* [ 7: 0] infilter_cec_sample_clk_divide */
+#define HDMITX_TOP_INFILTER                     (0x01D)
+#define HDMITX_TOP_NSEC_SCRATCH                 (0x01E)
+#define HDMITX_TOP_SEC_SCRATCH                  (0x01F)
+#define HDMITX_TOP_EMP_CNTL0                    (0x020)
+#define HDMITX_TOP_EMP_CNTL1                    (0x021)
+#define HDMITX_TOP_EMP_MEMADDR_START            (0x022)
+#define HDMITX_TOP_EMP_STAT0                    (0x023)
+#define HDMITX_TOP_EMP_STAT1                    (0x024)
+#define HDMITX_TOP_AXI_ASYNC_CNTL0              (0x025)
+#define HDMITX_TOP_AXI_ASYNC_CNTL1              (0x026)
+#define HDMITX_TOP_AXI_ASYNC_STAT0              (0x027)
+#define HDMITX_TOP_I2C_BUSY_CNT_MAX             (0x028)
+#define HDMITX_TOP_I2C_BUSY_CNT_STAT            (0x029)
+#define HDMITX_TOP_HDCP22_BSOD                  (0x02A)
+#define HDMITX_TOP_DDC_CNTL                     (0x02B)
+#define HDMITX_TOP_DISABLE_NULL                 (0x030)
+#define HDMITX_TOP_HDCP14_UNENCRYPT             (0x031)
+#define HDMITX_TOP_MISC_CNTL                    (0x032)
+#define HDMITX_TOP_HDCP22_MIN_SIZE              (0x035)
+
+#define HDMITX_TOP_DONT_TOUCH0                  (0x0FE)
+#define HDMITX_TOP_DONT_TOUCH1                  (0x0FF)
+
+/* DWC_HDMI_TX Controller SEC registers addresses */
+/* Main Controller Registers */
+/* [  6] hdcpclk_disable */
+/* [  5] cecclk_disable */
+/* [  4] cscclk_disable */
+/* [  3] audclk_disable */
+/* [  2] prepclk_disable */
+/* [  1] tmdsclk_disable */
+/* [  0] pixelclk_disable */
+#define HDMITX_DWC_MC_CLKDIS                    (0x4001)
+
+/* HDCP Encryption Engine Registers */
+#define HDMITX_DWC_A_HDCPCFG0                   (0x5000)
+
+/* [  4] hdcp_lock */
+/* [  3] dissha1check */
+/* [  2] ph2upshiftenc */
+/* [  1] encryptiondisable */
+/* [  0] swresetn. Write 0 to activate, self-clear to 1. */
+#define HDMITX_DWC_A_HDCPCFG1                   (0x5001)
+
+/* Encrypted DPK Embedded Storage Registers */
+#define HDMITX_DWC_HDCPREG_SEED0                (0x7810)
+#define HDMITX_DWC_HDCPREG_SEED1                (0x7811)
+#define HDMITX_DWC_HDCPREG_DPK0                 (0x7812)
+#define HDMITX_DWC_HDCPREG_DPK1                 (0x7813)
+#define HDMITX_DWC_HDCPREG_DPK2                 (0x7814)
+#define HDMITX_DWC_HDCPREG_DPK3                 (0x7815)
+#define HDMITX_DWC_HDCPREG_DPK4                 (0x7816)
+#define HDMITX_DWC_HDCPREG_DPK5                 (0x7817)
+#define HDMITX_DWC_HDCPREG_DPK6                 (0x7818)
+
+/* HDCP22 Registers */
+#define HDMITX_DWC_HDCP22REG_CTRL               (0x7904)
+
+/* TOP Block Communication Channel */
+#define HDMITX_TOP_ADDR_REG                     0x0
+#define HDMITX_TOP_DATA_REG                     0x4
+#define HDMITX_TOP_CTRL_REG                     0x8
+#define HDMITX_TOP_G12A_OFFSET                  0x8000
+#define HDMITX_TOP_S4_OFFSET                    0x8000
+
+/* Controller Communication Channel */
+#define HDMITX_DWC_ADDR_REG                     0x10
+#define HDMITX_DWC_DATA_REG                     0x14
+#define HDMITX_DWC_CTRL_REG                     0x18
+
+/* HHI Registers */
+#define HHI_MEM_PD_REG0                         0x100 /* 0x40 */
+#define HHI_HDMI_CLK_CNTL                       0x1cc /* 0x73 */
+#define HHI_HDMI_PHY_CNTL0                      0x3a0 /* 0xe8 */
+#define HHI_HDMI_PHY_CNTL1                      0x3a4 /* 0xe9 */
+#define HHI_HDMI_PHY_CNTL2                      0x3a8 /* 0xea */
+#define HHI_HDMI_PHY_CNTL3                      0x3ac /* 0xeb */
+#define HHI_HDMI_PHY_CNTL4                      0x3b0 /* 0xec */
+#define HHI_HDMI_PHY_CNTL5                      0x3b4 /* 0xed */
+
+/*ANA Registers */
+/* REG_BASE:  REGISTER_BASE_ADDR = 0xfe00c000 */
+#define PWRCTRL_MEM_PD11                        0x06c  /* 0x1b */
+
+/* REG_BASE:  REGISTER_BASE_ADDR = 0xfe000000 */
+#define CLKCTRL_HDMI_CLK_CTRL                   0x0e0  /* 0x38 */
+
+/* REG_BASE:  REGISTER_BASE_ADDR = 0xfe008000 */
+#define ANACTRL_HDMIPHY_CTRL0                   0x200  /* 0x80 */
+#define ANACTRL_HDMIPHY_CTRL1                   0x204  /* 0x81 */
+#define PHY_CNTL1_INIT                          0x03900000
+#define PHY_INVERT                              BIT(17)
+#define ANACTRL_HDMIPHY_CTRL2                   0x208  /* 0x82 */
+#define ANACTRL_HDMIPHY_CTRL3                   0x20c  /* 0x83 */
+#define ANACTRL_HDMIPHY_CTRL4                   0x210  /* 0x84 */
+#define ANACTRL_HDMIPHY_CTRL5                   0x214  /* 0x85 */
+#define ANACTRL_HDMIPHY_STS                     0x218  /* 0x86 */
+
 #endif /* __MESON_DW_HDMI_H */

-- 
2.43.0


