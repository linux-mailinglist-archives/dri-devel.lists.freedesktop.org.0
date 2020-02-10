Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C2157EFB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 16:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2FD6ECA1;
	Mon, 10 Feb 2020 15:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4326EC76;
 Mon, 10 Feb 2020 15:08:48 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ED30849FC6CB5CD2F0C2;
 Mon, 10 Feb 2020 23:08:42 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Mon, 10 Feb 2020
 23:08:33 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Anthony.Koo@amd.com>, <aric.cyr@amd.com>,
 <Dmytro.Laktyushkin@amd.com>, <Eric.Yang2@amd.com>, <yongqiang.sun@amd.com>,
 <martin.leung@amd.com>, <charlene.liu@amd.com>
Subject: [RFC PATCH -next] drm/amd/display: Remove set but not unused variable
 'stream_status'
Date: Mon, 10 Feb 2020 23:08:26 +0800
Message-ID: <20200210150826.35200-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 10 Feb 2020 15:38:06 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:
 In function dcn10_post_unlock_program_front_end:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2623:29:
 warning: variable stream_status set but not used [-Wunused-but-set-variable]

commit bbf5f6c3f83b ("drm/amd/display: Split program front end part that occur outside lock")
involved this unused variable.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 42fcfee..b2ed0fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2610,7 +2610,7 @@ void dcn10_post_unlock_program_front_end(
 		struct dc *dc,
 		struct dc_state *context)
 {
-	int i, j;
+	int i;
 
 	DC_LOGGER_INIT(dc->ctx->logger);
 
@@ -2620,14 +2620,8 @@ void dcn10_post_unlock_program_front_end(
 		if (!pipe_ctx->top_pipe &&
 			!pipe_ctx->prev_odm_pipe &&
 			pipe_ctx->stream) {
-			struct dc_stream_status *stream_status = NULL;
 			struct timing_generator *tg = pipe_ctx->stream_res.tg;
 
-			for (j = 0; j < context->stream_count; j++) {
-				if (pipe_ctx->stream == context->streams[j])
-					stream_status = &context->stream_status[j];
-			}
-
 			if (context->stream_status[i].plane_count == 0)
 				false_optc_underflow_wa(dc, pipe_ctx->stream, tg);
 		}
-- 
2.7.4


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
