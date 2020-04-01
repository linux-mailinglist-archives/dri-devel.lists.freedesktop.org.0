Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C419AD98
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 16:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E373F6E8DA;
	Wed,  1 Apr 2020 14:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 635 seconds by postgrey-1.36 at gabe;
 Wed, 01 Apr 2020 14:16:01 UTC
Received: from hillosipuli.retiisi.org.uk (retiisi.org.uk [95.216.213.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B0E6E8DA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 14:16:01 +0000 (UTC)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
 by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 51CD1634C87;
 Wed,  1 Apr 2020 17:04:41 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Date: Wed,  1 Apr 2020 17:05:22 +0300
Message-Id: <20200401140522.966-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: mchehab@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
the same implementation can be used.

Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/core-api/printk-formats.rst | 11 +++++++++
 lib/vsprintf.c                            | 29 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 8ebe46b1af39..b6249f513c09 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -545,6 +545,17 @@ For printing netdev_features_t.
 
 Passed by reference.
 
+V4L2 and DRM fourcc code (pixel format)
+---------------------------------------
+
+::
+
+	%ppf
+
+Print a 4cc code used by V4L2 or DRM.
+
+Passed by reference.
+
 Thanks
 ======
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7c488a1ce318..b39f0ac317c5 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1721,6 +1721,32 @@ char *netdev_bits(char *buf, char *end, const void *addr,
 	return special_hex_number(buf, end, num, size);
 }
 
+static noinline_for_stack
+char *pixel_format_string(char *buf, char *end, const u32 *fourcc,
+			  struct printf_spec spec, const char *fmt)
+{
+	char ch[2] = { 0 };
+	unsigned int i;
+
+	if (check_pointer(&buf, end, fourcc, spec))
+		return buf;
+
+	switch (fmt[1]) {
+	case 'f':
+		for (i = 0; i < sizeof(*fourcc); i++) {
+			ch[0] = *fourcc >> (i << 3);
+			buf = string(buf, end, ch, spec);
+		}
+
+		if (*fourcc & BIT(31))
+			buf = string(buf, end, "-BE", spec);
+
+		return buf;
+	default:
+		return error_string(buf, end, "(%pp?)", spec);
+	}
+}
+
 static noinline_for_stack
 char *address_val(char *buf, char *end, const void *addr,
 		  struct printf_spec spec, const char *fmt)
@@ -2131,6 +2157,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  *       correctness of the format string and va_list arguments.
  * - 'K' For a kernel pointer that should be hidden from unprivileged users
  * - 'NF' For a netdev_features_t
+ * - 'pf' V4L2 or DRM pixel format.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
@@ -2223,6 +2250,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
 		return netdev_bits(buf, end, ptr, spec, fmt);
+	case 'p':
+		return pixel_format_string(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, spec, fmt);
 	case 'd':
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
