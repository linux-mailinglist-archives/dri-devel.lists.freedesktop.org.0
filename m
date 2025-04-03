Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9AA7AB21
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0C810EAF9;
	Thu,  3 Apr 2025 19:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MOo7yTM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFA910EAF9;
 Thu,  3 Apr 2025 19:18:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8DA08448E5;
 Thu,  3 Apr 2025 19:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19248C4CEE9;
 Thu,  3 Apr 2025 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707913;
 bh=a9ONbC/GI5yKD6EzoRZ0UunHGO/W3XphgI/C8jmfoJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MOo7yTM0UCVXV3glAbjDKXO8m/tsKl28woNF7DsyyFqqn0rKn24wC0Jp7ajn5BxQJ
 4/j7eoZ1wjRly6k545ojj28RhOl2f2WhZPe84BFfgJth1tjRL0ICQCrI+hA6/Q4Boo
 xVTTer6a5CEGnQXy/LHBywG6DkfeCb+1Uc/hYs1pN03EKaEMkJHvyoJI496828mi8t
 5Qkixwlfhh6gVmPnFStQbufzf6illlo/XEcpuspP06LedUQapPsdryKVoce3cs7J96
 rKCop/n0KRapbctlO7mBzWfkLGMCw7pD8J6DPT3nV3laMTipiQbdSjRyMBXR/DxPBw
 9C3stLJ55XK1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Brendan Tam <Brendan.Tam@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, aric.cyr@amd.com, siqueira@igalia.com,
 alex.hung@amd.com, roman.li@amd.com, dillon.varone@amd.com,
 Samson.Tam@amd.com, Syed.Hassan@amd.com, george.shen@amd.com,
 Cruise.Hung@amd.com, joshua.aberback@amd.com, PeiChen.Huang@amd.com,
 michael.strauss@amd.com, jerry.zuo@amd.com, ivlipski@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 03/23] drm/amd/display: add workaround flag to
 link to force FFE preset
Date: Thu,  3 Apr 2025 15:17:56 -0400
Message-Id: <20250403191816.2681439-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191816.2681439-1-sashal@kernel.org>
References: <20250403191816.2681439-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
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

From: Brendan Tam <Brendan.Tam@amd.com>

[ Upstream commit 51d1b338541dea83fec8e6f95d3e46fa469a73a8 ]

[Why]
There have been instances of some monitors being unable to link train on
their reported link speed using their selected FFE preset. If a different
FFE preset is found that has a higher rate of success during link training
this workaround can be used to force its FFE preset.

[How]
A new link workaround flag is made called force_dp_ffe_preset. The flag is
checked in override_training_settings and will set lt_settings->ffe_preset
which is null if the flag is not set. The flag is then set in
override_lane_settings.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: Brendan Tam <Brendan.Tam@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc.h                             | 2 ++
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index cc5e01df15135..88e64b280c90f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1563,7 +1563,9 @@ struct dc_link {
 		bool dongle_mode_timing_override;
 		bool blank_stream_on_ocs_change;
 		bool read_dpcd204h_on_irq_hpd;
+		bool force_dp_ffe_preset;
 	} wa_flags;
+	union dc_dp_ffe_preset forced_dp_ffe_preset;
 	struct link_mst_stream_allocation_table mst_stream_alloc_table;
 
 	struct dc_link_status link_status;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 9d1adfc09fb2a..51e88efee11e4 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -697,6 +697,8 @@ void override_training_settings(
 		lt_settings->pre_emphasis = overrides->pre_emphasis;
 	if (overrides->post_cursor2 != NULL)
 		lt_settings->post_cursor2 = overrides->post_cursor2;
+	if (link->wa_flags.force_dp_ffe_preset && !dp_is_lttpr_present(link))
+		lt_settings->ffe_preset = &link->forced_dp_ffe_preset;
 	if (overrides->ffe_preset != NULL)
 		lt_settings->ffe_preset = overrides->ffe_preset;
 	/* Override HW lane settings with BIOS forced values if present */
-- 
2.39.5

