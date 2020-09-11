Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B924726854A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52486E1BB;
	Mon, 14 Sep 2020 07:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1129 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2020 14:46:46 UTC
Received: from a27-188.smtp-out.us-west-2.amazonses.com
 (a27-188.smtp-out.us-west-2.amazonses.com [54.240.27.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D5A6E053;
 Fri, 11 Sep 2020 14:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599834477;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=EncBtUbW+/8e8AetwH5ax0dwE6Vqltzbyo8iHlfy/3Y=;
 b=YiVWxAIvVG++ddhQmEDpqLiHOQUWtpp4BuGKDcwe9pkOWYa9yib8BMDwXqmTFpLj
 p6dM79F5PIOixf2DFGRgdqVKC3rZ5lwRKloRzg6sD36vVK5zQB5e1OpPsmQcGlu+UYf
 uLvN8YuYqBrjZQgkKnxNlRXnVEbfb/w9B+mQoeEc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599834477;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=EncBtUbW+/8e8AetwH5ax0dwE6Vqltzbyo8iHlfy/3Y=;
 b=nIZjXJDEFasnBajchIeEqMnUyrlWsc6VLzrmZoJX9KJGnO4F+L+O4TmLUoSA+Lrc
 eSUNs4nHhrtOJpsaFpU0+GFBqw2RmbX/kINZUHXwTjQg5lQRV4jFSKV01j0Pr4isAdI
 1uBWAvr6sqm/C0FtlUxZ0FqpdqaPyzhlXkLjDSvk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14C21C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv4 2/6] iommu/arm-smmu: Add domain attribute for system cache
Date: Fri, 11 Sep 2020 14:27:57 +0000
Message-ID: <010101747d90d16e-da1e3c14-08fe-4b20-b448-14a1f881cc64-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.11-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add iommu domain attribute for using system cache aka last level
cache by client drivers like GPU to set right attributes for caching
the hardware pagetables into the system cache.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 +++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
 include/linux/iommu.h                 |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 1f06ab219819..d449c895ba16 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -789,6 +789,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	if (smmu_domain->non_strict)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
+	if (smmu_domain->sys_cache)
+		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_SYS_CACHE;
+
 	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
 	if (!pgtbl_ops) {
 		ret = -ENOMEM;
@@ -1513,6 +1516,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
 			*(int *)data = smmu_domain->non_strict;
 			return 0;
+		case DOMAIN_ATTR_SYS_CACHE:
+			*((int *)data) = smmu_domain->sys_cache;
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1544,6 +1550,17 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 			else
 				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 			break;
+		case DOMAIN_ATTR_SYS_CACHE:
+			if (smmu_domain->smmu) {
+				ret = -EPERM;
+				goto out_unlock;
+			}
+
+			if (*((int *)data))
+				smmu_domain->sys_cache = true;
+			else
+				smmu_domain->sys_cache = false;
+			break;
 		default:
 			ret = -ENODEV;
 		}
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index ddf2ca4c923d..93593e164e44 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -373,6 +373,7 @@ struct arm_smmu_domain {
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
+	bool				sys_cache;
 };
 
 struct arm_smmu_master_cfg {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index fee209efb756..a580dfe9c68d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -118,6 +118,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_SYS_CACHE,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
