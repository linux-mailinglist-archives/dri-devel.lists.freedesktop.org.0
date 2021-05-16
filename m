Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706AE381EA3
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 14:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6616A6E508;
	Sun, 16 May 2021 12:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4B89B01;
 Sun, 16 May 2021 12:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5401B122;
 Sun, 16 May 2021 12:13:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 sakari.ailus@linux.intel.com
Subject: [PATCH 3/4] drm: Remove drm_get_format_name()
Date: Sun, 16 May 2021 14:13:14 +0200
Message-Id: <20210516121315.30321-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516121315.30321-1-tzimmermann@suse.de>
References: <20210516121315.30321-1-tzimmermann@suse.de>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sakari Ailus <sakari.ailus@linux.intel.com>

The %p4cc printk format modifier was recently added to print fourcc codes,
replacing drm_get_format_name(). The function is no longer needed, so
remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/drm_fourcc.c | 25 -------------------------
 include/drm/drm_fourcc.h     |  1 -
 2 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 03262472059c..5cf45aa6eedc 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -30,11 +30,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_fourcc.h>
 
-static char printable_char(int c)
-{
-	return isascii(c) && isprint(c) ? c : '?';
-}
-
 /**
  * drm_mode_legacy_fb_format - compute drm fourcc code from legacy description
  * @bpp: bits per pixels
@@ -130,26 +125,6 @@ uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_driver_legacy_fb_format);
 
-/**
- * drm_get_format_name - fill a string with a drm fourcc format's name
- * @format: format to compute name of
- * @buf: caller-supplied buffer
- */
-const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf)
-{
-	snprintf(buf->str, sizeof(buf->str),
-		 "%c%c%c%c %s-endian (0x%08x)",
-		 printable_char(format & 0xff),
-		 printable_char((format >> 8) & 0xff),
-		 printable_char((format >> 16) & 0xff),
-		 printable_char((format >> 24) & 0x7f),
-		 format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
-		 format);
-
-	return buf->str;
-}
-EXPORT_SYMBOL(drm_get_format_name);
-
 /*
  * Internal function to query information for a given format. See
  * drm_format_info() for the public API.
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 156b122c0ad5..3ea17b8a79d3 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -318,6 +318,5 @@ unsigned int drm_format_info_block_height(const struct drm_format_info *info,
 					  int plane);
 uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
 				   int plane, unsigned int buffer_width);
-const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf);
 
 #endif /* __DRM_FOURCC_H__ */
-- 
2.31.1

