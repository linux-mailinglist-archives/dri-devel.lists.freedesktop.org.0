Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B513937AE
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707766F4DB;
	Thu, 27 May 2021 20:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825F16F4DA;
 Thu, 27 May 2021 20:56:20 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id o10so1456492ilm.13;
 Thu, 27 May 2021 13:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/JjWzro4A2OCgWHcu1YXap6BV3Bmhd60DexHUrV220=;
 b=o07lZiXsxTVWUuuqUPVXT4q1SfjYXCOjeWjGTRsiI1vX7D2ekO2JFNe9Qcsk6I0wBV
 //HacdPj0E0Zkqf9GMcalvM7nThh9uUgVDFOXl2+e46PHtPQjugCz8/+Kt5d4JN+vO/H
 OvK3xTk0WCL/nQ9wbbNWzqTvMfcwsw/aYGxutPVEe4LcScGoygsMk5aClYMGwHr2677k
 TA89EdHN5qlLLKPAph0ycbaiOQn1pjHicbD7WS4WnrWkcTchMNbzRlJYhr64dfjPR3Am
 0fUo3LHx4Q6zGL4bEwM+WQsFP4GRFF9nzSDjNDurjIhj06rjjrDhqP0/0nlwdkD5U6hn
 sawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/JjWzro4A2OCgWHcu1YXap6BV3Bmhd60DexHUrV220=;
 b=SwxxCyPbzi1rw4UEtDL+xuFILZNysLajOPuaJdlLdgaqwWVmn3TZDcHcn/Z95F9RcO
 ntTurMImVkA42dFSoxsnlpfgAVXkVNwOCjKRvqYYfVlXn3jdlYMZBlK88n4gtt0Zxk5z
 2YaXXdRvGNdvKKSbmZw2RIdKCENgEadZhiDfIk5uZlWXOwwwJDFpUcCMVzs6bGGvkQ4m
 4/9BAEIikH74WCWyBJpLrccd2spewmd8T9bDY1J1cAyfW06amaaLFFNSEYi2suRQr8bO
 mzQVin10I3fHgazW4DhGNdc+YJ9p1q/2PeXKw/K3gc/lBt9IcgOSdp20r6Z9rKbbIDwo
 OfSw==
X-Gm-Message-State: AOAM532RHoNvugZLd1znkVXJTBChUc4vjsHCOxVqjgklBNcDNbQflvPu
 A6nOb2+P9DV58gsQS3nc2klSWVB1+ZV7Ug==
X-Google-Smtp-Source: ABdhPJxl/iMYR8Z9Q3oCLtRIuSau+DDg/+nplNKRdqaAc8wE7+0J5MGQpLWf1HS0GKrZbtgyE05dbg==
X-Received: by 2002:a05:6e02:b4b:: with SMTP id
 f11mr4551361ilu.253.1622148979406; 
 Thu, 27 May 2021 13:56:19 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:19 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] drm/amdkfd: protect svm_bo ref in case prange has forked
Date: Thu, 27 May 2021 16:56:06 -0400
Message-Id: <20210527205606.2660-10-Felix.Kuehling@amd.com>
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

Keep track of all the pages inside of pranges referenced to
the same svm_bo. This is done, by using the ref count inside this object.
This makes sure the object has freed after the last prange is not longer
at any GPU. Including references shared between a parent and child during
a fork.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 10 ++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 10 +---------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 10 +++++++++-
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index acb9f64577a0..c8ca3252cbc2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -245,7 +245,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	struct page *page;
 
 	page = pfn_to_page(pfn);
-	page->zone_device_data = prange;
+	page->zone_device_data = prange->svm_bo;
 	get_page(page);
 	lock_page(page);
 }
@@ -336,6 +336,7 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
 			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 			migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+			svm_range_bo_ref(prange->svm_bo);
 		}
 		if (migrate->dst[i] & MIGRATE_PFN_VALID) {
 			spage = migrate_pfn_to_page(migrate->src[i]);
@@ -540,7 +541,12 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 
 static void svm_migrate_page_free(struct page *page)
 {
-	/* Keep this function to avoid warning */
+	struct svm_range_bo *svm_bo = page->zone_device_data;
+
+	if (svm_bo) {
+		pr_debug("svm_bo ref left: %d\n", kref_read(&svm_bo->kref));
+		svm_range_bo_unref(svm_bo);
+	}
 }
 
 static int
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 1e15a6170635..2bc20752ee30 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -309,14 +309,6 @@ static bool svm_bo_ref_unless_zero(struct svm_range_bo *svm_bo)
 	return true;
 }
 
-static struct svm_range_bo *svm_range_bo_ref(struct svm_range_bo *svm_bo)
-{
-	if (svm_bo)
-		kref_get(&svm_bo->kref);
-
-	return svm_bo;
-}
-
 static void svm_range_bo_release(struct kref *kref)
 {
 	struct svm_range_bo *svm_bo;
@@ -355,7 +347,7 @@ static void svm_range_bo_release(struct kref *kref)
 	kfree(svm_bo);
 }
 
-static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
+void svm_range_bo_unref(struct svm_range_bo *svm_bo)
 {
 	if (!svm_bo)
 		return;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 27fbe1936493..21f693767a0d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -150,6 +150,14 @@ static inline void svm_range_unlock(struct svm_range *prange)
 	mutex_unlock(&prange->lock);
 }
 
+static inline struct svm_range_bo *svm_range_bo_ref(struct svm_range_bo *svm_bo)
+{
+	if (svm_bo)
+		kref_get(&svm_bo->kref);
+
+	return svm_bo;
+}
+
 int svm_range_list_init(struct kfd_process *p);
 void svm_range_list_fini(struct kfd_process *p);
 int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
@@ -178,7 +186,7 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 void svm_range_free_dma_mappings(struct svm_range *prange);
 void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm,
 			void *owner);
-
+void svm_range_bo_unref(struct svm_range_bo *svm_bo);
 #else
 
 struct kfd_process;
-- 
2.31.1

