Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4F7681DE
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 22:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED89210E115;
	Sat, 29 Jul 2023 20:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3687010E037
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 20:43:13 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so5288257e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690663391; x=1691268191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aj47ZiYvBGN5XcZT50FycBFq7zs/xAKKRf97ufklpk0=;
 b=CVHhN/hbSCNshxIlUmuk7Tj9is5vqfTfK7pbOlne4/bDKujWSxQt7llXImsIM2Xmff
 B2jiHdmZhlr3ZR+VcRD+OIKGrAA1QkgvkqrduRPfX7rjwEcuDE3ek6K/eggCmYc48oXA
 n0AMX6JOT7ic17wUFn33HcFIX9F0CEHrtRip/DSCc1UL/zYIoMFygmwY+/5gV9hYxN6g
 pbQThB/jyDqsc6NK/rewEXQMZkD8mGt/H7xwCQVbvgW4VFGFiFF5h8zz950IxiEy2CZc
 HS3EKkG1GVEqb4/jS9ZHVDlxWhpqnzSRQwA968wWnV7IzmNQYJcCYV1CpNMzLFyWvgAT
 R3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690663391; x=1691268191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aj47ZiYvBGN5XcZT50FycBFq7zs/xAKKRf97ufklpk0=;
 b=eVcepxAyGzUj6rkv8bZ7pcIlPGT3A+gTyX4PaOwg2xjjFwl/F5+k35AUVUR2123fCy
 ES0/SI/MujtafCQ706gkfgNK+08Mxr1ckYd5+idcAqb4W4jyyr1JziZwbc3nUx9sD1CZ
 PvV0266UDuvBlb4hwQ3GPrvzMrfF+BN3EhKqPXPDtfVLa5s9bqIkvAvgEWldumdOBHkp
 Yth++wmuw6bprPzIHM91XyOGQrhjJs95jzm4Nx4Aa6kzEY3PGNu4kdOE3lZEPot8Ywm+
 OcwHuJAtCOoQWPOaYdTRRhV67/Bdsl9drk3MKdvyZBT2rA08DqYntdRaxlrM8EDvtrZb
 uIDw==
X-Gm-Message-State: ABy/qLYcHdYuQTfCcxfO3OUM4NMCcN8ErOXq97YducyYjg95JUYjmjfL
 tLQrv0CkNjh1DDya8qCvtyI9VA==
X-Google-Smtp-Source: APBJJlHHoBhdMRA8IY5gSfwdOb5H9TLvlz7tC7IbeHhsuY9ujLUKS7ThsNIc0ePVMw8kqBj+rg5+GQ==
X-Received: by 2002:a2e:2e17:0:b0:2b0:297c:cbdf with SMTP id
 u23-20020a2e2e17000000b002b0297ccbdfmr4252690lju.1.1690663391585; 
 Sat, 29 Jul 2023 13:43:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a2e9614000000b002b9af8422a8sm1705177ljh.130.2023.07.29.13.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 13:43:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/3] phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
Date: Sat, 29 Jul 2023 23:43:06 +0300
Message-Id: <20230729204307.268587-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729204307.268587-1-dmitry.baryshkov@linaro.org>
References: <20230729204307.268587-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to using the new DRM_SIMPLE_BRIDGE helper to create the
transparent DRM bridge device instead of handcoding corresponding
functionality.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig              |  3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 ++---------------------
 2 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index ced603806375..fd8584d5dec8 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -60,10 +60,9 @@ config PHY_QCOM_QMP_COMBO
 	tristate "Qualcomm QMP Combo PHY Driver"
 	default PHY_QCOM_QMP
 	depends on TYPEC || TYPEC=n
-	depends on DRM || DRM=n
 	select GENERIC_PHY
 	select MFD_SYSCON
-	select DRM_PANEL_BRIDGE if DRM
+	select DRM_SIMPLE_BRIDGE if DRM
 	help
 	  Enable this to support the QMP Combo PHY transceiver that is used
 	  with USB3 and DisplayPort controllers on Qualcomm chips.
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1793d49bf45c..4bf64899cc71 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -21,7 +21,7 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
 
-#include <drm/drm_bridge.h>
+#include <drm/display/drm_simple_bridge.h>
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
@@ -1419,8 +1419,6 @@ struct qmp_combo {
 	struct clk_hw dp_link_hw;
 	struct clk_hw dp_pixel_hw;
 
-	struct drm_bridge bridge;
-
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
 };
@@ -3193,44 +3191,6 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
 }
 #endif
 
-#if IS_ENABLED(CONFIG_DRM)
-static int qmp_combo_bridge_attach(struct drm_bridge *bridge,
-				   enum drm_bridge_attach_flags flags)
-{
-	struct qmp_combo *qmp = container_of(bridge, struct qmp_combo, bridge);
-	struct drm_bridge *next_bridge;
-
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
-
-	next_bridge = devm_drm_of_get_bridge(qmp->dev, qmp->dev->of_node, 0, 0);
-	if (IS_ERR(next_bridge)) {
-		dev_err(qmp->dev, "failed to acquire drm_bridge: %pe\n", next_bridge);
-		return PTR_ERR(next_bridge);
-	}
-
-	return drm_bridge_attach(bridge->encoder, next_bridge, bridge,
-				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-}
-
-static const struct drm_bridge_funcs qmp_combo_bridge_funcs = {
-	.attach	= qmp_combo_bridge_attach,
-};
-
-static int qmp_combo_dp_register_bridge(struct qmp_combo *qmp)
-{
-	qmp->bridge.funcs = &qmp_combo_bridge_funcs;
-	qmp->bridge.of_node = qmp->dev->of_node;
-
-	return devm_drm_bridge_add(qmp->dev, &qmp->bridge);
-}
-#else
-static int qmp_combo_dp_register_bridge(struct qmp_combo *qmp)
-{
-	return 0;
-}
-#endif
-
 static int qmp_combo_parse_dt_lecacy_dp(struct qmp_combo *qmp, struct device_node *np)
 {
 	struct device *dev = qmp->dev;
@@ -3436,7 +3396,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_dp_register_bridge(qmp);
+	ret = drm_simple_bridge_register(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.2

