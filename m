Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91231403B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EC86E9EA;
	Mon,  8 Feb 2021 20:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu
 [IPv6:2a01:4f9:c010:4572::81:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21956E9EB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:20:01 +0000 (UTC)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
 by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0F4AA634C8D;
 Mon,  8 Feb 2021 22:08:34 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] drm/fourcc: Switch to %p4cc format modifier
Date: Mon,  8 Feb 2021 22:09:03 +0200
Message-Id: <20210208200903.28084-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of constructing the FourCC code manually, use the %p4cc printk
modifier to print it. Also leave a message to avoid using this function.

The next step would be to convert the users to use %p4cc directly instead
and removing the function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpu/drm/drm_fourcc.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 03262472059c..4ff40f2f27c0 100644
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
@@ -134,17 +129,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
  * drm_get_format_name - fill a string with a drm fourcc format's name
  * @format: format to compute name of
  * @buf: caller-supplied buffer
+ *
+ * Please use %p4cc printk format modifier instead of this function.
  */
 const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf)
 {
-	snprintf(buf->str, sizeof(buf->str),
-		 "%c%c%c%c %s-endian (0x%08x)",
-		 printable_char(format & 0xff),
-		 printable_char((format >> 8) & 0xff),
-		 printable_char((format >> 16) & 0xff),
-		 printable_char((format >> 24) & 0x7f),
-		 format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
-		 format);
+	snprintf(buf->str, sizeof(buf->str), "%p4cc", &format);
 
 	return buf->str;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
