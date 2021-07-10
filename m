Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED13C371C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 00:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF7E6EB6F;
	Sat, 10 Jul 2021 22:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D876EB6F
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:14 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u25so15206838ljj.11
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRZhkjy0dQDJbOhaefbmkPeax0IavLpLmH4VRR7TqLc=;
 b=hgwD6z8LWDe5sbVvkFtjpDrVXv+Ced2cz/fgiJkO8E/L2CJcBsPcARHJiKGIAHPj0I
 XqRlp7aUCu6gL9SYPjTkauYcWMBD/bDH4bzDpj4J+BnK6YRVscrX9kasRSrkP1LyNmlT
 /12h8jicDvs0TJ8gZnUQ4oE216XVnDoL/jfhXu5sR6jdKtbUuoZc+UIl/c/GYiastBor
 8RB6dijbky8rFyrv6N9Iq71MJgeVbdKIa+aw+L/DufpAmL/GhheygMVnxMnexazHy8dv
 LtKapih5Cu5SLEz4mhidSsDiyhAzuhKBn2RTjYfjD0RewKNN4ar28Zo8AtMA3w30ZP1C
 BLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRZhkjy0dQDJbOhaefbmkPeax0IavLpLmH4VRR7TqLc=;
 b=Ossn4K0dGRmmzIQF7O8LfLM7KPAx8BADI48dirlCeB6TColIHu/xryE723IRNz0bGv
 q7x93j/JDr69seZcOUrqGVdmqdHUSnSu4a7SWupAART4qg3nO6hEHu738rChZVfrbXNH
 rANift+N8ZmgHDYfL+0QO3bzOXfqKubAUTggkjwQ9aHDz9VcYcv+ELL6guboA80QSc8Y
 Vm7NLj035lsSpI7kG/WslniXa8XJfJ2o4/x0CE4KncTfmfOOcHy2aCjstnlmwwKJEwWZ
 u4wbFSVmmXqjEZTT55V8aMudZMNgGhMlEDZkyKjBRkA9xzS3lgxXyVLwfryFcnDdeDjb
 avaw==
X-Gm-Message-State: AOAM533DSEDG/FPHUnSGcbyckpGpJxyA4aULUrRhG+tUxZdRaShAqurP
 BWALMIPk5Ve7CGkWLTG64mWN1g==
X-Google-Smtp-Source: ABdhPJx0Vc4ETokDuLCPHmxRY1aeFavU/wbgFBcToQf6sJij4THw6kMVZySNuRV0gaUHW9c9vpYJQg==
X-Received: by 2002:a2e:6c10:: with SMTP id h16mr5636175ljc.312.1625955613218; 
 Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 6/7] drm/msm/dsi: stop calling set_encoder_mode callback
Date: Sun, 11 Jul 2021 01:20:04 +0300
Message-Id: <20210710222005.1334734-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
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
index 27d3b9ebf831..693078e68fd4 100644
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

