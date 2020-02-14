Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B815DBF4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BB66F98D;
	Fri, 14 Feb 2020 15:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1056F98D;
 Fri, 14 Feb 2020 15:51:55 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E84F924684;
 Fri, 14 Feb 2020 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695514;
 bh=viIBm9b3VhN1DKXhLg9bkTkhgxwWO6/AiWhtmjD5vHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oQOTmkBPTSEP4/OFWA8VOG/I0nbtEgF/+zIl11z3Lirx8sPOCuSkRtSufmV0vEM4l
 7FkavKMI2ZDjMCH1474p6rQH25e4NiERTA/cTGAsYNtIK8bGHhOyCvv1aF5ueqkrZx
 FNOzo3pvV/9pPvbmb8RUKBBNBGhSvFvcIafuHdEw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 138/542] drm/amd/display: Renoir chroma viewport WA
Date: Fri, 14 Feb 2020 10:42:10 -0500
Message-Id: <20200214154854.6746-138-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Eric Yang <Eric.Yang2@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eric Yang <Eric.Yang2@amd.com>

[ Upstream commit 1cad8ff7ecc6b70a062b8e8b74a0cd08c928341d ]

[Why]
For unknown reason, immediate flip with host VM translation on NV12
surface will underflow on last row of PTE.

[How]
Hack chroma viewport height to make fetch one more row of PTE.
Note that this will cause hubp underflow on all video underlay
cases, but the underflow is not user visible since it is in
blank region.

Signed-off-by: Eric Yang <Eric.Yang2@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c | 65 ++++++++++++++++++-
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |  1 +
 3 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 0416a17b0897c..320f4eeebf84c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -417,6 +417,8 @@ struct dc_debug_options {
 	bool cm_in_bypass;
 #endif
 	int force_clock_mode;/*every mode change.*/
+
+	bool nv12_iflip_vm_wa;
 };
 
 struct dc_debug_data {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index 2f5a5867e6749..1ddd6ae221558 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -164,6 +164,69 @@ static void hubp21_setup(
 
 }
 
+void hubp21_set_viewport(
+	struct hubp *hubp,
+	const struct rect *viewport,
+	const struct rect *viewport_c)
+{
+	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
+	int patched_viewport_height = 0;
+	struct dc_debug_options *debug = &hubp->ctx->dc->debug;
+
+	REG_SET_2(DCSURF_PRI_VIEWPORT_DIMENSION, 0,
+		  PRI_VIEWPORT_WIDTH, viewport->width,
+		  PRI_VIEWPORT_HEIGHT, viewport->height);
+
+	REG_SET_2(DCSURF_PRI_VIEWPORT_START, 0,
+		  PRI_VIEWPORT_X_START, viewport->x,
+		  PRI_VIEWPORT_Y_START, viewport->y);
+
+	/*for stereo*/
+	REG_SET_2(DCSURF_SEC_VIEWPORT_DIMENSION, 0,
+		  SEC_VIEWPORT_WIDTH, viewport->width,
+		  SEC_VIEWPORT_HEIGHT, viewport->height);
+
+	REG_SET_2(DCSURF_SEC_VIEWPORT_START, 0,
+		  SEC_VIEWPORT_X_START, viewport->x,
+		  SEC_VIEWPORT_Y_START, viewport->y);
+
+	/*
+	 *	Work around for underflow issue with NV12 + rIOMMU translation
+	 *	+ immediate flip. This will cause hubp underflow, but will not
+	 *	be user visible since underflow is in blank region
+	 */
+	patched_viewport_height = viewport_c->height;
+	if (viewport_c->height != 0 && debug->nv12_iflip_vm_wa) {
+		int pte_row_height = 0;
+		int pte_rows = 0;
+
+		REG_GET(DCHUBP_REQ_SIZE_CONFIG,
+			PTE_ROW_HEIGHT_LINEAR, &pte_row_height);
+
+		pte_row_height = 1 << (pte_row_height + 3);
+		pte_rows = (viewport_c->height + pte_row_height - 1) / pte_row_height;
+		patched_viewport_height = pte_rows * pte_row_height + 3;
+	}
+
+
+	/* DC supports NV12 only at the moment */
+	REG_SET_2(DCSURF_PRI_VIEWPORT_DIMENSION_C, 0,
+		  PRI_VIEWPORT_WIDTH_C, viewport_c->width,
+		  PRI_VIEWPORT_HEIGHT_C, patched_viewport_height);
+
+	REG_SET_2(DCSURF_PRI_VIEWPORT_START_C, 0,
+		  PRI_VIEWPORT_X_START_C, viewport_c->x,
+		  PRI_VIEWPORT_Y_START_C, viewport_c->y);
+
+	REG_SET_2(DCSURF_SEC_VIEWPORT_DIMENSION_C, 0,
+		  SEC_VIEWPORT_WIDTH_C, viewport_c->width,
+		  SEC_VIEWPORT_HEIGHT_C, patched_viewport_height);
+
+	REG_SET_2(DCSURF_SEC_VIEWPORT_START_C, 0,
+		  SEC_VIEWPORT_X_START_C, viewport_c->x,
+		  SEC_VIEWPORT_Y_START_C, viewport_c->y);
+}
+
 void hubp21_set_vm_system_aperture_settings(struct hubp *hubp,
 		struct vm_system_aperture_param *apt)
 {
@@ -211,7 +274,7 @@ static struct hubp_funcs dcn21_hubp_funcs = {
 	.hubp_set_vm_system_aperture_settings = hubp21_set_vm_system_aperture_settings,
 	.set_blank = hubp1_set_blank,
 	.dcc_control = hubp1_dcc_control,
-	.mem_program_viewport = min_set_viewport,
+	.mem_program_viewport = hubp21_set_viewport,
 	.set_cursor_attributes	= hubp2_cursor_set_attributes,
 	.set_cursor_position	= hubp1_cursor_set_position,
 	.hubp_clk_cntl = hubp1_clk_cntl,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index b29b2c99a564e..fe0ed4c09ad0a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -847,6 +847,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 		.scl_reset_length10 = true,
 		.sanity_checks = true,
 		.disable_48mhz_pwrdwn = false,
+		.nv12_iflip_vm_wa = true
 };
 
 static const struct dc_debug_options debug_defaults_diags = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
