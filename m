Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B551B48D
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 02:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1C410F91E;
	Thu,  5 May 2022 00:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD3510F919
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 00:16:11 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s27so3687979ljd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EjkUPVslus6qGEdB9sA7jTUgeDFXhmLH2OeN7g9eO0=;
 b=BlLJ1Yg1CIAe5h/Tk3TduQWbRsRs3yZauWvhUdTLDAZRka6boVnJ9unKiGGCTUoNs3
 pmJujN9OuTCbEK19fqaUkQN+21CGPfQXp7nxpPeZm7uzb3/EbSrXu9f+eLtf6/2oplUD
 WnCxAE2NMcg2mPkKWnZnsejgk/Po99ZZlDoLJIl7u/lBOlCEXDDeIp9peXsNY2RQxs+u
 CnwJbkJefrDa2dEwBUlCM+UkGMcmZYaVGyEH4HybbwpSVi0Z0413LqMvTA41KwGOudPN
 Rrl3OcN2BU77kl+epcHu4zDao9IiDKdOv2sQh8TFo2iYcn7pS1wWyrlCaFI194/Dfluv
 +m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EjkUPVslus6qGEdB9sA7jTUgeDFXhmLH2OeN7g9eO0=;
 b=F1lG9iMNZcX5b5Imy8zYM8eU7eNxSUzJvKyULmQwlc1PGa0B77BhfoRMH+j2Em0Jdk
 Eg/CMFF6vmmN3R4NAGUX9IY0wkr9jhqVshezBG8CT6cekMNOaw5lCNajKVkIHLpH9Gqs
 oUZzd+3gPwvFJ9oTMOg5sZ3BqPjJ9v8wgl/mP8Xrtya6UJ+JBREZnZ9x4Lf85xYwyiX8
 rh2q401NoKcF8BI/kI8gxSHKgyO1Eoq89l1MeK8syr3+nu9zlENi2CzfTQGPX3S/7fNR
 E8ocs0mVFpV2fMhOOT9AKV4w0yGxquMoWRmFPMgrvnSv5/xmrr48BVuY6gwN3T94UaZV
 igsQ==
X-Gm-Message-State: AOAM532boyoJED9rZupTegBwUBkPHm5AagL65OqjRZHORqZahgNT67Fk
 QVAH5nP31R474uNBH0a/m7CT7w==
X-Google-Smtp-Source: ABdhPJyh8OD7KGQfcQZzVkzSGxGd98y2S1JgZPJU61HP26pjj+oMq1kTA5wqYw1xsinrnXlX+0bZ0g==
X-Received: by 2002:a2e:a448:0:b0:24c:8fe8:f3c6 with SMTP id
 v8-20020a2ea448000000b0024c8fe8f3c6mr14229380ljn.115.1651709769836; 
 Wed, 04 May 2022 17:16:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 17:16:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 5/5] drm/msm: switch msm_kms_init_aspace() to use
 device_iommu_mapped()
Date: Thu,  5 May 2022 03:16:05 +0300
Message-Id: <20220505001605.1268483-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
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

Change msm_kms_init_aspace() to use generic function
device_iommu_mapped() instead of the fwnode-specific interface
dev_iommu_fwspec_get(). While we are at it, stop referencing
platform_bus_type directly and use the bus of the IOMMU device.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 98ae0036ab57..2fc3f820cd59 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -272,21 +272,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	struct device *mdss_dev = mdp_dev->parent;
 	struct device *iommu_dev;
 
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
-	}
-
 	/*
 	 * IOMMUs can be a part of MDSS device tree binding, or the
 	 * MDP/DPU device.
 	 */
-	if (dev_iommu_fwspec_get(mdp_dev))
+	if (device_iommu_mapped(mdp_dev))
 		iommu_dev = mdp_dev;
 	else
 		iommu_dev = mdss_dev;
 
+	domain = iommu_domain_alloc(iommu_dev->bus);
+	if (!domain) {
+		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
+		return NULL;
+	}
+
 	mmu = msm_iommu_new(iommu_dev, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
-- 
2.35.1

