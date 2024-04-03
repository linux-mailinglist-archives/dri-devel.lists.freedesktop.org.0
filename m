Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7BC897630
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 19:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106310E30A;
	Wed,  3 Apr 2024 17:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dVyzG2/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E4110E23D;
 Wed,  3 Apr 2024 17:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C721CE2BC2;
 Wed,  3 Apr 2024 17:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D505C433C7;
 Wed,  3 Apr 2024 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712164678;
 bh=vNzntSBU+b6TfbGOfyJBQ1n0n6FBTCdqcV6dpTvL1f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dVyzG2/jt/yjTVatHeGAd6vMH2yKsa3v7qx7Z/E3HvTlLEpGRDNgsPqSjBLn2WdJX
 afa0ZXTbQxTCrt5BWRJfiTbvLSRANCy3PbHbLtk77t//sps/BipNU08Q4jRhW39lYb
 9dRh8WE8x5HDrmbJexcCdFfgfaDSVFQXhhEJQPK8YzW8NnuSRQw1M5gLP5BiU555yC
 1KG2A8GouBX8nh+LVBaDv9uuud709dekT+M+ISP3mIWF6q+6O0Jyh3hwIQAYoIHZFa
 7Z+KbRP+yQvMJw5/i150fdM2v5MP+PdwvUlMXunBLLRul8pM3pYW6cqpWGXebXevjU
 N/Bts6Ns0i7GQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ahmad Rehman <Ahmad.Rehman@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, mario.limonciello@amd.com, lijo.lazar@amd.com,
 le.ma@amd.com, srinivasan.shanmugam@amd.com, andrealmeid@igalia.com,
 Jun.Ma2@amd.com, James.Zhu@amd.com, hamza.mahfooz@amd.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 28/28] drm/amdgpu: Init zone device and drm client
 after mode-1 reset on reload
Date: Wed,  3 Apr 2024 13:16:30 -0400
Message-ID: <20240403171656.335224-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403171656.335224-1-sashal@kernel.org>
References: <20240403171656.335224-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.3
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

From: Ahmad Rehman <Ahmad.Rehman@amd.com>

[ Upstream commit f679fd6057fbf5ab34aaee28d58b7f81af0cbf48 ]

In passthrough environment, when amdgpu is reloaded after unload, mode-1
is triggered after initializing the necessary IPs, That init does not
include KFD, and KFD init waits until the reset is completed. KFD init
is called in the reset handler, but in this case, the zone device and
drm client is not initialized, causing app to create kernel panic.

v2: Removing the init KFD condition from amdgpu_amdkfd_drm_client_create.
As the previous version has the potential of creating DRM client twice.

v3: v2 patch results in SDMA engine hung as DRM open causes VM clear to SDMA
before SDMA init. Adding the condition to in drm client creation, on top of v1,
to guard against drm client creation call multiple times.

Signed-off-by: Ahmad Rehman <Ahmad.Rehman@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 41db030ddc4ee..131983ed43465 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -146,7 +146,7 @@ int amdgpu_amdkfd_drm_client_create(struct amdgpu_device *adev)
 {
 	int ret;
 
-	if (!adev->kfd.init_complete)
+	if (!adev->kfd.init_complete || adev->kfd.client.dev)
 		return 0;
 
 	ret = drm_client_init(&adev->ddev, &adev->kfd.client, "kfd",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 586f4d03039df..64b1bb2404242 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2451,8 +2451,11 @@ static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work)
 	}
 	for (i = 0; i < mgpu_info.num_dgpu; i++) {
 		adev = mgpu_info.gpu_ins[i].adev;
-		if (!adev->kfd.init_complete)
+		if (!adev->kfd.init_complete) {
+			kgd2kfd_init_zone_device(adev);
 			amdgpu_amdkfd_device_init(adev);
+			amdgpu_amdkfd_drm_client_create(adev);
+		}
 		amdgpu_ttm_set_buffer_funcs_status(adev, true);
 	}
 }
-- 
2.43.0

