Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C701F9BE02D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA2710E1C8;
	Wed,  6 Nov 2024 08:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC9E10E5B6;
 Tue,  5 Nov 2024 14:12:41 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XjVfT4mnlz1ypGn;
 Tue,  5 Nov 2024 22:12:49 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
 by mail.maildlp.com (Postfix) with ESMTPS id B27391402E2;
 Tue,  5 Nov 2024 22:12:39 +0800 (CST)
Received: from huawei.com (10.67.175.84) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 5 Nov
 2024 22:12:38 +0800
From: Zicheng Qu <quzicheng@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Dillon.Varone@amd.com>, <Alvin.Lee2@amd.com>,
 <nicholas.kazlauskas@amd.com>, <alex.hung@amd.com>,
 <aurabindo.pillai@amd.com>, <relja.vojvodic@amd.com>,
 <chiahsuan.chung@amd.com>, <wenjing.liu@amd.com>, <george.shen@amd.com>,
 <mwen@igalia.com>, <yi-lchen@amd.com>, <martin.leung@amd.com>,
 <srinivasan.shanmugam@amd.com>, <stylon.wang@amd.com>, <jun.lei@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
 <judy.chenhui@huawei.com>, <quzicheng@huawei.com>
Subject: [PATCH 1/2] drm/amd/display: Fix null check for pipe_ctx->plane_state
 in dcn20_program_pipe
Date: Tue, 5 Nov 2024 14:01:36 +0000
Message-ID: <20241105140137.2465572-2-quzicheng@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105140137.2465572-1-quzicheng@huawei.com>
References: <20241105140137.2465572-1-quzicheng@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.84]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-Mailman-Approved-At: Wed, 06 Nov 2024 08:18:14 +0000
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

This commit addresses a null pointer dereference issue in
dcn20_program_pipe(). Previously, commit 8e4ed3cf1642 ("drm/amd/display:
Add null check for pipe_ctx->plane_state in dcn20_program_pipe")
partially fixed the null pointer dereference issue. However, in
dcn20_update_dchubp_dpp(), the variable pipe_ctx is passed in, and
plane_state is accessed again through pipe_ctx. Multiple if statements
directly call attributes of plane_state, leading to potential null
pointer dereference issues. This patch adds necessary null checks to
ensure stability.

Fixes: 8e4ed3cf1642 ("drm/amd/display: Add null check for pipe_ctx->plane_state in dcn20_program_pipe")
Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index a80c08582932..36d12db8d022 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1923,9 +1923,9 @@ static void dcn20_program_pipe(
 				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->hubp_regs.det_size);
 	}
 
-	if (pipe_ctx->update_flags.raw ||
-	    (pipe_ctx->plane_state && pipe_ctx->plane_state->update_flags.raw) ||
-	    pipe_ctx->stream->update_flags.raw)
+	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.raw ||
+	    pipe_ctx->plane_state->update_flags.raw ||
+	    pipe_ctx->stream->update_flags.raw))
 		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
 
 	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.bits.enable ||
-- 
2.34.1

