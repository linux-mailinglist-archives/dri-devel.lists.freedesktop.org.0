Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158C63D175
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F95C10E055;
	Wed, 30 Nov 2022 09:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAA610E055
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669799624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4kmVPYqwbxGU6PTsZRjCspb80cku12to9pgPPCu54U=;
 b=JT/QT230q1ODZ+cPB2hn0iF1IvgPahTsL+1Uec1xOtBZTeCFx99YGrpUMYC01Rr3FFQTAD
 n3hSGZHZPay0s5GKqexNvBokqtqmZVr2P9hnXBZZp1CHCG0kSqpEPpREaNBJMfSSHvoUTp
 pqaTlGee5mE0hj6Mk4eOCPec3cSaWQs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-QvsFJ7c3O8C-T8BIwqPjyA-1; Wed, 30 Nov 2022 04:13:42 -0500
X-MC-Unique: QvsFJ7c3O8C-T8BIwqPjyA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d6-20020adfa346000000b0024211c0f988so2210260wrb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 01:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H4kmVPYqwbxGU6PTsZRjCspb80cku12to9pgPPCu54U=;
 b=7Ucc25F/vMr4nrV4o0CpLbf594KfzIL+m0cQ4MjqBIhYvUof3cglW0vCL68ndUhXQH
 Nm9uceKP3UfGBdo9VKBGyOkf/7Gu+1OGhdN2335ghMsa6UjZbydOuIUY7EZ51G1Wi5lR
 HoNEqQv1sqhqAr6qUR26e++OApmUU5oSPnEiG1sUyxQkhuSq19WqM/fFwsLDQk6m9hSf
 ecdV2+pRJ0sekpa9WEPHFmAlIhHzBA8EfRwBwlTw5P5XJHAz3Y3yb9doFq4TNODT8RJA
 dVXyat5wW/sotdUlpBpznZHE5l3t/psToYY1uMG20lrLGRO3yFTqsKB5qa6wETNa35zs
 dfow==
X-Gm-Message-State: ANoB5pnJPutQr1f2eSap+tiPbohY37lD8UXE4jghviIPt/3ZjPtbl5AW
 68anDVHKILaxN3i1Nj3RXnvrqULIZV+aqzp3ngSZ6xRp5IgkdG3lZWCF9sWtQqjWzrAe164gfUM
 YcSRrPfND3tkUxtjsRuowN5jSMowf
X-Received: by 2002:a1c:7513:0:b0:3cf:8896:e1c9 with SMTP id
 o19-20020a1c7513000000b003cf8896e1c9mr46817787wmc.119.1669799621489; 
 Wed, 30 Nov 2022 01:13:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5vvCv9O/1R9RXSG17BNuO4k/AT1pMos0jlXhZZ5YoVQ/8d1PLV/cKODBBZcjZF5bgcENOdFQ==
X-Received: by 2002:a1c:7513:0:b0:3cf:8896:e1c9 with SMTP id
 o19-20020a1c7513000000b003cf8896e1c9mr46817770wmc.119.1669799621277; 
 Wed, 30 Nov 2022 01:13:41 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b00241bc4880fesm905866wrt.111.2022.11.30.01.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 01:13:40 -0800 (PST)
Message-ID: <a86a67d8-59dc-1af8-4176-b3236ef0f0a1@redhat.com>
Date: Wed, 30 Nov 2022 10:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 08/17] drm/tests: helpers: Allow for a custom device
 struct to be allocated
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-8-efe5ed518b63@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-8-efe5ed518b63@cerno.tech>
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
> The current helper to allocate a DRM device doesn't allow for any
> subclassing by drivers, which is going to be troublesome as we work on
> getting some kunit testing on atomic modesetting code.
> 
> Let's use a similar pattern to the other allocation helpers by providing
> the structure size and offset as arguments.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

> -EXPORT_SYMBOL(drm_kunit_helper_alloc_drm_device);
> +EXPORT_SYMBOL(__drm_kunit_helper_alloc_drm_device);
>

I'm not sure if I would add a __ prefix to exported symbols, but I see that
this is a convention in the DRM subsystem so I'm OK with it. 

Another thing that came to mind is if we want to use EXPORT_SYMBOL_GPL()
instead for the DRM KUnit helpers. But that's not related to this series.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>  

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

