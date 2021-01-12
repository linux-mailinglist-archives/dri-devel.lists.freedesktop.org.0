Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359542F2F7B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 13:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778FA6E209;
	Tue, 12 Jan 2021 12:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656896E1F5;
 Tue, 12 Jan 2021 12:56:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3433B23339;
 Tue, 12 Jan 2021 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456192;
 bh=atM/We5CsFzw3dFfBXTIftb+fTP0t+mUCTgaENwNCyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FEZZ8B2NN1srkM4m/lUuwASw+1abM0tKgK8x9j7n2s/M/ci8S3sQSLSpYAZtMVGE8
 MYDSEZ8kX4Sk6BLnSNss5sf7MVsRTFH2/Opm0Y5O3A7ZzP6owWV2mCsdgU80dJgVO0
 4ClJRWXFZtBjLiyAQpXzD9XZCrDpRfAdfkTlNcbsAfAGCG9PdCo9i4ag0xapfDi8b8
 yFB+01Al7mSIxFG770IkvT6qxhAw0lwyNSbxikPGC8FnrJv4wrBMMceFYZcL3XbfE2
 vIjdJc53op/Hkl+bB68JYLXtxvZcNnqmac+9icMS+G+eyqkF+RLpgLBSqBgmUqxAdS
 c6gLD19RwXmqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 43/51] drm/amd/pm: fix the failure when change
 power profile for renoir
Date: Tue, 12 Jan 2021 07:55:25 -0500
Message-Id: <20210112125534.70280-43-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Xiaojian Du <Xiaojian.Du@amd.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaojian Du <Xiaojian.Du@amd.com>

[ Upstream commit 44cb39e19a05ca711bcb6e776e0a4399223204a0 ]

This patch is to fix the failure when change power profile to
"profile_peak" for renoir.

Signed-off-by: Xiaojian Du <Xiaojian.Du@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
index 66c1026489bee..425c48e100e4f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
@@ -188,6 +188,7 @@ static int renoir_get_dpm_clk_limited(struct smu_context *smu, enum smu_clk_type
 			return -EINVAL;
 		*freq = clk_table->SocClocks[dpm_level].Freq;
 		break;
+	case SMU_UCLK:
 	case SMU_MCLK:
 		if (dpm_level >= NUM_FCLK_DPM_LEVELS)
 			return -EINVAL;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
index 660f403d5770c..7907c9e0b5dec 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
@@ -222,6 +222,7 @@ int smu_v12_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_
 	break;
 	case SMU_FCLK:
 	case SMU_MCLK:
+	case SMU_UCLK:
 		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinFclkByFreq, min, NULL);
 		if (ret)
 			return ret;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
