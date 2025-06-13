Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A6AD91AB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8944910EA2D;
	Fri, 13 Jun 2025 15:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o5f9nLsj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mBim8CYO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o5f9nLsj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mBim8CYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545C410EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 15:41:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DE4B21157;
 Fri, 13 Jun 2025 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749829295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rKJRZ3UFDCPbjEw5Wio663RZlqZho7FZweASFZ6fdCA=;
 b=o5f9nLsjokBm6suqlZncGslL/HMCk1zImlIhX6bGyCqdi/LgHhBfLHgCkxOVDEwq/0AeNq
 7kb4gOBYw8eNuxN2E6XTtRGCy6ix77MhULyvubffPTjiRVe5VVMXit3zG19LHExP/rKntK
 ChY9eNjVs71JuQkaqst9eGcPaOizsOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749829295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rKJRZ3UFDCPbjEw5Wio663RZlqZho7FZweASFZ6fdCA=;
 b=mBim8CYOWVOAM9hkArtfZG8IxeiyqF5Iz1Ut822uZQKzHEGNuJkGbGAmHLiCCWPPtxRF58
 Hv+Xw6xXSPH3kbDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749829295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rKJRZ3UFDCPbjEw5Wio663RZlqZho7FZweASFZ6fdCA=;
 b=o5f9nLsjokBm6suqlZncGslL/HMCk1zImlIhX6bGyCqdi/LgHhBfLHgCkxOVDEwq/0AeNq
 7kb4gOBYw8eNuxN2E6XTtRGCy6ix77MhULyvubffPTjiRVe5VVMXit3zG19LHExP/rKntK
 ChY9eNjVs71JuQkaqst9eGcPaOizsOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749829295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rKJRZ3UFDCPbjEw5Wio663RZlqZho7FZweASFZ6fdCA=;
 b=mBim8CYOWVOAM9hkArtfZG8IxeiyqF5Iz1Ut822uZQKzHEGNuJkGbGAmHLiCCWPPtxRF58
 Hv+Xw6xXSPH3kbDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3E7E137FE;
 Fri, 13 Jun 2025 15:41:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fqNqNq5GTGiJLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 15:41:34 +0000
Message-ID: <2e26b3d6-23b0-448d-97dd-06dd19f80760@suse.de>
Date: Fri, 13 Jun 2025 17:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/tests: Test drm_fb_build_fourcc_list() in
 separate test suite
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: arthurgrillo@riseup.net, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250612135658.232535-1-tzimmermann@suse.de>
 <20250612135658.232535-3-tzimmermann@suse.de> <aEwvqLRHoXjRhJmN@fedora>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <aEwvqLRHoXjRhJmN@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Hi

Am 13.06.25 um 16:03 schrieb José Expósito:
> On Thu, Jun 12, 2025 at 03:52:23PM +0200, Thomas Zimmermann wrote:
>> Only sysfb drivers use drm_fb_build_fourcc_list(). The helper will
>> be moved from format helpers to sysfb helpers. Moving the related
>> tests to their own test suite.
>>
>> v2:
>> - rename filename to match tested code (Maxime)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> ---
>>   drivers/gpu/drm/tests/Makefile                |   3 +-
>>   .../gpu/drm/tests/drm_format_helper_test.c    | 142 ---------------
>>   .../gpu/drm/tests/drm_sysfb_modeset_test.c    | 166 ++++++++++++++++++
>>   3 files changed, 168 insertions(+), 143 deletions(-)
>>   create mode 100644 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
>>
>> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
>> index 3afd6587df08..c0e952293ad0 100644
>> --- a/drivers/gpu/drm/tests/Makefile
>> +++ b/drivers/gpu/drm/tests/Makefile
>> @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>>   	drm_modes_test.o \
>>   	drm_plane_helper_test.o \
>>   	drm_probe_helper_test.o \
>> -	drm_rect_test.o
>> +	drm_rect_test.o \
>> +	drm_sysfb_modeset_test.o
>>   
>>   CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
>> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> index 8aacc1ffa93a..ef1cc3b28f1b 100644
>> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> @@ -1335,147 +1335,6 @@ static void drm_test_fb_clip_offset(struct kunit *test)
>>   	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
>>   }
>>   
>> -struct fb_build_fourcc_list_case {
>> -	const char *name;
>> -	u32 native_fourccs[TEST_BUF_SIZE];
>> -	size_t native_fourccs_size;
>> -	u32 expected[TEST_BUF_SIZE];
>> -	size_t expected_fourccs_size;
>> -};
>> -
>> -static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
>> -	{
>> -		.name = "no native formats",
>> -		.native_fourccs = { },
>> -		.native_fourccs_size = 0,
>> -		.expected = { DRM_FORMAT_XRGB8888 },
>> -		.expected_fourccs_size = 1,
>> -	},
>> -	{
>> -		.name = "XRGB8888 as native format",
>> -		.native_fourccs = { DRM_FORMAT_XRGB8888 },
>> -		.native_fourccs_size = 1,
>> -		.expected = { DRM_FORMAT_XRGB8888 },
>> -		.expected_fourccs_size = 1,
>> -	},
>> -	{
>> -		.name = "remove duplicates",
>> -		.native_fourccs = {
>> -			DRM_FORMAT_XRGB8888,
>> -			DRM_FORMAT_XRGB8888,
>> -			DRM_FORMAT_RGB888,
>> -			DRM_FORMAT_RGB888,
>> -			DRM_FORMAT_RGB888,
>> -			DRM_FORMAT_XRGB8888,
>> -			DRM_FORMAT_RGB888,
>> -			DRM_FORMAT_RGB565,
>> -			DRM_FORMAT_RGB888,
>> -			DRM_FORMAT_XRGB8888,
>> -			DRM_FORMAT_RGB565,
>> -			DRM_FORMAT_RGB565,
>> -			DRM_FORMAT_XRGB8888,
>> -		},
>> -		.native_fourccs_size = 11,
>> -		.expected = {
>> -			DRM_FORMAT_XRGB8888,
>> -			DRM_FORMAT_RGB888,
>> -			DRM_FORMAT_RGB565,
>> -		},
>> -		.expected_fourccs_size = 3,
>> -	},
>> -	{
>> -		.name = "convert alpha formats",
>> -		.native_fourccs = {
>> -			DRM_FORMAT_ARGB1555,
>> -			DRM_FORMAT_ABGR1555,
>> -			DRM_FORMAT_RGBA5551,
>> -			DRM_FORMAT_BGRA5551,
>> -			DRM_FORMAT_ARGB8888,
>> -			DRM_FORMAT_ABGR8888,
>> -			DRM_FORMAT_RGBA8888,
>> -			DRM_FORMAT_BGRA8888,
>> -			DRM_FORMAT_ARGB2101010,
>> -			DRM_FORMAT_ABGR2101010,
>> -			DRM_FORMAT_RGBA1010102,
>> -			DRM_FORMAT_BGRA1010102,
>> -		},
>> -		.native_fourccs_size = 12,
>> -		.expected = {
>> -			DRM_FORMAT_XRGB1555,
>> -			DRM_FORMAT_XBGR1555,
>> -			DRM_FORMAT_RGBX5551,
>> -			DRM_FORMAT_BGRX5551,
>> -			DRM_FORMAT_XRGB8888,
>> -			DRM_FORMAT_XBGR8888,
>> -			DRM_FORMAT_RGBX8888,
>> -			DRM_FORMAT_BGRX8888,
>> -			DRM_FORMAT_XRGB2101010,
>> -			DRM_FORMAT_XBGR2101010,
>> -			DRM_FORMAT_RGBX1010102,
>> -			DRM_FORMAT_BGRX1010102,
>> -		},
>> -		.expected_fourccs_size = 12,
>> -	},
>> -	{
>> -		.name = "random formats",
>> -		.native_fourccs = {
>> -			DRM_FORMAT_Y212,
>> -			DRM_FORMAT_ARGB1555,
>> -			DRM_FORMAT_ABGR16161616F,
>> -			DRM_FORMAT_C8,
>> -			DRM_FORMAT_BGR888,
>> -			DRM_FORMAT_XRGB1555,
>> -			DRM_FORMAT_RGBA5551,
>> -			DRM_FORMAT_BGR565_A8,
>> -			DRM_FORMAT_R10,
>> -			DRM_FORMAT_XYUV8888,
>> -		},
>> -		.native_fourccs_size = 10,
>> -		.expected = {
>> -			DRM_FORMAT_Y212,
>> -			DRM_FORMAT_XRGB1555,
>> -			DRM_FORMAT_ABGR16161616F,
>> -			DRM_FORMAT_C8,
>> -			DRM_FORMAT_BGR888,
>> -			DRM_FORMAT_RGBX5551,
>> -			DRM_FORMAT_BGR565_A8,
>> -			DRM_FORMAT_R10,
>> -			DRM_FORMAT_XYUV8888,
>> -			DRM_FORMAT_XRGB8888,
>> -		},
>> -		.expected_fourccs_size = 10,
>> -	},
>> -};
>> -
>> -static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
>> -{
>> -	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>> -}
>> -
>> -KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
>> -
>> -static void drm_test_fb_build_fourcc_list(struct kunit *test)
>> -{
>> -	const struct fb_build_fourcc_list_case *params = test->param_value;
>> -	u32 fourccs_out[TEST_BUF_SIZE] = {0};
>> -	size_t nfourccs_out;
>> -	struct drm_device *drm;
>> -	struct device *dev;
>> -
>> -	dev = drm_kunit_helper_alloc_device(test);
>> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>> -
>> -	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
>> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
>> -
>> -	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
>> -						params->native_fourccs_size,
>> -						fourccs_out, TEST_BUF_SIZE);
>> -
>> -	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
>> -	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
>> -}
>> -
>>   struct fb_memcpy_case {
>>   	const char *name;
>>   	u32 format;
>> @@ -1864,7 +1723,6 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xbgr8888, convert_xrgb8888_gen_params),
>>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_abgr8888, convert_xrgb8888_gen_params),
>>   	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
>> -	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
>>   	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),
>>   	{}
>>   };
>> diff --git a/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
>> new file mode 100644
>> index 000000000000..88a4bf28c745
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
>> @@ -0,0 +1,166 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include <kunit/test.h>
>> +
>> +#include <drm/drm_format_helper.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_kunit_helpers.h>
>> +
>> +#define TEST_BUF_SIZE 50
>> +
>> +struct fb_build_fourcc_list_case {
>> +	const char *name;
>> +	u32 native_fourccs[TEST_BUF_SIZE];
>> +	size_t native_fourccs_size;
>> +	u32 expected[TEST_BUF_SIZE];
>> +	size_t expected_fourccs_size;
>> +};
>> +
>> +static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
>> +	{
>> +		.name = "no native formats",
>> +		.native_fourccs = { },
>> +		.native_fourccs_size = 0,
>> +		.expected = { DRM_FORMAT_XRGB8888 },
>> +		.expected_fourccs_size = 1,
>> +	},
>> +	{
>> +		.name = "XRGB8888 as native format",
>> +		.native_fourccs = { DRM_FORMAT_XRGB8888 },
>> +		.native_fourccs_size = 1,
>> +		.expected = { DRM_FORMAT_XRGB8888 },
>> +		.expected_fourccs_size = 1,
>> +	},
>> +	{
>> +		.name = "remove duplicates",
>> +		.native_fourccs = {
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_RGB888,
>> +			DRM_FORMAT_RGB888,
>> +			DRM_FORMAT_RGB888,
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_RGB888,
>> +			DRM_FORMAT_RGB565,
>> +			DRM_FORMAT_RGB888,
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_RGB565,
>> +			DRM_FORMAT_RGB565,
>> +			DRM_FORMAT_XRGB8888,
>> +		},
>> +		.native_fourccs_size = 11,
>> +		.expected = {
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_RGB888,
>> +			DRM_FORMAT_RGB565,
>> +		},
>> +		.expected_fourccs_size = 3,
>> +	},
>> +	{
>> +		.name = "convert alpha formats",
>> +		.native_fourccs = {
>> +			DRM_FORMAT_ARGB1555,
>> +			DRM_FORMAT_ABGR1555,
>> +			DRM_FORMAT_RGBA5551,
>> +			DRM_FORMAT_BGRA5551,
>> +			DRM_FORMAT_ARGB8888,
>> +			DRM_FORMAT_ABGR8888,
>> +			DRM_FORMAT_RGBA8888,
>> +			DRM_FORMAT_BGRA8888,
>> +			DRM_FORMAT_ARGB2101010,
>> +			DRM_FORMAT_ABGR2101010,
>> +			DRM_FORMAT_RGBA1010102,
>> +			DRM_FORMAT_BGRA1010102,
>> +		},
>> +		.native_fourccs_size = 12,
>> +		.expected = {
>> +			DRM_FORMAT_XRGB1555,
>> +			DRM_FORMAT_XBGR1555,
>> +			DRM_FORMAT_RGBX5551,
>> +			DRM_FORMAT_BGRX5551,
>> +			DRM_FORMAT_XRGB8888,
>> +			DRM_FORMAT_XBGR8888,
>> +			DRM_FORMAT_RGBX8888,
>> +			DRM_FORMAT_BGRX8888,
>> +			DRM_FORMAT_XRGB2101010,
>> +			DRM_FORMAT_XBGR2101010,
>> +			DRM_FORMAT_RGBX1010102,
>> +			DRM_FORMAT_BGRX1010102,
>> +		},
>> +		.expected_fourccs_size = 12,
>> +	},
>> +	{
>> +		.name = "random formats",
>> +		.native_fourccs = {
>> +			DRM_FORMAT_Y212,
>> +			DRM_FORMAT_ARGB1555,
>> +			DRM_FORMAT_ABGR16161616F,
>> +			DRM_FORMAT_C8,
>> +			DRM_FORMAT_BGR888,
>> +			DRM_FORMAT_XRGB1555,
>> +			DRM_FORMAT_RGBA5551,
>> +			DRM_FORMAT_BGR565_A8,
>> +			DRM_FORMAT_R10,
>> +			DRM_FORMAT_XYUV8888,
>> +		},
>> +		.native_fourccs_size = 10,
>> +		.expected = {
>> +			DRM_FORMAT_Y212,
>> +			DRM_FORMAT_XRGB1555,
>> +			DRM_FORMAT_ABGR16161616F,
>> +			DRM_FORMAT_C8,
>> +			DRM_FORMAT_BGR888,
>> +			DRM_FORMAT_RGBX5551,
>> +			DRM_FORMAT_BGR565_A8,
>> +			DRM_FORMAT_R10,
>> +			DRM_FORMAT_XYUV8888,
>> +			DRM_FORMAT_XRGB8888,
>> +		},
>> +		.expected_fourccs_size = 10,
>> +	},
>> +};
>> +
>> +static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
>> +{
>> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
>> +
>> +static void drm_test_fb_build_fourcc_list(struct kunit *test)
>> +{
>> +	const struct fb_build_fourcc_list_case *params = test->param_value;
>> +	u32 fourccs_out[TEST_BUF_SIZE] = {0};
>> +	size_t nfourccs_out;
>> +	struct drm_device *drm;
>> +	struct device *dev;
>> +
>> +	dev = drm_kunit_helper_alloc_device(test);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>> +
>> +	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
>> +
>> +	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
>> +						params->native_fourccs_size,
>> +						fourccs_out, TEST_BUF_SIZE);
>> +
>> +	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
>> +	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
>> +}
>> +
>> +static struct kunit_case drm_sysfb_helper_test_cases[] = {
>> +	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite drm_sysfb_helper_test_suite = {
>> +	.name = "drm_sysfb_helper_test",
> Other tests use the same name as the file live in, dropping or not
> the "_test" suffix.
>
> Is this a missing change from the rename in v1?

I renamed the source file as suggested in an earlier rename, but forgot 
about those names. Sorry, I'm not really familiar with the conventions 
here. I'll fix this in the next iteration. Thanks for reviewing.

Best regards
Thomas

>
> Other than that:
>
> Reviewed-by: José Expósito <jose.exposito89@gmail.com>
>
>> +	.test_cases = drm_sysfb_helper_test_cases,
>> +};
>> +
>> +kunit_test_suite(drm_sysfb_helper_test_suite);
>> +
>> +MODULE_DESCRIPTION("KUnit tests for the drm_sysfb_helper APIs");
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("José Expósito <jose.exposito89@gmail.com>");
>> -- 
>> 2.49.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

