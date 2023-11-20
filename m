Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01777F1D67
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 20:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1F610E0B8;
	Mon, 20 Nov 2023 19:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BB110E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 19:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700509049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BlYDIXP3w1RwZl506oGiJVMb8cguIu5a7QZETE7Ax68=;
 b=Q/KtpZVtqDO0Ri+wn99KRVbe6gmO3GOLMdYYjbjMueMOlb/+9y+jzghujvsjL8pa37mXC1
 beiXEjQPzgGcHUJ4pRjq1mGbNJvud6jU1nlDcNLZEvuGTKMQZ+qhDa3nNsOGWhr9ObKlVU
 rwdjwXhw8GYTcwWW36yGeo4Z5MbapG4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-UOyYYFpqMzO2fGbH7uKGtQ-1; Mon, 20 Nov 2023 14:37:27 -0500
X-MC-Unique: UOyYYFpqMzO2fGbH7uKGtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40a5290de84so14430655e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 11:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700509046; x=1701113846;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BlYDIXP3w1RwZl506oGiJVMb8cguIu5a7QZETE7Ax68=;
 b=DBS7jWRxLSRhPljoWq/mBFl1Zifakv4Fq7EOvx7xRWhYTTjv56tOwWT19rXTADqwUp
 +wyPphrCYNhNFJCXmPwqRn5UNnZSTPj1awrgoKOcQh71VLoP1oN+wv1pyTkaWRS6GkE0
 Of+4gKj0w4051TIk0z0OBNv0g2I0qmXsKFwRkbGVbMfgJC5kyintadtwXV6MjGzMq5oP
 81Q+oVuLmbWt91ORVci+1Yeg/ZIoK1jfzLSEKpFXRVxiYxdv2OKPzGD2Td+gOtJSi9OK
 5jmI0y8vi6sBuT/9xWT2xPQe/gY3I52v93nYKSZKb85Nugmf6JKdTPYYEo2vEdWnDmSM
 Uh9w==
X-Gm-Message-State: AOJu0YwUlBRGnRzAqFG4il0YfV9WDILKgezL3OvoIMkxP9j/tPBkMayB
 woCbSPAFmMQseXWDouZOfQQ8HelOwIsfL4HKbhZl+3CQ1NE86h7tMKCYxTGuAMPGbKjRpBqFBRs
 /9u68COr2Rrdxv/n3cSJGR+Kqu3ZZ
X-Received: by 2002:a05:6000:1449:b0:32f:79de:8b7f with SMTP id
 v9-20020a056000144900b0032f79de8b7fmr6540613wrx.49.1700509046778; 
 Mon, 20 Nov 2023 11:37:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjy7cAUf+TVSzll5QOp+4fMVTMb5WaOIECh3Za1iXn2WmoxuC6GE30PNx+sjRVl9ZTc2F8vQ==
X-Received: by 2002:a05:6000:1449:b0:32f:79de:8b7f with SMTP id
 v9-20020a056000144900b0032f79de8b7fmr6540600wrx.49.1700509046385; 
 Mon, 20 Nov 2023 11:37:26 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b003316d1a3b05sm10763235wrq.78.2023.11.20.11.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 11:37:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: ssd1307fb: Change
 "solomon,page-offset" default value
In-Reply-To: <20231120-granola-sturdy-83d054f1b6fa@spud>
References: <20231116180743.2763021-1-javierm@redhat.com>
 <20231120-granola-sturdy-83d054f1b6fa@spud>
Date: Mon, 20 Nov 2023 20:37:25 +0100
Message-ID: <875y1w2p3e.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sahaj Sarup <sahaj.sarup@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

Hello Connor,

> On Thu, Nov 16, 2023 at 07:07:37PM +0100, Javier Martinez Canillas wrote:
>> This is used to specify the page start address offset of the display RAM.
>> 
>> The value is used as offset when setting the page start address with the
>> SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
>> 1 if the property is not present in the Device Tree.
>> 
>> But the datasheet mentions that the value on reset for the page start is a
>> 0, so it makes more sense to also have 0 as the default value for the page
>> offset if the property is not present.
>> 
>> In fact, using a default value of 1 leads to the display not working when
>> the fbdev is attached to the framebuffer console.
>> 
>> Reported-by: Sahaj Sarup <sahaj.sarup@linaro.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>> 
>>  .../devicetree/bindings/display/solomon,ssd1307fb.yaml          | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> index 3afbb52d1b7f..badd81459aaa 100644
>> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> @@ -35,7 +35,7 @@ properties:
>>  
>>    solomon,page-offset:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    default: 1
>> +    default: 0
>
> I think I saw it pointed out by Maxime elsewhere that this breaks the
> ABI. It would be nice if DT defaults matched the hardware's, but I don't
> really think it is worth breaking the ABI here. Expanding the property


Yes, Maxime also agrees with you as you mentioned. It's fair to say that
this may affect potential users even when I honestly think that's unlikely.

I'll just discard these patches and point out to people reporting the same
problem than Sahaj, that they need to add a "solomon,page-offset" property.

> description to explain the impact of the particular values might help
> with incorrect usage.
>

I'm unsure how much that would help to be honest but I might post a patch.

> Thanks,
> Conor.
>
 
-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

