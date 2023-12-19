Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8F8189EA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 15:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DC410E483;
	Tue, 19 Dec 2023 14:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A364010E2FD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 14:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702996189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJ0fIgJFxprsIyxEkHhdAMJUwfKqBB8ndzukjaekHFY=;
 b=WN3B01W6SJUs4P4ksh8+wVW8jKU7ZRBw9WJ2uwK6ESfH5elwFAR3vAIn++9Rdc+9h0drqx
 MzMkuN01ETjYdmjXslMuCFekNZx8lvc4HE+mn3FXKck0n/NCiIl4I+S2Bfe1YjzzGHwZhv
 Wh7ivL4CQ6q+vTZ/LDKrRWzNJ676OVA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-lzmgKTUROoCu4lxWCIC3eA-1; Tue, 19 Dec 2023 09:29:47 -0500
X-MC-Unique: lzmgKTUROoCu4lxWCIC3eA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40c2c6f0893so34227555e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 06:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702996185; x=1703600985;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FJ0fIgJFxprsIyxEkHhdAMJUwfKqBB8ndzukjaekHFY=;
 b=SBhoDvwWe7ioYjU1rFquMs9/zjk/apJiDzn9oDcZcT+maEY0genzeQ9hwZu4SNmiwk
 PKt8CAwFogeafuqEP+IwqQR21p0bzBj1XEDJ121i+cUQU+F5qxRE6g/Tk/zvfHNTMDNj
 +ruBYbMsDj7uYcONzL7P+exQvS0M0doaUocmYdZADCRBWbI/RweSU6234x2y+ss/JDNb
 mH4c7p2UZm2qVJkLuau34RvDndEkK61bNDvfSCsxBP0A/U+doSDNp0oH410gMqh3oqzX
 CWVddLIalnF94oCKVVThBO+tU8OCBciAWpzwBFQ46qtRK2iy15b7c+lLtv7j1UKemhs9
 oSwg==
X-Gm-Message-State: AOJu0Yz3DtaGcCHymKmAhxJSTFYfO3ohkRHbQZfrl6QJ9PkMd2WyCiCY
 j9FUzcJl7gp1ukKYhvhCqUu4ojTD+Vvjj/q3u+/jqAoHiS55trdi0ozAx0pbMZEvP6fOhhWFOeC
 4BkhnzyxyDu2C4E1JB01vzqSunMlq
X-Received: by 2002:a7b:c388:0:b0:40c:3469:96d1 with SMTP id
 s8-20020a7bc388000000b0040c346996d1mr9196310wmj.162.1702996184743; 
 Tue, 19 Dec 2023 06:29:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA8keZt2+RMeG+32PCDrITixe94PgFwfVoCxcAnFpxFM09R5EooqJSvimnMtjpUTQWIJr13g==
X-Received: by 2002:a7b:c388:0:b0:40c:3469:96d1 with SMTP id
 s8-20020a7bc388000000b0040c346996d1mr9196303wmj.162.1702996184377; 
 Tue, 19 Dec 2023 06:29:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g3-20020a05600c310300b0040c6b2c8fa9sm3083353wmo.41.2023.12.19.06.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 06:29:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
 <conor@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add SSD133x OLED controllers
In-Reply-To: <1fa5f658-fef1-49e0-b1ca-21359a74e409@linaro.org>
References: <20231218132045.2066576-1-javierm@redhat.com>
 <20231218132045.2066576-2-javierm@redhat.com>
 <20231218-example-envision-b41ca8efa251@spud>
 <87il4u5tgm.fsf@minerva.mail-host-address-is-not-set>
 <1fa5f658-fef1-49e0-b1ca-21359a74e409@linaro.org>
Date: Tue, 19 Dec 2023 15:29:43 +0100
Message-ID: <87frzy5kq0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

Hello Krzysztof,

> On 19/12/2023 12:20, Javier Martinez Canillas wrote:

[...]

>>>> +allOf:
>>>> +  - $ref: solomon,ssd-common.yaml#
>>>> +

[...]

>>>  
>>> +  width:
>>> +    default: 96
>>> +
>>> +  height:
>>> +    default: 64
>
> Which also looks wrong on its own. Where is the definition of these

Yes, I already discussed this with Conor and mentioned to him that is a
typo but already fixed it locally and I'm testing with the correct ones.

> properties? IOW, where do they come from?
>

The "solomon,width" and "solomon,height" properties are defined in the
solomon,ssd-common.yaml binding schema file that is referenced.

>>> +
>> 
>> ...but when trying move the default for the "solomon,width" and
>> "solomon,height" to the properties section, make dt_binding_check
>> complains as follows:
>
> Worked for me.
>

Oh, that's good to know. I wonder what's the difference...

> ...
>
>>   DTC_CHK Documentation/devicetree/bindings/display/solomon,ssd133x.example.dtb
>> 
>> The warning goes away if I follow the hints and add a type and description
>> to the properties, i.e:
>
> Hm, I wonder what's different in your case. I assume you run the latest
> dtschema.
>

Not the latest but had a recent one. I've updated it, so I do now :)

$ pip list | grep dtschema
dtschema                      2023.9

$ pip install --upgrade dtschema

$ pip list | grep dtschema
dtschema                      2023.11

[...]

>> But that would duplicate information that is already present in the
>> included solomon,ssd-common.yaml schema. Do you know what is the proper
>> way to do this?
>
> Works for me, so please paste somewhere proper diff so we can compare.
>

With the latest dtschema version it works indeed. Thanks for the pointer!

$ make W=1 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/solomon,ssd133x.yaml 
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTEX    Documentation/devicetree/bindings/display/solomon,ssd133x.example.dts
  DTC_CHK Documentation/devicetree/bindings/display/solomon,ssd133x.example.dtb

> Best regards,
> Krzysztof
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

