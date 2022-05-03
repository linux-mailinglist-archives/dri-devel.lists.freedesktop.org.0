Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37762518A52
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 18:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BC8112099;
	Tue,  3 May 2022 16:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0010F79D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 16:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651596389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TrllH04Z0FbJPqB+LsRh6m4pc02+JciRd8et3EmsDus=;
 b=N5I9D5RVQFagh3A70iTHEoTeigGeuId0b2nr6e7fYhggPlBw0QvkOWzEy6Kc71MDu8BBug
 1o8fpiGOMHDC6PQUrArAnZlVle1t6bJkwkS2r2uFzFi1wBZB9F9tcdxPlrv2Z2PrRumORB
 h+AhW0h34KMxtNohw3afLdg/6vvF9Bo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-i6d_biPNOYSQthls9YwjAA-1; Tue, 03 May 2022 12:46:23 -0400
X-MC-Unique: i6d_biPNOYSQthls9YwjAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 d13-20020a05600c3acd00b0038ff865c043so1606428wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 09:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TrllH04Z0FbJPqB+LsRh6m4pc02+JciRd8et3EmsDus=;
 b=eLovvm6isADYiHAvFUxruTJKxfguXkPpIVC0q5TYuwtNzDz0SBiqR2Q/DGPQi9a5eN
 iJPkqpQLqB1xzRAgs6dvTixVf9WpsRcvgbeVSqXc2Qzo9qJMbFxjOz9KFVXptdariswJ
 P23knQ4v/yu+MSQ0etDI28Dr9h1M5kLDUpk4zxmZu6AGqWfmQDq6gCJU2ymBBIZxj+2n
 HZeFwu1+noDVUGm80aEGWB+1MxIYXSxG9V5ZVwmZj6mbwrdWle6RlxadqvKvel/wtP11
 Gkggev96RNwYIw8O1qLF90ZXDiBYb+AYdo89jsWWBn/NFt5JjQF7b2EDMMlNJTywOpvd
 7/pw==
X-Gm-Message-State: AOAM531zmOZ2QqnW92c0hvWZ/yAvR6Yp5akyoMHAAMTPbW/kWXUHktvc
 DJvtIcnyND9ppeaemiTj71OO4DD0xfjuK/uH1oeK3BsgkRKntVBk8DwhQGXhdJhIMBXx4/vpTC6
 zWkEOwhaS6G/YwlFIifi3p3XnlDNP
X-Received: by 2002:a05:6000:381:b0:20c:6911:f85b with SMTP id
 u1-20020a056000038100b0020c6911f85bmr6156736wrf.406.1651596382385; 
 Tue, 03 May 2022 09:46:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkoJMsy81rmxcDC++KPTzOsGoeFw5o8PT1mfBlyxN/nPJryyfAclRKStt6h+SOtC5xpxk/lw==
X-Received: by 2002:a05:6000:381:b0:20c:6911:f85b with SMTP id
 u1-20020a056000038100b0020c6911f85bmr6156722wrf.406.1651596382079; 
 Tue, 03 May 2022 09:46:22 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f11-20020adfc98b000000b0020c5253d910sm10464327wrh.92.2022.05.03.09.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 09:46:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: Use helper to get fb_info in all file operations
Date: Tue,  3 May 2022 18:46:16 +0200
Message-Id: <20220503164616.663796-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-fbdev@vger.kernel.org, Junxiao Chang <junxiao.chang@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A reference to the framebuffer device struct fb_info is stored in the file
private data, but this reference could no longer be valid and must not be
accessed directly. Instead, the file_fb_info() accessor function must be
used since it does sanity checking to make sure that the fb_info is valid.

This can happen for example if the registered framebuffer device is for a
driver that just uses a framebuffer provided by the system firmware. In
that case, the fbdev core would unregister the framebuffer device when a
real video driver is probed and ask to remove conflicting framebuffers.

Most fbdev file operations already use the helper to get the fb_info but
get_fb_unmapped_area() and fb_deferred_io_fsync() don't. Fix those two.

Since fb_deferred_io_fsync() is not in fbmem.o, the helper has to be
exported. Rename it and add a fb_ prefix to denote that is public now.

Reported-by: Junxiao Chang <junxiao.chang@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fb_defio.c |  5 ++++-
 drivers/video/fbdev/core/fbmem.c    | 24 +++++++++++++++---------
 include/linux/fb.h                  |  1 +
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 842c66b3e33d..ac1c88b3fbb5 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -68,12 +68,15 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 
 int fb_deferred_io_fsync(struct file *file, loff_t start, loff_t end, int datasync)
 {
-	struct fb_info *info = file->private_data;
+	struct fb_info *info = fb_file_fb_info(file->private_data);
 	struct inode *inode = file_inode(file);
 	int err = file_write_and_wait_range(file, start, end);
 	if (err)
 		return err;
 
+	if (!info)
+		return -ENODEV;
+
 	/* Skip if deferred io is compiled-in but disabled on this fbdev */
 	if (!info->fbdefio)
 		return 0;
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 97eb0dee411c..f924fda89dd5 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -745,7 +745,7 @@ static const struct seq_operations __maybe_unused proc_fb_seq_ops = {
  * So look up the fb_info using the inode minor number,
  * and just verify it against the reference we have.
  */
-static struct fb_info *file_fb_info(struct file *file)
+struct fb_info *fb_file_fb_info(struct file *file)
 {
 	struct inode *inode = file_inode(file);
 	int fbidx = iminor(inode);
@@ -755,12 +755,13 @@ static struct fb_info *file_fb_info(struct file *file)
 		info = NULL;
 	return info;
 }
+EXPORT_SYMBOL(fb_file_fb_info);
 
 static ssize_t
 fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
 	unsigned long p = *ppos;
-	struct fb_info *info = file_fb_info(file);
+	struct fb_info *info = fb_file_fb_info(file);
 	u8 *buffer, *dst;
 	u8 __iomem *src;
 	int c, cnt = 0, err = 0;
@@ -825,7 +826,7 @@ static ssize_t
 fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 {
 	unsigned long p = *ppos;
-	struct fb_info *info = file_fb_info(file);
+	struct fb_info *info = fb_file_fb_info(file);
 	u8 *buffer, *src;
 	u8 __iomem *dst;
 	int c, cnt = 0, err = 0;
@@ -1181,7 +1182,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 
 static long fb_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct fb_info *info = file_fb_info(file);
+	struct fb_info *info = fb_file_fb_info(file);
 
 	if (!info)
 		return -ENODEV;
@@ -1293,7 +1294,7 @@ static int fb_get_fscreeninfo(struct fb_info *info, unsigned int cmd,
 static long fb_compat_ioctl(struct file *file, unsigned int cmd,
 			    unsigned long arg)
 {
-	struct fb_info *info = file_fb_info(file);
+	struct fb_info *info = fb_file_fb_info(file);
 	const struct fb_ops *fb;
 	long ret = -ENOIOCTLCMD;
 
@@ -1333,7 +1334,7 @@ static long fb_compat_ioctl(struct file *file, unsigned int cmd,
 static int
 fb_mmap(struct file *file, struct vm_area_struct * vma)
 {
-	struct fb_info *info = file_fb_info(file);
+	struct fb_info *info = fb_file_fb_info(file);
 	int (*fb_mmap_fn)(struct fb_info *info, struct vm_area_struct *vma);
 	unsigned long mmio_pgoff;
 	unsigned long start;
@@ -1434,7 +1435,7 @@ fb_release(struct inode *inode, struct file *file)
 __acquires(&info->lock)
 __releases(&info->lock)
 {
-	struct fb_info * const info = file_fb_info(file);
+	struct fb_info * const info = fb_file_fb_info(file);
 
 	if (!info)
 		return -ENODEV;
@@ -1453,8 +1454,13 @@ unsigned long get_fb_unmapped_area(struct file *filp,
 				   unsigned long addr, unsigned long len,
 				   unsigned long pgoff, unsigned long flags)
 {
-	struct fb_info * const info = filp->private_data;
-	unsigned long fb_size = PAGE_ALIGN(info->fix.smem_len);
+	struct fb_info * const info = fb_file_fb_info(filp->private_data);
+	unsigned long fb_size;
+
+	if (!info)
+		return -ENODEV;
+
+	fb_size = PAGE_ALIGN(info->fix.smem_len);
 
 	if (pgoff > fb_size || len > fb_size - pgoff)
 		return -EINVAL;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 9a77ab615c36..3004b8b8c5c2 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -624,6 +624,7 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 			      struct fb_fix_screeninfo *fix);
 extern int fb_get_options(const char *name, char **option);
 extern int fb_new_modelist(struct fb_info *info);
+extern struct fb_info *fb_file_fb_info(struct file *file);
 
 extern struct fb_info *registered_fb[FB_MAX];
 extern int num_registered_fb;
-- 
2.35.1

