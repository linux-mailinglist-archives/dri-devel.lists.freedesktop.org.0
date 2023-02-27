Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0B6A3699
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D9310E25D;
	Mon, 27 Feb 2023 02:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF24C10E258;
 Mon, 27 Feb 2023 02:03:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C59460C32;
 Mon, 27 Feb 2023 02:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA23C433EF;
 Mon, 27 Feb 2023 02:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463389;
 bh=JbiKqztTa4pAa5+lxhrjzoitPM4s/HhkUshiLRjhUpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pmK3rbh+TDWVmBJq4fs/4Y+RYG5liFjN3etbIS74wNhaEEzbtod9L1e5ay/Zyplf6
 WHhrCFjfHYiVxCyqcCFQp6VPdJaXsrLP87k9a/ttRKxPVPhReqH3CPK54t8PBuAd7G
 64XhejGcJ0EbnqSJN2sQsllKQ22eQRDwXi701NQLuiLVgQYnAuXjkCO9k+st4InnRv
 l/cJ42+GJ9DwzuU0+iAEGUVyvI3AEWovlgBN3XPSQMo5PYBpH3ODUUN28GWUZfYqhK
 QPEX9oYy5wNgeWXfJ5NKT56qJ+YoBjCgXdreXZKYXkMMRWEKCZ1SEs26smqSiIznSx
 MFR8xzfr/OoAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 38/60] Revert "drm/amdgpu: TA unload messages are
 not actually sent to psp when amdgpu is uninstalled"
Date: Sun, 26 Feb 2023 21:00:23 -0500
Message-Id: <20230227020045.1045105-38-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, andrey.grodzovsky@amd.com,
 Jack.Xiao@amd.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 guchun.chen@amd.com, Amaranath.Somalapuram@amd.com, Bokun.Zhang@amd.com,
 mario.limonciello@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 mdaenzer@redhat.com, YiPeng.Chai@amd.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, kai.heng.feng@canonical.com,
 evan.quan@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

[ Upstream commit 39934d3ed5725c5e3570ed1b67f612f1ea60ce03 ]

This reverts commit fac53471d0ea9693d314aa2df08d62b2e7e3a0f8.
The following change: move the drm_dev_unplug call after
amdgpu_driver_unload_kms in amdgpu_pci_remove. The reason is
the following: amdgpu_pci_remove calls drm_dev_unregister
and it should be called first to ensure userspace can't access the
device instance anymore. If we call drm_dev_unplug after
amdgpu_driver_unload_kms then we observe IGT PCI software unplug
test failure (kernel hung) for all ASICs. This is how this
regression was found.

After this revert, the following commands do work not, but it would
be fixed in the next commit:
 - sudo modprobe -r amdgpu
 - sudo modprobe amdgpu

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index fbf2f24169eb5..d8e79de839d65 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4022,7 +4022,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 	amdgpu_gart_dummy_page_fini(adev);
 
-	amdgpu_device_unmap_mmio(adev);
+	if (drm_dev_is_unplugged(adev_to_drm(adev)))
+		amdgpu_device_unmap_mmio(adev);
 
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3fe277bc233f4..7f598977d6942 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2236,6 +2236,8 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
+	drm_dev_unplug(dev);
+
 	if (adev->pm.rpm_mode != AMDGPU_RUNPM_NONE) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
@@ -2275,8 +2277,6 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 
 	amdgpu_driver_unload_kms(dev);
 
-	drm_dev_unplug(dev);
-
 	/*
 	 * Flush any in flight DMA operations from device.
 	 * Clear the Bus Master Enable bit and then wait on the PCIe Device
-- 
2.39.0

