Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237153089EF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA4C6EB68;
	Fri, 29 Jan 2021 15:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8E06EB65;
 Fri, 29 Jan 2021 15:37:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7682D64E23;
 Fri, 29 Jan 2021 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934671;
 bh=hvCJgtiskHqwsFaSnJ8nJEeTGp3QERMQ4m5jFCX8rKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vek+YYzj1DcHDsD5pMWXVZ7jDD+BLYzDyhlva7bVEdbc/MfkSgLxJFHFji7di2AVW
 /vLqUXlTImuAuAUDGOllfQHYOc4r8blPX869PhSMaFKOwsh/L1pE5Zf48IuVQaC9tX
 nuvd+eJD/wzcqjh2YoavIyt5uKIvbZiA9kQV/iu3l5YqTENMfXd+A44T+3gAX9Xu/J
 p3WTbg2zm4Wkj6VcFnyRcSZN9kGa/H+/YcyLVQBwWi4Y7+RoU+Ipk9u290n6DBB3E8
 IWWXE9PugVy+j61V12eYX6eTuLY3SDVs3GmAjuwX8V5dQbqPM0l24zXf9oADMLvpf/
 E9+FUMEp2AkFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 30/41] drm/amd/display: Allow PSTATE chnage when
 no displays are enabled
Date: Fri, 29 Jan 2021 10:37:01 -0500
Message-Id: <20210129153713.1592185-30-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153713.1592185-1-sashal@kernel.org>
References: <20210129153713.1592185-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <anson.jacob@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aric Cyr <aric.cyr@amd.com>

[ Upstream commit 8bc3d461d0a95bbcc2a0a908bbadc87e198a86a8 ]

[Why]
When no displays are currently enabled, display driver should not
disallow PSTATE switching.

[How]
Allow PSTATE switching if either the active configuration supports it,
or there are no active displays.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Anson Jacob <anson.jacob@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index b0e9b0509568c..95d883482227e 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -239,6 +239,7 @@ static void dcn3_update_clocks(struct clk_mgr *clk_mgr_base,
 	struct dmcu *dmcu = clk_mgr_base->ctx->dc->res_pool->dmcu;
 	bool force_reset = false;
 	bool update_uclk = false;
+	bool p_state_change_support;
 
 	if (dc->work_arounds.skip_clock_update || !clk_mgr->smu_present)
 		return;
@@ -279,8 +280,9 @@ static void dcn3_update_clocks(struct clk_mgr *clk_mgr_base,
 		clk_mgr_base->clks.socclk_khz = new_clocks->socclk_khz;
 
 	clk_mgr_base->clks.prev_p_state_change_support = clk_mgr_base->clks.p_state_change_support;
-	if (should_update_pstate_support(safe_to_lower, new_clocks->p_state_change_support, clk_mgr_base->clks.p_state_change_support)) {
-		clk_mgr_base->clks.p_state_change_support = new_clocks->p_state_change_support;
+	p_state_change_support = new_clocks->p_state_change_support || (display_count == 0);
+	if (should_update_pstate_support(safe_to_lower, p_state_change_support, clk_mgr_base->clks.p_state_change_support)) {
+		clk_mgr_base->clks.p_state_change_support = p_state_change_support;
 
 		/* to disable P-State switching, set UCLK min = max */
 		if (!clk_mgr_base->clks.p_state_change_support)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
