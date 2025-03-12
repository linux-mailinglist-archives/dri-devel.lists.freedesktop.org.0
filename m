Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63537A5E0C8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291C210E2B4;
	Wed, 12 Mar 2025 15:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="QXjklLQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3CCE10E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=S1WUJ
 ADaCqY8wLRXgp+FLvNcgEj2zeHMScWZEdvC9P0=; b=QXjklLQaon2otUi05D3g9
 UZJoaL1qCUYXyYsRZiLaNebwNmExI6cVarmNCUy6Hj9YmyMw3+N9HZgAK9u7R/JH
 LNhNLZlCLAWm2bdFsNGxhwUBBqf0V6WAEkzkb7wVVG7QEwsUGkYseiBrfPmgv0F9
 PwiVJPFfi9MrxtWUvPJcx4=
Received: from DESKTOP-DMSSUQ5.localdomain (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgBnGxwErNFnmqUoAw--.31028S2;
 Wed, 12 Mar 2025 23:45:10 +0800 (CST)
From: Shixiong Ou <oushixiong1025@163.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, Jocelyn Falempe <jfalempe@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2 1/2] fbcon: Register sysfs groups through device_add_group
Date: Wed, 12 Mar 2025 23:45:06 +0800
Message-ID: <20250312154507.10881-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgBnGxwErNFnmqUoAw--.31028S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy7uF4fJFykZrWfXF1UWrg_yoW5Kw18pr
 4DJa4YgFW5G3ZrWw43Zw4DZ3sxWwn2k34fJws5Kw1fKF97A39Iqa48JFyjya4rtas7GF1r
 Ja4Dtry8AFWxWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjtC7UUUUU=
X-Originating-IP: [222.240.40.50]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYxoOD2fRnCz55AAAsj
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shixiong Ou <oushixiong@kylinos.cn>

Use device_add_group() to simplify creation and removal.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
v1->v2:
	fix build error.

 drivers/video/fbdev/core/fbcon.c | 49 ++++++++++++++------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index e8b4e8c119b5..9ee5f8492249 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3157,7 +3157,7 @@ static const struct consw fb_con = {
 	.con_debug_leave	= fbcon_debug_leave,
 };
 
-static ssize_t store_rotate(struct device *device,
+static ssize_t rotate_store(struct device *device,
 			    struct device_attribute *attr, const char *buf,
 			    size_t count)
 {
@@ -3179,7 +3179,7 @@ static ssize_t store_rotate(struct device *device,
 	return count;
 }
 
-static ssize_t store_rotate_all(struct device *device,
+static ssize_t rotate_all_store(struct device *device,
 				struct device_attribute *attr,const char *buf,
 				size_t count)
 {
@@ -3201,7 +3201,7 @@ static ssize_t store_rotate_all(struct device *device,
 	return count;
 }
 
-static ssize_t show_rotate(struct device *device,
+static ssize_t rotate_show(struct device *device,
 			   struct device_attribute *attr,char *buf)
 {
 	struct fb_info *info;
@@ -3220,7 +3220,7 @@ static ssize_t show_rotate(struct device *device,
 	return sysfs_emit(buf, "%d\n", rotate);
 }
 
-static ssize_t show_cursor_blink(struct device *device,
+static ssize_t cursor_blink_show(struct device *device,
 				 struct device_attribute *attr, char *buf)
 {
 	struct fb_info *info;
@@ -3245,7 +3245,7 @@ static ssize_t show_cursor_blink(struct device *device,
 	return sysfs_emit(buf, "%d\n", blink);
 }
 
-static ssize_t store_cursor_blink(struct device *device,
+static ssize_t cursor_blink_store(struct device *device,
 				  struct device_attribute *attr,
 				  const char *buf, size_t count)
 {
@@ -3279,32 +3279,30 @@ static ssize_t store_cursor_blink(struct device *device,
 	return count;
 }
 
-static struct device_attribute device_attrs[] = {
-	__ATTR(rotate, S_IRUGO|S_IWUSR, show_rotate, store_rotate),
-	__ATTR(rotate_all, S_IWUSR, NULL, store_rotate_all),
-	__ATTR(cursor_blink, S_IRUGO|S_IWUSR, show_cursor_blink,
-	       store_cursor_blink),
+static DEVICE_ATTR_RW(rotate);
+static DEVICE_ATTR_WO(rotate_all);
+static DEVICE_ATTR_RW(cursor_blink);
+
+static struct attribute *fbcon_device_attrs[] = {
+	&dev_attr_rotate.attr,
+	&dev_attr_rotate_all.attr,
+	&dev_attr_cursor_blink.attr,
+	NULL,
+};
+
+static const struct attribute_group fbcon_device_attr_group = {
+	.attrs		= fbcon_device_attrs,
 };
 
 static int fbcon_init_device(void)
 {
-	int i, error = 0;
+	int ret;
 
 	fbcon_has_sysfs = 1;
 
-	for (i = 0; i < ARRAY_SIZE(device_attrs); i++) {
-		error = device_create_file(fbcon_device, &device_attrs[i]);
-
-		if (error)
-			break;
-	}
-
-	if (error) {
-		while (--i >= 0)
-			device_remove_file(fbcon_device, &device_attrs[i]);
-
+	ret = device_add_group(fbcon_device, &fbcon_device_attr_group);
+	if (ret)
 		fbcon_has_sysfs = 0;
-	}
 
 	return 0;
 }
@@ -3387,11 +3385,8 @@ void __init fb_console_init(void)
 
 static void __exit fbcon_deinit_device(void)
 {
-	int i;
-
 	if (fbcon_has_sysfs) {
-		for (i = 0; i < ARRAY_SIZE(device_attrs); i++)
-			device_remove_file(fbcon_device, &device_attrs[i]);
+		device_remove_group(fbcon_device, &fbcon_device_attr_group);
 
 		fbcon_has_sysfs = 0;
 	}
-- 
2.43.0

