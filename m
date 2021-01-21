Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4442FE286
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 07:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49476E8D3;
	Thu, 21 Jan 2021 06:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57656E8D3;
 Thu, 21 Jan 2021 06:17:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g3so995172ejb.6;
 Wed, 20 Jan 2021 22:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sj1fxi0fYGmr5uEUa2kZMEOeKSig/rU6Pc/peHlQO54=;
 b=jdJlW2V4XzzLQDZ1hEqCghWr6rvJ0M1DknoGlCIv9tCzXFwlPVcKTmybhmt3jxVJZJ
 1jsLpFUTSSOGTMNt5NfCyoIJgr9MLC0vw1vrY6YfvfaOoTErCEmbPzlRQxVi6PCgkqrZ
 cfR4R3de4n6okwH614/aSdbvC5ar79peeP604YvFEOMCs79kxGutveNukoPlNK/rUncz
 zIulvsOVa13/Ji4X0HgLbiqT8Qa/qJw32ytXf0f9h7aepDuvcvS7xaVpb0RVOvn1KnSx
 MklxTKP2djivi5AvIVzSLhBxRw6sGS3OhzwpbHbuR1oooHbEG8wkU5WwKaXg2wPFNst/
 YPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sj1fxi0fYGmr5uEUa2kZMEOeKSig/rU6Pc/peHlQO54=;
 b=iktKrn0UZ7aejJcx7Avrgm5XS2WYaPzKQZyPaeVxrVE/4aHQYqdtJbP3FoR0JVgB+D
 zBT7E4qszTmntPFVYn1e3FcsoVDNJNFFzjosSCkqn1sN+P4VX/eVkdVdlonZnaNgiQ90
 lEM/JDKYW1ADc4I+ORuzGK/08UbmJV9GA3/P51UTxfPoKwBrzz4mH75xsdVPkAcMCL9j
 /s1svHAg1GrRzQlmSs3iJa3dHMY8Bg7MKZgAYhtGHV/KjJizZIQSuU+XOSZuTV5Nicjz
 ZI8aisU6DQ1hdohPTn+xRLRcStiGhz22gT3EQA748JX2v+8jKuJTjwnlzwye69VFA0iz
 3QIw==
X-Gm-Message-State: AOAM530y5tkBIMD3FbUTfxKEO4wU9C9M7K8W/tD/2rbZKW6ih9CTVgq1
 p+KBgHl2GROWtWj4wmtEF0bmQS+D974=
X-Google-Smtp-Source: ABdhPJwjWvYRsSb1LKJlB8y26c4r4VDOkR1kK9z9F3T8pe0vXcfFq+a9ZrdisTRBqTCNwA1mjIOtLw==
X-Received: by 2002:a17:906:3daa:: with SMTP id
 y10mr226965ejh.521.1611209848118; 
 Wed, 20 Jan 2021 22:17:28 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c22-c84c-8e00-6cbb-50d4-b91e-5b37.c22.pool.telefonica.de.
 [2a01:c22:c84c:8e00:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id w4sm2225551eds.40.2021.01.20.22.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 22:17:27 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amd/display: Fix HDMI deep color output for DCE 6-11.
Date: Thu, 21 Jan 2021 07:17:03 +0100
Message-Id: <20210121061704.21090-3-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
References: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes corrupted display output in HDMI deep color
10/12 bpc mode at least as observed on AMD Mullins, DCE-8.3.

It will hopefully also provide fixes for other DCE's up to
DCE-11, assuming those will need similar fixes, but i could
not test that for HDMI due to lack of suitable hw, so viewer
discretion is advised.

dce110_stream_encoder_hdmi_set_stream_attribute() is used for
HDMI setup on all DCE's and is missing color_depth assignment.

dce110_program_pix_clk() is used for pixel clock setup on HDMI
for DCE 6-11, and is missing color_depth assignment.

Additionally some of the underlying Atombios specific encoder
and pixelclock setup functions are missing code which is in
the classic amdgpu kms modesetting path and the in the radeon
kms driver for DCE6/DCE8.

encoder_control_digx_v3() - Was missing setup code wrt. amdgpu
and radeon kms classic drivers. Added here, but untested due to
lack of suitable test hw.

encoder_control_digx_v4() - Added missing setup code.
Successfully tested on AMD mullins / DCE-8.3 with HDMI deep color
output at 10 bpc and 12 bpc.

Note that encoder_control_digx_v5() has proper setup code in place
and is used, e.g., by DCE-11.2, but this code wasn't used for deep
color setup due to the missing cntl.color_depth setup in the calling
function for HDMI.

set_pixel_clock_v5() - Missing setup code wrt. classic amdgpu/radeon
kms. Added here, but untested due to lack of hw.

set_pixel_clock_v6() - Missing setup code added. Successfully tested
on AMD mullins DCE-8.3. This fixes corrupted display output at HDMI
deep color output with 10 bpc or 12 bpc.

Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>
---
 .../drm/amd/display/dc/bios/command_table.c   | 61 +++++++++++++++++++
 .../drm/amd/display/dc/dce/dce_clock_source.c | 14 +++++
 .../amd/display/dc/dce/dce_stream_encoder.c   |  1 +
 3 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
index 070459e3e407..afc10b954ffa 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
@@ -245,6 +245,23 @@ static enum bp_result encoder_control_digx_v3(
 					cntl->enable_dp_audio);
 	params.ucLaneNum = (uint8_t)(cntl->lanes_number);
 
+	switch (cntl->color_depth) {
+	case COLOR_DEPTH_888:
+		params.ucBitPerColor = PANEL_8BIT_PER_COLOR;
+		break;
+	case COLOR_DEPTH_101010:
+		params.ucBitPerColor = PANEL_10BIT_PER_COLOR;
+		break;
+	case COLOR_DEPTH_121212:
+		params.ucBitPerColor = PANEL_12BIT_PER_COLOR;
+		break;
+	case COLOR_DEPTH_161616:
+		params.ucBitPerColor = PANEL_16BIT_PER_COLOR;
+		break;
+	default:
+		break;
+	}
+
 	if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
 		result = BP_RESULT_OK;
 
@@ -274,6 +291,23 @@ static enum bp_result encoder_control_digx_v4(
 					cntl->enable_dp_audio));
 	params.ucLaneNum = (uint8_t)(cntl->lanes_number);
 
+	switch (cntl->color_depth) {
+	case COLOR_DEPTH_888:
+		params.ucBitPerColor = PANEL_8BIT_PER_COLOR;
+		break;
+	case COLOR_DEPTH_101010:
+		params.ucBitPerColor = PANEL_10BIT_PER_COLOR;
+		break;
+	case COLOR_DEPTH_121212:
+		params.ucBitPerColor = PANEL_12BIT_PER_COLOR;
+		break;
+	case COLOR_DEPTH_161616:
+		params.ucBitPerColor = PANEL_16BIT_PER_COLOR;
+		break;
+	default:
+		break;
+	}
+
 	if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
 		result = BP_RESULT_OK;
 
@@ -1057,6 +1091,19 @@ static enum bp_result set_pixel_clock_v5(
 		 * driver choose program it itself, i.e. here we program it
 		 * to 888 by default.
 		 */
+		if (bp_params->signal_type == SIGNAL_TYPE_HDMI_TYPE_A)
+			switch (bp_params->color_depth) {
+			case TRANSMITTER_COLOR_DEPTH_30:
+				/* yes this is correct, the atom define is wrong */
+				clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V5_MISC_HDMI_32BPP;
+				break;
+			case TRANSMITTER_COLOR_DEPTH_36:
+				/* yes this is correct, the atom define is wrong */
+				clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V5_MISC_HDMI_30BPP;
+				break;
+			default:
+				break;
+			}
 
 		if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
 			result = BP_RESULT_OK;
@@ -1135,6 +1182,20 @@ static enum bp_result set_pixel_clock_v6(
 		 * driver choose program it itself, i.e. here we pass required
 		 * target rate that includes deep color.
 		 */
+		if (bp_params->signal_type == SIGNAL_TYPE_HDMI_TYPE_A)
+			switch (bp_params->color_depth) {
+			case TRANSMITTER_COLOR_DEPTH_30:
+				clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6;
+				break;
+			case TRANSMITTER_COLOR_DEPTH_36:
+				clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6;
+				break;
+			case TRANSMITTER_COLOR_DEPTH_48:
+				clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_48BPP;
+				break;
+			default:
+				break;
+			}
 
 		if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
 			result = BP_RESULT_OK;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index fb733f573715..466f8f5803c9 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -871,6 +871,20 @@ static bool dce110_program_pix_clk(
 	bp_pc_params.flags.SET_EXTERNAL_REF_DIV_SRC =
 					pll_settings->use_external_clk;
 
+	switch (pix_clk_params->color_depth) {
+	case COLOR_DEPTH_101010:
+		bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_30;
+		break;
+	case COLOR_DEPTH_121212:
+		bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_36;
+		break;
+	case COLOR_DEPTH_161616:
+		bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_48;
+		break;
+	default:
+		break;
+	}
+
 	if (clk_src->bios->funcs->set_pixel_clock(
 			clk_src->bios, &bp_pc_params) != BP_RESULT_OK)
 		return false;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
index ada57f745fd7..19e380e0a330 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
@@ -564,6 +564,7 @@ static void dce110_stream_encoder_hdmi_set_stream_attribute(
 	cntl.enable_dp_audio = enable_audio;
 	cntl.pixel_clock = actual_pix_clk_khz;
 	cntl.lanes_number = LANE_COUNT_FOUR;
+	cntl.color_depth = crtc_timing->display_color_depth;
 
 	if (enc110->base.bp->funcs->encoder_control(
 			enc110->base.bp, &cntl) != BP_RESULT_OK)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
