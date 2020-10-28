Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530429E603
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA156E8A0;
	Thu, 29 Oct 2020 08:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5F96E49C;
 Wed, 28 Oct 2020 08:24:29 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CLhSV3Vzrzhbkn;
 Wed, 28 Oct 2020 16:24:26 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 16:24:12 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amd/display: remove useless if/else
Date: Wed, 28 Oct 2020 16:36:11 +0800
Message-ID: <1603874171-106841-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Zou Wei <zou_wei@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccinelle report:

./drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:1367:3-5:
WARNING: possible condition with no effect (if == else)

Both branches are the same, so remove the if/else altogether.

Fixes: 81875979f0b2 ("drm/amd/display: Remove extra pairs of parentheses in dce_calcs.c")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
index 2c6db37..e4f29cd 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
@@ -1364,13 +1364,10 @@ static void calculate_bandwidth(
 	/*if stutter and dram clock state change are gated before cursor then the cursor latency hiding does not limit stutter or dram clock state change*/
 	for (i = 0; i <= maximum_number_of_surfaces - 1; i++) {
 		if (data->enable[i]) {
-			if (dceip->graphics_lb_nodownscaling_multi_line_prefetching == 1) {
-				data->maximum_latency_hiding[i] = bw_add(data->minimum_latency_hiding[i], bw_mul(bw_frc_to_fixed(5, 10), data->total_dmifmc_urgent_latency));
-			}
-			else {
-				/*maximum_latency_hiding(i) = minimum_latency_hiding(i) + 1 / vsr(i) * h_total(i) / pixel_rate(i) + 0.5 * total_dmifmc_urgent_latency*/
-				data->maximum_latency_hiding[i] = bw_add(data->minimum_latency_hiding[i], bw_mul(bw_frc_to_fixed(5, 10), data->total_dmifmc_urgent_latency));
-			}
+			/*maximum_latency_hiding(i) = minimum_latency_hiding(i) + 1 / vsr(i) **/
+			/*      h_total(i) / pixel_rate(i) + 0.5 * total_dmifmc_urgent_latency*/
+			data->maximum_latency_hiding[i] = bw_add(data->minimum_latency_hiding[i],
+				bw_mul(bw_frc_to_fixed(5, 10), data->total_dmifmc_urgent_latency));
 			data->maximum_latency_hiding_with_cursor[i] = bw_min2(data->maximum_latency_hiding[i], data->cursor_latency_hiding[i]);
 		}
 	}
-- 
2.6.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
