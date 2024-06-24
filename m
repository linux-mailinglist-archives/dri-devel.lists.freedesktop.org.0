Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DE6914040
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 03:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136F310E13B;
	Mon, 24 Jun 2024 01:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="w0VQq05d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B3610E13B;
 Mon, 24 Jun 2024 01:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719194239; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=kEmEdnA6MmtMya8ZtsQJGZHyWERAexbeV4W5aGUBu08=;
 b=w0VQq05dMCbB45n9A3HNmIUhU5xvZKEozjBK83f+itEOyjSi7QpWRXoWuQZcapO9gk66l8YylHNnjR7RxnldEtl/cLUSMfpEzqJ08oBzeDd2lKRJRbwcwrSmKUapqj9855Be38/mYLRayii5yYAg9V7Jb4XV5ROs9KHnMfhVuUg=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033045046011;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W90odGI_1719194229; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W90odGI_1719194229) by smtp.aliyun-inc.com;
 Mon, 24 Jun 2024 09:57:18 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: use swap() in is_config_schedulable()
Date: Mon, 24 Jun 2024 09:57:07 +0800
Message-Id: <20240624015707.121287-1-jiapeng.chong@linux.alibaba.com>
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

Use existing swap() function rather than duplicating its implementation.

./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c:1171:103-104: WARNING opportunity for swap().
./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c:1231:99-100: WARNING opportunity for swap().

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9400
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index 7272a04b9d1d..926d45496e79 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -1158,7 +1158,6 @@ static bool is_config_schedulable(
 	schedulable = true;
 
 	/* sort disallow times from greatest to least */
-	unsigned int temp;
 	for (i = 0; i < s->pmo_dcn4.num_timing_groups; i++) {
 		bool swapped = false;
 
@@ -1167,9 +1166,8 @@ static bool is_config_schedulable(
 			double jp1_disallow_us = s->pmo_dcn4.group_common_fams2_meta[s->pmo_dcn4.sorted_group_gtl_disallow_index[j + 1]].disallow_time_us;
 			if (j_disallow_us < jp1_disallow_us) {
 				/* swap as A < B */
-				temp = s->pmo_dcn4.sorted_group_gtl_disallow_index[j];
-				s->pmo_dcn4.sorted_group_gtl_disallow_index[j] = s->pmo_dcn4.sorted_group_gtl_disallow_index[j + 1];
-				s->pmo_dcn4.sorted_group_gtl_disallow_index[j + 1] = temp;
+				swap(s->pmo_dcn4.sorted_group_gtl_disallow_index[j],
+				     s->pmo_dcn4.sorted_group_gtl_disallow_index[j+1]);
 				swapped = true;
 			}
 		}
@@ -1227,9 +1225,8 @@ static bool is_config_schedulable(
 			double jp1_period_us = s->pmo_dcn4.group_common_fams2_meta[s->pmo_dcn4.sorted_group_gtl_period_index[j + 1]].period_us;
 			if (j_period_us < jp1_period_us) {
 				/* swap as A < B */
-				temp = s->pmo_dcn4.sorted_group_gtl_period_index[j];
-				s->pmo_dcn4.sorted_group_gtl_period_index[j] = s->pmo_dcn4.sorted_group_gtl_period_index[j + 1];
-				s->pmo_dcn4.sorted_group_gtl_period_index[j + 1] = temp;
+				swap(s->pmo_dcn4.sorted_group_gtl_period_index[j],
+				     s->pmo_dcn4.sorted_group_gtl_period_index[j+1]);
 				swapped = true;
 			}
 		}
-- 
2.20.1.7.g153144c

