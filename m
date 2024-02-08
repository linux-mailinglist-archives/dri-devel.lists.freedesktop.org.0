Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F52284E0C8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 13:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52A910E02C;
	Thu,  8 Feb 2024 12:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F70A10E02C;
 Thu,  8 Feb 2024 12:37:19 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 8 Feb
 2024 15:37:15 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 8 Feb 2024
 15:37:15 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Harry Wentland <harry.wentland@amd.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Leon Huang
 <Leon.Huang1@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/amd/display: Fix missing NULL check in
 dcn21_set_backlight_level()
Date: Thu, 8 Feb 2024 04:37:11 -0800
Message-ID: <20240208123711.52333-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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

On the off chance 'panel_cntl' ends up being not properly initialized,
dcn21_set_backlight_level() may hit NULL pointer dereference while
changing embedded panel backlight levels.

Prevent this issue by using some of the existing checks for the
similar purpose. At the same time clean up redundant tests for
NULL in 'abm'.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 6f0ef80a00ad ("drm/amd/display: Fix ABM pipe/backlight issues when change backlight")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
index 8e88dcaf88f5..2b1b580541a8 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
@@ -247,7 +247,7 @@ bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
 	if (abm != NULL) {
 		uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
 
-		if (abm && panel_cntl) {
+		if (panel_cntl) {
 			if (abm->funcs && abm->funcs->set_pipe_ex) {
 				abm->funcs->set_pipe_ex(abm,
 						otg_inst,
@@ -261,15 +261,16 @@ bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
 							panel_cntl->inst,
 							panel_cntl->pwrseq_inst);
 			}
+
+			if (abm->funcs && abm->funcs->set_backlight_level_pwm)
+				abm->funcs->set_backlight_level_pwm(abm, backlight_pwm_u16_16,
+					frame_ramp, 0, panel_cntl->inst);
+			else
+				dmub_abm_set_backlight(dc, backlight_pwm_u16_16, frame_ramp,
+					panel_cntl->inst);
 		}
 	}
 
-	if (abm && abm->funcs && abm->funcs->set_backlight_level_pwm)
-		abm->funcs->set_backlight_level_pwm(abm, backlight_pwm_u16_16,
-			frame_ramp, 0, panel_cntl->inst);
-	else
-		dmub_abm_set_backlight(dc, backlight_pwm_u16_16, frame_ramp, panel_cntl->inst);
-
 	return true;
 }
 
