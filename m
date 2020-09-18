Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B29026EB3D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 04:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D446E43D;
	Fri, 18 Sep 2020 02:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3966E43D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 02:04:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFB6223119;
 Fri, 18 Sep 2020 02:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394658;
 bh=Tgk8NoG7UKEAU7CZc0eOtdFBwmTkUqdurVI9cvXRVsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GHwqQzje3QZqz9MI3Pz1G8+doVOMA4IE34HtudLjZFVKiSOn8whgzdafAObwBTfwK
 xarjPFf/h9IqdxNpivlWT5HMIPhxPSEPW0lFx1gHXlHY2In1BglCrvrWx5AwuDxzLM
 q3/IsaoerC0nQam20sQ3PuY5c3/s3SP/TuAn2u7g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 154/330] drm/amd/display: fix image corruption
 with ODM 2:1 DSC 2 slice
Date: Thu, 17 Sep 2020 21:58:14 -0400
Message-Id: <20200918020110.2063155-154-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Nikola Cornij <Nikola.Cornij@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wenjing Liu <Wenjing.Liu@amd.com>

[ Upstream commit df8e34ac27e8a0d8dce364628226c5619693c3fd ]

[why]
When combining two or more pipes in DSC mode, there will always be more
than 1 slice per line.  In this case, as per DSC rules, the sink device
is expecting that the ICH is reset at the end of each slice line (i.e.
ICH_RESET_AT_END_OF_LINE must be configured based on the number of
slices at the output of ODM).  It is recommended that software set
ICH_RESET_AT_END_OF_LINE = 0xF for each DSC in the ODM combine.  However
the current code only set ICH_RESET_AT_END_OF_LINE = 0xF when number of
slice per DSC engine is greater than 1 instead of number of slice per
output after ODM combine.

[how]
Add is_odm in dsc config. Set ICH_RESET_AT_END_OF_LINE = 0xF if either
is_odm or number of slice per DSC engine is greater than 1.

Signed-off-by: Wenjing Liu <Wenjing.Liu@amd.com>
Reviewed-by: Nikola Cornij <Nikola.Cornij@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c    | 2 ++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c      | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h           | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 5d6cbaebebc03..5641a9477d291 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -400,6 +400,7 @@ void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
 		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
 		dsc_cfg.color_depth = stream->timing.display_color_depth;
+		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
 		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
 		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
 		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
@@ -504,6 +505,7 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable)
 		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
 		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
 		dsc_cfg.color_depth = stream->timing.display_color_depth;
+		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
 		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
 
 		DC_LOG_DSC(" ");
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
index 01040501d40e3..5c45c39662fbb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
@@ -351,6 +351,7 @@ static bool dsc_prepare_config(const struct dsc_config *dsc_cfg, struct dsc_reg_
 	dsc_reg_vals->pps.block_pred_enable = dsc_cfg->dc_dsc_cfg.block_pred_enable;
 	dsc_reg_vals->pps.line_buf_depth = dsc_cfg->dc_dsc_cfg.linebuf_depth;
 	dsc_reg_vals->alternate_ich_encoding_en = dsc_reg_vals->pps.dsc_version_minor == 1 ? 0 : 1;
+	dsc_reg_vals->ich_reset_at_eol = (dsc_cfg->is_odm || dsc_reg_vals->num_slices_h > 1) ? 0xF : 0;
 
 	// TODO: in addition to validating slice height (pic height must be divisible by slice height),
 	// see what happens when the same condition doesn't apply for slice_width/pic_width.
@@ -513,7 +514,6 @@ static void dsc_update_from_dsc_parameters(struct dsc_reg_values *reg_vals, cons
 		reg_vals->pps.rc_buf_thresh[i] = reg_vals->pps.rc_buf_thresh[i] >> 6;
 
 	reg_vals->rc_buffer_model_size = dsc_params->rc_buffer_model_size;
-	reg_vals->ich_reset_at_eol = reg_vals->num_slices_h == 1 ? 0 : 0xf;
 }
 
 static void dsc_write_to_registers(struct display_stream_compressor *dsc, const struct dsc_reg_values *reg_vals)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 05b98eadc2899..bfa01137f8e09 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2275,6 +2275,7 @@ static bool dcn20_validate_dsc(struct dc *dc, struct dc_state *new_ctx)
 				+ stream->timing.v_border_bottom;
 		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
 		dsc_cfg.color_depth = stream->timing.display_color_depth;
+		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
 		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
 		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h
index 1ddb1c6fa1493..75ecfdc5d5cd2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h
@@ -36,6 +36,7 @@ struct dsc_config {
 	uint32_t pic_height;
 	enum dc_pixel_encoding pixel_encoding;
 	enum dc_color_depth color_depth;  /* Bits per component */
+	bool is_odm;
 	struct dc_dsc_config dc_dsc_cfg;
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
