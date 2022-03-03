Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FF4CC388
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80E10E2E8;
	Thu,  3 Mar 2022 17:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEE010E9C3;
 Thu,  3 Mar 2022 17:16:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E29E7B824C9;
 Thu,  3 Mar 2022 17:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72976C004E1;
 Thu,  3 Mar 2022 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646327808;
 bh=sdUx4pmy1wPJZfj6t7Mf+fkJVick/R8Ggpu5sR4Dt+Y=;
 h=Date:From:To:Cc:Subject:From;
 b=NwmIXYrrvH7iS9aCfeSxw0PbeX4QcPjSaApJqB1fJ3O9q1sfze3jXHZKmO74LRbKI
 Xg7d3NyzLFwg8NhGr2Xvt7XHe7x4FyWCAX3AJQZL49HW4+ADRsQzeivFqsZQ7M7GCj
 6CkPQaC/MIEh2T4NMU2Yf1s/JfFpSO9dDC1FuHpTRiaOnpF0JrP95xdKY/isOQj2WO
 EjcjiiHjKV8ecFFd6lMkH5r7IVEY+6vQOoHliejS8mrNDXtpnw++kBkNMxQEOGTdWs
 GwWsgCJDLn0v9B9vOGDFOqN9JyHWuxPwLQUtXhT4g9cnKjIqrgbbNNRdX/CiLOi7Fq
 Mz8VMs5IbQc/A==
Date: Thu, 3 Mar 2022 11:25:03 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/amd/display: Fix Wstringop-overflow warnings in
 dc_link_dp.c
Message-ID: <20220303172503.GA1731116@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following Wstringop-overflow warnings when building with GCC-11:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:388:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:388:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:388:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:1491:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2613:25: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2613:25: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]

by removing the over-specified array size from the argument declarations.

This helps with the ongoing efforts to globally enable
-Wstringop-overflow.

Link: https://github.com/KSPP/linux/issues/181
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 ++--
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index f11a8d97fb60..81952e07acf6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -823,7 +823,7 @@ bool dp_is_interlane_aligned(union lane_align_status_updated align_status)
 void dp_hw_to_dpcd_lane_settings(
 		const struct link_training_settings *lt_settings,
 		const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
+		union dpcd_training_lane dpcd_lane_settings[])
 {
 	uint8_t lane = 0;
 
@@ -853,7 +853,7 @@ void dp_decide_lane_settings(
 		const struct link_training_settings *lt_settings,
 		const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
 		struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
+		union dpcd_training_lane dpcd_lane_settings[])
 {
 	uint32_t lane;
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
index ab9939db8cea..0d00da1640a7 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
@@ -147,12 +147,12 @@ bool dp_is_max_vs_reached(
 void dp_hw_to_dpcd_lane_settings(
 	const struct link_training_settings *lt_settings,
 	const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
+	union dpcd_training_lane dpcd_lane_settings[]);
 void dp_decide_lane_settings(
 	const struct link_training_settings *lt_settings,
 	const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
 	struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
-	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
+	union dpcd_training_lane dpcd_lane_settings[]);
 
 uint32_t dp_translate_training_aux_read_interval(uint32_t dpcd_aux_read_interval);
 
-- 
2.27.0

