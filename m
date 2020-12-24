Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACD2E2AE7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4953389C0D;
	Fri, 25 Dec 2020 09:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB49489AEE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 13:22:38 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1rMK69h3z7K7J;
 Thu, 24 Dec 2020 21:21:49 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 24 Dec 2020 21:22:27 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 -next] drm: gma500: use DEFINE_MUTEX() for mutex lock
Date: Thu, 24 Dec 2020 21:23:04 +0800
Message-ID: <20201224132304.31015-1-zhengyongjun3@huawei.com>
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
 drivers/gpu/drm/gma500/power.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index bea8578846d1..b361e41c6acd 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -35,7 +35,7 @@
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 
-static struct mutex power_mutex;	/* Serialize power ops */
+static DEFINE_MUTEX(power_mutex);	/* Serialize power ops */
 static spinlock_t power_ctrl_lock;	/* Serialize power claim */
 
 /**
@@ -56,7 +56,6 @@ void gma_power_init(struct drm_device *dev)
 	dev_priv->display_count = 0;	/* Currently no users */
 	dev_priv->suspended = false;	/* And not suspended */
 	spin_lock_init(&power_ctrl_lock);
-	mutex_init(&power_mutex);
 
 	if (dev_priv->ops->init_pm)
 		dev_priv->ops->init_pm(dev);
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
