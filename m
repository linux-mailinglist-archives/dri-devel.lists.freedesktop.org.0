Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3373528BD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CBE6EE41;
	Fri,  2 Apr 2021 09:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF416E042
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 03:13:42 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FBQ7S18gSz9sN1;
 Fri,  2 Apr 2021 11:11:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.62) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 11:13:32 +0800
From: Yu Jiahua <yujiahua1@huawei.com>
To: <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <zhengzucheng@huawei.com>, <hucool.lihua@huawei.com>
Subject: [PATCH] apply: use DEFINE_SPINLOCK() instead of spin_lock_init().
Date: Thu, 1 Apr 2021 19:13:31 -0800
Message-ID: <20210402031331.232848-1-yujiahua1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.62]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 02 Apr 2021 09:30:09 +0000
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
Cc: Jiahua Yu <yujiahua1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiahua Yu <yujiahua1@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Jiahua Yu <yujiahua1@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/apply.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/apply.c b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
index c71021091828..acca991c7540 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/apply.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
@@ -108,7 +108,7 @@ static struct {
 } dss_data;
 
 /* protects dss_data */
-static spinlock_t data_lock;
+static DEFINE_SPINLOCK(data_lock);
 /* lock for blocking functions */
 static DEFINE_MUTEX(apply_lock);
 static DECLARE_COMPLETION(extra_updated_completion);
@@ -131,8 +131,6 @@ static void apply_init_priv(void)
 	struct mgr_priv_data *mp;
 	int i;
 
-	spin_lock_init(&data_lock);
-
 	for (i = 0; i < num_ovls; ++i) {
 		struct ovl_priv_data *op;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
