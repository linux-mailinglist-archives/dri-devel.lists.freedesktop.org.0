Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA46F17D9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750E010ED1B;
	Fri, 28 Apr 2023 12:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D882610ED09
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BED920090;
 Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmpf/q21GWaIAGN7ksknMjNWrXMP5lsi7+U1bi/yrnU=;
 b=YZGt364ZsBo0DOxa8rkK3JZwyXqTBizEg6w4h+r+AuCCJqW5Pyb3i7sLaZj6FhPYCd1zb8
 GJp9NiGhe7quEMHAQbfQa+gd9rl7wEDcp+z1LeO5HB/yT/r29DbiqxbPP7O1jt56/Db1X9
 s3mBP17eS9jTIZdQcc6rRKUH/0aPBZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmpf/q21GWaIAGN7ksknMjNWrXMP5lsi7+U1bi/yrnU=;
 b=YbyE4LOGe2ffd8pTWZBpl0qQHa3Xg9nxfoO+PITtRAeuLzYLECez6rJDqk117CNA7LNGGK
 T1sNxGrmRi8GQiBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 345071390E;
 Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iAr4Cxy7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:25:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 17/19] fbdev: Validate info->screen_{base,
 buffer} in fb_ops implementations
Date: Fri, 28 Apr 2023 14:24:50 +0200
Message-Id: <20230428122452.4856-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428122452.4856-1-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Push the test for info->screen_base from fb_read() and fb_write() into
the implementations of struct fb_ops.{fb_read,fb_write}. In cases where
the driver operates on info->screen_buffer, test this field instead.

While bothi fields, screen_base and screen_buffer, are stored in the
same location, they refer to different address spaces. For correctness,
we want to test each field in exactly the code that uses it.

v2:
	* also test screen_base in pvr2fb (Geert)
	* also test screen_buffer in ivtvfb, arcfb, broadsheetfb,
	  hecubafb, metronomefb and ssd1307fb (Geert)
	* give a rational for the change (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/media/pci/ivtv/ivtvfb.c        |  3 +++
 drivers/video/fbdev/arcfb.c            |  3 +++
 drivers/video/fbdev/broadsheetfb.c     |  3 +++
 drivers/video/fbdev/cobalt_lcdfb.c     |  6 ++++++
 drivers/video/fbdev/core/fb_sys_fops.c |  6 ++++++
 drivers/video/fbdev/core/fbmem.c       | 10 ++++++++--
 drivers/video/fbdev/hecubafb.c         |  3 +++
 drivers/video/fbdev/metronomefb.c      |  3 +++
 drivers/video/fbdev/pvr2fb.c           |  3 +++
 drivers/video/fbdev/sm712fb.c          |  4 ++--
 drivers/video/fbdev/ssd1307fb.c        |  3 +++
 11 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index 22123a25daea..0aeb9daaee4c 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -378,6 +378,9 @@ static ssize_t ivtvfb_write(struct fb_info *info, const char __user *buf,
 	unsigned long dma_size;
 	u16 lead = 0, tail = 0;
 
+	if (!info->screen_base)
+		return -ENODEV;
+
 	total_size = info->screen_size;
 
 	if (total_size == 0)
diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 088c4b30fd31..7750e020839e 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -451,6 +451,9 @@ static ssize_t arcfb_write(struct fb_info *info, const char __user *buf,
 	struct arcfb_par *par;
 	unsigned int xres;
 
+	if (!info->screen_buffer)
+		return -ENODEV;
+
 	p = *ppos;
 	par = info->par;
 	xres = info->var.xres;
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 691de5df581b..e9c5d5c04062 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1013,6 +1013,9 @@ static ssize_t broadsheetfb_write(struct fb_info *info, const char __user *buf,
 	int err = 0;
 	unsigned long total_size;
 
+	if (!info->screen_buffer)
+		return -ENODEV;
+
 	total_size = info->fix.smem_len;
 
 	if (p > total_size)
diff --git a/drivers/video/fbdev/cobalt_lcdfb.c b/drivers/video/fbdev/cobalt_lcdfb.c
index 5f8b6324d2e8..26dbd1c78195 100644
--- a/drivers/video/fbdev/cobalt_lcdfb.c
+++ b/drivers/video/fbdev/cobalt_lcdfb.c
@@ -129,6 +129,9 @@ static ssize_t cobalt_lcdfb_read(struct fb_info *info, char __user *buf,
 	unsigned long pos;
 	int len, retval = 0;
 
+	if (!info->screen_base)
+		return -ENODEV;
+
 	pos = *ppos;
 	if (pos >= LCD_CHARS_MAX || count == 0)
 		return 0;
@@ -175,6 +178,9 @@ static ssize_t cobalt_lcdfb_write(struct fb_info *info, const char __user *buf,
 	unsigned long pos;
 	int len, retval = 0;
 
+	if (!info->screen_base)
+		return -ENODEV;
+
 	pos = *ppos;
 	if (pos >= LCD_CHARS_MAX || count == 0)
 		return 0;
diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
index 7dee5d3c7fb1..0cb0989abda6 100644
--- a/drivers/video/fbdev/core/fb_sys_fops.c
+++ b/drivers/video/fbdev/core/fb_sys_fops.c
@@ -22,6 +22,9 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
 	unsigned long total_size, c;
 	ssize_t ret;
 
+	if (!info->screen_buffer)
+		return -ENODEV;
+
 	total_size = info->screen_size;
 
 	if (total_size == 0)
@@ -61,6 +64,9 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	unsigned long total_size, c;
 	size_t ret;
 
+	if (!info->screen_buffer)
+		return -ENODEV;
+
 	total_size = info->screen_size;
 
 	if (total_size == 0)
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index b0881348c27f..3a80d13afd26 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -768,7 +768,7 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	int c, cnt = 0, err = 0;
 	unsigned long total_size, trailing;
 
-	if (!info || ! info->screen_base)
+	if (!info)
 		return -ENODEV;
 
 	if (info->state != FBINFO_STATE_RUNNING)
@@ -777,6 +777,9 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	if (info->fbops->fb_read)
 		return info->fbops->fb_read(info, buf, count, ppos);
 
+	if (!info->screen_base)
+		return -ENODEV;
+
 	total_size = info->screen_size;
 
 	if (total_size == 0)
@@ -836,7 +839,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 	int c, cnt = 0, err = 0;
 	unsigned long total_size, trailing;
 
-	if (!info || !info->screen_base)
+	if (!info)
 		return -ENODEV;
 
 	if (info->state != FBINFO_STATE_RUNNING)
@@ -845,6 +848,9 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 	if (info->fbops->fb_write)
 		return info->fbops->fb_write(info, buf, count, ppos);
 
+	if (!info->screen_base)
+		return -ENODEV;
+
 	total_size = info->screen_size;
 
 	if (total_size == 0)
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index a2996d39f918..72308d4e0c22 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -163,6 +163,9 @@ static ssize_t hecubafb_write(struct fb_info *info, const char __user *buf,
 	int err = 0;
 	unsigned long total_size;
 
+	if (!info->screen_buffer)
+		return -ENODEV;
+
 	total_size = info->fix.smem_len;
 
 	if (p > total_size)
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 2bb068cadac6..7fc59466fe6c 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -523,6 +523,9 @@ static ssize_t metronomefb_write(struct fb_info *info, const char __user *buf,
 	int err = 0;
 	unsigned long total_size;
 
+	if (!info->screen_buffer)
+		return -ENODEV;
+
 	total_size = info->fix.smem_len;
 
 	if (p > total_size)
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 6888127a5eb8..550fdb5b4d41 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -647,6 +647,9 @@ static ssize_t pvr2fb_write(struct fb_info *info, const char *buf,
 	struct page **pages;
 	int ret, i;
 
+	if (!info->screen_base)
+		return -ENODEV;
+
 	nr_pages = (count + PAGE_SIZE - 1) >> PAGE_SHIFT;
 
 	pages = kmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL);
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 6f852cd756c5..b7ad3c644e13 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1028,7 +1028,7 @@ static ssize_t smtcfb_read(struct fb_info *info, char __user *buf,
 	int c, i, cnt = 0, err = 0;
 	unsigned long total_size;
 
-	if (!info || !info->screen_base)
+	if (!info->screen_base)
 		return -ENODEV;
 
 	total_size = info->screen_size;
@@ -1091,7 +1091,7 @@ static ssize_t smtcfb_write(struct fb_info *info, const char __user *buf,
 	int c, i, cnt = 0, err = 0;
 	unsigned long total_size;
 
-	if (!info || !info->screen_base)
+	if (!info->screen_base)
 		return -ENODEV;
 
 	total_size = info->screen_size;
diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 046b9990d27c..a8f2975de76b 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -301,6 +301,9 @@ static ssize_t ssd1307fb_write(struct fb_info *info, const char __user *buf,
 	void *dst;
 	int ret;
 
+	if (!info->screen_buffer)
+		return -ENODEV;
+
 	total_size = info->fix.smem_len;
 
 	if (p > total_size)
-- 
2.40.0

