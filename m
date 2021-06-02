Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF2A397F14
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 04:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EC86E175;
	Wed,  2 Jun 2021 02:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F2B6E175
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 02:29:37 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FvtCS5LzfzWptN;
 Wed,  2 Jun 2021 10:24:52 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 10:29:35 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 10:29:34 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-fbdev
 <linux-fbdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] video: fbdev: sm501fb: use DEVICE_ATTR_RO macro
Date: Wed, 2 Jun 2021 10:28:34 +0800
Message-ID: <20210602022834.10693-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DEVICE_ATTR_RO macro helper instead of plain DEVICE_ATTR, which makes
the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/video/fbdev/sm501fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index 6a52eba645596a4..d26afcfec4239aa 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1238,8 +1238,8 @@ static int sm501fb_show_regs(struct sm501fb_info *info, char *ptr,
  * show the crt control and cursor registers
 */
 
-static ssize_t sm501fb_debug_show_crt(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t fbregs_crt_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct sm501fb_info *info = dev_get_drvdata(dev);
 	char *ptr = buf;
@@ -1250,15 +1250,15 @@ static ssize_t sm501fb_debug_show_crt(struct device *dev,
 	return ptr - buf;
 }
 
-static DEVICE_ATTR(fbregs_crt, 0444, sm501fb_debug_show_crt, NULL);
+static DEVICE_ATTR_RO(fbregs_crt);
 
 /* sm501fb_debug_show_pnl
  *
  * show the panel control and cursor registers
 */
 
-static ssize_t sm501fb_debug_show_pnl(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t fbregs_pnl_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct sm501fb_info *info = dev_get_drvdata(dev);
 	char *ptr = buf;
@@ -1269,7 +1269,7 @@ static ssize_t sm501fb_debug_show_pnl(struct device *dev,
 	return ptr - buf;
 }
 
-static DEVICE_ATTR(fbregs_pnl, 0444, sm501fb_debug_show_pnl, NULL);
+static DEVICE_ATTR_RO(fbregs_pnl);
 
 static struct attribute *sm501fb_attrs[] = {
 	&dev_attr_crt_src.attr,
-- 
2.26.0.106.g9fadedd


