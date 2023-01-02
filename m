Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7345B65B0FA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 12:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDCC10E318;
	Mon,  2 Jan 2023 11:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24F510E311
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 11:29:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5E11A20BEB;
 Mon,  2 Jan 2023 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672658971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5162jMj3NpvkqU3ZuZ7M/hleXKt6xPIgA4UQGhc968=;
 b=DC4zXjm+CmHBgO7at0r3d0pQ1pJl7c1cgcMRbOtBiECqVz8ZcE55MarYxzlETR9FcZOnEg
 JZ2q81rKRpmY8Yfx6nNt8RgS2Hlee8L/UN5v5+nyjXrj812us4nniRTu59+A3Afz010hup
 i2xrBlTDC6QvWwTzArs6co4/+ACcyK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672658971;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5162jMj3NpvkqU3ZuZ7M/hleXKt6xPIgA4UQGhc968=;
 b=ONj3ZDLyK61PtpcNeD9KO/sYPIitnqSaBEpxpgLa4czJoyo6f+8ZuC151HQPt+fE6JPCR8
 Svwdp6fvkM/db4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AADA13427;
 Mon,  2 Jan 2023 11:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OL6HCRvAsmOOcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 11:29:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 04/13] drm/format-helper: Store RGB565 in little-endian
 order
Date: Mon,  2 Jan 2023 12:29:18 +0100
Message-Id: <20230102112927.26565-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102112927.26565-1-tzimmermann@suse.de>
References: <20230102112927.26565-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix to-RGB565 conversion helpers to store the result in little-
endian byte order. Update test cases as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/drm_format_helper.c           |  9 +++++----
 .../gpu/drm/tests/drm_format_helper_test.c    | 20 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b98bd7c5caee..f3f3b3809a3e 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -322,7 +322,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
 static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	u16 *dbuf16 = dbuf;
+	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
 	u16 val16;
@@ -333,14 +333,15 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
 		val16 = ((pix & 0x00F80000) >> 8) |
 			((pix & 0x0000FC00) >> 5) |
 			((pix & 0x000000F8) >> 3);
-		dbuf16[x] = val16;
+		dbuf16[x] = cpu_to_le16(val16);
 	}
 }
 
+/* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
 static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
 						unsigned int pixels)
 {
-	u16 *dbuf16 = dbuf;
+	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
 	u16 val16;
@@ -351,7 +352,7 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
 		val16 = ((pix & 0x00F80000) >> 8) |
 			((pix & 0x0000FC00) >> 5) |
 			((pix & 0x000000F8) >> 3);
-		dbuf16[x] = swab16(val16);
+		dbuf16[x] = cpu_to_le16(swab16(val16));
 	}
 }
 
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index e7c49e6d3f6d..04fe373c9d97 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -264,6 +264,21 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
 	return dst_pitch * drm_rect_height(clip);
 }
 
+static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_size)
+{
+	u16 *dst = NULL;
+	int n;
+
+	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
+	if (!dst)
+		return NULL;
+
+	for (n = 0; n < buf_size; n++)
+		dst[n] = le16_to_cpu(buf[n]);
+
+	return dst;
+}
+
 static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
 {
 	u32 *dst = NULL;
@@ -368,7 +383,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	const struct convert_xrgb8888_case *params = test->param_value;
 	const struct convert_to_rgb565_result *result = &params->rgb565_result;
 	size_t dst_size;
-	__u16 *buf = NULL;
+	u16 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
@@ -390,9 +405,12 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	iosys_map_set_vaddr(&src, xrgb8888);
 
 	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, false);
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 
+	buf = dst.vaddr; /* restore original value of buf */
 	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
+	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
 }
 
-- 
2.39.0

