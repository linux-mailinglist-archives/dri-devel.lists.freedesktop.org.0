Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907CD3254C9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 18:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5265B6E156;
	Thu, 25 Feb 2021 17:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2166E156
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 17:51:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614275515; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DGq6IDzFUvvJIL7ZMOUaKbC0+G2XRnz/QgQTPcnn1yo=;
 b=ThzzcvKGWxG1gSxYHXJiwmHaQ/RWDXCpno+1sSEGwfjZQYN/op2SZ/h1tm8QwanwThee3E/V
 KETleo99fU8d7kmNIECsK9QxzS5O4TlWQIh4ySMW2i7iYaKxZwn0ovghM020nGd93yrXqoSd
 LnYybroqvsMqQzXrZQ3WOeXHpgg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6037e3baa27401dc65b0f0c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 17:51:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 01048C43466; Thu, 25 Feb 2021 17:51:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C253C433ED;
 Thu, 25 Feb 2021 17:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7C253C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] drm/msm: Improve the a6xx page fault handler
Date: Thu, 25 Feb 2021 10:51:35 -0700
Message-Id: <20210225175135.91922-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225175135.91922-1-jcrouse@codeaurora.org>
References: <20210225175135.91922-1-jcrouse@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Robin Murphy <robin.murphy@arm.com>, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new adreno-smmu-priv fault info function to get more SMMU
debug registers and print the current TTBR0 to debug per-instance
pagetables and figure out which GPU block generated the request.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
 drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
 4 files changed, 87 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 7e553d3efeb2..56b548921c4e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1075,7 +1075,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return true;
 }
 
-static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
+static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
 	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
@@ -1085,7 +1085,7 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
 
-	return -EFAULT;
+	return 0;
 }
 
 static void a5xx_cp_err_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 064b7face504..97eabd87740c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -959,18 +959,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	msm_gpu_hw_init(gpu);
 }
 
-static int a6xx_fault_handler(void *arg, unsigned long iova, int flags)
+static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
+{
+	static const char *uche_clients[7] = {
+		"VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
+	};
+	u32 val;
+
+	if (mid < 1 || mid > 3)
+		return "UNKNOWN";
+
+	/*
+	 * The source of the data depends on the mid ID read from FSYNR1.
+	 * and the client ID read from the UCHE block
+	 */
+	val = gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
+
+	/* mid = 3 is most precise and refers to only one block per client */
+	if (mid == 3)
+		return uche_clients[val & 7];
+
+	/* For mid=2 the source is TP or VFD except when the client id is 0 */
+	if (mid == 2)
+		return ((val & 7) == 0) ? "TP" : "TP|VFD";
+
+	/* For mid=1 just return "UCHE" as a catchall for everything else */
+	return "UCHE";
+}
+
+static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
+{
+	if (id == 0)
+		return "CP";
+	else if (id == 4)
+		return "CCU";
+	else if (id == 6)
+		return "CDP Prefetch";
+
+	return a6xx_uche_fault_block(gpu, id);
+}
+
+#define ARM_SMMU_FSR_TF                 BIT(1)
+#define ARM_SMMU_FSR_PF			BIT(3)
+#define ARM_SMMU_FSR_EF			BIT(4)
+
+static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
+	struct adreno_smmu_fault_info *info = data;
+	const char *type = "UNKNOWN";
 
-	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
+	/*
+	 * Print a default message if we couldn't get the data from the
+	 * adreno-smmu-priv
+	 */
+	if (!info) {
+		pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
 			iova, flags,
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
 
-	return -EFAULT;
+		return 0;
+	}
+
+	if (info->fsr & ARM_SMMU_FSR_TF)
+		type = "TRANSLATION";
+	else if (info->fsr & ARM_SMMU_FSR_PF)
+		type = "PERMISSION";
+	else if (info->fsr & ARM_SMMU_FSR_EF)
+		type = "EXTERNAL";
+
+	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->ttbr0, iova,
+			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
+			a6xx_fault_block(gpu, info->fsynr1 & 0xff),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
+			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
+
+	return 0;
 }
 
 static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 50d881794758..6975b95c3c29 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
+	struct adreno_smmu_fault_info info, *ptr = NULL;
+
+	if (adreno_smmu->get_fault_info) {
+		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
+		ptr = &info;
+	}
+
 	if (iommu->base.handler)
-		return iommu->base.handler(iommu->base.arg, iova, flags);
+		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
+
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 61ade89d9e48..a88f44c3268d 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -26,7 +26,7 @@ enum msm_mmu_type {
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
-	int (*handler)(void *arg, unsigned long iova, int flags);
+	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
 	void *arg;
 	enum msm_mmu_type type;
 };
@@ -43,7 +43,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
-		int (*handler)(void *arg, unsigned long iova, int flags))
+		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
 {
 	mmu->arg = arg;
 	mmu->handler = handler;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
