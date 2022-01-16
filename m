Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51248FE6B
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 19:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F64210E267;
	Sun, 16 Jan 2022 18:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C1110E267;
 Sun, 16 Jan 2022 18:18:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so17596804wme.0; 
 Sun, 16 Jan 2022 10:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLj2L5VWyVdOGJLMSf56SLM7Vb7QMt0sfGUe7E+PMH4=;
 b=jRakOnSgyncQcbqCpsBMCzFRPbyC5q5F1x1gV+Fz1VCWtNW6s7Dk28Ndtpv4j0pnH5
 WFI+1JfDG3ZlWK88iMvyrPh0iB5NqtC8pKw3wQNv4eFCrr82rVltFwYPu7lMiTRbi6+a
 MOQ9fB29u1KOMm6vjpEUURATLxjS0tJrmK4HcB/zxXa+h5HoQS0qG2aSuJRA28IpNLLq
 FaNduFspAXsEYfpP47Xx/XOlwItZk6EkWyFxbKdTlb7nU88B+x0z5R7psZLTEDazouSN
 zniT8VDufVCLzm6Rv0i+xUCFaN6j8lKCfh78NTwJ35fpfurbYgV9h/ReGO6yRkFCEXIR
 C2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLj2L5VWyVdOGJLMSf56SLM7Vb7QMt0sfGUe7E+PMH4=;
 b=WGU/tVyJrIiYrmZHduCk8km6UzrPHmv+Ks0ui94fqDzdolXsaN/x167GCeTvPfnpKR
 TKQrOgX5xFLXW5JvgBwBGyuItKTgxZHIUhHgj9Xw4wD0sU83pGKzlh+7uJLlzvzDjGrQ
 cHm7JmcExQbjXqhIHmPq87jEduyac9yIXt6Cv2WH/babGMGj2SjvaBYJ7MfDXIvX7cpM
 x9Zk4Gh4cThhiupqa4VlR036PmTiuL0P5rjx6nbteSyFid4cq6sP/4s9k8PS9zHZMy7M
 MnaamVPbyrHIDTajJ3CNhd3OEoFkjtpLUKhi0N7XIOGiQ2hR0YPSuh9HZuKM1Te5WcVN
 0glg==
X-Gm-Message-State: AOAM533TXXyo8Oa44hkbHlH1u94Vzb262/C5qypn42UaMRQxChqNdE4I
 gm9j+7JVpMByFN5Z646tcxk=
X-Google-Smtp-Source: ABdhPJzTfTrZbeYRdTwd3jGkTbjCInOqQZojBFH9tyRmM+gfinOFNR3IHyqEGi7J4eRXBbu1zN/+XA==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr16163005wrb.664.1642357130069; 
 Sun, 16 Jan 2022 10:18:50 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id g12sm11603839wrm.109.2022.01.16.10.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 10:18:49 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: hali@codeaurora.org
Subject: [PATCH] drm/msm/dsi: invalid parameter check in msm_dsi_phy_enable
Date: Sun, 16 Jan 2022 19:18:44 +0100
Message-Id: <20220116181844.7400-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, rajeevny@codeaurora.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function performs a check on the "phy" input parameter, however, it
is used before the check.

Initialize the "dev" variable after the sanity check to avoid a possible
NULL pointer dereference.

Fixes: 5c8290284402b ("drm/msm/dsi: Split PHY drivers to separate files")
Addresses-Coverity-ID: 1493860 ("Null pointer dereference")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 9842e04b5858..baa6af0c3bcc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -808,12 +808,14 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_clk_request *clk_req,
 			struct msm_dsi_phy_shared_timings *shared_timings)
 {
-	struct device *dev = &phy->pdev->dev;
+	struct device *dev;
 	int ret;
 
 	if (!phy || !phy->cfg->ops.enable)
 		return -EINVAL;
 
+	dev = &phy->pdev->dev;
+
 	ret = dsi_phy_enable_resource(phy);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
-- 
2.25.1

