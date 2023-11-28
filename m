Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036AD7FC0D2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D91610E2C0;
	Tue, 28 Nov 2023 17:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564C010E591;
 Tue, 28 Nov 2023 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KZh3ndq0U9pwMTmGIthUZp+jUYfjwcrU1VxM+4cdg8c=; b=Aq5sk3vLmnZnk+UeqV2JcblQZx
 PN1cwJ9D7YbOMHAXaHjiaQrrSQAhtWixDMxw7dC6B6j1GI6B8GQ0gDtUPbgVjlwVEHRA5I33b49/e
 Xz0bydPX9T5SXoVTOx6srrxBqe0874a7Jyem11LzztKwstQT0+h7VOo6K7pp+wJK6kAGktGR32XMl
 Hiw8mows6Ur6tMwsdDShKKqo5I7UPp1v54uNoYAF/TjnOgh5+zlTNNhAaXHwfTynSBOcFYggItavR
 /9sEd60bBxqZgagUJ514Vc80a9C51W0+sEZ0xYXbFebZE2LBwO5j4QSv8MBiUf3X+svfq6HFK8+dS
 aKwg4ZOg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82K0-0087Bf-4V; Tue, 28 Nov 2023 18:56:32 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 3/9] drm/amd/display: read gamut remap matrix in
 fixed-point 31.32 format
Date: Tue, 28 Nov 2023 16:52:51 -0100
Message-ID: <20231128175623.121356-4-mwen@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128175623.121356-1-mwen@igalia.com>
References: <20231128175623.121356-1-mwen@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of read gamut remap data from hw values, convert HW register
values (S2D13) into a fixed-point 31.32 matrix for color state log.
Change DCN10 log to print data in the format of the gamut remap matrix.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 38 +++++++++++++------
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  3 ++
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 9b801488eb9d..f0a9f8818909 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -289,20 +289,26 @@ static void dcn10_log_color_state(struct dc *dc,
 	struct resource_pool *pool = dc->res_pool;
 	int i;
 
-	DTN_INFO("DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode"
-			"  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   "
-			"C31 C32   C33 C34\n");
+	DTN_INFO("DPP:    IGAM format    IGAM mode    DGAM mode    RGAM mode"
+		 "  GAMUT adjust  "
+		 "C11        C12        C13        C14        "
+		 "C21        C22        C23        C24        "
+		 "C31        C32        C33        C34        \n");
 	for (i = 0; i < pool->pipe_count; i++) {
 		struct dpp *dpp = pool->dpps[i];
 		struct dcn_dpp_state s = {0};
 
 		dpp->funcs->dpp_read_state(dpp, &s);
+		dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
 
 		if (!s.is_enabled)
 			continue;
 
-		DTN_INFO("[%2d]:  %11xh  %-11s  %-11s  %-11s"
-				"%8x    %08xh %08xh %08xh %08xh %08xh %08xh",
+		DTN_INFO("[%2d]:  %11xh  %11s    %9s    %9s"
+			 "  %12s  "
+			 "%010lld %010lld %010lld %010lld "
+			 "%010lld %010lld %010lld %010lld "
+			 "%010lld %010lld %010lld %010lld",
 				dpp->inst,
 				s.igam_input_format,
 				(s.igam_lut_mode == 0) ? "BypassFixed" :
@@ -322,13 +328,21 @@ static void dcn10_log_color_state(struct dc *dc,
 					((s.rgam_lut_mode == 3) ? "RAM" :
 					((s.rgam_lut_mode == 4) ? "RAM" :
 								 "Unknown")))),
-				s.gamut_remap_mode,
-				s.gamut_remap_c11_c12,
-				s.gamut_remap_c13_c14,
-				s.gamut_remap_c21_c22,
-				s.gamut_remap_c23_c24,
-				s.gamut_remap_c31_c32,
-				s.gamut_remap_c33_c34);
+				(s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
+					((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
+										  "SW"),
+				s.gamut_remap.temperature_matrix[0].value,
+				s.gamut_remap.temperature_matrix[1].value,
+				s.gamut_remap.temperature_matrix[2].value,
+				s.gamut_remap.temperature_matrix[3].value,
+				s.gamut_remap.temperature_matrix[4].value,
+				s.gamut_remap.temperature_matrix[5].value,
+				s.gamut_remap.temperature_matrix[6].value,
+				s.gamut_remap.temperature_matrix[7].value,
+				s.gamut_remap.temperature_matrix[8].value,
+				s.gamut_remap.temperature_matrix[9].value,
+				s.gamut_remap.temperature_matrix[10].value,
+				s.gamut_remap.temperature_matrix[11].value);
 		DTN_INFO("\n");
 	}
 	DTN_INFO("\n");
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index 597ebdb4da4c..b6acfd86642a 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -141,6 +141,7 @@ struct dcn_dpp_state {
 	uint32_t igam_input_format;
 	uint32_t dgam_lut_mode;
 	uint32_t rgam_lut_mode;
+	// gamut_remap data for dcn10_get_cm_states()
 	uint32_t gamut_remap_mode;
 	uint32_t gamut_remap_c11_c12;
 	uint32_t gamut_remap_c13_c14;
@@ -148,6 +149,8 @@ struct dcn_dpp_state {
 	uint32_t gamut_remap_c23_c24;
 	uint32_t gamut_remap_c31_c32;
 	uint32_t gamut_remap_c33_c34;
+	// gamut_remap data for dcn*_log_color_state()
+	struct dpp_grph_csc_adjustment gamut_remap;
 };
 
 struct CM_bias_params {
-- 
2.42.0

