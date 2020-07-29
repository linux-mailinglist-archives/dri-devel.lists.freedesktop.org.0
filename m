Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE94231F76
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 15:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4259F6E517;
	Wed, 29 Jul 2020 13:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ACE6E514
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 13:41:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0864DAF3B;
 Wed, 29 Jul 2020 13:42:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 b.zolnierkie@samsung.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@intel.com, peda@axentia.se,
 dan.carpenter@oracle.com, natechancellor@gmail.com
Subject: [PATCH 2/5] fbdev/core: Export framebuffer read and write code as
 cfb_ function
Date: Wed, 29 Jul 2020 15:41:45 +0200
Message-Id: <20200729134148.6855-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729134148.6855-1-tzimmermann@suse.de>
References: <20200729134148.6855-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM fb helpers require read and write functions for framebuffer
memory. Export the existing code from fbdev.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbmem.c | 53 ++++++++++++++++++++++----------
 include/linux/fb.h               |  5 +++
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index dd0ccf35f7b7..b496ff90db3e 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -759,25 +759,18 @@ static struct fb_info *file_fb_info(struct file *file)
 	return info;
 }
 
-static ssize_t
-fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
+		    loff_t *ppos)
 {
 	unsigned long p = *ppos;
-	struct fb_info *info = file_fb_info(file);
 	u8 *buffer, *dst;
 	u8 __iomem *src;
 	int c, cnt = 0, err = 0;
 	unsigned long total_size;
 
-	if (!info || ! info->screen_base)
-		return -ENODEV;
-
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_read)
-		return info->fbops->fb_read(info, buf, count, ppos);
-
 	total_size = info->screen_size;
 
 	if (total_size == 0)
@@ -823,16 +816,12 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 
 	return (err) ? err : cnt;
 }
+EXPORT_SYMBOL(fb_cfb_read);
 
 static ssize_t
-fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
+fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
-	unsigned long p = *ppos;
 	struct fb_info *info = file_fb_info(file);
-	u8 *buffer, *src;
-	u8 __iomem *dst;
-	int c, cnt = 0, err = 0;
-	unsigned long total_size;
 
 	if (!info || !info->screen_base)
 		return -ENODEV;
@@ -840,8 +829,20 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_write)
-		return info->fbops->fb_write(info, buf, count, ppos);
+	if (info->fbops->fb_read)
+		return info->fbops->fb_read(info, buf, count, ppos);
+	else
+		return fb_cfb_read(info, buf, count, ppos);
+}
+
+ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
+		     size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *src;
+	u8 __iomem *dst;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size;
 
 	total_size = info->screen_size;
 
@@ -895,6 +896,24 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 
 	return (cnt) ? cnt : err;
 }
+EXPORT_SYMBOL(fb_cfb_write);
+
+static ssize_t
+fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct fb_info *info = file_fb_info(file);
+
+	if (!info || !info->screen_base)
+		return -ENODEV;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	if (info->fbops->fb_write)
+		return info->fbops->fb_write(info, buf, count, ppos);
+	else
+		return fb_cfb_write(info, buf, count, ppos);
+}
 
 int
 fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 714187bc13ac..12ad83963db5 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -593,6 +593,11 @@ extern int fb_blank(struct fb_info *info, int blank);
 extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
+extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf,
+			   size_t count, loff_t *ppos);
+extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
+			    size_t count, loff_t *ppos);
+
 /*
  * Drawing operations where framebuffer is in system RAM
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
