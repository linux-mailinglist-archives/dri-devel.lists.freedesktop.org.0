Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82859421C90
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 04:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C536EB17;
	Tue,  5 Oct 2021 02:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142C76EA5C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 02:23:10 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id e24so24192599oig.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 19:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZD53yNMkUcIS01qS154onKXzIL/7b69q2M6uMmvAQkA=;
 b=x9C1c/f1FtKmThspqGNvBb6HREv06FT+WE8tjB1GFzMdK/rM6MSthINq/+5N279tLW
 D8ZuCsCDziGf7rMmt8xUZuo9b/9M3/2XYdAfbI7LpvmZPY5fvCcdAgvM+5IeIH19iEVD
 XK0Q2pGHa/5nwewwuCxQ4LW5nFypOawxAM3X9Vq/rOWSGT3yj6rRA+g3PqncZZ26oD7u
 scB4Oswm6WeiKL/Sh+f9/Qzndre8Mv9Og6PcMgNnUKzpZeqcsnyYxqcYvVCsKK8ZgKGO
 jopnmLdvYksvuExsnHaUDNkmE6C6OGaIgOj3fpsqiTRdKiYOD54cGac6yrJQPxASEjVI
 p2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZD53yNMkUcIS01qS154onKXzIL/7b69q2M6uMmvAQkA=;
 b=UWDScXZvT6Lw/CT5JC/KWq2kU2OcL7CTBADL6uNWrnH3CdQZ9kDgWN48+6zgsnuK4u
 VDxQlScMP7z+czYS/VS+Wx3wBwEelz/KqAr8ew+xUeSgwygwWbPvgebrQw07Fw4mWU4K
 PlcGRfqWe1BKEnBXqQLOiOFZ18PJWYDhUdu9Ta58iEqUEL97L1YUawUnhH/o0qtwSWk/
 SO+PkbYs9qLh5ymNAJheIC5Q94ws2Modw6S5G1tLJIZQlut0BKjhLDbhQYnfapEB2NHH
 lnMfnZpfpfggt2qVADFynGPnuBLKd593x3hDwkgC3CnOOlSekzzwaQCmJl29WaBqnmOs
 TESw==
X-Gm-Message-State: AOAM530VN9+HLs34e6T6HqgpWlvFDEQ2FEk+IZ86LL7Du3BNeF0P42uX
 aBXJOs9/QEIZrx4PsD91aqalBg==
X-Google-Smtp-Source: ABdhPJzcvoRfuFqJL//8/g70TI12ylSA9Yfkhp0zPB5/pSjhAAUz5HLOzjZWwoL8CIpy0Oz1Gk1Ldg==
X-Received: by 2002:a54:4887:: with SMTP id r7mr462772oic.124.1633400589252;
 Mon, 04 Oct 2021 19:23:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 a67sm3180435otb.0.2021.10.04.19.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 19:23:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC] drm/msm/dp: Add typec_mux implementation
Date: Mon,  4 Oct 2021 19:24:51 -0700
Message-Id: <20211005022451.2037405-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a typec_mux in order to allow a Type-C controller to signal
the connection and attention of DisplayPort to the related USB-C port.

The remains of support for something along this lines was left in
the dp_display as the driver was upstreamed, so these are reused with
minimal modifications necessary.

When operating in this mode, HPD interrupts has still been observed in
the ISR so, in line with the downstream kernel, these are ignored.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This applies on top of https://lore.kernel.org/linux-arm-msm/20211001180058.1021913-1-bjorn.andersson@linaro.org/

 drivers/gpu/drm/msm/Kconfig         |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 54 +++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 5879f67bc88c..4e4b98c448cb 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -9,6 +9,7 @@ config DRM_MSM
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
+	depends on TYPEC || TYPEC=n
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 56a79aeffed4..e863f537047a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -85,6 +85,8 @@ struct dp_display_private {
 	bool hpd_irq_on;
 	bool audio_supported;
 
+	bool use_hw_hpd;
+
 	struct platform_device *pdev;
 	struct dentry *root;
 
@@ -466,11 +468,10 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 	return 0;
 }
 
-static int dp_display_usbpd_attention_cb(struct device *dev)
+static int dp_display_usbpd_attention(struct dp_display_private *dp)
 {
 	int rc = 0;
 	u32 sink_request;
-	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
@@ -690,7 +691,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	ret = dp_display_usbpd_attention(dp);
 	if (ret == -ECONNRESET) { /* cable unplugged */
 		dp->core_initialized = false;
 	}
@@ -709,6 +710,13 @@ static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 	dp_audio_put(dp->audio);
 }
 
+static int dp_display_usbpd_attention_cb(struct device *dev)
+{
+	struct dp_display_private *dp = dev_get_dp_display_private(dev);
+
+	return dp_irq_hpd_handle(dp, 0);
+}
+
 static int dp_init_sub_modules(struct dp_display_private *dp)
 {
 	int rc = 0;
@@ -731,6 +739,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
+	dp->use_hw_hpd = !of_property_read_bool(dev->of_node, "mode-switch");
+
 	dp->parser = dp_parser_get(dp->pdev);
 	if (IS_ERR(dp->parser)) {
 		rc = PTR_ERR(dp->parser);
@@ -1135,27 +1145,29 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
+	if (dp->use_hw_hpd) {
+		hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
 
-	DRM_DEBUG_DP("hpd isr status=%#x\n", hpd_isr_status);
-	if (hpd_isr_status & 0x0F) {
-		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		DRM_DEBUG_DP("hpd isr status=%#x\n", hpd_isr_status);
+		if (hpd_isr_status & 0x0F) {
+			/* hpd related interrupts */
+			if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+				dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 
-		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			/* stop sentinel connect pending checking */
-			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
-			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
-		}
+			if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
+				/* stop sentinel connect pending checking */
+				dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
+				dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			}
 
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
-		}
+			if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
+				dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+				dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			}
 
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+				dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		}
 	}
 
 	/* DP controller isr */
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index e1c90fa47411..2a7ed9b8354e 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -7,6 +7,9 @@
 
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 
 #include "dp_hpd.h"
 
@@ -22,6 +25,8 @@ struct dp_hpd_private {
 	struct device *dev;
 	struct dp_usbpd_cb *dp_cb;
 	struct dp_usbpd dp_usbpd;
+	struct typec_mux *mux;
+	bool connected;
 };
 
 int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
@@ -47,9 +52,45 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 	return rc;
 }
 
+static int dp_hpd_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
+{
+	struct dp_hpd_private *dp_hpd = typec_mux_get_drvdata(mux);
+	struct dp_usbpd *usbpd = &dp_hpd->dp_usbpd;
+	struct typec_displayport_data *dp_data = state->data;
+	int pin_assign = 0;
+
+	if (dp_data) {
+		pin_assign = DP_CONF_GET_PIN_ASSIGN(dp_data->conf);
+		usbpd->hpd_high = !!(dp_data->status & DP_STATUS_HPD_STATE);
+		usbpd->hpd_irq = !!(dp_data->status & DP_STATUS_IRQ_HPD);
+		usbpd->multi_func = pin_assign == DP_PIN_ASSIGN_C || DP_PIN_ASSIGN_E;
+	}
+
+	if (!pin_assign) {
+		if (dp_hpd->connected) {
+			dp_hpd->connected = false;
+			dp_hpd->dp_cb->disconnect(dp_hpd->dev);
+		}
+	} else if (!dp_hpd->connected) {
+		dp_hpd->connected = true;
+		dp_hpd->dp_cb->configure(dp_hpd->dev);
+	} else {
+		dp_hpd->dp_cb->attention(dp_hpd->dev);
+	}
+
+	return 0;
+}
+
+static void dp_hpd_unregister_typec_mux(void *data)
+{
+	typec_mux_unregister(data);
+}
+
 struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 {
+	struct typec_mux_desc mux_desc = {};
 	struct dp_hpd_private *dp_hpd;
+	int rc;
 
 	if (!cb) {
 		pr_err("invalid cb data\n");
@@ -65,5 +106,18 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 
 	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
 
+	mux_desc.fwnode = dev->fwnode;
+	mux_desc.set = dp_hpd_mux_set;
+	mux_desc.drvdata = dp_hpd;
+	dp_hpd->mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(dp_hpd->mux)) {
+		dev_err(dev, "unable to register typec mux\n");
+		return ERR_CAST(dp_hpd->mux);
+	}
+
+	rc = devm_add_action_or_reset(dev, dp_hpd_unregister_typec_mux, dp_hpd->mux);
+	if (rc)
+		return ERR_PTR(rc);
+
 	return &dp_hpd->dp_usbpd;
 }
-- 
2.29.2

