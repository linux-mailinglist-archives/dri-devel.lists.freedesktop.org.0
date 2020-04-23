Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D01B6719
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13966EA24;
	Thu, 23 Apr 2020 22:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1479A6E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 21:10:46 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id j4so8026553qkc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8pnL5RF9+BKS0yCU4wzwUQVaNhGA3Xq25e2RnEtDMc=;
 b=2QU121b68L7lpzX+l+3y7kAhCVzc3En5QepfgmLDxyCreLPPd6Kzehaf27ABlew1vF
 +yIBscG9f8fIvng9pGoh4DRAl5XjEmuZQPXAXF0WF+P45c/+amQr8dwd9uPtivKr8b0c
 AKOhEgKA0EoyaObi4FRywzFy5m6raNbUAmF5hge2IZ3pjJ4V4HogEwsHl3rtUBo26RQM
 N8LKJYmTfzAPF/Oin6B/WuRhC/ypEXd/uoPmclxgh1otVA5feDyC3aCF/OgegPe4kPn2
 +h7+4C3bwjY/DqZ37H4QygLfzfiC9zs2Wqn7IZ+HYW2UKtVCTHZIBDR7vSoRYq6lfasl
 NvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8pnL5RF9+BKS0yCU4wzwUQVaNhGA3Xq25e2RnEtDMc=;
 b=RwLoEnrFIh6PfHWAQqznDxYU5F5Zjuz61q3WNZHuxUteiadAY3aAskhc2BqRzwyG4n
 7SIcHz3/YVMabwOm+SBIaJ3vYul0+8AE7tW7mmwrYB9Iu4LtZiLRvl4EA4YXuyvL5t8l
 xCsCi3+WGeAJYQjpAVTOsMrxnEVqO6rHEBCme7rEsPb9NbethVxK4zSCNVG4uEfwJaLu
 hJiSblqn32DKRNbL850PEGB33hN6IeYBxdvnPTMBda8+mTfjBkf3uQ6MnOdYiiszQ3iU
 msT/Ypzo1fPhC5aSKJZ6TgC5H2aF6GdYqez9H2EMpR6pqqsvej0equ1N/oWhzeaWX7FR
 YY1Q==
X-Gm-Message-State: AGi0PuaOMviTxEbi9JT068msS2TdeAuqrfxTRtEv1i82ej2hSP3w/3Gh
 keV+wBtWy8VR+HmjL4u9POBMdw==
X-Google-Smtp-Source: APiQypIjk0W9KFW29ZFFFx1CfQEYyAvCRaEn9LezdI/ZWAZLar0mJVG729+qaT3zhXcgoIztuX3o8A==
X-Received: by 2002:a05:620a:1395:: with SMTP id
 k21mr5752299qki.120.1587676245130; 
 Thu, 23 Apr 2020 14:10:45 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 14:10:44 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 6/9] drm/msm/a6xx: A640/A650 GMU firmware path
Date: Thu, 23 Apr 2020 17:09:18 -0400
Message-Id: <20200423210946.28867-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer GPUs have different GMU firmware path.

v3: updated a6xx_gmu_fw_load based on feedback, including gmu_write_bulk,
and removed extra whitespace change

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 138 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  10 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |   6 +
 3 files changed, 138 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b22a69e2f4b0..988575fc8e71 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -571,6 +571,8 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
 {
 	/* Disable GMU WB/RB buffer */
 	gmu_write(gmu, REG_A6XX_GMU_SYS_BUS_CONFIG, 0x1);
+	gmu_write(gmu, REG_A6XX_GMU_ICACHE_CONFIG, 0x1);
+	gmu_write(gmu, REG_A6XX_GMU_DCACHE_CONFIG, 0x1);
 
 	gmu_write(gmu, REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL, 0x9c40400);
 
@@ -600,14 +602,95 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
 		A6XX_GMU_RPMH_CTRL_GFX_VOTE_ENABLE);
 }
 
+struct block_header {
+	u32 addr;
+	u32 size;
+	u32 type;
+	u32 value;
+	u32 data[];
+};
+
+/* this should be a general kernel helper */
+static int in_range(u32 addr, u32 start, u32 size)
+{
+	return addr >= start && addr < start + size;
+}
+
+static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
+{
+	if (!in_range(blk->addr, bo->iova, bo->size))
+		return false;
+
+	memcpy(bo->virt + blk->addr - bo->iova, blk->data, blk->size);
+	return true;
+}
+
+static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct firmware *fw_image = adreno_gpu->fw[ADRENO_FW_GMU];
+	const struct block_header *blk;
+	u32 reg_offset;
+
+	u32 itcm_base = 0x00000000;
+	u32 dtcm_base = 0x00040000;
+
+	if (adreno_is_a650(adreno_gpu))
+		dtcm_base = 0x10004000;
+
+	if (gmu->legacy) {
+		/* Sanity check the size of the firmware that was loaded */
+		if (fw_image->size > 0x8000) {
+			DRM_DEV_ERROR(gmu->dev,
+				"GMU firmware is bigger than the available region\n");
+			return -EINVAL;
+		}
+
+		gmu_write_bulk(gmu, REG_A6XX_GMU_CM3_ITCM_START,
+			       (u32*) fw_image->data, fw_image->size);
+		return 0;
+	}
+
+
+	for (blk = (const struct block_header *) fw_image->data;
+	     (const u8*) blk < fw_image->data + fw_image->size;
+	     blk = (const struct block_header *) &blk->data[blk->size >> 2]) {
+		if (blk->size == 0)
+			continue;
+
+		if (in_range(blk->addr, itcm_base, SZ_16K)) {
+			reg_offset = (blk->addr - itcm_base) >> 2;
+			gmu_write_bulk(gmu,
+				REG_A6XX_GMU_CM3_ITCM_START + reg_offset,
+				blk->data, blk->size);
+		} else if (in_range(blk->addr, dtcm_base, SZ_16K)) {
+			reg_offset = (blk->addr - dtcm_base) >> 2;
+			gmu_write_bulk(gmu,
+				REG_A6XX_GMU_CM3_DTCM_START + reg_offset,
+				blk->data, blk->size);
+		} else if (!fw_block_mem(&gmu->icache, blk) &&
+			   !fw_block_mem(&gmu->dcache, blk) &&
+			   !fw_block_mem(&gmu->dummy, blk)) {
+			DRM_DEV_ERROR(gmu->dev,
+				"failed to match fw block (addr=%.8x size=%d data[0]=%.8x)\n",
+				blk->addr, blk->size, blk->data[0]);
+		}
+	}
+
+	return 0;
+}
+
 static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
 	static bool rpmh_init;
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
-	int i, ret;
+	int ret;
 	u32 chipid;
-	u32 *image;
+
+	if (adreno_is_a650(adreno_gpu))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
 
 	if (state == GMU_WARM_BOOT) {
 		ret = a6xx_rpmh_start(gmu);
@@ -618,13 +701,6 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 			"GMU firmware is not loaded\n"))
 			return -ENOENT;
 
-		/* Sanity check the size of the firmware that was loaded */
-		if (adreno_gpu->fw[ADRENO_FW_GMU]->size > 0x8000) {
-			DRM_DEV_ERROR(gmu->dev,
-				"GMU firmware is bigger than the available region\n");
-			return -EINVAL;
-		}
-
 		/* Turn on register retention */
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
@@ -638,11 +714,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 				return ret;
 		}
 
-		image = (u32 *) adreno_gpu->fw[ADRENO_FW_GMU]->data;
-
-		for (i = 0; i < adreno_gpu->fw[ADRENO_FW_GMU]->size >> 2; i++)
-			gmu_write(gmu, REG_A6XX_GMU_CM3_ITCM_START + i,
-				image[i]);
+		ret = a6xx_gmu_fw_load(gmu);
+		if (ret)
+			return ret;
 	}
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, 0);
@@ -775,6 +849,13 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	status = gmu_read(gmu, REG_A6XX_GMU_GENERAL_7) == 1 ?
 		GMU_WARM_BOOT : GMU_COLD_BOOT;
 
+	/*
+	 * Warm boot path does not work on newer GPUs
+	 * Presumably this is because icache/dcache regions must be restored
+	 */
+	if (!gmu->legacy)
+		status = GMU_COLD_BOOT;
+
 	ret = a6xx_gmu_fw_start(gmu, status);
 	if (ret)
 		goto out;
@@ -957,6 +1038,9 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
 	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
 
 	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
 	msm_gem_address_space_put(gmu->aspace);
@@ -974,12 +1058,14 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	size = PAGE_ALIGN(size);
 	if (!iova) {
 		/* no fixed address - use GMU's uncached range */
-		range_start = 0x60000000;
+		range_start = 0x60000000 + PAGE_SIZE; /* skip dummy page */
 		range_end = 0x80000000;
 	} else {
 		/* range for fixed address */
 		range_start = iova;
 		range_end = iova + size;
+		/* use IOMMU_PRIV for icache/dcache */
+		flags |= MSM_BO_MAP_PRIV;
 	}
 
 	bo->obj = msm_gem_new(dev, size, flags);
@@ -1320,7 +1406,27 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	if (!adreno_is_a640(adreno_gpu) && !adreno_is_a650(adreno_gpu)) {
+	/* Allocate memory for the GMU dummy page */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, SZ_4K, 0x60000000);
+	if (ret)
+		goto err_memory;
+
+	if (adreno_is_a650(adreno_gpu)) {
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
+			SZ_16M - SZ_16K, 0x04000);
+		if (ret)
+			goto err_memory;
+	} else if (adreno_is_a640(adreno_gpu)) {
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
+			SZ_256K - SZ_16K, 0x04000);
+		if (ret)
+			goto err_memory;
+
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->dcache,
+			SZ_256K - SZ_16K, 0x44000);
+		if (ret)
+			goto err_memory;
+	} else {
 		/* HFI v1, has sptprac */
 		gmu->legacy = true;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 463e2d5f2bb9..c6d8c0d1f90b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -57,6 +57,9 @@ struct a6xx_gmu {
 
 	struct a6xx_gmu_bo hfi;
 	struct a6xx_gmu_bo debug;
+	struct a6xx_gmu_bo icache;
+	struct a6xx_gmu_bo dcache;
+	struct a6xx_gmu_bo dummy;
 
 	int nr_clocks;
 	struct clk_bulk_data *clocks;
@@ -92,6 +95,13 @@ static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
 	return msm_writel(value, gmu->mmio + (offset << 2));
 }
 
+static inline void
+gmu_write_bulk(struct a6xx_gmu *gmu, u32 offset, const u32 *data, u32 size)
+{
+	memcpy_toio(gmu->mmio + (offset << 2), data, size);
+	wmb();
+}
+
 static inline void gmu_rmw(struct a6xx_gmu *gmu, u32 reg, u32 mask, u32 or)
 {
 	u32 val = gmu_read(gmu, reg);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 1cc1c135236b..eb2cd41dae6e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -101,6 +101,10 @@ static inline uint32_t A6XX_HFI_IRQ_OOB_MASK(uint32_t val)
 
 #define REG_A6XX_GMU_DCVS_RETURN				0x000023ff
 
+#define REG_A6XX_GMU_ICACHE_CONFIG				0x00004c00
+
+#define REG_A6XX_GMU_DCACHE_CONFIG				0x00004c01
+
 #define REG_A6XX_GMU_SYS_BUS_CONFIG				0x00004c0f
 
 #define REG_A6XX_GMU_CM3_SYSRESET				0x00005000
@@ -199,6 +203,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE		0x000050ec
 
+#define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
+
 #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
 
 #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
