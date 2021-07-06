Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C9B3BCCE3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B266E2D7;
	Tue,  6 Jul 2021 11:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9356E2D7;
 Tue,  6 Jul 2021 11:19:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE1C661D6C;
 Tue,  6 Jul 2021 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570380;
 bh=P923ERhE2scix0Bmb5FE8KAJFqLGlHL+1sVq8aBO464=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OR1874jyFm7FeT7bRMRXVEZBeZoWS0lqkYy7RkWmGqbQpNAMmS37HTnIDjLxVTZ3z
 IMhf3hiyj43OYYhx4v+uIgY/qofaeGgWJotIlMhZfHcOorpXZUqsxChNDvC90+1Zwc
 3Xy6mU2HJHvx+ZbGfTRhCBZb2/BewUMNg+eCllRYzMg030IO1OebZqvM/RG9AIkT2f
 iRFXEPqRW4Uo6jU9+lyWs1GOGXTlcu5dknlpowzrlhTXNOBIWYh8Aw5eFAm/xz0CQN
 RxraxNankSdqxMQoyX0GBNsqe6QEfdyjk0MRy3ZEJirrgfzCuuBkLYYQ4JuSc3tOxM
 BoVD3JmOVJ1gA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 055/160] drm/amdgpu: fix sdma firmware version
 error in sriov
Date: Tue,  6 Jul 2021 07:16:41 -0400
Message-Id: <20210706111827.2060499-55-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Wang <kevin1.wang@amd.com>,
 dri-devel@lists.freedesktop.org, "Stanley . Yang" <Stanley.Yang@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Wang <kevin1.wang@amd.com>

[ Upstream commit 2b8f731849800e3948763ccaff31cceac526789b ]

Re-adjust the function return order to avoid empty sdma version in the
sriov environment. (read amdgpu_firmware_info)

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
Reviewed-by: Stanley.Yang <Stanley.Yang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 32c6aa03d267..f884d43d4ff0 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -145,9 +145,6 @@ static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
 	struct amdgpu_firmware_info *info = NULL;
 	const struct common_firmware_header *header = NULL;
 
-	if (amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_SIENNA_CICHLID))
-		return 0;
-
 	DRM_DEBUG("\n");
 
 	switch (adev->asic_type) {
@@ -182,6 +179,9 @@ static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
 		       (void *)&adev->sdma.instance[0],
 		       sizeof(struct amdgpu_sdma_instance));
 
+	if (amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_SIENNA_CICHLID))
+		return 0;
+
 	DRM_DEBUG("psp_load == '%s'\n",
 		  adev->firmware.load_type == AMDGPU_FW_LOAD_PSP ? "true" : "false");
 
-- 
2.30.2

