Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC7AA4E79
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DD410E7B2;
	Wed, 30 Apr 2025 14:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rIFeXq50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA9010E7AF;
 Wed, 30 Apr 2025 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hb9SmseSEwk7StNMbWczhvH3wgB3Xcr8IeRbrJa1MJg=; b=rIFeXq50Qs8wR3ksJfoJTBrJAm
 gz914toNVEaNhq5dBNhHASjTKl2VY42I40VcVFEu1cZNUI+OD3t81RhA0CV0Oj5S4rS7UcFIVKc1p
 kNH+yHfCFmIGuqj+rB6igE4Dy/K+zMZC704Y3ICTmeK3vtc5rnRjOo3vi/toCNKtt7NvMEO/6OV81
 L7N/VENC/oswXi7btgXIgtGh6adPsVRlSsjG7pEn/cWYHjlzQiPKycip9II3utbX80dFYRYSqben0
 gG7fEzWLto5ArNF5+nBbm97DJOfkrSMI6lJNHizw7S3qCe18kwSENnd5QIZxrU0HtgZBPhA6SkBM9
 0EDfJFEw==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uA8N3-000vo2-9X; Wed, 30 Apr 2025 16:26:03 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 2/5] drm/amd/display: hook up program_tg for dcn401
Date: Wed, 30 Apr 2025 11:20:08 -0300
Message-ID: <20250430142549.829861-3-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430142549.829861-1-mwen@igalia.com>
References: <20250430142549.829861-1-mwen@igalia.com>
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

In this version, the global sync programming differs and needs an
specific function call slightly different from the commonly used
dcn20_program_tg. Hook up dcn401_program_tg only for dcn401.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c    | 9 ++++-----
 .../gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h    | 4 ++++
 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c | 1 +
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index c8c8a17ff183..06190c73c22c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2191,11 +2191,10 @@ static unsigned int dcn401_calculate_vready_offset_for_group(struct pipe_ctx *pi
 	return vready_offset;
 }
 
-static void dcn401_program_tg(
-	struct dc *dc,
-	struct pipe_ctx *pipe_ctx,
-	struct dc_state *context,
-	struct dce_hwseq *hws)
+void dcn401_program_tg(struct dc *dc,
+		       struct pipe_ctx *pipe_ctx,
+		       struct dc_state *context,
+		       struct dce_hwseq *hws)
 {
 	pipe_ctx->stream_res.tg->funcs->program_global_sync(
 		pipe_ctx->stream_res.tg,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
index ce65b4f6c672..26c350efb1c2 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
@@ -93,6 +93,10 @@ void dcn401_reset_back_end_for_pipe(
 void dcn401_reset_hw_ctx_wrap(
 		struct dc *dc,
 		struct dc_state *context);
+void dcn401_program_tg(struct dc *dc,
+		       struct pipe_ctx *pipe_ctx,
+		       struct dc_state *context,
+		       struct dce_hwseq *hws);
 void dcn401_program_pipe(
 	struct dc *dc,
 	struct pipe_ctx *pipe_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
index fe7aceb2f510..65c551895ac9 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
@@ -101,6 +101,7 @@ static const struct hw_sequencer_funcs dcn401_funcs = {
 	.program_outstanding_updates = dcn401_program_outstanding_updates,
 	.wait_for_all_pending_updates = dcn30_wait_for_all_pending_updates,
 	.detect_pipe_changes = dcn401_detect_pipe_changes,
+	.program_tg = dcn401_program_tg,
 	.enable_plane = dcn20_enable_plane,
 	.update_dchubp_dpp = dcn20_update_dchubp_dpp,
 	.post_unlock_reset_opp = dcn20_post_unlock_reset_opp,
-- 
2.47.2

