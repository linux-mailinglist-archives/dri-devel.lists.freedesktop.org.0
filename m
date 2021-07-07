Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E603BED94
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 19:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4FB6E0DB;
	Wed,  7 Jul 2021 17:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D906E0DB;
 Wed,  7 Jul 2021 17:57:04 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id b5so1503993plg.2;
 Wed, 07 Jul 2021 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDhXrajmnvxBxrJ/tYHc7nWHgq+rEYaq1EkVOV5AyYQ=;
 b=K2khLq4OTEQQLx+IefqPARZZ0in8JUgBl+N+kHWZvbaef66mRTR80CqMHgYeb37prT
 I0YBhD2jNeheaguaTL3j5zbpa0o/kDgIqZPSjky1YjTGLlslJp/Xx/+1brzrE1kWRhrF
 j25WA+aQMvXP/7MoKfWQfOYcJEojUfEaNalarvDer8VEQcyWBmTVVZdTr16fbT42IAWb
 ZAs5T9K75fcE6J+q4E9RMr6K2Kx4+Z/TGZXmTAI29d5F3O+4UxNicWCj/mmrSTDPoGPC
 UXaTesb7Pf1Mf+1q70s9a97C4Lm31z1hYf8EKi7j0IP7a5zm1FZRdh963cfQSvMJNYF0
 swTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDhXrajmnvxBxrJ/tYHc7nWHgq+rEYaq1EkVOV5AyYQ=;
 b=b+yrEOYV/dS/bHWVlPnNYZbZN3RDAAnkWY2VOApgyYtT15LT+fEU2H114u5vCuVETW
 M9w7fMnwmQFvQ/7IZFrVFsN5rfw/GCieXlHmw+QVre6aAztmXSAfAS97/ZwUfXga1HCQ
 XUBlMUYjeqUDlEhMWXvGi+Gc9G4sYZnU0F7MyIeZgyt2qvtL0AKubmleRfYC6zamiVRb
 8dLjN95S5AcZXCVlE9eO8YavbnktP/oY92WHtG+y+kmLNzgD3JM2AsSpBOxG6TSKAYne
 UqU1dWdrAEtrmnEUa6rL04EdfZnHz9Z6A2dFFvAIFNLx7S5w4bkXhAFwJ7tnH8jq7g9D
 0T+w==
X-Gm-Message-State: AOAM531Z8wHgyKJXclvWrKEwu//eWSi7EnS1jrMWz8OFuMh78khC/ZU9
 c51nDFwFgndPYKQKRvPzost6I+1kDmo=
X-Google-Smtp-Source: ABdhPJwyUkbBXi5+6LwZLmWlw9bcycvwzdyYCCOW+yQwnreaPS0KzZm8Xnwmsufrgm44jmz8uyxChw==
X-Received: by 2002:a17:902:e291:b029:129:c9cd:a3ce with SMTP id
 o17-20020a170902e291b0290129c9cda3cemr2307466plc.36.1625680623321; 
 Wed, 07 Jul 2021 10:57:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z1sm18063712pfn.126.2021.07.07.10.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 10:57:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix display fault handling
Date: Wed,  7 Jul 2021 11:01:13 -0700
Message-Id: <20210707180113.840741-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It turns out that when the display is enabled by the bootloader, we can
get some transient iommu faults from the display.  Which doesn't go over
too well when we install a fault handler that is gpu specific.  To avoid
this, defer installing the fault handler until we get around to setting
up per-process pgtables (which is adreno_smmu specific).  The arm-smmu
fallback error reporting is sufficient for reporting display related
faults (and in fact was all we had prior to f8f934c180f629bb927a04fd90d)

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
Fixes: 2a574cc05d38 ("drm/msm: Improve the a6xx page fault handler")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index eed2a762e9dd..bcaddbba564d 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -142,6 +142,9 @@ static const struct iommu_flush_ops null_tlb_ops = {
 	.tlb_add_page = msm_iommu_tlb_add_page,
 };
 
+static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
+		unsigned long iova, int flags, void *arg);
+
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
@@ -157,6 +160,13 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	if (!ttbr1_cfg)
 		return ERR_PTR(-ENODEV);
 
+	/*
+	 * Defer setting the fault handler until we have a valid adreno_smmu
+	 * to avoid accidentially installing a GPU specific fault handler for
+	 * the display's iommu
+	 */
+	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
+
 	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
 	if (!pagetable)
 		return ERR_PTR(-ENOMEM);
@@ -300,7 +310,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
-	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
 
 	atomic_set(&iommu->pagetables, 0);
 
-- 
2.31.1

