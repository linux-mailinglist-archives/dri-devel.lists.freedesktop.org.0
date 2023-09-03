Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09444790E67
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1E410E248;
	Sun,  3 Sep 2023 21:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D210E21D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:42:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50091b91a83so1453370e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777319; x=1694382119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Z9KfdzRz+e1f0Dn+tIMZYjzQ2uNwluev0VEi7a5dtY=;
 b=imLaW2TXA378irhHs3Xg+bklfNzReVlL3yTHnovFEzS5syoR8tHD639P321XZof+Wf
 w/2zsz6o+ZNibu4S+QNEXrhAkhIaxsreVwwVCuEpU9Go19UkDLiwJE1pDQAlV48WptI6
 lHYWFV64tlIBdzj0YOGZWHsA29CIrz8EhQFkSc+JaVUMIn67AGDyCMLHLNeKwXvxZUu8
 w5E0Pwik0aIm2kdqYMjVLob5SMw05mb+5a1BfLBxOggYdnB9rpm/BocgKtSPlXRbzAvJ
 stsKdMo47zB3UtStb2ubyU7d0GofSEFaVKuY/xtB6O1yWnewqDJT4m5Y4K69Mt+6j+NO
 O41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777319; x=1694382119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Z9KfdzRz+e1f0Dn+tIMZYjzQ2uNwluev0VEi7a5dtY=;
 b=LprFA3nJI4TgH6tDDVcZtfvb8vUpCLaqOSgj3U3AlA/nVTQJGGHpHLsdwndtzvOhZP
 Cdjz9Mocmxsmr+04LjBjq2FYZsEsLGo9hKYsqj6ez6VnKh7/8C7I2C2uQ4QHfQ/G2wEW
 RxgFyGQY9Exc5msZOSeU3bbNPDUj7w36mR902C/2/vmuAk0DwhLPregCRUConKPJzSQT
 xQFWa8ECnxMduP3T3b9Iif2s1v60Z4LWoVcS/HvQu3SRacDximg1pzwqZJmgnCepHIf7
 ZF0/j3rrON3yCX54m3AWGvZaU4Xn9XztHgI+Xq27XouRxptj7UqIlwT1OSI6WauGklNx
 C50A==
X-Gm-Message-State: AOJu0Yy6jQrRcn0DxDgNYxdSTLEwpQMPu3qqAvjIUAlm2m5KtngZfvMw
 +vs2sEgSMjrMdJFZLP6wKxAfFQ==
X-Google-Smtp-Source: AGHT+IEMobz+Krc+0cqSQPSTTEZbkkDAuHF3uHKlCMRtDr3G2ANxRagameLnEyWRzywcqzd4HevbIQ==
X-Received: by 2002:a05:6512:ac3:b0:4f9:5a87:1028 with SMTP id
 n3-20020a0565120ac300b004f95a871028mr6541101lfu.30.1693777319560; 
 Sun, 03 Sep 2023 14:41:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH v1 11/12] usb: typec: qcom: extract DRM bridge
 functionality to separate file
Date: Mon,  4 Sep 2023 00:41:49 +0300
Message-Id: <20230903214150.2877023-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to simplify source code and to reduce the amount of ifdefs in
the C files, extract the DRM bridge functionality to the separate file.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/Makefile          |  4 ++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 40 +++----------------
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c | 38 ++++++++++++++++++
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h | 20 ++++++++++
 4 files changed, 67 insertions(+), 35 deletions(-)
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h

diff --git a/drivers/usb/typec/tcpm/qcom/Makefile b/drivers/usb/typec/tcpm/qcom/Makefile
index dc1e8832e197..6d01ec97c9fd 100644
--- a/drivers/usb/typec/tcpm/qcom/Makefile
+++ b/drivers/usb/typec/tcpm/qcom/Makefile
@@ -4,3 +4,7 @@ obj-$(CONFIG_TYPEC_QCOM_PMIC)		+= qcom_pmic_tcpm.o
 qcom_pmic_tcpm-y			+= qcom_pmic_typec.o \
 					   qcom_pmic_typec_port.o \
 					   qcom_pmic_typec_pdphy.o
+
+ifneq ($(CONFIG_DRM),)
+	qcom_pmic_tcpm-y	+= qcom_pmic_typec_drm.o
+endif
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index ceda594a8d56..b9d4856101c7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -18,8 +18,7 @@
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec_mux.h>
 
-#include <drm/drm_bridge.h>
-
+#include "qcom_pmic_typec_drm.h"
 #include "qcom_pmic_typec_pdphy.h"
 #include "qcom_pmic_typec_port.h"
 
@@ -34,9 +33,9 @@ struct pmic_typec {
 	struct tcpc_dev		tcpc;
 	struct pmic_typec_pdphy	*pmic_typec_pdphy;
 	struct pmic_typec_port	*pmic_typec_port;
+	struct pmic_typec_drm	*pmic_typec_drm;
 	bool			vbus_enabled;
 	struct mutex		lock;		/* VBUS state serialization */
-	struct drm_bridge	bridge;
 };
 
 #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
@@ -150,35 +149,6 @@ static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM)
-static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
-				     enum drm_bridge_attach_flags flags)
-{
-	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
-}
-
-static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
-	.attach = qcom_pmic_typec_attach,
-};
-
-static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
-{
-	tcpm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
-#ifdef CONFIG_OF
-	tcpm->bridge.of_node = of_get_child_by_name(tcpm->dev->of_node, "connector");
-#endif
-	tcpm->bridge.ops = DRM_BRIDGE_OP_HPD;
-	tcpm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-
-	return devm_drm_bridge_add(tcpm->dev, &tcpm->bridge);
-}
-#else
-static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
-{
-	return 0;
-}
-#endif
-
 static int qcom_pmic_typec_probe(struct platform_device *pdev)
 {
 	struct pmic_typec *tcpm;
@@ -241,9 +211,9 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	mutex_init(&tcpm->lock);
 	platform_set_drvdata(pdev, tcpm);
 
-	ret = qcom_pmic_typec_init_drm(tcpm);
-	if (ret)
-		return ret;
+	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
+	if (IS_ERR(tcpm->pmic_typec_drm))
+		return PTR_ERR(tcpm->pmic_typec_drm);
 
 	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
 	if (!tcpm->tcpc.fwnode)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
new file mode 100644
index 000000000000..e202eb7b52db
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023, Linaro Ltd. All rights reserved.
+ */
+
+#include <linux/of.h>
+
+#include <drm/drm_bridge.h>
+
+struct pmic_typec_drm {
+	struct drm_bridge bridge;
+};
+
+static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
+				     enum drm_bridge_attach_flags flags)
+{
+	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
+}
+
+static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
+	.attach = qcom_pmic_typec_attach,
+};
+
+struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
+{
+	struct pmic_typec_drm *tcpm_drm;
+
+	tcpm_drm = devm_kzalloc(dev, sizeof(*tcpm_drm), GFP_KERNEL);
+	if (!tcpm_drm)
+		return ERR_PTR(-ENOMEM);
+
+	tcpm_drm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
+	tcpm_drm->bridge.of_node = of_get_child_by_name(dev->of_node, "connector");
+	tcpm_drm->bridge.ops = DRM_BRIDGE_OP_HPD;
+	tcpm_drm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+
+	return ERR_PTR(devm_drm_bridge_add(dev, &tcpm_drm->bridge));
+}
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
new file mode 100644
index 000000000000..01f4bb71346b
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023, Linaro Ltd. All rights reserved.
+ */
+
+#ifndef __QCOM_PMIC_DRM_H__
+#define __QCOM_PMIC_DRM_H__
+
+struct pmic_typec_drm;
+
+#if IS_ENABLED(CONFIG_DRM)
+struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev);
+#else
+static inline pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
+{
+	return NULL;
+}
+#endif
+
+#endif /* __QCOM_PMIC_DRM_H__ */
-- 
2.39.2

