Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5D4F9DA3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 21:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3066A10E2E3;
	Fri,  8 Apr 2022 19:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6EE10E2E3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 19:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649445927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGrov/V4uOu3LT5x6dwFAgilRHaV8cu7rkG7AUn9KTY=;
 b=h5cJ5V2Q8G5FWDMZJr6M2jJ59Jrq8M4UHC+cg3Ftpa4GD/yT08sutXH/Pngr52KwIrtKX1
 OF31gA59XEd62zAu8dDG0OYLuQ4PGfjBw9QpfJH59O7Ovm5lDIg+H8aAvAlBN5rF/PHgaI
 QTXm64b2pX00KkmtQbw8UbILJRplhPc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-TRby55o5MEOZKEp-ATUskQ-1; Fri, 08 Apr 2022 15:25:26 -0400
X-MC-Unique: TRby55o5MEOZKEp-ATUskQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 65-20020adf8147000000b00207982c3692so607543wrm.15
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 12:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=UGrov/V4uOu3LT5x6dwFAgilRHaV8cu7rkG7AUn9KTY=;
 b=OZ93nqfIjPpY9Gmn0PWSiTuJJByXtvWb8Irg3AG5cOg3wm9bDHAp32MGOjacFB6NRP
 wanJBBRver5Ra08Fr2sBKVpbZUpTezN/g1jdqQQsBaCzcxptRjT8swCex4X1ng46V5Xm
 JDP2ZiUNOqHTwcH212UZ66uzUHA3yLgap1sw4Zd2N4bXdzUBOQ6VSamK8dj4aAoqcnfj
 Gox9kAF8lvGpV/GBNOosPJyyQadQbz91XPO6k9r6FccPpc2zxqdHgOTfS2LGISqedZLI
 IvNTccDUIVy56i/Hrnu6IfNi+duvkgs49SXhSGxn9J20q+h3lsG4jd9qqrlB5HlS8exg
 4HJg==
X-Gm-Message-State: AOAM531PPZzkJ6/nelmC2h5a/xVB8gUMRR84Avly0ZR3phhx1/BNTE5J
 oAqE/HaTtPq7nFlIS/UVEUlV9LezONRYk5xY0BX3WPQdZd0LQg0vXG3sRzHDRlSL2cxPmhpRpDv
 UtL4HXYA488mnW5RibZU8FmcsLGC8
X-Received: by 2002:a5d:6a0b:0:b0:207:9e23:8b4b with SMTP id
 m11-20020a5d6a0b000000b002079e238b4bmr45498wru.337.1649445925313; 
 Fri, 08 Apr 2022 12:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtpxhv4RA2iFT06aQJ6jH2+mBKBrcJL3FNdxAkbV0UH3rboulTNyoMaM+1BcHn/wT4wRNyKg==
X-Received: by 2002:a5d:6a0b:0:b0:207:9e23:8b4b with SMTP id
 m11-20020a5d6a0b000000b002079e238b4bmr45485wru.337.1649445925090; 
 Fri, 08 Apr 2022 12:25:25 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe0c7000000b002060e7bbe49sm19704733wri.45.2022.04.08.12.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 12:25:24 -0700 (PDT)
Message-ID: <dfc438ab-29fd-881d-f019-7223cae60e88@redhat.com>
Date: Fri, 8 Apr 2022 21:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: display: ssd1307fb: Deprecate fbdev
 compatible strings
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-2-javierm@redhat.com>
 <YlB9TsbhoQblo1H8@robh.at.kernel.org>
 <ffe5c7d4-d27f-ccb6-932e-e027e1ae14da@redhat.com>
In-Reply-To: <ffe5c7d4-d27f-ccb6-932e-e027e1ae14da@redhat.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/8/22 21:19, Javier Martinez Canillas wrote:

[snip]

>>
>> There's also no reason to put the bus interface into the compatible as 
>> the same compatible will work on different buses. But since you want to 
>> add SPI, just using the 'i2c' one will confuse people. For that reason 
>> you could add 'solomon,ssd1305', etc. for both SPI support and I2C DRM.
> 
> That's not really true. There's a reason to add per bus compatible strings
> at least in Linux. And is that there's no information about the bus types
> in module aliases that are reported to user-space for module auto-loading.
>

Forgot to mention that in this particular case it will work but just because
the SPI subsystem always report a module alias of the form "spi:device" even
for devices that are registered through OF.

So having a single "solomon,ssd1306" would work because for I2C the module
alias will be "of:NoledT(null)Csolomon,ssd1306" and for SPI it will be
"spi:ssd1306".

But if ever the SPI subsystem is fixed to report proper OF module aliases
things will break. And since the DT bindings is an ABI, it's safer to have
"-i2c" and "-spi" compatible strings variants.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

