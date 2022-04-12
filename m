Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FDB4FE0C5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 14:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8E710EA00;
	Tue, 12 Apr 2022 12:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D8E10E9D7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649767733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sDaKWcAgM2XIl9bdUk6bun++oBfH1mVBruEjkqdxaY=;
 b=ipGMV5hSB8jh9OpyTwjlW9jWGMI27rDRqiJUh/vM3OtILyrCeuBxSTmSZhkDIt1Qkp9Z3e
 4D79P4FJWJq38lJtGzMLtYdmQsUwyJuWrV8kjSpW/ITQgNKx5/FbM3jyfs9WmWODCBlWen
 HLeeQ2PmE9cDDseX7pcVueqIUo/qI+s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-kaA_RumEPgOHQQ81cvYZ2g-1; Tue, 12 Apr 2022 08:48:52 -0400
X-MC-Unique: kaA_RumEPgOHQQ81cvYZ2g-1
Received: by mail-wm1-f69.google.com with SMTP id
 j6-20020a05600c1c0600b0038e7d07ebcaso5930545wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 05:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7sDaKWcAgM2XIl9bdUk6bun++oBfH1mVBruEjkqdxaY=;
 b=g1+IYxxcRYBhNGFx3Mi2k+Kn+7pqbTwwqK7PUMTtmPCMemMYgDwWIb063Tm3o/5d/R
 US0qgHEEuq2xuDosrn617wa2wrqtTumlJOfJ4eD6fI28iRTJ8MIhwiC1H3rGSQWzXi97
 0uSe00mOnTBfiPVSStKcL5bNqXokjNkwQb0RsH2/Fam3+eC7D0zIG9PlyQOqZk2QkC7m
 ZIaz4TyS25Z1/co3z2Uq1WVnH1vQ1q3Ui/pdYqS+WNJdrulwupa6jmofoXZQMB5pPhR7
 RsxCKkJosBoRHrsaWnQZlTDKFdLiM9rg6Y28ksYVUwl2qQQS6OurBuOxaalsVMEKy6Es
 jgng==
X-Gm-Message-State: AOAM532mS2w9YvmwYfgbEi1CsPycGzFE33KOevsjkKZPNo9zd82s1vXW
 B13BLDjEMbu6ur9bRt0lu1WEBYUUn6TCygKb+QW4Bf7pIQnmlG+pNN3LjNXJ57XLGLjp3lyjVoH
 K/MW5wMYTP5IDjnoNp8acVqX3aFOm
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr29127158wrn.231.1649767731312; 
 Tue, 12 Apr 2022 05:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5+Ddw+bigt24MEWgaP362cD4jvNRoenFXKs2B/0FJXlJzyo/PVEoLpDt5RoNn56qZNIA2XA==
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr29127143wrn.231.1649767731066; 
 Tue, 12 Apr 2022 05:48:51 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adfd1c1000000b002058537af75sm30602485wrd.104.2022.04.12.05.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:48:50 -0700 (PDT)
Message-ID: <d25cfc04-8ee5-ea6d-a353-6b0ac1fd58be@redhat.com>
Date: Tue, 12 Apr 2022 14:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
To: Maxime Ripard <maxime@cerno.tech>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-2-javierm@redhat.com>
 <20220412112855.uccrkoqgjim2dbts@houat>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220412112855.uccrkoqgjim2dbts@houat>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 4/12/22 13:28, Maxime Ripard wrote:
> On Mon, Apr 11, 2022 at 11:12:39PM +0200, Javier Martinez Canillas wrote:

[snip]

>>  
>>    reg:
>>      maxItems: 1
>> @@ -136,7 +147,7 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: sinowealth,sh1106-i2c
>> +            const: sinowealth,sh1106
> 
> I think we should have both in the condition here, but it looks good
> otherwise.
>

Right, we want to keep enforcing for the deprecated compatible strings.
 
> Maxime
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

