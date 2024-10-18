Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62109A492B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AB910E9C0;
	Fri, 18 Oct 2024 21:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RoB5vV0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7C910E9BC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:23 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539f7606199so3077774e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288161; x=1729892961; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9z8gZhR6xKvHdHJfRz4craU+dxQh5f6YMki2hXyc4YM=;
 b=RoB5vV0b/Q3cE3KhDFk24kOLKnjzGZPZ1KII+h98ym6qQBnmMH+zHPEAYIN+WPW6Do
 O2DHri5iR0P0D/rWBDSqoQZVFfjcwqgxsbA3PB+8KBMuu69mP98q5B6tLbr1VZrwxc3R
 cNZOIJ/uex38Rn+HPfNVDxTfxdhq58B8IMb/PhSQudUUzDInfPxIXxRLSRArQAoqVlH0
 ta5q0/WP7zDd8OY0oSw4MQ8eRuVqOFAxdENxXf5ArsR5tBfwHpVHe/UvBJ7FSWJg3aJU
 9sL0Ot1Ivi4M5cuvrRRirZY2vCIDoejF5d1qZy+rJHcfZPdT4Fn2vc9FNGvjTvoQ2yIz
 gqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288161; x=1729892961;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9z8gZhR6xKvHdHJfRz4craU+dxQh5f6YMki2hXyc4YM=;
 b=W5HGBmmQ1syuGblS5tm1mOV21lV9t7JF21dauEDvgi/DJulUELjtybDuqtsJkazp7G
 EwD7BBMwrfuM1zNm27C8ayqfyVFcRGavQ7UV3riK0DbJe6f24bo/CG47gXH5juOp8UTv
 bvETqHFmMCTgLSHozZhTQN0E8jG3rZVJG4IOYSKkj4fz8X6Qgdta65445dxMwX3uEHFu
 p43YOMfloMgRAWT9Wytfa9rC+c+aGM4ZFv0abagJiU24xwYOZ6RMPTVBGmrDZXq9sV7V
 prrXi6qvHNpx9hNVpTbXWT2Xf7XYc4vWVUmE6L9DkPRBKRkQhSsYDdiEvW6GaV8Mp+xi
 VK+A==
X-Gm-Message-State: AOJu0YzCuXTUnsADJFbdB49q5Ipx9nwPNtQxnOsOAzR4v2bPZY588dD+
 ws58GzusODyop7u0PbcEytMDwrYgXmyu6QJ++u/iEtJJCZ5ooGVKrfu89/j8uUk=
X-Google-Smtp-Source: AGHT+IEvBA85x80m9/B/gJoVTav3nM1QjDIWITUKAkImXSQZnUaTDoetNxkyXbVIvGvOnxTTs+hpZQ==
X-Received: by 2002:a05:6512:3a8d:b0:536:7362:5923 with SMTP id
 2adb3069b0e04-53a1520b285mr2619592e87.1.1729288161371; 
 Fri, 18 Oct 2024 14:49:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:12 +0300
Subject: [PATCH 1/6] drm/display: bridge_connector: handle
 ycbcr_420_allowed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-1-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEeB8zSmc5l7zbT8EsjhmWQeibYM5q3N2PhNmNxtKME=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdkI2xvvDyeAfQVDQUi0tdefgLR6vV7buRI
 tI484ScB1+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1WeWCAClFBFBl2ZmrqDc2fZN2aSCu3RdrzJkvaupwJdyhURATXsaWpT9bGsmOd2MjKTxT0Loq9p
 C8WpoBOLd6UjVr13L7T8l6Sq3H77uEMREgloAxbbLVaW05xKTeFdS/KSTJr5oABdtTDqZzsxg0a
 slmypGrkSSKs3m2pJ/DXM/2yZYvIrGD8OmlpV1P5VSrCKXjNvMsek2LHuHrBDKxtfqjjTxMjDIl
 /ZBvupf/oBQ5XheDg1XSudap4ydX+m2c6+pZUkxgA/53WVDoyKOv5rDrinCM9gnbKDAFnC8Cm6z
 PiycyIZiFvnah4d49hQ0ije+kgj0w9K8xM9FIx6zlu5k5KN6
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

Follow the interlace_allowed example and calculate drm_connector's
ycbcr_420_allowed flag as AND of all drm_bridge's ycbcr_420_allowed
flags in a chain. This is one of the gaps between several
bridge-specific connector implementations and drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
 include/drm/drm_bridge.h                       | 5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 3da5b8bf8259..320c297008aa 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -397,11 +397,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	bridge_connector->encoder = encoder;
 
 	/*
-	 * TODO: Handle doublescan_allowed, stereo_allowed and
-	 * ycbcr_420_allowed.
+	 * TODO: Handle doublescan_allowed and stereo_allowed.
 	 */
 	connector = &bridge_connector->base;
 	connector->interlace_allowed = true;
+	connector->ycbcr_420_allowed = true;
 
 	/*
 	 * Initialise connector status handling. First locate the furthest
@@ -414,6 +414,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	drm_for_each_bridge_in_chain(encoder, bridge) {
 		if (!bridge->interlace_allowed)
 			connector->interlace_allowed = false;
+		if (!bridge->ycbcr_420_allowed)
+			connector->ycbcr_420_allowed = false;
 
 		if (bridge->ops & DRM_BRIDGE_OP_EDID)
 			bridge_connector->bridge_edid = bridge;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 75019d16be64..e8d735b7f6a4 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -802,6 +802,11 @@ struct drm_bridge {
 	 * modes.
 	 */
 	bool interlace_allowed;
+	/**
+	 * @ycbcr_420_allowed: Indicate that the bridge can handle YCbCr 420
+	 * output.
+	 */
+	bool ycbcr_420_allowed;
 	/**
 	 * @pre_enable_prev_first: The bridge requires that the prev
 	 * bridge @pre_enable function is called before its @pre_enable,

-- 
2.39.5

