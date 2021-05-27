Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21E3938F0
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6AA6F414;
	Thu, 27 May 2021 23:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6B06EE51;
 Thu, 27 May 2021 23:09:41 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id j30so1761739ila.5;
 Thu, 27 May 2021 16:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1vTFumJbcjlC9H58za7civP9oS0BxFYnQlOIDDd8vSU=;
 b=HAIg1uSz4RBzsZCtp4d4QdB9b8SdCfGZGGkYyjQJ1gpqJOsXAvP98PnBrf2z4CMtNU
 QzSbafdmDgr4kszEaSkqeJcgdmzAvYEqqA5a70bmnambeDgQ0u4GM/6R/nmp3dJKVRo3
 0bYjKH8I1+oipkfzOoA8chQFIQBF4MCZYCzKAekcY98QcSsEjbLAaoqZmOtHzPgcAvih
 KhwHdE9VI6bNbwHYvNtiWHV/Fk4zWs4Rv9xiflD+lQBLlEgjrCBraoaU//SEG3Z84rEv
 uUoYXnEnBbhbG9dgYvBhC8qb51RDUrreN+AAApT6iYh9ivrPx97e76JBAO9+apO1gsEa
 F0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vTFumJbcjlC9H58za7civP9oS0BxFYnQlOIDDd8vSU=;
 b=fY40y0NI40YqQ4PG1csryxWR3Qk57TXGM0g6WtHL1VSYsZRVJ++Hu65alDcfyAM4G+
 GuyGdA0SJkRoGTnhiQQKh1F7ahF4/JwakGFeG6Z+rU9KDfPr5vQpkasC/6HQOlF2LW8I
 iIQaSCYKFPJL47+ElzV+Tj9pPS95vbUUXpaNvSmbDcBK2nQqsKRkS7MqqScZWEP29G+O
 S2tDmqBCMoh8NDwhoKOWvCpgHPU82R3BM/NREplORKigOpmb80jvrz1RpCbh8/oLHH+h
 6pK5ioX3PwQaNK4M/nJAfBzmS7dvaLk3TpERHlpYS5sTpRHgFDDN/z8icbCkPHRHcstv
 9/rA==
X-Gm-Message-State: AOAM533FE6mgrcUU6xFe1JmMXkeFUWMED3JRjoPPdt9a9SkvyVBKpuE0
 /V33DL3V3IAjsX7Ky1jlltfVsb9W9R+QIGgd
X-Google-Smtp-Source: ABdhPJxGyk+/fitlH3T/Ywo0Dq9sm0GcM01SIGfE1kwmfZ4Tql9lUnIKyyNl5J+eQtri+AKvK9GjAg==
X-Received: by 2002:a92:3302:: with SMTP id a2mr4869468ilf.62.1622156981342;
 Thu, 27 May 2021 16:09:41 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id r5sm1860014ilb.1.2021.05.27.16.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 16:09:32 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: felix.kuehling@amd.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 1/5] drm/amdkfd: add SPM support for SVM
Date: Thu, 27 May 2021 19:08:05 -0400
Message-Id: <20210527230809.3701-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527230809.3701-1-Felix.Kuehling@amd.com>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_GENERIC to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 12 +++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  1 -
 kernel/resource.c                        |  2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index c8ca3252cbc2..f5939449a99f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -895,6 +895,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	struct resource *res;
 	unsigned long size;
 	void *r;
+	bool xgmi_connected_to_cpu = adev->gmc.xgmi.connected_to_cpu;
 
 	/* Page migration works on Vega10 or newer */
 	if (kfddev->device_info->asic_family < CHIP_VEGA10)
@@ -907,17 +908,22 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+	if (xgmi_connected_to_cpu)
+		res = lookup_resource(&iomem_resource, adev->gmc.aper_base);
+	else
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+
 	if (IS_ERR(res))
 		return -ENOMEM;
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
 	pgmap->range.start = res->start;
 	pgmap->range.end = res->end;
+	pgmap->type = xgmi_connected_to_cpu ?
+				MEMORY_DEVICE_GENERIC : MEMORY_DEVICE_PRIVATE;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	pgmap->flags = 0;
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 21f693767a0d..3881a93192ed 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -38,7 +38,6 @@
 #define SVM_RANGE_VRAM_DOMAIN (1UL << 0)
 #define SVM_ADEV_PGMAP_OWNER(adev)\
 			((adev)->hive ? (void *)(adev)->hive : (void *)(adev))
-
 struct svm_range_bo {
 	struct amdgpu_bo		*bo;
 	struct kref			kref;
diff --git a/kernel/resource.c b/kernel/resource.c
index 627e61b0c124..da137553b83e 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -783,7 +783,7 @@ struct resource *lookup_resource(struct resource *root, resource_size_t start)
 
 	return res;
 }
-
+EXPORT_SYMBOL(lookup_resource);
 /*
  * Insert a resource into the resource tree. If successful, return NULL,
  * otherwise return the conflicting resource (compare to __request_resource())
-- 
2.31.1

