Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FA70E8D4
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C2010E51C;
	Tue, 23 May 2023 22:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A710E50E;
 Tue, 23 May 2023 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1pDv9ml0fMW1552wzaK0WkxguQ7efaI2g4W2c2iLaSQ=; b=KDsCb/VDx9qgz3JC0kTZ3s0z2x
 gzUxkCdFsODwGmtgYM2bEykfaqgnfqOUr1iOs4ks4uKlw0Q8L4L1KE4NgHilnWzQikY7afJHMs3LW
 u3Tzl23xms4n1EvfB+Az2eGaZD4iy+8S8zM8TXc5rZI0EH7SkVKzqyNUa3zoFQHgPyDXsGyy++ssK
 eIvUNlknVXD9PZVf8MMc7o6OIQiS1LDToxT0arLUAjBzTj5jcLZjPLQhq2pwBYV6plhni3qY+N40r
 4BI+/bPZqRiZTb7zbSIzaCMs81qMb2QDXwsXnlWmQTOi3n6NSu2S1OLTll+N5XLyRvktujJtXzw8p
 shNcYaOg==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aII-00HEOv-Sd; Wed, 24 May 2023 00:15:51 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 18/36] drm/amd/display: allow BYPASS 3D LUT but keep shaper
 LUT settings
Date: Tue, 23 May 2023 21:15:02 -0100
Message-Id: <20230523221520.3115570-19-mwen@igalia.com>
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

HW allows us to program shaper LUT without 3D LUT settings and it is
also good for testing shaper LUT behavior, therefore, DC driver should
allow acquiring both 3D and shaper LUT, but programing shaper LUT
without 3D LUT (not initialized).

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 3303c9aae068..bacb0a001d68 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -113,7 +113,6 @@ static bool dcn30_set_mpc_shaper_3dlut(struct pipe_ctx *pipe_ctx,
 	}
 
 	if (stream->lut3d_func &&
-	    stream->lut3d_func->state.bits.initialized == 1 &&
 	    stream->lut3d_func->state.bits.rmu_idx_valid == 1) {
 		if (stream->lut3d_func->state.bits.rmu_mux_num == 0)
 			mpcc_id_projected = stream->lut3d_func->state.bits.mpc_rmu0_mux;
@@ -131,8 +130,12 @@ static bool dcn30_set_mpc_shaper_3dlut(struct pipe_ctx *pipe_ctx,
 		if (acquired_rmu != stream->lut3d_func->state.bits.rmu_mux_num)
 			BREAK_TO_DEBUGGER();
 
-		result = mpc->funcs->program_3dlut(mpc, &stream->lut3d_func->lut_3d,
-						   stream->lut3d_func->state.bits.rmu_mux_num);
+		if (stream->lut3d_func->state.bits.initialized == 1)
+			result = mpc->funcs->program_3dlut(mpc, &stream->lut3d_func->lut_3d,
+							   stream->lut3d_func->state.bits.rmu_mux_num);
+		else
+			result = mpc->funcs->program_3dlut(mpc, NULL,
+							   stream->lut3d_func->state.bits.rmu_mux_num);
 		result = mpc->funcs->program_shaper(mpc, shaper_lut,
 						    stream->lut3d_func->state.bits.rmu_mux_num);
 	} else {
-- 
2.39.2

