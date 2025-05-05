Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0423AA9FE8
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1AE10E494;
	Mon,  5 May 2025 22:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xpncj2PL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241D210E494;
 Mon,  5 May 2025 22:29:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C2C00629C8;
 Mon,  5 May 2025 22:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E50C4CEEE;
 Mon,  5 May 2025 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484166;
 bh=CJqtGRIu7fkrant3moOP0oGqadAAgLUL0H9FjJ68rXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xpncj2PLd+m8OstQNJm3RPFR9zJ2zwlq9ivMzD6DOtBZUHDN8C6XJyotm5seeKWWv
 bKfIv0FqqzMfMFvi6ga4ddBDxrNm65dQJMux8f2LKAJ59aWGZIX3cnm9Hg7uieaiha
 fw1h0YG7aBM1hlCdQmsGMMc63cJf6HRTFrgRgPHr1xrjgDBxG2L8NZL+kNfjqiwz5I
 XXnrZObTrz0/OIwOjD5ScqqN464t812X+VWbgOxv5i4GNx8h7DgaCWMRiUP5uSRuUj
 5nttz0wEB3v60uDiMBu+slUSbedBXejmI9DZFpuK4ts554oZcHCrG8Uj385XnSVrJB
 RTwqHXa9JNLEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harry VanZyllDeJong <hvanzyll@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com,
 michael.strauss@amd.com, george.shen@amd.com, PeiChen.Huang@amd.com,
 Ausef.Yousof@amd.com, Cruise.Hung@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 384/642] drm/amd/display: Add support for
 disconnected eDP streams
Date: Mon,  5 May 2025 18:10:00 -0400
Message-Id: <20250505221419.2672473-384-sashal@kernel.org>
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

From: Harry VanZyllDeJong <hvanzyll@amd.com>

[ Upstream commit 6571bef25fe48c642f7a69ccf7c3198b317c136a ]

[Why]
eDP may not be connected to the GPU on driver start causing
fail enumeration.

[How]
Move the virtual signal type check before the eDP connector
signal check.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: Harry VanZyllDeJong <hvanzyll@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/link/protocols/link_dp_capability.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 6d7131369f00b..28843e9882d39 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -945,6 +945,9 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 		 * TODO: add MST specific link training routine
 		 */
 		decide_mst_link_settings(link, link_setting);
+	} else if (stream->signal == SIGNAL_TYPE_VIRTUAL) {
+		link_setting->lane_count = LANE_COUNT_FOUR;
+		link_setting->link_rate = LINK_RATE_HIGH3;
 	} else if (link->connector_signal == SIGNAL_TYPE_EDP) {
 		/* enable edp link optimization for DSC eDP case */
 		if (stream->timing.flags.DSC) {
@@ -967,9 +970,6 @@ bool link_decide_link_settings(struct dc_stream_state *stream,
 		} else {
 			edp_decide_link_settings(link, link_setting, req_bw);
 		}
-	} else if (stream->signal == SIGNAL_TYPE_VIRTUAL) {
-		link_setting->lane_count = LANE_COUNT_FOUR;
-		link_setting->link_rate = LINK_RATE_HIGH3;
 	} else {
 		decide_dp_link_settings(link, link_setting, req_bw);
 	}
-- 
2.39.5

