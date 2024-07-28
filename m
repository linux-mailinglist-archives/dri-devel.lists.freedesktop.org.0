Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E260E93E615
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5CD10E204;
	Sun, 28 Jul 2024 15:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CagLrVLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A807110E204;
 Sun, 28 Jul 2024 15:43:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8FD1FCE0917;
 Sun, 28 Jul 2024 15:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88010C116B1;
 Sun, 28 Jul 2024 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181416;
 bh=0GsaY9VrGRPabn9WDS9d3XvtsMkIwTkH0atVIZJV17s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CagLrVLNKYZO5NLAuSiNC1EJfJ5IbPWGrPkrhiCzy+BEDPUNLtxWIjyok/DVLKMQP
 7NXiXLKeeNPrkhf5Jy/4GDf7X9dSGAXwyuSFrDUGMQxsCTtAloFSWUriw2+ZR3Qnxv
 RbmLm0m2pxbQaB8X+FhXKc0uhQNB1T4axmAAWHM6fsMYVfEkeCd7f+op6edW0kOx9j
 9bI1eOOJLZdItbF1cfRzK+qJxvfqlsky6STi/L/UAudz4DjfxFioh9TF3aCe41mL2U
 U/us1wNxJoVo1xJXVOcaEr8FN+Q2OqVYIWFvRKM1NSo0+IqfSEjkUdg4/zdAiJ48mP
 QOr5DPZ60cNtg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Victor Skvortsov <victor.skvortsov@amd.com>,
 Zhigang Luo <zhigang.luo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, mario.limonciello@amd.com,
 lijo.lazar@amd.com, Jun.Ma2@amd.com, candice.li@amd.com,
 victorchengchi.lu@amd.com, andrealmeid@igalia.com, hamza.mahfooz@amd.com,
 Zhigang.Luo@amd.com, surbhi.kakarya@amd.com, sunran001@208suo.com,
 chongli2@amd.com, danijel.slivka@amd.com, Jingwen.Chen2@amd.com,
 YiPeng.Chai@amd.com, bokun.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 12/34] drm/amdgpu: Add lock around VF RLCG
 interface
Date: Sun, 28 Jul 2024 11:40:36 -0400
Message-ID: <20240728154230.2046786-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

[ Upstream commit e864180ee49b4d30e640fd1e1d852b86411420c9 ]

flush_gpu_tlb may be called from another thread while
device_gpu_recover is running.

Both of these threads access registers through the VF
RLCG interface during VF Full Access. Add a lock around this interface
to prevent race conditions between these threads.

Signed-off-by: Victor Skvortsov <victor.skvortsov@amd.com>
Reviewed-by: Zhigang Luo <zhigang.luo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c   | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h   | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 33f791d92ddf3..eb4a1f4318333 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4048,6 +4048,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->grbm_idx_mutex);
 	mutex_init(&adev->mn_lock);
 	mutex_init(&adev->virt.vf_errors.lock);
+	mutex_init(&adev->virt.rlcg_reg_lock);
 	hash_init(adev->mn_hash);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 54ab51a4ada77..972a58f0f4924 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -980,6 +980,9 @@ u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v, u32 f
 	scratch_reg1 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg1;
 	scratch_reg2 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg2;
 	scratch_reg3 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg3;
+
+	mutex_lock(&adev->virt.rlcg_reg_lock);
+
 	if (reg_access_ctrl->spare_int)
 		spare_int = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->spare_int;
 
@@ -1036,6 +1039,9 @@ u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v, u32 f
 	}
 
 	ret = readl(scratch_reg0);
+
+	mutex_unlock(&adev->virt.rlcg_reg_lock);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index 642f1fd287d83..0ec246c74570c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -272,6 +272,8 @@ struct amdgpu_virt {
 
 	/* the ucode id to signal the autoload */
 	uint32_t autoload_ucode_id;
+
+	struct mutex rlcg_reg_lock;
 };
 
 struct amdgpu_video_codec_info;
-- 
2.43.0

