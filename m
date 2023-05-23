Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E4070E8DE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB2B10E525;
	Tue, 23 May 2023 22:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D310E50E;
 Tue, 23 May 2023 22:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eKdsGw8gsNuCvESmWYB83mfrbAbOlPlV0OoQb9gBGYg=; b=cJvWao2tEVZ088+Y2FtaiCLXcC
 ciOIC71/F+gsAxGdFxgkygwHZjeebh/IOmekxKYDYTfe9V8+wFQ78A3L3+/IrNimH3OtL7ulcgJaZ
 MlOTEaOFifpynP6+wpJwAN6O7BjUpbHZ2ka69c0Bz6Uj2mIm+T/5TsBP22WbwDqnsEJVvUnY8u9HF
 D/q+BnFSw+VcCLpSsD9ckyeFHVbsm5kQFLjUK47+sVY2yEkuOhRgEoHzQroQHIHziqsuXkODYvS6+
 ImAQw27eO+Z/lytTL4lHxoAQy3WnXPP6iQDBYnraZejGSwhriWhbi0hg3NvhDQKq2plD9f3yw7JWk
 v5D/Qw1Q==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIK-00HEOv-EL; Wed, 24 May 2023 00:15:52 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 19/36] drm/amd/display: handle MPC 3D LUT resources for a
 given context
Date: Tue, 23 May 2023 21:15:03 -0100
Message-Id: <20230523221520.3115570-20-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the original dc_acquire_release_mpc_3dlut(), only current ctx is
considered, which doesn't fit the steps for atomic checking new ctx.
Therefore, create a function to handle 3D LUT resource for a given
context, so that we can check resources availability in atomic_check
time and handle failures properly.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h      |  8 +++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8e8da8c0f8cc..542a8fb26c24 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2129,6 +2129,45 @@ bool dc_acquire_release_mpc_3dlut(
 	return ret;
 }
 
+bool
+dc_acquire_release_mpc_3dlut_for_ctx(struct dc *dc,
+				     bool acquire,
+				     struct dc_state *state,
+				     struct dc_stream_state *stream,
+				     struct dc_3dlut **lut,
+				     struct dc_transfer_func **shaper)
+{
+	int pipe_idx;
+	bool ret = false;
+	bool found_pipe_idx = false;
+	const struct resource_pool *pool = dc->res_pool;
+	struct resource_context *res_ctx = &state->res_ctx;
+	int mpcc_id = 0;
+
+	if (pool && res_ctx) {
+		if (acquire) {
+			/*find pipe idx for the given stream*/
+			for (pipe_idx = 0; pipe_idx < pool->pipe_count; pipe_idx++) {
+				if (res_ctx->pipe_ctx[pipe_idx].stream == stream) {
+					found_pipe_idx = true;
+					mpcc_id = res_ctx->pipe_ctx[pipe_idx].plane_res.hubp->inst;
+					break;
+				}
+			}
+		} else
+			found_pipe_idx = true;/*for release pipe_idx is not required*/
+
+		if (found_pipe_idx) {
+			if (acquire && pool->funcs->acquire_post_bldn_3dlut)
+				ret = pool->funcs->acquire_post_bldn_3dlut(res_ctx, pool, mpcc_id, lut, shaper);
+			else if (!acquire && pool->funcs->release_post_bldn_3dlut)
+				ret = pool->funcs->release_post_bldn_3dlut(res_ctx, pool, lut, shaper);
+		}
+	}
+	return ret;
+}
+
+
 static bool is_flip_pending_in_pipes(struct dc *dc, struct dc_state *context)
 {
 	int i;
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 2dff1a5cf3b1..b307d95f5dd4 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1365,6 +1365,14 @@ bool dc_acquire_release_mpc_3dlut(
 		struct dc_3dlut **lut,
 		struct dc_transfer_func **shaper);
 
+bool
+dc_acquire_release_mpc_3dlut_for_ctx(struct dc *dc,
+				     bool acquire,
+				     struct dc_state *state,
+				     struct dc_stream_state *stream,
+				     struct dc_3dlut **lut,
+				     struct dc_transfer_func **shaper);
+
 void dc_resource_state_copy_construct(
 		const struct dc_state *src_ctx,
 		struct dc_state *dst_ctx);
-- 
2.39.2

