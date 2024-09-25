Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9BB985937
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F1E10E971;
	Wed, 25 Sep 2024 11:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HI9ACeKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC71310E971;
 Wed, 25 Sep 2024 11:51:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BE9A5C48C0;
 Wed, 25 Sep 2024 11:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFECCC4CED2;
 Wed, 25 Sep 2024 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265071;
 bh=Ksqu8nOUQTfxeTp6k0Uxh8iY+BnEDmfD+McJOdXyPRQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HI9ACeKynUC1pH+ak6et/54lqv/yg/t5ARxJYObfLcm/swT4SmAjB9eSKab1LcUIz
 ovKRkH7hRSMsYZ/XyMfiamb+Rm6r94tQFEyckG6ChABM9fSfrrA38h4FgBzWlED/WF
 nmKKrxZEPm4TfACrtgMJsPZR0th3+3W58IFoO/ms3Anr4co2v9tR3NWM9tKhf3y/jR
 Cg0br8HcTVyFV+GTo0P59FgPW7xU3hsieebQA423oNz+RFQfvLN1aacPnU1TJn45t9
 LKjLIRJEU0zVLX/fsUGOIHEhwR87+MqMWxjayREPSii6yWtWDiAZ27td766Oj2KdAV
 wKqsydWj7X6Ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Huang <tim.huang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, electrodeyt@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 204/244] drm/amdgpu: fix unchecked return value
 warning for amdgpu_atombios
Date: Wed, 25 Sep 2024 07:27:05 -0400
Message-ID: <20240925113641.1297102-204-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Tim Huang <tim.huang@amd.com>

[ Upstream commit 92549780e32718d64a6d08bbbb3c6fffecb541c7 ]

This resolves the unchecded return value warning reported by Coverity.

Signed-off-by: Tim Huang <tim.huang@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 35 ++++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 7dc102f0bc1d3..0c8975ac5af9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1018,8 +1018,9 @@ int amdgpu_atombios_get_clock_dividers(struct amdgpu_device *adev,
 		if (clock_type == COMPUTE_ENGINE_PLL_PARAM) {
 			args.v3.ulClockParams = cpu_to_le32((clock_type << 24) | clock);
 
-			amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args,
-				sizeof(args));
+			if (amdgpu_atom_execute_table(adev->mode_info.atom_context,
+			    index, (uint32_t *)&args, sizeof(args)))
+				return -EINVAL;
 
 			dividers->post_div = args.v3.ucPostDiv;
 			dividers->enable_post_div = (args.v3.ucCntlFlag &
@@ -1039,8 +1040,9 @@ int amdgpu_atombios_get_clock_dividers(struct amdgpu_device *adev,
 			if (strobe_mode)
 				args.v5.ucInputFlag = ATOM_PLL_INPUT_FLAG_PLL_STROBE_MODE_EN;
 
-			amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args,
-				sizeof(args));
+			if (amdgpu_atom_execute_table(adev->mode_info.atom_context,
+			    index, (uint32_t *)&args, sizeof(args)))
+				return -EINVAL;
 
 			dividers->post_div = args.v5.ucPostDiv;
 			dividers->enable_post_div = (args.v5.ucCntlFlag &
@@ -1058,8 +1060,9 @@ int amdgpu_atombios_get_clock_dividers(struct amdgpu_device *adev,
 		/* fusion */
 		args.v4.ulClock = cpu_to_le32(clock);	/* 10 khz */
 
-		amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args,
-			sizeof(args));
+		if (amdgpu_atom_execute_table(adev->mode_info.atom_context,
+		    index, (uint32_t *)&args, sizeof(args)))
+			return -EINVAL;
 
 		dividers->post_divider = dividers->post_div = args.v4.ucPostDiv;
 		dividers->real_clock = le32_to_cpu(args.v4.ulClock);
@@ -1070,8 +1073,9 @@ int amdgpu_atombios_get_clock_dividers(struct amdgpu_device *adev,
 		args.v6_in.ulClock.ulComputeClockFlag = clock_type;
 		args.v6_in.ulClock.ulClockFreq = cpu_to_le32(clock);	/* 10 khz */
 
-		amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args,
-			sizeof(args));
+		if (amdgpu_atom_execute_table(adev->mode_info.atom_context,
+		    index, (uint32_t *)&args, sizeof(args)))
+			return -EINVAL;
 
 		dividers->whole_fb_div = le16_to_cpu(args.v6_out.ulFbDiv.usFbDiv);
 		dividers->frac_fb_div = le16_to_cpu(args.v6_out.ulFbDiv.usFbDivFrac);
@@ -1113,8 +1117,9 @@ int amdgpu_atombios_get_memory_pll_dividers(struct amdgpu_device *adev,
 			if (strobe_mode)
 				args.ucInputFlag |= MPLL_INPUT_FLAG_STROBE_MODE_EN;
 
-			amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args,
-				sizeof(args));
+			if (amdgpu_atom_execute_table(adev->mode_info.atom_context,
+			    index, (uint32_t *)&args, sizeof(args)))
+				return -EINVAL;
 
 			mpll_param->clkfrac = le16_to_cpu(args.ulFbDiv.usFbDivFrac);
 			mpll_param->clkf = le16_to_cpu(args.ulFbDiv.usFbDiv);
@@ -1211,8 +1216,9 @@ int amdgpu_atombios_get_max_vddc(struct amdgpu_device *adev, u8 voltage_type,
 		args.v2.ucVoltageMode = 0;
 		args.v2.usVoltageLevel = 0;
 
-		amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args,
-			sizeof(args));
+		if (amdgpu_atom_execute_table(adev->mode_info.atom_context,
+		    index, (uint32_t *)&args, sizeof(args)))
+			return -EINVAL;
 
 		*voltage = le16_to_cpu(args.v2.usVoltageLevel);
 		break;
@@ -1221,8 +1227,9 @@ int amdgpu_atombios_get_max_vddc(struct amdgpu_device *adev, u8 voltage_type,
 		args.v3.ucVoltageMode = ATOM_GET_VOLTAGE_LEVEL;
 		args.v3.usVoltageLevel = cpu_to_le16(voltage_id);
 
-		amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args,
-			sizeof(args));
+		if (amdgpu_atom_execute_table(adev->mode_info.atom_context,
+		    index, (uint32_t *)&args, sizeof(args)))
+			return -EINVAL;
 
 		*voltage = le16_to_cpu(args.v3.usVoltageLevel);
 		break;
-- 
2.43.0

