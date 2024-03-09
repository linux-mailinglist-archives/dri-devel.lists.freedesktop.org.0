Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625787706D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 11:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A67210FE8F;
	Sat,  9 Mar 2024 10:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yooiy9Ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5210FE8A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 10:31:40 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so38741671fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 02:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709980299; x=1710585099; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=Yooiy9MlJqjIIH944LYT2TpE117rfMAa3eXnmQt8gCUBvaIKx0DQwpUFgG3Pmooq6w
 u32uu3VOQnwefH2V1eyyDvxMIINE6Ke8Z5qvrwOLccUo1ofhsc6R960i52pC8j0QhsR0
 lSyDKi5iZXhVzHPILi3ne7sYVVZUIuii0vl9INsOpp8xG1dlJSp3BFTEKW7sTvDakJ6l
 ALcq/ZvqwAKSx5ZBeB+fYqQZY48zoX+T8EAJ6FD0bRcJsW8p9o9osjc7JIPJ1u2A811c
 08Z+2V8p932tZmpvaF5f7t4PPOb+ED46f40vF0b0Fy9FwE5XyfI56ldoHW1VqcTQeaie
 OUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709980299; x=1710585099;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=QhpSwgV0aRGspKxfrLj4KPDPtFhnXrza+m7ANZdrQw1qUuveRVb9d/STmXu/AXWoLs
 Tg6HcQGVaAeUhlTyToA7QSvv7g6x5rv3OQ+GcbFzZKP+WpmtPq/p9cm53P1n8H21I2oY
 Yj7gw4yZtUlllL31acWiOYyth8fOvNq5a2e5Doq5HqgkUumcTnEAiRjgSRxKlnwpdG/P
 eRx4/na3L6hw2fzEwAIVRBoj476Hy18SZdggIeaqLNBk7tpNYjeaJu3pYhtB/2CwPafT
 GcmmTNHKIMDXeXeF9/Ko/LvePfEtdRrvGfOxEPaXGjcv+egUlhZsgt7Cq9A9sOJ2XES5
 8Wxw==
X-Gm-Message-State: AOJu0YxQdPdyvHGK0g3WhQ6saRW+BzfPdd7blSB+WxqhJ+rFF4cY1KTu
 A/DzZJTBXkHlBMbOg9Pzeoa3tNKbrkVNs7EfSSuT9c1XQmEEnF7MQPluGt9yCds=
X-Google-Smtp-Source: AGHT+IFYa94bngGFzQOCUhe0OG7K+D07/qG54fBuSnLETIBSl6pH9ixQUJZwS83iaWnnsgmtLotQcA==
X-Received: by 2002:a2e:9dc3:0:b0:2d4:299c:cebb with SMTP id
 x3-20020a2e9dc3000000b002d4299ccebbmr712199ljj.47.1709980299060; 
 Sat, 09 Mar 2024 02:31:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 02:31:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:31 +0200
Subject: [PATCH RFC v2 4/5] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-4-1380bea3ee70@linaro.org>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7DqGE6KpSJMtgdjFpsRWlaeLRIWqF1vIFOcRN
 I9e4hcazsSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZew6hgAKCRCLPIo+Aiko
 1cVSB/9Rj3Ikfz0XPJS6p4SkADr8C8YFbP7BIYx7v/y/yt7rd88LFwx74uNziqmBM7gRTPe6NH/
 wwp3QcXhEjaF9Nhi2trwz+5nNKE9l2V/ido9ESa48WyYEwW580ws8hyhbR6HTLJ4KEvzbwCyg9C
 zO68Z6uqN2eo4112kJfHqc7e148nAqQJrIAvveh9147FipL1g2NvVKQW2y48TF9Brdesi3MXR1g
 zTUePwAcG4q8B1wQGSUH+Xanpw8YcIy/x4XdF99K0gE89Dsglko3gy3HdGOFLtbSS9fONuqC3vZ
 pDcoj1ti8obYPA8UaWsG3iJ72vKeYDXtPRUgGgFlRhTSAcap
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..d839c71091dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.2

