Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6CB3F0B3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 23:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C08310E536;
	Mon,  1 Sep 2025 21:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XzlZAMSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D9A10E52F;
 Mon,  1 Sep 2025 21:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wxuU+DbrAwSYypNU9a/LJTH/dVFZ/g6o9o/U0ntmcms=; b=XzlZAMSup8qURIU9npnEB8Qyj8
 WGr2xuNtHYgB3NR6EvflOSIlJ0zK49gcqj2+0ECiJP4eRQ3U0PK0IndCbjE46toiq7f9L0esA5Lgy
 KNoueNgbmq+xIHAQBHDxDNA+chzTjxBchqP4+tJ7rSgSDfmbbhi/TLmW7uS45CD0ZyU2MF8fYARUV
 1tTTLmCV9J5fRxD28ZrkGF1tovH6QiKR2lc9+WZTWXK1vOy5LF6tdJuIAaoYpxt0YgIMeRAKTzBME
 QNIfJpPck5v/RALEqx3ZCj9XOIS6CtWG79A1hm25xywxl2sBl+uFmCCMxDUhp6qDP/EKQpMsOQtvX
 tL37uY1A==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utCSF-005Rwa-I9; Mon, 01 Sep 2025 23:52:48 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Dillon.Varone@amd.com, jdhillon@amd.com, Alvin.Lee2@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: remove output_tf_change flag
Date: Mon,  1 Sep 2025 18:51:05 -0300
Message-ID: <20250901215241.14667-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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

Remove this flag as the driver stopped managing it individually since
commit a4056c2a6344 ("drm/amd/display: use HW hdr mult for brightness
boost"). After some back and forth it was reintroduced as a condition to
`set_output_transfer_func()` in [1]. Without direct management, this
flag only changes value when all surface update flags are set true on
UPDATE_TYPE_FULL with no output TF status meaning.

Fixes: bb622e0c0044 ("drm/amd/display: program output tf when required") [1]
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h                       | 1 -
 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 6 ++----
 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 6 ++----
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index b41e66c31e6a..95d803b40dd0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1390,7 +1390,6 @@ union surface_update_flags {
 		uint32_t in_transfer_func_change:1;
 		uint32_t input_csc_change:1;
 		uint32_t coeff_reduction_change:1;
-		uint32_t output_tf_change:1;
 		uint32_t pixel_format_change:1;
 		uint32_t plane_size_change:1;
 		uint32_t gamut_remap_change:1;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 7d24fa1517bf..bd3d614aa71c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1982,10 +1982,8 @@ static void dcn20_program_pipe(
 	 * updating on slave planes
 	 */
 	if (pipe_ctx->update_flags.bits.enable ||
-		pipe_ctx->update_flags.bits.plane_changed ||
-		pipe_ctx->stream->update_flags.bits.out_tf ||
-		(pipe_ctx->plane_state &&
-			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
+	    pipe_ctx->update_flags.bits.plane_changed ||
+	    pipe_ctx->stream->update_flags.bits.out_tf)
 		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
 
 	/* If the pipe has been enabled or has a different opp, we
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index d5b5e2ce6ff6..65e45c624530 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2029,10 +2029,8 @@ void dcn401_program_pipe(
 	 * updating on slave planes
 	 */
 	if (pipe_ctx->update_flags.bits.enable ||
-		pipe_ctx->update_flags.bits.plane_changed ||
-		pipe_ctx->stream->update_flags.bits.out_tf ||
-		(pipe_ctx->plane_state &&
-			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
+	    pipe_ctx->update_flags.bits.plane_changed ||
+	    pipe_ctx->stream->update_flags.bits.out_tf)
 		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
 
 	/* If the pipe has been enabled or has a different opp, we
-- 
2.47.2

