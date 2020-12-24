Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496582E2AFE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085DD89C84;
	Fri, 25 Dec 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1232E89C55
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 13:25:36 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D1rQn3h7jz15jCW;
 Thu, 24 Dec 2020 21:24:49 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 24 Dec 2020 21:25:25 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
 <jingoohan1@gmail.com>, <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 -next] video: backlight: use DEFINE_MUTEX() for mutex lock
Date: Thu, 24 Dec 2020 21:26:01 +0800
Message-ID: <20201224132601.31791-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/video/backlight/backlight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 537fe1b376ad..d7a09c422547 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -64,7 +64,7 @@
  */
 
 static struct list_head backlight_dev_list;
-static struct mutex backlight_dev_list_mutex;
+static DEFINE_MUTEX(backlight_dev_list_mutex);
 static struct blocking_notifier_head backlight_notifier;
 
 static const char *const backlight_types[] = {
@@ -757,7 +757,6 @@ static int __init backlight_class_init(void)
 	backlight_class->dev_groups = bl_device_groups;
 	backlight_class->pm = &backlight_class_dev_pm_ops;
 	INIT_LIST_HEAD(&backlight_dev_list);
-	mutex_init(&backlight_dev_list_mutex);
 	BLOCKING_INIT_NOTIFIER_HEAD(&backlight_notifier);
 
 	return 0;
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
