Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B223089F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475C06EB6E;
	Fri, 29 Jan 2021 15:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6DC6EB68;
 Fri, 29 Jan 2021 15:37:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73B4764E25;
 Fri, 29 Jan 2021 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934674;
 bh=D/tlQgjXAB4nMKA/FtiIDvM7nFaD0RUkXeM/gFAlG8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+17QieR2/Q9tNf/NGnLpg5qaNtYzyFjfbvAQ3XHSlRt6cGkz4yAAZsL+27hkFHy/
 FIuC/g8/gNsLhApaj5JDzfoYTPJ6sDTW2daRezfksRDMDrnN8RIJob0L0Ce3CUVQzv
 FlCaMf58IfY3Re468rdUgMV+IkdUyLxwbBv3SI99OgZlLCqoDmOPxSjhlf2DlinQGS
 Hqi+i5DoBW/G1FtdHIgWD3lTDAt4OaA7KjH14ngK9VS7NIUELAvKnXHDGS9Fd8+wGB
 yF+oc2ceGnIeu0AKPS+yDWyzq5DTx2yRhCCxy9BaMKqSfo6VPROAw/pmOqaZqBB0Nb
 mpICxAdEu1v4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 32/41] drm/amd/display: Use hardware sequencer
 functions for PG control
Date: Fri, 29 Jan 2021 10:37:03 -0500
Message-Id: <20210129153713.1592185-32-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Eric Yang <eric.yang2@amd.com>,
 Anson Jacob <anson.jacob@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit c74f865f14318217350aa33363577cb95b06eb82 ]

[Why & How]
These can differ per ASIC or not be present. Don't call the dcn20 ones
directly but rather the ones defined by the ASIC init table.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Eric Yang <eric.yang2@amd.com>
Acked-by: Anson Jacob <anson.jacob@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 18 ++++++++++++++----
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  9 +++++++--
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index d0f3bf953d027..0d1e7b56fb395 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -646,8 +646,13 @@ static void power_on_plane(
 	if (REG(DC_IP_REQUEST_CNTL)) {
 		REG_SET(DC_IP_REQUEST_CNTL, 0,
 				IP_REQUEST_EN, 1);
-		hws->funcs.dpp_pg_control(hws, plane_id, true);
-		hws->funcs.hubp_pg_control(hws, plane_id, true);
+
+		if (hws->funcs.dpp_pg_control)
+			hws->funcs.dpp_pg_control(hws, plane_id, true);
+
+		if (hws->funcs.hubp_pg_control)
+			hws->funcs.hubp_pg_control(hws, plane_id, true);
+
 		REG_SET(DC_IP_REQUEST_CNTL, 0,
 				IP_REQUEST_EN, 0);
 		DC_LOG_DEBUG(
@@ -1079,8 +1084,13 @@ void dcn10_plane_atomic_power_down(struct dc *dc,
 	if (REG(DC_IP_REQUEST_CNTL)) {
 		REG_SET(DC_IP_REQUEST_CNTL, 0,
 				IP_REQUEST_EN, 1);
-		hws->funcs.dpp_pg_control(hws, dpp->inst, false);
-		hws->funcs.hubp_pg_control(hws, hubp->inst, false);
+
+		if (hws->funcs.dpp_pg_control)
+			hws->funcs.dpp_pg_control(hws, dpp->inst, false);
+
+		if (hws->funcs.hubp_pg_control)
+			hws->funcs.hubp_pg_control(hws, hubp->inst, false);
+
 		dpp->funcs->dpp_reset(dpp);
 		REG_SET(DC_IP_REQUEST_CNTL, 0,
 				IP_REQUEST_EN, 0);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 01530e686f437..f1e9b3b06b924 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1069,8 +1069,13 @@ static void dcn20_power_on_plane(
 	if (REG(DC_IP_REQUEST_CNTL)) {
 		REG_SET(DC_IP_REQUEST_CNTL, 0,
 				IP_REQUEST_EN, 1);
-		dcn20_dpp_pg_control(hws, pipe_ctx->plane_res.dpp->inst, true);
-		dcn20_hubp_pg_control(hws, pipe_ctx->plane_res.hubp->inst, true);
+
+		if (hws->funcs.dpp_pg_control)
+			hws->funcs.dpp_pg_control(hws, pipe_ctx->plane_res.dpp->inst, true);
+
+		if (hws->funcs.hubp_pg_control)
+			hws->funcs.hubp_pg_control(hws, pipe_ctx->plane_res.hubp->inst, true);
+
 		REG_SET(DC_IP_REQUEST_CNTL, 0,
 				IP_REQUEST_EN, 0);
 		DC_LOG_DEBUG(
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
