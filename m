Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C86BA073C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A6E10E083;
	Thu, 25 Sep 2025 15:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OYrYCmdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0D110E083
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758815452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RjxFh7v91T99kL52zo94RvBCcAm3O2bx/ycpMxare0=;
 b=OYrYCmdzKBClBFCbG35goyTOQErDP+e2fQ7Re5N2t/JGalQvQBOvxNf1eGe9ufcaGdgTzM
 63uTyPlgKfr4v2rkTznYvAfD+7xrUSSU1lhMvIdnYq531ESIgT2Jvb9/MtCIHGT2cskPqJ
 QWTXOIdWVcUDyN1Sru2h9y9ANny5JVE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-R56bjpbbMQq7ailzy21_Ug-1; Thu, 25 Sep 2025 11:50:50 -0400
X-MC-Unique: R56bjpbbMQq7ailzy21_Ug-1
X-Mimecast-MFC-AGG-ID: R56bjpbbMQq7ailzy21_Ug_1758815450
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45b990eb77cso7193405e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758815449; x=1759420249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6RjxFh7v91T99kL52zo94RvBCcAm3O2bx/ycpMxare0=;
 b=q1fQqlMKMK7SIu2KAi93WeiUemoPUtXyT+s7acl2CzqpLqVYsUbt0rBDBLHOzU83gc
 KkWDuv396xtPG7UZ6I05TNl9Gr4rqXV4eEQlIcic2k35s9UmPNJo5aVXnDcu7azLSlRJ
 fF6GHoYkyu9fFnUcaZ4LEPjYNZoixfLsS+0Uc1xboG++bTApcG4GhqOGJZqk8NmxBQ4s
 JIpUqdmfqu3Awex8aMW9ZSTJSJPKQLY+5zkhWdBIw7p08oHLtjNOo/dJhGqG8951zSS0
 8Zv01TJmIJzDkKFH7cljqqOKYbqJ9tGL8hQYjFmdFJGEsWpYkZ3PgiFwZo1bnkgHPrqY
 vlOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNR6bhMg/1dlOqmNEl9D/qAoP0nTJZ24q7SCKjdRGnBqOTNe4Rse2dhUq9ufBpZz16z+rNPGGXeF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwQZUvrhN6L3pTFazgdp4jokhkT2szntRryqDDDKUyHvWhH4B5
 FYbCHIP+deJKvWbKjKL/fZLqOSJnBkBnx5PSBkRcXhlPiwT4Jki3AOwFc+TPeS/RQZGpzaF0Lxc
 t8hh6w58jAPG6hzIi368uQXKURAWayHzrb/N3TEWkWleSRfp3y6mPYNMXRE4SdDrowWhO8w==
X-Gm-Gg: ASbGnct5eucBSRbVx9ykcRPBQoMion8cY8l9ObELV6d1a3oUQ2NkAqMyR0+zoEFgVLg
 wzReeGkm6b+KUkzCz/+e/jLVp9jH3HB0DAOGg5Xv/hc7wS1KMl+528rkSLCy0DEsf6Nfa1zpVyz
 HbYPAeUQGExGGR4HTgIzt2+vyRW/Cx+XzzSITWmjl1cx9FDPhRp7cNj1dtSEAfLtqjOG3JTjIa/
 Ai4dcpZNBtnmnLO/MSxCeaaTjCP0dr2znGPHj1DXRoRxNMAGO+JFYA8/fCWiwxid85VxpIlu0mK
 jZV9QmTj4+rItOVd+v4wjTvUob12m7x+ZijE2HbAcJr/ZCWZFy5TZiPKgHk6ha9Xy05zzdzunUH
 bepLA
X-Received: by 2002:a05:600c:c05a:b0:46e:24a4:c247 with SMTP id
 5b1f17b1804b1-46e33c37045mr27726495e9.5.1758815449342; 
 Thu, 25 Sep 2025 08:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH42p5wF1MbXLgLRLpmMdmx3fmatgjwkfbDLkTnb0zUzAZiwpeDhVqHHmRs7ZpOiR0kwuKXgg==
X-Received: by 2002:a05:600c:c05a:b0:46e:24a4:c247 with SMTP id
 5b1f17b1804b1-46e33c37045mr27726145e9.5.1758815448852; 
 Thu, 25 Sep 2025 08:50:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a996da2sm96398255e9.5.2025.09.25.08.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 08:50:48 -0700 (PDT)
Message-ID: <d2b91aea-02d6-4fbf-9ada-ef831936c773@redhat.com>
Date: Thu, 25 Sep 2025 17:50:47 +0200
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
 <5e9dc5b5-9671-4a72-b926-8b526ebf9059@redhat.com>
 <20250923-silent-mole-of-luxury-9feabc@penduick>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250923-silent-mole-of-luxury-9feabc@penduick>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sfPGPCuFVLO7aNZrsekXFo6cLcYcoomMyzaSy1QQ_ag_1758815450
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

On 23/09/2025 11:57, Maxime Ripard wrote:
> On Wed, Sep 10, 2025 at 05:16:49PM +0200, Jocelyn Falempe wrote:
>> On 10/09/2025 10:33, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Sep 08, 2025 at 11:00:30AM +0200, Jocelyn Falempe wrote:
>>>> Add kunit tests for drm_panic.
>>>> They check that drawing the panic screen doesn't crash, but they
>>>> don't check the correctness of the resulting image.
>>>>
>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> ---
>>>>
>>>> v2:
>>>>    * Add a few checks, and more comments in the kunit tests. (Maxime Ripard).
>>>>
>>>>    MAINTAINERS                            |   1 +
>>>>    drivers/gpu/drm/drm_panic.c            |   4 +
>>>>    drivers/gpu/drm/tests/drm_panic_test.c | 198 +++++++++++++++++++++++++
>>>>    3 files changed, 203 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 402fe14091f1..e9be893d6741 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -8480,6 +8480,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>>>    F:	drivers/gpu/drm/drm_draw.c
>>>>    F:	drivers/gpu/drm/drm_draw_internal.h
>>>>    F:	drivers/gpu/drm/drm_panic*.c
>>>> +F:	drivers/gpu/drm/tests/drm_panic_test.c
>>>>    F:	include/drm/drm_panic*
>>>>    DRM PANIC QR CODE
>>>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>>>> index 1e06e3a18d09..d89812ff1935 100644
>>>> --- a/drivers/gpu/drm/drm_panic.c
>>>> +++ b/drivers/gpu/drm/drm_panic.c
>>>> @@ -986,3 +986,7 @@ void drm_panic_exit(void)
>>>>    {
>>>>    	drm_panic_qr_exit();
>>>>    }
>>>> +
>>>> +#ifdef CONFIG_DRM_KUNIT_TEST
>>>> +#include "tests/drm_panic_test.c"
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
>>>> new file mode 100644
>>>> index 000000000000..d5d20dd2aa7c
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
>>>> @@ -0,0 +1,198 @@
>>>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>>>> +/*
>>>> + * Copyright (c) 2025 Red Hat.
>>>> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
>>>> + *
>>>> + * KUNIT tests for drm panic
>>>> + */
>>>> +
>>>> +#include <drm/drm_fourcc.h>
>>>> +#include <drm/drm_panic.h>
>>>> +
>>>> +#include <kunit/test.h>
>>>> +
>>>> +#include <linux/units.h>
>>>> +#include <linux/vmalloc.h>
>>>> +
>>>> +/* Check the framebuffer color only if the panic colors are the default */
>>>> +#if (CONFIG_DRM_PANIC_BACKGROUND_COLOR == 0 && \
>>>> +	CONFIG_DRM_PANIC_FOREGROUND_COLOR == 0xffffff)
>>>> +#define DRM_PANIC_CHECK_COLOR
>>>> +#endif
>>>> +
>>>> +struct drm_test_mode {
>>>> +	const int width;
>>>> +	const int height;
>>>> +	const u32 format;
>>>> +	void (*draw_screen)(struct drm_scanout_buffer *sb);
>>>> +	const char *fname;
>>>> +};
>>>> +
>>>> +/*
>>>> + * Run all tests for the 3 panic screens: user, kmsg and qr_code
>>>> + */
>>>> +#define DRM_TEST_MODE_LIST(func) \
>>>> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_XRGB8888, func) \
>>>> +	DRM_PANIC_TEST_MODE(300, 200, DRM_FORMAT_XRGB8888, func) \
>>>> +	DRM_PANIC_TEST_MODE(1920, 1080, DRM_FORMAT_XRGB8888, func) \
>>>> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB565, func) \
>>>> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB888, func) \
>>>> +
>>>> +#define DRM_PANIC_TEST_MODE(w, h, f, name) { \
>>>> +	.width = w, \
>>>> +	.height = h, \
>>>> +	.format = f, \
>>>> +	.draw_screen = draw_panic_screen_##name, \
>>>> +	.fname = #name, \
>>>> +	}, \
>>>> +
>>>> +static const struct drm_test_mode drm_test_modes_cases[] = {
>>>> +	DRM_TEST_MODE_LIST(user)
>>>> +	DRM_TEST_MODE_LIST(kmsg)
>>>> +	DRM_TEST_MODE_LIST(qr_code)
>>>> +};
>>>> +#undef DRM_PANIC_TEST_MODE
>>>> +
>>>> +static int drm_test_panic_init(struct kunit *test)
>>>> +{
>>>> +	struct drm_scanout_buffer *priv;
>>>> +
>>>> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>>>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>>>> +
>>>> +	test->priv = priv;
>>>> +
>>>> +	drm_panic_set_description("Kunit testing");
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Test drawing the panic screen, using a memory mapped framebuffer
>>>> + * Set the whole buffer to 0xa5, and then check that all pixels have been
>>>> + * written.
>>>> + */
>>>> +static void drm_test_panic_screen_user_map(struct kunit *test)
>>>> +{
>>>> +	struct drm_scanout_buffer *sb = test->priv;
>>>> +	const struct drm_test_mode *params = test->param_value;
>>>> +	char *fb;
>>>> +	int fb_size;
>>>> +
>>>> +	sb->format = drm_format_info(params->format);
>>>> +	fb_size = params->width * params->height * sb->format->cpp[0];
>>>> +
>>>> +	fb = vmalloc(fb_size);
>>>> +	KUNIT_ASSERT_NOT_NULL(test, fb);
>>>> +
>>>> +	memset(fb, 0xa5, fb_size);
>>>> +
>>>> +	iosys_map_set_vaddr(&sb->map[0], fb);
>>>> +	sb->width = params->width;
>>>> +	sb->height = params->height;
>>>> +	sb->pitch[0] = params->width * sb->format->cpp[0];
>>>> +
>>>> +	params->draw_screen(sb);
>>>> +
>>>> +#ifdef DRM_PANIC_CHECK_COLOR
>>>> +	{
>>>> +		int i;
>>>> +
>>>> +		for (i = 0; i < fb_size; i++)
>>>> +			KUNIT_ASSERT_TRUE(test, fb[i] == 0 || fb[i] == 0xff);
>>>> +	}
>>>> +#endif
>>>
>>> I'm not really fond of the ifdef here. Could you turn this into a
>>> function, and return that it's valid if the colors don't match what you
>>> expect?
>>
>> Yes, I can rework this.
>>>
>>>> +	vfree(fb);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Test drawing the panic screen, using a list of pages framebuffer
>>>> + * No checks are performed
>>>
>>> What are you testing then if you aren't checking anything?
>>
>> It tests that there are no access to an unmapped page.
>> But I can add the same check that with the "map" case.
>> It just requires more work to map the pages.
> 
> I wasn't really arguing about adding more stuff, just that the
> documentation didn't really explain what was going on. Just saying "I'm
> checking that doing this succeeds" is definitely enough for me.
> 
Ok, I will update the documentation accordingly.

>>>
>>>> + */
>>>> +static void drm_test_panic_screen_user_page(struct kunit *test)
>>>> +{
>>>> +	struct drm_scanout_buffer *sb = test->priv;
>>>> +	const struct drm_test_mode *params = test->param_value;
>>>> +	int fb_size;
>>>> +	struct page **pages;
>>>> +	int i;
>>>> +	int npages;
>>>> +
>>>> +	sb->format = drm_format_info(params->format);
>>>> +	fb_size = params->width * params->height * sb->format->cpp[0];
>>>> +	npages = DIV_ROUND_UP(fb_size, PAGE_SIZE);
>>>> +
>>>> +	pages = kmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
>>>> +	KUNIT_ASSERT_NOT_NULL(test, pages);
>>>> +
>>>> +	for (i = 0; i < npages; i++) {
>>>> +		pages[i] = alloc_page(GFP_KERNEL);
>>>> +		KUNIT_ASSERT_NOT_NULL(test, pages[i]);
>>>
>>> KUNIT_ASSERT_* return immediately, so you're leaking the pages array
>>> here.
>>>
>> yes, I can fix that, but is it important to not leak when the test fails?
> 
> kunit tests can be compiled as module and run on live systems, so yes.
> It can also lead to subsequent test failures if you deplete the system
> of a resource the next test will need.

ok, understood, I will fix the leaks in those tests.

> Maxime


-- 

Jocelyn

