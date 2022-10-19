Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940DE604CE0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE95E10E08E;
	Wed, 19 Oct 2022 16:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453C810E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666196096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbItCuma0jqN4EUeN5bMBZ7U9i6ECoLYFYE+AZJbntk=;
 b=IHorWB7YIXvb1st5R6mCD7+34fHx9/XeqmP+Ly/bJ18L6P+bWJtdtZHkNGzmvxaDZ9NUct
 9hvgIDUb+gUmTs+a9kF8IC4zCiKS8fgosPun3kiPDAQ9t/vGKrcS59vT6aZVAgKkjuJdtY
 g5dsDfDwTU/R6v+BJeGiVni4fmEV0ik=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-AXYHRKm0P4WT-ypuKHGWIA-1; Wed, 19 Oct 2022 12:14:55 -0400
X-MC-Unique: AXYHRKm0P4WT-ypuKHGWIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so256852wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 09:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbItCuma0jqN4EUeN5bMBZ7U9i6ECoLYFYE+AZJbntk=;
 b=YL87vHbuD0JI8xZlIw5ite/6p05ZlwUUhw54Gwid5UFHr6mHWfUZ/KGb3OIhE7cTtm
 5tjnWi2QgpNUA+tMZSuWZxONpeBDohrKCyby28SVpo2+1KM7BWVKgiMZ4P4hKI9S4poe
 jnX+LFiV9+y5l49X+URode7RG+TypIxc/9FHwm4y/DnloNhmIPv5SmZMQ2GKdfRN3Ysw
 0qeQ63vUY2RBe7FHhYnL4tvBmIk3cA56Gb2lBG2l9jSEg64ZbDJJnR1pz+t9qtoYw/oK
 /k40Z9K9CHnYBKxuevFNipPcrZRvNR2/Nn3ItlxrM6VpyWMvfvKTnXB5b6D7EMyBPuQB
 Nexw==
X-Gm-Message-State: ACrzQf0UFqWSxT7oYG0hat/futf43tQEWXal9/XhwH/HVzGfH0vBIXbc
 bHje1gzBeBuwRKD331yozYhKZLVgzOw2oV9BYKT60CnBco2iha1cIIBgtSsGPyhDx+57tZF44up
 AbIgkQjcVuk7CIPGRMvvpCcDo95xE
X-Received: by 2002:a05:600c:198a:b0:3c6:f6b4:68d5 with SMTP id
 t10-20020a05600c198a00b003c6f6b468d5mr6021763wmq.14.1666196094164; 
 Wed, 19 Oct 2022 09:14:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vdbvnH2yoFTpFVq2h0lq5YfLyz+nFvkZbyXTZtXkrDwcfTEWrdFEyZiQJIRLM7SOWVN9KGQ==
X-Received: by 2002:a05:600c:198a:b0:3c6:f6b4:68d5 with SMTP id
 t10-20020a05600c198a00b003c6f6b468d5mr6021744wmq.14.1666196093896; 
 Wed, 19 Oct 2022 09:14:53 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003b4a68645e9sm318176wmo.34.2022.10.19.09.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:14:53 -0700 (PDT)
Message-ID: <0a8e925f-4ad7-82ab-dd16-b2c0bf5aba48@redhat.com>
Date: Wed, 19 Oct 2022 18:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: tests: Fix a buffer overflow in format_helper_test
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 David Gow <davidgow@google.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Naresh Kamboju <naresh.kamboju@linaro.org>
References: <20221019073239.3779180-1-davidgow@google.com>
 <6bb18060-158a-a2e7-3382-5d42813fe247@riseup.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <6bb18060-158a-a2e7-3382-5d42813fe247@riseup.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/19/22 13:36, Maíra Canal wrote:
> [cc Javier]
> 
> Hi David,
> 
> On 10/19/22 04:32, David Gow wrote:
>> The xrgb2101010 format conversion test (unlike for other formats) does
>> an endianness conversion on the results. However, it always converts
>> TEST_BUF_SIZE 32-bit integers, which results in reading from (and
>> writing to) more memory than in present in the result buffer. Instead,
>> use the buffer size, divided by sizeof(u32).
>>
>> The issue could be reproduced with KASAN:
>> ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/tests \
>> 	--kconfig_add CONFIG_KASAN=y --kconfig_add CONFIG_KASAN_VMALLOC=y \
>> 	--kconfig_add CONFIG_KASAN_KUNIT_TEST=y \
>> 	drm_format_helper_test.*xrgb2101010
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
>> Signed-off-by: David Gow <davidgow@google.com>
> 
> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
>

The fix makes sense to me as well,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

>> ---
>>
>> This is a fix for the issue reported here:
>> https://lore.kernel.org/dri-devel/CA+G9fYsuc9G+RO81E=vHMqxYStsmLURLdOB0NF26kJ1=K8pRZA@mail.gmail.com/
>>
>> Note that it may conflict with the KUNIT_EXPECT_MEMEQ() series here:
>> https://lore.kernel.org/linux-kselftest/20221018190541.189780-1-mairacanal@riseup.net/
> 
> I believe this patch will go to the drm-misc-fixes tree, so I can rebase
> the series (and address the format issues) as this patch hits mainline.
> 

Awesome. I assume you are pushing to drm-misc-fixes then?

Thanks a lot David and Maíra for taking care of this!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

