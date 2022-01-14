Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFE48E877
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683C610EC34;
	Fri, 14 Jan 2022 10:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24EF10EC34;
 Fri, 14 Jan 2022 10:44:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0V1o5G54_1642157033; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0V1o5G54_1642157033) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 14 Jan 2022 18:43:58 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: "alexander.deucher@amd.comalexander.deucher"@amd.com
Subject: [PATCH] drm/amd/display: Remove redundant initialization of dpg_width
Date: Fri, 14 Jan 2022 18:43:52 +0800
Message-Id: <20220114104352.6107-1-jiapeng.chong@linux.alibaba.com>
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
Cc: , Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	""@linux.ie, dri-devel@lists.freedesktop.org,
	christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpg_width is being initialized to width but this is never read
as dpg_width is overwritten later on. Remove the redundant
initialization.

Cleans up the following clang-analyzer warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:6020:8:
warning: Value stored to 'dpg_width' during its initialization is never
read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 497470513e76..1f8831156bc4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -6017,7 +6017,7 @@ static void set_crtc_test_pattern(struct dc_link *link,
 		else if (link->dc->hwss.set_disp_pattern_generator) {
 			struct pipe_ctx *odm_pipe;
 			int opp_cnt = 1;
-			int dpg_width = width;
+			int dpg_width;
 
 			for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 				opp_cnt++;
-- 
2.20.1.7.g153144c

