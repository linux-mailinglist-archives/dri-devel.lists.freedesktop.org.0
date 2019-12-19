Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3717C1292B6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CF96E1F2;
	Mon, 23 Dec 2019 08:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF6B6E33C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 11:58:22 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 58D1A847682FDD26398B;
 Thu, 19 Dec 2019 19:58:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 19:58:10 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <alexander.deucher@amd.com>
Subject: [PATCH next] drm/amd/display: make non-global functions static
Date: Thu, 19 Dec 2019 19:55:00 +0800
Message-ID: <20191219115500.2047-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: chenzhou10@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix sparse warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:964:5:
	warning: symbol 'shift_border_left_to_dst' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:975:6:
	warning: symbol 'restore_border_left_from_dst' was not declared. Should it be static?

Fixes: 89d07b662f5e (drm/amd/display: fix 270 degree rotation for mixed-SLS mode)
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 64a0e08f..5843c16 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -961,7 +961,7 @@ static void calculate_inits_and_adj_vp(struct pipe_ctx *pipe_ctx)
  * We also need to make sure pipe_ctx->plane_res.scl_data.h_active uses the
  * original h_border_left value in its calculation.
  */
-int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
+static int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
 {
 	int store_h_border_left = pipe_ctx->stream->timing.h_border_left;
 
@@ -972,7 +972,7 @@ int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
 	return store_h_border_left;
 }
 
-void restore_border_left_from_dst(struct pipe_ctx *pipe_ctx,
+static void restore_border_left_from_dst(struct pipe_ctx *pipe_ctx,
                                   int store_h_border_left)
 {
 	pipe_ctx->stream->dst.x -= store_h_border_left;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
