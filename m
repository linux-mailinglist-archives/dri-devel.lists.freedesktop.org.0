Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F130F7D77F7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 00:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3CC10E729;
	Wed, 25 Oct 2023 22:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C138310E5F6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 22:30:37 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bfed7c4e6dso3378711fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698273036; x=1698877836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BPC0gvdjP8wM+oIvBMJYIiBTyxbJHuviF4Sm6CqMh8=;
 b=ULUcsdmJLrxJL4sHc7CNRZ/TMjtWMHNiQXWKovp21vhZE+2uIZbbjlRKQHRkXgoYfW
 A1byCKkD2UYRrA1i3ZQZIJy16R1fIH7Z9ZvI9dFa2IFzssJte67vBZg/IdHlgO4W2HNz
 SfdFawV7Zu0cRgbXqG5PRwv+2dVQdP/+lrNfVAo1E5JIdTNcCvKue1Vd/5kH4TfUBPNs
 heLJCiSNBMCQe2MedgpO7k8a7Mkq8uQVJrIrpyEVZGRPui6PokAAgaCIFs1WOJxRyR6I
 SuB5d+3usWSYjPjg9GZRF9K1E/30brguzoHVdwFAV/51JYOMa4IXTj7DQEvqQJsFh3X1
 HSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698273036; x=1698877836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BPC0gvdjP8wM+oIvBMJYIiBTyxbJHuviF4Sm6CqMh8=;
 b=gbhDd07qZfvj+5ZOaiUe7VyxvYQYXYZMsW4bav6ix8edoXAIaOEqNezM8xdGyMMfZ4
 4S+2MUFDln1N/4xPLk686pegGRSrixjoRS5H1jARDwfphNdeNloQej76tCgZAhrYk4vG
 pdgbijdRKFt9KQW7g9S7PfkoZhJg/rcngazOOIhMr6jCvmV7rteFGx7dOG8koNP36CPT
 P3cYeLlePoF7mUtX+P6UrJ2QWTXExuQHKPWLpn3QKU1V03g2wOb/UVClvGKbdYB/cx8Y
 tX2Byzlu4K/sRwF3xulstFd/6emuW9MnBrl70RPFRf1DrnwpYDy2S2v0phksgMd4IIbn
 pDXQ==
X-Gm-Message-State: AOJu0YykWUBhpEdh2hKuwz7E7FT3l6t2OvN/fRkGUy7Qw0u9lfAfP9Yc
 NcwLmBqyu1/prESoeZ23WtK7nQ==
X-Google-Smtp-Source: AGHT+IGs/BWXfJ4hALXW5GTDDn/R5PVKdMi+0bQF8BkcG9HtcaVYNOa+oCwLx2BP8qdJj5NA5N5fgA==
X-Received: by 2002:a2e:a589:0:b0:2c5:1a8e:e4c9 with SMTP id
 m9-20020a2ea589000000b002c51a8ee4c9mr12892138ljp.31.1698273036102; 
 Wed, 25 Oct 2023 15:30:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a36-20020a05651c212400b002bcbae4c21fsm2612543ljq.50.2023.10.25.15.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 15:30:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
Date: Thu, 26 Oct 2023 01:28:06 +0300
Message-ID: <20231025223027.943563-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
References: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
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

Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
same functionality for the DRM bridge chain termination.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig              |  1 +
 drivers/soc/qcom/pmic_glink_altmode.c | 33 ++++++++-------------------
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index b3634e10f6f5..c954001ae79e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -86,6 +86,7 @@ config QCOM_PMIC_GLINK
 	depends on OF
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
+	select DRM_AUX_HPD_BRIDGE
 	help
 	  The Qualcomm PMIC GLINK driver provides access, over GLINK, to the
 	  USB and battery firmware running on one of the coprocessors in
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 6f8b2f7ae3cc..cb0db362447c 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -11,7 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
@@ -76,7 +76,7 @@ struct pmic_glink_altmode_port {
 
 	struct work_struct work;
 
-	struct drm_bridge bridge;
+	struct device *bridge;
 
 	enum typec_orientation orientation;
 	u16 svid;
@@ -230,10 +230,10 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 	else
 		pmic_glink_altmode_enable_usb(altmode, alt_port);
 
-	if (alt_port->hpd_state)
-		drm_bridge_hpd_notify(&alt_port->bridge, connector_status_connected);
-	else
-		drm_bridge_hpd_notify(&alt_port->bridge, connector_status_disconnected);
+	drm_aux_hpd_bridge_notify(alt_port->bridge,
+				  alt_port->hpd_state ?
+				  connector_status_connected :
+				  connector_status_disconnected);
 
 	pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);
 };
@@ -365,16 +365,6 @@ static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv
 	}
 }
 
-static int pmic_glink_altmode_attach(struct drm_bridge *bridge,
-				     enum drm_bridge_attach_flags flags)
-{
-	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
-}
-
-static const struct drm_bridge_funcs pmic_glink_altmode_bridge_funcs = {
-	.attach = pmic_glink_altmode_attach,
-};
-
 static void pmic_glink_altmode_put_retimer(void *data)
 {
 	typec_retimer_put(data);
@@ -464,15 +454,10 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->index = port;
 		INIT_WORK(&alt_port->work, pmic_glink_altmode_worker);
 
-		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
-		alt_port->bridge.of_node = to_of_node(fwnode);
-		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-
-		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
-		if (ret) {
+		alt_port->bridge = drm_dp_hpd_bridge_register(dev, to_of_node(fwnode));
+		if (IS_ERR(alt_port->bridge)) {
 			fwnode_handle_put(fwnode);
-			return ret;
+			return PTR_ERR(alt_port->bridge);
 		}
 
 		alt_port->dp_alt.svid = USB_TYPEC_DP_SID;
-- 
2.42.0

