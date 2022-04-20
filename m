Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FEB508D62
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 18:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62510E25A;
	Wed, 20 Apr 2022 16:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2640610E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650472389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQi4xpiIAYwU9OKYp0XYlU7Icz7XCZVMarc/hg4eCFA=;
 b=W64g1GAi3GsFaTZ2ockwTGM18ImKoGgBvY8aBMKZ1f1tr4zPd+qqk+Lun1KuAqmPj6woDH
 gkWhlr/BUedN7E+fki67pKTNj1irxZy4ZdyJmmjC3JxPUBhgbuwuQuOrMieKjZt1H2FnYm
 kvP1JAKv+ZPAL2GdUtD/P+kN9E/ZgPo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-RQ_yU_s2MvS6TgZ24jLBpg-1; Wed, 20 Apr 2022 12:27:44 -0400
X-MC-Unique: RQ_yU_s2MvS6TgZ24jLBpg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j30-20020adfb31e000000b0020a9043abd7so547340wrd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 09:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uQi4xpiIAYwU9OKYp0XYlU7Icz7XCZVMarc/hg4eCFA=;
 b=ly/ov4oxOBaHY4JKw5D9nb8pRm90VrGXz3921ZnOom+Ntegen90Wwej1EIHcPdifme
 nGaqEmr5digaIiG4hHgYbk6w1Hz6HUwo96Z0XiBjcRJcdvSrqFdOjIlUEaI5dutTMPrK
 g/i9mYu93Y0gPTVCCUUllvfsHvlzugCgzj5K+DAu2zM3MzWYfL5c7WjTp/TyxnXb7Ik7
 XzuxWypJb1WXngpGnS6+EWhMv0B1Vm/0BZK68NHVDvNVtCbi4WfLxZzT1sxnOYRltc7E
 w+WXuLlQ4E9t/0Db2EhIV6MMyRAjKeQBhgsC2c/IgDKyCHSFy5MUp3XJTWJV9jsCfyjM
 dSXg==
X-Gm-Message-State: AOAM533NcG28Ur4Pf7BL9zv3sCvjZTFcCP4tpQzw/VrN99Qs/nf6vuKG
 CDxW84uIz+8JUYgdbdMm71cybw1SC6CLNJQp0oZEdE6jT2KveMXBw27q2rEwFAkIK0gIZ5M9HMJ
 VbxvBQ6VugUWXlcCzIBdKIb4Sx06+
X-Received: by 2002:a05:600c:3b28:b0:38e:bb86:d68d with SMTP id
 m40-20020a05600c3b2800b0038ebb86d68dmr4483039wms.135.1650472061263; 
 Wed, 20 Apr 2022 09:27:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynjWWcQttb+aziN8pHptfqs3yGHSuwUSQnhkK4weL+KdnsI1r5xgng775oUvCczEZjZL9Qqg==
X-Received: by 2002:a05:600c:3b28:b0:38e:bb86:d68d with SMTP id
 m40-20020a05600c3b2800b0038ebb86d68dmr4483014wms.135.1650472061059; 
 Wed, 20 Apr 2022 09:27:41 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d588c000000b0020a9e80d2b1sm315363wrf.107.2022.04.20.09.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 09:27:40 -0700 (PDT)
Message-ID: <47105042-bd53-98b2-e3e2-0141fb6561f8@redhat.com>
Date: Wed, 20 Apr 2022 18:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
To: Rob Herring <robh@kernel.org>
References: <20220419214824.335075-1-javierm@redhat.com>
 <20220419214824.335075-2-javierm@redhat.com>
 <YmAxqNb7nKlypkqD@robh.at.kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YmAxqNb7nKlypkqD@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob,

On 4/20/22 18:15, Rob Herring wrote:
> On Tue, 19 Apr 2022 23:48:19 +0200, Javier Martinez Canillas wrote:
>> The current compatible strings for SSD130x I2C controllers contain both an
>> "fb" and "-i2c" suffixes. It seems to indicate that are for a fbdev driver
>> and also that are for devices that can be accessed over an I2C bus.
>>
>> But a DT is supposed to describe the hardware and not Linux implementation
>> details. So let's deprecate those compatible strings and add new ones that
>> only contain the vendor and device name, without any of these suffixes.
>>
>> These will just describe the device and can be matched by both I2C and SPI
>> DRM drivers. The required properties should still be enforced for old ones.
>>
>> While being there, just drop the "sinowealth,sh1106-i2c" compatible string
>> since that was never present in a released Linux version.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Mark Brown <broonie@kernel.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>
>> (no changes since v3)
>>
>> Changes in v3:
>> - Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)
>> - Continue enforcing required properties for deprecated strings (Maxime Ripard)
>>
>> Changes in v2:
>> - Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven)
>>
>>  .../bindings/display/solomon,ssd1307fb.yaml   | 44 +++++++++++++------
>>  1 file changed, 31 insertions(+), 13 deletions(-)
>>
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

I meant to add your Acked-by but just forget before posting. Sorry about that.

I'll add it myself before pushing.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

