Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2A39379D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AED6F4CA;
	Thu, 27 May 2021 20:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5566E05A;
 Thu, 27 May 2021 20:56:11 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id n10so1935593ion.8;
 Thu, 27 May 2021 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZFOLIektZDd6zr4VRxO6/vlH0qTTmDpJ33fKVwfdZA=;
 b=EwMAVzP9yCXmu55r7KvHJm0HHMP1B33uPh6wi+GEsnT/BsMy0pmEnMyGyYWbYY0O7I
 1gmYQUU1Ve7FeemQBuJqSUT7G5+pNO0YGoq+e4uV0YdceHmiTu1NFemCOxx5YKBAn06N
 uvLTz+NTiH7kX/9x5gg/u5EyIIVMufaII0GR1SA7AlR2shEnXN3oBm0iqXHpoSlk5MqZ
 LfZlQF/0sDkEkAT0iDXr/of3wzhG7LxRJXwh/A9tw3sq2uKbVbMWNThTkERcH9NpyINp
 KJN2vBGtMbd/GyL+yFgj68g+pzP/q1GXefO5uZVb/icygDRmZ6RvAdZLYvYrOTRcTy/N
 E+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZFOLIektZDd6zr4VRxO6/vlH0qTTmDpJ33fKVwfdZA=;
 b=jISO5RtGdNN91f8ogkOclH6qSOAZDQAzp6d9SyVVP/C8kCMc63D14o4rFQ1oMZH6+T
 9iXuICHoF9yJe3ecoitEk8y8cis+sxUrNvGNk2M02JLUtn9510XunCPiRUnw28b8A3jd
 0xWqDi3XKaUmqtFlpJhFAiwpyukzlg7/oowk7LUKsGjV/wZ5i1qKOOw1zIMfT0WihxlS
 b6Sbf21t+DuEWH/xO79Xuht2oPnh6jPjN6lknaDybsSILGxrd9b/RgWXV++6D/+7yCze
 2fn/LrfJvYTeTx+pP7Eo50dqEZpHK8oC2lrZhBeU1cQbNNzmSCrI6uEzD0Zvh9jOlFX0
 qRFg==
X-Gm-Message-State: AOAM532LHlHPP3YEQmS6yAdM992WM/o415ind5BophOQS3D5ds2JPwnv
 UKhCrZN+QUaG58fNkc+GUJkhge8uPd60iQ==
X-Google-Smtp-Source: ABdhPJz54Cvm4flXQKGTpP+thZ4Cs/ZM2pmLCXmYO1iOFxtz/69rb+BH0CrOAljgKkgSCxLV36rPQg==
X-Received: by 2002:a6b:1454:: with SMTP id 81mr4458339iou.7.1622148970002;
 Thu, 27 May 2021 13:56:10 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:09 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] drm/amdkfd: device pgmap owner at the svm migrate init
Date: Thu, 27 May 2021 16:55:57 -0400
Message-Id: <20210527205606.2660-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
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

pgmap owner member at the svm migrate init could be referenced
to either adev or hive, depending on device topology.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index fd8f544f0de2..11f7f590c6ec 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -426,7 +426,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.start = start;
 	migrate.end = end;
 	migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
-	migrate.pgmap_owner = adev;
+	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
@@ -641,7 +641,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.start = start;
 	migrate.end = end;
 	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
-	migrate.pgmap_owner = adev;
+	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
@@ -907,7 +907,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	pgmap->range.start = res->start;
 	pgmap->range.end = res->end;
 	pgmap->ops = &svm_migrate_pgmap_ops;
-	pgmap->owner = adev;
+	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
 	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 573f984b81fe..4297250f259d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -35,6 +35,9 @@
 #include "amdgpu.h"
 #include "kfd_priv.h"
 
+#define SVM_ADEV_PGMAP_OWNER(adev)\
+			((adev)->hive ? (void *)(adev)->hive : (void *)(adev))
+
 struct svm_range_bo {
 	struct amdgpu_bo		*bo;
 	struct kref			kref;
-- 
2.31.1

