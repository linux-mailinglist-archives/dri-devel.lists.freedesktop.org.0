Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B83652466
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4300F10E153;
	Tue, 20 Dec 2022 16:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C5110E0D7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:12:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6CE157648F;
 Tue, 20 Dec 2022 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHLQaL0NNdBl78EWIIpR9nrb8Mb0adRztIkoif8TgoM=;
 b=IlxCYG6gwp19LDPqFE5gaSp2C9Fam49NkXlJaZhSHCXR087uxn9wR/9tvwKvBNjH1m5b+h
 14wmNUR6FSeeloX7MQm2py+iLRc5cCkte+7B1ELP2hM44iR0to1UP80hEdDlkjSReZEwk9
 3LlK9sSMpN7OfBQenaM4EQvxlVpyl14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHLQaL0NNdBl78EWIIpR9nrb8Mb0adRztIkoif8TgoM=;
 b=RLBcxtpSd4bRuCaLfcEQ5M/+5/nzxB/388edyb7iUBGqT5ab76IMXztsFMtSiYakIYcavF
 JF2CqOXfeueorCBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43AC313910;
 Tue, 20 Dec 2022 16:11:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GPTKD8beoWMiZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:11:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 05/13] drm/format-helper: Type fixes in format-helper tests
Date: Tue, 20 Dec 2022 17:11:37 +0100
Message-Id: <20221220161145.27568-6-tzimmermann@suse.de>
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

Change the source-buffer type of le32buf_to_cpu() to __le32* to
reflect endianness. Result buffers are converted to local endianness,
so instantiate them from regular u8 or u32 types.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 04fe373c9d97..c2411ec808a1 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -279,7 +279,7 @@ static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_siz
 	return dst;
 }
 
-static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
+static u32 *le32buf_to_cpu(struct kunit *test, const __le32 *buf, size_t buf_size)
 {
 	u32 *dst = NULL;
 	int n;
@@ -323,7 +323,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	const struct convert_xrgb8888_case *params = test->param_value;
 	const struct convert_to_gray8_result *result = &params->gray8_result;
 	size_t dst_size;
-	__u8 *buf = NULL;
+	u8 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
@@ -353,7 +353,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	const struct convert_xrgb8888_case *params = test->param_value;
 	const struct convert_to_rgb332_result *result = &params->rgb332_result;
 	size_t dst_size;
-	__u8 *buf = NULL;
+	u8 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
@@ -419,7 +419,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	const struct convert_xrgb8888_case *params = test->param_value;
 	const struct convert_to_rgb888_result *result = &params->rgb888_result;
 	size_t dst_size;
-	__u8 *buf = NULL;
+	u8 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
@@ -453,7 +453,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	const struct convert_xrgb8888_case *params = test->param_value;
 	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
 	size_t dst_size;
-	__u32 *buf = NULL;
+	u32 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
 
@@ -475,7 +475,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	iosys_map_set_vaddr(&src, xrgb8888);
 
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
-	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
 
-- 
2.39.0

