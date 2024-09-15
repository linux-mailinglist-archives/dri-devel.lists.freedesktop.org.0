Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DDB979904
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 23:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E2210E0D5;
	Sun, 15 Sep 2024 21:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rosa.ru header.i=@rosa.ru header.b="BUkaGEHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3603 seconds by postgrey-1.36 at gabe;
 Sun, 15 Sep 2024 18:41:01 UTC
Received: from mail.rosa.ru (mail.rosa.ru [176.109.80.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0C10E05A;
 Sun, 15 Sep 2024 18:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=rosa.ru;
 s=mail; bh=AWlzurw8TjVSJHL81PnGiT03F3c0KZ6Bu9J4LY1ExbA=;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 b=BUkaGEHpVeR+imcr5SkWnflzoRg5liO3N7CvuAJEVGFMDlxP3VUuzrA5YLKmJF1OiJ/2ooQbAsr
 rtvjcZWfiWvJSqX2Gu5hJycCU3lIJmw/wotEe791xvLeZ+ixWC8ZW9tL2GJZkWgBWpcjOzpGLBjm4
 7jgxOm+0pzLa25mzTOs=
Received: from [194.9.26.89] (account m.arhipov@rosa.ru HELO
 localhost.localdomain) by mail.rosa.ru (CommuniGate Pro SMTP 6.4.1j)
 with ESMTPSA id 130329; Sun, 15 Sep 2024 20:40:54 +0300
From: Mikhail Arkhipov <m.arhipov@rosa.ru>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Mikhail Arkhipov <m.arhipov@rosa.ru>, Jake Wang <haonan.wang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wenjing Liu <wenjing.liu@amd.com>,
 Swapnil Patel <swapnil.patel@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 lvc-patches@linuxtesting.org
Subject: [PATCH] drm/amd/display: Add NULL check for panel_cntl in
 dce110_edp_backlight_control
Date: Sun, 15 Sep 2024 20:40:50 +0300
Message-Id: <20240915174050.78956-1-m.arhipov@rosa.ru>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Sep 2024 21:01:21 +0000
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

If link->panel_cntl is NULL, the function dce110_edp_backlight_control
attempts to dereference it at line 1019, leading to a potential NULL
pointer dereference and a kernel crash.

This bug can manifest when the eDP panel is not correctly configured
or initialized during certain power or display state transitions,
leaving link->panel_cntl unset or NULL. In such cases, the dereference
of a NULL pointer can result in an immediate kernel panic or
system instability.

Add a NULL check for link->panel_cntl before using it. Ensure that
the function safely returns if link->panel_cntl is not properly set,
preventing any attempts to dereference a NULL pointer and avoiding
potential crashes.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 06ddcee49a35 ("drm/amd/display: Added multi instance support for panel control")
Signed-off-by: Mikhail Arkhipov <m.arhipov@rosa.ru>
---
 .../display/dc/dce110/dce110_hw_sequencer.c   | 50 ++++++++++---------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 508f5fe26848..1269628a4014 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1016,32 +1016,34 @@ void dce110_edp_backlight_control(
 	 */
 	/* dc_service_sleep_in_milliseconds(50); */
 		/*edp 1.2*/
-	panel_instance = link->panel_cntl->inst;
+	if (link->panel_cntl) {
+		panel_instance = link->panel_cntl->inst;
 
-	if (cntl.action == TRANSMITTER_CONTROL_BACKLIGHT_ON) {
-		if (!link->dc->config.edp_no_power_sequencing)
-		/*
-		 * Sometimes, DP receiver chip power-controlled externally by an
-		 * Embedded Controller could be treated and used as eDP,
-		 * if it drives mobile display. In this case,
-		 * we shouldn't be doing power-sequencing, hence we can skip
-		 * waiting for T7-ready.
-		 */
-			edp_receiver_ready_T7(link);
-		else
-			DC_LOG_DC("edp_receiver_ready_T7 skipped\n");
-	}
+		if (cntl.action == TRANSMITTER_CONTROL_BACKLIGHT_ON) {
+			if (!link->dc->config.edp_no_power_sequencing)
+				/*
+				 * Sometimes, DP receiver chip power-controlled externally by an
+				 * Embedded Controller could be treated and used as eDP,
+				 * if it drives mobile display. In this case,
+				 * we shouldn't be doing power-sequencing, hence we can skip
+				 * waiting for T7-ready.
+				 */
+				edp_receiver_ready_T7(link);
+			else
+				DC_LOG_DC("edp_receiver_ready_T7 skipped\n");
+		}
 
-	if (ctx->dc->ctx->dmub_srv &&
-			ctx->dc->debug.dmub_command_table) {
-		if (cntl.action == TRANSMITTER_CONTROL_BACKLIGHT_ON)
-			ctx->dc_bios->funcs->enable_lvtma_control(ctx->dc_bios,
-					LVTMA_CONTROL_LCD_BLON,
-					panel_instance);
-		else
-			ctx->dc_bios->funcs->enable_lvtma_control(ctx->dc_bios,
-					LVTMA_CONTROL_LCD_BLOFF,
-					panel_instance);
+		if (ctx->dc->ctx->dmub_srv &&
+				ctx->dc->debug.dmub_command_table) {
+			if (cntl.action == TRANSMITTER_CONTROL_BACKLIGHT_ON)
+				ctx->dc_bios->funcs->enable_lvtma_control(ctx->dc_bios,
+						LVTMA_CONTROL_LCD_BLON,
+						panel_instance);
+			else
+				ctx->dc_bios->funcs->enable_lvtma_control(ctx->dc_bios,
+						LVTMA_CONTROL_LCD_BLOFF,
+						panel_instance);
+		}
 	}
 
 	link_transmitter_control(ctx->dc_bios, &cntl);
-- 
2.39.3 (Apple Git-146)

