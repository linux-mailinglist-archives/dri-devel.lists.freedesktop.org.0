Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE2B3E3CD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8599F10E453;
	Mon,  1 Sep 2025 12:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g/ZfrIUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272010E453
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756731553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoiIEnJ0ic7SzUloB3/lyFFbxaN9NLIbcmrNtiHaEk4=;
 b=g/ZfrIUyznejG1Vfg0yz/wpnjcRXc1XL7BYzmXvLPpZxlzfCxzHiUeWjjov6EydY6pT9GH
 OjGSyxIddU3LAmHgGsg4TvgBC8U0TkxYTWuammy1vmtRwCE3tQR+NirIatiOB27WkXsm5j
 6zmJRNhdf3taeIr3OpwomB3dJMJEgPY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-YzwWb58LNm6-f7BLokNoNA-1; Mon, 01 Sep 2025 08:59:12 -0400
X-MC-Unique: YzwWb58LNm6-f7BLokNoNA-1
X-Mimecast-MFC-AGG-ID: YzwWb58LNm6-f7BLokNoNA_1756731551
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3d226c3a7c2so1599847f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756731551; x=1757336351;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RoiIEnJ0ic7SzUloB3/lyFFbxaN9NLIbcmrNtiHaEk4=;
 b=DlfKOFNVGs7+qFNOk37OesvHKrcq6VPq4PRqP2U3dz+E/bytc+XsNlHHT7gaosYqxP
 ifx/jGIq5CxTR9zSlsZzIdEEAkWpD3rP52Np9UsaVV8A8rDGnIhqo3wO0tHi9/uQfvk1
 mBbBbT5WFASDmDgZf0S3rs4xbdFnai9gph1RmLLntytJPnPwFuZMwthF9D7Ys8QGdkX1
 Qx+vozFrRQSL85czwju+dHgxPjYTrnjJoYyuqDGsRFhh4f9kWyW03OLRXOk9DhQwtQiE
 T9FZALnNBYZeZOCbR4uauVvIKgJSg5Duegk7xGVoMZ9XC2XiW7wWtaSwfB3uIfUunVXP
 fMzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4NbOBK+UECOHu/SNkIWFPIa7iF6u4mXvjQ1p+H5fvhQ2cTXUN3ZxVpCBeIK2NXSrUfLDA2kIzLuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSwYDLXISHBRX4KFeP1782Dcz/BavfG0PorJGWMH170Qecrr0a
 zxogsE77Yrp1Vni+vAIYwSqqgBtljeM1KVWcBg2Pp2fJR3fsthGRNAgL9rMJb18asKFv2NWlR89
 Mbwyw9lAfNU0D//441fHFOAgXlGVx2uCNKL01wS8AeZdexFlbkaUDESlNqwgNZLjOfJeB+A==
X-Gm-Gg: ASbGnctCxvDeqTDJtyW+quLHGLvpxiOM1f4xCtAqdJCqiNGrseAxYUL8SymMiW4xiGA
 6Y6Ncxh4PIVWAINa+6qGQe8cs5+47dXS+YXyA6JRv1cy44Hsqckyn9e+rLBD1hUsmSlUTojODiR
 7rFvHxCZOnNHR9Z55o8UFNsc3P8lO3sxbw0LbREtEIDL1kGy9qVMZDaobF2/NenucVEFuIJQVRN
 95SE+oeO7V3vFMHGbWtJXSjsYcNzlyvKngW87dFUjYv/gzWam1OChho3gL2SgEFza26sFWpxznv
 AeGcBHN4xsqMbCcj+jAC+WKdb0SXzKK+lGuW+Ax+uZOw2lsNKd2hhJLe8lQzwEOmRxWILwNNpYF
 xdfI=
X-Received: by 2002:a05:6000:22c8:b0:3d4:d572:b8ea with SMTP id
 ffacd0b85a97d-3d4d582029dmr4076263f8f.34.1756731551290; 
 Mon, 01 Sep 2025 05:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwwiOlbgDAUXiL5u9+hhsxXPHF3nih+OFrmTVITUV0olcPvLjVNle5d7dLd+XfIou16DK1DA==
X-Received: by 2002:a05:6000:22c8:b0:3d4:d572:b8ea with SMTP id
 ffacd0b85a97d-3d4d582029dmr4076243f8f.34.1756731550807; 
 Mon, 01 Sep 2025 05:59:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf270fc3fasm15108222f8f.5.2025.09.01.05.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:59:10 -0700 (PDT)
Message-ID: <a43fea8c-4c62-422e-a3f0-7192ab51992a@redhat.com>
Date: Mon, 1 Sep 2025 14:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panic: Add kunit tests for drm_panic
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-3-jfalempe@redhat.com>
 <20250827-wooden-kakapo-of-defense-0c4273@houat>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250827-wooden-kakapo-of-defense-0c4273@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4_PaJcbT50yxMDvV0UKXwot6RGqiO48KXp1FTztGBKg_1756731551
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

On 27/08/2025 11:44, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Aug 21, 2025 at 11:49:06AM +0200, Jocelyn Falempe wrote:
>> Add kunit tests for drm_panic.
>> They check that drawing the panic screen doesn't crash, but they
>> don't check the correctness of the resulting image.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   MAINTAINERS                            |   1 +
>>   drivers/gpu/drm/drm_panic.c            |   4 +
>>   drivers/gpu/drm/tests/drm_panic_test.c | 164 +++++++++++++++++++++++++
>>   3 files changed, 169 insertions(+)
>>   create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cfa28b3470ab..285d1e27734f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8465,6 +8465,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
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
>> index 000000000000..46ff3e5e0e5d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
>> @@ -0,0 +1,164 @@
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
>> +static void drm_test_panic_screen_user_map(struct kunit *test)
>> +{
>> +	struct drm_scanout_buffer *sb = test->priv;
>> +	const struct drm_test_mode *params = test->param_value;
>> +	void *fb;
>> +	int fb_size;
>> +
>> +	sb->format = drm_format_info(params->format);
>> +	fb_size = params->width * params->height * sb->format->cpp[0];
>> +
>> +	fb = vmalloc(fb_size);
>> +	KUNIT_ASSERT_NOT_NULL(test, fb);
>> +
>> +	iosys_map_set_vaddr(&sb->map[0], fb);
>> +	sb->width = params->width;
>> +	sb->height = params->height;
>> +	sb->pitch[0] = params->width * sb->format->cpp[0];
>> +
>> +	params->draw_screen(sb);
>> +	vfree(fb);
>> +}
> 
> You need to document what you're testing, and what the expected result
> is.

Sure, I will add some comments.
I think I can also add a few checks, as this doesn't check the result at 
all.

> 
> Maxime

