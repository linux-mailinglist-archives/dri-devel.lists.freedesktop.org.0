Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9E7FA0AC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A2110E27E;
	Mon, 27 Nov 2023 13:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7440310E270
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 164BF20407;
 Mon, 27 Nov 2023 13:17:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E7A3613B3A;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id qKt0N9KWZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 32/32] fbdev: Remove default file-I/O implementations
Date: Mon, 27 Nov 2023 14:16:01 +0100
Message-ID: <20231127131655.4020-33-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++
X-Spam-Score: 7.72
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de; dkim=none;
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: 164BF20407
X-Spam-Flag: NO
X-Spam-Level: *******
X-Spamd-Result: default: False [7.72 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5];
 R_RATELIMIT(0.00)[to_ip_from(RLd5zd8tio7mptchx3z93fk9kq)];
 RCVD_COUNT_THREE(0.00)[3]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.17)[-0.862];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-0.90)[-0.895];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the default implementations for file read, write and mmap
operations. Each fbdev driver must now provide an implementation
and select any necessary helpers. If no implementation has been
set, fbdev returns an errno code to user space. The code is the
same as if the operation had not been set in the file_operations
struct.

This change makes the fbdev helpers for I/O memory optional. Most
systems only use system-memory framebuffers via DRM's fbdev emulation.

v2:
	* warn once if I/O callbacks are missing (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/Kconfig     |  1 -
 drivers/video/fbdev/core/fb_chrdev.c | 37 +++++++++-------------------
 include/linux/fb.h                   |  5 ++++
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index faab5d50cac3c..21053bf00dc58 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -4,7 +4,6 @@
 #
 
 config FB_CORE
-	select FB_IOMEM_FOPS
 	select VIDEO_CMDLINE
 	tristate
 
diff --git a/drivers/video/fbdev/core/fb_chrdev.c b/drivers/video/fbdev/core/fb_chrdev.c
index 089441c9d810f..4ebd16b7e3b8d 100644
--- a/drivers/video/fbdev/core/fb_chrdev.c
+++ b/drivers/video/fbdev/core/fb_chrdev.c
@@ -34,13 +34,13 @@ static ssize_t fb_read(struct file *file, char __user *buf, size_t count, loff_t
 	if (!info)
 		return -ENODEV;
 
+	if (fb_WARN_ON_ONCE(info, !info->fbops->fb_read))
+		return -EINVAL;
+
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_read)
-		return info->fbops->fb_read(info, buf, count, ppos);
-
-	return fb_io_read(info, buf, count, ppos);
+	return info->fbops->fb_read(info, buf, count, ppos);
 }
 
 static ssize_t fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
@@ -50,13 +50,13 @@ static ssize_t fb_write(struct file *file, const char __user *buf, size_t count,
 	if (!info)
 		return -ENODEV;
 
+	if (fb_WARN_ON_ONCE(info, !info->fbops->fb_write))
+		return -EINVAL;
+
 	if (info->state != FBINFO_STATE_RUNNING)
 		return -EPERM;
 
-	if (info->fbops->fb_write)
-		return info->fbops->fb_write(info, buf, count, ppos);
-
-	return fb_io_write(info, buf, count, ppos);
+	return info->fbops->fb_write(info, buf, count, ppos);
 }
 
 static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
@@ -319,24 +319,11 @@ static int fb_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!info)
 		return -ENODEV;
 
-	mutex_lock(&info->mm_lock);
-
-	if (info->fbops->fb_mmap) {
-
-		res = info->fbops->fb_mmap(info, vma);
-#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
-	} else if (info->fbdefio) {
-		/*
-		 * FB deferred I/O wants you to handle mmap in your drivers. At a
-		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
-		 */
-		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O.\n");
-		res = -ENODEV;
-#endif
-	} else {
-		res = fb_io_mmap(info, vma);
-	}
+	if (fb_WARN_ON_ONCE(info, !info->fbops->fb_mmap))
+		return -ENODEV;
 
+	mutex_lock(&info->mm_lock);
+	res = info->fbops->fb_mmap(info, vma);
 	mutex_unlock(&info->mm_lock);
 
 	return res;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 24f0ec3662352..05dc9624897df 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -867,4 +867,9 @@ static inline bool fb_modesetting_disabled(const char *drvname)
 #define fb_warn_once(fb_info, fmt, ...)					\
 	pr_warn_once("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
 
+#define fb_WARN_ONCE(fb_info, condition, fmt, ...) \
+	WARN_ONCE(condition, "fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
+#define fb_WARN_ON_ONCE(fb_info, x) \
+	fb_WARN_ONCE(fb_info, (x), "%s", "fb_WARN_ON_ONCE(" __stringify(x) ")")
+
 #endif /* _LINUX_FB_H */
-- 
2.43.0

