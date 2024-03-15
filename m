Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EBA87CCB2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02E51121E1;
	Fri, 15 Mar 2024 11:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o+GnoRgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A251121DB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:46:34 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-513d3746950so2013407e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 04:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710503192; x=1711107992; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jnTUQM6F1e6b3ELJmMukNHuHn8ljSCVj2rp0eJe9i4Q=;
 b=o+GnoRgTj7lncEkfhvSGNL2t37b7QEW9Aw0Lytl/dvTj6Wn0Tkvu+QZZ3GfNXOJI5p
 EOA+BVAz+x9/CMrSNoq3uhry64unkSNIgEm9yAvwZej9NIuI47QrFjSzpmHkBrSOaCHw
 qiPxDr8H6kGRvdCxeDiRm5iTW5bInek4V1N7D2/JhInwBGHqtccP9FPl4fkeoPDOCXh0
 oPvwTlwzEI7Tl8BfH/X+CcsrPnu5vmYrb3btFixkDFShro4PCnz1FdNtrk4CVMlou02Z
 HCzVmoqm08sK1hkmOYVhruKVFIhhMsi7NxKl/8IUx/GQjhDeSwL2kXI+o4bysNEKshZq
 g0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710503192; x=1711107992;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnTUQM6F1e6b3ELJmMukNHuHn8ljSCVj2rp0eJe9i4Q=;
 b=O535atneZpDm4Xa7rw7PJy0bOt3+bLWS4Jp/vh99PteZqKtv6gjCMLaP/SVrfeoCAv
 0if+/Z/zRA0km43UVcWRjY+rvRqYb2NK7hDl8YJrlz/kXvGh7aYnh5XzxqIpBcyiR/tX
 AfCqReHUtvy3b5uMyYFbZKtYGDbf2RWKZBOQCd0kexK0tDpjlBWDToB+uNOfiF480W/e
 Ljg1Rqn3bo5ZEBoY903151Jue3weYW/2j2pj/VdBTyeOUufBuwX81qdds2H3/vay38oN
 aePqKKCDyKUHsXivt/IVp09BVK8qSfJPZmmkh3o6rAlh2Yq1KhvSNtbCyp64pfLVi4VM
 03YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdNJy+zJ6Y1Fdh+ssDnBie0YL8YfF5ep/O8wUUULbX3oS4GGlyYfKRCX02Yp8fXUYRrn82wg3n5k0D+MoXDRt/MEVghfDDbqgG3gwWfohn
X-Gm-Message-State: AOJu0Yy0f4UdAloWgW60fAV/Cwh91R/IfB0qfyn0ozTlZODLnNZcQCBT
 Rf2Zy9cHPEIRr6bbCFft6u0gtZ7W7xeF7j7YwQGC+cKjYe6TbIuNMgkmqhb/plc=
X-Google-Smtp-Source: AGHT+IEoRfNR3y0gEgP/uDmw8F0W15ppQGrWxJ2gVDuaoQKG4dgQpzYvzZt33ety/zxtkVVFJ3KDnw==
X-Received: by 2002:a19:430b:0:b0:513:32b1:9654 with SMTP id
 q11-20020a19430b000000b0051332b19654mr1886658lfa.25.1710503192064; 
 Fri, 15 Mar 2024 04:46:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 04:46:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:46:26 +0200
Subject: [PATCH RFC v3 04/12] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v3-4-0fc122e36c53@linaro.org>
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7616;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LFBCygmQugB1B+c89cDmQuXR1TkW2sehOLTqu9Lzsnw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DURJ8VZSfcPhA2hplZSVG4kk9mT8ibTeU+Da
 oBKruluvnyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EQAKCRCLPIo+Aiko
 1WaYB/9rdIObPs25SPYC3qhW4NvqjqGjV/RlE/Na1A3V4aCpsFJPaXbNELqDxwOV8yP2s5YfmSr
 ZmiNezDGID/gOAFald5S0XE35UA9DUGGPxWGVPtfsgxBuomsN6pdrdNPeZN0u4+Cn6VnLaOfENr
 7IQei+0hb/P7Jk+GYPhmFgVJqaITdq1g87H/bEPjqJ3pJmLk7HPBdwHHs6KAIdY1/gBBU1BLksq
 M8Iw8NP1R2RcMprMQpQ99z61dJlu9rAX6vi7eAGpj6dXjIrTqdqSa/UXM/I7z2VOiAplIBuWz3V
 tu4XPQmP0rOJQUTW0W2BA1eC3IhOAGeAi/bVvqExPCKQGkpJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm_gpummu.c implementation is used only on A2xx and it is tied to
the A2xx registers. Rename the source file accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       |  2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
 .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
 drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
 5 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b21ae2880c71..26ed4f443149 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -8,6 +8,7 @@ msm-y := \
 	adreno/adreno_device.o \
 	adreno/adreno_gpu.o \
 	adreno/a2xx_gpu.o \
+	adreno/a2xx_gpummu.o \
 	adreno/a3xx_gpu.o \
 	adreno/a4xx_gpu.o \
 	adreno/a5xx_gpu.o \
@@ -113,7 +114,6 @@ msm-y += \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
 	msm_gpu_tracepoints.o \
-	msm_gpummu.o
 
 msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 	dp/dp_debug.o
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 0d8133f3174b..0dc255ddf5ce 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -113,7 +113,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	uint32_t *ptr, len;
 	int i, ret;
 
-	msm_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
+	a2xx_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
 
 	DBG("%s", gpu->name);
 
@@ -469,7 +469,7 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 static struct msm_gem_address_space *
 a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
-	struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
+	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
index 161a075f94af..53702f19990f 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
@@ -19,4 +19,8 @@ struct a2xx_gpu {
 };
 #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
 
+struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu);
+void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
+		dma_addr_t *tran_error);
+
 #endif /* __A2XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
similarity index 67%
rename from drivers/gpu/drm/msm/msm_gpummu.c
rename to drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index f7d1945e0c9f..39641551eeb6 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -5,30 +5,33 @@
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
-#include "adreno/adreno_gpu.h"
-#include "adreno/a2xx.xml.h"
 
-struct msm_gpummu {
+#include "adreno_gpu.h"
+#include "a2xx_gpu.h"
+
+#include "a2xx.xml.h"
+
+struct a2xx_gpummu {
 	struct msm_mmu base;
 	struct msm_gpu *gpu;
 	dma_addr_t pt_base;
 	uint32_t *table;
 };
-#define to_msm_gpummu(x) container_of(x, struct msm_gpummu, base)
+#define to_a2xx_gpummu(x) container_of(x, struct a2xx_gpummu, base)
 
 #define GPUMMU_VA_START SZ_16M
 #define GPUMMU_VA_RANGE (0xfff * SZ_64K)
 #define GPUMMU_PAGE_SIZE SZ_4K
 #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
 
-static void msm_gpummu_detach(struct msm_mmu *mmu)
+static void a2xx_gpummu_detach(struct msm_mmu *mmu)
 {
 }
 
-static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
+static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
 		struct sg_table *sgt, size_t len, int prot)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
@@ -53,9 +56,9 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
 	return 0;
 }
 
-static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
+static int a2xx_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	unsigned i;
 
@@ -68,13 +71,13 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
-static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
+static void a2xx_gpummu_resume_translation(struct msm_mmu *mmu)
 {
 }
 
-static void msm_gpummu_destroy(struct msm_mmu *mmu)
+static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 
 	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
 		DMA_ATTR_FORCE_CONTIGUOUS);
@@ -83,16 +86,16 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.detach = msm_gpummu_detach,
-		.map = msm_gpummu_map,
-		.unmap = msm_gpummu_unmap,
-		.destroy = msm_gpummu_destroy,
-		.resume_translation = msm_gpummu_resume_translation,
+		.detach = a2xx_gpummu_detach,
+		.map = a2xx_gpummu_map,
+		.unmap = a2xx_gpummu_unmap,
+		.destroy = a2xx_gpummu_destroy,
+		.resume_translation = a2xx_gpummu_resume_translation,
 };
 
-struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
+struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 {
-	struct msm_gpummu *gpummu;
+	struct a2xx_gpummu *gpummu;
 
 	gpummu = kzalloc(sizeof(*gpummu), GFP_KERNEL);
 	if (!gpummu)
@@ -111,10 +114,10 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 	return &gpummu->base;
 }
 
-void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
+void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 		dma_addr_t *tran_error)
 {
-	dma_addr_t base = to_msm_gpummu(mmu)->pt_base;
+	dma_addr_t base = to_a2xx_gpummu(mmu)->pt_base;
 
 	*pt_base = base;
 	*tran_error = base + TABLE_SIZE; /* 32-byte aligned */
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index eb72d3645c1d..88af4f490881 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -42,7 +42,6 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
 struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
-struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
@@ -53,10 +52,6 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
 
-void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
-		dma_addr_t *tran_error);
-
-
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
 struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);

-- 
2.39.2

