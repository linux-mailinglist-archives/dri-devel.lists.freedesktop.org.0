Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BDE76C218
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E382210E47C;
	Wed,  2 Aug 2023 01:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C8910E406
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 01:18:50 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9b9f0387dso98165621fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 18:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690939128; x=1691543928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPDyf9F6oxuLJnO7P0WewXMQuxcYf+gVC6ZTzYByK+E=;
 b=IU6NP0WgZSXz1sRbVhG5dBG1YNHoBoNwWr70pPMsJsXg17Jp1Am/wWay+h5nzZkYL+
 1mwfaJ4DUSyEujrJTaxRu9t/5OChj1H3ILUja8T2dFUGUvYB6Dz5+iGG9XgvCajMNblC
 Pz3TKv3NKth7BW6vEG8jIpTMp5T4xcQ67fHavgCrmnJPxg3XVI5j2ZpeKeGlgXWG26AI
 LagT2gTft8Ap0mKXzfFIdjduL8rZjsBkaj2siP2vS0AeMqptxTXi8T21BBuwcJyO+FlY
 5r4uuEGta3p42oUgY+pRzPWXqXlvbSNklie9ZuStHcKfPKLKJaevdeO3I4z3Ox0LJvZU
 f7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690939128; x=1691543928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPDyf9F6oxuLJnO7P0WewXMQuxcYf+gVC6ZTzYByK+E=;
 b=D+u0ODZ2L92zkIS6mhtibOCTevBt4/XV4F1EOfPLo52nMQkmH3xj4qX7hPB2yOG5Zk
 gwzu/djVPg8UxL+Vcjr78iOVlx3yx9CLG311Ah65pQ5eGhlZoscCkFwG2JEfuL/Vhn+U
 SBoWtpHlCJ92ImfL/jMUqNU7SzUHYslT3LtlSfEmq+a45FZmk5e2p8PhqYZelodHmiXN
 yuV/dL2CRfD8BTluwFUJpa6+YpZDhGmcGE0E2mp2Yh6guR+x2gZYopBsNPPDmrjHU9Nd
 TgAurEN+GQva11y7MngdOvPqYT6SoO2NgykndBHI/7ymKztd0+aHq4NwBKADY5HHvqHn
 XTnQ==
X-Gm-Message-State: ABy/qLaKbz81IKX49LCqp+6kHEASh3HHGyaJtxDzUevxGPWlz6tMyKUf
 J1B/1K4eWinaSEkkDUnY0FzHqw==
X-Google-Smtp-Source: APBJJlEUQJ/AnZzyL3KdBQ7o7SJXRQXwvk7qtSvFOG23+VtHx8zobSUfRfaVwMlnWzrAGh0GG+bIKw==
X-Received: by 2002:a19:6910:0:b0:4fb:8a90:396c with SMTP id
 e16-20020a196910000000b004fb8a90396cmr3202416lfc.38.1690939128584; 
 Tue, 01 Aug 2023 18:18:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a056512388e00b004faeedbb29dsm2775842lft.64.2023.08.01.18.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 18:18:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 2/3] phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
Date: Wed,  2 Aug 2023 04:18:44 +0300
Message-Id: <20230802011845.4176631-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
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
index 9c3de41ecedb..5c7615edb161 100644
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

