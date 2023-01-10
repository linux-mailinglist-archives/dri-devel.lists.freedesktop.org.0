Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478C8663E88
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112BA10E592;
	Tue, 10 Jan 2023 10:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6EA10E591
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673347694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yYcTtQPoskS9gZPccIHbO8lXQE75TydsMzb/way5LQ=;
 b=eb9pZxqm1Tjp6an0yWISzPmMQnFPcgN/jwyCH2ckewCBHzgK+GWBNS86PRDZKgVEISwHC0
 hh5/j346zcRsMGqXG2pFG6VvwURQMQ8BLEYgNY9+AXISuQzr7GpqINbEJnHwquMzKS8KBr
 vKVajPWnvYpaliYcZeWwEt1Ihh2PX6w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-_pV1fj9xMBeQu-Jtkv3QYw-1; Tue, 10 Jan 2023 05:48:13 -0500
X-MC-Unique: _pV1fj9xMBeQu-Jtkv3QYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso2407863wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/yYcTtQPoskS9gZPccIHbO8lXQE75TydsMzb/way5LQ=;
 b=uZSn+S3DmiD5i3uyYGL41AmtfiNF6LhNFNBQKw3mS858a/CcRLFfg4cn9Addzcj/uf
 wDspd02mbTFQIzAugSm4lImaEopk6c47dNDfKBKr+BfrKcSLc8uqGHE+gX2RTOBOmHsd
 l6tVG4VSqyTOtdyninIXALPVs333ty9z/Pq4sZc9kboX5L5XJSHaBXlfZ25NJqHqjBc1
 1ZO+e16P+ot+Kmz9ulXDTv0KU/MgJeILUqUK1vny3ibS0NjQY1aNOjW/THzMY9OU/NXm
 xTMYEepQHeELJ7vN4SgP3ZX0zt7l93HgdNVgdFpPX9SccXwECUH3Kn+3XJnrVIiYujwv
 jwHQ==
X-Gm-Message-State: AFqh2kqABfgOgtsHrokJYXJZpF7zRLJzXEoHhfs5rBSodakuvC3swrh3
 uRXOnjD3ti1Vca5k8MPboTA9yQP2iwR2UZOdY50nkK0YK17e0hnn3GERKLekhCyrQ70wJz4E2oq
 0uqTM42oQaK3D52O2hy8SzYVMQULH
X-Received: by 2002:a05:600c:3d90:b0:3d9:f798:dcba with SMTP id
 bi16-20020a05600c3d9000b003d9f798dcbamr1969655wmb.38.1673347691871; 
 Tue, 10 Jan 2023 02:48:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuX/ud7ajQR16rgBukjH6thYHmemQ8EN6E6QgIiDHPbwyrfNMT43bQzV8gjJ8nIvM4ld62nsw==
X-Received: by 2002:a05:600c:3d90:b0:3d9:f798:dcba with SMTP id
 bi16-20020a05600c3d9000b003d9f798dcbamr1969630wmb.38.1673347691640; 
 Tue, 10 Jan 2023 02:48:11 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm21792602wmb.42.2023.01.10.02.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:48:11 -0800 (PST)
Message-ID: <51e8233c-1b9f-239b-ff4a-6410b622b53c@redhat.com>
Date: Tue, 10 Jan 2023 11:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Dave Airlie <airlied@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20221219083627.1401627-1-u.kleine-koenig@pengutronix.de>
 <c1f358fc-5784-b3b2-2d9e-bc896b8036ff@redhat.com>
In-Reply-To: <c1f358fc-5784-b3b2-2d9e-bc896b8036ff@redhat.com>
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
Cc: kernel@pengutronix.de, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 09:49, Javier Martinez Canillas wrote:
> Hello Uwe,
> 
> On 12/19/22 09:36, Uwe Kleine-König wrote:
>> While working on a drm driver that doesn't need the i2c algobit stuff I
>> noticed that DRM selects this code even though only 8 drivers actually use
>> it. While also only some drivers use i2c, keep the select for I2C for the
>> next cleanup patch. Still prepare this already by also selecting I2C for
>> the individual drivers.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
> 
> Thanks for sending a v3 of this.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

