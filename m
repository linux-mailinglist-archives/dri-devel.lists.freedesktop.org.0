Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0831BD818
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5286E457;
	Wed, 29 Apr 2020 09:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A68B6E457;
 Wed, 29 Apr 2020 09:22:19 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MfpKZ-1iwc612wNl-00gGTR; Wed, 29 Apr 2020 11:22:12 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] [v2] amdgpu: fix gcc-4.8 build warnings
Date: Wed, 29 Apr 2020 11:20:42 +0200
Message-Id: <20200429092207.4049268-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:x/Y2ttaKh8S4oSIHZuCcQJcIg3m35dCZcGbCfqBWDyKe6L/H8TJ
 iPhHhkmD0/Z8JCtJuJf/MsKD9MwsTLHZilEXd/MEpqujXLEE8A0Hth9nRUfolyRtw5enShd
 GFPbhOprj+sG0VfzyOhbSt4cUDkdQlz6u50FUMimF7FA1zPPx+xPL4b6jJnRjD9ooD+EexR
 yjN45AdLttxbasdfJXE2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I1U8bIBgt5Q=:nkG5R3DDKbefs9Nak+vMK6
 cKgQSJAkcHCdprpBC7yP13QN2c9q/MiSM5Z+2gK9wGVeVxnuaLV9rPlsFeg+M1aRSDka18+b5
 rlB1toFZr/DyMbAhyRvI/SE/ADwvLNVGSfNOEoURqsGxyqbDVdZkgCSctUdDLW1vp2ERR6T47
 zQbQSWD5M4PPyeEI2M/TDMNYmt1Hwy0FdbHBSJLFFhnMOkAQiRJihxT1G7ClG1PkGmqooZN6z
 U40AM2vhrSmq7mTjwF0uaWYpwZf1NuH82QY3Xhk6FI/fHl4HQG3Qh9/nssqueZd4crncAzkh8
 yNZ2yHrFckogPSoKDOFJof2EUv6jVNa3EoDg1isG5GK5IjZN655Vawq1zHiBEdhiTctoeNpGs
 2Mu73KqlJ6mTYMc9v1/QYZSdEjQZxCXhSRmCSNLCAUqS/0l3kvanXVAkSBbnQAejp7cmr+wzX
 w1Cs+WYtYw2N86/1fb3aiZu0ZwrimHm/O84twtXk3B81mi9q2uoLBbx4qMSX4k/bS0QU0jTd6
 Mygb15AI8Ex/ez3NKxMa34bEfantpSnO7tBOzR6INDWUDBQpuFxvP0WLnFOApmzh4VVeJsEGx
 lKXJIXPnzYLJS4NZgYBeYTECob5SSANv5HmtDsB6UI/WLPynMCC+JpTY7P5ly1Kl1uAgkegU8
 fbcr5GaJVGVV0Gktsn+qJIz2v1ZTNsizde5/ZnyDkAIRGlNuh+kqyi3+T3d5iPbQdFpmwIKC3
 piLUsUmeVJrZrMJNDduRDuRS/U1cPDnicQAATdHXbKrC+ZrC9rJ8mUvcf9ZCTEYoJdCAQ7Lkl
 YzWYa2T4vCyN4hwJloNemuIQgbuiNjB5NbCnNbZdxvZZCi/hCM=
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
Cc: Arnd Bergmann <arnd@arndb.de>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Older compilers warn about initializers with incorrect curly
braces:

drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
drivers/gpu/drm/drm_dp_mst_topology.c:5497:9: error: missing braces around initializer [-Werror=missing-braces]
  struct drm_dp_desc desc = { 0 };
         ^

Change all instances in the amd gpu driver to using the GNU empty
initializer extension.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: some context changes linux-next stopped yesterday's patch from
applying today.
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c        | 2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c          | 6 +++---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c         | 6 +++---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c     | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c         | 6 +++---
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7f4417981bff..81ce3103d751 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8695,7 +8695,7 @@ bool amdgpu_dm_psr_enable(struct dc_stream_state *stream)
 {
 	struct dc_link *link = stream->link;
 	unsigned int vsync_rate_hz = 0;
-	struct dc_static_screen_params params = {0};
+	struct dc_static_screen_params params = { };
 	/* Calculate number of static frames before generating interrupt to
 	 * enter PSR.
 	 */
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 37fa7b48250e..5484a316eaa8 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -294,7 +294,7 @@ static enum bp_result bios_parser_get_i2c_info(struct dc_bios *dcb,
 	struct atom_display_object_path_v2 *object;
 	struct atom_common_record_header *header;
 	struct atom_i2c_record *record;
-	struct atom_i2c_record dummy_record = {0};
+	struct atom_i2c_record dummy_record = { };
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
 
 	if (!info)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 24c5765890fa..ee3ef5094fd1 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -698,7 +698,7 @@ void rn_clk_mgr_construct(
 		struct dccg *dccg)
 {
 	struct dc_debug_options *debug = &ctx->dc->debug;
-	struct dpm_clocks clock_table = { 0 };
+	struct dpm_clocks clock_table = { };
 
 	clk_mgr->base.ctx = ctx;
 	clk_mgr->base.funcs = &dcn21_funcs;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 9ef9e50a34fa..7cbfe740a947 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2683,9 +2683,9 @@ static void dp_test_send_link_test_pattern(struct dc_link *link)
 
 static void dp_test_get_audio_test_data(struct dc_link *link, bool disable_video)
 {
-	union audio_test_mode            dpcd_test_mode = {0};
-	struct audio_test_pattern_type   dpcd_pattern_type = {0};
-	union audio_test_pattern_period  dpcd_pattern_period[AUDIO_CHANNELS_COUNT] = {0};
+	union audio_test_mode            dpcd_test_mode = { };
+	struct audio_test_pattern_type   dpcd_pattern_type = { };
+	union audio_test_pattern_period  dpcd_pattern_period[AUDIO_CHANNELS_COUNT] = { };
 	enum dp_test_pattern test_pattern = DP_TEST_PATTERN_AUDIO_OPERATOR_DEFINED;
 
 	struct pipe_ctx *pipes = link->dc->current_state->res_ctx.pipe_ctx;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 84d7ac5dd206..dfa541f0b0d3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -1253,9 +1253,9 @@ void hubp2_validate_dml_output(struct hubp *hubp,
 		struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr)
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
-	struct _vcs_dpi_display_rq_regs_st rq_regs = {0};
-	struct _vcs_dpi_display_dlg_regs_st dlg_attr = {0};
-	struct _vcs_dpi_display_ttu_regs_st ttu_attr = {0};
+	struct _vcs_dpi_display_rq_regs_st rq_regs = { };
+	struct _vcs_dpi_display_dlg_regs_st dlg_attr = { };
+	struct _vcs_dpi_display_ttu_regs_st ttu_attr = { };
 	DC_LOGGER_INIT(ctx->logger);
 	DC_LOG_DEBUG("DML Validation | Running Validation");
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 60ea499c1ca8..beea5e129c24 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -449,7 +449,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc = {
 	.use_urgent_burst_bw = 0
 };
 
-struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc = { 0 };
+struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc = { };
 
 #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
 	#define mmDP0_DP_DPHY_INTERNAL_CTRL		0x210f
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index 960a0716dde5..4aae6fb333bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -365,9 +365,9 @@ void hubp21_validate_dml_output(struct hubp *hubp,
 		struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr)
 {
 	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
-	struct _vcs_dpi_display_rq_regs_st rq_regs = {0};
-	struct _vcs_dpi_display_dlg_regs_st dlg_attr = {0};
-	struct _vcs_dpi_display_ttu_regs_st ttu_attr = {0};
+	struct _vcs_dpi_display_rq_regs_st rq_regs = { };
+	struct _vcs_dpi_display_dlg_regs_st dlg_attr = { };
+	struct _vcs_dpi_display_ttu_regs_st ttu_attr = { };
 	DC_LOGGER_INIT(ctx->logger);
 	DC_LOG_DEBUG("DML Validation | Running Validation");
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
