Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B160581797B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C484310E22C;
	Mon, 18 Dec 2023 18:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BBB10E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702923570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Umdjp5ksoy+JcwUTo/e1T9qvEs+1ox676Cz4ZgwJJjU=;
 b=SMA04V9SZBsXGgw67CanomREYNcg6d27iv+XbS3WvYaUcPPomHOB8PDf8vM3ik/lSPfVCM
 QE5V3wVjlDdWc6efY6dCFSn9c7xyNeiJO0ppRKqykY+ddZtr5R4LE24vsipR6rnbmPX52m
 /zdwGqkoEO7bI4Slv6MqD++ExafEtJc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-cxnNV3SSNzuNAWKB1M9vAA-1; Sun, 17 Dec 2023 16:33:26 -0500
X-MC-Unique: cxnNV3SSNzuNAWKB1M9vAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40c42205ed0so21803915e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 13:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702848806; x=1703453606;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Umdjp5ksoy+JcwUTo/e1T9qvEs+1ox676Cz4ZgwJJjU=;
 b=EOgC0NXxa3TN/6aGPZCuHMEgZ94ooDtsueJl0YudT8JNkuiy/+5NPZshKzyddC+i6a
 GuDh7a1UKsNznN6Vlb+Q1FGCcXN3d7kpvYt7wgePIToj186mNtNl5GHJDVfEIuuIYV+s
 pBUiez+SHaMx0+BpUB3F36Rdit5c1kp1KpESi42ghm568BF9kjworirgjReVl4e3xXHq
 oq0wyseKwfsdEhKLL13KQ6yC5XEqDXCFKp9c2R/bB+zTEAnrhyS2PG1WKkcYPP+7lFi0
 cCkixrIq2JFA8aV9pH3tZH5T74+3SIi2cPx/s9r1O2E1VGBhoJJiTsvB7bn7zP0Ai7Tz
 bhow==
X-Gm-Message-State: AOJu0YyrOLahdN3NVC4jyoxXasPOTjb4Dig+KL7pruV88kULVWBM1euM
 rZpT/hXb+rQFuwqFQ31fG7Xcsmx5e/C0SIjcILOuriK+XV0tErWVpXFzyLkJBoDg37kU9qfJpv4
 jF/1of3OJniYp7uEEynueU6kW5cfT
X-Received: by 2002:a05:600c:3403:b0:401:daf2:2735 with SMTP id
 y3-20020a05600c340300b00401daf22735mr8294565wmp.31.1702848805790; 
 Sun, 17 Dec 2023 13:33:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElsMH/e3AuKVnouRvSQ1+tNGmbnVzX8Ok7/pjwFuDcho/tdFgjioZuOMxwPzVueDgH+cCPnQ==
X-Received: by 2002:a05:600c:3403:b0:401:daf2:2735 with SMTP id
 y3-20020a05600c340300b00401daf22735mr8294553wmp.31.1702848805410; 
 Sun, 17 Dec 2023 13:33:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e12-20020a05600c4e4c00b0040b398f0585sm39872880wmq.9.2023.12.17.13.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 13:33:24 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
In-Reply-To: <20231217-bacteria-amusable-77efb05770a4@spud>
References: <20231217100741.1943932-1-javierm@redhat.com>
 <20231217100741.1943932-2-javierm@redhat.com>
 <20231217-bacteria-amusable-77efb05770a4@spud>
Date: Sun, 17 Dec 2023 22:33:24 +0100
Message-ID: <87fs00ms4b.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

Hello Connor,

> On Sun, Dec 17, 2023 at 11:07:03AM +0100, Javier Martinez Canillas wrote:

[...]

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - solomon,ssd1331
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: solomon,ssd-common.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: solomon,ssd1331
>> +    then:
>> +      properties:
>> +        width:
>> +          default: 96
>> +        height:
>> +          default: 64
>
> Do you envisage a rake of devices that are going to end up in this
> binding? Otherwise, why not unconditionally set the constraints?
>

Because these are only for the default width and height, there can be
panels using the same controller but that have a different resolution.

For example, there are panels using the SSD1306 controller that have
128x32 [0], 64x32 [1] or 128x64 [2] resolutions.

But answering your question, yes I think that more devices for this
SSD133x family are going to be added later. Looking at [3], there is
at least SSD1333 that has a different default resolutions (176x176).

I think that even the SSD135x family could be supported by the same
modsetting pipeline, but I need to get one to figure it out.

[0]: https://es.aliexpress.com/item/1005003648174074.html
[1]: https://www.buydisplay.com/white-0-49-inch-oled-display-64x32-iic-i2c-ssd1306-connector-fpc
[2]: https://es.aliexpress.com/item/1005001582340858.html?gatewayAdapt=glo2esp
[3]: https://www.solomon-systech.com/product-search/?technology=oled-display

> Cheers,
> Conor.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

