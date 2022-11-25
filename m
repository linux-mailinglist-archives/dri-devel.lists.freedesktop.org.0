Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7116387E9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200FE10E71F;
	Fri, 25 Nov 2022 10:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D4010E71F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669373560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n34PtEGmQl2cURfa8hQ8Z0O727ShHGnHNNaASPtHi8s=;
 b=Lw3W5xY95be4kkjKzcm0VpPLxb6OzLO0mPdwGG5CoTfaiQOGSy07/wvNmA5y55dldK9pGu
 40vkrYMBF1wg6B0ztgByTMENp5a9BBaoz8YEtj+XG/1zItgIL5kLvdkicXBUGw23Wakp7q
 +eYWj8sxHBfXXdINKLgSeSfPny6Hyag=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-3Gq3IpG8PlOfpKkCFYAFlw-1; Fri, 25 Nov 2022 05:52:39 -0500
X-MC-Unique: 3Gq3IpG8PlOfpKkCFYAFlw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so774552wra.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 02:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n34PtEGmQl2cURfa8hQ8Z0O727ShHGnHNNaASPtHi8s=;
 b=g17EDINCt3+yiHTjekDv6hKlyEGtOCFOCOjXDIXQcZ/p5heB0jwgcXAqLOMJ8WLWHY
 WkhcDmRMknYS5JFx13vTaOdVYVFv+6YqnfBzrMaq46iha1qkkf/Sj9TQkoTvD8pBfQsi
 cRfTyxZINCVIjW6kXTWIa0n/2uhTrDL4IpmAwl7qBI2K89MNafALv6vU3ESObePbpqFm
 7kIrJkE00Qk0aY4T0BoR3of7rRoo3YffqueDCYNKFwjRljDkCfvzd7TlOcRqMRJ8G5OX
 8DYdNb7fbsBEO81LAOEuAcPDzZkcpwrCnPhsr0veGik66JMWPFEl2a2WH8aaJdZktzzt
 jPiA==
X-Gm-Message-State: ANoB5pngTyZA+Okscz9doYjogD9dDvVYec3+vOcCnIMSQVaTlxO78lex
 BInrC6ebj0KG5/aeqx6s3gYuHfayzn3lLUaXE8HSGcDFdQ9jlxF02LNqlhPD8f+J7ra0LAwbxlq
 Su8MNQeKppg29NIIyHH3F7gIOmjGo
X-Received: by 2002:a5d:4090:0:b0:241:f675:c8cf with SMTP id
 o16-20020a5d4090000000b00241f675c8cfmr6482882wrp.480.1669373557802; 
 Fri, 25 Nov 2022 02:52:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YGj/u+vP3B6vxPKX/gUeG9Vi/HtdJMIkrGamAVZQ8SKuDoVi0lFd+x2jy0Z4gG5Pm/rZvXw==
X-Received: by 2002:a5d:4090:0:b0:241:f675:c8cf with SMTP id
 o16-20020a5d4090000000b00241f675c8cfmr6482859wrp.480.1669373557617; 
 Fri, 25 Nov 2022 02:52:37 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t2-20020a5d42c2000000b0023662d97130sm3426522wrr.20.2022.11.25.02.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 02:52:37 -0800 (PST)
Message-ID: <222411cb-0942-8b14-8f6d-e0184233cebb@redhat.com>
Date: Fri, 25 Nov 2022 11:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 08/24] drm/tests: Add a test for DRM managed actions
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-8-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-8-051a0bb60a16@cerno.tech>
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
> DRM-managed actions are supposed to be ran whenever the device is
> released. Let's introduce a basic unit test to make sure it happens.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/Makefile           |  1 +
>  drivers/gpu/drm/tests/drm_managed_test.c | 68 ++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index b29ef1085cad..35962c6ef0c4 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_format_test.o \
>  	drm_framebuffer_test.o \
>  	drm_kunit_helpers.o \
> +	drm_managed_test.o \
>  	drm_mm_test.o \
>  	drm_plane_helper_test.o \
>  	drm_rect_test.o
> diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
> new file mode 100644
> index 000000000000..4fc11b289d9e
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include <kunit/resource.h>
> +
> +#include <linux/device.h>
> +
> +#include "drm_kunit_helpers.h"
> +
> +#define TEST_TIMEOUT_MS	100
> +

Why did you choose this timeout value? Maybe we can add some comments
explaining the rationale.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

