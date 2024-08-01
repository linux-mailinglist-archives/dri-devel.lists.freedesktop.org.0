Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1864943B80
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB3110E777;
	Thu,  1 Aug 2024 00:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IsHdWOyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96CC10E775;
 Thu,  1 Aug 2024 00:28:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 422F361446;
 Thu,  1 Aug 2024 00:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC53C116B1;
 Thu,  1 Aug 2024 00:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472106;
 bh=OjoGGK4pUIVybToCjKqlarlVa8jvzJO0umWEbu4Oz7g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IsHdWOyomxvWwbgUBqD1gZMeM7QMqyk0EoCjcrf9DlCDQnuttcQbJm3sDvr/3kJCo
 B80ASI5JHfZPPutLdO9nj/Iof5yAAcyU+jKbr2dvW8wTmpBu6YCOm2viWafEGSSWyc
 ZmvrgMdhtGLeuclUtTRsa/6pt0DUHiACAOZelQXAZNjENaKZ3fd1GqVl6AGCXL9A6u
 I5Z06x9tLMB8M6z2xlDqPoVuwxm1M20ls7sxFGfyy24Z747mcyTHN26WaQmxWNWrsr
 DT+iC5qRQMmMcNR0sNntyvLhUEaReL04c10hINq3DFvFKYjWM0qtXDjwS/+JewbQac
 /G9b//iS4QxWg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, kenneth.feng@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Jun.Ma2@amd.com, mario.limonciello@amd.com,
 yifan1.zhang@amd.com, lijo.lazar@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 05/61] drm/amd/pm: Fix negative array index read
Date: Wed, 31 Jul 2024 20:25:23 -0400
Message-ID: <20240801002803.3935985-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
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

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit c8c19ebf7c0b202a6a2d37a52ca112432723db5f ]

Avoid using the negative values
for clk_idex as an index into an array pptable->DpmDescriptor.

V2: fix clk_index return check (Tim Huang)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index ed2112efc6c68..286f4f9bfa352 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -1215,19 +1215,22 @@ static int navi10_get_current_clk_freq_by_table(struct smu_context *smu,
 					   value);
 }
 
-static bool navi10_is_support_fine_grained_dpm(struct smu_context *smu, enum smu_clk_type clk_type)
+static int navi10_is_support_fine_grained_dpm(struct smu_context *smu, enum smu_clk_type clk_type)
 {
 	PPTable_t *pptable = smu->smu_table.driver_pptable;
 	DpmDescriptor_t *dpm_desc = NULL;
-	uint32_t clk_index = 0;
+	int clk_index = 0;
 
 	clk_index = smu_cmn_to_asic_specific_index(smu,
 						   CMN2ASIC_MAPPING_CLK,
 						   clk_type);
+	if (clk_index < 0)
+		return clk_index;
+
 	dpm_desc = &pptable->DpmDescriptor[clk_index];
 
 	/* 0 - Fine grained DPM, 1 - Discrete DPM */
-	return dpm_desc->SnapToDiscrete == 0;
+	return dpm_desc->SnapToDiscrete == 0 ? 1 : 0;
 }
 
 static inline bool navi10_od_feature_is_supported(struct smu_11_0_overdrive_table *od_table, enum SMU_11_0_ODFEATURE_CAP cap)
@@ -1283,7 +1286,11 @@ static int navi10_emit_clk_levels(struct smu_context *smu,
 		if (ret)
 			return ret;
 
-		if (!navi10_is_support_fine_grained_dpm(smu, clk_type)) {
+		ret = navi10_is_support_fine_grained_dpm(smu, clk_type);
+		if (ret < 0)
+			return ret;
+
+		if (!ret) {
 			for (i = 0; i < count; i++) {
 				ret = smu_v11_0_get_dpm_freq_by_index(smu,
 								      clk_type, i, &value);
@@ -1492,7 +1499,11 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 		if (ret)
 			return size;
 
-		if (!navi10_is_support_fine_grained_dpm(smu, clk_type)) {
+		ret = navi10_is_support_fine_grained_dpm(smu, clk_type);
+		if (ret < 0)
+			return ret;
+
+		if (!ret) {
 			for (i = 0; i < count; i++) {
 				ret = smu_v11_0_get_dpm_freq_by_index(smu, clk_type, i, &value);
 				if (ret)
@@ -1661,7 +1672,11 @@ static int navi10_force_clk_levels(struct smu_context *smu,
 	case SMU_UCLK:
 	case SMU_FCLK:
 		/* There is only 2 levels for fine grained DPM */
-		if (navi10_is_support_fine_grained_dpm(smu, clk_type)) {
+		ret = navi10_is_support_fine_grained_dpm(smu, clk_type);
+		if (ret < 0)
+			return ret;
+
+		if (ret) {
 			soft_max_level = (soft_max_level >= 1 ? 1 : 0);
 			soft_min_level = (soft_min_level >= 1 ? 1 : 0);
 		}
-- 
2.43.0

