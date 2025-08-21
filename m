Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1A1B2F49F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C3A10E918;
	Thu, 21 Aug 2025 09:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RjdAbZSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC10810E918
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755769969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SYzSNImSl+LPKPKIoN+DdHAjnOxi2k0cEcilhLXTaY=;
 b=RjdAbZSXphlbNNOa2NpnK4lXSrzxKq966fuqBdB79k7Uk3enL6VD20qP+loURDm8SazAos
 H5pWWvmQheqkWxy+6GAuCWJXrag+CWtPW+QZ3gpEVKvIIKgC2NxuCaxYQOnyrT+IpQX59F
 FIPgYrrKuljb9mfdT63sP3W/DSDoi4A=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-HOOafrVsOBe7CguEyxdt0A-1; Thu,
 21 Aug 2025 05:52:48 -0400
X-MC-Unique: HOOafrVsOBe7CguEyxdt0A-1
X-Mimecast-MFC-AGG-ID: HOOafrVsOBe7CguEyxdt0A_1755769966
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9773A1956087; Thu, 21 Aug 2025 09:52:46 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.33.118])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 98FE9197768D; Thu, 21 Aug 2025 09:52:43 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits results to
 png
Date: Thu, 21 Aug 2025 11:49:07 +0200
Message-ID: <20250821095228.648156-4-jfalempe@redhat.com>
In-Reply-To: <20250821095228.648156-1-jfalempe@redhat.com>
References: <20250821095228.648156-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a bit hacky, but very handy if you want to customize the
panic screen.
It allows to dump the generated images to the logs, and then a python
script can convert it to .png files. It makes it easy to check how
the panic screen will look on different resolutions, without having
to crash a VM.
To not pollute the logs, it uses a monochrome framebuffer, compress
it with zlib, and base64 encode it.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig.debug          |  14 ++++
 drivers/gpu/drm/tests/drm_panic_test.c | 111 +++++++++++++++++++++++++
 scripts/kunitpanic2png.py              |  53 ++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100755 scripts/kunitpanic2png.py

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 05dc43c0b8c5..d8ae85132d32 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -84,6 +84,20 @@ config DRM_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config DRM_PANIC_KUNIT_TEST_DUMP
+	bool "Enable screen dump to logs in KUnit tests for drm_panic"
+	default n
+	depends on DRM && DRM_PANIC && DRM_KUNIT_TEST
+	select ZLIB_DEFLATE
+	help
+	  This allows to dump the panic screen to the KUnit tests logs.
+	  It's possible with a small python script to write pngs from the logs.
+
+	  This is only to help developers customizing the drm_panic screen,
+	  checking the result for different resolutions.
+
+	  If in doubt, say "N"
+
 config DRM_TTM_KUNIT_TEST
 	tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
 	default n
diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
index 46ff3e5e0e5d..8cddb845aea9 100644
--- a/drivers/gpu/drm/tests/drm_panic_test.c
+++ b/drivers/gpu/drm/tests/drm_panic_test.c
@@ -115,24 +115,135 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
 	kfree(pages);
 }
 
+#ifdef CONFIG_DRM_PANIC_KUNIT_TEST_DUMP
+#include <linux/base64.h>
+#include <linux/delay.h>
+#include <linux/zlib.h>
+
+#define LINE_LEN 128
+
+#define COMPR_LEVEL 6
+#define WINDOW_BITS 12
+#define MEM_LEVEL 4
+
+static int compress_image(u8 *src, int size, u8 *dst)
+{
+	struct z_stream_s stream;
+
+	stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
+				   GFP_KERNEL);
+
+	if (zlib_deflateInit2(&stream, COMPR_LEVEL, Z_DEFLATED, WINDOW_BITS,
+			      MEM_LEVEL, Z_DEFAULT_STRATEGY) != Z_OK)
+		return -EINVAL;
+
+	stream.next_in = src;
+	stream.avail_in = size;
+	stream.total_in = 0;
+	stream.next_out = dst;
+	stream.avail_out = size;
+	stream.total_out = 0;
+
+	if (zlib_deflate(&stream, Z_FINISH) != Z_STREAM_END)
+		return -EINVAL;
+
+	if (zlib_deflateEnd(&stream) != Z_OK)
+		return -EINVAL;
+
+	kfree(stream.workspace);
+
+	return stream.total_out;
+}
+
+static void dump_image(u8 *fb, unsigned int width, unsigned int height)
+{
+	int len = 0;
+	char *dst;
+	char *compressed;
+	int sent = 0;
+	int stride = DIV_ROUND_UP(width, 8);
+	int size = stride * height;
+
+	compressed = vzalloc(size);
+	if (!compressed)
+		return;
+	len = compress_image(fb, size, compressed);
+	if (len < 0) {
+		pr_err("Compression failed %d", len);
+		return;
+	}
+
+	dst = vzalloc(4 * DIV_ROUND_UP(len, 3) + 1);
+	if (!dst)
+		return;
+
+	len = base64_encode(compressed, len, dst);
+
+	pr_info("KUNIT PANIC IMAGE DUMP START %dx%d", width, height);
+	while (len > 0) {
+		char save = dst[sent + LINE_LEN];
+
+		dst[sent + LINE_LEN] = 0;
+		pr_info("%s", dst + sent);
+		dst[sent + LINE_LEN] = save;
+		sent += LINE_LEN;
+		len -= LINE_LEN;
+	}
+	pr_info("KUNIT PANIC IMAGE DUMP END");
+	vfree(compressed);
+	vfree(dst);
+
+}
+
+// Ignore pixel format, use 1bit per pixel in monochrome.
 static void drm_test_panic_set_pixel(struct drm_scanout_buffer *sb,
 				     unsigned int x,
 				     unsigned int y,
 				     u32 color)
 {
+	int stride = DIV_ROUND_UP(sb->width, 8);
+	size_t off = x / 8 + y * stride;
+	u8 shift = 7 - (x % 8);
+	u8 *fb = (u8 *) sb->private;
+
+	if (color)
+		fb[off] |= 1 << shift;
+	else
+		fb[off] &= ~(1 << shift);
 }
 
+#else
+static void dump_image(u8 *fb, unsigned int width, unsigned int height) {}
+static void drm_test_panic_set_pixel(struct drm_scanout_buffer *sb,
+				     unsigned int x,
+				     unsigned int y,
+				     u32 color)
+{
+}
+#endif
+
 static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
 {
 	struct drm_scanout_buffer *sb = test->priv;
 	const struct drm_test_mode *params = test->param_value;
+	int fb_size;
+	u8 *fb;
 
 	sb->format = drm_format_info(params->format);
+	fb_size = DIV_ROUND_UP(params->width, 8) * params->height;
+
+	fb = vzalloc(fb_size);
+	KUNIT_ASSERT_NOT_NULL(test, fb);
+	sb->private = fb;
 	sb->set_pixel = drm_test_panic_set_pixel;
 	sb->width = params->width;
 	sb->height = params->height;
 
 	params->draw_screen(sb);
+	if (params->format == DRM_FORMAT_XRGB8888)
+		dump_image(fb, sb->width, sb->height);
+
+	vfree(fb);
 }
 
 static void drm_test_panic_desc(const struct drm_test_mode *t, char *desc)
diff --git a/scripts/kunitpanic2png.py b/scripts/kunitpanic2png.py
new file mode 100755
index 000000000000..e292afd7422c
--- /dev/null
+++ b/scripts/kunitpanic2png.py
@@ -0,0 +1,53 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2025 Red Hat.
+# Author: Jocelyn Falempe <jfalempe@redhat.com>
+
+from argparse import ArgumentParser
+from PIL import Image
+import base64
+import zlib
+
+def get_dim(s):
+    (w, h) = s.split('x')
+    return (int(w), int(h))
+
+def draw_image(img_data, width, height, n_img):
+
+    decoded = base64.b64decode(img_data)
+    unzipped = zlib.decompress(decoded)
+
+    img = Image.frombytes("1", (width, height), unzipped)
+    fname = f"panic_screen_{n_img}.png"
+    img.save(fname)
+    print(f"Image {width}x{height} saved to {fname}")
+
+def main():
+    parser = ArgumentParser(
+        prog="kunitpanic2png",
+        description="Read drm_panic kunit logs and translate that to png files")
+
+    parser.add_argument("filename", help="log file from kunit, usually test.log")
+
+    parsing_img = False
+    img_data = ""
+    n_img = 0
+
+    args = parser.parse_args()
+    with open(args.filename, "r") as f:
+        for line in f.readlines():
+            if line.startswith("KUNIT PANIC IMAGE DUMP START"):
+                parsing_img = True
+                width, height = get_dim(line.split()[-1])
+                continue
+            if line.startswith("KUNIT PANIC IMAGE DUMP END"):
+                draw_image(img_data, width, height, n_img)
+                parsing_img = False
+                img_data = ""
+                n_img += 1
+                continue
+            if parsing_img:
+                img_data += line.strip()
+
+main()
-- 
2.50.1

