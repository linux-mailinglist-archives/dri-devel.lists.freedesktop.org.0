Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973BB6A3727
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5E710E30B;
	Mon, 27 Feb 2023 02:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53B610E30B;
 Mon, 27 Feb 2023 02:07:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F366D60C87;
 Mon, 27 Feb 2023 02:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB6DC433EF;
 Mon, 27 Feb 2023 02:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463638;
 bh=nocuhMww8UcxKAaVyFes4zBJJmA4s/Mu+iSRj0fV154=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JmkFR0Kd/CifXf6+CAdnE8j9Qrx9cU5T+u4V0HZRkiK+ZIHXcVC/wfiNotHSw9elL
 ePtvNKk1ZjhibydcdkiJNzcZXwSpVzXo1T2leWg0guKiFHrVWkgzLEhRVBJVS7sOG/
 bdklf4TWISDekUNAYjPObMUEaihmM0fBx4HvVTBkoPxwxi3AenJOEkvAZc1w844zdG
 LFnPkytaX629nmlswJNbT3e5rbV8QRIyNxWqvnNBP26I4RBButWNFUtTD4YvvU8Z5o
 bnzbQloSAECCa1GCdWVtFEnPgdd+16uSg7VyXB22OZzAC0zRF/jIwtDTso9+UIqAML
 Ddp42F5sUr5yA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 37/58] Revert "drm/amdgpu: TA unload messages are
 not actually sent to psp when amdgpu is uninstalled"
Date: Sun, 26 Feb 2023 21:04:35 -0500
Message-Id: <20230227020457.1048737-37-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
index a21b3f66fd708..824b0b356b3ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4012,7 +4012,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 	amdgpu_gart_dummy_page_fini(adev);
 
-	amdgpu_device_unmap_mmio(adev);
+	if (drm_dev_is_unplugged(adev_to_drm(adev)))
+		amdgpu_device_unmap_mmio(adev);
 
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 2e5d78b6635c4..dfbeef2c4a9e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2226,6 +2226,8 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
+	drm_dev_unplug(dev);
+
 	if (adev->pm.rpm_mode != AMDGPU_RUNPM_NONE) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
@@ -2265,8 +2267,6 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 
 	amdgpu_driver_unload_kms(dev);
 
-	drm_dev_unplug(dev);
-
 	/*
 	 * Flush any in flight DMA operations from device.
 	 * Clear the Bus Master Enable bit and then wait on the PCIe Device
-- 
2.39.0

