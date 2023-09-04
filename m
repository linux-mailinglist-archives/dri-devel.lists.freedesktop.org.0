Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA83790FF0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5497610E279;
	Mon,  4 Sep 2023 02:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF0E10E279
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:14:35 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RfBwH0WmtzVjvT;
 Mon,  4 Sep 2023 10:11:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 4 Sep
 2023 10:14:32 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2] drm: gm12u320: Fix the timeout usage for usb_bulk_msg()
Date: Mon, 4 Sep 2023 10:14:20 +0800
Message-ID: <20230904021421.1663892-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The timeout arg of usb_bulk_msg() is ms already, which has been converted
to jiffies by msecs_to_jiffies() in usb_start_wait_urb(). So fix the usage
by removing the redundant msecs_to_jiffies() in the macros.

And as Hans suggested, also remove msecs_to_jiffies() for the IDLE_TIMEOUT
macro to make it consistent here and so change IDLE_TIMEOUT to
msecs_to_jiffies(IDLE_TIMEOUT) where it is used.

Fixes: e4f86e437164 ("drm: Add Grain Media GM12U320 driver v2")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
---
v2:
- Remove the msecs_to_jiffies() also for IDLE_TIMEOUT.
- Update the fix tag.
- Update the commit message.
---
 drivers/gpu/drm/tiny/gm12u320.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index c5bb683e440c..0187539ff5ea 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -70,10 +70,10 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
 #define READ_STATUS_SIZE		13
 #define MISC_VALUE_SIZE			4
 
-#define CMD_TIMEOUT			msecs_to_jiffies(200)
-#define DATA_TIMEOUT			msecs_to_jiffies(1000)
-#define IDLE_TIMEOUT			msecs_to_jiffies(2000)
-#define FIRST_FRAME_TIMEOUT		msecs_to_jiffies(2000)
+#define CMD_TIMEOUT			200
+#define DATA_TIMEOUT			1000
+#define IDLE_TIMEOUT			2000
+#define FIRST_FRAME_TIMEOUT		2000
 
 #define MISC_REQ_GET_SET_ECO_A		0xff
 #define MISC_REQ_GET_SET_ECO_B		0x35
@@ -389,7 +389,7 @@ static void gm12u320_fb_update_work(struct work_struct *work)
 	 * switches back to showing its logo.
 	 */
 	queue_delayed_work(system_long_wq, &gm12u320->fb_update.work,
-			   IDLE_TIMEOUT);
+			   msecs_to_jiffies(IDLE_TIMEOUT));
 
 	return;
 err:
-- 
2.34.1

