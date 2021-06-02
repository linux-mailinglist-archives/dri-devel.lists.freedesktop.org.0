Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D31D39907F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 18:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342F66ED27;
	Wed,  2 Jun 2021 16:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A056ED14;
 Wed,  2 Jun 2021 16:49:29 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so3789763pjz.3; 
 Wed, 02 Jun 2021 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ttH2lB2Q3iQhWxz0MO6TSPDv0IHfj1scw5R0SMtBJU=;
 b=nvCYD3LtO/CuojD7wCnU+c6O+R2pp2pb1KXMOskVgNnkGQajATVAekeuE6ORBh0Ejc
 R+rirwTVetIxLdBoJvcWUyV/gTioLE6JphhTZET6wlb79RKHV9XvZeWHYR6je6dKHZhF
 V9BbncwWr9HZVyJY1PRwvutwmxgKkuv8CpK/MGzO/FlSs4oHWlD92lTft0nt3i7IDq7o
 rYIzeDd6rqGScVllo4n47EJUGx0wKYSvfhhA9Z3pyjsJXJZMYyVf1+exgCwiMrudG5CO
 0qy3xgJ8A/YEyVDXLulIRaX6UkQU9K3uybFEK4T83wm52schJGyQx/lKR2yp0XXccXP1
 PthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ttH2lB2Q3iQhWxz0MO6TSPDv0IHfj1scw5R0SMtBJU=;
 b=nUuPBL5FAXeNnNQjjB9xQed6BHMEfqdkZUgXwVky2vr8TPJWfqOJDEV9hT+jfRux7N
 rddNWo/xYnNKr3XF/DsYR0eDu3vO4Hkb0dgMRJ1WpZHFq6lc8+I+M93Eras/SGlhdOu1
 n7yjYkt4kjlNcUhojuOMQ32UZcezcY8VlPOqH4yjLb1605HcI8O0+AX3d4bs4XhZ6yVH
 40TM3pjbKFtYNOVvA/IykPCLCYocSJ7fY6driVTiZM6c5IbfwEfqM+TnzFfKp8XcxrbY
 mX1QKLOjbCZcY4iYD3Jcxwxfc2y6A3meK8hpvLIIvoA3dNmTrP0je2VXVJh4wpXAVwlZ
 FJwA==
X-Gm-Message-State: AOAM5338S9rtd8JyKMu8/vPFbrT5pv7EGVyF3hyOM+uHGZAArEFun0us
 TdMj45hXd3ucd9jucXusP3EvRF19MbI9Lg==
X-Google-Smtp-Source: ABdhPJyNuM1C0B/N7VSYw14UuHjXqYthGnVv3VSYDW7n4ueLVcZgKCAnAlLqEclUOMb0/oghQizYeA==
X-Received: by 2002:a17:90a:de0c:: with SMTP id
 m12mr32297535pjv.54.1622652568268; 
 Wed, 02 Jun 2021 09:49:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z5sm155302pfa.172.2021.06.02.09.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 09:49:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v4 1/6] iommu/arm-smmu: Add support for driver IOMMU
 fault handlers
Date: Wed,  2 Jun 2021 09:52:44 -0700
Message-Id: <20210602165313.553291-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602165313.553291-1-robdclark@gmail.com>
References: <20210602165313.553291-1-robdclark@gmail.com>
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
 Robin Murphy <robin.murphy@arm.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
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

