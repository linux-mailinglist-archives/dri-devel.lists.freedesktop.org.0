Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45A3A3634
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269DA6EDFD;
	Thu, 10 Jun 2021 21:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ABE6EDFD;
 Thu, 10 Jun 2021 21:44:16 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id g4so4500259pjk.0;
 Thu, 10 Jun 2021 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klF+qD/QdtC30F6g+izrwAUhrIJ7PWDhzmkE9PFXPQI=;
 b=ExKWQpdm/J1verQNW9M8RVGytkUTQoT+Aw/Bbyg5wznaZE/onMVQiSFtgfoEJCNqct
 8hpHcUOID8+2VhXl47OZOH1CF84ugny9gUpSnFpo5eom37wwejVKV3PWuyTHSaXPNrBs
 qheJWd+O4Yz86u6UXGmY99RroGEx1ewlSUye7iEH0Hh8kJxUZFPBtRorZz7U0R7DsKcd
 UVrDTlOmi56/5d5rvUGdo1hHXUyfHW3o2TtrESOQijmCb+qz+FgvUAH+3QVgnplIpJzF
 5kIc8F2GJU8PprFiA4yrtKykcviA6NPbgyCW8933zQb6Rx9wQPi3QRkC/nZGQNlW96/U
 NyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klF+qD/QdtC30F6g+izrwAUhrIJ7PWDhzmkE9PFXPQI=;
 b=Er3KZMJGYwJ0dwKQaMglI2xAe08tAX9wr0c6diQw76/aGalqodYKDu0QNALq1rrXyi
 83+jN8YQtb/cXhMjaC6/DYoiv8nv01vEv2FIj7908XEVILChIzv2VKUtTrITLOWZQLgX
 jRT4lMKL//rWZGeomVLfiZI2gAM7IU5k19oYcrGSd2YmwG0dWwkrh13g65w8y/pOswU0
 iiQ6uvOWz0diWSD+zAhfpe5QGufD9yiltzZJi6xcDlUnfD7ifR/ulP9kg5CeF/KEkGis
 o1holF3qDpcsQaOGGc68Ii6qY42tck5s+SQkcn8S4dCJda7Z60YBTPAQwuA3+a9kqwXB
 vRwA==
X-Gm-Message-State: AOAM531KfSfHKcfBshbsMd6txlUSjd9GPdNTU3SUJ2J1GFruN0Z/KWWJ
 /QR9OMPh+7x8A3W1zce8E0kprZ8vMQ/RPA==
X-Google-Smtp-Source: ABdhPJzctNcqGZbrqPW8mgLIzRunvhAu6QFEKdLYF1YOfvfPDINI4s4OTD3IppMH7l326xKSJS7w1A==
X-Received: by 2002:a17:902:724c:b029:ef:571f:8894 with SMTP id
 c12-20020a170902724cb02900ef571f8894mr734948pll.49.1623361455583; 
 Thu, 10 Jun 2021 14:44:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id b14sm3426369pgl.52.2021.06.10.14.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:44:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
Date: Thu, 10 Jun 2021 14:44:11 -0700
Message-Id: <20210610214431.539029-4-robdclark@gmail.com>
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
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Use the new adreno-smmu-priv fault info function to get more SMMU
debug registers and print the current TTBR0 to debug per-instance
pagetables and figure out which GPU block generated the request.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
 drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
 4 files changed, 87 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index f46562c12022..eb030b00bff4 100644
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
index c7f0ddb12d8f..fc19db10bff1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1032,18 +1032,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
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
2.31.1

