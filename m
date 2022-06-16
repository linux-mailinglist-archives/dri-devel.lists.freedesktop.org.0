Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1254DC8F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6471128ED;
	Thu, 16 Jun 2022 08:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5EA1122E1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:11:13 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c30so656970ljr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EGxd/9xz6t/6B064VQNI3Uiu5akff1VMTLPWs5zNE0=;
 b=E/PqsaxGR9SAFZBZ4BRlJDbn6TfYDabWbsza4Nxn12A1pR97iAptVsThbxmXuelnuL
 r4ZNLfQTSYvICYe+olbRQmmFNU7NiIaOBj8hfeIUZkPXG7XvDQh/iYcqz0CfGClF0cJq
 8Co58otLn4WxUeZ7sKToImXVv27gY9M3r1qaEawbupUOKKyvoBJkFGZsN2lpqJhaeThE
 Fd4HQ/dqiNJZfUjMTSk4/1zfV8vN01QHJX3w+kM5fscX/Mf8a3UeCzVWszYKEegRIp61
 nU6V/ZdYje7oEKi7JJGQyOfcyeD15nh2BFbhEoyu6meGFEDM+dYZLbSbODIrns6ikJJL
 kKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EGxd/9xz6t/6B064VQNI3Uiu5akff1VMTLPWs5zNE0=;
 b=VGVGl5bdU0RUGgUhF5EUx4Pk9W7B4mEC84wQ6yLlrSsd4PRI+ay+Dpsh3axaTeMkM1
 wMLOF+5xHEiGYckhfA8nQb6u8pyPgzBUXYYWbQrJJIdq/Tq+2PU8gahTfc9JTpTObRMO
 +u2+vUz5jU2/vWgnSQg8LVOy0YURJwdVg/Eenq0lpAja5TcG4NVGtX29ajjK9eCZp+aC
 CR5yUac9hpc62zMTgigp5ExW/+i8kqsyf7GnV4zBrnaWQF4v6REUROOkixZpK3qW0POm
 ChF0p3pqbxD1QIK36jG4dSpR2QvcjWdZmB8ti1Dkbg4arfeimRrzBZ+4REfAkud5yQjV
 J9LA==
X-Gm-Message-State: AJIora8F6hEnWorgIbbpG/F2Z6g7so+B4VXNut7HNBq9QfKlOyo8f4Cf
 XC10LYOvCtRvRhx/QQYTqCeBqw==
X-Google-Smtp-Source: AGRyM1tDqwV2+plE9J+r0FYKJnJWurUPARzXBIF3B5Qzo5rhHybAs/xd9wxPJA5ULF9LKsZjFO4DSA==
X-Received: by 2002:a05:651c:244:b0:253:ecad:a4ee with SMTP id
 x4-20020a05651c024400b00253ecada4eemr1900781ljn.21.1655367072211; 
 Thu, 16 Jun 2022 01:11:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:11:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 4/5] drm/msm: move KMS aspace init to the separate helper
Date: Thu, 16 Jun 2022 11:11:05 +0300
Message-Id: <20220616081106.350262-5-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDP5 and DPU drivers have the same piece of code now to initialize
IOMMU and GEM address space. Move it to the msm_drv.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 32 ++-----------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 33 ++++----------------
 drivers/gpu/drm/msm/msm_drv.c            | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 49 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e8bc6d5f6ac1..8cbe56694892 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -997,40 +997,14 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 
 static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
-	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
-	struct msm_mmu *mmu;
-	struct device *dpu_dev = dpu_kms->dev->dev;
-	struct device *mdss_dev = dpu_dev->parent;
-	struct device *iommu_dev;
-
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain)
-		return 0;
-
-	/*
-	 * IOMMUs can be a part of MDSS device tree binding, or the
-	 * MDP/DPU device.
-	 */
-	if (dev_iommu_fwspec_get(dpu_dev))
-		iommu_dev = dpu_dev;
-	else
-		iommu_dev = mdss_dev;
-
-	mmu = msm_iommu_new(iommu_dev, domain);
-	if (IS_ERR(mmu)) {
-		iommu_domain_free(domain);
-		return PTR_ERR(mmu);
-	}
-	aspace = msm_gem_address_space_create(mmu, "dpu1",
-		0x1000, 0x100000000 - 0x1000);
 
-	if (IS_ERR(aspace)) {
-		mmu->funcs->destroy(mmu);
+	aspace = msm_kms_init_aspace(dpu_kms->dev);
+	if (IS_ERR(aspace))
 		return PTR_ERR(aspace);
-	}
 
 	dpu_kms->base.aspace = aspace;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index a69e23f10d91..d2a48caf9d27 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -557,8 +557,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct msm_kms *kms;
 	struct msm_gem_address_space *aspace;
 	int irq, i, ret;
-	struct device *iommu_dev;
-	struct iommu_domain *iommu;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 
@@ -602,33 +600,14 @@ static int mdp5_kms_init(struct drm_device *dev)
 	}
 	mdelay(16);
 
-	iommu = iommu_domain_alloc(&platform_bus_type);
-	if (iommu) {
-		struct msm_mmu *mmu;
-
-		iommu_dev = &pdev->dev;
-		if (!dev_iommu_fwspec_get(iommu_dev))
-			iommu_dev = iommu_dev->parent;
-
-		mmu = msm_iommu_new(iommu_dev, iommu);
-
-		aspace = msm_gem_address_space_create(mmu, "mdp5",
-			0x1000, 0x100000000 - 0x1000);
-
-		if (IS_ERR(aspace)) {
-			if (!IS_ERR(mmu))
-				mmu->funcs->destroy(mmu);
-			ret = PTR_ERR(aspace);
-			goto fail;
-		}
-
-		kms->aspace = aspace;
-	} else {
-		DRM_DEV_INFO(&pdev->dev,
-			 "no iommu, fallback to phys contig buffers for scanout\n");
-		aspace = NULL;
+	aspace = msm_kms_init_aspace(mdp5_kms->dev);
+	if (IS_ERR(aspace)) {
+		ret = PTR_ERR(aspace);
+		goto fail;
 	}
 
+	kms->aspace = aspace;
+
 	pm_runtime_put_sync(&pdev->dev);
 
 	ret = modeset_init(mdp5_kms);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c781307464a0..258632d5c411 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -26,6 +26,7 @@
 #include "msm_gem.h"
 #include "msm_gpu.h"
 #include "msm_kms.h"
+#include "msm_mmu.h"
 #include "adreno/adreno_gpu.h"
 
 /*
@@ -267,6 +268,44 @@ static int msm_drm_uninit(struct device *dev)
 
 #include <linux/of_address.h>
 
+struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
+{
+	struct iommu_domain *domain;
+	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
+	struct device *mdp_dev = dev->dev;
+	struct device *mdss_dev = mdp_dev->parent;
+	struct device *iommu_dev;
+
+	domain = iommu_domain_alloc(&platform_bus_type);
+	if (!domain) {
+		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
+		return NULL;
+	}
+
+	/*
+	 * IOMMUs can be a part of MDSS device tree binding, or the
+	 * MDP/DPU device.
+	 */
+	if (dev_iommu_fwspec_get(mdp_dev))
+		iommu_dev = mdp_dev;
+	else
+		iommu_dev = mdss_dev;
+
+	mmu = msm_iommu_new(iommu_dev, domain);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(domain);
+		return ERR_CAST(mmu);
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
+		0x1000, 0x100000000 - 0x1000);
+	if (IS_ERR(aspace))
+		mmu->funcs->destroy(mmu);
+
+	return aspace;
+}
+
 bool msm_use_mmu(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 08388d742d65..97d8ce07e8ed 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -234,6 +234,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
+struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
-- 
2.35.1

