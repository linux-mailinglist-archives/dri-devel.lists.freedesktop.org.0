Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42423937A0
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0D96F4CC;
	Thu, 27 May 2021 20:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0EC6F4C7;
 Thu, 27 May 2021 20:56:12 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b25so1958464iot.5;
 Thu, 27 May 2021 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2lHOtb7OcvVwWqNFg2wQ8RkEDsPGivk/u/nV7fuLJE=;
 b=u3qvkfKEnPO9JLJp8Z4Tzxytg/h+2PhjaA/5XOnee8IiF6yfE0F20hm7K5ZSpysPla
 aKcKFt+bBUK+zCfT2a+YzPfTCxteHp1fJLKBm9q85rsOqod2fbLTUgg7x5Xd6nMME0fx
 ij1DeHzSvqSGsg5tSqEFL2HJbQU09SwmgQj8dMU4qqVFnxqdJc9IfpH5BdntX2+2WuZH
 X5wjOz1B0bSVHjXihCgP1VLgJqC9VOiF/MeP4fjGgbXK1r0lxhplhtahx5PYg3L7dTaQ
 qoALygn5P6Twk+g05NBeQdEc2kjskROpse7nQQjNt/XFAPA+TGXQMwMYXYpqNSq4huey
 5EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D2lHOtb7OcvVwWqNFg2wQ8RkEDsPGivk/u/nV7fuLJE=;
 b=ckPNs8fjB/BoQTrpnHAQeKIqAqn9hlABjuJT5M6d0IvkOnX3Jezu3bL3zeHKkJr+5S
 9/K6Ll49rhC1FvFVXIC0eoCOTOr8OCsDaem+slJ9d8pixKMCFXkuJGEez+LhJquYkwrN
 gAXeKbU5diDMNS7mGQOoH9sR7BDwEX/++qcOBD7uEpDROVOy5u8sg/zRprfSMo+jmZHF
 ErSGKmGaUr9Km+4rEfk+xsBi+11QDSxPXi+uq4YTDODKDC0a5jYs1/AaGkqzP2OGOAh8
 QThNaqHt/Sq788WhBE7g33TId0da7QCJ7Sg4/DxXRrz4re9iRNphHuQCLhNBK5p23DoY
 0prw==
X-Gm-Message-State: AOAM530tuy/I0nSVoPfgfVy/XsTf0vCs7ffLyGltgCEFPxrIreWhqK18
 fq5rtGo89/XxYXK6Pb+Q6Vp6ZVQViv+qdw==
X-Google-Smtp-Source: ABdhPJxYUUknRVx3MxA0BgEmC2o+6SOh44Rbmrkg/DTY/MzzlohivfYmGFsXfOBjaC0hdv/V80VC9Q==
X-Received: by 2002:a05:6638:21a:: with SMTP id
 e26mr5281508jaq.58.1622148971284; 
 Thu, 27 May 2021 13:56:11 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:10 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] drm/amdkfd: add owner ref param to get hmm pages
Date: Thu, 27 May 2021 16:55:58 -0400
Message-Id: <20210527205606.2660-2-Felix.Kuehling@amd.com>
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

The parameter is used in the dev_private_owner to decide if device
pages in the range require to be migrated back to system memory, based
if they are or not in the same memory domain.
In this case, this reference could come from the same memory domain
with devices connected to the same hive.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h  | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c    | 4 ++--
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 2741c28ff1b5..378c238c2099 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -160,7 +160,7 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 			       struct mm_struct *mm, struct page **pages,
 			       uint64_t start, uint64_t npages,
 			       struct hmm_range **phmm_range, bool readonly,
-			       bool mmap_locked)
+			       bool mmap_locked, void *owner)
 {
 	struct hmm_range *hmm_range;
 	unsigned long timeout;
@@ -185,6 +185,7 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 	hmm_range->hmm_pfns = pfns;
 	hmm_range->start = start;
 	hmm_range->end = start + npages * PAGE_SIZE;
+	hmm_range->dev_private_owner = owner;
 
 	/* Assuming 512MB takes maxmium 1 second to fault page address */
 	timeout = max(npages >> 17, 1ULL) * HMM_RANGE_DEFAULT_TIMEOUT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
index 7f7d37a457c3..14a3c1864085 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
@@ -34,7 +34,7 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 			       struct mm_struct *mm, struct page **pages,
 			       uint64_t start, uint64_t npages,
 			       struct hmm_range **phmm_range, bool readonly,
-			       bool mmap_locked);
+			       bool mmap_locked, void *owner);
 int amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_range);
 
 #if defined(CONFIG_HMM_MIRROR)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7e7d8330d64b..c13f7fbfc070 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -709,7 +709,7 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	readonly = amdgpu_ttm_tt_is_readonly(ttm);
 	r = amdgpu_hmm_range_get_pages(&bo->notifier, mm, pages, start,
 				       ttm->num_pages, &gtt->range, readonly,
-				       false);
+				       false, NULL);
 out_putmm:
 	mmput(mm);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index b665e9ff77e3..b939f353ac8c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1392,7 +1392,7 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
 					       prange->start << PAGE_SHIFT,
 					       prange->npages, &hmm_range,
-					       false, true);
+					       false, true, NULL);
 		if (r) {
 			pr_debug("failed %d to get svm range pages\n", r);
 			goto unreserve_out;
@@ -2657,7 +2657,7 @@ void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm)
 	r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
 				       prange->start << PAGE_SHIFT,
 				       prange->npages, &hmm_range,
-				       false, true);
+				       false, true, NULL);
 	if (!r) {
 		amdgpu_hmm_range_get_pages_done(hmm_range);
 		prange->validated_once = true;
-- 
2.31.1

