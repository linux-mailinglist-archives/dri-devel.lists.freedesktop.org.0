Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F77D82095B
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 01:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8400910E116;
	Sun, 31 Dec 2023 00:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CB910E0E2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 00:44:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e7dff3e9fso5003908e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 16:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983444; x=1704588244; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IQTuJ8wNeg68JOx46UjSbtRu40sdbbzeiAcOLYDTPCw=;
 b=J0LQc9MRmnHYZwEi6QtdFpiXL0RztbVS5jBV9WvDumwaArlDUqro8y+A5VbEYWKj+1
 DHljxESpYhEJfYgmlozYvGfYB7u+dQ7Ag7ZEC/jD4eLWyL8H+98mDCfCXM0J/DLV1Ay1
 sqH3RxTwgjai+qLsPT6zplHp7xeCC9GMKmKs2Oqp8+2Kjoyy1Tj5G5q40AuzpWwJgDB4
 yyD4EBEBM5inUr5Dot6I29SfJepGVaX2ukBwn43uVkyCWVztSnPnfmN0d+5Z+rEgw3pl
 /es/EQRWatI8YW+xr6K4SC4hyWkdFbxwYH55o7P3iE8chNoizXSX0HstzihngTnxXfTx
 KekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983444; x=1704588244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQTuJ8wNeg68JOx46UjSbtRu40sdbbzeiAcOLYDTPCw=;
 b=UIZvNjyjxgiOcwJnrCJPf6EdXuMfD0zmGKXkH6TzHvlK8DrNkbyVssBybVWxQBA0ZD
 l3FV8yuDhkR6tqnUHdB7gG6670BIV7qGJXXQPfZ+VrVtd3UjYgUgl215B7OTAJDBbzDY
 tdPFv2JXBlAJD6JGYrVhTaoFtNF3q5EY8dZOI0du8GLTObCiFYS2LG7te7wYjAHfMuWE
 vR4TSFyd4mAgHPgXmgPznX4howJJ5B0MNDPKe2bMDLXe2WQ77tYR89GrEWEQ6huj8oNz
 97BYqCJuC3NjNws4O0O3nqMrBSyAgQh3mYCZZAvM5CepGwcOwI8dw9oOnT+VHs2CuGeE
 qwBQ==
X-Gm-Message-State: AOJu0YwerU1qgcUoV54EcwSrmVgPQZ+zYHoboq8yeNv5wo1Mx+eQXjst
 psnPJ0m2B9FhUSsASYpVaTReBtrc7YIuwA==
X-Google-Smtp-Source: AGHT+IE8dowWpxKdGXhG1NOkCLp5/Vfmg9ZKW6b7JYn9T++S2dPfTnmj4gonQ35t63XBmCABXA+vuw==
X-Received: by 2002:a19:f814:0:b0:50e:76f8:4fd3 with SMTP id
 a20-20020a19f814000000b0050e76f84fd3mr3551391lff.67.1703983444399; 
 Sat, 30 Dec 2023 16:44:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:44:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:57 +0200
Subject: [PATCH v2 10/15] drm/msm/dp: remove PHY handling from dp_catalog.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-10-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lj8fVAqF9xjHx1KrBL3A1/vTOxjI6sPTTzeJIEKTWus=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlKYtIjSUKrW19STyvBa5h1Xgv60wgPPKTjg
 /AtG1iv5PGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SgAKCRCLPIo+Aiko
 1RhFCACyezgIjytPk7U3WDOoF8PK48MbzZXjnp7nOLOpYWqQc/WJmWSTwNUc1NHw2foawFseq5D
 QXTzPmfQEgF3+ndIsvv/YwS7uQJMi/Poy+Q7Ae7qPWWJa3lFz4Gus1FdHjFG+hqyYlw2cZS/ADr
 xWJQ48r1AjorSSo3HLUygzx67QiRHOX4wjKNqsx1x/IzRdQ6aGFKQBQrcp2MpO2KNQFXXPgnYjk
 7Rms6aUzD1nw5qBXu2CCmjBjTkF6R4i7US2KYrdDC96YPuY+PCY/wByDz2AFWI0/SvnH8/I2ZMd
 F+maun5E26iEgPc1qEVZ/9x03OnnFYWFEINw0IiemP259NKF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inline dp_catalog_aux_update_cfg() and call phy_calibrate() from dp_aux
functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |  9 +++++++--
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 12 ------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
 5 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..adbd5a367395 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/phy/phy.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
@@ -23,6 +24,8 @@ struct dp_aux_private {
 	struct device *dev;
 	struct dp_catalog *catalog;
 
+	struct phy *phy;
+
 	struct mutex mutex;
 	struct completion comp;
 
@@ -336,7 +339,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		if (aux->native) {
 			aux->retry_cnt++;
 			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
-				dp_catalog_aux_update_cfg(aux->catalog);
+				phy_calibrate(aux->phy);
 		}
 		/* reset aux if link is in connected state */
 		if (dp_catalog_link_is_connected(aux->catalog))
@@ -439,7 +442,7 @@ void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	dp_catalog_aux_update_cfg(aux->catalog);
+	phy_calibrate(aux->phy);
 	dp_catalog_aux_reset(aux->catalog);
 }
 
@@ -517,6 +520,7 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 }
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      struct phy *phy,
 			      bool is_edp)
 {
 	struct dp_aux_private *aux;
@@ -537,6 +541,7 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 
 	aux->dev = dev;
 	aux->catalog = catalog;
+	aux->phy = phy;
 	aux->retry_cnt = 0;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 511305da4f66..16d9b1758748 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -17,6 +17,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
+			      struct phy *phy,
 			      bool is_edp);
 void dp_aux_put(struct drm_dp_aux *aux);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index e07651768805..4c6207797c99 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -7,8 +7,6 @@
 
 #include <linux/delay.h>
 #include <linux/iopoll.h>
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-dp.h>
 #include <linux/rational.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -243,16 +241,6 @@ void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
 	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	struct dp_io *dp_io = catalog->io;
-	struct phy *phy = dp_io->phy;
-
-	phy_calibrate(phy);
-}
-
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 {
 	u32 state;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index ba7c62ba7ca3..1f3f58d4b8de 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -84,7 +84,6 @@ int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
 int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6fbbd0f93d13..c1a51c498e01 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -729,7 +729,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
+	dp->aux = dp_aux_get(dev, dp->catalog,
+			     dp->parser->io.phy,
+			     dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);

-- 
2.39.2

