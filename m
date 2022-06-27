Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1855BB02
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 18:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1C210E675;
	Mon, 27 Jun 2022 16:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90B110E675
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:13:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i1so9276578wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FrWIJqMRTMApBIT0XGEXMBk+DhL+WfBH3A+0ox/Q7jM=;
 b=MdzmxDg5EJsI62qcflHw3guB6lJxYS/DxcUDUx+yNKAan6MZtpIBxAu895Nm6GiIFw
 TvFwkJPNZ9JlayYLFYVMPb3v3Fstm0De3PkzA5ieUSgTsF/9r85HrBFp8jLL8ko7vVfA
 zVFcoic8ic3bWcDEfMYBPT8MAmVWJXoWLte77shZuzG+G7UZ6OylnquNjSpWQ4Xf8stH
 aGaBbl4H5jlTWOW1fKRzEqvVEtcdNWQSQ3xk+hjG4zIWkfHouSGcYpHitwcp//kpbdQ8
 KIxfWDmVNWQ+Q1YmEHqQASZypeLHe9w/pgtbdswh2bXvdBp/4zhYAKLGiDr/czgccAIV
 5hGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrWIJqMRTMApBIT0XGEXMBk+DhL+WfBH3A+0ox/Q7jM=;
 b=C8yqcRRokaaxT6uSdiqKBdalJepuKKRgyPP4hPwgOiocTd5Ju2ZpO0QmF+Yo78PVwE
 aHnaCOAw8HmFfF3YwUm+IyAH/M/nqgnIzdQmn5SzTwktGg2/rBcfXHqd3/O/JUYQ7HkH
 BQy+ocLe6bL1jyXcCteDtp3hEuPJcC3ufXm2Z6DCa7373jBbPUr0bJqZVRqArVhlhoiR
 y8pr2jBXU/xY8nHk4cxMT1ugL2dESY+K5s7Xr4yyYVzm5j9ke+ZBUFHVQSS8RFH8Xec+
 HA1MG8EPPOm1lwIuaomE/fU6003Kca6G1GzbH7bqueNHtjvQUWqAJ7tUwxZGM+aYEShR
 PJrg==
X-Gm-Message-State: AJIora/zyhVtjFpCcPhURmdRotB5YGxa2acfedYFkrCVdpJh5WU1Kr7l
 s+sXqql9wzm4Oc7NvpLwzmY=
X-Google-Smtp-Source: AGRyM1u/uNhUsvw8yU5xnnlABNgZfGfiv52Jrb+33VlYHZJ28RkbDxos0k2S2DlyBEItf23WTdMleQ==
X-Received: by 2002:a5d:5047:0:b0:21b:92b2:f34f with SMTP id
 h7-20020a5d5047000000b0021b92b2f34fmr12668117wrt.677.1656346388493; 
 Mon, 27 Jun 2022 09:13:08 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm10883600wrs.31.2022.06.27.09.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:13:08 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 3/4] drm/format-helper: Add support for conversion functions
 with swab
Date: Mon, 27 Jun 2022 18:11:31 +0200
Message-Id: <20220627161132.33256-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627161132.33256-1-jose.exposito89@gmail.com>
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RGB565 conversion functions take an extra parameter ("swab")
indicating whether the bytes should be swapped into the clip buffer or
not.

Create a union in the "convert_xrgb8888_result" structure holding the
value of the "swab" parameter as well as the conversion function
pointer.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 44 ++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 732d945e7f4e..52dc41cc7c60 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -16,12 +16,29 @@
 
 #define TEST_BUF_SIZE 50
 
+struct convert_xrgb8888_func {
+	void (*func)(void *dst, unsigned int dst_pitch,
+		     const void *src,
+		     const struct drm_framebuffer *fb,
+		     const struct drm_rect *clip);
+};
+
+struct convert_xrgb8888_func_swab {
+	void (*func)(void *dst, unsigned int dst_pitch,
+		     const void *src,
+		     const struct drm_framebuffer *fb,
+		     const struct drm_rect *clip,
+		     bool swab);
+	bool swab;
+};
+
 struct convert_xrgb8888_result {
 	u32 dst_format;
-	void (*conv_func)(void *dst, unsigned int dst_pitch,
-			  const void *src,
-			  const struct drm_framebuffer *fb,
-			  const struct drm_rect *clip);
+	bool has_swab;
+	union {
+		struct convert_xrgb8888_func conv;
+		struct convert_xrgb8888_func_swab conv_swab;
+	};
 	unsigned int dst_pitch;
 	const u8 expected[4 * TEST_BUF_SIZE];
 };
@@ -43,7 +60,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.results = {
 			{
 				.dst_format = DRM_FORMAT_RGB332,
-				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.conv = { .func = drm_fb_xrgb8888_to_rgb332 },
 				.dst_pitch = 0,
 				.expected = { 0xE0 },
 			},
@@ -60,7 +77,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.results = {
 			{
 				.dst_format = DRM_FORMAT_RGB332,
-				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.conv = { .func = drm_fb_xrgb8888_to_rgb332 },
 				.dst_pitch = 0,
 				.expected = { 0xE0 },
 			},
@@ -84,7 +101,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.results = {
 			{
 				.dst_format = DRM_FORMAT_RGB332,
-				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.conv = { .func = drm_fb_xrgb8888_to_rgb332 },
 				.dst_pitch = 0,
 				.expected = {
 					0xFF, 0x00,
@@ -108,7 +125,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 		.results = {
 			{
 				.dst_format = DRM_FORMAT_RGB332,
-				.conv_func = drm_fb_xrgb8888_to_rgb332,
+				.conv = { .func = drm_fb_xrgb8888_to_rgb332 },
 				.dst_pitch = 5,
 				.expected = {
 					0x0A, 0x08, 0xA0, 0x00, 0x00,
@@ -177,8 +194,15 @@ static void convert_xrgb8888_test(struct kunit *test)
 		dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
 
-		result->conv_func(dst, result->dst_pitch, params->xrgb8888,
-				  &fb, &params->clip);
+		if (result->has_swab) {
+			result->conv_swab.func(dst, result->dst_pitch,
+					       params->xrgb8888, &fb,
+					       &params->clip,
+					       result->conv_swab.swab);
+		} else {
+			result->conv.func(dst, result->dst_pitch,
+					  params->xrgb8888, &fb, &params->clip);
+		}
 		KUNIT_EXPECT_EQ(test, memcmp(dst, result->expected, dst_size), 0);
 	}
 }
-- 
2.25.1

