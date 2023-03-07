Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666806AF81A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 22:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F0210E290;
	Tue,  7 Mar 2023 21:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540E510E290
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 21:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678226133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=al89onqiOmK1Qgbuht2PobrFsfTYPLYKX7X60ItdsQk=;
 b=glCHTs1wMexcW7pj6iRqwgF0u55Jn59StT+INZMr/dHGqXBkHwZk9OEWYG9P2x7sevbf9e
 7McHYetx/bSGrWpYU2sOCJygjNFYskSh0qMHXXXd1dkF62+YXGhglwfK2LVfcXi/h0tphi
 QBW+A4sz5wXFrF7UNMv2Y8UHVuUNP9M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-EHtxIXYrMIyeBFTJhmtqLA-1; Tue, 07 Mar 2023 16:55:32 -0500
X-MC-Unique: EHtxIXYrMIyeBFTJhmtqLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso15426wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 13:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678226131;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=al89onqiOmK1Qgbuht2PobrFsfTYPLYKX7X60ItdsQk=;
 b=AhnNZSHO0ZYomtEy349smYCjesfmM7sO56BZ7KaXDJT4agVNEk4Q8xLPogCFAtY9EG
 bHXT39dm3ZWS68g1XAJyZkujp8pmNqa2o87YmdHMyTypVFdIO48I00GJxQuy9u0YYtNe
 NF61wxsfBvpX9FhXp45/GTG4VM+PJ+qZQZl4h0YleM/7Y6TzKlNsdoba3XlZA4kVJrGu
 FO3nHy7kSpnfuC2JumGhXF3WOlgwLSVGt69GY2c1YQSzeJ8bkDwiwVtT5mIOsfXiIHDW
 vhheKtn47f+lx/oOOnJrUcu2zzpgwsy7GnVzM3sGj5Ooudy+QxMjb9kEappUX8rIBtxU
 O4ag==
X-Gm-Message-State: AO0yUKWNXuM2wreyX1ikhOYeqnUR1mOiOzqI5QwX+Pp0H3JI4G2kPf/v
 FR+Z6ggMZnoaWhO+yW0EW5xaD8L3XISbLffzkrg84gYDUfXSKmCHekXCJpKj3oZBpn+CSckZwqy
 zd9kI+srJVr7iGlQcqmjd4ezyFJyI
X-Received: by 2002:a5d:4d02:0:b0:2c5:58fc:e1bb with SMTP id
 z2-20020a5d4d02000000b002c558fce1bbmr11388312wrt.10.1678226131252; 
 Tue, 07 Mar 2023 13:55:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9Zw78s2V0XbqTF+4k3JF/v14fNUKtl7LbQ9DVybxC61SyDtPURNkQTP2kJszoiZXZmO+1Xow==
X-Received: by 2002:a5d:4d02:0:b0:2c5:58fc:e1bb with SMTP id
 z2-20020a5d4d02000000b002c558fce1bbmr11388304wrt.10.1678226130871; 
 Tue, 07 Mar 2023 13:55:30 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c70d269b4esm13312799wrt.91.2023.03.07.13.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:55:30 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/format_helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
In-Reply-To: <87lek81hdq.fsf@minerva.mail-host-address-is-not-set>
References: <20230302200131.754154-1-arthurgrillo@riseup.net>
 <87lek81hdq.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 07 Mar 2023 22:55:29 +0100
Message-ID: <87mt4ow7ji.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>
>> +static size_t conversion_buf_size_mono(unsigned int dst_pitch, const struct drm_rect *clip)
>> +{
>> +	if (!dst_pitch) {
>> +		unsigned int linepixels = drm_rect_width(clip) * 1;
>> +
>> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);
>> +	}
>> +
>> +	return dst_pitch * drm_rect_height(clip);
>> +}
>> +
>
> I don't think you need a new helper only for this. There are other
> formats that have sub-byte pixels, so you may want to instead make
> the existing conversion_buf_size() function more general.
>
> Could you please base on the following patch that I just posted?
>
> https://lists.freedesktop.org/archives/dri-devel/2023-March/394466.html
>

I've posted a v2 since the kernel robot found a build warning on v1:

https://lists.freedesktop.org/archives/dri-devel/2023-March/394473.html

This time I have also tested your patch rebased on top of my v2, and
your tests are passing too:

[22:46:16] ============== drm_test_fb_xrgb8888_to_mono  ===============
[22:46:16] [PASSED] single_pixel_source_buffer                                                                         
[22:46:16] [PASSED] single_pixel_clip_rectangle     
[22:46:16] [PASSED] well_known_colors                                                                                  
[22:46:16] [PASSED] destination_pitch

The version of your patch I that tested is the following:

From def1b2c04c812d53ebcda17c2d34d16f311ad406 Mon Sep 17 00:00:00 2001
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 2 Mar 2023 17:01:31 -0300
Subject: [PATCH] drm/format_helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()

Extend the existing test cases to test the conversion from XRGB8888 to
monochromatic.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 84b5cc29c8fc..c9cd8a7741ee 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -67,6 +67,11 @@ struct convert_to_argb2101010_result {
 	const u32 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_mono_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -82,6 +87,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_argb8888_result argb8888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
 	struct convert_to_argb2101010_result argb2101010_result;
+	struct convert_to_mono_result mono_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -131,6 +137,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0xFFF00000 },
 		},
+		.mono_result = {
+			.dst_pitch = 0,
+			.expected = { 0x00 },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -181,6 +191,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0xFFF00000 },
 		},
+		.mono_result = {
+			.dst_pitch = 0,
+			.expected = { 0x00 },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -293,6 +307,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xFFFFFC00, 0xC00FFFFF,
 			},
 		},
+		.mono_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0x01,
+				0x02,
+				0x00,
+				0x03,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -392,6 +415,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xEA20300C, 0xDB1705CD, 0xC3844672, 0x00000000, 0x00000000,
 			},
 		},
+		.mono_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0x00,
+				0x00,
+				0x00,
+			},
+		},
 	},
 };
 
@@ -792,6 +823,37 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
+static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_mono_result *result = &params->mono_result;
+	size_t dst_size;
+	u8 *buf = NULL;
+	__le32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch,
+				       &params->clip);
+
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
@@ -803,6 +865,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.39.2

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

