Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3D7E0BD3
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 00:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D69310EB03;
	Fri,  3 Nov 2023 23:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C2A10EAFC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 23:04:21 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507a5f2193bso2776136e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699052660; x=1699657460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QARkaW3YAHrIEHRWT+FmbK4DkLcRgyf7kmgHichP+rw=;
 b=XnvzKyoovt/y3Ahkog6DlZC5vTm+tw9O1DZ5L0hSaF0ec4ghl6Hr2tAIcS/gAwut/6
 5DsPeN5dXOCPogmFYb9yjKvSBwVYjLM9xQ9jIXUCayaF55Miv6+Nct4f05k3GA4mnmwe
 BUsgKLbIJtedSzfrQ2U33USRbaEUf4juBttENL3Emxz/YF4GI/909ULFwOjA/xFSIPAv
 GPJeZ2INjFGvde6eMfj+aEa1wZmKp3LbAxXjjdjrPvb/ROd3DRNyqnbJ9l/dqn0nZIVx
 phquWeiwCJkFMUpaaysfT8OK01QWUhTkx6Er+HIk0ENBH97heaz5BYrp/CWx8RxymsNf
 Jnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699052660; x=1699657460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QARkaW3YAHrIEHRWT+FmbK4DkLcRgyf7kmgHichP+rw=;
 b=Uo0llHEW2tLgmksFRBIFN5IVCNEsik8wSWQtFbZkOKU+Y1IulnaZ8lr92BtViGvcbM
 E7aVuFotdZX7Ur8KXCSZhA+OtVtmZRagLG2twguPPuNkVvUmJPd1YoUwFCqFEltxghcK
 /GVzwU+k4PKf1/8CqOh6s9DCYH+WYffFCWZFdoOh7plW5H0lkvYlbluhyn4u/D6Wmmv4
 ZE+4gdTt4QGQEceVkKfUh+iUgFPrQeVreopqroQjhXs4NdNvkqwQ7SJmwcY8p12Z1QZl
 WTzD5gSfC5W1v3PAFdRDE3X93+cPx/Vre9TO28O0+MrKQR32lYZptCQqMMnUKwsd10Vo
 0d7Q==
X-Gm-Message-State: AOJu0YzDH+i6tp5qiuUf3Rx4A0YJYnFA7QoTYyrqQzukY6pW8nShWgQ1
 bW+vn+x4Iux/POr+JEGmY8gzaQ==
X-Google-Smtp-Source: AGHT+IHxZ3SwBOE6PCX0jYjbOHiWg1mHD/29WBAeYOQpW39iEwAyMKXLx8WJMBpsaR9rgdUOupSWJA==
X-Received: by 2002:a19:8c41:0:b0:500:c00e:8f15 with SMTP id
 i1-20020a198c41000000b00500c00e8f15mr1391304lfj.16.1699052659811; 
 Fri, 03 Nov 2023 16:04:19 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 16:04:19 -0700 (PDT)
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
Subject: [PATCH v6 5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
Date: Sat,  4 Nov 2023 01:03:08 +0200
Message-ID: <20231103230414.1483428-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
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

