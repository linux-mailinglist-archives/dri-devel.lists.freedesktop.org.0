Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D338245E022
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 19:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EA66E457;
	Thu, 25 Nov 2021 18:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FEE6E420
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 18:01:18 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id p8so503757ljo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 10:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ynwG4NbHg4X5JMdO8pH96G9Wv988uerBIA+nf4r1wKk=;
 b=Lf9RQccj7htjEysn7T/OVOaVJzbpsW5S+bTEFkAP0QG/9NWtATiBqZrMDO/IiR015F
 9i0miGLPORiRxK99o9gKSdN0im3lgDvA9hQ3kGBEblbqVFCWpi9w+jDdO22YRbpCMosf
 OTixRIJi6ToshrNj1rvzy1hSXJpxD9wSIadcjsInu2GTW8U4zDwRFQNtAFGcRMCD9jx4
 ZffKjpWyHfPcNmtX2WzNT+f8DRpuSzwyoeLc0yq0ioZCrllK5V9+1MK7HG8CJ0mzxShU
 O2F/4pHshsN46wIgpjuJT3Wya0Wzc+OzaorXI6FnlQhZIsR081WQwhppgmC5AcZ9vMMD
 89ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ynwG4NbHg4X5JMdO8pH96G9Wv988uerBIA+nf4r1wKk=;
 b=nmstZ7QQhXRdaYqyPZRL6XehlrQ0yP8UkRDDKgsnx7CMFGwPAdbERNlN6wYDjbQ7sr
 UUJYLLMajGqQiPdmvf8/qxcvXhPQZfmEVsdlT57TOhUQPXNf/WsTdJFTQ1fGc61HdjR+
 Hft2jaaFFujSDC8CMt5l7t2IuGdIMzq9q85niZXfaz3FnVZbLe/Wn/ga4muN35eVaJIJ
 rUqWO7Tl35Dv6Re23jsrEmEivdVqv6p6J8aJU4hDSke/u2utSvSJAXTZn1Uv8Fc1GtJ6
 m23iKvoVHUxY1M5gjDa41oyLzd9nNZmXk4aN8bfoe1v4v4fORvvRZ4ivHhCsYX9G/EhS
 Rl/g==
X-Gm-Message-State: AOAM533olf9ObQecrUR7+cv646jVSzRrXpARRlanSctL4aFfowFwaYtL
 g2M78um/99PQUScYMsupuXgw5g==
X-Google-Smtp-Source: ABdhPJw33JWXItJy2u8lGIRYrValQuMuKOHbanYZyU2Kqt/vDbH8kCiuWvbT+NbEk54d3pP73ShV0Q==
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr17933127ljj.105.1637863276829; 
 Thu, 25 Nov 2021 10:01:16 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l20sm318194lfj.36.2021.11.25.10.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 10:01:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dsi: fix initialization in the bonded DSI case
Date: Thu, 25 Nov 2021 21:01:14 +0300
Message-Id: <20211125180114.561278-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 739b4e7756d3 ("drm/msm/dsi: Fix an error code in
msm_dsi_modeset_init()") changed msm_dsi_modeset_init() to return an
error code in case msm_dsi_manager_validate_current_config() returns
false. However this is not an error case, but a slave DSI of the bonded
DSI link. In this case msm_dsi_modeset_init() should return 0, but just
skip connector and bridge initialization.

To reduce possible confusion, drop the
msm_dsi_manager_validate_current_config() function, and specif 'bonded
&& !master' condition directly in the msm_dsi_modeset_init().

Fixes: 739b4e7756d3 ("drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 10 +++++++---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 17 -----------------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75ae3008b68f..fc280cc43494 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -215,9 +215,13 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	if (!msm_dsi_manager_validate_current_config(msm_dsi->id)) {
-		ret = -EINVAL;
-		goto fail;
+	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
+	    !msm_dsi_is_master_dsi(msm_dsi)) {
+		/*
+		 * Do not return an eror here,
+		 * Just skip creating encoder/connector for the slave-DSI.
+		 */
+		return 0;
 	}
 
 	msm_dsi->encoder = encoder;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 66443dc98500..ef8212990254 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -82,7 +82,6 @@ int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
-bool msm_dsi_manager_validate_current_config(u8 id);
 void msm_dsi_manager_tpg_enable(void);
 
 /* msm dsi */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a152dbf63038..a73cfeb93e90 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -645,23 +645,6 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
 	return ERR_PTR(ret);
 }
 
-bool msm_dsi_manager_validate_current_config(u8 id)
-{
-	bool is_bonded_dsi = IS_BONDED_DSI();
-
-	/*
-	 * For bonded DSI, we only have one drm panel. For this
-	 * use case, we register only one bridge/connector.
-	 * Skip bridge/connector initialisation if it is
-	 * slave-DSI for bonded DSI configuration.
-	 */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id)) {
-		DBG("Skip bridge registration for slave DSI->id: %d\n", id);
-		return false;
-	}
-	return true;
-}
-
 /* initialize bridge */
 struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 {
-- 
2.33.0

