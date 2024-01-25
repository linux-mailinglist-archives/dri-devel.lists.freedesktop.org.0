Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB983D053
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3E310ED01;
	Thu, 25 Jan 2024 23:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3963B10EC92
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:48 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ccec119587so93400491fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223766; x=1706828566; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IQTuJ8wNeg68JOx46UjSbtRu40sdbbzeiAcOLYDTPCw=;
 b=bQhOPVVfxP47O91AreAReMKfZDBeaM4rgsEAaKM3GBzb87nl7Z50J43W/FkpkmTVO5
 raXi1MXVj9e5kMIsEB8CsWfP+jZ9o/dHA9MkXwh4iQJW7l3MjHABumzrIZ/U++xAtxE4
 2Dq8hfmeAn+ujLod/FTGIRUd6sxPKDjGUJyECwwKDp6qzvbJplr/0YLpTarCvhu5iXCy
 uzv+THxHmzgWNNmabqlW9ztC0U+a0mpIeLKiOafNPizwPursegBKbZcKSXIbd6oWQM4K
 BuzmFrJXdBHQY7Jd/dS3ASWIjE1zfAT9bUGHVQXQWM5f5cjMQeYz0FNvsGNEuiSCygmD
 dHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223766; x=1706828566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQTuJ8wNeg68JOx46UjSbtRu40sdbbzeiAcOLYDTPCw=;
 b=PpV68kdj9ynp4XgwM1/Am3YZTEz4Fq8uj57m38Zf1z1tbpKSMlOtlbjBmsSkjTgDVG
 n4qSSVsMlZWU8Nw3Ns6z+mM+WdpnnGMYM7Y8AEAU18GVKUebS0rq5j8LnoNY4xTwTotz
 PBscAoi8402k1ecF4IPxtsCrE3d3W79iBbicmWNiBqc51wcMWdN/f50ZUARytVl21ZFw
 ACT/BmMTiz1rO3Th1f+pNj12WZ0BQRwppJW+0WvnFgemjF/WRAUIdi3kGs3EHrn4z7Mn
 UpIMji3CxZhLoPR6e6AdSktrpQa6mJrOAXf/VabyK5O44VqMzMqBuEs3xtfPtF+N2a8b
 HpzA==
X-Gm-Message-State: AOJu0YxcXgEViVVSHvoMcmkDW97NHu30YP4iQe9QYJcVvRTsoUV2RgOj
 fnwBi2NQpKoCe+9iEukYE1qnsLLORDsVS+1xkYrpxGB0bEanhV6jpTmXc4niVRU=
X-Google-Smtp-Source: AGHT+IFSrOqGPfv75v5XjL5dcp1A1v9CtUu3yzT9DTKpjnkuRzPRsIwxWVFWlVnXT6Ihnk4/ehKTnw==
X-Received: by 2002:a2e:bb9e:0:b0:2cf:3144:3a40 with SMTP id
 y30-20020a2ebb9e000000b002cf31443a40mr251326lje.52.1706223766528; 
 Thu, 25 Jan 2024 15:02:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:39 +0200
Subject: [PATCH v3 10/15] drm/msm/dp: remove PHY handling from dp_catalog.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-10-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiIiF6KzNUnOcKgp0Sj/juS5Fs/pBCsNxMtn
 owYMiQX25eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLoiAAKCRCLPIo+Aiko
 1bpAB/sEIpewx8Dya+nNOMTbkPYqk1xVeYi0cSaU7c9iJcjjsUpcreLQlzOKkOz16tTsrYsBp+3
 mDZQ6d2VJxzT5ZJGGraJ4cP47dULClmzcUId4lMaDFUL45a4tgxXDNn5n625Ui1Ag2MDn/cMbYo
 SL+go+fezyZ6IobYH5X4dCllpp6v4Cg1Rcv7Sy/77eu5e86hADwTVd8Vx8zNW/tQe6yhbyCmUn7
 uzQkI3DzUk3z166gVJm5QkyEGp6uY6O7NWhUVmqA+9jX0oSFEEhECrZVwOumtHw3DlI3KDh5mNL
 trzBSSxhH/QipIXJFrK8oYkWuvShq+E8u5brJ8QRWFYoU2Pn
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

