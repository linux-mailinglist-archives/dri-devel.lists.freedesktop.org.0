Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9413A362D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4356D6E4EC;
	Thu, 10 Jun 2021 21:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A415F6E4EC;
 Thu, 10 Jun 2021 21:44:05 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id k5so4480585pjj.1;
 Thu, 10 Jun 2021 14:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFeq080l4pyungY1s5smdqe1RkTm59ggcZkYab3uzaA=;
 b=od6K+JZZ2Ya1vmUSFUzEt823il+QDfWsVXULz6C3V7pvOQe/OzfOO55BSEJzkpc8V/
 5JOvD07BvVRg/OUQJGhdt3WhNAMlxvZRHKw4Tom3lj+u254y+rqPNS7CiyfzFeZWay14
 QkHfcnTFWk3raQFcGjmXdXzCYZMGKeZkSW5nAnVFeL5+GKtd58AmcFt7hgF2x+oN5Mdk
 scz1q9J5xs3hherxMHktgpvuV/RTVG57XvRS98Lz1/enDmR2B62RVDrD80/v5vWPJlmt
 x5eEyI8CcqhqyEIkxvEwrjmZtexHTnAI/ORQNhFawNle8sCr38KIui2WPmSlV2mbDGXy
 DUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFeq080l4pyungY1s5smdqe1RkTm59ggcZkYab3uzaA=;
 b=pTEQ1h/7hlMahnmJty4diYQE/uiEUU3K7lSauHFlYnzlN70a+v0ZkZirqvdrhkPU/F
 ynDTnVrHnzeq1vCc3ZLq0LRKZCkFVk19+8aeBvvPPfut+hbaCpC6FX7JAt8P99dD0lmv
 ulcBw+Qg4bGTqlBN4r7+ZE4kZEQXwbe+b1PG2z/6BqYckSqOdLpqPoGfU5AE/YHapuk/
 VrCebrhU5Koo/mBXqFhacBPjU81xZn4CCW985UpLe1cqDWdd0YAsRmEI48ju5p9t0W0V
 VWFlY6vVm1f+ZaQAtuNFK5bSZ+oTFLciltJn8O5fPZPfDYUMIDQRPs/U4vPYN0wCX9Ws
 0w1A==
X-Gm-Message-State: AOAM532BTPTtJkcdaEnXJQ8ZWjNHHT20EGjwkDNvrZf/efnGGZtWcHLr
 N2jCIVxo54D1A19Civ8X+/ofjMDoGRTXyw==
X-Google-Smtp-Source: ABdhPJwTXFRr4e/p/Dd+f4YZhg9ockexXtaUtSitnB/HmG6Ps8HeqoEC32RQ+nVKhHQlYKvHIoRK8g==
X-Received: by 2002:a17:90a:ad47:: with SMTP id w7mr901700pjv.51.1623361444589; 
 Thu, 10 Jun 2021 14:44:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id h18sm3415629pgl.87.2021.06.10.14.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:44:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v5 1/5] iommu/arm-smmu: Add support for driver IOMMU fault
 handlers
Date: Thu, 10 Jun 2021 14:44:09 -0700
Message-Id: <20210610214431.539029-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610214431.539029-1-robdclark@gmail.com>
References: <20210610214431.539029-1-robdclark@gmail.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Jordan Crouse <jcrouse@codeaurora.org>, Krishna Reddy <vdumpa@nvidia.com>,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Call report_iommu_fault() to allow upper-level drivers to register their
own fault handlers.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208ca..b4b32d31fc06 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -408,6 +408,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	int idx = smmu_domain->cfg.cbndx;
+	int ret;
 
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
 	if (!(fsr & ARM_SMMU_FSR_FAULT))
@@ -417,8 +418,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
 	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
 
-	dev_err_ratelimited(smmu->dev,
-	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
+	ret = report_iommu_fault(domain, NULL, iova,
+		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+
+	if (ret == -ENOSYS)
+		dev_err_ratelimited(smmu->dev,
+		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
 			    fsr, iova, fsynr, cbfrsynra, idx);
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
-- 
2.31.1

