Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A30D7FA0B0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF6310E282;
	Mon, 27 Nov 2023 13:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6F310E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E19CE21DAF;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BE4B5132A6;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id WOZcLdKWZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 31/32] fbdev: Warn on incorrect framebuffer access
Date: Mon, 27 Nov 2023 14:16:00 +0100
Message-ID: <20231127131655.4020-32-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++
X-Spam-Score: 7.72
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de; dkim=none;
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: E19CE21DAF
X-Spam-Flag: NO
X-Spam-Level: *******
X-Spamd-Result: default: False [7.72 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5];
 R_RATELIMIT(0.00)[to_ip_from(RLd5zd8tio7mptchx3z93fk9kq)];
 RCVD_COUNT_THREE(0.00)[3]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.17)[-0.865];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-0.90)[-0.898];
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

Test in framebuffer read, write and drawing helpers if FBINFO_VIRTFB
has been set correctly. Framebuffers in I/O memory should only be
accessed with the architecture's respective helpers. Framebuffers
in system memory should be accessed with the regular load and
store operations. Presumably not all drivers get this right, so we
now warn about it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/cfbcopyarea.c | 3 +++
 drivers/video/fbdev/core/cfbfillrect.c | 3 +++
 drivers/video/fbdev/core/cfbimgblt.c   | 3 +++
 drivers/video/fbdev/core/fb_io_fops.c  | 9 +++++++++
 drivers/video/fbdev/core/fb_sys_fops.c | 6 ++++++
 drivers/video/fbdev/core/syscopyarea.c | 3 +++
 drivers/video/fbdev/core/sysfillrect.c | 3 +++
 drivers/video/fbdev/core/sysimgblt.c   | 3 +++
 include/linux/fb.h                     | 8 +++++++-
 9 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
index 5b80bf3dae504..a271f57d9c6c1 100644
--- a/drivers/video/fbdev/core/cfbcopyarea.c
+++ b/drivers/video/fbdev/core/cfbcopyarea.c
@@ -391,6 +391,9 @@ void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
+	if (p->flags & FBINFO_VIRTFB)
+		fb_warn_once(p, "Framebuffer is not in I/O address space.");
+
 	/* if the beginning of the target area might overlap with the end of
 	the source area, be have to copy the area reverse. */
 	if ((dy == sy && dx > sx) || (dy > sy)) {
diff --git a/drivers/video/fbdev/core/cfbfillrect.c b/drivers/video/fbdev/core/cfbfillrect.c
index ba9f58b2a5e86..cbaa4c9e2355a 100644
--- a/drivers/video/fbdev/core/cfbfillrect.c
+++ b/drivers/video/fbdev/core/cfbfillrect.c
@@ -287,6 +287,9 @@ void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
+	if (p->flags & FBINFO_VIRTFB)
+		fb_warn_once(p, "Framebuffer is not in I/O address space.");
+
 	if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
 	    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
 		fg = ((u32 *) (p->pseudo_palette))[rect->color];
diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
index 9ebda4e0dc7ab..7d1d2f1a627dc 100644
--- a/drivers/video/fbdev/core/cfbimgblt.c
+++ b/drivers/video/fbdev/core/cfbimgblt.c
@@ -326,6 +326,9 @@ void cfb_imageblit(struct fb_info *p, const struct fb_image *image)
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
+	if (p->flags & FBINFO_VIRTFB)
+		fb_warn_once(p, "Framebuffer is not in I/O address space.");
+
 	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
 	start_index = bitstart & (32 - 1);
 	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
index 60805e43914e5..3408ff1b2b7a0 100644
--- a/drivers/video/fbdev/core/fb_io_fops.c
+++ b/drivers/video/fbdev/core/fb_io_fops.c
@@ -12,6 +12,9 @@ ssize_t fb_io_read(struct fb_info *info, char __user *buf, size_t count, loff_t
 	int c, cnt = 0, err = 0;
 	unsigned long total_size, trailing;
 
+	if (info->flags & FBINFO_VIRTFB)
+		fb_warn_once(info, "Framebuffer is not in I/O address space.");
+
 	if (!info->screen_base)
 		return -ENODEV;
 
@@ -73,6 +76,9 @@ ssize_t fb_io_write(struct fb_info *info, const char __user *buf, size_t count,
 	int c, cnt = 0, err = 0;
 	unsigned long total_size, trailing;
 
+	if (info->flags & FBINFO_VIRTFB)
+		fb_warn_once(info, "Framebuffer is not in I/O address space.");
+
 	if (!info->screen_base)
 		return -ENODEV;
 
@@ -138,6 +144,9 @@ int fb_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	u32 len = info->fix.smem_len;
 	unsigned long mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
 
+	if (info->flags & FBINFO_VIRTFB)
+		fb_warn_once(info, "Framebuffer is not in I/O address space.");
+
 	/*
 	 * This can be either the framebuffer mapping, or if pgoff points
 	 * past it, the mmio mapping.
diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
index 0cb0989abda61..a9aa6519a5b30 100644
--- a/drivers/video/fbdev/core/fb_sys_fops.c
+++ b/drivers/video/fbdev/core/fb_sys_fops.c
@@ -22,6 +22,9 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
 	unsigned long total_size, c;
 	ssize_t ret;
 
+	if (!(info->flags & FBINFO_VIRTFB))
+		fb_warn_once(info, "Framebuffer is not in virtual address space.");
+
 	if (!info->screen_buffer)
 		return -ENODEV;
 
@@ -64,6 +67,9 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	unsigned long total_size, c;
 	size_t ret;
 
+	if (!(info->flags & FBINFO_VIRTFB))
+		fb_warn_once(info, "Framebuffer is not in virtual address space.");
+
 	if (!info->screen_buffer)
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/core/syscopyarea.c b/drivers/video/fbdev/core/syscopyarea.c
index 7b8bd3a2bedc5..75e7001e8450f 100644
--- a/drivers/video/fbdev/core/syscopyarea.c
+++ b/drivers/video/fbdev/core/syscopyarea.c
@@ -324,6 +324,9 @@ void sys_copyarea(struct fb_info *p, const struct fb_copyarea *area)
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
+	if (!(p->flags & FBINFO_VIRTFB))
+		fb_warn_once(p, "Framebuffer is not in virtual address space.");
+
 	/* if the beginning of the target area might overlap with the end of
 	the source area, be have to copy the area reverse. */
 	if ((dy == sy && dx > sx) || (dy > sy)) {
diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index bcdcaeae6538c..e49221a88ccc7 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -242,6 +242,9 @@ void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
+	if (!(p->flags & FBINFO_VIRTFB))
+		fb_warn_once(p, "Framebuffer is not in virtual address space.");
+
 	if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
 	    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
 		fg = ((u32 *) (p->pseudo_palette))[rect->color];
diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
index 665ef7a0a2495..6949bbd51d920 100644
--- a/drivers/video/fbdev/core/sysimgblt.c
+++ b/drivers/video/fbdev/core/sysimgblt.c
@@ -296,6 +296,9 @@ void sys_imageblit(struct fb_info *p, const struct fb_image *image)
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
+	if (!(p->flags & FBINFO_VIRTFB))
+		fb_warn_once(p, "Framebuffer is not in virtual address space.");
+
 	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
 	start_index = bitstart & (32 - 1);
 	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index a36d05b576b0c..24f0ec3662352 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -849,7 +849,10 @@ static inline bool fb_modesetting_disabled(const char *drvname)
 }
 #endif
 
-/* Convenience logging macros */
+/*
+ * Convenience logging macros
+ */
+
 #define fb_err(fb_info, fmt, ...)					\
 	pr_err("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
 #define fb_notice(info, fmt, ...)					\
@@ -861,4 +864,7 @@ static inline bool fb_modesetting_disabled(const char *drvname)
 #define fb_dbg(fb_info, fmt, ...)					\
 	pr_debug("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
 
+#define fb_warn_once(fb_info, fmt, ...)					\
+	pr_warn_once("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
+
 #endif /* _LINUX_FB_H */
-- 
2.43.0

