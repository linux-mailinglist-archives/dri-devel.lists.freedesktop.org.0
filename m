Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFA731B827
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 12:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20826E160;
	Mon, 15 Feb 2021 11:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu
 [IPv6:2a01:4f9:c010:4572::81:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4406E10C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 11:40:34 +0000 (UTC)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
 by hillosipuli.retiisi.eu (Postfix) with ESMTP id 53D3B634C99;
 Mon, 15 Feb 2021 13:39:33 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Date: Mon, 15 Feb 2021 13:40:28 +0200
Message-Id: <20210215114030.11862-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
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

Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
pixel formats denoted by fourccs. The fourcc encoding is the same for both
so the same implementation can be used.

Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 Documentation/core-api/printk-formats.rst | 16 ++++++++++
 lib/test_printf.c                         | 17 ++++++++++
 lib/vsprintf.c                            | 39 +++++++++++++++++++++++
 scripts/checkpatch.pl                     |  6 ++--
 4 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 160e710d992f..da2aa065dc42 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -567,6 +567,22 @@ For printing netdev_features_t.
 
 Passed by reference.
 
+V4L2 and DRM FourCC code (pixel format)
+---------------------------------------
+
+::
+
+	%p4cc
+
+Print a FourCC code used by V4L2 or DRM, including format endianness and
+its numerical value as hexadecimal.
+
+Passed by reference.
+
+Examples::
+
+	%p4cc	BG12 little-endian (0x32314742)
+
 Thanks
 ======
 
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 7d60f24240a4..9848510a2786 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -647,6 +647,22 @@ static void __init fwnode_pointer(void)
 	software_node_unregister_nodes(softnodes);
 }
 
+static void __init fourcc_pointer(void)
+{
+	struct {
+		u32 code;
+		char *str;
+	} const try[] = {
+		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
+		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
+		{ 0x10111213, ".... little-endian (0x10111213)", },
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(try); i++)
+		test(try[i].str, "%p4cc", &try[i].code);
+}
+
 static void __init
 errptr(void)
 {
@@ -692,6 +708,7 @@ test_pointer(void)
 	flags();
 	errptr();
 	fwnode_pointer();
+	fourcc_pointer();
 }
 
 static void __init selftest(void)
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 3b53c73580c5..432b5a2d1e90 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1733,6 +1733,42 @@ char *netdev_bits(char *buf, char *end, const void *addr,
 	return special_hex_number(buf, end, num, size);
 }
 
+static noinline_for_stack
+char *fourcc_string(char *buf, char *end, const u32 *fourcc,
+		    struct printf_spec spec, const char *fmt)
+{
+	char output[sizeof("1234 little-endian (0x01234567)")];
+	char *p = output;
+	unsigned int i;
+	u32 val;
+
+	if (fmt[1] != 'c' || fmt[2] != 'c')
+		return error_string(buf, end, "(%p4?)", spec);
+
+	if (check_pointer(&buf, end, fourcc, spec))
+		return buf;
+
+	val = *fourcc & ~BIT(31);
+
+	for (i = 0; i < sizeof(*fourcc); i++) {
+		unsigned char c = val >> (i * 8);
+
+		/* Print non-control ASCII characters as-is, dot otherwise */
+		*p++ = isascii(c) && isprint(c) ? c : '.';
+	}
+
+	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
+	p += strlen(p);
+
+	*p++ = ' ';
+	*p++ = '(';
+	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc, sizeof(u32));
+	*p++ = ')';
+	*p = '\0';
+
+	return string(buf, end, output, spec);
+}
+
 static noinline_for_stack
 char *address_val(char *buf, char *end, const void *addr,
 		  struct printf_spec spec, const char *fmt)
@@ -2162,6 +2198,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  *       correctness of the format string and va_list arguments.
  * - 'K' For a kernel pointer that should be hidden from unprivileged users
  * - 'NF' For a netdev_features_t
+ * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
@@ -2259,6 +2296,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
 		return netdev_bits(buf, end, ptr, spec, fmt);
+	case '4':
+		return fourcc_string(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, spec, fmt);
 	case 'd':
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92e888ed939f..79858e07d023 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6557,9 +6557,11 @@ sub process {
 					$specifier = $1;
 					$extension = $2;
 					$qualifier = $3;
-					if ($extension !~ /[SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
+					if ($extension !~ /[4SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
 					    ($extension eq "f" &&
-					     defined $qualifier && $qualifier !~ /^w/)) {
+					     defined $qualifier && $qualifier !~ /^w/) ||
+					    ($extension eq "4" &&
+					     defined $qualifier && $qualifier !~ /^cc/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
