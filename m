Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE77F759DAC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293E10E4EC;
	Wed, 19 Jul 2023 18:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9DF10E4EC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689792175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FesoQTJ8UjoHrjSRH+KuNtLC4V0/j8s1GxlaRmyTwsI=;
 b=PiJSzAUtSXgS6NcDyoI2kEMC3sMtVhstMkmDMiXuWWxTtHWjOMuXq1lpT1Bq4p3xlDj+wA
 pKI1lcMrcg4qlbj5tG73fqw5EkqOfN3MtyLMIlTEftbz3D7/AgejFzzUdGLBPv9jmLnztp
 OdgRuew5Tn4aB7Pe3r0Xh5RB/FF3GSw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-9nUl4BC0MtOxM0m720Qnag-1; Wed, 19 Jul 2023 14:42:54 -0400
X-MC-Unique: 9nUl4BC0MtOxM0m720Qnag-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso3985758f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 11:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689792173; x=1690396973;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FesoQTJ8UjoHrjSRH+KuNtLC4V0/j8s1GxlaRmyTwsI=;
 b=THfIQ/T7XDeUmzdi/yEP7Gp7PjI6Adu9zgdcJemrwpxZH2huoesMxRHiaoQyF8/Tbo
 RZWO29CTug/KGuG4QvNkFv2xdb/sH/LiJFsyt2HmwFuZJ0ZTozcWMP8qP+IKJBXizI6z
 SgE1TRQvBnf6c2ocnM11nk7w1hhRPm+N/XrrirdKgDbVRPbqL6wBe0wHHBVNEAh0wW/z
 VU091q4ML3Cbj2/nxEDLET69Yx+yxx0dxvIIzT3CyuFqFXwox6SI5ruGtafzEfDyfE/I
 KwOsBBqWJfNvEEEVkTJfxrrNVAIIE4RrkvbvyY8VMrHZdSAxh+5WO8npTrooX94puvdp
 n5+w==
X-Gm-Message-State: ABy/qLbizPNDufCkJ8irR0jbE3SZ57oKbhJa5nvRoViZ+DmU+KrvYcYx
 6/iMtQbmO6UMpBjv4G5CiHTNvt8u1IOZouPDXGpKTkJ79FiRLae4ZWyNaWKxhTNGG544sWV6Wym
 fsD4Iccyy1mBkR+3lEjNXrXz3tMV4XEIcihcz
X-Received: by 2002:adf:f40b:0:b0:314:3b70:1c72 with SMTP id
 g11-20020adff40b000000b003143b701c72mr202813wro.12.1689792173115; 
 Wed, 19 Jul 2023 11:42:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfJpG0ygob3RPXEtMhQc4NUJjcgzdJI8tfjTO74cqd+QsTgZdrwIQDuFradrw/TbO50ij7dw==
X-Received: by 2002:adf:f40b:0:b0:314:3b70:1c72 with SMTP id
 g11-20020adff40b000000b003143b701c72mr202803wro.12.1689792172804; 
 Wed, 19 Jul 2023 11:42:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o8-20020a5d4a88000000b003145521f4e5sm5980075wrq.116.2023.07.19.11.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 11:42:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 01/11] drm/tests: helpers: Switch to kunit actions
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-1-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-1-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 20:42:51 +0200
Message-ID: <871qh3ivys.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

The patch looks good to me. I've two questions below though.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 32 +++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 4df47071dc88..38211fea9ae6 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -35,8 +35,8 @@ static struct platform_driver fake_platform_driver = {
>   * able to leverage the usual infrastructure and most notably the
>   * device-managed resources just like a "real" device.
>   *
> - * Callers need to make sure drm_kunit_helper_free_device() on the
> - * device when done.
> + * Resources will be cleaned up automatically, but the removal can be
> + * forced using @drm_kunit_helper_free_device.
>   *
>   * Returns:
>   * A pointer to the new device, or an ERR_PTR() otherwise.
> @@ -49,12 +49,31 @@ struct device *drm_kunit_helper_alloc_device(struct kunit *test)
>  	ret = platform_driver_register(&fake_platform_driver);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> +	ret = kunit_add_action_or_reset(test,
> +					(kunit_action_t *)platform_driver_unregister,
> +					&fake_platform_driver);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
>  	pdev = platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
>  
> +	ret = kunit_add_action_or_reset(test,
> +					(kunit_action_t *)platform_device_put,
> +					pdev);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
>  	ret = platform_device_add(pdev);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> +	kunit_remove_action(test,
> +			    (kunit_action_t *)platform_device_put,
> +			    pdev);
> +

I understand that this action removal is because platform_device_put() is
not needed anymore after the platform_device_unregister() remove action is
registered since that already takes care of the platform_device_put().

But maybe add a comment to make more clear for someone who is not familiar
with these details of the platform core ?

>  EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
> @@ -70,8 +89,13 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  
> -	platform_device_unregister(pdev);
> -	platform_driver_unregister(&fake_platform_driver);
> +	kunit_release_action(test,
> +			     (kunit_action_t *)platform_device_unregister,
> +			     pdev);
> +
> +	kunit_release_action(test,
> +			     (kunit_action_t *)platform_driver_unregister,
> +			     &fake_platform_driver);
>  }
>  EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
>

I thought the point of using the kunit cleanup actions was that you could
just make the kunit framework handle the release of resources and not do
it manually?

Can you just remove this function helper or is still needed in some cases?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

