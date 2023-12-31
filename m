Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF71820B89
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 15:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3A10E04E;
	Sun, 31 Dec 2023 14:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609D910E04E;
 Sun, 31 Dec 2023 14:39:11 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1704033524; bh=Gbv3uhKrlYkpm1RVuHuU6BzQ7lY53S6ikSobyFwhv6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=lsEnzn5ksU2xoJ8Y4Xoy2ykO582uniizlQ4Pdlh0xagK5lAM2df+paHZS9ZP/jROF
 VRYSFfQzAWIHolEr7gTmuL07TKsiMkxFpIWUD9eAxourBj+xJzCrkxy+AQsLWnP2Sv
 d7KZxu9RJOuh1h9teeI8P9C2kUJFM4kQ1nxdMRQkuZ2SshNNpdAZCrVqLzVudFbl3Z
 lBOUU7iVDBMm4Ca+I60mFZPBtjTB4VxZUidpO7cVGp6p/WXyIkqLJ7QYBFi24zmF+a
 1IszGvUXRHErS3k3Nvz4w5Udv8q3Cc+CGpN6Tw6fZSDeIZH47zCdXvTJZKCbbfEQ7g
 uCVEOGdYT8o8Q==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 3BVEce03893872
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 31 Dec 2023 16:38:40 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 3BVEceco893871;
 Sun, 31 Dec 2023 16:38:40 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: fixes for HMM mem allocation
Date: Sun, 31 Dec 2023 16:37:00 +0200
Message-Id: <20231231143700.893822-1-dhirschfeld@habana.ai>
X-Mailer: git-send-email 2.34.1
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
Cc: ogabbay@kernel.org, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, Dafna Hirschfeld <dhirschfeld@habana.ai>,
 alexander.deucher@amd.com, Felix.Kuehling@amd.com, obitton@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Few fixes to amdkfd and the doc of
devm_request_free_mem_region.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++---
 kernel/resource.c                        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 6c25dab051d5..b8680e0753ca 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1021,7 +1021,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	} else {
 		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
 		if (IS_ERR(res))
-			return -ENOMEM;
+			return PTR_ERR(res);
 		pgmap->range.start = res->start;
 		pgmap->range.end = res->end;
 		pgmap->type = MEMORY_DEVICE_PRIVATE;
@@ -1037,10 +1037,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
-		/* Disable SVM support capability */
-		pgmap->type = 0;
 		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
 			devm_release_mem_region(adev->dev, res->start, resource_size(res));
+		/* Disable SVM support capability */
+		pgmap->type = 0;
 		return PTR_ERR(r);
 	}
 
diff --git a/kernel/resource.c b/kernel/resource.c
index 866ef3663a0b..fe890b874606 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1905,8 +1905,8 @@ get_free_mem_region(struct device *dev, struct resource *base,
  * devm_request_free_mem_region - find free region for device private memory
  *
  * @dev: device struct to bind the resource to
- * @size: size in bytes of the device memory to add
  * @base: resource tree to look in
+ * @size: size in bytes of the device memory to add
  *
  * This function tries to find an empty range of physical address big enough to
  * contain the new resource, so that it can later be hotplugged as ZONE_DEVICE
-- 
2.34.1

