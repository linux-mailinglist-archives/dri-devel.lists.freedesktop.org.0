Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77672502F3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 18:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C6F6E2E6;
	Mon, 24 Aug 2020 16:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E5E6E2E6;
 Mon, 24 Aug 2020 16:38:10 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C2A022E00;
 Mon, 24 Aug 2020 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598287090;
 bh=s5WS0RpB5021Z5Smn7KqlHoo/qgBwAFA/bRBhOH6u00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EQBWVGyCTgGRshcfLrOOd5jAZB1PbeU+nQX8xMF8ZHeyChfVANKZujlvNc8/4g9+f
 wxo1uJDa958Lai+BIbQRsmssEloYVxLEVdLd83oZhf7kdVGk0egk3WKb8BaeEWQZsM
 tUaIUjFz+TOL/BaJJc645xodLDecs1n9EQAyFMBc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/38] drm/amd/powerplay: correct Vega20 cached
 smu feature state
Date: Mon, 24 Aug 2020 12:37:26 -0400
Message-Id: <20200824163751.606577-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163751.606577-1-sashal@kernel.org>
References: <20200824163751.606577-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Evan Quan <evan.quan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 266d81d9eed30f4994d76a2b237c63ece062eefe ]

Correct the cached smu feature state on pp_features sysfs
setting.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/powerplay/hwmgr/vega20_hwmgr.c    | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index f5915308e643a..08b91c31532ba 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -981,27 +981,15 @@ static int vega20_disable_all_smu_features(struct pp_hwmgr *hwmgr)
 {
 	struct vega20_hwmgr *data =
 			(struct vega20_hwmgr *)(hwmgr->backend);
-	uint64_t features_enabled;
-	int i;
-	bool enabled;
-	int ret = 0;
+	int i, ret = 0;
 
 	PP_ASSERT_WITH_CODE((ret = smum_send_msg_to_smc(hwmgr,
 			PPSMC_MSG_DisableAllSmuFeatures)) == 0,
 			"[DisableAllSMUFeatures] Failed to disable all smu features!",
 			return ret);
 
-	ret = vega20_get_enabled_smc_features(hwmgr, &features_enabled);
-	PP_ASSERT_WITH_CODE(!ret,
-			"[DisableAllSMUFeatures] Failed to get enabled smc features!",
-			return ret);
-
-	for (i = 0; i < GNLD_FEATURES_MAX; i++) {
-		enabled = (features_enabled & data->smu_features[i].smu_feature_bitmap) ?
-			true : false;
-		data->smu_features[i].enabled = enabled;
-		data->smu_features[i].supported = enabled;
-	}
+	for (i = 0; i < GNLD_FEATURES_MAX; i++)
+		data->smu_features[i].enabled = 0;
 
 	return 0;
 }
@@ -3211,10 +3199,11 @@ static int vega20_get_ppfeature_status(struct pp_hwmgr *hwmgr, char *buf)
 
 static int vega20_set_ppfeature_status(struct pp_hwmgr *hwmgr, uint64_t new_ppfeature_masks)
 {
-	uint64_t features_enabled;
-	uint64_t features_to_enable;
-	uint64_t features_to_disable;
-	int ret = 0;
+	struct vega20_hwmgr *data =
+			(struct vega20_hwmgr *)(hwmgr->backend);
+	uint64_t features_enabled, features_to_enable, features_to_disable;
+	int i, ret = 0;
+	bool enabled;
 
 	if (new_ppfeature_masks >= (1ULL << GNLD_FEATURES_MAX))
 		return -EINVAL;
@@ -3243,6 +3232,17 @@ static int vega20_set_ppfeature_status(struct pp_hwmgr *hwmgr, uint64_t new_ppfe
 			return ret;
 	}
 
+	/* Update the cached feature enablement state */
+	ret = vega20_get_enabled_smc_features(hwmgr, &features_enabled);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < GNLD_FEATURES_MAX; i++) {
+		enabled = (features_enabled & data->smu_features[i].smu_feature_bitmap) ?
+			true : false;
+		data->smu_features[i].enabled = enabled;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
