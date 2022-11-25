Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65863873E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A934E10E601;
	Fri, 25 Nov 2022 10:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDC810E609
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669371587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bY19rPV8ppg6ZUdn2yxRqF47aTG2fFJ0ZNtqig4Q8uo=;
 b=ZYfzqq2+mOvrwfpxjaf04lQXHf/vLre39iedt2XH8yd3YL6Ux361DnYdTjhmdPzZP+WyMQ
 Sr7qmLpNoCj/dI7NYjJD3AuNNjMXY9tv0JHofGeF214Ng+jlfWkXNES2spivhWLAPmqCK6
 CFuUOjCh3/zRClPvdK3fK4zYbH7EJCM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-hZ2FBBqfP6CA73Fm5BqKPA-1; Fri, 25 Nov 2022 05:19:43 -0500
X-MC-Unique: hZ2FBBqfP6CA73Fm5BqKPA-1
Received: by mail-wm1-f70.google.com with SMTP id
 187-20020a1c02c4000000b003d016c210f7so3976937wmc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 02:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bY19rPV8ppg6ZUdn2yxRqF47aTG2fFJ0ZNtqig4Q8uo=;
 b=S/xSrtTVwYPUtCmtT2TFfafpTaUTVp6QM5LT5y0MyttB0NXoOe1ziB1LEpmFhW/VQg
 s3eydIrf+5xJk264ll+iVKOteeTFriGADLUQjl4mh7NotP9nUF3gVViDEziH4LoXMNfE
 BlKISUJjodScmveOYQwILn9Cp0rxF2GIvRbnqaSRV0aEXu66lXjnhNLSSbcBdze2iQN6
 AHKOGPvXc5YCgwm7oVy35KcKln2sQttHPzL3cGuFqnEfAg2Xx8acOSc18QqRhfCpcoNt
 hWQWqC422h7x2OJecfsiInSC9NGeG4uKV4aQJ8X9NrVKwh9KnhFueEx9NknolSlWomTA
 z2Eg==
X-Gm-Message-State: ANoB5pmAvI0xzRLwRzBeHb7uEaH5HC8fB0y/z6lo/khtW+TaXboU+8iJ
 VZS827aWZ+eQSsU/ssfTIL7Rv/TDFVLcjQGrh6RH6a5DZag3EjDK33/pcGHHCdI95BlL5w0IBMP
 +YJjUNnhfT1qFd1OXSF2FbUcuAwU9
X-Received: by 2002:adf:f189:0:b0:241:bc9e:a238 with SMTP id
 h9-20020adff189000000b00241bc9ea238mr12437039wro.558.1669371581919; 
 Fri, 25 Nov 2022 02:19:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf733o27EIhWoSlUjNsa9tcFhysJWN14yjguQxBT++y7CLSBTY7xXokXb5BEj/8z8JRbucHxIA==
X-Received: by 2002:adf:f189:0:b0:241:bc9e:a238 with SMTP id
 h9-20020adff189000000b00241bc9ea238mr12437025wro.558.1669371581684; 
 Fri, 25 Nov 2022 02:19:41 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b003c5571c27a1sm6216386wmq.32.2022.11.25.02.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 02:19:41 -0800 (PST)
Message-ID: <68ad39a2-e47c-ffcb-34ad-ea680beac59c@redhat.com>
Date: Fri, 25 Nov 2022 11:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 05/24] drm/tests: helpers: Make sure the device is bound
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-5-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-5-051a0bb60a16@cerno.tech>
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
> The device managed resources are freed when the device is detached, so
> it has to be bound in the first place.
> 
> Let's create a fake driver that we will bind to our fake device to
> benefit from the device managed cleanups in our tests.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 60 +++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>

If I understood the platform core code correctly, the probe is always sync in
the case of platform drivers. Unless .probe_type = PROBE_PREFER_ASYNCHRONOUS is
set or a module is loaded using with the "async_probe=1" parameter. So I believe
the wait queue won't be needed. The only DRM driver that forces an async probe is
drivers/gpu/drm/hyperv/hyperv_drm_drv.c AFAICT.

So I would drop this patch from the set for now.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

