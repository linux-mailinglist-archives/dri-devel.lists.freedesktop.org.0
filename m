Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0272D65245E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E86710E390;
	Tue, 20 Dec 2022 16:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2DA10E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:12:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 15EF97648B;
 Tue, 20 Dec 2022 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQr8Ycy0FUY3zX700oOW2JqHChsiUNyuTUwjZDGGq48=;
 b=e3AgH0T6q9OK3FumAct8w9oj5Gw15WyoB89ddBvT42aLyoLNkjlIx2CiOoaiOobahtHWD8
 jHiVMmXaSmJrOaKCoRJV896aUM47/WeJ/GD2mU8IaQyVieb0McH+K8W7AulUJvf8JmqeNj
 j9ekZ+lOmFbRGgqPndfFQNBK8dKXlxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQr8Ycy0FUY3zX700oOW2JqHChsiUNyuTUwjZDGGq48=;
 b=8hy14LD5OHH5wtj/xxGzDrSUhQ1Ppm0PcQzogX/BEyyazYt1CS8p8LyiyW8hpwvNQuI91t
 yLjowEl+p9siA4BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E058C13910;
 Tue, 20 Dec 2022 16:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KNgANsXeoWMiZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:11:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 03/13] drm/format-helper: Fix test-input format conversion
Date: Tue, 20 Dec 2022 17:11:35 +0100
Message-Id: <20221220161145.27568-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220161145.27568-1-tzimmermann@suse.de>
References: <20221220161145.27568-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert test input for format helpers from host byte order to
little-endian order. The current code does it the other way around,
but there's no effective difference to the result.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index cd1d7da3483c..e7c49e6d3f6d 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -279,6 +279,21 @@ static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
 	return dst;
 }
 
+static __le32 *cpubuf_to_le32(struct kunit *test, const u32 *buf, size_t buf_size)
+{
+	__le32 *dst = NULL;
+	int n;
+
+	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
+	if (!dst)
+		return NULL;
+
+	for (n = 0; n < buf_size; n++)
+		dst[n] = cpu_to_le32(buf[n]);
+
+	return dst;
+}
+
 static void convert_xrgb8888_case_desc(struct convert_xrgb8888_case *t,
 				       char *desc)
 {
@@ -294,7 +309,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	const struct convert_to_gray8_result *result = &params->gray8_result;
 	size_t dst_size;
 	__u8 *buf = NULL;
-	__u32 *xrgb8888 = NULL;
+	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
 	struct drm_framebuffer fb = {
@@ -310,7 +325,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
 	iosys_map_set_vaddr(&dst, buf);
 
-	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
@@ -324,7 +339,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	const struct convert_to_rgb332_result *result = &params->rgb332_result;
 	size_t dst_size;
 	__u8 *buf = NULL;
-	__u32 *xrgb8888 = NULL;
+	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
 	struct drm_framebuffer fb = {
@@ -340,7 +355,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
 	iosys_map_set_vaddr(&dst, buf);
 
-	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
@@ -354,7 +369,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	const struct convert_to_rgb565_result *result = &params->rgb565_result;
 	size_t dst_size;
 	__u16 *buf = NULL;
-	__u32 *xrgb8888 = NULL;
+	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
 	struct drm_framebuffer fb = {
@@ -370,7 +385,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
 	iosys_map_set_vaddr(&dst, buf);
 
-	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
@@ -387,7 +402,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	const struct convert_to_rgb888_result *result = &params->rgb888_result;
 	size_t dst_size;
 	__u8 *buf = NULL;
-	__u32 *xrgb8888 = NULL;
+	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
 	struct drm_framebuffer fb = {
@@ -403,7 +418,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
 	iosys_map_set_vaddr(&dst, buf);
 
-	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
@@ -421,7 +436,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
 	size_t dst_size;
 	__u32 *buf = NULL;
-	__u32 *xrgb8888 = NULL;
+	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
 	struct drm_framebuffer fb = {
@@ -437,7 +452,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
 	iosys_map_set_vaddr(&dst, buf);
 
-	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
-- 
2.39.0

