Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34B359F96
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4597C6EC19;
	Fri,  9 Apr 2021 13:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE726EC04
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 09:43:27 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGtRq6rH5z19L9M;
 Fri,  9 Apr 2021 17:41:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:43:18 +0800
From: Ye Bin <yebin10@huawei.com>
To: <yebin10@huawei.com>
Subject: [PATCH -next] video: fbdev: vermilion: use DEFINE_MUTEX() for mutex
 lock and LIST_HEAD() for list head
Date: Fri, 9 Apr 2021 17:51:43 +0800
Message-ID: <20210409095143.2294091-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 09 Apr 2021 13:12:15 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, linux-fbdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().
list head can be initialized automatically with LIST_HEAD()
rather than explicitly calling INIT_LIST_HEAD().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/video/fbdev/vermilion/vermilion.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/vermilion/vermilion.c b/drivers/video/fbdev/vermilion/vermilion.c
index ff61605b8764..689170d25bc8 100644
--- a/drivers/video/fbdev/vermilion/vermilion.c
+++ b/drivers/video/fbdev/vermilion/vermilion.c
@@ -35,9 +35,9 @@
 
 #define VML_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_val)) >> 16)
 
-static struct mutex vml_mutex;
-static struct list_head global_no_mode;
-static struct list_head global_has_mode;
+static DEFINE_MUTEX(vml_mutex);
+static LIST_HEAD(global_no_mode);
+static LIST_HEAD(global_has_mode);
 static struct fb_ops vmlfb_ops;
 static struct vml_sys *subsys = NULL;
 static char *vml_default_mode = "1024x768@60";
@@ -1058,9 +1058,6 @@ static int __init vmlfb_init(void)
 #endif
 
 	printk(KERN_DEBUG MODULE_NAME ": initializing\n");
-	mutex_init(&vml_mutex);
-	INIT_LIST_HEAD(&global_no_mode);
-	INIT_LIST_HEAD(&global_has_mode);
 
 	return pci_register_driver(&vmlfb_pci_driver);
 }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
