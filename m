Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E45A24AB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5E610E80F;
	Fri, 26 Aug 2022 09:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6AE10E7ED
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:34 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id l8so1265177lfc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+1bTBy3Qw5DuGoK8+Tzb6Ah6TNqnmwTNraiwhKdmwR4=;
 b=KFQFh51NXldRfmWT+gLJbwjEPJH4OXGKTJ1OPeKDKoW0cC4+Xm6fDQqMfrmOFCeiAa
 ji4BkNcCnvd7B0NYLzkJcfFYgoAoHl2awys2xtMoThO0ol4f9e1sVrdjBTfJAW2fney/
 E9APrOwdQPiQ6gibX+bDaeTLsjYkvIPuqvMDEUugYN97oVl1UEfioNEwDDIKyE8ZOWRI
 nLlbQknq/L92oZXcAzi2mhotP+SXjGrOtgMyuoZSW0AOjgh3zA0sgoYFCnVbDLai6pLH
 9NaGcsAhyHrSGJCAsCloGNCO+e8plOWhUGUBtmZ+l21eNZov5XSXlQEv95rAP4tUiKWc
 lbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+1bTBy3Qw5DuGoK8+Tzb6Ah6TNqnmwTNraiwhKdmwR4=;
 b=ZAtyeTmjI7o3RvmkU9U9IWmklXr3pHd1dQz15lPQ3/FA+z0JVnW/PbRvnjJkZpXxYC
 0DyXRgjtJKqcJsDHKjk6ClSGjlKUU111M3ZoJ9OV7wHCt4qCrrlzcF8qt/oAsTf8umiq
 LX7X+txpqIuHl9QXDGORipEjHrk3WMrHwcA2akyvoztUUHFLWwtlwFVYY3BcqU48e6qc
 0LTh1aU1Us9Vj2qOifiNgPGLI/BZmUR0AU74/vqSTpsW4zEViyCpg2obWOURSpJJ+g3o
 VjZPuQNEgn75FYLwRLU3bi97d+p0Zw+JZLGuzS9cpC+4iIB9RDYkYAiqdp4BbssMM9JH
 y5Cw==
X-Gm-Message-State: ACgBeo26fNF0nqIWDRhoRw9r7v7MRFLp3LO+HIiS+CYzACa0ipaCmVlT
 i6fhHsYz8RPNSXMtW/tuYTcNsQ==
X-Google-Smtp-Source: AA6agR4MjTSK2a1wzZxnLil7UixcsK3+uoWW4eB3KQNvXFBfuAFSTWRzpvfb3Zi9fnV7B7YxwTWPiA==
X-Received: by 2002:a05:6512:6c8:b0:48a:f375:9ecc with SMTP id
 u8-20020a05651206c800b0048af3759eccmr2151757lff.206.1661506774245; 
 Fri, 26 Aug 2022 02:39:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 5/5] drm/msm/hdmi: move msm_hdmi_get_phy() to
 msm_hdmi_dev_probe()
Date: Fri, 26 Aug 2022 12:39:27 +0300
Message-Id: <20220826093927.851597-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To continue the idea of failing the probe() rather than failing the
bind(), move the call to msm_hdmi_get_phy() function to
msm_hdmi_dev_probe(), so that the driver fails the probe if PHY is not
yet available rather than succeeding the probe and then failing the
bind() with -EPROBE_DEFER.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 40 ++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 926274eeee25..adaa67d9a78d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -68,14 +68,17 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 		destroy_workqueue(hdmi->workq);
 	msm_hdmi_hdcp_destroy(hdmi);
 
+	if (hdmi->i2c)
+		msm_hdmi_i2c_destroy(hdmi->i2c);
+}
+
+static void msm_hdmi_put_phy(struct hdmi *hdmi)
+{
 	if (hdmi->phy_dev) {
 		put_device(hdmi->phy_dev);
 		hdmi->phy = NULL;
 		hdmi->phy_dev = NULL;
 	}
-
-	if (hdmi->i2c)
-		msm_hdmi_i2c_destroy(hdmi->i2c);
 }
 
 static int msm_hdmi_get_phy(struct hdmi *hdmi)
@@ -91,19 +94,15 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
 	}
 
 	phy_pdev = of_find_device_by_node(phy_node);
-	if (phy_pdev)
-		hdmi->phy = platform_get_drvdata(phy_pdev);
-
 	of_node_put(phy_node);
 
-	if (!phy_pdev) {
-		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
-		return -EPROBE_DEFER;
-	}
+	if (!phy_pdev)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
+
+	hdmi->phy = platform_get_drvdata(phy_pdev);
 	if (!hdmi->phy) {
-		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
 		put_device(&phy_pdev->dev);
-		return -EPROBE_DEFER;
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
 	}
 
 	hdmi->phy_dev = &phy_pdev->dev;
@@ -130,12 +129,6 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 		goto fail;
 	}
 
-	ret = msm_hdmi_get_phy(hdmi);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
-		goto fail;
-	}
-
 	hdmi->hdcp_ctrl = msm_hdmi_hdcp_init(hdmi);
 	if (IS_ERR(hdmi->hdcp_ctrl)) {
 		dev_warn(&pdev->dev, "failed to init hdcp: disabled\n");
@@ -528,6 +521,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
+	ret = msm_hdmi_get_phy(hdmi);
+	if (ret) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
+		return ret;
+	}
+
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
@@ -539,7 +538,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 
 static int msm_hdmi_dev_remove(struct platform_device *pdev)
 {
+	struct hdmi *hdmi = dev_get_drvdata(&pdev->dev);
+
 	component_del(&pdev->dev, &msm_hdmi_ops);
+
+	msm_hdmi_put_phy(hdmi);
+
 	return 0;
 }
 
-- 
2.35.1

