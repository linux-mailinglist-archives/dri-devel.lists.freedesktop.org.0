Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE94700100
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 09:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343A510E61D;
	Fri, 12 May 2023 07:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398BF10E61D;
 Fri, 12 May 2023 07:05:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0ViO3XFR_1683875093; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0ViO3XFR_1683875093) by smtp.aliyun-inc.com;
 Fri, 12 May 2023 15:05:01 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Subject: [PATCH] drm/amd/display: Simplify the calculation of variables
Date: Fri, 12 May 2023 15:04:51 +0800
Message-Id: <20230512070451.107372-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, sunpeng.li@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c:586:37-39: WARNING !A || A && B is equivalent to !A || B.
./drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c:595:37-39: WARNING !A || A && B is equivalent to !A || B.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4941
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index 4950eaa4406b..2de910e0ce75 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -583,8 +583,8 @@ void dcn32_update_force_pstate(struct dc *dc, struct dc_state *context)
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 		struct hubp *hubp = pipe->plane_res.hubp;
 
-		if (!pipe->stream || (pipe->stream && !(pipe->stream->mall_stream_config.type == SUBVP_MAIN ||
-						pipe->stream->fpo_in_use))) {
+		if (!pipe->stream || !(pipe->stream->mall_stream_config.type == SUBVP_MAIN ||
+		    pipe->stream->fpo_in_use)) {
 			if (hubp && hubp->funcs->hubp_update_force_pstate_disallow)
 				hubp->funcs->hubp_update_force_pstate_disallow(hubp, false);
 		}
@@ -592,7 +592,7 @@ void dcn32_update_force_pstate(struct dc *dc, struct dc_state *context)
 		/* Today only FPO uses cursor P-State force. Only clear cursor P-State force
 		 * if it's not FPO.
 		 */
-		if (!pipe->stream || (pipe->stream && !pipe->stream->fpo_in_use)) {
+		if (!pipe->stream || !pipe->stream->fpo_in_use) {
 			if (hubp && hubp->funcs->hubp_update_force_cursor_pstate_disallow)
 				hubp->funcs->hubp_update_force_cursor_pstate_disallow(hubp, false);
 		}
-- 
2.20.1.7.g153144c

