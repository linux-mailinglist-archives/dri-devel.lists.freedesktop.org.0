Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7AA25029
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 22:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB2910E317;
	Sun,  2 Feb 2025 21:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="dq6R95H/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15F010E2BB;
 Sun,  2 Feb 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=/1b6pCL7BvDkFdAvPm7iR7Qo7T8oE8Lf7B5G8xtmkls=; b=dq6R95H/mJ7NrwbC
 WIfojHMPKjKGPPYjvpQQcDH6dnJMUEj69p7dPUSdKRw8YIveXapEDqRhU7BH9IAZXmQVhfYRZczpW
 eI8jUxyi7ezb7hN6dPmD/DeIsKAKjwgG+VKkhBeDOTGHnanybyQdSfpMGEI+YdLwbUsDAtkaPEzG9
 ZI7yMaTiK5FjM55XZJuV9g3PNJHG//MG3OHxNmAj1/jQKzd8vpXyPK6mxiIeHrC1KaN+UBr4K9OoJ
 p1SemkeXxUEcxfN6TIb4QjHaPKdWs4cYj/R20X/IwYm36t4TtQCGPtCxwA4q7ILPgO3pqibNIBF+c
 PZLDOtqnbhe3mANKAQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tehzY-00D9GV-0k;
 Sun, 02 Feb 2025 21:59:00 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/7] drm/amd/display: Remove unused
 get_clock_requirements_for_state
Date: Sun,  2 Feb 2025 21:58:53 +0000
Message-ID: <20250202215856.252439-5-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
References: <20250202215856.252439-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

get_clock_requirements_for_state() was added in 2018 by
commit 8ab2180f96f5 ("drm/amd/display: Add function to fetch clock
requirements")
but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 12 ------------
 drivers/gpu/drm/amd/display/dc/dc.h      |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 76b39052e3a0..2e42dbabfbe6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -5387,18 +5387,6 @@ bool dc_is_dmcu_initialized(struct dc *dc)
 	return false;
 }
 
-void get_clock_requirements_for_state(struct dc_state *state, struct AsicStateEx *info)
-{
-	info->displayClock				= (unsigned int)state->bw_ctx.bw.dcn.clk.dispclk_khz;
-	info->engineClock				= (unsigned int)state->bw_ctx.bw.dcn.clk.dcfclk_khz;
-	info->memoryClock				= (unsigned int)state->bw_ctx.bw.dcn.clk.dramclk_khz;
-	info->maxSupportedDppClock		= (unsigned int)state->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz;
-	info->dppClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.dppclk_khz;
-	info->socClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.socclk_khz;
-	info->dcfClockDeepSleep			= (unsigned int)state->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz;
-	info->fClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.fclk_khz;
-	info->phyClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.phyclk_khz;
-}
 enum dc_status dc_set_clock(struct dc *dc, enum dc_clock_type clock_type, uint32_t clk_khz, uint32_t stepping)
 {
 	if (dc->hwss.set_clock)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 053481ab69ef..81fbc8e9101d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1582,8 +1582,6 @@ bool dc_validate_boot_timing(const struct dc *dc,
 
 enum dc_status dc_validate_plane(struct dc *dc, const struct dc_plane_state *plane_state);
 
-void get_clock_requirements_for_state(struct dc_state *state, struct AsicStateEx *info);
-
 enum dc_status dc_validate_with_context(struct dc *dc,
 					const struct dc_validation_set set[],
 					int set_count,
-- 
2.48.1

