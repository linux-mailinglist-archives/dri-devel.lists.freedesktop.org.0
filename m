Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A64AF1DB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE83510E440;
	Wed,  9 Feb 2022 12:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFDF10E478
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644410275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yv06k0qcIVzfebmQao0F8lU/DvXpAPuqfxT+fivD3r4=;
 b=ZZlWb2bWOJA/YRe6waWsCNKNEeE0XUgDMxeO6QzMqjDa/E9IseV8snOkWI8cR7uGQZFcvP
 MnZAyS9LzOW7JOsDGS71a+zKanbTRmokx4BvGHpdPjX6d937Z8EKeTCN71tZBCOLyxpPBx
 GSvlmkaEAaFWc2B0HD2RaO0I333MbKs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-HQMaLqJXOn-CQN-xVWrQmw-1; Wed, 09 Feb 2022 07:37:54 -0500
X-MC-Unique: HQMaLqJXOn-CQN-xVWrQmw-1
Received: by mail-wr1-f70.google.com with SMTP id
 n18-20020adfc612000000b001e3310ca453so1058517wrg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yv06k0qcIVzfebmQao0F8lU/DvXpAPuqfxT+fivD3r4=;
 b=oey553bTGCwZDObZGwc3R84IKlx7+zyA+oY5n/qH+4XVVn6v4LUJDqftLyz7/yq2jw
 WE3EhPFb42rekworGdpbIyQmTLigmrK40sXL/GQo/lTTGPBEfvCc34tLWcezOMGSxIpP
 5QSVB2epRdtoIgsCPKHd3lYbRoSPSeyyoT3rKFxXWJixFh/CVqHsb2bGTbi6cJ6CTAfC
 2oBxNkcV3raUqKBFwNH2qVgweFkfe0hvty16gD3LeyG0f5fGkGzBb614IvurcsLLrTE9
 E6CVqgONvOwKy55NY+iVpF5tHLFuqAgNEiX9kk+247dBXxYWRtfIq8koDMaa2GqyjC0p
 4w3A==
X-Gm-Message-State: AOAM533uApdK8rLwoN4Dhi6VHycdjMrMyZl0qlZ0fL18mfAEjx37t9ju
 33RI9oKgHVoFM5KDaeZBdK4fwOT7YpJaSLPh5H1pAUjgE7fmqQDeUfFvoUvkPLp2qm1wwT3DOzI
 13yBPeBxA6J1WLzSse6yO8Jo+pOuY
X-Received: by 2002:a05:600c:4fc2:: with SMTP id
 o2mr1884049wmq.145.1644410273533; 
 Wed, 09 Feb 2022 04:37:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmjpeXcKAGK2lwWC20JlgA2fV6RbEkugJVOCgWV8vBNqH8VPABqTYOsxX7qWXxzkqn+qGm5A==
X-Received: by 2002:a05:600c:4fc2:: with SMTP id
 o2mr1884035wmq.145.1644410273273; 
 Wed, 09 Feb 2022 04:37:53 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l28sm14096444wrz.90.2022.02.09.04.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:37:52 -0800 (PST)
Message-ID: <58ebacd2-d44d-c7e9-e752-de7815dd4cc1@redhat.com>
Date: Wed, 9 Feb 2022 13:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/7] drm: Add driver for Solomon SSD130X OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVs750iE=kP1vabwgsGOb8sHc8aC5k=HwCU32CURnYktw@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 2/9/22 13:19, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Wed, Feb 9, 2022 at 10:03 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
>> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
> 
> [...]
> 
>> - Fix a bug when doing partial updates (Geert Uytterhoeven)
> 
> Thanks, the text console is now more or less working as expected.

Thanks for giving it a try to this version too! Glad to know that
is working better now.

> There is still an issue with the cursor, though.
> After doing "echo hello > /dev/tty0", the text appears, but the cursor
> is gone. "clear > /dev/tty0" brings it back.
>

Hmm, I was able to reproduce this too. Thanks for pointing it out,
I'll investigate what the problem is.
 
> The execution time of "time ls" has improved. It now takes 1.21s
> (0.86s with ssd1306fb).
>

Yes, I believe that was due the bug I mentioned that partial updates
weren't done but a full screen update instead.
 
> The logo is not shown, even when I create a 16-color or 224-color
> version of the small monochrome logo I'm using.
>

I'll also dig into this.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

