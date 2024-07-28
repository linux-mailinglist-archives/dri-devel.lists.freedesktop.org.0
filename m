Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B21293E677
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8AC10E270;
	Sun, 28 Jul 2024 15:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cT0iIE9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E56110E270;
 Sun, 28 Jul 2024 15:48:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0479A6118E;
 Sun, 28 Jul 2024 15:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98867C116B1;
 Sun, 28 Jul 2024 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181706;
 bh=u4PxsXeP670KXL6vgt65RPxUUCTJcBGO6w+MmpNjnsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cT0iIE9pLgDvkhEsCIttI4j0CCUF46mCAWs+ZoASwZD4u3+cuUgKYGSeo2chMiQdF
 GnK9YtUkT/JqvZKIjp0X7IDlFoTybtu0FUOlfKnCMT5p/t6XiDghbGfYXht8UO5kIX
 n/ne+a3okSLqRJzjpFDCFp2BJdPhFumXBZom5C2EStbCNoxmHgIJa2/04Rbc2Rp1TE
 YMNJFjl/METR2nIv4sg13rr4ul+t/V3m1tajPH0VeVxMdR/65Hp/CRy9SGdmyiSsdJ
 vxet8zHsjcPtI5t5jxWQbXPpxwE0ZN0Sy/09LcCBHFmdeyfzOI7jh9j5NZHKfTy0ml
 VmT/mF57VrzpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ma Jun <Jun.Ma2@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 evan.quan@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, mario.limonciello@amd.com,
 lijo.lazar@amd.com, sunran001@208suo.com, ruanjinjie@huawei.com,
 alexious@zju.edu.cn, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 04/17] drm/amdgpu/pm: Fix the null pointer
 dereference in apply_state_adjust_rules
Date: Sun, 28 Jul 2024 11:47:14 -0400
Message-ID: <20240728154805.2049226-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154805.2049226-1-sashal@kernel.org>
References: <20240728154805.2049226-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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

From: Ma Jun <Jun.Ma2@amd.com>

[ Upstream commit d19fb10085a49b77578314f69fff21562f7cd054 ]

Check the pointer value to fix potential null pointer
dereference

Acked-by: Yang Wang<kevinyang.wang@amd.com>
Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  7 +++++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    | 14 ++++++++------
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  7 +++++--
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index 9f2f3f6a79adb..750b7527bdf83 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -3327,8 +3327,7 @@ static int smu7_apply_state_adjust_rules(struct pp_hwmgr *hwmgr,
 			const struct pp_power_state *current_ps)
 {
 	struct amdgpu_device *adev = hwmgr->adev;
-	struct smu7_power_state *smu7_ps =
-				cast_phw_smu7_power_state(&request_ps->hardware);
+	struct smu7_power_state *smu7_ps;
 	uint32_t sclk;
 	uint32_t mclk;
 	struct PP_Clocks minimum_clocks = {0};
@@ -3345,6 +3344,10 @@ static int smu7_apply_state_adjust_rules(struct pp_hwmgr *hwmgr,
 	uint32_t latency;
 	bool latency_allowed = false;
 
+	smu7_ps = cast_phw_smu7_power_state(&request_ps->hardware);
+	if (!smu7_ps)
+		return -EINVAL;
+
 	data->battery_state = (PP_StateUILabel_Battery ==
 			request_ps->classification.ui_label);
 	data->mclk_ignore_signal = false;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
index b015a601b385a..eb744401e0567 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
@@ -1065,16 +1065,18 @@ static int smu8_apply_state_adjust_rules(struct pp_hwmgr *hwmgr,
 				struct pp_power_state  *prequest_ps,
 			const struct pp_power_state *pcurrent_ps)
 {
-	struct smu8_power_state *smu8_ps =
-				cast_smu8_power_state(&prequest_ps->hardware);
-
-	const struct smu8_power_state *smu8_current_ps =
-				cast_const_smu8_power_state(&pcurrent_ps->hardware);
-
+	struct smu8_power_state *smu8_ps;
+	const struct smu8_power_state *smu8_current_ps;
 	struct smu8_hwmgr *data = hwmgr->backend;
 	struct PP_Clocks clocks = {0, 0, 0, 0};
 	bool force_high;
 
+	smu8_ps = cast_smu8_power_state(&prequest_ps->hardware);
+	smu8_current_ps = cast_const_smu8_power_state(&pcurrent_ps->hardware);
+
+	if (!smu8_ps || !smu8_current_ps)
+		return -EINVAL;
+
 	smu8_ps->need_dfs_bypass = true;
 
 	data->battery_state = (PP_StateUILabel_Battery == prequest_ps->classification.ui_label);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index d8cd23438b762..2628f12e0eedc 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -3263,8 +3263,7 @@ static int vega10_apply_state_adjust_rules(struct pp_hwmgr *hwmgr,
 			const struct pp_power_state *current_ps)
 {
 	struct amdgpu_device *adev = hwmgr->adev;
-	struct vega10_power_state *vega10_ps =
-				cast_phw_vega10_power_state(&request_ps->hardware);
+	struct vega10_power_state *vega10_ps;
 	uint32_t sclk;
 	uint32_t mclk;
 	struct PP_Clocks minimum_clocks = {0};
@@ -3282,6 +3281,10 @@ static int vega10_apply_state_adjust_rules(struct pp_hwmgr *hwmgr,
 	uint32_t stable_pstate_sclk = 0, stable_pstate_mclk = 0;
 	uint32_t latency;
 
+	vega10_ps = cast_phw_vega10_power_state(&request_ps->hardware);
+	if (!vega10_ps)
+		return -EINVAL;
+
 	data->battery_state = (PP_StateUILabel_Battery ==
 			request_ps->classification.ui_label);
 
-- 
2.43.0

