Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC022C3092
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7F96E525;
	Tue, 24 Nov 2020 19:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DA86E526
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:16:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606245379; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=lNWesjgP/NLNgNxQ1vZhum6IH/N7QHEMoGmhkd/5d7c=;
 b=AAbWnhIPhjXYTquYWNhirRjRGujzXxIX/xYbLUfYXNxHQ6pEN+H8WDxqtv+qlgYoHkQljT4B
 OtMtC+HvJy9oBXJaS9cncuNHkE+j0Vomuv3Qy65SxHdPO6xGqAsxBxMsvlcHVxSe7W3MKvRN
 TYXUpfQUxFEYOhP8QSpL8h8Qkik=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fbd5bff7ef0a8d843e08c10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 19:16:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 075F1C433ED; Tue, 24 Nov 2020 19:16:14 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 53952C43461;
 Tue, 24 Nov 2020 19:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53952C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/3] drm/msm: Improve the a6xx page fault handler
Date: Tue, 24 Nov 2020 12:16:00 -0700
Message-Id: <20201124191600.2051751-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124191600.2051751-1-jcrouse@codeaurora.org>
References: <20201124191600.2051751-1-jcrouse@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Robin Murphy <robin.murphy@arm.com>, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Emil Velikov <emil.velikov@collabora.com>
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
index d6804a802355..ed4cb81af874 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -933,7 +933,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return true;
 }
 
-static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
+static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
 	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
@@ -943,7 +943,7 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
 
-	return -EFAULT;
+	return 0;
 }
 
 static void a5xx_cp_err_irq(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 948f3656c20c..ac6e8cd5cf1a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -905,18 +905,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
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
index 22ac7c692a81..73db30dfda0a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -212,8 +212,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
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
