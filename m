Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57324B51B3A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B360410E949;
	Wed, 10 Sep 2025 15:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CHACykHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22DD10E949
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757517415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTaDACB4l26rOSYcf8BPat/9VEf+Ju7nr9jru3/iH8o=;
 b=CHACykHXU7EmzqieAQyjZ22OvqoJC8PhUB9h301kkcfbnxoUuBv25Rd9W6SB5yCqeBYQpu
 Gh95fRQ35oijl2aaURQAJP3RSRR0o9C0hz/30VrDbvY1htA7T+pezDXD0tHaWUeOJ6cCLj
 pFTws8KfAD/beqnRQF6yH1iTvO/qDNo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-pPOege5jNH-EaeNE4K542Q-1; Wed, 10 Sep 2025 11:16:53 -0400
X-MC-Unique: pPOege5jNH-EaeNE4K542Q-1
X-Mimecast-MFC-AGG-ID: pPOege5jNH-EaeNE4K542Q_1757517412
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b920a0c89so31275465e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757517412; x=1758122212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OTaDACB4l26rOSYcf8BPat/9VEf+Ju7nr9jru3/iH8o=;
 b=AuLZc8TqpxpDkqnI9HY75+veBACu4Fll0rWwvDE5L+7xxS7ZRcZYzsvKGqaD/yXwmy
 5HbwvuEap585krSgHZU5OE+ZPaxTzq+jQSSLXYSnEfgcNQyVQQzRRnj4F/bU2pwZZ3nr
 v39U4UGNUfTUDn5Z3VYgT3XHfLi2yiOdH704E35WNggeXNIqLZHIc6tWGSL25kODvhJn
 XP1h6xSBrVksQSwSYm+NGfwRZqyjpUUi9XFMtopqyJzrP3ujAvJgMfAQ1kQE6o4j2St3
 r1sAIizEvTiLJD7uDwYzbGkPqgq6EhH8HqrrNAZxqypuN486Dxe4enN77tal8WpLdNwT
 EosQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwWNZ0Av/hT/q2dgr3YrN4XqE2QqYGoJ/iu89PeONGBius5SiOkxFj34j62e8LXsa6BDDNuWypFBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVSZfjKOkrOXAZf5SS2gFwNy+wpuTpKYIoE98vqGg0l1cBh+Q9
 yaBz5A1mRUqro7SLcZk7qTewrtNirpgXQ5MjoDehxgjh69f4y5aCHMISgXTyxPYTdRGqvKfEG8o
 jqZUZD2NyOaTp/x9qoUiuB2U2qCfCSwHVxyG0L2qhfNQONvQ7yBS+XDU7bt0la84eEO5W9g==
X-Gm-Gg: ASbGncsnsGqHbHAh51dvAm3H0IxDpJLUe0kmFUYILiz9/Y6ynsAwD32Dp5yiyFjLWR9
 em0igY1EgMokPo97w753sA8Xwgbd18kN54yDJaUCEKxGeYR2ZsCVw5LwVP/iRawI1wfuIuyfgM3
 EMtTaNl6NxpuEbvX9jPBXYjz0/u4trE+UdRfNzf2wH4QBu2M+Xikx2ws1GpliiR4fTEKomV8hRo
 UwTuf+Ndmriownmz5etrN7L9JszjBnz60QY2llESr76MDCv/hU0BpCB9qZoUD60W+lkMYoZHOnM
 Fed6/9bW3X3j+/a3m5pDuGUIM+J2HR3WXhpEeTHyyVCdd+Ff4j9pJ4YMOC0E87deu5JVikxfzU7
 85+c=
X-Received: by 2002:a05:600c:1e8c:b0:455:f187:6203 with SMTP id
 5b1f17b1804b1-45dddef01e4mr122798655e9.27.1757517412079; 
 Wed, 10 Sep 2025 08:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzhtY65zo214jeKk3uc6/bfpYCHiRF7m/w5yM+4Thwc9xD9ARqamRIoJw8cuMXHSIAD8repQ==
X-Received: by 2002:a05:600c:1e8c:b0:455:f187:6203 with SMTP id
 5b1f17b1804b1-45dddef01e4mr122797995e9.27.1757517411234; 
 Wed, 10 Sep 2025 08:16:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df81c72e0sm35573405e9.3.2025.09.10.08.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:16:50 -0700 (PDT)
Message-ID: <5e9dc5b5-9671-4a72-b926-8b526ebf9059@redhat.com>
Date: Wed, 10 Sep 2025 17:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/panic: Add kunit tests for drm_panic
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250908090341.762049-1-jfalempe@redhat.com>
 <20250908090341.762049-3-jfalempe@redhat.com>
 <20250910-fascinating-hungry-lemur-1d9f49@houat>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250910-fascinating-hungry-lemur-1d9f49@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LR6ElmkNFLRCMPVsL0oZ-9tgGhblHG8aU-7RVQIbGtc_1757517412
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/09/2025 10:33, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Sep 08, 2025 at 11:00:30AM +0200, Jocelyn Falempe wrote:
>> Add kunit tests for drm_panic.
>> They check that drawing the panic screen doesn't crash, but they
>> don't check the correctness of the resulting image.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v2:
>>   * Add a few checks, and more comments in the kunit tests. (Maxime Ripard).
>>
>>   MAINTAINERS                            |   1 +
>>   drivers/gpu/drm/drm_panic.c            |   4 +
>>   drivers/gpu/drm/tests/drm_panic_test.c | 198 +++++++++++++++++++++++++
>>   3 files changed, 203 insertions(+)
>>   create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 402fe14091f1..e9be893d6741 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8480,6 +8480,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>   F:	drivers/gpu/drm/drm_draw.c
>>   F:	drivers/gpu/drm/drm_draw_internal.h
>>   F:	drivers/gpu/drm/drm_panic*.c
>> +F:	drivers/gpu/drm/tests/drm_panic_test.c
>>   F:	include/drm/drm_panic*
>>   
>>   DRM PANIC QR CODE
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 1e06e3a18d09..d89812ff1935 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -986,3 +986,7 @@ void drm_panic_exit(void)
>>   {
>>   	drm_panic_qr_exit();
>>   }
>> +
>> +#ifdef CONFIG_DRM_KUNIT_TEST
>> +#include "tests/drm_panic_test.c"
>> +#endif
>> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
>> new file mode 100644
>> index 000000000000..d5d20dd2aa7c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
>> @@ -0,0 +1,198 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +/*
>> + * Copyright (c) 2025 Red Hat.
>> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
>> + *
>> + * KUNIT tests for drm panic
>> + */
>> +
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_panic.h>
>> +
>> +#include <kunit/test.h>
>> +
>> +#include <linux/units.h>
>> +#include <linux/vmalloc.h>
>> +
>> +/* Check the framebuffer color only if the panic colors are the default */
>> +#if (CONFIG_DRM_PANIC_BACKGROUND_COLOR == 0 && \
>> +	CONFIG_DRM_PANIC_FOREGROUND_COLOR == 0xffffff)
>> +#define DRM_PANIC_CHECK_COLOR
>> +#endif
>> +
>> +struct drm_test_mode {
>> +	const int width;
>> +	const int height;
>> +	const u32 format;
>> +	void (*draw_screen)(struct drm_scanout_buffer *sb);
>> +	const char *fname;
>> +};
>> +
>> +/*
>> + * Run all tests for the 3 panic screens: user, kmsg and qr_code
>> + */
>> +#define DRM_TEST_MODE_LIST(func) \
>> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_XRGB8888, func) \
>> +	DRM_PANIC_TEST_MODE(300, 200, DRM_FORMAT_XRGB8888, func) \
>> +	DRM_PANIC_TEST_MODE(1920, 1080, DRM_FORMAT_XRGB8888, func) \
>> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB565, func) \
>> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB888, func) \
>> +
>> +#define DRM_PANIC_TEST_MODE(w, h, f, name) { \
>> +	.width = w, \
>> +	.height = h, \
>> +	.format = f, \
>> +	.draw_screen = draw_panic_screen_##name, \
>> +	.fname = #name, \
>> +	}, \
>> +
>> +static const struct drm_test_mode drm_test_modes_cases[] = {
>> +	DRM_TEST_MODE_LIST(user)
>> +	DRM_TEST_MODE_LIST(kmsg)
>> +	DRM_TEST_MODE_LIST(qr_code)
>> +};
>> +#undef DRM_PANIC_TEST_MODE
>> +
>> +static int drm_test_panic_init(struct kunit *test)
>> +{
>> +	struct drm_scanout_buffer *priv;
>> +
>> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	test->priv = priv;
>> +
>> +	drm_panic_set_description("Kunit testing");
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Test drawing the panic screen, using a memory mapped framebuffer
>> + * Set the whole buffer to 0xa5, and then check that all pixels have been
>> + * written.
>> + */
>> +static void drm_test_panic_screen_user_map(struct kunit *test)
>> +{
>> +	struct drm_scanout_buffer *sb = test->priv;
>> +	const struct drm_test_mode *params = test->param_value;
>> +	char *fb;
>> +	int fb_size;
>> +
>> +	sb->format = drm_format_info(params->format);
>> +	fb_size = params->width * params->height * sb->format->cpp[0];
>> +
>> +	fb = vmalloc(fb_size);
>> +	KUNIT_ASSERT_NOT_NULL(test, fb);
>> +
>> +	memset(fb, 0xa5, fb_size);
>> +
>> +	iosys_map_set_vaddr(&sb->map[0], fb);
>> +	sb->width = params->width;
>> +	sb->height = params->height;
>> +	sb->pitch[0] = params->width * sb->format->cpp[0];
>> +
>> +	params->draw_screen(sb);
>> +
>> +#ifdef DRM_PANIC_CHECK_COLOR
>> +	{
>> +		int i;
>> +
>> +		for (i = 0; i < fb_size; i++)
>> +			KUNIT_ASSERT_TRUE(test, fb[i] == 0 || fb[i] == 0xff);
>> +	}
>> +#endif
> 
> I'm not really fond of the ifdef here. Could you turn this into a
> function, and return that it's valid if the colors don't match what you
> expect?

Yes, I can rework this.
> 
>> +	vfree(fb);
>> +}
>> +
>> +/*
>> + * Test drawing the panic screen, using a list of pages framebuffer
>> + * No checks are performed
> 
> What are you testing then if you aren't checking anything?

It tests that there are no access to an unmapped page.
But I can add the same check that with the "map" case.
It just requires more work to map the pages.

> 
>> + */
>> +static void drm_test_panic_screen_user_page(struct kunit *test)
>> +{
>> +	struct drm_scanout_buffer *sb = test->priv;
>> +	const struct drm_test_mode *params = test->param_value;
>> +	int fb_size;
>> +	struct page **pages;
>> +	int i;
>> +	int npages;
>> +
>> +	sb->format = drm_format_info(params->format);
>> +	fb_size = params->width * params->height * sb->format->cpp[0];
>> +	npages = DIV_ROUND_UP(fb_size, PAGE_SIZE);
>> +
>> +	pages = kmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, pages);
>> +
>> +	for (i = 0; i < npages; i++) {
>> +		pages[i] = alloc_page(GFP_KERNEL);
>> +		KUNIT_ASSERT_NOT_NULL(test, pages[i]);
> 
> KUNIT_ASSERT_* return immediately, so you're leaking the pages array
> here.
> 
yes, I can fix that, but is it important to not leak when the test fails?

-- 

Jocelyn

> Maxime

