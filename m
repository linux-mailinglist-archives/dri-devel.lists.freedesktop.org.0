Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877A54DC94
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956C112673;
	Thu, 16 Jun 2022 08:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92AB1122E1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:11:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a2so1056548lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLVnUM+AqDl4tXNkj90J627+4z77zCYSsGSFtgLCsrQ=;
 b=tU8wJlzCAB9KAxWRVZYppXhrZRGt+jzRnYQpAl3BNoGOATcHnBQOY2/mAx7GckMCXS
 RkjnetmGIHJVl2jxHUro0vUn7AEEA3xVBvRmek1RQHm0hHtrZ1GOuu7o6FSF/imylrQY
 Az2JAiqCJiXFaGiSvOCKHN2tF0c6+4BrCxksbob0Z1+aK2LEXupPTHS48M0ZMsBydXfL
 jlOO0xNTAFpj2B4t+Z5hRJo8aL/f7ghIwVt+uv5p0GZ8dzqhOczWi8TTMXaJ7V9OpJQM
 74r3SVO6LkxA+81nb0BQ6q6HxdX3YQ6HFhXkW/H6F8MTdJnL5978M3YsVbSSBomjWDtJ
 eBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLVnUM+AqDl4tXNkj90J627+4z77zCYSsGSFtgLCsrQ=;
 b=oC2JILzx/qIUVTCNeoexHp3UYHRTC9amBMRQS4vqo5UmVgpneXraqzbcYUgfjrQjWa
 DDxRF5sV1MQjh9JQXo2GQ0PeIgwpvWCAIeNLv49Koar+rPbVpg3YyMeJ8qYywRqOWPPC
 DXhzHj1ZO+lGHqZ11Dr/iPZcRY3WbVKCx5CSQuEm6BMzVi9pWESpuXwg25I5h4t3hw5l
 fBHXVVatm4eZUBU3/IJNS2gDSreSBGmJu8l298GJi99OqlS+aCHHml7SqWs5AWP1xaF7
 dbmXQACBPL9/VmRaPNdYlMeyGY8cH/BU7qcQu315korfCIY0h0F5PFR/zGWOmC67DNeJ
 PXaA==
X-Gm-Message-State: AJIora9un2xwZufrtS8Hk8sHXNUMlbprJLtr0k9Gr0BIn1Xr3qOvsSl+
 GutlxTU3vgM2wpon6x8AGf4y9g==
X-Google-Smtp-Source: AGRyM1v5s3DiaabHbHg4BhCVByW26chL0Mvy/RL3fwSwKimfMRFRtdA8vLdVpzN7Qirit67Tf5ZxXA==
X-Received: by 2002:a05:6512:1399:b0:448:9f0b:bf4f with SMTP id
 p25-20020a056512139900b004489f0bbf4fmr1959636lfa.67.1655367071239; 
 Thu, 16 Jun 2022 01:11:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 3/5] drm/msm: Stop using iommu_present()
Date: Thu, 16 Jun 2022 11:11:04 +0300
Message-Id: <20220616081106.350262-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
References: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..c781307464a0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -271,8 +271,14 @@ bool msm_use_mmu(struct drm_device *dev)
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

