Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF3B12A22F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACDE6E33D;
	Tue, 24 Dec 2019 14:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0C16E233;
 Mon, 23 Dec 2019 09:18:46 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 87F11F98EC4AA724507B;
 Mon, 23 Dec 2019 17:18:42 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Dec 2019
 17:18:31 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/radeon: use true,false for bool variable in r100.c
Date: Mon, 23 Dec 2019 17:25:46 +0800
Message-ID: <1577093152-10855-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577093152-10855-1-git-send-email-zhengbin13@huawei.com>
References: <1577093152-10855-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/radeon/r100.c:1826:3-31: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/radeon/r100.c:1828:3-31: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/radeon/r100.c:2390:2-22: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/radeon/r100.c:2395:2-22: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/radeon/r100.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 29c966f..2c1166d 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -1823,9 +1823,9 @@ static int r100_packet0_check(struct radeon_cs_parser *p,
 	case RADEON_PP_TXFORMAT_2:
 		i = (reg - RADEON_PP_TXFORMAT_0) / 24;
 		if (idx_value & RADEON_TXFORMAT_NON_POWER2) {
-			track->textures[i].use_pitch = 1;
+			track->textures[i].use_pitch = true;
 		} else {
-			track->textures[i].use_pitch = 0;
+			track->textures[i].use_pitch = false;
 			track->textures[i].width = 1 << ((idx_value & RADEON_TXFORMAT_WIDTH_MASK) >> RADEON_TXFORMAT_WIDTH_SHIFT);
 			track->textures[i].height = 1 << ((idx_value & RADEON_TXFORMAT_HEIGHT_MASK) >> RADEON_TXFORMAT_HEIGHT_SHIFT);
 		}
@@ -2387,12 +2387,12 @@ void r100_cs_track_clear(struct radeon_device *rdev, struct r100_cs_track *track
 		else
 			track->num_texture = 6;
 		track->maxy = 2048;
-		track->separate_cube = 1;
+		track->separate_cube = true;
 	} else {
 		track->num_cb = 4;
 		track->num_texture = 16;
 		track->maxy = 4096;
-		track->separate_cube = 0;
+		track->separate_cube = false;
 		track->aaresolve = false;
 		track->aa.robj = NULL;
 	}
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
