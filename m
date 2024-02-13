Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3362F85374F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 18:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D9410E029;
	Tue, 13 Feb 2024 17:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dXC8Ebo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804C710E8C7;
 Tue, 13 Feb 2024 17:23:59 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1d746856d85so34470495ad.0; 
 Tue, 13 Feb 2024 09:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707845036; x=1708449836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FLsvLF6QUYIuVDvvapHTNMgjuAm/e6T5t1iBfk2PvVA=;
 b=dXC8Ebo0eSo947yajWKazJNYHnGIBBcdi6hEO9r2kXdOiXtst0OZsUzQvJ5aAgIa+C
 DdggmhBfYBh0PNA2cYMEWym7qfyuT11fDfK+HkzFn3g7r8mrVXzngMqy7Ua28aHCmSB6
 IGWNEnV1hOyeIlZPOqGS7NnUSimg9pc8U4u//tOF+q+2Oikk5C3CkZgKvFwLlpho2IfJ
 dhApyVAItuuZul0IdMlhsxNuHjoiwmyWyWhNQUmkqjWt/7X9pv45L9mdeonLmjhCg/eI
 CETZkigexaj6u8qe9eVFC1GT+tFaYh6MTtIFTDNcum5fxj6b7zfi2qA2M80hyth7+9VM
 rMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845036; x=1708449836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FLsvLF6QUYIuVDvvapHTNMgjuAm/e6T5t1iBfk2PvVA=;
 b=s0sE1zM1uhU7at0s7NMf522oG8ELSpAOD2Q5K9LlV6rd3ItalegbpJ7EK4OYEXM/7G
 wawzDB4pBecvVqvQZ73nWSjZfWGGm3Wya1XW9kmGAU7/9HnZa90Cn8z19BiWMYxTqrgf
 MPtIAUefxN0VudQN1qiJRbfynK3R2YsUBMP1nghhHOkQc5cEKcpPNSljGbO9Pofoa2zw
 EIvxPLlWrFNekzWjlw1mQOxAhAGuaNSSfeFQzDnSTXFN/0/xroYOVwd5LEbbyDrlCBL6
 qIh1XX8iAGxrVc0hjKrO9z5zPRPp7fgjlsbp7IyZT0FPieN1iHQqCgdZGbXlQxA/Syqo
 r3hA==
X-Gm-Message-State: AOJu0Ywhl553Yi5y9IJA4hSri3V8e2/8uPEBHbMKl7nNkFmyTADxot9u
 mjtM5zSUgxP34awxt49O82RHWhad0QrO/QSatRnCMzjcYmA2Uvfxm+JkPmLu
X-Google-Smtp-Source: AGHT+IFdCtLRJdOgW5lz/LKUTdPO1GdknYEPgh4plB438nRYmiTFekiGe0mNbi1gtuZvBC3Wkqh5tg==
X-Received: by 2002:a17:902:a513:b0:1d9:95c5:2975 with SMTP id
 s19-20020a170902a51300b001d995c52975mr125039plq.26.1707845035585; 
 Tue, 13 Feb 2024 09:23:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAFLBoxwayfeJdOdJaLCxj9/95+M2cVx1lDK2IAY9ThXhNwuF4KeCLrS4JDMp0iqN6EfuCmO7l9e8PHQAgmy3E0INegBYNWJgFxtaMPbuNpnhagHlEdJ6w8MAWCkocA6iKwrLBZ/wa4OVpGCszewOZbb4FxAaqYzYPZ3V3r9UTPEA2r14cjRHEWiHjD1tJnIU0AET3h7j8BUGrmfH6ob9zZdonbDEw6/SvphIu1Q3gf3efi0ZbAa/6w3sTHtJOBigYsnFgwURz0IFUQ/oJ0Wul/6JAduUtId73OTDJzZO6P4Uz2X/ax7dQ16lTv6Warszu7FYFcFBH7NX0fO2BL4cDh2jcFpFGTj+PRNM8l6n8GeO7lHnyd/kFm5wgX95qfYF8FkrsTLG9KLVz7V0KgSpteOgN/js64aATrk/3gZgiCOEPtlWY+TfgePm25yXld+liWX9G/TeIIfpiWyK1doIj/kptuDHMSI9srQ==
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902bd8200b001d9fc826522sm2321775pls.239.2024.02.13.09.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:23:55 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Wire up tlb ops
Date: Tue, 13 Feb 2024 09:23:40 -0800
Message-ID: <20240213172340.228314-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The brute force iommu_flush_iotlb_all() was good enough for unmap, but
in some cases a map operation could require removing a table pte entry
to replace with a block entry.  This also requires tlb invalidation.
Missing this was resulting an obscure iova fault on what should be a
valid buffer address.

Thanks to Robin Murphy for helping me understand the cause of the fault.

Cc: Robin Murphy <robin.murphy@arm.com>
Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5cc8d358cc97..d5512037c38b 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -21,6 +21,8 @@ struct msm_iommu_pagetable {
 	struct msm_mmu base;
 	struct msm_mmu *parent;
 	struct io_pgtable_ops *pgtbl_ops;
+	const struct iommu_flush_ops *tlb;
+	struct device *iommu_dev;
 	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
 	phys_addr_t ttbr;
 	u32 asid;
@@ -201,11 +203,33 @@ static const struct msm_mmu_funcs pagetable_funcs = {
 
 static void msm_iommu_tlb_flush_all(void *cookie)
 {
+	struct msm_iommu_pagetable *pagetable = cookie;
+	struct adreno_smmu_priv *adreno_smmu;
+
+	if (!pm_runtime_get_if_in_use(pagetable->iommu_dev))
+		return;
+
+	adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+
+	pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
+
+	pm_runtime_put_autosuspend(pagetable->iommu_dev);
 }
 
 static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
 		size_t granule, void *cookie)
 {
+	struct msm_iommu_pagetable *pagetable = cookie;
+	struct adreno_smmu_priv *adreno_smmu;
+
+	if (!pm_runtime_get_if_in_use(pagetable->iommu_dev))
+		return;
+
+	adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+
+	pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
+
+	pm_runtime_put_autosuspend(pagetable->iommu_dev);
 }
 
 static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
@@ -213,7 +237,7 @@ static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
 {
 }
 
-static const struct iommu_flush_ops null_tlb_ops = {
+static const struct iommu_flush_ops tlb_ops = {
 	.tlb_flush_all = msm_iommu_tlb_flush_all,
 	.tlb_flush_walk = msm_iommu_tlb_flush_walk,
 	.tlb_add_page = msm_iommu_tlb_add_page,
@@ -254,10 +278,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 
 	/* The incoming cfg will have the TTBR1 quirk enabled */
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
-	ttbr0_cfg.tlb = &null_tlb_ops;
+	ttbr0_cfg.tlb = &tlb_ops;
 
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
-		&ttbr0_cfg, iommu->domain);
+		&ttbr0_cfg, pagetable);
 
 	if (!pagetable->pgtbl_ops) {
 		kfree(pagetable);
@@ -279,6 +303,8 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
+	pagetable->tlb = ttbr1_cfg->tlb;
+	pagetable->iommu_dev = ttbr1_cfg->iommu_dev;
 	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
 
-- 
2.43.0

