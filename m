Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9013A87A00F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341E510F26E;
	Wed, 13 Mar 2024 00:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cugvaTIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ECA10F3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:14:01 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1dd10ae77d8so46103255ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710288841; x=1710893641;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zguE7sLhSNq0icr0rFs1uvOVo5Tuv7IbCk7xIUt0MUw=;
 b=cugvaTINPGIwBJhDe28xZ/SB1K2MmdUQMYAjoGg6Hkm4aNndR01AN2hpQTtPaTOlc9
 Oab5Io6nx1ErTP20oNUS3IxuVng7ftm6bYtJoHe+/mVGLzx5r0kVq28XIdL3jISFkRXR
 RWXx1+ubbFbfJt1pCVDclz04FhtgmE/XtbO2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710288841; x=1710893641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zguE7sLhSNq0icr0rFs1uvOVo5Tuv7IbCk7xIUt0MUw=;
 b=YTjZUKrpiOKrmT2dgCKDFUTQC8GtA+PslTeTnMawvTIryP5ejlrmbwgK8dOp8UjNLx
 BaQJQLFDmARkjWxERoq7mVU4uYYlGhAJhxsltI1MsqhwE+9YnZbURQU8iUumTIvUSaL+
 MvOrxits9pvnHjeNnolY2d6TEPfbzGz817kSQFLBh8CZdxUBx8nqYG8qbhpQKcfnFV8P
 jTJMfJE2qJLP1EIMXk0jMSULp579a0+oRUfLb5pDOFSsqXn2prsz915ohylj9UtmvZFr
 oF7UD8QS2bLeJ6Xzx+YOfYaE81kUzJV0F8/RiOgOoRc/PaXLgwy2o9r/6/S2+fQ2sQOf
 kbsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBRFv/mRGb/meAVXiFUGOnep53Pc2eHLvt6fPY5wlAh7hPho+jQ/J9ck8OwclQbW4Qk5a9C1OCjdbunLci9RquJqg2QQEcXMWHTXsPNXlB
X-Gm-Message-State: AOJu0Yx5lZrrXhROGY+O8FMTzQjw3n4U964Y220AmQarehpiFyLR+ifA
 HpRIifZKDWJ4vB3UfTKROxZbQUtR0JtI2eWJiN17UjsMGIcl6CAvrmZIUQevgA==
X-Google-Smtp-Source: AGHT+IHleWIOjQ8m91s+SNRjR+JOLwIAr+kNSjLzS6dHYmUmGlbhttPA/0GuKKQLT1S7h93MHLmwng==
X-Received: by 2002:a17:903:258b:b0:1dc:728d:b1de with SMTP id
 jb11-20020a170903258b00b001dc728db1demr2427447plb.56.1710288841166; 
 Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f8dd:895c:e876:6edb])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 17:13:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sean Paul <sean@poorly.run>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/dp: Account for the timeout in
 wait_hpd_asserted() callback
Date: Tue, 12 Mar 2024 17:13:17 -0700
Message-ID: <20240312171305.2.I7758d18a1773821fa39c034b16a12ef3f18a51ee@changeid>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240313001345.2623074-1-dianders@chromium.org>
References: <20240313001345.2623074-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DP wait_hpd_asserted() callback is passed a timeout which
indicates how long we should wait for HPD. This timeout was being
ignored in the MSM DP implementation and instead a hardcoded 500 ms
timeout was used. Fix it to use the proper timeout.

As part of this we move the hardcoded 500 ms number into the AUX
transfer function, which isn't given a timeout. The wait in the AUX
transfer function will be removed in a future commit.

Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dp/dp_aux.c     | 5 +++--
 drivers/gpu/drm/msm/dp/dp_catalog.c | 7 ++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h | 3 ++-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index de0b0eabced9..fc398e8a69a7 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -311,7 +311,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	 * directly.
 	 */
 	if (aux->is_edp) {
-		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
+								500000);
 		if (ret) {
 			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
 			goto exit;
@@ -516,7 +517,7 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
 	pm_runtime_get_sync(aux->dev);
-	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
 	pm_runtime_put_sync(aux->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 93e2d413a1e7..b45cf3174aa0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -253,17 +253,18 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
 	phy_calibrate(phy);
 }
 
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+					      unsigned long wait_us)
 {
 	u32 state;
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	/* poll for hpd connected status every 2ms and timeout after 500ms */
+	/* poll for hpd connected status every 2ms and timeout after wait_us */
 	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
 				REG_DP_DP_HPD_INT_STATUS,
 				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
-				2000, 500000);
+				min(wait_us, 2000), wait_us);
 }
 
 bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1694040c530f..4248c8de5cf7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -85,7 +85,8 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+					      unsigned long wait_us);
 bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
-- 
2.44.0.278.ge034bb2e1d-goog

