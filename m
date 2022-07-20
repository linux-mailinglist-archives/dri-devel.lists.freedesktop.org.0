Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B557BE9A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295971135ED;
	Wed, 20 Jul 2022 19:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3971134AA;
 Wed, 20 Jul 2022 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/nouKVUzMb+rZjg387fCwDO3Xe+7KUnQQHKIIjVcVKI=; b=aOcfLHwaeuC+VGbWcg/6DgHzki
 0LX52RwTaTI4tLeQAMsBrwiLfReCSSOyLX1ffhQ8pCOI/a9Sdi9FLmPidlAkyW/k5vgNu3g5IkVGh
 XjniY9QWgELhRVrdPKpAgD24aNLvPsIkY6NuHDfxZoZ6xC6P6VefljwNb0vj/O9UPnmQXo4wf2Kg1
 CF3K3l4daauf+OnxZIjXze4uvke1eBTKUQVcrj6d0djxLkoHRiiwDfzMGh0phfQTy/L6bnG8yO60A
 S3FIK+DoUqWrT2kZLR78/wc80BwZiP5PCiZLzx/P28aQuYJrVBbvZ5E0V5ZqUymxNaiuilsQZSagO
 3Ydmzuhw==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEFRQ-000fxI-N0; Wed, 20 Jul 2022 21:33:04 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/5] drm/amd/display: fix soft-fp vs hard-fp on DCN 3.1 family
 for powerpc
Date: Wed, 20 Jul 2022 18:32:04 -0100
Message-Id: <20220720193208.1131493-2-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720193208.1131493-1-mwen@igalia.com>
References: <20220720193208.1131493-1-mwen@igalia.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move remaining FPU code to DML folder that caused compilation error for
powerpc. This patch depends on [1] to prevent the error below:

/gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o uses soft float
/gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
/gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o uses soft float
/gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
/gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o uses soft float
/gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o

[1] https://lore.kernel.org/amd-gfx/20220716195144.342960-1-mwen@igalia.com/

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c |  5 +++--
 .../gpu/drm/amd/display/dc/dcn315/dcn315_resource.c   |  5 +++--
 .../gpu/drm/amd/display/dc/dcn316/dcn316_resource.c   |  5 +++--
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 11 +++++++++++
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |  3 +++
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 178d40c0d70a..929b712cbada 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -1663,11 +1663,12 @@ int dcn31_populate_dml_pipes_from_context(
 		pipes[pipe_cnt].pipe.src.immediate_flip = true;
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
 		pipes[pipe_cnt].pipe.src.gpuvm = true;
-		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
-		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
 		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
 		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
+		DC_FP_START();
+		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
+		DC_FP_END();
 
 		if (dc->debug.dml_hostvm_override == DML_HOSTVM_NO_OVERRIDE)
 			pipes[pipe_cnt].pipe.src.hostvm = dc->res_pool->hubbub->riommu_active;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
index df2abd8fe2eb..1a5f5977f962 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
@@ -1658,11 +1658,12 @@ static int dcn315_populate_dml_pipes_from_context(
 
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
 		pipes[pipe_cnt].pipe.src.gpuvm = true;
-		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
-		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
 		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
 		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
+		DC_FP_START();
+		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
+		DC_FP_END();
 
 		if (pipes[pipe_cnt].dout.dsc_enable) {
 			switch (timing->display_color_depth) {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
index 070fe10a004e..53dea466348f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
@@ -1661,11 +1661,12 @@ static int dcn316_populate_dml_pipes_from_context(
 
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
 		pipes[pipe_cnt].pipe.src.gpuvm = true;
-		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
-		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
 		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
 		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
+		DC_FP_START();
+		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
+		DC_FP_END();
 
 		if (pipes[pipe_cnt].dout.dsc_enable) {
 			switch (timing->display_color_depth) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index facac3daeaca..e36cfa5985ea 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -435,8 +435,19 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
 	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
 };
 
+void dcn31_zero_pipe_dcc_fraction(display_e2e_pipe_params_st *pipes,
+				  int pipe_cnt)
+{
+	dc_assert_fp_enabled();
+
+	pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
+	pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
+}
+
 void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
 {
+	dc_assert_fp_enabled();
+
 	if (dc->clk_mgr->bw_params->wm_table.entries[WM_A].valid) {
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].pstate_latency_us;
 		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_enter_plus_exit_time_us;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
index 0a10de80c1a4..4372f17b55d4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
@@ -31,6 +31,9 @@
 #define DCN3_15_MIN_COMPBUF_SIZE_KB 128
 #define DCN3_16_DEFAULT_DET_SIZE 192
 
+void dcn31_zero_pipe_dcc_fraction(display_e2e_pipe_params_st *pipes,
+				  int pipe_cnt);
+
 void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
 
 void dcn31_calculate_wm_and_dlg_fp(
-- 
2.35.1

