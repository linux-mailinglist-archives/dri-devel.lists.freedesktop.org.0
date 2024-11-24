Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A50C9D706D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8DE10E4CF;
	Sun, 24 Nov 2024 13:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aRrV03E/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310AA10E4CF;
 Sun, 24 Nov 2024 13:33:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C0CEA40A2C;
 Sun, 24 Nov 2024 13:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7BCC4CED3;
 Sun, 24 Nov 2024 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455237;
 bh=zdsx8mRG/HvmBaJk+OYducUS8orieJBufBl9tEUFHS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aRrV03E/CzxYkQ9WXCjLtTE3QJjLkOD30ux5eMITD907DsD6TWWZ40Od/J9LHgKbf
 EAtbX/o7L1WIN63MMdC2E4ixOunI6P3nMJYQ7pcKgDETaUn16tgbtdBTBGgmtl8KgD
 adM7veNWORv7N/Frv0YIAw+mdimpKSI8qsTXt+EiNCeK6GzrpyzTlxpEIganpstI2r
 CZDpZhbjL/NxYxRDsVCEqDlljukwcsz9lz28zHAVh3puMd2uC2hChYv3sUi9tVnrCx
 Um/S0aIDXwL2iqHGQ/auEG7BWaNdM9Yj15dnF61AmbopkTUlsN2Kypr87AkE+lK6/p
 58Nx6Idu2itZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhongwei <Zhongwei.Zhang@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, martin.leung@amd.com, bpinnint@amd.com,
 wenjing.liu@amd.com, wayne.lin@amd.com, george.shen@amd.com,
 yi-lchen@amd.com, alvin.lee2@amd.com, v.shevtsov@maxima.ru,
 dillon.varone@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 022/107] drm/amd/display: Fix garbage or black
 screen when resetting otg
Date: Sun, 24 Nov 2024 08:28:42 -0500
Message-ID: <20241124133301.3341829-22-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Zhongwei <Zhongwei.Zhang@amd.com>

[ Upstream commit ffa1e31f70d2e97c121709b44a8960f5d7becb10 ]

[Why]
For some EDP to MIPI panel, disabling OTG when link is alive like boot
case, the converter might output garbage or show no display because our
GPU is not sending required pixel data.
Alos Dig fifo underflow was found which might cause garbage, when
resetting otg for other types of EDP panels.

[How]
Skipping resetting OTG if the dig fifo is on. Make sure that the otg for
the pipe is the one that the dig fifo is selecting via the FE mask.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Zhongwei <Zhongwei.Zhang@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c    | 10 ++++++++++
 .../amd/display/dc/hwss/dcn314/dcn314_hwseq.c    | 16 ++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
index 5b343f745cf33..ae81451a3a725 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
@@ -83,6 +83,15 @@ void enc314_disable_fifo(struct stream_encoder *enc)
 	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, 0);
 }
 
+static bool enc314_is_fifo_enabled(struct stream_encoder *enc)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+	uint32_t reset_val;
+
+	REG_GET(DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, &reset_val);
+	return (reset_val != 0);
+}
+
 void enc314_dp_set_odm_combine(
 	struct stream_encoder *enc,
 	bool odm_combine)
@@ -468,6 +477,7 @@ static const struct stream_encoder_funcs dcn314_str_enc_funcs = {
 
 	.enable_fifo = enc314_enable_fifo,
 	.disable_fifo = enc314_disable_fifo,
+	.is_fifo_enabled = enc314_is_fifo_enabled,
 	.set_input_mode = enc314_set_dig_input_mode,
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
index a8e04a39a19e5..efcc1a6b364c2 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
@@ -355,6 +355,20 @@ void dcn314_calculate_pix_rate_divider(
 	}
 }
 
+static bool dcn314_is_pipe_dig_fifo_on(struct pipe_ctx *pipe)
+{
+	return pipe && pipe->stream
+		// Check dig's otg instance.
+		&& pipe->stream_res.stream_enc
+		&& pipe->stream_res.stream_enc->funcs->dig_source_otg
+		&& pipe->stream_res.tg->inst == pipe->stream_res.stream_enc->funcs->dig_source_otg(pipe->stream_res.stream_enc)
+		&& pipe->stream->link && pipe->stream->link->link_enc
+		&& pipe->stream->link->link_enc->funcs->is_dig_enabled
+		&& pipe->stream->link->link_enc->funcs->is_dig_enabled(pipe->stream->link->link_enc)
+		&& pipe->stream_res.stream_enc->funcs->is_fifo_enabled
+		&& pipe->stream_res.stream_enc->funcs->is_fifo_enabled(pipe->stream_res.stream_enc);
+}
+
 void dcn314_resync_fifo_dccg_dio(struct dce_hwseq *hws, struct dc *dc, struct dc_state *context, unsigned int current_pipe_idx)
 {
 	unsigned int i;
@@ -374,6 +388,8 @@ void dcn314_resync_fifo_dccg_dio(struct dce_hwseq *hws, struct dc *dc, struct dc
 		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal)) &&
 			!pipe->stream->apply_seamless_boot_optimization &&
 			!pipe->stream->apply_edp_fast_boot_optimization) {
+			if (dcn314_is_pipe_dig_fifo_on(pipe))
+				continue;
 			pipe->stream_res.tg->funcs->disable_crtc(pipe->stream_res.tg);
 			reset_sync_context_for_pipe(dc, context, i);
 			otg_disabled[i] = true;
-- 
2.43.0

