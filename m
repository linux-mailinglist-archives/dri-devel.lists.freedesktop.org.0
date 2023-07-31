Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D4768E03
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 09:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FD010E1BB;
	Mon, 31 Jul 2023 07:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E8210E065
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:19:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9b904bb04so62856441fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 00:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690787974; x=1691392774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9MGyANrADJosQKLWXEJL6AuVBkwmnSxhWxzqgUxeDs=;
 b=piVz/2rETh6217M/f6i0Q6ZjKGhMNsPoFI+k3rqnvxel9JQpVmmF7L76pu2qkb7xeT
 BBZbff7VCmJaHWjGFDHIFDrNS+q3XYwrON5+p8XeGpLu/BXjoTsik1NZ7GMDn+Vd8qNo
 kVmyvdzWQbcDPE4Pin1xzwdyhRFeIl0jou6cSsdFvQlKn/dAPdplUxh/PD3EaZMcku+N
 DOSGFrSqBEwQQwheh8iyXW8WLSYurGHMQTvs3bXt8FtIV2iN8zgz8crGmD36fpgQH4Qt
 5IXz4tUR/dwYAWtBimvMwicS/1y5PqFUapnmV5X5bQlpgukW+OxD71W0C13sSxtemenw
 KORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690787974; x=1691392774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9MGyANrADJosQKLWXEJL6AuVBkwmnSxhWxzqgUxeDs=;
 b=ST/EJpq5eocFXYQIK+c4j7ASk7s9l5Z6uyqOMt8QCUXL0pEqvocncsGjGIsFF5Yqre
 TgWFy6Hg7pkMwjUL03eBdqdvHcbFZwXKcerm1QtPOuV+VF62miBjw5yAyd3Ecd3PhfXP
 ZY2VgrQ6pe5ofW8maOY0LGf/7Sc7KwUuY+ZKnGvxe303MZTLcATiuXvbTvcvqzZXotRu
 kbTHXIhpTMuAd8FyIJxmWKykEhbOy4oFydzXFpGe0WxoVoawFfQTcPIKMZWIti3w9fIP
 yk6BYrCe2XDo20Bnw8lJBZ4/j+oKwUZ+jWDZ7uFUnljZ7DTh6o0wTE94JINYkIN0Zd9X
 I8Lg==
X-Gm-Message-State: ABy/qLYYSXOwBX20HrQc/gDyTwdgpy/Wec3e/WEmN6J2UUCl12OF3sJs
 +iDBB5ZBkrsJxyyZiSCaZyGvFQ==
X-Google-Smtp-Source: APBJJlG61MVi0i6bAnxXBUkji+YPklYbMxq6Ejl/++UF5Y1SPJJelkJLvjpBW8AE6Y10ZH9Lm1OsDA==
X-Received: by 2002:a2e:2405:0:b0:2b9:36d5:729c with SMTP id
 k5-20020a2e2405000000b002b936d5729cmr5802465ljk.47.1690787973813; 
 Mon, 31 Jul 2023 00:19:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a2ea1c4000000b002b71c128ea0sm2413267ljm.117.2023.07.31.00.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 00:19:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 2/3] phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
Date: Mon, 31 Jul 2023 10:19:29 +0300
Message-Id: <20230731071930.3928150-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
References: <20230731071930.3928150-1-dmitry.baryshkov@linaro.org>
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
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to using the new DRM_SIMPLE_BRIDGE helper to create the
transparent DRM bridge device instead of handcoding corresponding
functionality.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig              |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 ++---------------------
 2 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index ced603806375..fb03e3b3f637 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -63,7 +63,7 @@ config PHY_QCOM_QMP_COMBO
 	depends on DRM || DRM=n
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

