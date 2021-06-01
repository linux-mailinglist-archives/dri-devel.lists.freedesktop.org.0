Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F358B397C8D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 00:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1701B6EB29;
	Tue,  1 Jun 2021 22:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0E6EB2A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 22:44:07 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id e22so576614pgv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ttH2lB2Q3iQhWxz0MO6TSPDv0IHfj1scw5R0SMtBJU=;
 b=pIrVT61fx1rvumOUvE+U675Xr8GitSeSt4o0OfVAYKRWi8DS2mWDlWm1qtwtkfnDC0
 y9DNROp3Va+NBbZ8LgLe/HNctDwcqKGz22rixaxmBUKJb4w9iqO4F9zQm095IzbSgN+p
 NTLCHeDtMzIr9R1a2jmbIeBBnNDrS4ePTlmjU80G9C6BPpIxygTPe9dDVXJCN3ZS4Xa2
 wEym9t1RIe16wZYUD5Q/l8+EYTM2jE28SXQdUQflw79XNJ4S6wGil+4U550FrloPzrXM
 lnZOtm9n74chG/rOQTLSuWSQTLt4jKWcE+fCWJ9iEaTwZAQY/OC3KXN3P8X8zv9FYmXd
 MXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ttH2lB2Q3iQhWxz0MO6TSPDv0IHfj1scw5R0SMtBJU=;
 b=gJ//W/q8Tv8CSzrKXC/Wx00NbMLx8knbLrU/ZShjnUgHmy1VSeGcGYX39rxVzlNDwj
 1JLtVRVvTsIqY0Z+q6mSSaIyFCiLq1zcIHxqnD5dtefcdZrTepoMP6W6IiCBTFuJ8nJR
 oGsJ8CAaVJzDMXaGqwHQzoPdUDQGkpVTfupBXpR4yNFdKD5jRnhgsA4htcdHKdXgvhgg
 qws5BTbKi6g9xpRhWrzAcRslW8Cwlt1DW7aC4E3RTr75DxkOz2de0tY4EKUTcOgZU4sP
 Sc23ea3t1B8uf/X5hM2ARygO/qSesOtTaDdp0BwAmxc0NhapfASM5zsWmXBaLzKBsegz
 PBGg==
X-Gm-Message-State: AOAM5329UsQVqrcZaM2HVcMttXl29k6eGPUr3HE3WnWUgqhXxEmAxPsI
 mKimDdiENaj6FrrMJNytVk6Cx3UVwyMnaQ==
X-Google-Smtp-Source: ABdhPJwX4N/xGbofNgI/85HZIgF1a/A3xIrRRALq8vARkCD/QkQjwwSih/i8ZuLcYPS3lv2K+46TZw==
X-Received: by 2002:a63:540d:: with SMTP id i13mr904290pgb.360.1622587446121; 
 Tue, 01 Jun 2021 15:44:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n12sm14674511pjk.48.2021.06.01.15.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 15:44:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/6] iommu/arm-smmu: Add support for driver IOMMU fault
 handlers
Date: Tue,  1 Jun 2021 15:47:20 -0700
Message-Id: <20210601224750.513996-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601224750.513996-1-robdclark@gmail.com>
References: <20210601224750.513996-1-robdclark@gmail.com>
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
 Joerg Roedel <joro@8bytes.org>, Krishna Reddy <vdumpa@nvidia.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jordan Crouse <jcrouse@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Call report_iommu_fault() to allow upper-level drivers to register their
own fault handlers.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
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

