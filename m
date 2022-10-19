Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32581604363
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 13:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C393E10F1F3;
	Wed, 19 Oct 2022 11:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968F910F1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 11:36:40 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MspbW5lZGz9s5l;
 Wed, 19 Oct 2022 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1666179400; bh=XNRu1Rf9naUAJQEIgFaBHnDvkIAFylt64W6tU7GWOPA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AEP6eBMpzpg0qqmPUrGOJnW8tA8W1Lo3kJRd2LZqJFxfVz/kw2wFzqF/Fx1HPcnpf
 Wl5eFKwCkx4xfGCx3GEJG7QgRjoxJiyw25wTd9q0W9mjJjysGpvQ157MKDr8pXbM9s
 R6Tk3PIuF7Qo9bwqEZeFwRxVNc2Cw/3v8c+7IHjs=
X-Riseup-User-ID: 58E92BB22A38AF861FEE21ECADB592288A3AFBBE2166EE8C766289763651D038
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MspbR1Wrzz5vXG;
 Wed, 19 Oct 2022 11:36:34 +0000 (UTC)
Message-ID: <6bb18060-158a-a2e7-3382-5d42813fe247@riseup.net>
Date: Wed, 19 Oct 2022 08:36:31 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm: tests: Fix a buffer overflow in format_helper_test
To: David Gow <davidgow@google.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Naresh Kamboju <naresh.kamboju@linaro.org>
References: <20221019073239.3779180-1-davidgow@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221019073239.3779180-1-davidgow@google.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[cc Javier]

Hi David,

On 10/19/22 04:32, David Gow wrote:
> The xrgb2101010 format conversion test (unlike for other formats) does
> an endianness conversion on the results. However, it always converts
> TEST_BUF_SIZE 32-bit integers, which results in reading from (and
> writing to) more memory than in present in the result buffer. Instead,
> use the buffer size, divided by sizeof(u32).
> 
> The issue could be reproduced with KASAN:
> ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/tests \
> 	--kconfig_add CONFIG_KASAN=y --kconfig_add CONFIG_KASAN_VMALLOC=y \
> 	--kconfig_add CONFIG_KASAN_KUNIT_TEST=y \
> 	drm_format_helper_test.*xrgb2101010
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

> ---
> 
> This is a fix for the issue reported here:
> https://lore.kernel.org/dri-devel/CA+G9fYsuc9G+RO81E=vHMqxYStsmLURLdOB0NF26kJ1=K8pRZA@mail.gmail.com/
> 
> Note that it may conflict with the KUNIT_EXPECT_MEMEQ() series here:
> https://lore.kernel.org/linux-kselftest/20221018190541.189780-1-mairacanal@riseup.net/

I believe this patch will go to the drm-misc-fixes tree, so I can rebase
the series (and address the format issues) as this patch hits mainline.

Best Regards,
- Maíra Canal

> 
> Cheers,
> -- David
> 
> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 8d86c250c2ec..2191e57f2297 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -438,7 +438,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> -	buf = le32buf_to_cpu(test, buf, TEST_BUF_SIZE);
> +	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
>  
