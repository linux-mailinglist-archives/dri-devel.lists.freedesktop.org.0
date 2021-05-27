Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F13937A1
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91C56F4D0;
	Thu, 27 May 2021 20:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B1D6F4C7;
 Thu, 27 May 2021 20:56:14 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id b25so1958515iot.5;
 Thu, 27 May 2021 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G1tcho2vQuPwN9OsudHtISmc/DxgqXUVsaVYx3XpKI0=;
 b=KXXWj1sNI002LBIdmNhaICZ/YWCAqVnfw6WfaMeoBYYRjtg3qY4Yt1TstcTK64eHpG
 9IfDDhadktV/3hmtI8WQjVafzuaLg3fImSBYJhqYMjGWBu9UopwTUR+TVn4PWvWQrp7S
 MWmjc+41Zya8J9r9MjF0uPVEXmvYYppN3zLz7o790YwzjtxOMMIln8Waq4jQVkJYUmIv
 AIuxl4+QwYuRz8Be2geNxlDHrmK22PvrSaSw+ijYZddXlZ2cvsJV2NbSUWBto0g9qPMH
 /so01GUi7PfThfg7lXqlaeJm1iGY/77GJ7WKH8meajebVAO6X9Du2MoSY1dFJ+Bqldip
 Ovzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G1tcho2vQuPwN9OsudHtISmc/DxgqXUVsaVYx3XpKI0=;
 b=gA9DMOyDRXq9Linowj43SsNDmLkulYnn/zuzLFXicM/pdy8sPhz4yEMlnCFf3pk7PK
 aCnr9aKuXPJ98v4RablTYrcNLm3HnWY7c2xXsHZLEwfBHUDnaTcg3XUOwCGeG42DdLL0
 17bQmHgvDCzOyc7vJtWtfppe8ePzuTI8B0PCLylMpN3Dk397CjROANW37ICmZv1aLtAD
 mJ807Rr9HLxaqiBVu4p+ThDawt5asaHfM4htSyEv6N85DggM9VD5B8d73qdjgQ/Y2ZD4
 Ksz2w8fqk3hcEGqR+kbZCp8gWGY96rUFrVwnLkXJ5rXKgtIcEm3F3phc4PsWv4+7mENR
 k3Ug==
X-Gm-Message-State: AOAM5329cBbX2NO0xdq10n8xHpqNTT3I7W/qYelaoTI7daLiSigBgL8V
 O0Q8QDoRFTdYv637BgixijTFYmQXJ1IsFg==
X-Google-Smtp-Source: ABdhPJzkzIlMs1CWQgZzYkdtpkN6yKDgFTQ/W4ltxmM435fml4U8mVCf5T3QDT7WQXEhaEb058d4tQ==
X-Received: by 2002:a5d:9c58:: with SMTP id 24mr4476883iof.153.1622148973183; 
 Thu, 27 May 2021 13:56:13 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:12 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/amdgpu: get owner ref in validate and map
Date: Thu, 27 May 2021 16:56:00 -0400
Message-Id: <20210527205606.2660-4-Felix.Kuehling@amd.com>
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

Get the proper owner reference for amdgpu_hmm_range_get_pages function.
This is useful for partial migrations. To avoid migrating back to
system memory, VRAM pages, that are accessible by all devices in the
same memory domain.
Ex. multiple devices in the same hive.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 54f47b09b14a..2b4318646a75 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1313,6 +1313,17 @@ static void svm_range_unreserve_bos(struct svm_validate_context *ctx)
 	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
 }
 
+static void *kfd_svm_page_owner(struct kfd_process *p, int32_t gpuidx)
+{
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *adev;
+
+	pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+	adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+	return SVM_ADEV_PGMAP_OWNER(adev);
+}
+
 /*
  * Validation+GPU mapping with concurrent invalidation (MMU notifiers)
  *
@@ -1343,6 +1354,9 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 {
 	struct svm_validate_context ctx;
 	struct hmm_range *hmm_range;
+	struct kfd_process *p;
+	void *owner;
+	int32_t idx;
 	int r = 0;
 
 	ctx.process = container_of(prange->svms, struct kfd_process, svms);
@@ -1389,10 +1403,19 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	svm_range_reserve_bos(&ctx);
 
 	if (!prange->actual_loc) {
+		p = container_of(prange->svms, struct kfd_process, svms);
+		owner = kfd_svm_page_owner(p, find_first_bit(ctx.bitmap,
+							MAX_GPU_INSTANCE));
+		for_each_set_bit(idx, ctx.bitmap, MAX_GPU_INSTANCE) {
+			if (kfd_svm_page_owner(p, idx) != owner) {
+				owner = NULL;
+				break;
+			}
+		}
 		r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
 					       prange->start << PAGE_SHIFT,
 					       prange->npages, &hmm_range,
-					       false, true, NULL);
+					       false, true, owner);
 		if (r) {
 			pr_debug("failed %d to get svm range pages\n", r);
 			goto unreserve_out;
-- 
2.31.1

