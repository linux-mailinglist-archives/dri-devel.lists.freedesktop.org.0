Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF7BE26B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D8F10E984;
	Thu, 16 Oct 2025 09:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Eqg+OEFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DCC10E984;
 Thu, 16 Oct 2025 09:35:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 325D54613E;
 Thu, 16 Oct 2025 09:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB67FC4CEF9;
 Thu, 16 Oct 2025 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760607301;
 bh=JWIe+sI4o3Oq1oewunL/frF8K8c+rwmVNRPd6XnFqZQ=;
 h=Subject:To:Cc:From:Date:From;
 b=Eqg+OEFL7gqO4T5SSI4fMCea1XMabLHJX/cvM/h5+EMs5xOSJNIS+Ts/jyTFgcLXj
 qPrEriPmNKx3FkXZV2Q/PXHTXX+9TJXMBRvU2Unq3f3cQ6ADOxp79jc5FDVsPNQL/4
 xYVf/VTPmWCjuW+x8w1X4yntDxPq5fSj4Cdfsr3U=
Subject: Patch "drm/amd/display: Fix unsafe uses of kernel mode FPU" has been
 added to the 6.17-stable tree
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, ardb@kernel.org,
 austin.zheng@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 harry.wentland@amd.com, jun.lei@amd.com, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 16 Oct 2025 11:34:27 +0200
Message-ID: <2025101627-gecko-sugar-139d@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/amd/display: Fix unsafe uses of kernel mode FPU

to the 6.17-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-fix-unsafe-uses-of-kernel-mode-fpu.patch
and it can be found in the queue-6.17 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ddbfac152830e38d488ff8e45ab7eaf5d72f8527 Mon Sep 17 00:00:00 2001
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 2 Oct 2025 23:00:45 +0200
Subject: drm/amd/display: Fix unsafe uses of kernel mode FPU
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ard Biesheuvel <ardb@kernel.org>

commit ddbfac152830e38d488ff8e45ab7eaf5d72f8527 upstream.

The point of isolating code that uses kernel mode FPU in separate
compilation units is to ensure that even implicit uses of, e.g., SIMD
registers for spilling occur only in a context where this is permitted,
i.e., from inside a kernel_fpu_begin/end block.

This is important on arm64, which uses -mgeneral-regs-only to build all
kernel code, with the exception of such compilation units where FP or
SIMD registers are expected to be used. Given that the compiler may
invent uses of FP/SIMD anywhere in such a unit, none of its code may be
accessible from outside a kernel_fpu_begin/end block.

This means that all callers into such compilation units must use the
DC_FP start/end macros, which must not occur there themselves. For
robustness, all functions with external linkage that reside there should
call dc_assert_fp_enabled() to assert that the FPU context was set up
correctly.

Fix this for the DCN35, DCN351 and DCN36 implementations.

Cc: Austin Zheng <austin.zheng@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c             |    4 ++
 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c             |    6 ++-
 drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c           |    4 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c   |   16 ++++++++-
 drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c |   17 +++++++++-
 drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c   |   16 ++++++++-
 6 files changed, 56 insertions(+), 7 deletions(-)

--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -808,6 +808,8 @@ void dcn316_update_bw_bounding_box(struc
 
 int dcn_get_max_non_odm_pix_rate_100hz(struct _vcs_dpi_soc_bounding_box_st *soc)
 {
+	dc_assert_fp_enabled();
+
 	return soc->clock_limits[0].dispclk_mhz * 10000.0 / (1.0 + soc->dcn_downspread_percent / 100.0);
 }
 
@@ -815,6 +817,8 @@ int dcn_get_approx_det_segs_required_for
 		struct _vcs_dpi_soc_bounding_box_st *soc,
 		int pix_clk_100hz, int bpp, int seg_size_kb)
 {
+	dc_assert_fp_enabled();
+
 	/* Roughly calculate required crb to hide latency. In practice there is slightly
 	 * more buffer available for latency hiding
 	 */
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -445,6 +445,8 @@ int dcn35_populate_dml_pipes_from_contex
 	bool upscaled = false;
 	const unsigned int max_allowed_vblank_nom = 1023;
 
+	dc_assert_fp_enabled();
+
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
 					      validate_mode);
 
@@ -498,9 +500,7 @@ int dcn35_populate_dml_pipes_from_contex
 
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
 
-		DC_FP_START();
 		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
-		DC_FP_END();
 
 		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
@@ -581,6 +581,8 @@ void dcn35_decide_zstate_support(struct
 	unsigned int i, plane_count = 0;
 	DC_LOGGER_INIT(dc->ctx->logger);
 
+	dc_assert_fp_enabled();
+
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		if (context->res_ctx.pipe_ctx[i].plane_state)
 			plane_count++;
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
@@ -478,6 +478,8 @@ int dcn351_populate_dml_pipes_from_conte
 	bool upscaled = false;
 	const unsigned int max_allowed_vblank_nom = 1023;
 
+	dc_assert_fp_enabled();
+
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
 					      validate_mode);
 
@@ -531,9 +533,7 @@ int dcn351_populate_dml_pipes_from_conte
 
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
 
-		DC_FP_START();
 		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
-		DC_FP_END();
 
 		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1760,6 +1760,20 @@ enum dc_status dcn35_patch_unknown_plane
 }
 
 
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret = dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, validate_mode);
+	DC_FP_END();
+
+	return ret;
+}
+
 static struct resource_funcs dcn35_res_pool_funcs = {
 	.destroy = dcn35_destroy_resource_pool,
 	.link_enc_create = dcn35_link_encoder_create,
@@ -1770,7 +1784,7 @@ static struct resource_funcs dcn35_res_p
 	.validate_bandwidth = dcn35_validate_bandwidth,
 	.calculate_wm_and_dlg = NULL,
 	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes = dcn35_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes = populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
 	.release_pipe = dcn20_release_pipe,
 	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1732,6 +1732,21 @@ static enum dc_status dcn351_validate_ba
 	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 }
 
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret = dcn351_populate_dml_pipes_from_context_fpu(dc, context, pipes, validate_mode);
+	DC_FP_END();
+
+	return ret;
+
+}
+
 static struct resource_funcs dcn351_res_pool_funcs = {
 	.destroy = dcn351_destroy_resource_pool,
 	.link_enc_create = dcn35_link_encoder_create,
@@ -1742,7 +1757,7 @@ static struct resource_funcs dcn351_res_
 	.validate_bandwidth = dcn351_validate_bandwidth,
 	.calculate_wm_and_dlg = NULL,
 	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes = dcn351_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes = populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
 	.release_pipe = dcn20_release_pipe,
 	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
@@ -1734,6 +1734,20 @@ static enum dc_status dcn35_validate_ban
 }
 
 
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret = dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, validate_mode);
+	DC_FP_END();
+
+	return ret;
+}
+
 static struct resource_funcs dcn36_res_pool_funcs = {
 	.destroy = dcn36_destroy_resource_pool,
 	.link_enc_create = dcn35_link_encoder_create,
@@ -1744,7 +1758,7 @@ static struct resource_funcs dcn36_res_p
 	.validate_bandwidth = dcn35_validate_bandwidth,
 	.calculate_wm_and_dlg = NULL,
 	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes = dcn35_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes = populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
 	.release_pipe = dcn20_release_pipe,
 	.add_stream_to_ctx = dcn30_add_stream_to_ctx,


Patches currently in stable-queue which might be from ardb@kernel.org are

queue-6.17/kbuild-add-.rel.-strip-pattern-for-vmlinux.patch
queue-6.17/kbuild-restore-pattern-to-avoid-stripping-.rela.dyn-.patch
queue-6.17/drm-amd-display-fix-unsafe-uses-of-kernel-mode-fpu.patch
