Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DABDD8F2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E6B10E75A;
	Wed, 15 Oct 2025 08:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dkqXPTeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AC810E75A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760518683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLvDXuuK5TFjki8xTeV/0ClBqUuVoMTNigyX86uOyAY=;
 b=dkqXPTeT1LhkyF/lYJj2Lk+Ad2W2e8SIxVcmKHqwAvn8NSjVsGxB+WXTlYWsGYFv+p5pp/
 tZOazuuikcn1gx/YFT8wRYQG9zR14ACBtppWmvy5IQyexEXaLIPs4WuEobi5nTphQoVN2/
 5QV/li3Ghb4SjWH0IT+c2AEt712LL/M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-uFc8LG9NOUuhmjocrmaT8g-1; Wed,
 15 Oct 2025 04:57:59 -0400
X-MC-Unique: uFc8LG9NOUuhmjocrmaT8g-1
X-Mimecast-MFC-AGG-ID: uFc8LG9NOUuhmjocrmaT8g_1760518678
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 71FC11956089; Wed, 15 Oct 2025 08:57:58 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.133])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B0DAD19560B0; Wed, 15 Oct 2025 08:57:55 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/panic: Add kunit tests for drm_panic
Date: Wed, 15 Oct 2025 10:51:43 +0200
Message-ID: <20251015085733.227684-3-jfalempe@redhat.com>
In-Reply-To: <20251015085733.227684-1-jfalempe@redhat.com>
References: <20251015085733.227684-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Add kunit tests for drm_panic.
They check that drawing the panic screen doesn't crash, but they
don't check the correctness of the resulting image.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v3:
 * Check the framebuffer content in drm_test_panic_screen_user_page().
 * Fix memory leaks, when the test fails (Maxime Ripard).

 MAINTAINERS                            |   1 +
 drivers/gpu/drm/drm_panic.c            |   4 +
 drivers/gpu/drm/tests/drm_panic_test.c | 218 +++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5980801ddc94..53af9617b3ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8619,6 +8619,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_draw.c
 F:	drivers/gpu/drm/drm_draw_internal.h
 F:	drivers/gpu/drm/drm_panic*.c
+F:	drivers/gpu/drm/tests/drm_panic_test.c
 F:	include/drm/drm_panic*
 
 DRM PANIC QR CODE
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 1e06e3a18d09..d89812ff1935 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -986,3 +986,7 @@ void drm_panic_exit(void)
 {
 	drm_panic_qr_exit();
 }
+
+#ifdef CONFIG_DRM_KUNIT_TEST
+#include "tests/drm_panic_test.c"
+#endif
diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
new file mode 100644
index 000000000000..49055e89bda0
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_panic_test.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/*
+ * Copyright (c) 2025 Red Hat.
+ * Author: Jocelyn Falempe <jfalempe@redhat.com>
+ *
+ * KUNIT tests for drm panic
+ */
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_panic.h>
+
+#include <kunit/test.h>
+
+#include <linux/units.h>
+#include <linux/vmalloc.h>
+
+/* Check the framebuffer color only if the panic colors are the default */
+#if (CONFIG_DRM_PANIC_BACKGROUND_COLOR == 0 && \
+	CONFIG_DRM_PANIC_FOREGROUND_COLOR == 0xffffff)
+
+static void drm_panic_check_color_byte(struct kunit *test, u8 b)
+{
+	KUNIT_EXPECT_TRUE(test, (b == 0 || b == 0xff));
+}
+#else
+static void drm_panic_check_color_byte(struct kunit *test, u8 b) {}
+#endif
+
+struct drm_test_mode {
+	const int width;
+	const int height;
+	const u32 format;
+	void (*draw_screen)(struct drm_scanout_buffer *sb);
+	const char *fname;
+};
+
+/*
+ * Run all tests for the 3 panic screens: user, kmsg and qr_code
+ */
+#define DRM_TEST_MODE_LIST(func) \
+	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_XRGB8888, func) \
+	DRM_PANIC_TEST_MODE(300, 200, DRM_FORMAT_XRGB8888, func) \
+	DRM_PANIC_TEST_MODE(1920, 1080, DRM_FORMAT_XRGB8888, func) \
+	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB565, func) \
+	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB888, func) \
+
+#define DRM_PANIC_TEST_MODE(w, h, f, name) { \
+	.width = w, \
+	.height = h, \
+	.format = f, \
+	.draw_screen = draw_panic_screen_##name, \
+	.fname = #name, \
+	}, \
+
+static const struct drm_test_mode drm_test_modes_cases[] = {
+	DRM_TEST_MODE_LIST(user)
+	DRM_TEST_MODE_LIST(kmsg)
+	DRM_TEST_MODE_LIST(qr_code)
+};
+#undef DRM_PANIC_TEST_MODE
+
+static int drm_test_panic_init(struct kunit *test)
+{
+	struct drm_scanout_buffer *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	test->priv = priv;
+
+	drm_panic_set_description("Kunit testing");
+
+	return 0;
+}
+
+/*
+ * Test drawing the panic screen, using a memory mapped framebuffer
+ * Set the whole buffer to 0xa5, and then check that all pixels have been
+ * written.
+ */
+static void drm_test_panic_screen_user_map(struct kunit *test)
+{
+	struct drm_scanout_buffer *sb = test->priv;
+	const struct drm_test_mode *params = test->param_value;
+	char *fb;
+	int fb_size;
+	int i;
+
+	sb->format = drm_format_info(params->format);
+	fb_size = params->width * params->height * sb->format->cpp[0];
+
+	fb = vmalloc(fb_size);
+	KUNIT_ASSERT_NOT_NULL(test, fb);
+
+	memset(fb, 0xa5, fb_size);
+
+	iosys_map_set_vaddr(&sb->map[0], fb);
+	sb->width = params->width;
+	sb->height = params->height;
+	sb->pitch[0] = params->width * sb->format->cpp[0];
+
+	params->draw_screen(sb);
+
+	for (i = 0; i < fb_size; i++)
+		drm_panic_check_color_byte(test, fb[i]);
+
+	vfree(fb);
+}
+
+/*
+ * Test drawing the panic screen, using a list of pages framebuffer
+ * Set the whole buffer to 0xa5, and then check that all pixels have been
+ * written.
+ */
+static void drm_test_panic_screen_user_page(struct kunit *test)
+{
+	struct drm_scanout_buffer *sb = test->priv;
+	const struct drm_test_mode *params = test->param_value;
+	int fb_size, p, i, npages;
+	struct page **pages;
+	u8 *vaddr;
+
+	sb->format = drm_format_info(params->format);
+	fb_size = params->width * params->height * sb->format->cpp[0];
+	npages = DIV_ROUND_UP(fb_size, PAGE_SIZE);
+
+	pages = kmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pages);
+
+	for (p = 0; p < npages; p++) {
+		pages[p] = alloc_page(GFP_KERNEL);
+		if (!pages[p]) {
+			npages = p - 1;
+			KUNIT_FAIL(test, "Can't allocate page\n");
+			goto free_pages;
+		}
+		vaddr = kmap_local_page(pages[p]);
+		memset(vaddr, 0xa5, PAGE_SIZE);
+		kunmap_local(vaddr);
+	}
+	sb->pages = pages;
+	sb->width = params->width;
+	sb->height = params->height;
+	sb->pitch[0] = params->width * sb->format->cpp[0];
+
+	params->draw_screen(sb);
+
+	for (p = 0; p < npages; p++) {
+		int bytes_in_page = (p == npages - 1) ? fb_size - p * PAGE_SIZE : PAGE_SIZE;
+
+		vaddr = kmap_local_page(pages[p]);
+		for (i = 0; i < bytes_in_page; i++)
+			drm_panic_check_color_byte(test, vaddr[i]);
+
+		kunmap_local(vaddr);
+	}
+
+free_pages:
+	for (p = 0; p < npages; p++)
+		__free_page(pages[p]);
+	kfree(pages);
+}
+
+static void drm_test_panic_set_pixel(struct drm_scanout_buffer *sb,
+				     unsigned int x,
+				     unsigned int y,
+				     u32 color)
+{
+	struct kunit *test = (struct kunit *) sb->private;
+
+	KUNIT_ASSERT_TRUE(test, x < sb->width && y < sb->height);
+}
+
+/*
+ * Test drawing the panic screen, using the set_pixel callback
+ * Check that all calls to set_pixel() are within the framebuffer
+ */
+static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
+{
+	struct drm_scanout_buffer *sb = test->priv;
+	const struct drm_test_mode *params = test->param_value;
+
+	sb->format = drm_format_info(params->format);
+	sb->set_pixel = drm_test_panic_set_pixel;
+	sb->width = params->width;
+	sb->height = params->height;
+	sb->private = test;
+
+	params->draw_screen(sb);
+}
+
+static void drm_test_panic_desc(const struct drm_test_mode *t, char *desc)
+{
+	sprintf(desc, "Panic screen %s, mode: %d x %d \t%p4cc",
+		t->fname, t->width, t->height, &t->format);
+}
+
+KUNIT_ARRAY_PARAM(drm_test_panic_screen_user_map, drm_test_modes_cases, drm_test_panic_desc);
+KUNIT_ARRAY_PARAM(drm_test_panic_screen_user_page, drm_test_modes_cases, drm_test_panic_desc);
+KUNIT_ARRAY_PARAM(drm_test_panic_screen_user_set_pixel, drm_test_modes_cases, drm_test_panic_desc);
+
+static struct kunit_case drm_panic_screen_user_test[] = {
+	KUNIT_CASE_PARAM(drm_test_panic_screen_user_map,
+			 drm_test_panic_screen_user_map_gen_params),
+	KUNIT_CASE_PARAM(drm_test_panic_screen_user_page,
+			 drm_test_panic_screen_user_page_gen_params),
+	KUNIT_CASE_PARAM(drm_test_panic_screen_user_set_pixel,
+			 drm_test_panic_screen_user_set_pixel_gen_params),
+	{ }
+};
+
+static struct kunit_suite drm_panic_suite = {
+	.name = "drm_panic",
+	.init = drm_test_panic_init,
+	.test_cases = drm_panic_screen_user_test,
+};
+
+kunit_test_suite(drm_panic_suite);
-- 
2.51.0

