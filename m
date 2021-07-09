Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6B3C2BD3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 01:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CB76E9B9;
	Fri,  9 Jul 2021 23:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2CA6EA9C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 23:50:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f13so26336966lfh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 16:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=49a8wW7cPE/UYu/CgVMiIaLLCRNVbynlrKg04A+ZvZk=;
 b=dZNwrSFcgexHfE1MFXEJp08UR0ysnSEomH8R8ENvmtD7Q9xTSSe7AtMRiXNSjnjlxh
 TqZnGMMRF80DqX9TWTh1LD0zHhFPgi9FI+zb9Ck1H2OLTqyOPCsLSaHAZWBaLJKYP97C
 4xS7wktgCqO5ioEPJCRZs2Hmez7HxKmxZXqiYGNhMELzFArooD/FXYb770Q2k3+of8eZ
 xcyHOaHxTtOyYILTeoxqS22mEspjcKN5HUkZfwrnJqapm8YUmCMw7JtqAOkPy5XV/6xh
 56arP3EoQkp7GG4wh+vcRJvEYpByxKfO1Epb1w1/hCo92p2hTDdOK1dswkhreeFokBLW
 342Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49a8wW7cPE/UYu/CgVMiIaLLCRNVbynlrKg04A+ZvZk=;
 b=ZU2niVSAIlnQpm7u292hq677ZWRiDku9jQVcrxV9qGT33nOq73yvWk0Igrk3Khrnhr
 pF4GCzk6mHDj/NOnHlpSCd/hCAOLOdU3wEhNcN0tW23n9EfpXWM4TW2OKiO2aLL0Ng5e
 zZq9pPWf3gOmOQuF+8ZDbjtF9behVoXcBTrf3t+5+gSuJdp1lVGsVjgKPgSANVbZFbMa
 aw2ctSyLhoUQAp7tnyxgv7YtkTNdiLgkGCDhN8bAJPY0gkKsGOHJTaHbAQ0KphzXXlEA
 fsvvqL5djjw80bddla0KQsuYrlbUyd4caspPPL31b5w6QVZd2Dw5LCnBiFCljGaHrcp6
 JV2w==
X-Gm-Message-State: AOAM530ue8i2tvm1eP2FKUZUH+LRhPgIOCBm7iEocWT1LVp4iHWsHnG/
 vvoAei/BbeIlAdN8Ii4uuu6bUA==
X-Google-Smtp-Source: ABdhPJwj6yZc8GvIU3BEGznwEcnXH+nwJNDKH/3jh+yeQ5njPxIZpWyLa064jVanU2wvkNtn6V9z+A==
X-Received: by 2002:ac2:4345:: with SMTP id o5mr30107129lfl.599.1625874630890; 
 Fri, 09 Jul 2021 16:50:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:50:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 6/7] drm/msm/dsi: stop calling set_encoder_mode callback
Date: Sat, 10 Jul 2021 02:50:23 +0300
Message-Id: <20210709235024.1077888-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  2 --
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ------------
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 5201d7eb0490..77c8dba297d8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -251,8 +251,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	msm_dsi_manager_setup_encoder(msm_dsi->id);
-
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
 	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 856a532850c0..e0c3c4409377 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -80,7 +80,6 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id);
 struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
-void msm_dsi_manager_setup_encoder(int id);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 bool msm_dsi_manager_validate_current_config(u8 id);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a81105633d3c..e7f4e1d8978a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -216,18 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-void msm_dsi_manager_setup_encoder(int id)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
-
-	if (encoder && kms->funcs->set_encoder_mode)
-		kms->funcs->set_encoder_mode(kms, encoder,
-					     msm_dsi_is_cmd_mode(msm_dsi));
-}
-
 static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 {
 	struct msm_drm_private *priv = conn->dev->dev_private;
-- 
2.30.2

