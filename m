Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F11B03937AC
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE79E6F4DA;
	Thu, 27 May 2021 20:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596936F4DB;
 Thu, 27 May 2021 20:56:19 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id k22so1936430ioa.9;
 Thu, 27 May 2021 13:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NtsOMPx4MYkCLJ0TPZ28k3bl7JgFX4G9RGUV3lfIuo=;
 b=s6oFQ0ulr9y1gkGxTcI0G7Opo/22W70in/KBdRlCwSewauReb2dTeJZG8chtm9dy/O
 pYVLndfJ8PXPRxv6SLyd9eaK8Ndf/UVfJhwVWFDOuhCwwirO0izyLgcQYnrmAiFnZXR9
 7NLvT/hj5N7mn9Q5CZtwY7nJNZlyyHNGKB1xFeeVr9MqNgmgveVry3FDhXvYMZIg8NFj
 u6vOZlqYe6xdWhnO8HleEAZYmTIIraCY/gvcmx/HjK6+e6Bs9pJzLDGHGbXJTFlxTqrR
 v4rOeJrlzI6jTH2Ri8CCo/NU2xJgTu5OOpaBLubqJtwiCmByDaJUbzxrGFft24IuhGpN
 g71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8NtsOMPx4MYkCLJ0TPZ28k3bl7JgFX4G9RGUV3lfIuo=;
 b=M3K1GUYgapS9/PCsG1vLAzdZzLMmVxfkpiXukJyced0PY4aVCVYLl/DBE1GsisxDCd
 YiOfelZRp4I3ujj2ITCaEoH+LGBMy+dM1Cc9Ae++m0K6Zg61mgxfYhY/1XvHEhih+t2I
 THo1qLo9uis14RNk6gJo3i1CXUYvHKb1HP4rChp5JfcASfvBsmn59Omdi53Sv+FksELm
 DN3UgT4BTEfy/nQRh+EENaAxtH0qjhpbN3TZKQYeqqXkyFhsnMlB9Cq9idBBQ9uEEacq
 u4CKdB91W2KYBhOXt24MxV34X9/HBK9xbd39kCxhrlfgOUbg1GInRQsJHamZPGY3Xu/A
 7ZOQ==
X-Gm-Message-State: AOAM531XpCiXKRPyQ+5X6ZnsUnms26xF4DkNBoXAVlAUfGpH2DxHXRrP
 E59iYAPMy2G+b8PoAvTrHVYLNBhEJ28mAA==
X-Google-Smtp-Source: ABdhPJzT6HgjvQzvbCBhkeTY5/c5SttWmlQTFK6CqeRkiK2Fkkdv+W6mILxxZg7EfoerYFFGF9HT7g==
X-Received: by 2002:a6b:e817:: with SMTP id f23mr4234692ioh.183.1622148978438; 
 Thu, 27 May 2021 13:56:18 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:18 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] drm/amdkfd: partially actual_loc removed
Date: Thu, 27 May 2021 16:56:05 -0400
Message-Id: <20210527205606.2660-9-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527205606.2660-1-Felix.Kuehling@amd.com>
References: <20210527205606.2660-1-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

actual_loc should not be used anymore, as pranges
could have mixed locations (VRAM & SYSRAM) at the
same time.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 12 +---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 71 ++++++++++--------------
 2 files changed, 29 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index f71f8d7e2b72..acb9f64577a0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -501,12 +501,6 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	struct amdgpu_device *adev;
 	int r = 0;
 
-	if (prange->actual_loc == best_loc) {
-		pr_debug("svms 0x%p [0x%lx 0x%lx] already on best_loc 0x%x\n",
-			 prange->svms, prange->start, prange->last, best_loc);
-		return 0;
-	}
-
 	adev = svm_range_get_adev_by_id(prange, best_loc);
 	if (!adev) {
 		pr_debug("failed to get device by id 0x%x\n", best_loc);
@@ -791,11 +785,7 @@ int
 svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
 		    struct mm_struct *mm)
 {
-	if  (!prange->actual_loc)
-		return svm_migrate_ram_to_vram(prange, best_loc, mm);
-	else
-		return svm_migrate_vram_to_vram(prange, best_loc, mm);
-
+	return svm_migrate_ram_to_vram(prange, best_loc, mm);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7b50395ec377..1e15a6170635 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1420,42 +1420,38 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 
 	svm_range_reserve_bos(&ctx);
 
-	if (!prange->actual_loc) {
-		p = container_of(prange->svms, struct kfd_process, svms);
-		owner = kfd_svm_page_owner(p, find_first_bit(ctx.bitmap,
-							MAX_GPU_INSTANCE));
-		for_each_set_bit(idx, ctx.bitmap, MAX_GPU_INSTANCE) {
-			if (kfd_svm_page_owner(p, idx) != owner) {
-				owner = NULL;
-				break;
-			}
-		}
-		r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
-					       prange->start << PAGE_SHIFT,
-					       prange->npages, &hmm_range,
-					       false, true, owner);
-		if (r) {
-			pr_debug("failed %d to get svm range pages\n", r);
-			goto unreserve_out;
-		}
-
-		r = svm_range_dma_map(prange, ctx.bitmap,
-				      hmm_range->hmm_pfns);
-		if (r) {
-			pr_debug("failed %d to dma map range\n", r);
-			goto unreserve_out;
+	p = container_of(prange->svms, struct kfd_process, svms);
+	owner = kfd_svm_page_owner(p, find_first_bit(ctx.bitmap,
+						MAX_GPU_INSTANCE));
+	for_each_set_bit(idx, ctx.bitmap, MAX_GPU_INSTANCE) {
+		if (kfd_svm_page_owner(p, idx) != owner) {
+			owner = NULL;
+			break;
 		}
+	}
+	r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
+				       prange->start << PAGE_SHIFT,
+				       prange->npages, &hmm_range,
+				       false, true, owner);
+	if (r) {
+		pr_debug("failed %d to get svm range pages\n", r);
+		goto unreserve_out;
+	}
 
-		prange->validated_once = true;
+	r = svm_range_dma_map(prange, ctx.bitmap,
+			      hmm_range->hmm_pfns);
+	if (r) {
+		pr_debug("failed %d to dma map range\n", r);
+		goto unreserve_out;
 	}
 
+	prange->validated_once = true;
+
 	svm_range_lock(prange);
-	if (!prange->actual_loc) {
-		if (amdgpu_hmm_range_get_pages_done(hmm_range)) {
-			pr_debug("hmm update the range, need validate again\n");
-			r = -EAGAIN;
-			goto unlock_out;
-		}
+	if (amdgpu_hmm_range_get_pages_done(hmm_range)) {
+		pr_debug("hmm update the range, need validate again\n");
+		r = -EAGAIN;
+		goto unlock_out;
 	}
 	if (!list_empty(&prange->child_list)) {
 		pr_debug("range split by unmap in parallel, validate again\n");
@@ -2740,20 +2736,9 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	*migrated = false;
 	best_loc = svm_range_best_prefetch_location(prange);
 
-	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
-	    best_loc == prange->actual_loc)
+	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED)
 		return 0;
 
-	/*
-	 * Prefetch to GPU without host access flag, set actual_loc to gpu, then
-	 * validate on gpu and map to gpus will be handled afterwards.
-	 */
-	if (best_loc && !prange->actual_loc &&
-	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS)) {
-		prange->actual_loc = best_loc;
-		return 0;
-	}
-
 	if (!best_loc) {
 		r = svm_migrate_vram_to_ram(prange, mm);
 		*migrated = !r;
-- 
2.31.1

