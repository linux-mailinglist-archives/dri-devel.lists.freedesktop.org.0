Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449B6C4010
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 02:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4000210E195;
	Wed, 22 Mar 2023 01:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ABB10E195;
 Wed, 22 Mar 2023 01:59:29 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VeOm6Yv_1679450362; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VeOm6Yv_1679450362) by smtp.aliyun-inc.com;
 Wed, 22 Mar 2023 09:59:24 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Remove the unused variable
 dppclk_delay_subtotal
Date: Wed, 22 Mar 2023 09:59:17 +0800
Message-Id: <20230322015917.118874-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable dppclk_delay_subtotal is not effectively used, so delete it.

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1004:15: warning: variable 'dppclk_delay_subtotal' set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4584
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../display/dc/dml/dcn314/display_rq_dlg_calc_314.c    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
index 6576b897a512..d1c2693a2e28 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
@@ -1001,7 +1001,6 @@ static void dml_rq_dlg_get_dlg_params(
 	unsigned int vupdate_width;
 	unsigned int vready_offset;
 
-	unsigned int dppclk_delay_subtotal;
 	unsigned int dispclk_delay_subtotal;
 
 	unsigned int vstartup_start;
@@ -1130,17 +1129,8 @@ static void dml_rq_dlg_get_dlg_params(
 	vupdate_offset = dst->vupdate_offset;
 	vupdate_width = dst->vupdate_width;
 	vready_offset = dst->vready_offset;
-
-	dppclk_delay_subtotal = mode_lib->ip.dppclk_delay_subtotal;
 	dispclk_delay_subtotal = mode_lib->ip.dispclk_delay_subtotal;
 
-	if (scl_enable)
-		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl;
-	else
-		dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_scl_lb_only;
-
-	dppclk_delay_subtotal += mode_lib->ip.dppclk_delay_cnvc_formatter + src->num_cursors * mode_lib->ip.dppclk_delay_cnvc_cursor;
-
 	if (dout->dsc_enable) {
 		double dsc_delay = get_dsc_delay(mode_lib, e2e_pipe_param, num_pipes, pipe_idx); // FROM VBA
 
-- 
2.20.1.7.g153144c

