Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331914FBF85
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47110E2FA;
	Mon, 11 Apr 2022 14:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2CD10E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649688508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23gHevVrroOIYzFgSputvPyAa/4Ktzn0dvOFX/eCoLE=;
 b=Qgrt3Vw3tS4rEkoeTR5heiMS4f9OVzhIOJD5EdgvhOci6RAq9F0HcBfX/R3Z7ZRn0Bvlxo
 h1s8Uqj6jq6F+wMh4Z7w8DJ/Tu1FQ2YXQIwBE/b3YyvUUCTS8iYifx5RtT+4gBHSI8QkRg
 H/RZedPyFw9OqqbuFEkJtlgkTvfasSE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-hvpRa0SZP_aG-VZmzsS_Sg-1; Mon, 11 Apr 2022 10:48:28 -0400
X-MC-Unique: hvpRa0SZP_aG-VZmzsS_Sg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m3-20020a05600c3b0300b0038e74402cb6so8779096wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 07:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=23gHevVrroOIYzFgSputvPyAa/4Ktzn0dvOFX/eCoLE=;
 b=eU7XdpDN1U5y9+BBHgWf5ZJm0MiLJxZ8vuQeFhDp2g9m3iGZDq3yFuIQvsX34TIZCV
 kdPhxwDuqOmtGNWZMk4822lgR6j4SObUDDjnm19Mjz0LjEl4moIwkfRdw4xj8806BcC7
 W5Yck/xFLJlHtXVr+OYEn8G1SVZ1Vzw/MN0JN7ghSwdIjS6P4Uu8hEsZ1WdqQ82B88Ox
 rbQyxQ+3l09USBIZVNk4iqLkL2WzVoy8rPv/vY27jJzoaBT4UGkLz8ZyXhobQ06NHW+b
 oZnP//gBu3sMEM/vYU/BwjMAVgaY+JoLSEtFIDR8meQRulDLhGi41nwrkqK1SifimkJc
 YEsA==
X-Gm-Message-State: AOAM533f/EYvTHfr/YB8UzVP2GvGogTPGxC5p0qTj+nGN+7XP9lOlqK2
 tQwwNZKMZLr4p2jLNq3XnhD8uuY7mrThUOGY5OZy2Twd1XIDbZDtBi0aMvtfiPbuVcYrmKFvV5c
 pwRJHh0d5FbQSmGkkpAoSKjzF1UcP
X-Received: by 2002:a05:600c:25cd:b0:38e:715e:d9b6 with SMTP id
 13-20020a05600c25cd00b0038e715ed9b6mr29405427wml.63.1649688506632; 
 Mon, 11 Apr 2022 07:48:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxulV+PmBoci9B8dGS1eRwND5+wEOgNayliPAYXAVTwZj2JV3nKrI1I662hg1YD8X6EMDanug==
X-Received: by 2002:a05:600c:25cd:b0:38e:715e:d9b6 with SMTP id
 13-20020a05600c25cd00b0038e715ed9b6mr29405403wml.63.1649688506398; 
 Mon, 11 Apr 2022 07:48:26 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfb781000000b002060d4a8bd9sm22107168wre.17.2022.04.11.07.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 07:48:25 -0700 (PDT)
Message-ID: <a422b984-6d2a-a307-7b4d-a4fec08e87c2@redhat.com>
Date: Mon, 11 Apr 2022 16:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: display: ssd1307fb: Deprecate fbdev
 compatible strings
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-2-javierm@redhat.com>
 <CAMuHMdUGQ6qabs_xD6kQeDruQLG-OX17UEVrgeGu3Eo6C2dEgw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdUGQ6qabs_xD6kQeDruQLG-OX17UEVrgeGu3Eo6C2dEgw@mail.gmail.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 4/11/22 15:47, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Thu, Apr 7, 2022 at 10:03 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The current compatible strings for SSD130x I2C controllers contain an -fb
>> suffix, this seems to indicate that are for a fbdev driver. But the DT is
>> supposed to describe the hardware and not Linux implementation details.
>>
>> Let's deprecate those compatible strings and add a new enum that contains
>> compatible strings that don't have a -fb suffix. These will be matched by
>> the ssd130x-i2c DRM driver.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
>> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> @@ -12,12 +12,24 @@ maintainers:
>>
>>  properties:
>>    compatible:
>> -    enum:
>> -      - sinowealth,sh1106-i2c
>> -      - solomon,ssd1305fb-i2c
>> -      - solomon,ssd1306fb-i2c
>> -      - solomon,ssd1307fb-i2c
>> -      - solomon,ssd1309fb-i2c
>> +    oneOf:
>> +      # Deprecated compatible strings
>> +      - items:
>> +          - enum:
>> +              - solomon,ssd1305fb-i2c
>> +              - solomon,ssd1306fb-i2c
>> +              - solomon,ssd1307fb-i2c
>> +              - solomon,ssd1309fb-i2c
> 
> Please drop the "-i2c" suffixes, too.
> We already have plenty of IIO sensors and audio codecs using the
> same compatible value for spi and i2c, cfr.
> 'git grep compatible -- "*-[si][p2][ic].c"'
>

Yes, I know but was worried about the potential issues that mentioned in a
previous email in this thread. But after the discussion we had over IRC, I
think that is safe to assume that the SPI subsystem won't change how the
modaliases are reported, so there won't be conflict between I2C and SPI.

And if that is ever changed, there's a plan to add the bus type to the data
reported by the modalias uevent so user-space could figure out what to load.

So I'll go ahead with Rob and yours suggestion, and just deprecate the old
ones and drop both the "fb" and "-i2c" part of the compatible strings, to
use the same compatible strings for both the I2C and SPI drivers.

After all, that's the correct way to describe the hardware and not encode
any Linux implementation details in the DT binding.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

