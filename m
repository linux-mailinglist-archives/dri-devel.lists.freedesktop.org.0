Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00EAAA02F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56AB10E4B8;
	Mon,  5 May 2025 22:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oEwiGfgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C373910E4B8;
 Mon,  5 May 2025 22:32:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E615844BD9;
 Mon,  5 May 2025 22:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBE0C4CEED;
 Mon,  5 May 2025 22:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484354;
 bh=IA7GbYYuCSC/XkC216binQY5ZuoP5+yntdksd1y0aWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oEwiGfgEGD8jyqcdSWgoOgK2zpPW4dfYm2acjFf1w84MMWdutbNeQUmdGZMAYTtQg
 +dQlD4J1H3es8uXd/tY8r+yH+KUaLMjNl624/FupBT8/XBeYbjrPOIcPH8R6Q9E4vK
 faXj2xKPtpWO27p6KbQzHCrsdfHQu7uGTfXGknqNlXrW49rPPLld7FCwrsN7bwKCBp
 bnYIdM9LkwG3lUuMB6gO3RCe3F84edHfNePr9PKKIrsl00GbZr9eLmJnrycrV1+oOh
 DPmytg4OwOmMae9j++R57a9ryHLM/gOzZDyVqoYpUQWsEgxMS+JtKiGqXtN1V5vl3x
 wd6nDUCAm2UsQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samson Tam <Samson.Tam@amd.com>, Navid Assadian <navid.assadian@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, jun.lei@amd.com, alex.hung@amd.com,
 Relja.Vojvodic@amd.com, wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 462/642] drm/amd/display: remove TF check for LLS
 policy
Date: Mon,  5 May 2025 18:11:18 -0400
Message-Id: <20250505221419.2672473-462-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Samson Tam <Samson.Tam@amd.com>

[ Upstream commit 2a4519c4e9b2e1f622ab4c5f5841abdb9760cb0b ]

[Why & How]
LLS policy not affected by TF.
Remove check in don't care case and use
 pixel format only.

Reviewed-by: Navid Assadian <navid.assadian@amd.com>
Signed-off-by: Samson Tam <Samson.Tam@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c | 31 +++++----------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 153b7a8904e1e..047f05ab01810 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -784,25 +784,13 @@ static enum scl_mode spl_get_dscl_mode(const struct spl_in *spl_in,
 	return SCL_MODE_SCALING_420_YCBCR_ENABLE;
 }
 
-static bool spl_choose_lls_policy(enum spl_pixel_format format,
-	enum spl_transfer_func_type tf_type,
-	enum spl_transfer_func_predefined tf_predefined_type,
+static void spl_choose_lls_policy(enum spl_pixel_format format,
 	enum linear_light_scaling *lls_pref)
 {
-	if (spl_is_video_format(format)) {
+	if (spl_is_subsampled_format(format))
 		*lls_pref = LLS_PREF_NO;
-		if ((tf_type == SPL_TF_TYPE_PREDEFINED) ||
-			(tf_type == SPL_TF_TYPE_DISTRIBUTED_POINTS))
-			return true;
-	} else { /* RGB or YUV444 */
-		if ((tf_type == SPL_TF_TYPE_PREDEFINED) ||
-			(tf_type == SPL_TF_TYPE_BYPASS)) {
-			*lls_pref = LLS_PREF_YES;
-			return true;
-		}
-	}
-	*lls_pref = LLS_PREF_NO;
-	return false;
+	else /* RGB or YUV444 */
+		*lls_pref = LLS_PREF_YES;
 }
 
 /* Enable EASF ?*/
@@ -811,7 +799,6 @@ static bool enable_easf(struct spl_in *spl_in, struct spl_scratch *spl_scratch)
 	int vratio = 0;
 	int hratio = 0;
 	bool skip_easf = false;
-	bool lls_enable_easf = true;
 
 	if (spl_in->disable_easf)
 		skip_easf = true;
@@ -827,17 +814,13 @@ static bool enable_easf(struct spl_in *spl_in, struct spl_scratch *spl_scratch)
 		skip_easf = true;
 
 	/*
-	 * If lls_pref is LLS_PREF_DONT_CARE, then use pixel format and transfer
-	 *  function to determine whether to use LINEAR or NONLINEAR scaling
+	 * If lls_pref is LLS_PREF_DONT_CARE, then use pixel format
+	 *  to determine whether to use LINEAR or NONLINEAR scaling
 	 */
 	if (spl_in->lls_pref == LLS_PREF_DONT_CARE)
-		lls_enable_easf = spl_choose_lls_policy(spl_in->basic_in.format,
-			spl_in->basic_in.tf_type, spl_in->basic_in.tf_predefined_type,
+		spl_choose_lls_policy(spl_in->basic_in.format,
 			&spl_in->lls_pref);
 
-	if (!lls_enable_easf)
-		skip_easf = true;
-
 	/* Check for linear scaling or EASF preferred */
 	if (spl_in->lls_pref != LLS_PREF_YES && !spl_in->prefer_easf)
 		skip_easf = true;
-- 
2.39.5

