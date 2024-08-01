Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C368943A88
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8168C10E74A;
	Thu,  1 Aug 2024 00:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KEb0rqN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC1410E756;
 Thu,  1 Aug 2024 00:16:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8ED1611D7;
 Thu,  1 Aug 2024 00:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94452C32786;
 Thu,  1 Aug 2024 00:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471378;
 bh=Ql4idpPEwSG2odetp/Oqw0NEhP/uQ2tRKugeqUNQb6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KEb0rqN5XhFd4W+w3dY3rv+z52yZfdEvSDeRX2TzfDkXWUZyUnLZA0OOlYin66Adg
 TBrBFBkAkI8EOcFfu6nhBwivSYkcOMM6RbsGwkrHhB2Z63kAYlMzmlW5BgJDhOrL+Z
 shcFrZ7wflHmy46yWDqprU1VAlS5OSJows5AoZgg0bbSTLWWTJa8clNcgZdHIA0B5Q
 ELIkh3hQnt2CnPTXkohw1ll7kCoykp3J585VGeA52M274IZGPbhsC0Q8GopMxdKB5K
 rJUt/iwU9c7n/0p42y3rXtSajFuZwhBMEI85C0GWVrWhZ8BPNbP0J7QAJWk7t4Bneq
 f/PRWgLviZ+Sw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, chuchang@amd.com, jun.lei@amd.com,
 nicholas.kazlauskas@amd.com, camille.cho@amd.com, lewis.huang@amd.com,
 anthony.koo@amd.com, srinivasan.shanmugam@amd.com, wayne.lin@amd.com,
 dan.carpenter@linaro.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 079/121] drm/amd/display: Avoid overflow from
 uint32_t to uint8_t
Date: Wed, 31 Jul 2024 20:00:17 -0400
Message-ID: <20240801000834.3930818-79-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit d6b54900c564e35989cf6813e4071504fa0a90e0 ]

[WHAT & HOW]
dmub_rb_cmd's ramping_boundary has size of uint8_t and it is assigned
0xFFFF. Fix it by changing it to uint8_t with value of 0xFF.

This fixes 2 INTEGER_OVERFLOW issues reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c       | 2 +-
 drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
index b851fc65f5b7c..5c2d6642633d9 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
@@ -258,7 +258,7 @@ bool dmub_abm_set_pipe(struct abm *abm,
 {
 	union dmub_rb_cmd cmd;
 	struct dc_context *dc = abm->ctx;
-	uint32_t ramping_boundary = 0xFFFF;
+	uint8_t ramping_boundary = 0xFF;
 
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.abm_set_pipe.header.type = DMUB_CMD__ABM;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
index 804be977ea47b..3de65a9f0e6f2 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
@@ -142,7 +142,7 @@ static bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst,
 {
 	union dmub_rb_cmd cmd;
 	struct dc_context *dc = abm->ctx;
-	uint32_t ramping_boundary = 0xFFFF;
+	uint8_t ramping_boundary = 0xFF;
 
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.abm_set_pipe.header.type = DMUB_CMD__ABM;
-- 
2.43.0

