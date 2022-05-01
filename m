Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D1516393
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 12:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234B10EAE4;
	Sun,  1 May 2022 10:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B39710EAE7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 10:10:27 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y32so20955316lfa.6
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
 b=d1bvtS0N6dIqktEIIlNJ2QBhXBskRsIxYdnDTi+Gw/NPPipud0ttUypiQi8R58saKo
 C6ll9v/V66B/hYdcuXt1pVaBcszyIhQVkT9cL0xcibHBmXLBJM2I8XwhLqgZmAdW8lBG
 m/d8bcYuccTPhc6hDMOQO81EtBHiNAhm3ECQsdF47/Svv8q73Z2VOdoWgdyRqF2b7v2R
 HR09XTKEKRAZNvbo6RATSTuiEVeffmLQMasRekRTFwJ/V9qVpvlOHFKTmgEuiLW6jEet
 eWhDslj6rgJmnSj8L0KHYuWAULNrZACTERSr3XAZHtz9g8Jy9AP7brV9b06ferjUPpwm
 PW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
 b=meAJ1b6tDtnz3McuzplswbDqUTZ6w8CUKuXfYBjdBhK5tGz0izd/pWe3o2E6C0YR8B
 HlOYiOhmOkNGPpbAeunZpgl56qEXpdQyUsA0GK0vLNN+JqvW7k6EX/9ljgOcUYFvoUAJ
 Z38kWkrTryJM3P38i4IDoK7ELclcuPEFpiAv2yeanMNOVEbQnowL2K2oyEw7H8Ey7AV1
 B4G182W1Zg/+C1TfETbVSzvSPxJae+XrrYU76o7yOsRrcrT5pSa/amsAEU5+S7qRO+sT
 Du4AYuLUghyYTjzaUuThattbdJsdhXLrGmmc+kLAkDAx3Es3Sg7801VCz0lohWQJWJfl
 xRsA==
X-Gm-Message-State: AOAM531/vVSvjh7+CXEwAGyA56HHHg4BmmdSLq8vRQnUc9kVP0XbysXk
 DpS8H98WzEFZe7eTxuH3eOdVQQ==
X-Google-Smtp-Source: ABdhPJy+qSaB35tEuaZl8E2U/QytPoM+/Y5D8MZQVYBje/2lYI6+egHRI7TBm7Y965f4DOZEmRk0cQ==
X-Received: by 2002:a05:6512:3d13:b0:472:5d8d:5202 with SMTP id
 d19-20020a0565123d1300b004725d8d5202mr3298812lfv.331.1651399825737; 
 Sun, 01 May 2022 03:10:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b0024f3d1dae7csm766412lji.4.2022.05.01.03.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:10:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/3] drm/msm: Stop using iommu_present()
Date: Sun,  1 May 2022 13:10:22 +0300
Message-Id: <20220501101022.3931295-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
References: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if some IOMMU has registered itself on the platform "bus", that
doesn't necessarily mean it provides translation for the device we
care about. Replace iommu_present() with a more appropriate check.

On Qualcomm platforms the IOMMU can be specified either for the MDP/DPU
device or for its parent MDSS device depending on the actual platform.
Check both of them, since that is how both DPU and MDP5 drivers work.

Co-developed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4a3dda23e3e0..a37a3bbc04d9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -266,8 +266,14 @@ bool msm_use_mmu(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	/* a2xx comes with its own MMU */
-	return priv->is_a2xx || iommu_present(&platform_bus_type);
+	/*
+	 * a2xx comes with its own MMU
+	 * On other platforms IOMMU can be declared specified either for the
+	 * MDP/DPU device or for its parent, MDSS device.
+	 */
+	return priv->is_a2xx ||
+		device_iommu_mapped(dev->dev) ||
+		device_iommu_mapped(dev->dev->parent);
 }
 
 static int msm_init_vram(struct drm_device *dev)
-- 
2.35.1

