Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F553BC7D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 18:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E05112B15;
	Thu,  2 Jun 2022 16:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20209112B15
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654187224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mygmPhKiJi7o/hltZa2N+7CYRMGUR5v63WXlkfkXj6Q=;
 b=Pe0Cu6hU+M37nyL8McHSuFcXxjvOH/ZV1t+5XrCsbQhOjqaJG12dFzHchFnI8Vc8V9WvIr
 R7r65bSCAaucnaCc5qmddhlETZqk4LVw0hpLTjA9sTTKWMBHklFTqcEKgo0cRE8QHqxB/k
 JNITVwaz1PRg24fsk9Ko/J0WsgDSmMI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-GuCbEzyKPpajKkBB12scgA-1; Thu, 02 Jun 2022 12:27:00 -0400
X-MC-Unique: GuCbEzyKPpajKkBB12scgA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n18-20020a05600c3b9200b0039746f3d9faso2635374wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 09:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mygmPhKiJi7o/hltZa2N+7CYRMGUR5v63WXlkfkXj6Q=;
 b=KDB3YEMDRQ/ukPs1rOlTd5+W8RVbBIHazZgk3p1k3gY4ep4YrZcNV5FKHv3C6Jcn7p
 Tm2khc+VhVoTnqgemSESy90EFzUw929T5zsKutVMAkd5ZwCQMKPusVkydFOx/N7SxSBC
 BWpx04FIo3fDKSaQ5fU2WmjtteqSjMYw34Klw4UfiI6ozIDaVMT4cLd6wFPMFB1ryO7J
 BdOuyTU55ZNy6nsqjRXCdTnG8e/3lHfXi8xQiSsLN8m5ov5UGNZpy/7F6LvoqVb0zn4P
 4QItZjy3tpsCeM950IEC2o9XZfbsXnPo+1xgh5pPXNxTnjM9ERxu5pEpIQRB3kjltW2w
 b2Xg==
X-Gm-Message-State: AOAM533wtPoCoIn4l+l3zVFqZG4ovMx292GkwfKn339kskaOxzFuv43i
 u7389QQ6j/L/CzwTbUKBknyhSzVxPy1rqbGpqzlV6KUZq6ZQ3rnovS6LZ9btVZIaVk/LsIljMoq
 GY1oxS5GLA4X0a9e83S+snzmp0ALA
X-Received: by 2002:a05:6000:1887:b0:20f:e155:9db4 with SMTP id
 a7-20020a056000188700b0020fe1559db4mr4296982wri.243.1654187219640; 
 Thu, 02 Jun 2022 09:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz3mxXpaL3a1n46/Ak3TghAtlxNB5xnz5LUKaE7clzJo3LROi83rBH+pU6l0xxChUwQLHFIg==
X-Received: by 2002:a05:6000:1887:b0:20f:e155:9db4 with SMTP id
 a7-20020a056000188700b0020fe1559db4mr4296961wri.243.1654187219328; 
 Thu, 02 Jun 2022 09:26:59 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l65-20020a1c2544000000b00397393419e3sm8948736wml.28.2022.06.02.09.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 09:26:59 -0700 (PDT)
Message-ID: <e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com>
Date: Thu, 2 Jun 2022 18:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220530102017.471865-2-jose.exposito89@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: tzimmermann@suse.de, airlied@linux.ie, Daniel Latypov <dlatypov@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello José,

On 5/30/22 12:20, José Expósito wrote:
> Test the conversion from XRGB8888 to RGB332.
> 
> What is tested?
> 
>  - Different values for the X in XRGB8888 to make sure it is ignored
>  - Different clip values: Single pixel and full and partial buffer
>  - Well know colors: White, black, red, green, blue, magenta, yellow
>    and cyan
>  - Other colors: Randomly picked
>  - Destination pitch
> 
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---

Thanks a lot for working on this! It's very cool to see the first KUnit
tests added to DRM :)

>  drivers/gpu/drm/Kconfig                  |  12 ++
>  drivers/gpu/drm/Makefile                 |   3 +
>  drivers/gpu/drm/drm_format_helper_test.c | 166 +++++++++++++++++++++++
>  3 files changed, 181 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_format_helper_test.c
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index e88c497fa010..d92be6faef15 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -76,6 +76,18 @@ config DRM_KMS_HELPER
>  	help
>  	  CRTC helpers for KMS drivers.
>  
> +config DRM_FORMAR_HELPER_TEST

I wonder if we want this level of detail for the test Kconfig symbols.
Maybe we could just have a DRM_KUNIT_TEST symbol that will enable all
the KUnit test suites for DRM ?

> +	bool "drm_format_helper tests" if !KUNIT_ALL_TESTS
> +	depends on DRM && KUNIT=y
> +	select DRM_KMS_HELPER

Daniel didn't like this `select DRM_KMS_HELPER` and I think that we can avoid
it if instead drm_format_helper_test.c is included in drm_format_helper.c, i.e:

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index a3ccd8bc966f..d63e02da528f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -692,3 +692,7 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
        kfree(src32);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
+
+#ifdef DRM_KUNIT_TEST
+#include "drm_format_helper_test.c"
+#endif

This also has the advantage that will allow to have KUnit tests for the static
functions that are only available in the drm_format_helper.c compilation unit.

>  obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
> +obj-$(CONFIG_DRM_FORMAR_HELPER_TEST) += drm_kms_helper.o \
> +		drm_format_helper_test.o

And doing that will also allow you to get rid of this, since just selecting
CONFIG_DRM_KUNIT_TEST=y would be enough for the tests built and run by KUnit.

> +CFLAGS_drm_format_helper_test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
>

A comment on why this is needed would useful.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

