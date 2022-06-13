Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4F3549A40
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85B210F444;
	Mon, 13 Jun 2022 17:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E2610F444
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655142090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9imHR0PldrK/4QqffqMQG4YlpeKi0rN5tf1tCAqvxI=;
 b=OfLxLKMmXh1S0JEAwuW9kESxX/WmvV01sGlNpabaDxngbFrcIEHSG/5Fkm581Wd2AvJodx
 IQVrUHuwGIKNdBkaL7D8xdVWIAU2Hq3X5lUoWk55A2iwasA5NQz3M4jTNc1hKEoqJopw8A
 xF1Ia0qB9fKRr0O0qyctqVGEdnh8MNc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-GI6j4ijjMaSh1Ts5Hbv5BQ-1; Mon, 13 Jun 2022 13:41:29 -0400
X-MC-Unique: GI6j4ijjMaSh1Ts5Hbv5BQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so3537975wmq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q9imHR0PldrK/4QqffqMQG4YlpeKi0rN5tf1tCAqvxI=;
 b=Qh9K/xEnCsX3BYRu3h4Gq1nPCV8yKF6T5xjYEbhjIySUsovhPolbbpAHWLpcjgIJPV
 Frp2yXaAxDtIqJ47mE3pFfHElvuapnw43sK+y++6EYqk5ezXT7XgNAtH2OMMujnoGsPh
 ght81P5PJR8G0JWzf/JvXqsmP0j6qUIcWGQ05pbh0aomxc7tRYRkz7kQ6B7l4Fx9JAFq
 4Kkvlq/9SAtGqKhJG0+bnY9JxKgXFx9+W0YI+9cLKjOZ7/GCWA35CQtF9egr8RhyE0u/
 OuVwb4isXAWgKGR1s3miLH1ok//9wFyrXFwlVm0z2NneBd932bAcg4uFlIuQSxGy81J5
 NnTA==
X-Gm-Message-State: AOAM531f29aRLdQbRICRyH4DhVf3gibsWuzfUgtj5pmnIji9Vsljp2ws
 D29WExg2yNMTq0PSUw5noAHVQ8iXRhDQAHIVJ5bU8ldxVWov7+QRNDxZYxk+97dHsPUnziYBY75
 0+EN9fkbnJ/d43k9d6DYzj3WOg77g
X-Received: by 2002:a7b:c389:0:b0:39c:49fe:25df with SMTP id
 s9-20020a7bc389000000b0039c49fe25dfmr648457wmj.164.1655142087968; 
 Mon, 13 Jun 2022 10:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOHYbSdU3QvmmoWgh9ozEuOjCqKEtc/UugRXjsMVcbeHCAdcofLjg4QDbLTxfNrnseTW/13Q==
X-Received: by 2002:a7b:c389:0:b0:39c:49fe:25df with SMTP id
 s9-20020a7bc389000000b0039c49fe25dfmr648438wmj.164.1655142087759; 
 Mon, 13 Jun 2022 10:41:27 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600010cc00b0020c5253d90asm9201616wrx.86.2022.06.13.10.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 10:41:27 -0700 (PDT)
Message-ID: <8cbfcc29-bc31-9bc8-2eaa-d873f7cf2d5f@redhat.com>
Date: Mon, 13 Jun 2022 19:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Dominik Kierner <dkierner@dh-electronics.com>
References: <7a78d57342754a5d9bd3ce7c7bf3fa47@dh-electronics.com>
 <YqdZN6mtEDF2CRtS@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YqdZN6mtEDF2CRtS@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "noralf@tronnes.org" <noralf@tronnes.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/13/22 17:35, andriy.shevchenko@linux.intel.com wrote:
> On Mon, Jun 13, 2022 at 11:39:30AM +0000, Dominik Kierner wrote:
>> On 5/25/2022 21:46, Javier Martinez Canillas wrote:
> 
> ...
> 
>>> Thanks, I looked at the code briefly and think that there are things there that we
>>> could use. I.e the 3-wire SPI support that's in panel-solomon-ssd130x-spi-3wire.c.
>>
>> When writing my driver code, I wasn't even considering using regmaps,
>> like You did in Your I2C-Code. If that's applicable for 3-wire-SPI,
>> it would likely be the better, more generic option. Your SPI-code
>> reuses these parts to some extent. For that case,
>> ssd130x_spi_regmap_config.reg_bits would need be changed to 1,
>> as the "register address" has a length of 1 bit and we are sending
>> 9 bits over the line and not 16.
>> Since we still have 2 bytes of host memory,
>> it should still be compatible with the 4-wire write, right?
>> Or would 3-wire SPI require a second regmap?
> 
> I believe the cleanest solution is to have different regmap configurations.
> 

I agree with this.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

