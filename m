Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209ACA6817
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 08:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916B010EA27;
	Fri,  5 Dec 2025 07:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D784810EA27;
 Fri,  5 Dec 2025 07:43:58 +0000 (UTC)
X-UUID: 256de65ad1ae11f0a38c85956e01ac42-20251205
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:8cb02a88-180c-46a6-b516-e5810342069f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:6c3e486b0e851e5d01d4d7b137f0f4db,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|898,TC:nil,Content:0|15|50,E
 DM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 256de65ad1ae11f0a38c85956e01ac42-20251205
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 265998802; Fri, 05 Dec 2025 15:43:53 +0800
From: yaolu@kylinos.cn
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: [RESEND] drm/amd/display: fix audio playing speed up on POLARIS12
Date: Fri,  5 Dec 2025 15:43:44 +0800
Message-Id: <20251205074344.143063-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lu Yao <yaolu@kylinos.cn>

Playing audio/video will speed up when color space is NV12.
For POLARIS12, audio request clock has to be same as
'stream->timing.pix_clk_100hz', so double clock now for it
has been halved in the 'get_pixel_clock_parameters' function.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c  | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)
---
Test environment:
  Card: RX550  device id: 0X699F
  Display mode: 4K@60 clock:59400

A similar issue was reported in the community a long time ago,
but it was not dealt with, link as follow:
https://gitlab.freedesktop.org/drm/amd/-/issues/556

Discovered through logs audio_output requested&calculated is half
of stream->timing.pix_clk_100hz before, so I double it.
I'm not sure if this patch modification has correctly solved the
root cause and whether all DCE_VERSION_11_2 have problem or POLARIS12
only, but it's working properly on my machine now.
---

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 24184b4eb352..a93313248db3 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1440,13 +1440,21 @@ void build_audio_output(
 
 /*for HDMI, audio ACR is with deep color ratio factor*/
 	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) &&
-		audio_output->crtc_info.requested_pixel_clock_100Hz ==
-				(stream->timing.pix_clk_100hz)) {
-		if (pipe_ctx->stream_res.pix_clk_params.pixel_encoding == PIXEL_ENCODING_YCBCR420) {
+		pipe_ctx->stream_res.pix_clk_params.pixel_encoding == PIXEL_ENCODING_YCBCR420) {
+		struct hw_asic_id asic_id = stream->link->ctx->asic_id;
+
+		if (asic_id.chip_family == FAMILY_VI &&
+		    ASIC_REV_IS_POLARIS12_V(asic_id.hw_internal_rev)) {
+			audio_output->crtc_info.requested_pixel_clock_100Hz =
+				audio_output->crtc_info.requested_pixel_clock_100Hz*2;
+			audio_output->crtc_info.calculated_pixel_clock_100Hz =
+				pipe_ctx->stream_res.pix_clk_params.requested_pix_clk_100hz*2;
+		} else if (audio_output->crtc_info.requested_pixel_clock_100Hz ==
+			   (stream->timing.pix_clk_100hz)) {
 			audio_output->crtc_info.requested_pixel_clock_100Hz =
-					audio_output->crtc_info.requested_pixel_clock_100Hz/2;
+				audio_output->crtc_info.requested_pixel_clock_100Hz/2;
 			audio_output->crtc_info.calculated_pixel_clock_100Hz =
-					pipe_ctx->stream_res.pix_clk_params.requested_pix_clk_100hz/2;
+				pipe_ctx->stream_res.pix_clk_params.requested_pix_clk_100hz/2;
 
 		}
 	}
-- 
2.25.1

