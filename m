Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFCF63D2A3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D2A10E443;
	Wed, 30 Nov 2022 09:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B9F10E449
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669802381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9YloUXR8YgxG0RXDuEgcRvlMcfIOaju0pjadJIoBw0=;
 b=d4Ilwr7g/zJvmsCiZvucpqZjmSLCWrR/B1F6Ut3oXrLvmEJYpA5BkHxy6k8Msuer1g4MfC
 NSavCopL8nx66MyJmoosOCtmMxfc7UnBQ2JJbi6D6N3TMWE2f8UWEcu8T/ALWokBeZsAl2
 ElnhhjAXlvAObReivvtvwa8TLZL2xXU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-1gndlIHROKia5sSrrYZENg-1; Wed, 30 Nov 2022 04:59:40 -0500
X-MC-Unique: 1gndlIHROKia5sSrrYZENg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so448356wme.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 01:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i9YloUXR8YgxG0RXDuEgcRvlMcfIOaju0pjadJIoBw0=;
 b=Woor2jV98RPTzPMeUxXaIAIh+EMAIzK56HCBmWpFhmwaPuonulNH2Uo8Hm68lFCkiT
 GdrIQ5dwUuoQwekIJLgtHd4QbqWKHzZ6QLwi2XbtFBe1ZFOqmV1UbrH+84kyuGVyiIw4
 jiGM+0wS3l3kWIY9h3jv0YPDzvppR8fmOV7UG3P33SZW2JB7dEd67ZBEtmVk4LmtqY1G
 3K52y7VQVO/pNuK2SGUtFgfmshDyGl0b62GuKb/t4FsHCZMZrOQMY7vrhzIFduZhov4+
 xPI4BEX5ITuGGoKJXqPCw38RPfVPJG+Eky/LSffwQdlRIk9ItK/f6Uo6ZJ9WvJyZ0cQe
 0dhg==
X-Gm-Message-State: ANoB5pmfembSZuomY/0oWhB32+mjMGb61SROwxyJXVRQ4UM+G50psz60
 r3nADg8lSecUgKP0bui+rMgW60Kr4tjlf7fUzejFPhWh2O844vfM+Pcgojv2K2HmQh+BhQHatNV
 nTww7Fjk6RVVJwz15NGENOXtzMfzw
X-Received: by 2002:a1c:ed04:0:b0:3cf:d08d:3eb2 with SMTP id
 l4-20020a1ced04000000b003cfd08d3eb2mr44719688wmh.129.1669802379217; 
 Wed, 30 Nov 2022 01:59:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf79VoYVflQvJw4f+0ufZcLu3pjWScxDx/iG55eOd/S6Dqx9Zr87reES7FRBY59uRsQEURml4w==
X-Received: by 2002:a1c:ed04:0:b0:3cf:d08d:3eb2 with SMTP id
 l4-20020a1ced04000000b003cfd08d3eb2mr44719668wmh.129.1669802379003; 
 Wed, 30 Nov 2022 01:59:39 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b003d04e4ed873sm5840399wmb.22.2022.11.30.01.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 01:59:38 -0800 (PST)
Message-ID: <98d47486-d04c-b81a-6ae4-fa7f62828a0e@redhat.com>
Date: Wed, 30 Nov 2022 10:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 15/17] drm/vc4: tests: Introduce a mocking
 infrastructure
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-15-efe5ed518b63@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-15-efe5ed518b63@cerno.tech>
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
> In order to test the current atomic_check hooks we need to have a DRM
> device that has roughly the same capabilities and layout that the actual
> hardware. We'll also need a bunch of functions to create arbitrary
> atomic states.
> 
> Let's create some helpers to create a device that behaves like the real
> one, and some helpers to maintain the atomic state we want to check.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

> +
> +config DRM_VC4_KUNIT_TEST
> +	bool "KUnit tests for VC4" if !KUNIT_ALL_TESTS
> +	depends on DRM_VC4 && KUNIT

shouldn't this depend on DRM_KUNIT_TEST instead ?

[...]

> +static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
> +{
> +	struct drm_device *drm;
> +	const struct drm_driver *drv = is_vc5 ? &vc5_drm_driver : &vc4_drm_driver;
> +	const struct vc4_mock_desc *desc = is_vc5 ? &vc5_mock : &vc4_mock;
> +	struct vc4_dev *vc4;

Since it could be vc4 or vc5, maybe can be renamed to just struct vc_dev *vc ?

> +struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
> +					struct drm_device *drm,
> +					enum drm_plane_type type)
> +{
> +	struct vc4_dummy_plane *dummy_plane;
> +	struct drm_plane *plane;
> +
> +	dummy_plane = drmm_universal_plane_alloc(drm,
> +						 struct vc4_dummy_plane, plane.base,
> +						 0,
> +						 &vc4_dummy_plane_funcs,
> +						 vc4_dummy_plane_formats,
> +						 ARRAY_SIZE(vc4_dummy_plane_formats),
> +						 NULL,
> +						 DRM_PLANE_TYPE_PRIMARY,
> +						 NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
> +
> +	plane = &dummy_plane->plane.base;
> +	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
> +
> +	return dummy_plane;
> +}

I guess many of these helpers could grow to be generic, like this one since
most drivers support the DRM_FORMAT_XRGB8888 format for their primary plane.

[...]

>  
> +extern const struct vc4_pv_data bcm2835_pv0_data;
> +extern const struct vc4_pv_data bcm2835_pv1_data;
> +extern const struct vc4_pv_data bcm2835_pv2_data;
> +extern const struct vc4_pv_data bcm2711_pv0_data;
> +extern const struct vc4_pv_data bcm2711_pv1_data;
> +extern const struct vc4_pv_data bcm2711_pv2_data;
> +extern const struct vc4_pv_data bcm2711_pv3_data;
> +extern const struct vc4_pv_data bcm2711_pv4_data;
> +

Maybe the driver could expose a helper function to get the pixelvalve data
and avoid having to expose all of these variables? For example you could
define an enum vc4_pixelvalve type and have something like the following:

const struct vc4_pv_data *vc4_crtc_get_pixelvalve_data(enum vc4_pixelvalve pv);

All these are small nits though, the patch looks great to me and I think is
awesome to have this level of testing with KUnit. Hope other drivers follow
your lead.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

