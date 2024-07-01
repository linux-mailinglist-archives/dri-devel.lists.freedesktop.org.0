Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70191D649
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B7A10E2DD;
	Mon,  1 Jul 2024 02:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QCrrmIGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C64710E2DD;
 Mon,  1 Jul 2024 02:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719802249; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=dKbWEdikIBy/xGxcnPx9urGn8RKhAvsJQ96ZeCNi8Xw=;
 b=QCrrmIGTeNCPtSVCiIZlSkiCxmEHjF7rsHTmwaWRxB1rWAN2o7c30g5tVNJxIwH1YZ2euX+XPiuBP2BZ1km5LFYHU3wVRqnO1IDFtkZdZ/bjswwosFjBx3qarfxWU9BdPRU0n8/oozPh3phDRaHYYUIZ6WCkWm5NaISU16wFmls=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033045075189;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W9XECIo_1719802230; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W9XECIo_1719802230) by smtp.aliyun-inc.com;
 Mon, 01 Jul 2024 10:50:46 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: Fix unsigned comparison with less than zero
Date: Mon,  1 Jul 2024 10:50:28 +0800
Message-Id: <20240701025028.36072-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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

The return value from the call to dml21_find_dc_pipes_for_plane() is int.
However, the return value is being assigned to an unsigned int variable
'num_pipes', the condition if(num_pipes <= 0) is not rigorous enough,
so making 'num_pipes' an int.

./drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:318:6-15: WARNING: Unsigned expression compared with zero: num_pipes <= 0.
./drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:360:6-15: WARNING: Unsigned expression compared with zero: num_pipes <= 0.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9454
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index c310354cd5fc..9d96a31419fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -280,7 +280,8 @@ bool dml21_validate(const struct dc *in_dc, struct dc_state *context, struct dml
 
 void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context, struct dml2_context *dml_ctx)
 {
-	unsigned int num_pipes, dml_prog_idx, dml_phantom_prog_idx, dc_pipe_index;
+	unsigned int dml_prog_idx, dml_phantom_prog_idx, dc_pipe_index;
+	int num_pipes;
 	struct pipe_ctx *dc_main_pipes[__DML2_WRAPPER_MAX_STREAMS_PLANES__];
 	struct pipe_ctx *dc_phantom_pipes[__DML2_WRAPPER_MAX_STREAMS_PLANES__] = {0};
 
@@ -314,10 +315,8 @@ void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context
 		}
 
 		num_pipes = dml21_find_dc_pipes_for_plane(in_dc, context, dml_ctx, dc_main_pipes, dc_phantom_pipes, dml_prog_idx);
-
-		if (num_pipes <= 0 ||
-				dc_main_pipes[0]->stream == NULL ||
-				dc_main_pipes[0]->plane_state == NULL)
+		if (num_pipes <= 0 || dc_main_pipes[0]->stream == NULL ||
+		    dc_main_pipes[0]->plane_state == NULL)
 			continue;
 
 		/* get config for each pipe */
@@ -356,10 +355,8 @@ void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context
 		pln_prog = &dml_ctx->v21.mode_programming.programming->plane_programming[dml_prog_idx];
 
 		num_pipes = dml21_find_dc_pipes_for_plane(in_dc, context, dml_ctx, dc_main_pipes, dc_phantom_pipes, dml_prog_idx);
-
-		if (num_pipes <= 0 ||
-				dc_main_pipes[0]->stream == NULL ||
-				dc_main_pipes[0]->plane_state == NULL)
+		if (num_pipes <= 0 || dc_main_pipes[0]->stream == NULL ||
+		    dc_main_pipes[0]->plane_state == NULL)
 			continue;
 
 		/* get config for each pipe */
-- 
2.20.1.7.g153144c

