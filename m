Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8847F531E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 23:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C1610E13D;
	Wed, 22 Nov 2023 22:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E11510E13D;
 Wed, 22 Nov 2023 22:14:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 45894B829EE;
 Wed, 22 Nov 2023 22:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88974C433C8;
 Wed, 22 Nov 2023 22:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700691273;
 bh=aWQ1WosCXNx8YLqqiiqVPjOn2S3ApOJNQuk6aGU9t4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=MS2uMxCEmTjhyh75y+8ySB5WevsdWntNucFuJnOEJ+NnniCPeACPNSOIdvGtr1WNj
 jfEhx3ALW0Miyv3gKlhT2Ujqv6J88KtAn4CNXVHDOYWuBM9kmZGvpNn/rR2F8kUaab
 Ik0b9/1OQUVOAY4UMJYlaDNkQBQ2IOSen3Waf/VSwt6Xy8UaE24b+tQDmvF24jlxzA
 ++5ClYBjdhHerpcrnITcvbg9HYn1gMqFhEiqI2IaAunt4uTYxvCmT4V8ldYUzMPCpN
 QDTX31Uj7tBS47Pt004uhTDbRwIrhktLEO6Ezldy+bDN0spqkTAof9lypS4DNL46t7
 edonuXg/zGADA==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: avoid stringop-overflow warnings for
 dp_decide_lane_settings()
Date: Wed, 22 Nov 2023 23:13:36 +0100
Message-Id: <20231122221421.2944301-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Michael Mityushkin <michael.mityushkin@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc prints a warning about a possible array overflow for a couple of
callers of dp_decide_lane_settings() after commit 1b56c90018f0 ("Makefile:
Enable -Wstringop-overflow globally"):

drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c: In function 'dp_perform_fixed_vs_pe_training_sequence_legacy':
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c:426:25: error: 'dp_decide_lane_settings' accessing 4 bytes in a region of size 1 [-Werror=stringop-overflow=]
  426 |                         dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  427 |                                         lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
      |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c:426:25: note: referencing argument 4 of type 'union dpcd_training_lane[4]'

I'm not entirely sure what caused this, but changing the prototype to expect
a pointer instead of an array avoids the warnings.

Fixes: 7727e7b60f82 ("drm/amd/display: Improve robustness of FIXED_VS link training at DP1 rates")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c    | 2 +-
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 90339c2dfd84..5a0b04518956 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -807,7 +807,7 @@ void dp_decide_lane_settings(
 		const struct link_training_settings *lt_settings,
 		const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
 		struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
+		union dpcd_training_lane *dpcd_lane_settings)
 {
 	uint32_t lane;
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
index 7d027bac8255..851bd17317a0 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.h
@@ -111,7 +111,7 @@ void dp_decide_lane_settings(
 	const struct link_training_settings *lt_settings,
 	const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
 	struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
+	union dpcd_training_lane *dpcd_lane_settings);
 
 enum dc_dp_training_pattern decide_cr_training_pattern(
 		const struct dc_link_settings *link_settings);
-- 
2.39.2

