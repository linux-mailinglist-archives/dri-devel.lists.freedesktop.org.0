Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E547B747
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 02:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9776B10E847;
	Tue, 21 Dec 2021 01:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EF410E5D6;
 Tue, 21 Dec 2021 01:59:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56B146136D;
 Tue, 21 Dec 2021 01:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EEFC36AE5;
 Tue, 21 Dec 2021 01:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051985;
 bh=8qT5BMOuAsTv/r9SeohIMVlSese6gNNr83W2puXu/Tw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uo0SIqJKbzY++0wuWjx4bYcm0V20eZASraEZI4R2yyAbICuGz91XunUdKfDQ78V+J
 A5UTkvrZB2KBBAUE5TjGxd9lPU0hpl6kvUfi73sW8Zl3aQPZ6Us1A8b30KcojeI25R
 NDqUpinBFGlg2rB4Q/0VVh6L2iOaIb0mSJt7o7MVsnXKYs6tQKUWg6GdSJmkXhOvVB
 UXL/CjuVDJhpeC2jpNqllTdqO8gfJFkjxXcR5BFK8s7p158WLaWhCAhjSO0POCToBe
 Q4OolZi+dxGHmWWLEPBc9oPgZkOaDTsSS0TJkj1gtOuAoMzRENYb/H4LvEpoLSVyw8
 EYbC8Qt3yzLNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 14/19] drm/amdgpu: correct the wrong cached state
 for GMC on PICASSO
Date: Mon, 20 Dec 2021 20:59:09 -0500
Message-Id: <20211221015914.116767-14-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015914.116767-1-sashal@kernel.org>
References: <20211221015914.116767-1-sashal@kernel.org>
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
Cc: alex.sierra@amd.com, airlied@linux.ie, lijo.lazar@amd.com,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 darren.powell@amd.com, jinhuieric.huang@amd.com, Likun.Gao@amd.com,
 Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 Oak.Zeng@amd.com, amd-gfx@lists.freedesktop.org, Dennis.Li@amd.com,
 kevin1.wang@amd.com, Evan Quan <evan.quan@amd.com>, john.clements@amd.com,
 Xinhui.Pan@amd.com, rajneesh.bhardwaj@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 17c65d6fca844ee72a651944d8ce721e9040bf70 ]

Pair the operations did in GMC ->hw_init and ->hw_fini. That
can help to maintain correct cached state for GMC and avoid
unintention gate operation dropping due to wrong cached state.

BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1828

Signed-off-by: Evan Quan <evan.quan@amd.com>
Acked-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c            | 8 ++++++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c          | 8 ++++----
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 7 ++++++-
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 3a864041968f6..68501f7a3ad5a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1685,6 +1685,14 @@ static int gmc_v9_0_hw_fini(void *handle)
 		return 0;
 	}
 
+	/*
+	 * Pair the operations did in gmc_v9_0_hw_init and thus maintain
+	 * a correct cached state for GMC. Otherwise, the "gate" again
+	 * operation on S3 resuming will fail due to wrong cached state.
+	 */
+	if (adev->mmhub.funcs->update_power_gating)
+		adev->mmhub.funcs->update_power_gating(adev, false);
+
 	amdgpu_irq_put(adev, &adev->gmc.ecc_irq, 0);
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
index f84701c562bf2..12669c95d03be 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
@@ -303,10 +303,10 @@ static void mmhub_v1_0_update_power_gating(struct amdgpu_device *adev,
 	if (amdgpu_sriov_vf(adev))
 		return;
 
-	if (enable && adev->pg_flags & AMD_PG_SUPPORT_MMHUB) {
-		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GMC, true);
-
-	}
+	if (adev->pg_flags & AMD_PG_SUPPORT_MMHUB)
+		amdgpu_dpm_set_powergating_by_smu(adev,
+						  AMD_IP_BLOCK_TYPE_GMC,
+						  enable);
 }
 
 static int mmhub_v1_0_gart_enable(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index eab9768029c11..dc0dbd2fd49db 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -1317,7 +1317,12 @@ static int pp_set_powergating_by_smu(void *handle,
 		pp_dpm_powergate_vce(handle, gate);
 		break;
 	case AMD_IP_BLOCK_TYPE_GMC:
-		pp_dpm_powergate_mmhub(handle);
+		/*
+		 * For now, this is only used on PICASSO.
+		 * And only "gate" operation is supported.
+		 */
+		if (gate)
+			pp_dpm_powergate_mmhub(handle);
 		break;
 	case AMD_IP_BLOCK_TYPE_GFX:
 		ret = pp_dpm_powergate_gfx(handle, gate);
-- 
2.34.1

