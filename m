Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B45E638611
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 10:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA5010E0E8;
	Fri, 25 Nov 2022 09:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893E610E24C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669368330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdoQUUexZ7ga7BmgL2KbubMH7KSrCAhYA4sosdJ8U/Q=;
 b=Y9BvoI/RORKVkZpXw6zROBIajuNoWVtIashLuZmi7K3w8bIr/6MW+b0eLO1oPhkhUOyNIe
 mhdkYHS6lcQvo7ZBesJJCaL8bq65TIGhCLTD2wqeQdcdlqkSunGXmWGiPZUxQlpw82tGW1
 fpQygSvz7r9hyFWNj5wCXEn5CM4n/O8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-bmGqBQksP2-ivLB6sKclJw-1; Fri, 25 Nov 2022 04:25:29 -0500
X-MC-Unique: bmGqBQksP2-ivLB6sKclJw-1
Received: by mail-wr1-f70.google.com with SMTP id
 w11-20020adfbacb000000b002418a90da01so718077wrg.16
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 01:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PdoQUUexZ7ga7BmgL2KbubMH7KSrCAhYA4sosdJ8U/Q=;
 b=RRARrvaoqC1vLMq9AYeU9KWcNglrMcTBh/0b4jclUi6qtCj4FanSbb5LNnJTGSqzEr
 BXLZXEneZm4hVEMa4GlULuiGaYxYLwpoQvbgBOfDh39laHsfcK02jbXMXypyp7dZib/p
 CplGUBhvNZs3vhdUKvPJ+rpfQ39CG6+CFAnmudcjfF6NSGL1N9J8XsmpqVgDi6aRTV8B
 CNBeCknffWHSbAoqdD71LB434kpxxmJNPfRl5DTBG0PR1F8azVxbOyZhV48sv2jet44K
 9GJF1lmnqbUql1+0AmLNwHNsJfXPDnDnQnC1q5eHlqnQ00FVcRwJOEb4Q/VWwSrSV3GL
 BFZg==
X-Gm-Message-State: ANoB5plfCXo7CJbgIx97pA9gN8KoQx3wBHRP6jc43Kv0a7we4/CqYJJ/
 hlpXuFsjQORjFk/XabctomDuFep3WIe+Im6uUFGYr6r8nM55v/Utkrh7VANKNNi7Zg8WO40WGO1
 sAYua8YEutZHrLbrS4T6RG3M4FTrs
X-Received: by 2002:a05:600c:3501:b0:3c7:4f0:77b3 with SMTP id
 h1-20020a05600c350100b003c704f077b3mr13270554wmq.93.1669368328281; 
 Fri, 25 Nov 2022 01:25:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vxRVWps62Nub/Y/bXYoNoPFQkcrqfFgC4Xw+JywmVH37euSYEJ8/pRQ9JWKoQwlq2n7w9Uw==
X-Received: by 2002:a05:600c:3501:b0:3c7:4f0:77b3 with SMTP id
 h1-20020a05600c350100b003c704f077b3mr13270533wmq.93.1669368328022; 
 Fri, 25 Nov 2022 01:25:28 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b17-20020a5d4b91000000b0024207478de3sm664177wrt.93.2022.11.25.01.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 01:25:26 -0800 (PST)
Message-ID: <56cbef35-da0e-d278-fef5-83b0944ed416@redhat.com>
Date: Fri, 25 Nov 2022 10:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 04/24] drm/tests: helpers: Switch to a platform_device
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-4-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-4-051a0bb60a16@cerno.tech>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:25, Maxime Ripard wrote:
> The device managed resources are ran if the device has bus, which is not
> the case of a root_device.
> 
> Let's use a platform_device instead.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 2f974f45c5b4..651aa93a98a8 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -6,6 +6,7 @@
>  #include <kunit/resource.h>
>  
>  #include <linux/device.h>
> +#include <linux/platform_device.h>
>  
>  #include "drm_kunit_helpers.h"
>  
> @@ -20,12 +21,26 @@ static const struct drm_mode_config_funcs drm_mode_config_funcs = {
>  
>  struct device *drm_kunit_helper_alloc_device(struct kunit *test)
>  {
> -	return root_device_register(FAKE_DEVICE_NAME);
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	ret = platform_driver_register(&fake_platform_driver);

Maybe the platform_driver_register() is something that should be done
in the drm_client_modeset_test_init() callback ?

I would also as a part of this series rename the kunit_suite from
"drm_test_pick_cmdline_test_suite" to "drm_test_modeset_test_suite"
or something like that. Since you are already setting the .init and
.exit callbacks to allocate and release the devices. So it is more
than just a test suite for cmdline params testing.

> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	pdev = platform_device_alloc(FAKE_DEVICE_NAME, PLATFORM_DEVID_NONE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	ret = platform_device_add(pdev);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return &pdev->dev;
>  }
>

Probably won't do it as a part of this series to avoid making it cross
subsystem, but I think there's room to further consolidation since this
helper seems to be quite generic and something that would be useful for
other subsystems. So it would make sense for kunit to have helpers to
manage platform drivers and devices.

In fact, I see that drivers/base/test/test_async_driver_probe.c already
has similar helpers that could be exposed to the rest of the kernel.

The patch looks good to me though and any of these changes could be done
as a follow-up:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

