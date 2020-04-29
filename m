Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4A1BF196
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BB86EB81;
	Thu, 30 Apr 2020 07:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A156EEA2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:10:28 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EF597D0A7553792897A7;
 Wed, 29 Apr 2020 22:10:24 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 22:10:16 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: valkyriefb.c: fix warning comparing pointer to 0
Date: Wed, 29 Apr 2020 22:09:42 +0800
Message-ID: <20200429140942.8137-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/video/fbdev/valkyriefb.c:348:10-11: WARNING comparing pointer to
0, suggest !E
drivers/video/fbdev/valkyriefb.c:334:12-13: WARNING comparing pointer to
0
drivers/video/fbdev/valkyriefb.c:348:10-11: WARNING comparing pointer to
0

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/valkyriefb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index 4d20c4603e5a..8425afe37d7c 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -331,7 +331,7 @@ int __init valkyriefb_init(void)
 		struct resource r;
 
 		dp = of_find_node_by_name(NULL, "valkyrie");
-		if (dp == 0)
+		if (!dp)
 			return 0;
 
 		if (of_address_to_resource(dp, 0, &r)) {
@@ -345,7 +345,7 @@ int __init valkyriefb_init(void)
 #endif /* ppc (!CONFIG_MAC) */
 
 	p = kzalloc(sizeof(*p), GFP_ATOMIC);
-	if (p == 0)
+	if (!p)
 		return -ENOMEM;
 
 	/* Map in frame buffer and registers */
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
