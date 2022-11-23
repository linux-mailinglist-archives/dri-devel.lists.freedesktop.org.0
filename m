Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297606352D8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B121910E4FC;
	Wed, 23 Nov 2022 08:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8316C10E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669192697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgGa7UlDCV11Rl80syzybm0XgQd8y3FKOB9rcbihqHA=;
 b=VjUwHf1b10+a2ppR4wcSaRh+ibheVE0tvRUJ3k2KrlIWS9dC5bmiUsVhJ8tHxaZT5pXcNc
 kr5DJMcRvBGYZiRYO0I1f04YMdJDrNP4PiwdAcCPJyaMPzSAAj6EwiuBJLxZMEjprJtWOs
 DWZOfmYPjsF6lRItdfR4IxFHNqbbpcM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-gTKJweuHMFeLTLTojwa6TA-1; Wed, 23 Nov 2022 03:38:15 -0500
X-MC-Unique: gTKJweuHMFeLTLTojwa6TA-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso756381wmk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 00:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZgGa7UlDCV11Rl80syzybm0XgQd8y3FKOB9rcbihqHA=;
 b=sR59jkAyjxem9qkO4a2npYEFIdOaJMSCe4E5kAaeXiP3By3HY7+ndB/TFfiuqEFUqp
 88JW9GnHwm6JxyzeSlPlhAjCAe45nLqUACKuI2B56zWA/zXadylzFUlSZ78B19iiRD7+
 mUvVJJhIDsNVxfWECvGGjEMgpezaskAfBe+ajp/sSNPJ2V+M0sJPRHgUDjBGnTrWfTqT
 ZoVNsezAD9ua9oYlo0aoS3uHkjHnsskltiLHAVhPQhbPRST3Rj4DYoEgAV9gU+1BeaGO
 KSwdaH+bWAZF9U4pRwa/I2bEJaQ3Ofa3SLrHr/H4i4vljKbMB5+bVPup5S6wAcBMcEkB
 nbwg==
X-Gm-Message-State: ANoB5pky62lsPlXIHlfc6qhI6uDfTwGa0hceLU6rb/nSM65kTCdPnR4E
 uUssZD/nvsIOTCB9SkU+3paN3nZtMBMsYnMffEHYcC2e5aRn8nAcyh1H36ZBFgPwo7o8ZDrr8Gb
 rz/ELiFQ04z/ds/UEW8UT0y3PCXoA
X-Received: by 2002:a05:600c:4e06:b0:3cf:703e:1d88 with SMTP id
 b6-20020a05600c4e0600b003cf703e1d88mr8081915wmq.155.1669192694798; 
 Wed, 23 Nov 2022 00:38:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7TyiKFU3Mxj3GvlkqPF7wOW2d4YWnT7KlfcUKzg2e2GeuZgXeqBDHL4tyVR7JdYGb8IdosqQ==
X-Received: by 2002:a05:600c:4e06:b0:3cf:703e:1d88 with SMTP id
 b6-20020a05600c4e0600b003cf703e1d88mr8081903wmq.155.1669192694616; 
 Wed, 23 Nov 2022 00:38:14 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c3b8c00b003cfbbd54178sm7325951wms.2.2022.11.23.00.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:38:14 -0800 (PST)
Message-ID: <f13c937a-558d-ac66-c742-6a561d244799@redhat.com>
Date: Wed, 23 Nov 2022 09:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/6] drm/gud: Don't retry a failed framebuffer flush
To: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-3-9de3afa3383e@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221122-gud-shadow-plane-v1-3-9de3afa3383e@tronnes.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/22 21:58, Noralf Trønnes via B4 Submission Endpoint wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> If a framebuffer flush fails the driver will do one retry by requeing the
> worker. Currently the worker is used even for synchronous flushing, but a
> later patch will inline it, so this needs to change. Thinking about how to
> solve this I came to the conclusion that this retry mechanism was a fix
> for a problem that was only in the mind of the developer (me) and not
> something that solved a real problem.
> 
> So let's remove this for now and revisit later should it become necessary.
> gud_add_damage() has now only one caller so it can be inlined.
>

Makes sense.
 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/gud/gud_pipe.c | 48 +++++++-----------------------------------
>  1 file changed, 8 insertions(+), 40 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

