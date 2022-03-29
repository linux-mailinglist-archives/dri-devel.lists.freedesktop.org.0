Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C654EB494
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 22:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B2010F2AD;
	Tue, 29 Mar 2022 20:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D082810E3DD;
 Tue, 29 Mar 2022 20:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PbtB4d2TaEvBxTnbUEH8FeeOTqo9Fsuq+oaXuDrUoFk=; b=Iwnoz1AWuSRlYU/D+EipQMnGxj
 C814J+esXDvWKyG0gsM7qHtoc7l0ESUtG45CtJOwAGm7NnwzbfQJZsFoQApCtEqHJelefzAvE3/D2
 DNJj3H/IL2B1phzKIDbZ9VCheMt+z2rPMBDECya3lfiouKbrXFUy8JifFYXRv2BpUc4H6Ij49eUNx
 s0ukXum4Yq2T5PmdHEmIgRtUXCqlkj7BAyXMTJeb76jMifimmd+ZeCQzDSjYKO4Tke6L3L8LSY33S
 VfwqLg/aUF9PZPMDuXN3S+p/YtkWCEXKT1ideW4K8EoZPmSx7DhZulEGg7dtdRGOgrwLJ3nKn/7Ks
 vvILD5DQ==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nZIIn-000Abu-G1; Tue, 29 Mar 2022 22:18:53 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Simon Ser <contact@emersion.fr>, markyacoub@google.com, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v2] drm/amd/display: don't ignore alpha property on
 pre-multiplied mode
Date: Tue, 29 Mar 2022 19:18:35 -0100
Message-Id: <20220329201835.2393141-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pre-multiplied" is the default pixel blend mode for KMS/DRM, as
documented in supported_modes of drm_plane_create_blend_mode_property():
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_blend.c

In this mode, both 'pixel alpha' and 'plane alpha' participate in the
calculation, as described by the pixel blend mode formula in KMS/DRM
documentation:

out.rgb = plane_alpha * fg.rgb +
          (1 - (plane_alpha * fg.alpha)) * bg.rgb

Considering the blend config mechanisms we have in the driver so far,
the alpha mode that better fits this blend mode is the
_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN, where the value for global_gain
is the plane alpha (global_alpha).

With this change, alpha property stops to be ignored. It also addresses
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1734

v2:
 * keep the 8-bit value for global_alpha_value (Nicholas)
 * correct the logical ordering for combined global gain (Nicholas)
 * apply to dcn10 too (Nicholas)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 14 +++++++++-----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 14 +++++++++-----
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index ad757b59e00e..b1034e6258c8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2528,14 +2528,18 @@ void dcn10_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	struct mpc *mpc = dc->res_pool->mpc;
 	struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
 
-	if (per_pixel_alpha)
-		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
-	else
-		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
-
 	blnd_cfg.overlap_only = false;
 	blnd_cfg.global_gain = 0xff;
 
+	if (per_pixel_alpha && pipe_ctx->plane_state->global_alpha) {
+		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN;
+		blnd_cfg.global_gain = pipe_ctx->plane_state->global_alpha_value;
+	} else if (per_pixel_alpha) {
+		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
+	} else {
+		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
+	}
+
 	if (pipe_ctx->plane_state->global_alpha)
 		blnd_cfg.global_alpha = pipe_ctx->plane_state->global_alpha_value;
 	else
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 4290eaf11a04..b627c41713cc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2344,14 +2344,18 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	struct mpc *mpc = dc->res_pool->mpc;
 	struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
 
-	if (per_pixel_alpha)
-		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
-	else
-		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
-
 	blnd_cfg.overlap_only = false;
 	blnd_cfg.global_gain = 0xff;
 
+	if (per_pixel_alpha && pipe_ctx->plane_state->global_alpha) {
+		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN;
+		blnd_cfg.global_gain = pipe_ctx->plane_state->global_alpha_value;
+	} else if (per_pixel_alpha) {
+		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
+	} else {
+		blnd_cfg.alpha_mode = MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
+	}
+
 	if (pipe_ctx->plane_state->global_alpha)
 		blnd_cfg.global_alpha = pipe_ctx->plane_state->global_alpha_value;
 	else
-- 
2.35.1

