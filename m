Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C536F7BB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7299D6E47E;
	Fri, 30 Apr 2021 09:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA636E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 09:22:42 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UXFoP0B_1619774554; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UXFoP0B_1619774554) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 30 Apr 2021 17:22:39 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: airlied@redhat.com
Subject: [PATCH] drm/mgag200: Remove redundant assignment to status and clock
Date: Fri, 30 Apr 2021 17:22:32 +0800
Message-Id: <1619774552-118157-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tzimmermann@suse.de,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable status is set to zero but this value is never read as
it is overwritten with a new value later on,clock is being assigned
a value from a calculation however the variable is never read,hence
these are redundant assignments that can be removed.

Clean up the following clang-analyzer warning:

drivers/gpu/drm/mgag200/mgag200_mode.c:284:3: warning: Value stored to
'clock' is never read [clang-analyzer-deadcode.DeadStores].

drivers/gpu/drm/mgag200/mgag200_mode.c:98:2: warning: Value stored to
'status' is never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index cece3e5..c4d5be8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -95,7 +95,6 @@ static inline void mga_wait_vsync(struct mga_device *mdev)
 		status = RREG32(MGAREG_Status);
 	} while ((status & 0x08) && time_before(jiffies, timeout));
 	timeout = jiffies + HZ/10;
-	status = 0;
 	do {
 		status = RREG32(MGAREG_Status);
 	} while (!(status & 0x08) && time_before(jiffies, timeout));
@@ -280,8 +279,6 @@ static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 
 		p |= (fvv << 4);
 		m |= 0x80;
-
-		clock = clock / 2;
 	}
 
 	if (delta > permitteddelta) {
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
