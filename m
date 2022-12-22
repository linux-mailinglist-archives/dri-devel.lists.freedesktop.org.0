Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEC654912
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F44210E128;
	Thu, 22 Dec 2022 23:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF11810E128
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671750263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=Hih653iSzbpfzuZdGo1WAH+bvkjaSJUgYcSXO2nVBuUMBSUK/F3m/W1geWcRm8ffXXR71L
 0951fO4Z/zDOP5YbS1UhQC/xlsFC4qrexBcpOtMGI5y0HW4T+Sd5/unfDFRe3saqONOnWz
 B/7+GgKak6zKqZDYrUMN4On1GrXzx0s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-xP8lwjpfN4uMCaTWk9K5CA-1; Thu, 22 Dec 2022 18:04:22 -0500
X-MC-Unique: xP8lwjpfN4uMCaTWk9K5CA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso2490722wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
 b=eFkbAVUX4RlEkIpJqXrm2jrpc3ElQp93ByzjvydWWg5nBGrX0TfP65TDvm55qJk2QW
 63wtVbsUKxnk3GUq4RTRq6pcio/CzLPHNi2kit+spmTwJzdj0/uwWL3Y7jIk47zP8ynx
 DbYhvUYtlFYKpq96ETvL0xwPQKyF8vTLFj8LGLLEG/qXbsqqf2aUsSem1hiaV8KaqJ/M
 vRynLW/Wno1X70zs2Bm9I7e0ryF9LGpNZJhK1MQoSQQhIV/u8fnWNv/8XzriaEyA6q9z
 e9aw+AkyaQ2cYNVTLt8wsGpKW4LHjLa1Hk52zN2SbqzPni1eZgNpbGB9wH/Ef1oXR33q
 Exog==
X-Gm-Message-State: AFqh2koODPYSiIudOeClwMJKHn/S1THQUcdb3Yum9Jh23A87YEFUc/4r
 OSDs1ddQYqH3Cg4GBKuKGIhumSquehrG4oFzDf9ikDBjC/0mmBvy7HnoENxUpkBZBIL2HYV4494
 QYQyXqpvhVwdhYAw85KAg1QpQPlsm
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr8400344wmk.23.1671750261716; 
 Thu, 22 Dec 2022 15:04:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRpCTqsnPlNZ+CYl+PJ8WJe4hBMc4zpUYGpFfR67OxQ/mL0PszQFuVVcvkMXe0Yey2+OQkhQ==
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr8400338wmk.23.1671750261555; 
 Thu, 22 Dec 2022 15:04:21 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c3ba400b003b49bd61b19sm7757852wms.15.2022.12.22.15.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 15:04:20 -0800 (PST)
Message-ID: <4407048b-0bcb-ad46-4267-079a9c5baa90@redhat.com>
Date: Fri, 23 Dec 2022 00:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 042/606] drm/panel: olimex-lcd-olinuxino: Convert to i2c's
 .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-43-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-43-uwe@kleine-koenig.org>
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
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

