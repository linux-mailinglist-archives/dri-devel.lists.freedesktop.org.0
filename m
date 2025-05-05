Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D22AA9EF3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533310E438;
	Mon,  5 May 2025 22:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lWWKZ7Ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047F910E438;
 Mon,  5 May 2025 22:16:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 98A59A4CC4B;
 Mon,  5 May 2025 22:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95915C4CEE4;
 Mon,  5 May 2025 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483407;
 bh=byzW6jqyss6yDp/A9Z2J+BWJGXYjQpxloCn9c/mmRHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lWWKZ7KaVAHTfPVVEYvjaEDNWNCJlkOmN8ZOljFoToBi4t0ATFYE0gXA3ETtpyWvC
 q6mQm/+wfNIugnbmH8V/F7j8DHidpLAPnWIdr1ZFDEqhz316khzmLjyoJzfXw/bsbO
 vewzbpGwd3t+mtAmNS3CP3o4c0fZA94PeA0nVLXLWQeLibv6m54n7ysRN78IxVT1UG
 xa1omgCSDdxWUrYm4JVXDrNPHHXJfLa1GZ/iarYWlt6BRXuRRRHX3RAz8PE5ITCxt+
 5mIEuKMLV6IquBJtnHLYfJUisUXcLmXx6ZjznjlIFk07o19bnGImUp+rHmNd6XqKjy
 2Nz8/Tt8WKLng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Victor Skvortsov <victor.skvortsov@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 Hawking.Zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 070/642] drm/amdgpu: Skip pcie_replay_count sysfs
 creation for VF
Date: Mon,  5 May 2025 18:04:46 -0400
Message-Id: <20250505221419.2672473-70-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Victor Skvortsov <victor.skvortsov@amd.com>

[ Upstream commit 9c05636ca72a2dbf41bf0900380f438a0de47319 ]

VFs cannot read the NAK_COUNTER register. This information is only
available through PMFW metrics.

Signed-off-by: Victor Skvortsov <victor.skvortsov@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 27 ++++++++++++++++------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e298b48488c22..6992ab4878360 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -224,6 +224,24 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 static DEVICE_ATTR(pcie_replay_count, 0444,
 		amdgpu_device_get_pcie_replay_count, NULL);
 
+static int amdgpu_device_attr_sysfs_init(struct amdgpu_device *adev)
+{
+	int ret = 0;
+
+	if (!amdgpu_sriov_vf(adev))
+		ret = sysfs_create_file(&adev->dev->kobj,
+					&dev_attr_pcie_replay_count.attr);
+
+	return ret;
+}
+
+static void amdgpu_device_attr_sysfs_fini(struct amdgpu_device *adev)
+{
+	if (!amdgpu_sriov_vf(adev))
+		sysfs_remove_file(&adev->dev->kobj,
+				  &dev_attr_pcie_replay_count.attr);
+}
+
 static ssize_t amdgpu_sysfs_reg_state_get(struct file *f, struct kobject *kobj,
 					  struct bin_attribute *attr, char *buf,
 					  loff_t ppos, size_t count)
@@ -4123,11 +4141,6 @@ static bool amdgpu_device_check_iommu_remap(struct amdgpu_device *adev)
 }
 #endif
 
-static const struct attribute *amdgpu_dev_attributes[] = {
-	&dev_attr_pcie_replay_count.attr,
-	NULL
-};
-
 static void amdgpu_device_set_mcbp(struct amdgpu_device *adev)
 {
 	if (amdgpu_mcbp == 1)
@@ -4572,7 +4585,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	} else
 		adev->ucode_sysfs_en = true;
 
-	r = sysfs_create_files(&adev->dev->kobj, amdgpu_dev_attributes);
+	r = amdgpu_device_attr_sysfs_init(adev);
 	if (r)
 		dev_err(adev->dev, "Could not create amdgpu device attr\n");
 
@@ -4709,7 +4722,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 		amdgpu_pm_sysfs_fini(adev);
 	if (adev->ucode_sysfs_en)
 		amdgpu_ucode_sysfs_fini(adev);
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
+	amdgpu_device_attr_sysfs_fini(adev);
 	amdgpu_fru_sysfs_fini(adev);
 
 	amdgpu_reg_state_sysfs_fini(adev);
-- 
2.39.5

