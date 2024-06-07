Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9090049A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6110EC3D;
	Fri,  7 Jun 2024 13:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KJLTSAtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EFE10EC2C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:07 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52b88335dd7so2662323e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766586; x=1718371386; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
 b=KJLTSAtBTU7qpIts4RAIu6UeS5PIdo0ZN1lA8Zku0DGW7qg/e06QFNUVnu6gbNa+hq
 2UB14ioWz2jjuPyY6gaOcHEV2yOBs6DkYbpUl6cl2tNTO8/PdPerULwmb4hnCBpDDN4t
 6wqNjDtRDB4NybNdL4c0n8mR8yO1UPkMWyuQr4MVGZ7yLdnZJCRIfjcfK799RB/Z7SLd
 Q/TglbAiDoDFOyRi36Qiesw80gk5cnbPbaH9o+jXUHzgTf1haTsjnzbvaItEyOweqRKd
 ThyjVuaRge1H7RuCbUM34D/MTqcXGIzLdfuaRH0zMNWlg+3PXI5ZVEQ/ERQv9uvOdZMh
 sHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766586; x=1718371386;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
 b=I/csuaAHV/Prdwm/uAKfY81IubFhqrGRlZDBoeZBEXJ/dXJNdPs7scqBCZAQpZzRhp
 TBuyEw2C6YHzRaeKrizgg8LYBrHIxeMGK5PiEmfaUmP0JOWuWlAns7BU6F/NB3gl1lVU
 lUs0TGyjq7Ip5kGiwp5GxVjZC8A/VhC21K8tUXZZIgjBbPCG8sKZ2Xn1k0yTjlexwmkw
 lhUozH6QIIerJsQXouuqGZggXxxhSbNPNbHdH8seAyl0Obld1aHYgx3qqOYiZDqq90sw
 STKPt/gJftLI9abT5cGCIRwp0XImySOHzVej4+hFAUo2ktB4L/nfWOumr/Gv8Pmu06/P
 /ApQ==
X-Gm-Message-State: AOJu0Ywt5alXFY1hKMS9BB7zeA7YhdmIPf3ziW91auDrUJD7Nyfh+94j
 L9tJvZ+BFZesxhjTiQID5hqUPrc5J45aJCHfLC/NB6VxBRDaRxjZuERRQPPpI4w=
X-Google-Smtp-Source: AGHT+IFimUSTeNrZfFvaBvkTFvkauvLRtO1YKFt0pvvZcBOVGoOAYA7In504u+fB6rAJ/1QGueJWkg==
X-Received: by 2002:a19:5e44:0:b0:52b:796e:66a5 with SMTP id
 2adb3069b0e04-52bb9fd281cmr1397580e87.66.1717766585998; 
 Fri, 07 Jun 2024 06:23:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:23:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:22:59 +0300
Subject: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qg+Km5t2/ArhCtvDRW1AVt6NXCcPflkwptIdi/Y9plc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm1D9fy2VKs9KR5++9rejC/DmP66UroHteIG
 Ni9K3xeHuCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtQAKCRCLPIo+Aiko
 1W6qB/9FnlS4xPdrI5+7K6pJxtvxKoybm4IDgGk4JOkAfQUyxdl61k1EWK82CKfMq2vznosX2EO
 cKGZi9nF4b8oCyUxheMTtlZiUE5LJbevH3LXYmd7AQi1GlduEicDe109ueiPIIWvGlNS0Q4GHnE
 wv+sW16S9s1LWet9Pw+n5icnf5o2b7JggB3flOkBN8HftLOnDqfaX+CM6Lc3/OassjFmgFqmXYI
 etvnZ30eTKtXFU/RD4lKx4lTEDhuQuJTuCrDvKjYAGsqPXGS3p/jch9wnEd53CdyPyEiw2Ga8sV
 9TaAlfeTMYUCQnj0gkldyTV2exQqE5Ju92g05dKOR2Kt1uo9
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

Turn drm_bridge_connector to using drmm_kzalloc() and
drmm_connector_init() and drop the custom destroy function. The
drm_connector_unregister() and fwnode_handle_put() are already handled
by the drm_connector_cleanup() and so are safe to be dropped.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 982552c9f92c..e093fc8928dc 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -15,6 +15,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
@@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static void drm_bridge_connector_destroy(struct drm_connector *connector)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-
-	fwnode_handle_put(connector->fwnode);
-
-	kfree(bridge_connector);
-}
-
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_bridge_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
@@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	int connector_type;
 	int ret;
 
-	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = drm_connector_init_with_ddc(drm, connector,
-					  &drm_bridge_connector_funcs,
-					  connector_type, ddc);
+	ret = drmm_connector_init(drm, connector,
+				  &drm_bridge_connector_funcs,
+				  connector_type, ddc);
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);

-- 
2.39.2

