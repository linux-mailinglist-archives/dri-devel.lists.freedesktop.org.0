Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D742289E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 15:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDFF6E8B9;
	Tue,  5 Oct 2021 13:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6826A6E8B9;
 Tue,  5 Oct 2021 13:51:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52F9061526;
 Tue,  5 Oct 2021 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633441886;
 bh=DsPJl/iyh2vy74kC2KrgfpSrR9ujMHz1jx8pfkfVBtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IER5z8GT3Pd3ksJ2YcFS6hsOxyuj1xwn/52Ees9JSIFSXYDZiN8mKCi5fgPJLj0wS
 Ku32NTYfHzBTZ+vt7a1t/mYI8fE558OiR/aqZLQwnc5xGc0SlOqbZYHI2EL+Pkv9lp
 miIWQx5KrApoCChMGAjPLIgfwZh09471qrld50mAtQs8oiGF6Ag6DmsprLrv5INKaT
 2or0Nv1nHDmq3xxxmVR3Sc3c0HVXMpUDBUm1hQZGNlUqbzpTePQrndyhuWxkImS+E1
 IUlD7+GU5qXYcIYhBnx3Fq7HC0SujerY60RfT/y9SeLNjjo96eu3qF74eTnf4pLFFy
 Jn1eUbkxr9vUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leslie Shi <Yuliang.Shi@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Guchun Chen <guchun.chen@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, tao.zhou1@amd.com,
 ray.huang@amd.com, PengJu.Zhou@amd.com, Likun.Gao@amd.com,
 John.Clements@amd.com, Felix.Kuehling@amd.com, Oak.Zeng@amd.com,
 lee.jones@linaro.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 32/40] drm/amdgpu: fix gart.bo pin_count leak
Date: Tue,  5 Oct 2021 09:50:11 -0400
Message-Id: <20211005135020.214291-32-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005135020.214291-1-sashal@kernel.org>
References: <20211005135020.214291-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leslie Shi <Yuliang.Shi@amd.com>

[ Upstream commit 66805763a97f8f7bdf742fc0851d85c02ed9411f ]

gmc_v{9,10}_0_gart_disable() isn't called matched with
correspoding gart_enbale function in SRIOV case. This will
lead to gart.bo pin_count leak on driver unload.

Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 4523df2785d6..5b6317bf9751 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -1094,6 +1094,8 @@ static int gmc_v10_0_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
+	gmc_v10_0_gart_disable(adev);
+
 	if (amdgpu_sriov_vf(adev)) {
 		/* full access mode, so don't touch any GMC register */
 		DRM_DEBUG("For SRIOV client, shouldn't do anything.\n");
@@ -1102,7 +1104,6 @@ static int gmc_v10_0_hw_fini(void *handle)
 
 	amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
-	gmc_v10_0_gart_disable(adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 7eb70d69f760..f3cd2b3fb4cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1764,6 +1764,8 @@ static int gmc_v9_0_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
+	gmc_v9_0_gart_disable(adev);
+
 	if (amdgpu_sriov_vf(adev)) {
 		/* full access mode, so don't touch any GMC register */
 		DRM_DEBUG("For SRIOV client, shouldn't do anything.\n");
@@ -1772,7 +1774,6 @@ static int gmc_v9_0_hw_fini(void *handle)
 
 	amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
-	gmc_v9_0_gart_disable(adev);
 
 	return 0;
 }
-- 
2.33.0

