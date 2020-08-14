Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41329244338
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D5B6E2CD;
	Fri, 14 Aug 2020 02:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596006E2CD;
 Fri, 14 Aug 2020 02:40:58 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id d4so3693333pjx.5;
 Thu, 13 Aug 2020 19:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vh+B4OHEn3CAh3E4JWZmp8fkzNNMb5LEBb6Hamyy8Tc=;
 b=b1Nn+BeMMREhr/xsqOUt71SjYE8YipMwszKzo5jG3bFHT41NMAEGv87PqJbvzBoTzy
 6b/cLlgDD5/5PW4ST6p5hm24g1aSt/zJL6vWBbZ4VvsIGASZVOdL8XN84BQeoBqDbNeM
 BQrGnxlONVmRT69y8o2Z/umv8giNT7tSsxCwohfWaw0fKUb2EDbisY42eWD5fIfZTqQn
 gMNc4fUN1Elxy0nAISiKJJ9d/MoVTUzcDB1ANoP4tY/wsoX0Kl9CJOfc+UE97ihyapnT
 e5MvFj0a94BRJPyfPhU3upK2h65RSJ6aYJKa645c6g9k7d9qcwJ8/s6kwE9YCAiqVaLL
 h93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vh+B4OHEn3CAh3E4JWZmp8fkzNNMb5LEBb6Hamyy8Tc=;
 b=Zp15glShu9OevLaxCT860j6FvkEv1q79GJwLF7TStoSp0s+qz1U+tOMxVeZoyVWICn
 eICJzsG1Adi+H63IFwTiY6czUvnOk3AFC+qyJBBsSNyuseW7j0yaUe4lYU419qi7dEmV
 cxjFKHpZqzJ5yYMDMunx4Cw/cB5/QgDRYbmZoJ9Ag9X4XR1yR0qe+Ndbtv25PSRDXZ1J
 PpdSHvOHfaIykTRkHe6saAOGcHVP95HLLIR0gryiVHKVntqAStVxE4pPZPqugFCSp/zd
 yXnB78DaOvm366zd/AptuKG28Qh+iosYMh/xjdVcZbe8U9Ot4EzHhWDCtuBvi4eLSSw6
 JPiQ==
X-Gm-Message-State: AOAM532QKocQT/Doy9y69pR5XnH3u7t0Xtfe3k1Qxb7e1LPqf6Ak4i/H
 WoVEpKWNmvpZLyUQYn13MsfEKTo0hZA=
X-Google-Smtp-Source: ABdhPJyhhKdUyI/chNSsrpl7lcoB1vpSmNbVdbKkkayGFGLTS9vBb0ca0GN0/ePIemLJruAF+TIhWA==
X-Received: by 2002:a17:902:a404:: with SMTP id p4mr577375plq.35.1597372857314; 
 Thu, 13 Aug 2020 19:40:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id n18sm6397759pgd.91.2020.08.13.19.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:40:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 02/19] iommu/arm-smmu: Pass io-pgtable config to
 implementation specific function
Date: Thu, 13 Aug 2020 19:40:57 -0700
Message-Id: <20200814024114.1177553-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
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
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Construct the io-pgtable config before calling the implementation specific
init_context function and pass it so the implementation specific function
can get a chance to change it before the io-pgtable is created.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  3 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 11 ++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index f4ff124a1967..a9861dcd0884 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -68,7 +68,8 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
+static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
 {
 	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
 					      struct cavium_smmu, smmu);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 09c42af9f31e..37d8d49299b4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -795,11 +795,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		cfg->asid = cfg->cbndx;
 
 	smmu_domain->smmu = smmu;
-	if (smmu->impl && smmu->impl->init_context) {
-		ret = smmu->impl->init_context(smmu_domain);
-		if (ret)
-			goto out_unlock;
-	}
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
@@ -810,6 +805,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
+	if (smmu->impl && smmu->impl->init_context) {
+		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
+		if (ret)
+			goto out_clear_smmu;
+	}
+
 	if (smmu_domain->non_strict)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d890a4a968e8..83294516ac08 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -386,7 +386,8 @@ struct arm_smmu_impl {
 			    u64 val);
 	int (*cfg_probe)(struct arm_smmu_device *smmu);
 	int (*reset)(struct arm_smmu_device *smmu);
-	int (*init_context)(struct arm_smmu_domain *smmu_domain);
+	int (*init_context)(struct arm_smmu_domain *smmu_domain,
+			struct io_pgtable_cfg *cfg);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
