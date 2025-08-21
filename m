Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F9B2F763
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0045810E0CC;
	Thu, 21 Aug 2025 12:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="UZNI/jFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CF910E0CC;
 Thu, 21 Aug 2025 12:01:47 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c723r4GRNz9tVh;
 Thu, 21 Aug 2025 14:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1755777704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=52AW3vX2G/gONvQRliEmju8kdN4K7aQivHGiuzDOHmM=;
 b=UZNI/jFGRxXIPtCOaLdXc/juSYAvmv03H0pNFcW5s4NxgiePdwJd88IPqacCR5uB1Xbx6F
 eKQeHKBJM1gy/A62HEXboWY+scZ7qrwR84W6AFxzu7VSGJaz/D1hpTfRgPh7DVQsQd3Vne
 HB8Grj+yUxgxECax3Yl98YgeKvwi9aD7ZurdAO/N7oHHiwK3oNWyH/0YkrgggyyWDh7QYc
 ztkQ0UANPB1yv/q6Qzvf/4Naeq5xzU7K1OG/usgpFaVh+s0ixFAxIjY7XLKkGwE/PBuFpl
 gNkDYWBIVjtLW1nTizy0XZnfw+uxGNIQ9/eLAy6g3omzQpHtbA5m+8m3a2oJwg==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=listout@listout.xyz
From: Brahmajit Das <listout@listout.xyz>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v2] drm/amd/display: clean-up dead code in dml2_mall_phantom
Date: Thu, 21 Aug 2025 17:31:33 +0530
Message-ID: <20250821120133.6174-1-listout@listout.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4c723r4GRNz9tVh
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

pipe_idx in funtion dml2_svp_validate_static_schedulabilit, although set
is never actually used. While building with GCC 16 this gives a warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.c: In function ‘set_phantom_stream_timing’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.c:657:25: warning: variable ‘pipe_idx’ set but not used [-Wunused-but-set-variable=]
  657 |         unsigned int i, pipe_idx;
      |                         ^~~~~~~~

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
v1 -> v2: leaving declaration above
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
index a56e75cdf712..c59f825cfae9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
@@ -654,14 +654,14 @@ static void set_phantom_stream_timing(struct dml2_context *ctx, struct dc_state
 				     unsigned int svp_height,
 				     unsigned int svp_vstartup)
 {
-	unsigned int i, pipe_idx;
+	unsigned int i;
 	double line_time, fp_and_sync_width_time;
 	struct pipe_ctx *pipe;
 	uint32_t phantom_vactive, phantom_bp, pstate_width_fw_delay_lines;
 	static const double cvt_rb_vblank_max = ((double) 460 / (1000 * 1000));
 
 	// Find DML pipe index (pipe_idx) using dc_pipe_idx
-	for (i = 0, pipe_idx = 0; i < ctx->config.dcn_pipe_count; i++) {
+	for (i = 0; i < ctx->config.dcn_pipe_count; i++) {
 		pipe = &state->res_ctx.pipe_ctx[i];
 
 		if (!pipe->stream)
@@ -669,8 +669,6 @@ static void set_phantom_stream_timing(struct dml2_context *ctx, struct dc_state
 
 		if (i == dc_pipe_idx)
 			break;
-
-		pipe_idx++;
 	}
 
 	// Calculate lines required for pstate allow width and FW processing delays
-- 
2.51.0

