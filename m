Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD9ADAB25
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170B510E2D9;
	Mon, 16 Jun 2025 08:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nB1k4opD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8acthdu4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yz9/mzoD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9vFJFOEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9898B10E2D9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:42:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 896941F38F;
 Mon, 16 Jun 2025 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750063343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKpGmsKITbtGwq7wIBYaw93VW/4UtR/H0nQK015CtSw=;
 b=nB1k4opDGwMVx9Fbq4Owqj9xV3iNv7xcBfHBhFfS/UMMcn2+IuT3Mh/B0wP5aTqafLGbZQ
 kr8UFbt5dOFNJr6EzmVVy6MmfqzKHurYkEHTqNNCDeDOR65ZCdPfyrNrdAfyJt/+RQs/3P
 96O2I+lk3xWW3f2bPsMl4zFHY8fR+w8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750063343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKpGmsKITbtGwq7wIBYaw93VW/4UtR/H0nQK015CtSw=;
 b=8acthdu4UBPrepY6iWQ3pKWOEUSilE0ZFSfuz2ZrhD0NUVYB60ZAGlCwDln95r4dsIaiFl
 SX5k28qFaiC54sBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750063342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKpGmsKITbtGwq7wIBYaw93VW/4UtR/H0nQK015CtSw=;
 b=yz9/mzoDiizCPb1kwNw/BXGSuuGyv5MQN0asAoCcGE5wT4IDvqV4WyQ85OPGIO6Fs0+zGP
 37WKJ9KCPjtvMuZIldzRaeXfyiXceX9rPZyZT/MZtYv61SJ4GDvXYxzHNgp02H+hBPzZK0
 If2bR728x60sE/5IGkYzu+Lcb3+LVd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750063342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKpGmsKITbtGwq7wIBYaw93VW/4UtR/H0nQK015CtSw=;
 b=9vFJFOEZSTxRCEs/EGnF8oNTujsSBrHfE/sM64FUKKSzsTMmi7cyYJoGzzc+YHnImcJuyZ
 XhvARJEV1L529JAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B7DF13A99;
 Mon, 16 Jun 2025 08:42:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UKsbEe7YT2gwPgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jun 2025 08:42:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arthurgrillo@riseup.net, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/3] drm/tests: Test drm_fb_build_fourcc_list() in separate
 test suite
Date: Mon, 16 Jun 2025 10:37:05 +0200
Message-ID: <20250616083846.221396-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616083846.221396-1-tzimmermann@suse.de>
References: <20250616083846.221396-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[riseup.net,gmail.com,redhat.com,linux.intel.com,kernel.org]; 
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80
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

Only sysfb drivers use drm_fb_build_fourcc_list(). The helper will
be moved from format helpers to sysfb helpers. Moving the related
tests to their own test suite.

v3:
- rename tests according to filename (José)
v2:
- rename filename to match tested code (Maxime)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/Makefile                |   3 +-
 .../gpu/drm/tests/drm_format_helper_test.c    | 142 ---------------
 .../gpu/drm/tests/drm_sysfb_modeset_test.c    | 166 ++++++++++++++++++
 3 files changed, 168 insertions(+), 143 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 3afd6587df08..c0e952293ad0 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o \
+	drm_sysfb_modeset_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 7fd4eac3c55e..ad06762db671 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1335,147 +1335,6 @@ static void drm_test_fb_clip_offset(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
 }
 
-struct fb_build_fourcc_list_case {
-	const char *name;
-	u32 native_fourccs[TEST_BUF_SIZE];
-	size_t native_fourccs_size;
-	u32 expected[TEST_BUF_SIZE];
-	size_t expected_fourccs_size;
-};
-
-static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
-	{
-		.name = "no native formats",
-		.native_fourccs = { },
-		.native_fourccs_size = 0,
-		.expected = { DRM_FORMAT_XRGB8888 },
-		.expected_fourccs_size = 1,
-	},
-	{
-		.name = "XRGB8888 as native format",
-		.native_fourccs = { DRM_FORMAT_XRGB8888 },
-		.native_fourccs_size = 1,
-		.expected = { DRM_FORMAT_XRGB8888 },
-		.expected_fourccs_size = 1,
-	},
-	{
-		.name = "remove duplicates",
-		.native_fourccs = {
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB565,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB565,
-			DRM_FORMAT_RGB565,
-			DRM_FORMAT_XRGB8888,
-		},
-		.native_fourccs_size = 11,
-		.expected = {
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB565,
-		},
-		.expected_fourccs_size = 3,
-	},
-	{
-		.name = "convert alpha formats",
-		.native_fourccs = {
-			DRM_FORMAT_ARGB1555,
-			DRM_FORMAT_ABGR1555,
-			DRM_FORMAT_RGBA5551,
-			DRM_FORMAT_BGRA5551,
-			DRM_FORMAT_ARGB8888,
-			DRM_FORMAT_ABGR8888,
-			DRM_FORMAT_RGBA8888,
-			DRM_FORMAT_BGRA8888,
-			DRM_FORMAT_ARGB2101010,
-			DRM_FORMAT_ABGR2101010,
-			DRM_FORMAT_RGBA1010102,
-			DRM_FORMAT_BGRA1010102,
-		},
-		.native_fourccs_size = 12,
-		.expected = {
-			DRM_FORMAT_XRGB1555,
-			DRM_FORMAT_XBGR1555,
-			DRM_FORMAT_RGBX5551,
-			DRM_FORMAT_BGRX5551,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_XBGR8888,
-			DRM_FORMAT_RGBX8888,
-			DRM_FORMAT_BGRX8888,
-			DRM_FORMAT_XRGB2101010,
-			DRM_FORMAT_XBGR2101010,
-			DRM_FORMAT_RGBX1010102,
-			DRM_FORMAT_BGRX1010102,
-		},
-		.expected_fourccs_size = 12,
-	},
-	{
-		.name = "random formats",
-		.native_fourccs = {
-			DRM_FORMAT_Y212,
-			DRM_FORMAT_ARGB1555,
-			DRM_FORMAT_ABGR16161616F,
-			DRM_FORMAT_C8,
-			DRM_FORMAT_BGR888,
-			DRM_FORMAT_XRGB1555,
-			DRM_FORMAT_RGBA5551,
-			DRM_FORMAT_BGR565_A8,
-			DRM_FORMAT_R10,
-			DRM_FORMAT_XYUV8888,
-		},
-		.native_fourccs_size = 10,
-		.expected = {
-			DRM_FORMAT_Y212,
-			DRM_FORMAT_XRGB1555,
-			DRM_FORMAT_ABGR16161616F,
-			DRM_FORMAT_C8,
-			DRM_FORMAT_BGR888,
-			DRM_FORMAT_RGBX5551,
-			DRM_FORMAT_BGR565_A8,
-			DRM_FORMAT_R10,
-			DRM_FORMAT_XYUV8888,
-			DRM_FORMAT_XRGB8888,
-		},
-		.expected_fourccs_size = 10,
-	},
-};
-
-static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
-{
-	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
-}
-
-KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
-
-static void drm_test_fb_build_fourcc_list(struct kunit *test)
-{
-	const struct fb_build_fourcc_list_case *params = test->param_value;
-	u32 fourccs_out[TEST_BUF_SIZE] = {0};
-	size_t nfourccs_out;
-	struct drm_device *drm;
-	struct device *dev;
-
-	dev = drm_kunit_helper_alloc_device(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
-
-	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
-
-	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
-						params->native_fourccs_size,
-						fourccs_out, TEST_BUF_SIZE);
-
-	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
-	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
-}
-
 struct fb_memcpy_case {
 	const char *name;
 	u32 format;
@@ -1864,7 +1723,6 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xbgr8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_abgr8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
-	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),
 	{}
 };
diff --git a/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
new file mode 100644
index 000000000000..5104fb21c6bc
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_kunit_helpers.h>
+
+#define TEST_BUF_SIZE 50
+
+struct fb_build_fourcc_list_case {
+	const char *name;
+	u32 native_fourccs[TEST_BUF_SIZE];
+	size_t native_fourccs_size;
+	u32 expected[TEST_BUF_SIZE];
+	size_t expected_fourccs_size;
+};
+
+static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
+	{
+		.name = "no native formats",
+		.native_fourccs = { },
+		.native_fourccs_size = 0,
+		.expected = { DRM_FORMAT_XRGB8888 },
+		.expected_fourccs_size = 1,
+	},
+	{
+		.name = "XRGB8888 as native format",
+		.native_fourccs = { DRM_FORMAT_XRGB8888 },
+		.native_fourccs_size = 1,
+		.expected = { DRM_FORMAT_XRGB8888 },
+		.expected_fourccs_size = 1,
+	},
+	{
+		.name = "remove duplicates",
+		.native_fourccs = {
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_XRGB8888,
+		},
+		.native_fourccs_size = 11,
+		.expected = {
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB565,
+		},
+		.expected_fourccs_size = 3,
+	},
+	{
+		.name = "convert alpha formats",
+		.native_fourccs = {
+			DRM_FORMAT_ARGB1555,
+			DRM_FORMAT_ABGR1555,
+			DRM_FORMAT_RGBA5551,
+			DRM_FORMAT_BGRA5551,
+			DRM_FORMAT_ARGB8888,
+			DRM_FORMAT_ABGR8888,
+			DRM_FORMAT_RGBA8888,
+			DRM_FORMAT_BGRA8888,
+			DRM_FORMAT_ARGB2101010,
+			DRM_FORMAT_ABGR2101010,
+			DRM_FORMAT_RGBA1010102,
+			DRM_FORMAT_BGRA1010102,
+		},
+		.native_fourccs_size = 12,
+		.expected = {
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_XBGR1555,
+			DRM_FORMAT_RGBX5551,
+			DRM_FORMAT_BGRX5551,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_XBGR8888,
+			DRM_FORMAT_RGBX8888,
+			DRM_FORMAT_BGRX8888,
+			DRM_FORMAT_XRGB2101010,
+			DRM_FORMAT_XBGR2101010,
+			DRM_FORMAT_RGBX1010102,
+			DRM_FORMAT_BGRX1010102,
+		},
+		.expected_fourccs_size = 12,
+	},
+	{
+		.name = "random formats",
+		.native_fourccs = {
+			DRM_FORMAT_Y212,
+			DRM_FORMAT_ARGB1555,
+			DRM_FORMAT_ABGR16161616F,
+			DRM_FORMAT_C8,
+			DRM_FORMAT_BGR888,
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_RGBA5551,
+			DRM_FORMAT_BGR565_A8,
+			DRM_FORMAT_R10,
+			DRM_FORMAT_XYUV8888,
+		},
+		.native_fourccs_size = 10,
+		.expected = {
+			DRM_FORMAT_Y212,
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_ABGR16161616F,
+			DRM_FORMAT_C8,
+			DRM_FORMAT_BGR888,
+			DRM_FORMAT_RGBX5551,
+			DRM_FORMAT_BGR565_A8,
+			DRM_FORMAT_R10,
+			DRM_FORMAT_XYUV8888,
+			DRM_FORMAT_XRGB8888,
+		},
+		.expected_fourccs_size = 10,
+	},
+};
+
+static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
+
+static void drm_test_fb_build_fourcc_list(struct kunit *test)
+{
+	const struct fb_build_fourcc_list_case *params = test->param_value;
+	u32 fourccs_out[TEST_BUF_SIZE] = {0};
+	size_t nfourccs_out;
+	struct drm_device *drm;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
+						params->native_fourccs_size,
+						fourccs_out, TEST_BUF_SIZE);
+
+	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
+	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
+}
+
+static struct kunit_case drm_sysfb_modeset_test_cases[] = {
+	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
+	{}
+};
+
+static struct kunit_suite drm_sysfb_modeset_test_suite = {
+	.name = "drm_sysfb_modeset_test",
+	.test_cases = drm_sysfb_modeset_test_cases,
+};
+
+kunit_test_suite(drm_sysfb_modeset_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the drm_sysfb_modeset APIs");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("José Expósito <jose.exposito89@gmail.com>");
-- 
2.49.0

