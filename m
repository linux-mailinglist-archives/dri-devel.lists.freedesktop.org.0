Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9C3A1EC7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1636E9F9;
	Wed,  9 Jun 2021 21:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661BD6E9F9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:31 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r14so1660101ljd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/V8KGR606fRo3VbCDDBvoYkWIJ1I7tpl4I/Xf0Z+Ze8=;
 b=iusOuU9APX/gERLJ2zgM206VROoXn6L21ms88HAtY8lF5tirDi7rBY6jwQJ9eh2oVT
 is+nZRpXoIVG3Eumhk1ttvSGHjHMl6PQgw4Ql26UFJM4QarHxwZhOqpyltj/d1dgHtD5
 SmoPdt5Sb9eGdA8jYueg6x1eJ6FZuPILCLKgSvESoALob5GDv5QrpXuzI8vqlhYtt2Qz
 xTNvhaKqa3YsdDEzCMHt+0sA/VmpSLyzH6iGgRc7nJImfzYP13pomyfoRn+UsVamnzu5
 bJj9JHFV2E3kmUf1qg0bVdPoMAV9rISJfUJhFSYBLgvu7qm3Q3FzOpL9Opi4775l44hE
 NUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/V8KGR606fRo3VbCDDBvoYkWIJ1I7tpl4I/Xf0Z+Ze8=;
 b=FVSxyQoM72VRhmlpEWoy6LOKAwn2vkGJM8XbOR4wd1fx6IlLg+JidFpbN2rLlZHk0f
 kwkVFV0rGI+TpkMqQXOGFPfnYTlNWzACjknRagdTuWCTwfgAhrX+i9tCPIicUVxdJRjB
 Qcn0egrrRGBV2m+t6Mk/NouJpMmYGwc4hv6a7teYjo7/bpbEoGbrTm2kLiedLIg8Bp0X
 XhDXCabflJgbK4qrmAITgyDwleybWlvjLlkRq6jcP4S8bsrRSMMSIYzyqWqBajfZL2NT
 YGPc+nCenxmLatUevHe1tWqBGMKvizHz1w3WJj5JFG8eP+kAKt/TtuAy7ZZAGR9autG0
 yCfw==
X-Gm-Message-State: AOAM532fNOBSc02RbuPXEBbfIhcaFlCXtPUEl3cBR2UfQbl7KZBv7ny8
 D/LkLzTxdy6ABudnZSoGPC9xpQ==
X-Google-Smtp-Source: ABdhPJyMwehaGgcTrzQ8UFpel/tQwHtklY30ohmzqBsWig9ryCJzZk5yRiqNkQbpgKbBZ1EPdBtuRQ==
X-Received: by 2002:a2e:8817:: with SMTP id x23mr1298976ljh.17.1623273449753; 
 Wed, 09 Jun 2021 14:17:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [RFC 5/6] drm/msm/dsi: stop calling set_encoder_mode callback
Date: Thu, 10 Jun 2021 00:17:22 +0300
Message-Id: <20210609211723.2565105-6-dmitry.baryshkov@linaro.org>
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

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  2 --
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ------------
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 874c1527d300..881f14bc022d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -250,8 +250,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	msm_dsi_manager_setup_encoder(msm_dsi->id);
-
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
 	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9b8e9b07eced..c0bdbe63050a 100644
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
index 7d4f6fae1ab0..1996b40d2ae9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -217,18 +217,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
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

