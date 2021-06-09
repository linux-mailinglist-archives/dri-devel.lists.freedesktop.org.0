Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF3E3A1EC3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77DC6E4AD;
	Wed,  9 Jun 2021 21:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAA96E405
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:28 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bn21so1721408ljb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBxdJF/+Ft9FymkNGM9uBBfcCj1CPncbr5qPBFszgJY=;
 b=hDmJ8HmgPEknfk4ccDkBJQv1nQvjBwuUNTWk5dXY7lKuoyZCREFblE9hQXix7r2ZfV
 nl1szLHJcGu2K8e7CJsMyK9ThAAiKOaRBWHGllSJ6jXPrKArz+ZfjszO8VQpvsJH8m7n
 axACv4LPzUvl2yXAxiGRfMqGmE0t3MQkAIBjFTdU6i4THaPgCEtYmf+KVIWtQyjlxQoO
 kZo9teu/kLUbsgx9ckNpyQP4AlJvoG085Iyex76ppFnDClxMPiLugcQMwJvFCnFqzKkz
 mi3M3tgRtsQLT56mPRQtr7U1KGczsn1cRRTQSVAT4lmYUfBv5Ue+GQkS6egt4j7/94Sp
 fbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wBxdJF/+Ft9FymkNGM9uBBfcCj1CPncbr5qPBFszgJY=;
 b=aBeCTm7gR3qztip9rKb2IEH5BeQpB8BmtyhaYfxxijvfT6tJvdP8uWypibmVUy/FyG
 Agvw2uMGpoMkdgKKNC14Hg2eUsgRgM8tc7Qezqy36CpxGsAXPDMSo39EJq3su47HEoGE
 84JjE2DYRQLLVHhuB8ZUyHQWmWLkQ1lr3Bm7KCKhfheOxEsM2Q8ddnF8xQK91e5kjCu1
 Zz+U5xpSYQyPg6h4llavKXinW312WJZdUMrWuF3fqNFoGuQEBsb6tnoveFzP8vDd6mg6
 XgsCAmKotJ851ecXm2EWsInJzQaXKpkB4okMsGkqjHPHT5AnZMvgswdOvdXMIBb1Bvh9
 hnNA==
X-Gm-Message-State: AOAM531jO7Pw+MDS9cFSrPEdAUW6+A42x0aBCPsqNOy8DaC/WHlCpOER
 GiXvmj3T+H3wUk3us72OB1OTsA==
X-Google-Smtp-Source: ABdhPJwC41U2qVCEa5iYrM9mgMy9meQC/OT71IOAGSwT9QlfgFEymuUsGZrYpZHMU+oYBMWZovY5LQ==
X-Received: by 2002:a2e:a78c:: with SMTP id c12mr1253878ljf.421.1623273446710; 
 Wed, 09 Jun 2021 14:17:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [RFC 1/6] drm/msm/dsi: add two helper functions
Date: Thu, 10 Jun 2021 00:17:18 +0300
Message-Id: <20210609211723.2565105-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
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

Add two helper functions to be used by display drivers for setting up
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  6 ++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 14 ++++++--------
 drivers/gpu/drm/msm/msm_drv.h         | 12 ++++++++++--
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75afc12a7b25..874c1527d300 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -13,6 +13,12 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
 	return msm_dsi->encoder;
 }
 
+bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
+{
+	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
+	return !(host_flags & MIPI_DSI_MODE_VIDEO);
+}
+
 static int dsi_get_phy(struct msm_dsi *msm_dsi)
 {
 	struct platform_device *pdev = msm_dsi->pdev;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cd016576e8c5..7d4f6fae1ab0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -217,12 +217,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
-{
-	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
-	return !(host_flags & MIPI_DSI_MODE_VIDEO);
-}
-
 void msm_dsi_manager_setup_encoder(int id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
@@ -232,7 +226,7 @@ void msm_dsi_manager_setup_encoder(int id)
 
 	if (encoder && kms->funcs->set_encoder_mode)
 		kms->funcs->set_encoder_mode(kms, encoder,
-					     dsi_mgr_is_cmd_mode(msm_dsi));
+					     msm_dsi_is_cmd_mode(msm_dsi));
 }
 
 static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
@@ -277,7 +271,7 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 	if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
 		kms->funcs->set_split_display(kms, master_dsi->encoder,
 					      slave_dsi->encoder,
-					      dsi_mgr_is_cmd_mode(msm_dsi));
+					      msm_dsi_is_cmd_mode(msm_dsi));
 	}
 
 out:
@@ -840,3 +834,7 @@ void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi)
 		msm_dsim->dsi[msm_dsi->id] = NULL;
 }
 
+bool msm_dsi_is_dual_dsi(struct msm_dsi *msm_dsi)
+{
+	return IS_DUAL_DSI();
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3352125ce428..826cc5e25bcb 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -343,7 +343,8 @@ void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
-
+bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
+bool msm_dsi_is_dual_dsi(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -360,7 +361,14 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
 {
 }
-
+static inline bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
+static bool msm_dsi_is_dual_dsi(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
-- 
2.30.2

