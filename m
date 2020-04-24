Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19561B73D3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 14:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBA96E46B;
	Fri, 24 Apr 2020 12:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E11489FD1;
 Fri, 24 Apr 2020 12:22:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9938D20767;
 Fri, 24 Apr 2020 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587730973;
 bh=wMtdi2mSKs8GJKWAFYEXR4EYW0aiS/Rd2QRsf2QSWoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IhSGRyp/oaUG45ZW3eaWzgsjbOlib8ciaO8MslVsah2JYpDLocpgqkRZO3dtF31t/
 KzqunRojp15/TI+f2hHy+Ed9c7bxhty7dob5KMBAdde3KzUo16OoCbbs3VJD5/hrnC
 18cUJYlHaQDpi+phLIkM3H3S1RW+WbmbV2alvxFs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 14/38] drm/amdgpu: fix wrong vram lost counter
 increment V2
Date: Fri, 24 Apr 2020 08:22:12 -0400
Message-Id: <20200424122237.9831-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424122237.9831-1-sashal@kernel.org>
References: <20200424122237.9831-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Evan Quan <evan.quan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 028cfb2444b94d4f394a6fa4ca46182481236e91 ]

Vram lost counter is wrongly increased by two during baco reset.

V2: assumed vram lost for mode1 reset on all ASICs

Signed-off-by: Evan Quan <evan.quan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 20 ++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/cik.c           |  2 --
 drivers/gpu/drm/amd/amdgpu/nv.c            |  4 ----
 drivers/gpu/drm/amd/amdgpu/soc15.c         |  4 ----
 drivers/gpu/drm/amd/amdgpu/vi.c            |  2 --
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c8bf9cb3cebf2..f184cdca938de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1953,8 +1953,24 @@ static void amdgpu_device_fill_reset_magic(struct amdgpu_device *adev)
  */
 static bool amdgpu_device_check_vram_lost(struct amdgpu_device *adev)
 {
-	return !!memcmp(adev->gart.ptr, adev->reset_magic,
-			AMDGPU_RESET_MAGIC_NUM);
+	if (memcmp(adev->gart.ptr, adev->reset_magic,
+			AMDGPU_RESET_MAGIC_NUM))
+		return true;
+
+	if (!adev->in_gpu_reset)
+		return false;
+
+	/*
+	 * For all ASICs with baco/mode1 reset, the VRAM is
+	 * always assumed to be lost.
+	 */
+	switch (amdgpu_asic_reset_method(adev)) {
+	case AMD_RESET_METHOD_BACO:
+	case AMD_RESET_METHOD_MODE1:
+		return true;
+	default:
+		return false;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 006f21ef7ddf0..62635e58e45ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -1358,8 +1358,6 @@ static int cik_asic_reset(struct amdgpu_device *adev)
 	int r;
 
 	if (cik_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
-		if (!adev->in_suspend)
-			amdgpu_inc_vram_lost(adev);
 		r = amdgpu_dpm_baco_reset(adev);
 	} else {
 		r = cik_asic_pci_config_reset(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 2d1bebdf1603d..cc3a79029376b 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -351,8 +351,6 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 	struct smu_context *smu = &adev->smu;
 
 	if (nv_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
-		if (!adev->in_suspend)
-			amdgpu_inc_vram_lost(adev);
 		ret = smu_baco_enter(smu);
 		if (ret)
 			return ret;
@@ -360,8 +358,6 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 		if (ret)
 			return ret;
 	} else {
-		if (!adev->in_suspend)
-			amdgpu_inc_vram_lost(adev);
 		ret = nv_asic_mode1_reset(adev);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index d8945c31b622c..132a67a041a24 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -569,14 +569,10 @@ static int soc15_asic_reset(struct amdgpu_device *adev)
 
 	switch (soc15_asic_reset_method(adev)) {
 		case AMD_RESET_METHOD_BACO:
-			if (!adev->in_suspend)
-				amdgpu_inc_vram_lost(adev);
 			return soc15_asic_baco_reset(adev);
 		case AMD_RESET_METHOD_MODE2:
 			return amdgpu_dpm_mode2_reset(adev);
 		default:
-			if (!adev->in_suspend)
-				amdgpu_inc_vram_lost(adev);
 			return soc15_asic_mode1_reset(adev);
 	}
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 78b35901643bc..3ce10e05d0d6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -765,8 +765,6 @@ static int vi_asic_reset(struct amdgpu_device *adev)
 	int r;
 
 	if (vi_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
-		if (!adev->in_suspend)
-			amdgpu_inc_vram_lost(adev);
 		r = amdgpu_dpm_baco_reset(adev);
 	} else {
 		r = vi_asic_pci_config_reset(adev);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
