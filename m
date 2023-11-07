Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E469E7E3258
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C4210E49A;
	Tue,  7 Nov 2023 00:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9246F10E48B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:44:27 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so68459931fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699317866; x=1699922666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l4sQQn36L2+/zoCkGPO8pkAoerlaydAQhrz7oIT51ro=;
 b=Jqr5p7xwFH7Z2SkAoXmRbrio2XXj2C73uIY0IiMHjjG6iLbn5HMi3Eanwn3TR2J6u0
 DA9DHXtCaXEK8iFsa4Dl0M3JC2yosZIyQfTWAPNTU469Gv1MAJ6cEhyTzbbzN3tGANHZ
 roGeHF4jKPr0CKy4Bco8aEIWlDjdsTJ5YbUzqk6Wt/80m17ucyQr85iYkweYlOIzlv+T
 w6Ye62zMeBm7TxQlFUvIlTI/Re0hrBTVE86tVOrpbCrQjb71GznyEdrd3SLcNTqHaQyU
 QL6xYPwUA6/771g2NdRbdUJQZ9z05OqtiQwcE1SNlMntMOj0tSv7OkHsHZXgrVdUGQU7
 xECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699317866; x=1699922666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4sQQn36L2+/zoCkGPO8pkAoerlaydAQhrz7oIT51ro=;
 b=mZdFYmtTNA196PDEtO2m5ISq0giheBfpm0GJ4zLl2xFlpIh12SrF+o557LVVBhpQwr
 xF3fyyXHHQSVM31dAwveqZeG9lxi7ypSK7vT3RtG7Rx9+zXMaziQdXG2g/6DoH2ykOut
 JqR1ct2KyKBA46W/sUMiLR8ysAZwT4Or6X5UOFWVCqhi3H1hnEBS8O1zVui8SlGQDmsQ
 a53j9T9gvdmMZi/klaJ+ZS9G/yH/lv3nVRO01Np/8ru1RU6MKS0pT/bqlY/7ig2MyHly
 SZarAQ683ZynHaLhR2hqi0Tt18jlWxDvy+TwXk/f+usetAktMoednWYb3x8vCPaM4lte
 XdXA==
X-Gm-Message-State: AOJu0YxDzhN+p9mPVNRUd2onZVUqytjfMLNgdQyDpuN+Q55ZwZK11wPn
 TwJYNHwE5B4ZR/XP9piwRpqKFA==
X-Google-Smtp-Source: AGHT+IGq/gbVJACFjo+UjFOrO/9DZFv8U31OsE7j5XrfgMAni1X9Tg3EXzFgOQQAbQtrdqyqkHPeyA==
X-Received: by 2002:ac2:57c4:0:b0:4fd:c715:5667 with SMTP id
 k4-20020ac257c4000000b004fdc7155667mr20544414lfo.20.1699317865656; 
 Mon, 06 Nov 2023 16:44:25 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 m15-20020a05651202ef00b0050567a8b36esm142974lfq.251.2023.11.06.16.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:44:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH] drm/msm/dp: call dp_display_get_next_bridge() during probe
Date: Tue,  7 Nov 2023 02:43:33 +0200
Message-ID: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The funcion dp_display_get_next_bridge() can return -EPROBE_DEFER if the
next bridge is not (yet) available. However returning -EPROBE_DEFER from
msm_dp_modeset_init() is not ideal. This leads to -EPROBE return from
component_bind, which can easily result in -EPROBE_DEFR loops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Dependencies: https://patchwork.freedesktop.org/series/120375/

---
 drivers/gpu/drm/msm/dp/dp_display.c | 36 +++++++++++++++++------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d542db37763a..ddb3c84f39a2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1197,15 +1197,27 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
-static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
+static int dp_display_get_next_bridge(struct msm_dp *dp);
+
+static int dp_display_probe_tail(struct device *dev)
 {
-	int rc;
+	struct msm_dp *dp = dev_get_drvdata(dev);
+	int ret;
 
-	rc = component_add(aux->dev, &dp_display_comp_ops);
-	if (rc)
-		DRM_ERROR("eDP component add failed, rc=%d\n", rc);
+	ret = dp_display_get_next_bridge(dp);
+	if (ret)
+		return ret;
 
-	return rc;
+	ret = component_add(dev, &dp_display_comp_ops);
+	if (ret)
+		DRM_ERROR("component add failed, rc=%d\n", ret);
+
+	return ret;
+}
+
+static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
+{
+	return dp_display_probe_tail(aux->dev);
 }
 
 static int dp_display_probe(struct platform_device *pdev)
@@ -1280,11 +1292,9 @@ static int dp_display_probe(struct platform_device *pdev)
 			goto err;
 		}
 	} else {
-		rc = component_add(&pdev->dev, &dp_display_comp_ops);
-		if (rc) {
-			DRM_ERROR("component add failed, rc=%d\n", rc);
+		rc = dp_display_probe_tail(&pdev->dev);
+		if (rc)
 			goto err;
-		}
 	}
 
 	return rc;
@@ -1415,7 +1425,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 	 * For DisplayPort interfaces external bridges are optional, so
 	 * silently ignore an error if one is not present (-ENODEV).
 	 */
-	rc = devm_dp_parser_find_next_bridge(dp->drm_dev->dev, dp_priv->parser);
+	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
 	if (!dp->is_edp && rc == -ENODEV)
 		return 0;
 
@@ -1435,10 +1445,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
-	ret = dp_display_get_next_bridge(dp_display);
-	if (ret)
-		return ret;
-
 	ret = dp_bridge_init(dp_display, dev, encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
-- 
2.42.0

