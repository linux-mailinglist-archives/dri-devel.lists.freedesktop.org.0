Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C168C783F59
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5D10E312;
	Tue, 22 Aug 2023 11:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CDD10E315;
 Tue, 22 Aug 2023 11:36:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DB7265391;
 Tue, 22 Aug 2023 11:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56497C433C7;
 Tue, 22 Aug 2023 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692704215;
 bh=RtM9u0uoMbgmNToEvBrFSxc6qVE4GpINtMqKgqKlNZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nlCO8JILx2/sQU223bAHldomQVM4w/IogwmDZw5LZAafaJXhk5gwHMtl2U/mKmi2O
 o8PGj9NthuLDD9ueSxuM+Yr8xzLhHprMv+F18YRj9Nh9Uo8DwFrBUwza/F1b5PZ9Of
 Tr88vSSF9JEZJ4oBILgx+80anzfw0MQUSqgYoV0ks+xXa+VivImR7tkrYfk5U/dAuk
 8XhkZSaquEQUZc+E4fvCD3SVoI9VVhzDfMvvz4AWoEWBlw7DvOG+E6r6Bcjwi5fSKy
 pARUs6I8dMPwrrUizUQVrJnxctoszOk45WRPnmJ608C53B01NXpEFLlAvJT2K6yn0D
 b4ZpbOfzEyYKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 09/10] drm/amdkfd: disable IOMMUv2 support for
 KV/CZ
Date: Tue, 22 Aug 2023 07:36:27 -0400
Message-Id: <20230822113628.3551393-9-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113628.3551393-1-sashal@kernel.org>
References: <20230822113628.3551393-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.46
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 616f92d188ee7142a95a52068efdbea82645f859 ]

Use the dGPU path instead.  There were a lot of platform
issues with IOMMU in general on these chips due to windows
not enabling IOMMU at the time.  The dGPU path has been
used for a long time with newer APUs and works fine.  This
also paves the way to simplify the driver significantly.

v2: use the dGPU queue manager functions

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Tested-by: Mike Lothian <mike@fireburn.co.uk>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c               | 6 ------
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 8 +-------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 27820f0a282d1..4cc5debdd119b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -216,10 +216,6 @@ static void kfd_device_info_init(struct kfd_dev *kfd,
 		    asic_type != CHIP_TONGA)
 			kfd->device_info.supports_cwsr = true;
 
-		if (asic_type == CHIP_KAVERI ||
-		    asic_type == CHIP_CARRIZO)
-			kfd->device_info.needs_iommu_device = true;
-
 		if (asic_type != CHIP_HAWAII && !vf)
 			kfd->device_info.needs_pci_atomics = true;
 	}
@@ -233,7 +229,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 	uint32_t gfx_target_version = 0;
 
 	switch (adev->asic_type) {
-#ifdef KFD_SUPPORT_IOMMU_V2
 #ifdef CONFIG_DRM_AMDGPU_CIK
 	case CHIP_KAVERI:
 		gfx_target_version = 70000;
@@ -246,7 +241,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 		if (!vf)
 			f2g = &gfx_v8_kfd2kgd;
 		break;
-#endif
 #ifdef CONFIG_DRM_AMDGPU_CIK
 	case CHIP_HAWAII:
 		gfx_target_version = 70001;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c06ada0844ba1..5616a722578f5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2335,18 +2335,12 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 	}
 
 	switch (dev->adev->asic_type) {
-	case CHIP_CARRIZO:
-		device_queue_manager_init_vi(&dqm->asic_ops);
-		break;
-
 	case CHIP_KAVERI:
-		device_queue_manager_init_cik(&dqm->asic_ops);
-		break;
-
 	case CHIP_HAWAII:
 		device_queue_manager_init_cik_hawaii(&dqm->asic_ops);
 		break;
 
+	case CHIP_CARRIZO:
 	case CHIP_TONGA:
 	case CHIP_FIJI:
 	case CHIP_POLARIS10:
-- 
2.40.1

