Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997763CFFE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 09:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C875410E41A;
	Wed, 30 Nov 2022 08:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC0C10E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669795207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2a8xmX2uqZ7NUsrGlJ+pz4pKlQs3R+YDShsHCw2aB8=;
 b=dB6BQ23XyvhArnf2Bwie4EAlTx4/JFwe68lSpHxrRvzWDrG4vB+lDJC/Wu+lMpaxeT2jrh
 ShKbUkpoT8kjSEmE8KvAT3/a1BIEEESgInjJw7mU4CX8LboWXWSwx6vT4n3fleJ6Ds9VCe
 fbFQPlYEAMshlik0vcjX6+9Rtk+8wpU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-9oXfqrXpO0Ga48DgxhiGfw-1; Wed, 30 Nov 2022 03:00:06 -0500
X-MC-Unique: 9oXfqrXpO0Ga48DgxhiGfw-1
Received: by mail-wr1-f69.google.com with SMTP id
 g14-20020adfa48e000000b00241f94bcd54so3351927wrb.23
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 00:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j2a8xmX2uqZ7NUsrGlJ+pz4pKlQs3R+YDShsHCw2aB8=;
 b=Lml/5pUd9METz93Rww6BAHnhphniDO1l6xJdOurHeKJ82k3UZZdGp7KEWu7kLpEs1l
 6ZaVTWSJDrvJSpgDN1Ux4iunLA0lmxS1YDIkZQ6jZLtpKgEbFLqK8JslzvsKrzslSSq4
 PbaZdgK3pU3vmsL19fVm59ZF3V6aaCFzy9zqQoAS5CAyru5fPSdhkG+VscNPstlyovv9
 aZdjqec3dW93dc8MOlgiotmCzbyyVfxlmVxZVMdM6nYGVmf9NYcrDAs7JZuJIfC4DD52
 AEflcGHBM+N4WqNxXaAtYjWcJuOg/8bP7QkltLhep8ymRr4WtIaljxlT0vU4Mn0pDo0p
 8JJA==
X-Gm-Message-State: ANoB5plYEDy5HIifWSw5VH3wXUWo+GZMacU4j+QNRgcW7aIr6kcLuXnW
 FVRlkGR+h5HWtHLmVrwkGc1R80IcN23sMmPcvBeymTeE9f4eBM+swpmDGTjK4DjAR+P9J2+XrDu
 vbvenyqLRHlfLxq3pMMSUNVFgdqwr
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id
 14-20020a05600c024e00b003c5f9f1f956mr30842030wmj.50.1669795205210; 
 Wed, 30 Nov 2022 00:00:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Ey5+o85KLpwLVMTdnP29Su8T24kkvZHNDgYMdluRgMtIMgcoctfGdxRoxGf1Zvfd2hRrQBg==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id
 14-20020a05600c024e00b003c5f9f1f956mr30842007wmj.50.1669795205007; 
 Wed, 30 Nov 2022 00:00:05 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b003cf894dbc4fsm1046855wma.25.2022.11.30.00.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 00:00:04 -0800 (PST)
Message-ID: <ebe02c21-7770-0415-096e-76a839bad154@redhat.com>
Date: Wed, 30 Nov 2022 09:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 01/17] drm/tests: helpers: Move the helper header to
 include/drm
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-1-efe5ed518b63@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-1-efe5ed518b63@cerno.tech>
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
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 15:53, Maxime Ripard wrote:
> We'll need to use those helpers from drivers too, so let's move it to a
> more visible location.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_client_modeset_test.c            | 3 +--
>  drivers/gpu/drm/tests/drm_kunit_helpers.c                  | 3 +--
>  drivers/gpu/drm/tests/drm_modes_test.c                     | 3 +--
>  drivers/gpu/drm/tests/drm_probe_helper_test.c              | 3 +--
>  {drivers/gpu/drm/tests => include/drm}/drm_kunit_helpers.h | 0
>  5 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 52929536a158..ed2f62e92fea 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -8,12 +8,11 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_kunit_helpers.h>

I wonder if now that this header was moved outside of the tests directory,
if we should add stub functions in the header file that are just defined
but do nothing if CONFIG_DRM_KUNIT_TEST isn't enabled. So that including
it in drivers will be a no-op.

Or do you plan to conditionally include this header file in drivers? So
that is only included when CONFIG_DRM_KUNIT_TEST is enabled?

Another thing that wondered is if we want a different namespace for this
header, i.e: <drm/testing/drm_kunit_helpers.h>, to make it clear that is
not part of the DRM API but just for testing helpers.

But these are open questions really, and they can be done as follow-up:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

