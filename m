Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAA63D1BE7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00246EE9E;
	Thu, 22 Jul 2021 02:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8BF6EE9F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:44:16 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w194so5103135oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uhoriXxwuf3F+ep/Ax/y3D7yAyI4y+wKU+diem5MpTA=;
 b=ZdBi2xPCD1R0VnJO6SavUR7GyC1Qambh3gp4KeO0sbhvIYnOo6MPCsLJ6v1Cl5f4VA
 Anr4nQvC+6tFNE6CeRot/cI4AVIUFN2aHccBkHRvZ+JibvKCbHl2rH90fyEhMjZxegBq
 Q+S4kxj6APRr8EgUnH4xDmSNZXsIIT3w1SlYuTfeOvepP6A448tE5GTgO+Shk8sCkCyv
 HUZJeQhlMw3ByhEnOq/HHR84wSmAUArNiu55uIkyvPxtQVcMQ425L2jhoTc3hnfNvB7L
 hmmCCUij94G13agr+DrhgA7fq9PgnQ96VRlFlkAF5gXxg92nBKobk77Usgv+7rBUxLuP
 BeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uhoriXxwuf3F+ep/Ax/y3D7yAyI4y+wKU+diem5MpTA=;
 b=ibRZiSK04yBR2oJmxWUHNBJsZpeujgFMXvcV3h/LnKrhhf+HRZ6YkT+NOENZlL0PBx
 Uk1UNLfAjyCIKRwDCvbp6f2ZCUeO+sqVtb8Y5kTbnMlU3ZUR2EaYaLopHEM/L0t7r8ur
 SE8bR+tBj+PsJ1tXVcJQNF+w9jBHIK2KEke8uBbfqpPwLoSFbmosz1YKJeS/HAOQpW7s
 XhC33KTkDUwyLsybn4sKprAPopLgYJAIX+w862bdSIzb7rbJreososXdl2z4hCEjEX1l
 fXF0tAwxbXgqvWgm2ksC5lOJtALwcqs8W12KTEgza4cMNrkDx3+w5VF/+GppNrTp2GnY
 /w6w==
X-Gm-Message-State: AOAM530ILxZrOa+01NyDakZ68jBiLuXcq+JnWNYQNcfPxDUXvo3ukw64
 LLfDr3fTfQ26EEiExo146wSooA==
X-Google-Smtp-Source: ABdhPJyGElkKfHDf6jyZwFqec1oLyl/N/ypeSqKhVHIH8x4MMGHzo5HPp19meT7huH/WVt7TtNbxRw==
X-Received: by 2002:a54:4102:: with SMTP id l2mr27057626oic.126.1626921856181; 
 Wed, 21 Jul 2021 19:44:16 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u18sm5346519oif.9.2021.07.21.19.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:44:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 5/5] drm/msm/dp: Allow sub-regions to be specified in DT
Date: Wed, 21 Jul 2021 19:42:27 -0700
Message-Id: <20210722024227.3313096-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all platforms has P0 at an offset of 0x1000 from the base address,
so add support for specifying each sub-region in DT. The code falls back
to the predefined offsets in the case that only a single reg is
specified, in order to support existing DT.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 49 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 1a10901ae574..fc8a6452f641 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -63,18 +63,45 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 		return PTR_ERR(dss->ahb);
 	}
 
-	if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-		DRM_ERROR("legacy memory region not large enough\n");
-		return -EINVAL;
-	}
+	dss->aux = dp_ioremap(pdev, 1, &dss->aux_len);
+	if (IS_ERR(dss->aux)) {
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * dp_ioremap() will fail with -ENODEV here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (PTR_ERR(dss->aux) == -ENODEV) {
+			if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+				DRM_ERROR("legacy memory region not large enough\n");
+				return -EINVAL;
+			}
+
+			dss->ahb_len = DP_DEFAULT_AHB_SIZE;
+			dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
+			dss->aux_len = DP_DEFAULT_AUX_SIZE;
+			dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
+			dss->link_len = DP_DEFAULT_LINK_SIZE;
+			dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
+			dss->p0_len = DP_DEFAULT_P0_SIZE;
+		} else {
+			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux);
+			return PTR_ERR(dss->aux);
+		}
+	} else {
+		dss->link = dp_ioremap(pdev, 2, &dss->link_len);
+		if (IS_ERR(dss->link)) {
+			DRM_ERROR("unable to remap link region: %pe\n", dss->link);
+			return PTR_ERR(dss->link);
+		}
 
-	dss->ahb_len = DP_DEFAULT_AHB_SIZE;
-	dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
-	dss->aux_len = DP_DEFAULT_AUX_SIZE;
-	dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
-	dss->link_len = DP_DEFAULT_LINK_SIZE;
-	dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
-	dss->p0_len = DP_DEFAULT_P0_SIZE;
+		dss->p0 = dp_ioremap(pdev, 3, &dss->p0_len);
+		if (IS_ERR(dss->p0)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0);
+			return PTR_ERR(dss->p0);
+		}
+	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
-- 
2.29.2

