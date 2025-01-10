Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF2A08695
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 06:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DA310E4E2;
	Fri, 10 Jan 2025 05:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sbXkyT0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541B010E4D9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:39:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6466B5C5D82;
 Fri, 10 Jan 2025 05:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD480C4AF0B;
 Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736487595;
 bh=d2Asop2Xq8uRbdOK9qWSYXnjS0FGyIAVMfVGdaHznB0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=sbXkyT0fuiiJHTZNUB1kWQthj3sLVdlp/vt6t2ORGQPWae7Xw2zXsJXTGDxVOCNls
 C6lAikl8HPCPWggfqwoWbZMiUM0bAulw557DElilUgxNWjxiLjyaYArhY5COlVZBhR
 F5Jo/KO7gCHy0yeVpfv+ZMQFVQ1j86yb3s/rLTN6TEeWaZ00stb7Y7Aw5pPCV3DZru
 W+tdoU12IpdKgXoqNEDqYcx4tDyCm3ve/GyoSgsqkvEo3YCafgj4xihg53jdpSU4gd
 z/WU+rhEk/9ifOavjGgPfbvucfZ+U0OHyCa7DrvYnoOXrQ40ox1o9SYOfrSxc6y1Ov
 rXG8LVh1yYoOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AE8FAE77188;
 Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:39:53 +0800
Subject: [PATCH 03/11] drm: meson: add S4 compatible for DRM driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=7142;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=GnKCqq83/fUtrB77EhTpFJy/e7nbJHAdb/ugnZdZD1A=;
 b=ftzCIj0t4Ah/uuU+STje9qCx7QjfYryE18vx0j8JMqoHoNjILg/kCpeXf165b3RwDRDvTm1vY
 w9049UIPZznDF4WD4aaKsliIfnyYyFNn1ZYzHiDfSDu+HPmb/3AH8O3
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

Add S4 compatible for DRM driver. This update driver logic to support
S4-specific configurations. This also add vpu clock operation in
bind, suspend, resume, shutdown stage.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 127 +++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_drv.h |   6 ++
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e7732dca89d02347b9c972300b38771a..d28094efeb137ae0b9990ab3608825d563358dba 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -11,6 +11,7 @@
 #include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/module.h>
+#include <linux/clk.h>
 #include <linux/of_graph.h>
 #include <linux/sys_soc.h>
 #include <linux/platform_device.h>
@@ -160,6 +161,34 @@ static void meson_vpu_init(struct meson_drm *priv)
 	writel_relaxed(value, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
 }
 
+static void meson_setup_clk(struct meson_drm *priv, bool enable)
+{
+	int ret;
+
+	if (!priv || !priv->vpu_clk || !priv->vapb_clk)
+		return;
+
+	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+		return;
+
+	if (enable) {
+		ret = clk_prepare_enable(priv->vpu_clk);
+		if (ret) {
+			dev_err(priv->dev, "Failed to set vpu clk\n");
+			return;
+		}
+		ret = clk_prepare_enable(priv->vapb_clk);
+		if (ret) {
+			dev_err(priv->dev, "Failed to Set vapb clk\n");
+			clk_disable_unprepare(priv->vpu_clk);
+			return;
+		}
+	} else {
+		clk_disable_unprepare(priv->vpu_clk);
+		clk_disable_unprepare(priv->vapb_clk);
+	}
+}
+
 struct meson_drm_soc_attr {
 	struct meson_drm_soc_limits limits;
 	const struct soc_device_attribute *attrs;
@@ -241,6 +270,83 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto free_drm;
 	}
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sysctrl");
+		if (!res) {
+			ret = -EINVAL;
+			goto free_drm;
+		}
+		/* Simply ioremap since it may be a shared register zone */
+		regs = devm_ioremap(dev, res->start, resource_size(res));
+		if (!regs) {
+			ret = -EADDRNOTAVAIL;
+			goto free_drm;
+		}
+
+		priv->sysctrl = devm_regmap_init_mmio(dev, regs,
+						  &meson_regmap_config);
+		if (IS_ERR(priv->sysctrl)) {
+			dev_err(&pdev->dev, "Couldn't create the SYSCTRL regmap\n");
+			ret = PTR_ERR(priv->sysctrl);
+			goto free_drm;
+		}
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "clkctrl");
+		if (!res) {
+			ret = -EINVAL;
+			goto free_drm;
+		}
+		/* Simply ioremap since it may be a shared register zone */
+		regs = devm_ioremap(dev, res->start, resource_size(res));
+		if (!regs) {
+			ret = -EADDRNOTAVAIL;
+			goto free_drm;
+		}
+
+		priv->clkctrl = devm_regmap_init_mmio(dev, regs,
+						  &meson_regmap_config);
+		if (IS_ERR(priv->clkctrl)) {
+			dev_err(&pdev->dev, "Couldn't create the clkctrl regmap\n");
+			ret = PTR_ERR(priv->clkctrl);
+			goto free_drm;
+		}
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrctrl");
+		if (!res) {
+			ret = -EINVAL;
+			goto free_drm;
+		}
+		/* Simply ioremap since it may be a shared register zone */
+		regs = devm_ioremap(dev, res->start, resource_size(res));
+		if (!regs) {
+			ret = -EADDRNOTAVAIL;
+			goto free_drm;
+		}
+
+		priv->pwrctrl = devm_regmap_init_mmio(dev, regs,
+						  &meson_regmap_config);
+		if (IS_ERR(priv->pwrctrl)) {
+			dev_err(&pdev->dev, "Couldn't create the pwrctrl regmap\n");
+			ret = PTR_ERR(priv->pwrctrl);
+			goto free_drm;
+		}
+
+		priv->vpu_clk = devm_clk_get(&pdev->dev, "vpu");
+		if (IS_ERR(priv->vpu_clk)) {
+			dev_err(&pdev->dev, "vpu clock request failed\n");
+			ret = PTR_ERR(priv->vpu_clk);
+			goto free_drm;
+		}
+
+		priv->vapb_clk = devm_clk_get(&pdev->dev, "vapb");
+		if (IS_ERR(priv->vapb_clk)) {
+			dev_err(&pdev->dev, "vapb clock request failed\n");
+			ret = PTR_ERR(priv->vapb_clk);
+			goto free_drm;
+		}
+		meson_setup_clk(priv, true);
+	}
+
 	priv->canvas = meson_canvas_get(dev);
 	if (IS_ERR(priv->canvas)) {
 		ret = PTR_ERR(priv->canvas);
@@ -424,12 +530,21 @@ static const struct component_master_ops meson_drv_master_ops = {
 
 static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
 {
+	int ret;
 	struct meson_drm *priv = dev_get_drvdata(dev);
 
 	if (!priv)
 		return 0;
 
-	return drm_mode_config_helper_suspend(priv->drm);
+	ret = drm_mode_config_helper_suspend(priv->drm);
+	if (unlikely(ret)) {
+		drm_err(dev, "suspend error: %d", ret);
+		return ret;
+	}
+
+	meson_setup_clk(priv, false);
+
+	return ret;
 }
 
 static int __maybe_unused meson_drv_pm_resume(struct device *dev)
@@ -439,6 +554,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
 	if (!priv)
 		return 0;
 
+	meson_setup_clk(priv, true);
 	meson_vpu_init(priv);
 	meson_venc_init(priv);
 	meson_vpp_init(priv);
@@ -458,6 +574,7 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 
 	drm_kms_helper_poll_fini(priv->drm);
 	drm_atomic_helper_shutdown(priv->drm);
+	meson_setup_clk(priv, false);
 }
 
 /*
@@ -471,6 +588,7 @@ static const struct of_device_id components_dev_match[] = {
 	{ .compatible = "amlogic,meson-gxl-dw-hdmi" },
 	{ .compatible = "amlogic,meson-gxm-dw-hdmi" },
 	{ .compatible = "amlogic,meson-g12a-dw-hdmi" },
+	{ .compatible = "amlogic,meson-s4-dw-hdmi" },
 	{}
 };
 
@@ -539,6 +657,11 @@ static struct meson_drm_match_data meson_drm_g12a_data = {
 	.afbcd_ops = &meson_afbcd_g12a_ops,
 };
 
+static struct meson_drm_match_data meson_drm_s4_data = {
+	.compat = VPU_COMPATIBLE_S4,
+	.afbcd_ops = &meson_afbcd_g12a_ops,
+};
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "amlogic,meson-gxbb-vpu",
 	  .data       = (void *)&meson_drm_gxbb_data },
@@ -548,6 +671,8 @@ static const struct of_device_id dt_match[] = {
 	  .data       = (void *)&meson_drm_gxm_data },
 	{ .compatible = "amlogic,meson-g12a-vpu",
 	  .data       = (void *)&meson_drm_g12a_data },
+	{ .compatible = "amlogic,meson-s4-vpu",
+	  .data       = (void *)&meson_drm_s4_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 3f9345c14f31c13b071f420533fe8a450d3e0f36..c801a2e3e55a054247710aebae5602e44c9e1624 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -22,6 +22,7 @@ enum vpu_compatible {
 	VPU_COMPATIBLE_GXL  = 1,
 	VPU_COMPATIBLE_GXM  = 2,
 	VPU_COMPATIBLE_G12A = 3,
+	VPU_COMPATIBLE_S4 = 4,
 };
 
 enum {
@@ -45,6 +46,11 @@ struct meson_drm {
 	enum vpu_compatible compat;
 	void __iomem *io_base;
 	struct regmap *hhi;
+	struct regmap *sysctrl;
+	struct regmap *clkctrl;
+	struct regmap *pwrctrl;
+	struct clk *vpu_clk;
+	struct clk *vapb_clk;
 	int vsync_irq;
 
 	struct meson_canvas *canvas;

-- 
2.43.0


