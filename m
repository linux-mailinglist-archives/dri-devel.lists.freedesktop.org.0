Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B45663DA4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C952910E588;
	Tue, 10 Jan 2023 10:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C6810E588
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=Zxpehn0DRjlvG7JrYxNH/8sgqMEjsy23tWFiN4wAx18M7z33TND0CM7Zu70XqVmUb+Hkv+
 dsbklXUt4JDOmQLyd4DZUopceaahsBjfhZ0B++Zw8yoLOm2qA73Ez/DfdrskdHyz78WDT+
 GterM27mk+UG1i71EJ1cwKySDGq/Zjo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-Ij_KDtSYNsqGRXdKOlFN0w-1; Tue, 10 Jan 2023 05:12:51 -0500
X-MC-Unique: Ij_KDtSYNsqGRXdKOlFN0w-1
Received: by mail-wr1-f72.google.com with SMTP id
 u15-20020adfa18f000000b002b129dc55bfso1844052wru.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=qGB/Sje6QEUjlmLB73lh+GPvlH7bj8Bm+9xwp+fHBR6Mzv3C2HltIlcWMfg8QVvj9M
 qf9ajEKvDkrL6H5DEBSGMRcmad8jdzdYgTQbKHSkgirPZuDZcJ9ExZI7/97LrVT5AIwK
 4GNP2h+v+OVyGD7jvPHLdPejb8M7EohZNEUAOsdCwzg1EEouZEPdCE1oBGVLzlJUPQ4P
 CWOAQCOXS+U5Ee6WowCbpPXLexWfml68Yg7CPHKP3yFL8y7pofA/kGlfjWMrYnm1lboH
 DaEC1wvW5EEPcJFFwzCYGtlAHB8TiXKnAeUFve1KQqZ51kIxkOUZQ1pRcF+5P2N4iAVw
 qjAw==
X-Gm-Message-State: AFqh2kpur61eXGIXaoJ/iRwyb+6t6lezzc0odVNjD2CE/PvGi+KwWlZn
 XgBshGLZ4H58HdKdUsUHCE8TNmq37ksXY9g/mzucEwckAS9adRBFnsLyIPCfc1RZafFiym3mUUZ
 fPR6fe22TfYSbsgEB7547XirtTr40
X-Received: by 2002:a05:6000:1c03:b0:2bb:ed0c:a0d8 with SMTP id
 ba3-20020a0560001c0300b002bbed0ca0d8mr5142077wrb.53.1673345570712; 
 Tue, 10 Jan 2023 02:12:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/5e/whfZNkNjxhGF3SHOyW9iABZBnx4Wufy63eX0Zml438v1A3SA4AofxRL6YDrsAARLP7g==
X-Received: by 2002:a05:6000:1c03:b0:2bb:ed0c:a0d8 with SMTP id
 ba3-20020a0560001c0300b002bbed0ca0d8mr5142067wrb.53.1673345570528; 
 Tue, 10 Jan 2023 02:12:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfe852000000b002426d0a4048sm11083364wrn.49.2023.01.10.02.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:12:50 -0800 (PST)
Message-ID: <415593c5-e603-099f-98b0-7f6919474e73@redhat.com>
Date: Tue, 10 Jan 2023 11:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 043/606] drm/panel: raspberrypi-touchscreen: Convert to
 i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Florian Fainelli <f.fainelli@gmail.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-44-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-44-uwe@kleine-koenig.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 23:36, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

