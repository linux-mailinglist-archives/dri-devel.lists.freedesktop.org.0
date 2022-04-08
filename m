Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542484F9D99
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 21:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6515C10E27E;
	Fri,  8 Apr 2022 19:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A83510E27E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 19:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649445568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fvEhjlM3QZzX1sj1DtKINnNazNEUJ++0aetbtdWVKg=;
 b=h3YwPQ61pEGrif5jUTkO4x2FqVcpNsK4Nkin39Oy77JTTZkii1NyrIlF8gR/7/INtjjniC
 r5qdPfG7d0SFhg0FIL/dv/mpWSNIBfUCXq2zM9Ti2xZmb7OCzPJoFxoh/+DC1wGsksXUjc
 /D2y7aXQ8bJFTwQNqMujhn6MfahmB7E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-xDCMXZUQN9W-4dxV06QQ5g-1; Fri, 08 Apr 2022 15:19:27 -0400
X-MC-Unique: xDCMXZUQN9W-4dxV06QQ5g-1
Received: by mail-wm1-f69.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso1643383wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 12:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0fvEhjlM3QZzX1sj1DtKINnNazNEUJ++0aetbtdWVKg=;
 b=u8a1ELwxxbA/jlYo1QXNFnyf9SH7WPCQScO1FNJ2j7GPqH1cNx7K7TCy7QS/NQW/NE
 NtS96WW4Cvop9UJj47bqBwWa7koDWg+mUTNaBrezFG4pGlCb2mVOokTfakBxO2txwqdh
 QodMrIKwOnaWjrHNUKZ8Es0t3GBHXftH2SODKKEGz+a37pqr5JmHPwOtW/Z+mPmVwX+P
 EVMbe5JXk1OJdUbQR6JaDS+7vEwEk2LMRuE0RI1UCDyoPYhtdSh4Nb4EbeacPO0qeGVp
 1WKwHvLfYmRotshBiIfkqNQiwUaPIx+qkTpjYUr7/lnDDuTzvO5CYrYM1gWjPycHzEVJ
 fBvw==
X-Gm-Message-State: AOAM53348ja1f/h3VNxZUe57C54ICaqVfVapYxaNrYI1uavdSm6WNW0J
 1ti2GEoESUAx/NudzLh2i7ocITXLIwcAyLlsOMjzpjAuh3fvZMRcqnD35dLVadQ4P2HAEg+Cf1x
 wVLsYyM4LrJMGkTLG5p4ciipkphZX
X-Received: by 2002:a1c:f717:0:b0:38e:6bed:2aad with SMTP id
 v23-20020a1cf717000000b0038e6bed2aadmr18373481wmh.45.1649445565779; 
 Fri, 08 Apr 2022 12:19:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTT0GmyN7JrE/yRf+eSHTLh9bVjgwg1JFALb3opklGlOqu4r3MXnbDoHko0BkqNp4p7yOH1g==
X-Received: by 2002:a1c:f717:0:b0:38e:6bed:2aad with SMTP id
 v23-20020a1cf717000000b0038e6bed2aadmr18373474wmh.45.1649445565511; 
 Fri, 08 Apr 2022 12:19:25 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b00203da1fa749sm30024255wry.72.2022.04.08.12.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 12:19:25 -0700 (PDT)
Message-ID: <ffe5c7d4-d27f-ccb6-932e-e027e1ae14da@redhat.com>
Date: Fri, 8 Apr 2022 21:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: display: ssd1307fb: Deprecate fbdev
 compatible strings
To: Rob Herring <robh@kernel.org>
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-2-javierm@redhat.com>
 <YlB9TsbhoQblo1H8@robh.at.kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YlB9TsbhoQblo1H8@robh.at.kernel.org>
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

Hello Rob,

On 4/8/22 20:22, Rob Herring wrote:
> On Thu, Apr 07, 2022 at 10:02:00PM +0200, Javier Martinez Canillas wrote:
>> The current compatible strings for SSD130x I2C controllers contain an -fb
>> suffix, this seems to indicate that are for a fbdev driver. But the DT is
>> supposed to describe the hardware and not Linux implementation details.
> 
> True, but compatible is just an identifier. There's no reason to 
> deprecate unless the binding as a whole needs to be redone.
> 
> I imagine you also want 2 compatibles for 2 drivers. That's saying you 
> should change your firmware to switch drivers. The fact that we have 2 
> drivers for the same h/w is a kernel problem. Don't bring DT into it.
>

No, that's not what I meant. In fact, we currently have two drivers that
match against the same set of compatible strings. These drivers are:

* drivers/video/fbdev/ssd1307fb.c
* drivers/gpu/drm/solomon/ssd130x-i2c.c

what I don't personally like about the current compatible strings is that
the *driver* name was encoded on those, rather than the IC names. So for
instance there's a "solomon,ssd1307fb-i2c" (notice the fb suffix) instead
of just "solomon,ssd1307-i2c" or "solomon,ssd1307".

When I ported the fbdev driver to DRM, I considered using different values
for the compatible strings but decided to just use the same for backward
compatibility.

But now I want to add compatible strings for OLED controllers that use a
SPI interface instead, and I don't really want to add a compatible string
"solomon,ssd1307fb-spi" but just without the "fb".

I want the SPI compatible strings to be consistent with the I2C ones though,
hence the deprecation so new DTS could just use the ones without a "fb".

Now, if you say that I can't do add new ones for I2C, then I will just add
"solomon,ssd1307fb-spi" and similar even though I don't like the "fb" there.

And just to make clear, the DRM driver will continue matching against both
compatible strings, but the fbdev will only match the old "fb" ones.

[snip]

>> +
>> +      # SSD130x I2C controllers
>> +      - items:
>> +          - enum:
>> +              - sinowealth,sh1106-i2c
>> +              - solomon,ssd1305-i2c
>> +              - solomon,ssd1306-i2c
>> +              - solomon,ssd1307-i2c
>> +              - solomon,ssd1309-i2c
> 
> There's also no reason to put the bus interface into the compatible as 
> the same compatible will work on different buses. But since you want to 
> add SPI, just using the 'i2c' one will confuse people. For that reason 
> you could add 'solomon,ssd1305', etc. for both SPI support and I2C DRM.

That's not really true. There's a reason to add per bus compatible strings
at least in Linux. And is that there's no information about the bus types
in module aliases that are reported to user-space for module auto-loading.

For example, 

$ cat /sys/devices/platform/soc/fe804000.i2c/i2c-1/1-003c/modalias 
of:NoledT(null)Csolomon,ssd1306fb-i2c

$ cat /sys/devices/platform/soc/fe804000.i2c/i2c-1/1-003c/uevent 
DRIVER=ssd130x-i2c
OF_NAME=oled
OF_FULLNAME=/soc/i2c@7e804000/oled@3c
OF_COMPATIBLE_0=solomon,ssd1306fb-i2c
OF_COMPATIBLE_N=1
MODALIAS=of:NoledT(null)Csolomon,ssd1306fb-i2c

and

$ modinfo ssd130x-i2c | grep alias
alias:          of:N*T*Csolomon,ssd1309fb-i2cC*
alias:          of:N*T*Csolomon,ssd1309fb-i2c
alias:          of:N*T*Csolomon,ssd1307fb-i2cC*
alias:          of:N*T*Csolomon,ssd1307fb-i2c
alias:          of:N*T*Csolomon,ssd1306fb-i2cC*
alias:          of:N*T*Csolomon,ssd1306fb-i2c
alias:          of:N*T*Csolomon,ssd1305fb-i2cC*
alias:          of:N*T*Csolomon,ssd1305fb-i2c
alias:          of:N*T*Csinowealth,sh1106-i2cC*
alias:          of:N*T*Csinowealth,sh1106-i2c

this module will match against any MODALIAS uevent that has one of the
listed compatible strings in "C" and any node name in "N". But also for
any type "T".

And even if the module alias was more restrictive and say only matched
against 'of:N*Ti2cCsolomon,ssd1307fb-i2c', the type information is not
filled by the bus drivers.

So, if we just had a "solomon,ssd1307" compatible string, then a device
registered through OF could lead to the wrong kernel module to be loaded.

In other words, it's true that having a single compatible strings for all
bus drivers will work for device -> driver matching but may not work for
module auto-loading.

> (You should also support the 'fb-i2c' variant in DRM IMO, but doubtful 
> that I'll review that.)
>

As mentioned above, it does even after adding support for the new strings,
for backward compatibility.
 
> Rob
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

