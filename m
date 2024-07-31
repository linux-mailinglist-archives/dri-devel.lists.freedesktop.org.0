Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88BF943A55
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0B310E728;
	Thu,  1 Aug 2024 00:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bz/nTcG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4CC10E725;
 Thu,  1 Aug 2024 00:13:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 638EF612FC;
 Thu,  1 Aug 2024 00:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F0AC116B1;
 Thu,  1 Aug 2024 00:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471199;
 bh=drowvk8bKrJgpKQH++elfXhsfOz7A/sy9gWhKltEZsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bz/nTcG8cElBb/FdYSla+keWqRGLVbeDlp/QuaDFSaEli4aJ8tkNyXsnNgFHCP7WM
 L6doqyCYsm/eYvMMt68LMIwD38DwdprAm70uPLxKcztbCEch8q+uR1p0+ZfQCQOU3X
 zL67rNDW6/e8gQEM2I43IUGP1DnRWSi0Rs1UEHJwsYvuXT1w1dY0GmGWJaenzljrJF
 zLWxppufhWNEE3KMbl47OF4vehDy9r0x0hKbiM1OXFLXJJw3pvUurRw7b4vlcgr/1+
 QP9ZWO85z9a2ldbQrDkAJ3J1jkDIsqUVyuAUpd5Yh/CsuwEDW2oIZPmi7d3k3mGA6l
 jmA00t4Ttozvg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ma Jun <Jun.Ma2@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 kenneth.feng@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com,
 darren.powell@amd.com, mario.limonciello@amd.com, yifan1.zhang@amd.com,
 jesse.zhang@amd.com, coelacanth_dream@protonmail.com, evan.quan@amd.com,
 Jack.Gui@amd.com, Likun.Gao@amd.com, sonjiang@amd.com,
 hkallweit1@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 042/121] drm/amdgpu/pm: Check input value for
 power profile setting on smu11, smu13 and smu14
Date: Wed, 31 Jul 2024 19:59:40 -0400
Message-ID: <20240801000834.3930818-42-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
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

From: Ma Jun <Jun.Ma2@amd.com>

[ Upstream commit adb9de4dd207fb1264ea70b9eacab9f70ee4707a ]

Check the input value for CUSTOM profile mode setting on smu 11,
smu13 and smu14. Otherwise we use uninitialized value of input[]

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c       | 5 +++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 4 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c    | 5 +++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c    | 4 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c    | 5 +++++
 6 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index 6d334a2aff672..623f6052f97ed 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -1416,6 +1416,9 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 
 	if ((profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) &&
 	     (smu->smc_fw_version >= 0x360d00)) {
+		if (size != 10)
+			return -EINVAL;
+
 		ret = smu_cmn_update_table(smu,
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF,
 				       WORKLOAD_PPLIB_CUSTOM_BIT,
@@ -1449,6 +1452,8 @@ static int arcturus_set_power_profile_mode(struct smu_context *smu,
 			activity_monitor.Mem_PD_Data_error_coeff = input[8];
 			activity_monitor.Mem_PD_Data_error_rate_coeff = input[9];
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ret = smu_cmn_update_table(smu,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index c06e0d6e30177..01039cdd456b0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -2021,6 +2021,8 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
 	}
 
 	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (size != 10)
+			return -EINVAL;
 
 		ret = smu_cmn_update_table(smu,
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
@@ -2064,6 +2066,8 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
 			activity_monitor.Mem_PD_Data_error_coeff = input[8];
 			activity_monitor.Mem_PD_Data_error_rate_coeff = input[9];
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ret = smu_cmn_update_table(smu,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index e426f457a017f..d5a21d7836cc6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -1722,6 +1722,8 @@ static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *
 	}
 
 	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (size != 10)
+			return -EINVAL;
 
 		ret = smu_cmn_update_table(smu,
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
@@ -1765,6 +1767,8 @@ static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *
 			activity_monitor->Mem_PD_Data_error_coeff = input[8];
 			activity_monitor->Mem_PD_Data_error_rate_coeff = input[9];
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ret = smu_cmn_update_table(smu,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 1e09d5f2d82fe..f7e756ca36dcd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -2495,6 +2495,9 @@ static int smu_v13_0_0_set_power_profile_mode(struct smu_context *smu,
 	}
 
 	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (size != 9)
+			return -EINVAL;
+
 		ret = smu_cmn_update_table(smu,
 					   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
 					   WORKLOAD_PPLIB_CUSTOM_BIT,
@@ -2526,6 +2529,8 @@ static int smu_v13_0_0_set_power_profile_mode(struct smu_context *smu,
 			activity_monitor->Fclk_PD_Data_error_coeff = input[7];
 			activity_monitor->Fclk_PD_Data_error_rate_coeff = input[8];
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ret = smu_cmn_update_table(smu,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index e996a0a4d33e1..4f98869e02848 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -2450,6 +2450,8 @@ static int smu_v13_0_7_set_power_profile_mode(struct smu_context *smu, long *inp
 	}
 
 	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (size != 8)
+			return -EINVAL;
 
 		ret = smu_cmn_update_table(smu,
 				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
@@ -2478,6 +2480,8 @@ static int smu_v13_0_7_set_power_profile_mode(struct smu_context *smu, long *inp
 			activity_monitor->Fclk_MinActiveFreq = input[6];
 			activity_monitor->Fclk_BoosterFreq = input[7];
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ret = smu_cmn_update_table(smu,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
index 90703f4542aba..06b65159f7b4a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@ -1364,6 +1364,9 @@ static int smu_v14_0_2_set_power_profile_mode(struct smu_context *smu,
 	}
 
 	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
+		if (size != 9)
+			return -EINVAL;
+
 		ret = smu_cmn_update_table(smu,
 					   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
 					   WORKLOAD_PPLIB_CUSTOM_BIT,
@@ -1395,6 +1398,8 @@ static int smu_v14_0_2_set_power_profile_mode(struct smu_context *smu,
 			activity_monitor->Fclk_PD_Data_error_coeff = input[7];
 			activity_monitor->Fclk_PD_Data_error_rate_coeff = input[8];
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ret = smu_cmn_update_table(smu,
-- 
2.43.0

