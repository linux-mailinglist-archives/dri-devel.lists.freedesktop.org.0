Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48F56F17DA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A8A10ED0F;
	Fri, 28 Apr 2023 12:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D9E10ED1C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E53B921F5F;
 Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HsPIvbNC6GHuVXLVGI1uofvpk99oL+MDj5sIQvVPz5s=;
 b=y4yV0D6P6fdd85AriwE9Fk2PcJxrYjjSzuzQ9fHqMOUkQFtLElThbmkXZrIJDmDeDq5fJM
 tsutFZxwUJslFY0uqltPYWQc2tSRE95bDekMq6LhXOU99T2gHUafdF2DmdrYgcGr9RXsrS
 8WHlGqcKClxG+VHtvrjdfV573Yyvxbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HsPIvbNC6GHuVXLVGI1uofvpk99oL+MDj5sIQvVPz5s=;
 b=gQYcWUxOPM2V76h7aAdE8Va16JBFjxv9IwoGBnJLCYgjWPwFO2pBuGzxlvDLmlwxcqCvIx
 rnjlS5k1Zet0UlBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE8131390E;
 Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GODYKRy7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:25:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 19/19] drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
Date: Fri, 28 Apr 2023 14:24:52 +0200
Message-Id: <20230428122452.4856-20-tzimmermann@suse.de>
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

Implement DRM fbdev helpers for reading and writing framebuffer
memory with the respective fbdev functions. Removes duplicate
code.

v2:
	* rename fb_cfb_() to fb_io_() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 174 +-------------------------------
 1 file changed, 4 insertions(+), 170 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 6bb1b8b27d7a..f0e9549b6bd7 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -714,95 +714,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-typedef ssize_t (*drm_fb_helper_read_screen)(struct fb_info *info, char __user *buf,
-					     size_t count, loff_t pos);
-
-static ssize_t __drm_fb_helper_read(struct fb_info *info, char __user *buf, size_t count,
-				    loff_t *ppos, drm_fb_helper_read_screen read_screen)
-{
-	loff_t pos = *ppos;
-	size_t total_size;
-	ssize_t ret;
-
-	if (info->screen_size)
-		total_size = info->screen_size;
-	else
-		total_size = info->fix.smem_len;
-
-	if (pos >= total_size)
-		return 0;
-	if (count >= total_size)
-		count = total_size;
-	if (total_size - count < pos)
-		count = total_size - pos;
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	ret = read_screen(info, buf, count, pos);
-	if (ret > 0)
-		*ppos += ret;
-
-	return ret;
-}
-
-typedef ssize_t (*drm_fb_helper_write_screen)(struct fb_info *info, const char __user *buf,
-					      size_t count, loff_t pos);
-
-static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
-				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
-{
-	loff_t pos = *ppos;
-	size_t total_size;
-	ssize_t ret;
-	int err = 0;
-
-	if (info->screen_size)
-		total_size = info->screen_size;
-	else
-		total_size = info->fix.smem_len;
-
-	if (pos > total_size)
-		return -EFBIG;
-	if (count > total_size) {
-		err = -EFBIG;
-		count = total_size;
-	}
-	if (total_size - count < pos) {
-		if (!err)
-			err = -ENOSPC;
-		count = total_size - pos;
-	}
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	/*
-	 * Copy to framebuffer even if we already logged an error. Emulates
-	 * the behavior of the original fbdev implementation.
-	 */
-	ret = write_screen(info, buf, count, pos);
-	if (ret < 0)
-		return ret; /* return last error, if any */
-	else if (!ret)
-		return err; /* return previous error, if any */
-
-	*ppos += ret;
-
-	return ret;
-}
-
-static ssize_t drm_fb_helper_read_screen_buffer(struct fb_info *info, char __user *buf,
-						size_t count, loff_t pos)
-{
-	const char *src = info->screen_buffer + pos;
-
-	if (copy_to_user(buf, src, count))
-		return -EFAULT;
-
-	return count;
-}
-
 /**
  * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
  * @info: fb_info struct pointer
@@ -816,21 +727,10 @@ static ssize_t drm_fb_helper_read_screen_buffer(struct fb_info *info, char __use
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
 			       size_t count, loff_t *ppos)
 {
-	return __drm_fb_helper_read(info, buf, count, ppos, drm_fb_helper_read_screen_buffer);
+	return fb_sys_read(info, buf, count, ppos);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_read);
 
-static ssize_t drm_fb_helper_write_screen_buffer(struct fb_info *info, const char __user *buf,
-						 size_t count, loff_t pos)
-{
-	char *dst = info->screen_buffer + pos;
-
-	if (copy_from_user(dst, buf, count))
-		return -EFAULT;
-
-	return count;
-}
-
 /**
  * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
  * @info: fb_info struct pointer
@@ -849,7 +749,7 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 	ssize_t ret;
 	struct drm_rect damage_area;
 
-	ret = __drm_fb_helper_write(info, buf, count, ppos, drm_fb_helper_write_screen_buffer);
+	ret = fb_sys_write(info, buf, count, ppos);
 	if (ret <= 0)
 		return ret;
 
@@ -921,39 +821,6 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
-static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
-				   loff_t pos)
-{
-	const char __iomem *src = info->screen_base + pos;
-	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
-	ssize_t ret = 0;
-	int err = 0;
-	char *tmp;
-
-	tmp = kmalloc(alloc_size, GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	while (count) {
-		size_t c = min_t(size_t, count, alloc_size);
-
-		memcpy_fromio(tmp, src, c);
-		if (copy_to_user(buf, tmp, c)) {
-			err = -EFAULT;
-			break;
-		}
-
-		src += c;
-		buf += c;
-		ret += c;
-		count -= c;
-	}
-
-	kfree(tmp);
-
-	return ret ? ret : err;
-}
-
 /**
  * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
  * @info: fb_info struct pointer
@@ -967,43 +834,10 @@ static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_
 ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
 			       size_t count, loff_t *ppos)
 {
-	return __drm_fb_helper_read(info, buf, count, ppos, fb_read_screen_base);
+	return fb_io_read(info, buf, count, ppos);
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_read);
 
-static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
-				    loff_t pos)
-{
-	char __iomem *dst = info->screen_base + pos;
-	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
-	ssize_t ret = 0;
-	int err = 0;
-	u8 *tmp;
-
-	tmp = kmalloc(alloc_size, GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	while (count) {
-		size_t c = min_t(size_t, count, alloc_size);
-
-		if (copy_from_user(tmp, buf, c)) {
-			err = -EFAULT;
-			break;
-		}
-		memcpy_toio(dst, tmp, c);
-
-		dst += c;
-		buf += c;
-		ret += c;
-		count -= c;
-	}
-
-	kfree(tmp);
-
-	return ret ? ret : err;
-}
-
 /**
  * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
  * @info: fb_info struct pointer
@@ -1022,7 +856,7 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 	ssize_t ret;
 	struct drm_rect damage_area;
 
-	ret = __drm_fb_helper_write(info, buf, count, ppos, fb_write_screen_base);
+	ret = fb_io_write(info, buf, count, ppos);
 	if (ret <= 0)
 		return ret;
 
-- 
2.40.0

