Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2E770E8F4
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A32B10E541;
	Tue, 23 May 2023 22:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC00910E52A;
 Tue, 23 May 2023 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B1E7WcmsTR28d9LrVCwUVkvm2fwEMjmRp45UNVhkV6U=; b=XML4D2TZOvH/jmnoRDEf6mO838
 pnvZRkxR7YpwbyhXyV52Vs08TMgi3SvDPb6B6y/Aw3DDVRiO+8hMqWQal663rQZHyX8QmMfBWOB8V
 DnzKy4A48Ui9ooSwLalofnzAS5KX58oxbkJfs3BkP8SEPV/E+8GW/xZdjwsCJfUUA5WEvJFctmd4S
 WS1kkw7Ps1QEVvFZvMBP8FDpk4QlpP2RLxHZBL6V0VZ6u2CU3b/lxDKqi55e3OL66a/ww2GkoV++/
 jimS2Lr2TSeBfs1b2uiW6/YCwCxUJvqX+U1uKM6Jn2fpYMiiol1dFah1FIwi+INJv3a1JJJpScnYr
 taah/3eQ==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIe-00HEOv-I8; Wed, 24 May 2023 00:16:12 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 32/36] drm/amd/display: program DPP shaper and 3D LUT if
 updated
Date: Tue, 23 May 2023 21:15:16 -0100
Message-Id: <20230523221520.3115570-33-mwen@igalia.com>
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

If shaper and 3D LUT data updates, lut_3d bit in update_flag is updated
and we need to call set_input_transfer_func to program DPP shaper and 3D
LUTs. Small cleanup of code style in the related if-condition.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index e74c3ce561ab..e347316d0a5e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1764,8 +1764,9 @@ static void dcn20_program_pipe(
 		hws->funcs.set_hdr_multiplier(pipe_ctx);
 
 	if (pipe_ctx->update_flags.bits.enable ||
-			pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
-			pipe_ctx->plane_state->update_flags.bits.gamma_change)
+	    pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
+	    pipe_ctx->plane_state->update_flags.bits.gamma_change ||
+	    pipe_ctx->plane_state->update_flags.bits.lut_3d)
 		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
 
 	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
-- 
2.39.2

