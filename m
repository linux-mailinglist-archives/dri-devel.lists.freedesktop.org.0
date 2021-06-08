Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F539F62A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 14:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFB56E14C;
	Tue,  8 Jun 2021 12:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9E76E14C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 12:14:18 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fzpv80J0FzWsdF;
 Tue,  8 Jun 2021 20:09:24 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 20:14:14 +0800
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 8 Jun 2021 20:14:14 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <daniel.vetter@ffwll.ch>, <penguin-kernel@i-love.sakura.ne.jp>
Subject: [PATCH -next] fbdev: convert list_for_each to entry variant
Date: Tue, 8 Jun 2021 20:32:49 +0800
Message-ID: <1623155569-61744-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zou Wei <zou_wei@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

convert list_for_each() to list_for_each_entry() where
applicable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/video/fbdev/core/fbsysfs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 65dae05..753ecc8 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -130,14 +130,12 @@ static ssize_t store_mode(struct device *device, struct device_attribute *attr,
 	struct fb_var_screeninfo var;
 	struct fb_modelist *modelist;
 	struct fb_videomode *mode;
-	struct list_head *pos;
 	size_t i;
 	int err;
 
 	memset(&var, 0, sizeof(var));
 
-	list_for_each(pos, &fb_info->modelist) {
-		modelist = list_entry(pos, struct fb_modelist, list);
+	list_for_each_entry(modelist, &fb_info->modelist, list) {
 		mode = &modelist->mode;
 		i = mode_string(mstr, 0, mode);
 		if (strncmp(mstr, buf, max(count, i)) == 0) {
@@ -198,13 +196,11 @@ static ssize_t show_modes(struct device *device, struct device_attribute *attr,
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
 	unsigned int i;
-	struct list_head *pos;
 	struct fb_modelist *modelist;
 	const struct fb_videomode *mode;
 
 	i = 0;
-	list_for_each(pos, &fb_info->modelist) {
-		modelist = list_entry(pos, struct fb_modelist, list);
+	list_for_each_entry(modelist, &fb_info->modelist, list) {
 		mode = &modelist->mode;
 		i += mode_string(buf, i, mode);
 	}
-- 
2.6.2

