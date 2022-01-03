Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569284835A4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91DD89E0E;
	Mon,  3 Jan 2022 17:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D2D89DFC;
 Mon,  3 Jan 2022 17:29:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 400CEB80B4C;
 Mon,  3 Jan 2022 17:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B43C36AF0;
 Mon,  3 Jan 2022 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641230968;
 bh=Szb9TvzsCywHF4L0vx7zk+gn/LMnbJj7FKMxDHllITc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rld9iMYk09N8oOEtEoS44qYoZaKnFzimdKVrZDss6JCP/o5j7usL2h0cMtBKFh+d7
 RkYcJo0KfgPb7cdgYvnp7pwrRQ4g7FQRxFoKKpynv87RXhCArHfCZrUvXclnNe7ykz
 lAWgc35bujMT5b+FHt9MIn6OwBjybqgFpPwAPWlS0aNVxDAdtZOPPK6MPzkT/1UnIV
 iilubnUMKILP2dM6E4THeuMWE77ccnG0pKG0ImlUY1fH0Pv8qLWULLGVNgIKv6Xrxh
 tN0XK20TG4rFBjC7xaVKs8+jST2qgVvRfKe2zifQgRHDsr1OVwRKGTrcX3AMiV100A
 0KTZNpwXSGkOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/16] drm/amd/pm: skip setting gfx cgpg in the
 s0ix suspend-resume
Date: Mon,  3 Jan 2022 12:28:42 -0500
Message-Id: <20220103172849.1612731-9-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103172849.1612731-1-sashal@kernel.org>
References: <20220103172849.1612731-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, kevin1.wang@amd.com, lijo.lazar@amd.com,
 Xiaojian.Du@amd.com, Arunpravin.PaneerSelvam@amd.com, airlied@linux.ie,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 Prike Liang <Prike.Liang@amd.com>, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, darren.powell@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Lang.Yu@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prike Liang <Prike.Liang@amd.com>

[ Upstream commit 8c45096c60d6ce6341c374636100ed1b2c1c33a1 ]

In the s0ix entry need retain gfx in the gfxoff state,so here need't
set gfx cgpg in the S0ix suspend-resume process. Moreover move the S0ix
check into SMU12 can simplify the code condition check.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1712
Signed-off-by: Prike Liang <Prike.Liang@amd.com>
Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c      | 7 ++-----
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 04863a7971155..30ee8819587e2 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1536,9 +1536,7 @@ static int smu_suspend(void *handle)
 
 	smu->watermarks_bitmap &= ~(WATERMARKS_LOADED);
 
-	/* skip CGPG when in S0ix */
-	if (smu->is_apu && !adev->in_s0ix)
-		smu_set_gfx_cgpg(&adev->smu, false);
+	smu_set_gfx_cgpg(&adev->smu, false);
 
 	return 0;
 }
@@ -1569,8 +1567,7 @@ static int smu_resume(void *handle)
 		return ret;
 	}
 
-	if (smu->is_apu)
-		smu_set_gfx_cgpg(&adev->smu, true);
+	smu_set_gfx_cgpg(&adev->smu, true);
 
 	smu->disable_uclk_switch = 0;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
index 43028f2cd28b5..9c91e79c955fb 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
@@ -120,7 +120,8 @@ int smu_v12_0_powergate_sdma(struct smu_context *smu, bool gate)
 
 int smu_v12_0_set_gfx_cgpg(struct smu_context *smu, bool enable)
 {
-	if (!(smu->adev->pg_flags & AMD_PG_SUPPORT_GFX_PG))
+	/* Until now the SMU12 only implemented for Renoir series so here neen't do APU check. */
+	if (!(smu->adev->pg_flags & AMD_PG_SUPPORT_GFX_PG) || smu->adev->in_s0ix)
 		return 0;
 
 	return smu_cmn_send_smc_msg_with_param(smu,
-- 
2.34.1

