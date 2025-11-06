Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED4BC38CF8
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCBB10E7E7;
	Thu,  6 Nov 2025 02:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="ohiasOlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A7C10E7E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394962;
 bh=J2Dfi8ObLWDtR4Ds26hqQWc9pn2P2eSkWbDnDzh2tek=;
 h=From:To:Subject:Date:Message-Id;
 b=ohiasOlqrXKRQWl80V0QZMuf4G8CJsWX21Msh6jr8C7GQuCyutFHFL30LbSUElsPe
 wCkjrooFMooS7b7dBBUhu5cOh524YjDl2qkgHmg0VrVNlC5fFb3EjhXBb38pknGw2p
 NJ+n9t4zYVuotSKSRDKfo0atMpKhcUAmFDBafETE=
X-QQ-mid: esmtpgz15t1762394836t5c25a9a9
X-QQ-Originating-IP: MNgHLaivXKIqdVXO1uJSHb8Co2TeOFaAisJDtLBd4mA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:07:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4187062248744172939
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 9/9] drm/rockchip: vop: Add support for rk3506
Date: Thu,  6 Nov 2025 10:06:32 +0800
Message-Id: <20251106020632.92-10-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OZx8bcvOFjkRMJyvp6iGlJ05Jpxf8cXU9IM+kzsh20cHpZsI0FrrxF7Z
 dCUwHewBNgYLJ3MVCE2+jTK8frzjIkp0481se9LwTKQ4BIH4SuAp2K/GoEyZATVdMhiL4Dp
 41ILeL65SZsgTPdkzbh4c/HR/EVNDRPaLvM5kWvY55TnvgulAzMvjbUQtj2Skshss0NzHDF
 jCP/ELjRNXml32+ltcxLQl1moot+/Cm10eVS1CmpjqU2P0KaJxLOfmd1LNb3lW8yiwN/s3s
 9KgPGK37S5EgevZYeFt0obdA+bwkTmL9zmwYD7QrFUp/iQhNj5FmOMG4ORB0J1KLM+jlizE
 RJSQ+ehBfRJI80rjAF51+SY2hoF7SUNuaxBu9S+SAsS/ShIOSrjW5FDwyihK3ANozenu3uB
 gUwkpzhNXcFsbD1r3Y2yotd85vv1kt/jeaWBL6u2DtOQxmPFjzGgdXzlLT7XvJD0tYw/1Qb
 qTvc0D05h6nWxEDJ6JfBa0dhgxyr4QYGOtECHPVQEvBSt4hlrIyiKYcW7Qu+5QJNlQNOTd8
 FEphDQqoXFwodG3a9cvrEjbzjh4M+SXV2JVWUmpPJZ81/rodlqxJDHWLvsKg1b+ibQOvl1w
 QsOD1+XT2QT5Tc5nYQGJszupKedjKWCpNm2+Fq7r6NUp+6MiwyD79EY5p+vPBm4e68CKoLX
 WqM2452qzFni4oh225l1nnvOCn4RIXKD8wS6yQHl8RlAd/4G5cwRHSjvlA2n88o9RlnQDVj
 x9GItAoELHEH86UgWYIIBMRkTU3Tr9VtVav2C14/YecnGOBazgmhABAkoeF9z8BRK1VOMpc
 KQ/oApgnfuckihy8eGJWw3OO7poz69Whc2q46oqPcMqibx0DLh+SgcxPERafstIvm+jlco1
 nT1+0boxLsA4XAuYK+Yny4pUfoJlOz1Upo/YLZMdYvMANFV0+rR0rRKUFxEemj3zEHWCPiH
 rgG0CgcwlB7Km7y3LfMquTMyqz6Zjm6wQ2cCeS+ZLbP5xYsB85qi1LramRfPDF6gCXIyQbZ
 rDLQkQV/Wza7aMB/f7+3yYWz293fAJvKKSisHl1g==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The VOP on rk3506:
- Support 2 lane MIPI DSI interface, 1.5Gbps/lane.
- Support RGB interface.
- Max output resolution is 1280x1280@60fps.
- WIN1 layer support RGB888/ARGB8888/RGB565.
- Support Gamma LUT.
- ...

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 57 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h | 14 +++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index d1f788763318..6b654b682a94 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -1179,6 +1179,61 @@ static const struct vop_data rk3328_vop = {
 	.max_output = { 4096, 2160 },
 };
 
+static const struct vop_common rk3506_common = {
+	.standby = VOP_REG_SYNC(RK3506_SYS_CTRL2, 0x1, 1),
+	.out_mode = VOP_REG(RK3506_DSP_CTRL2, 0xf, 16),
+	.dsp_blank = VOP_REG(RK3506_DSP_CTRL2, 0x1, 14),
+	.dither_down_en = VOP_REG(RK3506_DSP_CTRL2, 0x1, 8),
+	.dither_down_sel = VOP_REG(RK3506_DSP_CTRL2, 0x1, 7),
+	.dither_down_mode = VOP_REG(RK3506_DSP_CTRL2, 0x1, 6),
+	.dsp_lut_en = VOP_REG(RK3506_DSP_CTRL2, 0x1, 5),
+	.dither_up = VOP_REG(RK3506_DSP_CTRL2, 0x1, 2),
+	.cfg_done = VOP_REG_SYNC(RK3506_REG_CFG_DONE, 0x1, 0),
+};
+
+static const struct vop_output rk3506_output = {
+	.rgb_en = VOP_REG(RK3506_DSP_CTRL0, 0x1, 0),
+	.rgb_pin_pol = VOP_REG(RK3506_DSP_CTRL0, 0x7, 2),
+	.mipi_en = VOP_REG(RK3506_DSP_CTRL0, 0x1, 24),
+	.mipi_dclk_pol = VOP_REG(RK3506_DSP_CTRL0, 0x1, 25),
+	.mipi_pin_pol = VOP_REG(RK3506_DSP_CTRL0, 0x7, 26),
+};
+
+static const struct vop_win_phy rk3506_win1_data = {
+	.data_formats = formats_win_lite,
+	.nformats = ARRAY_SIZE(formats_win_lite),
+	.format_modifiers = format_modifiers_win_lite,
+	.enable = VOP_REG(RK3506_WIN1_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3506_WIN1_CTRL0, 0x7, 4),
+	.rb_swap = VOP_REG(RK3506_WIN1_CTRL0, 0x1, 12),
+	.channel = VOP_REG(RK3506_WIN1_CTRL1, 0xf, 8),
+	.yrgb_vir = VOP_REG(RK3506_WIN1_VIR, 0x1fff, 0),
+	.yrgb_mst = VOP_REG(RK3506_WIN1_MST, 0xffffffff, 0),
+	.dsp_info = VOP_REG(RK3506_WIN1_DSP_INFO, 0xffffffff, 0),
+	.dsp_st = VOP_REG(RK3506_WIN1_DSP_ST, 0xffffffff, 0),
+	.alpha_en = VOP_REG(RK3506_WIN1_ALPHA_CTRL, 0x1, 0),
+	.alpha_mode = VOP_REG(RK3506_WIN1_ALPHA_CTRL, 0x1, 1),
+	.alpha_pre_mul = VOP_REG(RK3506_WIN1_ALPHA_CTRL, 0x1, 2),
+};
+
+static const struct vop_win_data rk3506_vop_win_data[] = {
+	{ .base = 0x00, .phy = &rk3506_win1_data,
+	  .type = DRM_PLANE_TYPE_PRIMARY },
+};
+
+static const struct vop_data rk3506_vop = {
+	.version = VOP_VERSION(2, 0xe),
+	.feature = VOP_FEATURE_INTERNAL_RGB,
+	.intr = &px30_intr,
+	.common = &rk3506_common,
+	.modeset = &px30_modeset,
+	.output = &rk3506_output,
+	.win = rk3506_vop_win_data,
+	.win_size = ARRAY_SIZE(rk3506_vop_win_data),
+	.lut_size = 256,
+	.max_output = { 1280, 1280 },
+};
+
 static const struct vop_common rv1126_common = {
 	.standby = VOP_REG_SYNC(PX30_SYS_CTRL2, 0x1, 1),
 	.out_mode = VOP_REG(PX30_DSP_CTRL2, 0xf, 16),
@@ -1259,6 +1314,8 @@ static const struct of_device_id vop_driver_dt_match[] = {
 	  .data = &rk3228_vop },
 	{ .compatible = "rockchip,rk3328-vop",
 	  .data = &rk3328_vop },
+	{ .compatible = "rockchip,rk3506-vop",
+	  .data = &rk3506_vop },
 	{ .compatible = "rockchip,rv1126-vop",
 	  .data = &rv1126_vop },
 	{},
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
index addf8ca085f6..7805533e88bc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
@@ -1033,4 +1033,18 @@
 #define RK3066_DSP_LUT_ADDR		0x800
 /* rk3066 register definition end */
 
+/* rk3506 register definition */
+#define RK3506_REG_CFG_DONE		0x00
+#define RK3506_SYS_CTRL2		0x18
+#define RK3506_DSP_CTRL0		0x20
+#define RK3506_DSP_CTRL2		0x28
+#define RK3506_WIN1_CTRL0		0x90
+#define RK3506_WIN1_CTRL1		0x94
+#define RK3506_WIN1_VIR			0x98
+#define RK3506_WIN1_MST			0xa0
+#define RK3506_WIN1_DSP_INFO		0xa4
+#define RK3506_WIN1_DSP_ST		0xa8
+#define RK3506_WIN1_ALPHA_CTRL		0xbc
+/* rk3506 register definition end */
+
 #endif /* _ROCKCHIP_VOP_REG_H */
-- 
2.51.1

