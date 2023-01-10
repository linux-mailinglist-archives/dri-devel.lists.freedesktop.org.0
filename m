Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E36663D9C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5216C10E582;
	Tue, 10 Jan 2023 10:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE6A10E588
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=Gk5fqV8JeRgtGxjIyaH7sJ0C8iCh82FyogHhdTizqL7QFRL4/VoyskWdZxuUDI5Li31OQe
 Wy2GrWx6ftM6m+DJua44Lb6UE3qZdMIGTuPpJKH2u7HyLw4wdlRLxen1kvBQITKoPrWY4G
 wNwcD07OjY/GvCRnUxQrkPKr8zC5J+A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-Zaag9Zj6OBade9JvY64_sg-1; Tue, 10 Jan 2023 05:11:51 -0500
X-MC-Unique: Zaag9Zj6OBade9JvY64_sg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r10-20020adfa14a000000b0025ba73dff40so1839322wrr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
 b=hgla4xqqz7Vw5ozPU74QcvZ1pnUiPPNQus3Jq+K0XxQsaLuI0j9NRNvOXoSxXRk2Mm
 hpO4rl/MkYxnT1aycrmTdA1WQPQUlo3B9EQkdeGE9kcGjbGBx1LltT7Rnq8ds+mKWcdG
 Mg7i2aMFsQ32FujfSf74GUtx9whLiBSN8iY7DivaOj2AWKwNqSY9LDUPubrY+dpc4xIV
 h+mMp6yTNAW09LuNY1dHtgej/2ZzdItf0c58MRcX07Zqr6e8nfL8qg4FpriBH01ck5VS
 lHkqIbdTJWMPUXkd5IJaf9bZTqqbEFVdOzMMECum0DOslF6zB+XT8lBDlnH7KBjHbuVl
 4GvQ==
X-Gm-Message-State: AFqh2kpuUO1adujeKzb/b9QA+F20JumYwLW4tl0jkm1b4+ZEuHERHzFU
 OFtXCuuxk+lgfNnGSHsehesJcQsIlB3BSxDam14Fj9WNJa5xp/h8U+qmPJ+nbBX0NmF2WE6Jz/P
 mCYjCT0/lk/V7j/9EqPiGQ+LoU3q3
X-Received: by 2002:a05:6000:1207:b0:2bb:d412:9866 with SMTP id
 e7-20020a056000120700b002bbd4129866mr7103308wrx.25.1673345510543; 
 Tue, 10 Jan 2023 02:11:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtfFFHhzmCucFrCTK/XNlXR0dhKPkmzqLJkR6YXyfiB0YU/92FR0QQnnJ2aakpIWDe4m/HZmQ==
X-Received: by 2002:a05:6000:1207:b0:2bb:d412:9866 with SMTP id
 e7-20020a056000120700b002bbd4129866mr7103292wrx.25.1673345510382; 
 Tue, 10 Jan 2023 02:11:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b002b8fe58d6desm10831321wrj.62.2023.01.10.02.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:11:49 -0800 (PST)
Message-ID: <d30afd16-950a-7f2a-9ee9-31a0f3493ed1@redhat.com>
Date: Tue, 10 Jan 2023 11:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 041/606] drm/i2c/tda998x: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-42-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-42-uwe@kleine-koenig.org>
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
Cc: kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org
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

