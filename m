Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B664D3ADD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 21:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D0F10E3EA;
	Wed,  9 Mar 2022 20:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B8210E3EA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 20:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646856890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbuX/KcuT6SLK06TjipzKmC4j8Z46swn7ffrS8FTipc=;
 b=WjtioXeFx0DGsVNcBks1pcxAt2iA5ou4fb5b1u1wWa0UQjY5JbL+jeq7ksrvNHlvseKAML
 rJEAjplc//Rvrp90cYftvTGouD2EpfvXaKiIb0V2IT4dDceYtP0x1oIxBbZFBlCmdicYHZ
 rlCoH0lhF36F/d6voBtCwtXEfHZ9xpI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-dkXPq2dCPxOeDttXRzPkuQ-1; Wed, 09 Mar 2022 15:14:49 -0500
X-MC-Unique: dkXPq2dCPxOeDttXRzPkuQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so3045489wma.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 12:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IbuX/KcuT6SLK06TjipzKmC4j8Z46swn7ffrS8FTipc=;
 b=PVkOrw4OSVYIOp8wA/dynj5hdOGgFrJ3maRt+Tpoy6sMgXr17vsYDb0eLI82r+b088
 kt2x+QyneZqN3B6XDr1uyHkOD7KYBcibl9jhZpjV3G5OwdKSJzrfaACK0eeeyG2Pm/0y
 /d9zPF693yTnu4YH/BZZpQkuqkS6abGxQBNde1xRVIaCCGgLxxgFOSXnc1X/zHTzHy5M
 X5gKBeLjP3eMBjE14zzvRPT+7WdV3zJSQTOY5uoGps14AfcdNursrIler0aFt4hngT2d
 R/n1pin5kJlzGcHdw9HuhdbAyV6POKnw/kOa2ACpuh6lUpJSAiQkYJamEbzB/UZkFWbt
 1T9w==
X-Gm-Message-State: AOAM5326PxvwMxnCzK9Sa0Pqyn53diQDg84d5+GR3pi2t/RIJ/g28kCU
 UgGwYD41xs9N4t3iyKhBK6wgGosf6C4ZE8hUaBS9C48KWGMMVz7GqEw9jSgMZdJ8KCHf9Mear13
 T5BtlDJ/pcqUD7NhyItKdVI0KIPXd
X-Received: by 2002:a05:600c:508:b0:389:8dfd:7994 with SMTP id
 i8-20020a05600c050800b003898dfd7994mr863595wmc.115.1646856887708; 
 Wed, 09 Mar 2022 12:14:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyepWTtYPUTkB3MsGPzD36ku1cklArD4cEY/LhV7qmnXuX8mjfZUZo8/4jccrD5xCfv5ZW5kg==
X-Received: by 2002:a05:600c:508:b0:389:8dfd:7994 with SMTP id
 i8-20020a05600c050800b003898dfd7994mr863576wmc.115.1646856887407; 
 Wed, 09 Mar 2022 12:14:47 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm2742260wma.2.2022.03.09.12.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:14:28 -0800 (PST)
Message-ID: <8770f564-921e-b4e7-5ca4-ad05c46d2baf@redhat.com>
Date: Wed, 9 Mar 2022 21:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-4-javierm@redhat.com>
 <CAMuHMdUuTAsqpx4=WnosfyjLo-t9ryQPQMaE1OeMBk4Ws9DTpQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdUuTAsqpx4=WnosfyjLo-t9ryQPQMaE1OeMBk4Ws9DTpQ@mail.gmail.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 3/9/22 21:04, Geert Uytterhoeven wrote:

[snip]

>> +
>> +               /* Last page may be partial */
>> +               if (8 * (i + 1) > ssd130x->height)
>> +                       m = ssd130x->height % 8;
>> +               for (j = x; j < x + width; j++) {
>> +                       u8 data = 0;
>> +
>> +                       for (k = 0; k < m; k++) {
>> +                               u8 byte = buf[(8 * i + k) * line_length + j / 8];
> 
> As buf does not point to (0, 0), the above is not correct if rect.x1 !=
> 0 or rect.y1 != 0.  After fixing that, writing more than one text line
> to the console works, but I still see an issue with updates where the
> rectangle size and/or position are not aligned to 8 pixels horizontally.
> Will do more investigation, and send fixes...
>

Right, I believe this is a consequence of introducing shadow buffers at
some point and not adjusting the logic in this function.

Thanks a lot for tracking down the issues and working on fixes for them!
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

