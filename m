Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C58179C7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAEE10E389;
	Mon, 18 Dec 2023 18:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B15B10E370
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702924308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HuaiH4rqzFFEALDPC43fTJimMBRbpfVpYg9fBcqQC3E=;
 b=HlipYlzk1mpzt4lXz4vl0pF36Xcl/e/hucWkZryaM2LGQi78REqeyx29CGtJDEMgyZHE+a
 9Gpr/K3B+L+JzITO+XC0aVeADwUX4b0p/yaqo0KEuK3+RDjtgZ0+mdLH/Vmxr2dX4RgFHz
 +/i455pbn5kpO9o6uPFiyIPEC+YK4EE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-wJDtwhAbPEGcSZ-xN-m41A-1; Mon, 18 Dec 2023 10:15:16 -0500
X-MC-Unique: wJDtwhAbPEGcSZ-xN-m41A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40c3cea4c19so29120535e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 07:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702912515; x=1703517315;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HuaiH4rqzFFEALDPC43fTJimMBRbpfVpYg9fBcqQC3E=;
 b=SqpI9X0SRuL2HsTWQ9EMI5YQ+hs1HzBOkwALbqDBYrETqOOVFMIvUi5kIThhj5zViT
 4wx5oL/1S/aTFMst9e9wyJ+Hf6YPI62ih4QDJSQmAXJ1YV4XXsGsJdfgXrokBMJDO2KT
 wajt32wMNq2qxuzZGqAxuJ08FXArZDzMMWqZJ7RHXWyhDEjwVW+a70GUU9gdnZ4o1wi7
 EeEht376rjnCkwGeQm0CR2n4PBd2cGYJEjHNy4Qs2XPcFu4zhSjvzdYjzUi7ZrqsJ8MS
 7MESBmjqUHuhKpQKzaqFmdJWzcoUXOV9nxP/yQ6cHkwTs4x6Zg3xJDaD/FIE4dN/OGhp
 BPZw==
X-Gm-Message-State: AOJu0YyapxiLJyV6CbqPT29ttqtY2DxsuUfJMPBIqmCS6979catabVHJ
 eDJ/e0/1iCJvGuJWfn0iGqoYEcwqHvw4tWLy8KyBYY7Sn+RCrPDzt4hCmg3e6x7UW59NUKJtkLz
 60TS5szpN4keV8bYnNZIODCuNK3nd
X-Received: by 2002:a05:600c:3146:b0:40c:3e7c:9e45 with SMTP id
 h6-20020a05600c314600b0040c3e7c9e45mr7221897wmo.179.1702912515185; 
 Mon, 18 Dec 2023 07:15:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH01NYRqs0cLPJmrbSp3Nv2uqyGIyLK81ZTxxjSLq4MH5WQAhaSsNI+INBXpQtGjJJeLQo86Q==
X-Received: by 2002:a05:600c:3146:b0:40c:3e7c:9e45 with SMTP id
 h6-20020a05600c314600b0040c3e7c9e45mr7221888wmo.179.1702912514806; 
 Mon, 18 Dec 2023 07:15:14 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a16-20020adffad0000000b003366fa08c2dsm41371wrs.83.2023.12.18.07.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:15:14 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add SSD133x OLED controllers
In-Reply-To: <20231218-example-envision-b41ca8efa251@spud>
References: <20231218132045.2066576-1-javierm@redhat.com>
 <20231218132045.2066576-2-javierm@redhat.com>
 <20231218-example-envision-b41ca8efa251@spud>
Date: Mon, 18 Dec 2023 16:15:13 +0100
Message-ID: <87plz3leym.fsf@minerva.mail-host-address-is-not-set>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

Hello Conor,

Thanks a lot for your feedback.

> On Mon, Dec 18, 2023 at 02:20:35PM +0100, Javier Martinez Canillas wrote:

[...]

>> +
>> +  - properties:
>> +      width:
>> +        default: 96
>> +      height:
>> +        default: 64
>
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> index 8feee9eef0fd..ffc939c782eb 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> @@ -9,24 +9,24 @@ title: Solomon SSD133x OLED Display Controllers
>  maintainers:
>    - Javier Martinez Canillas <javierm@redhat.com>
>  
> +allOf:
> +  - $ref: solomon,ssd-common.yaml#
> +
>  properties:
>    compatible:
>      enum:
>        - solomon,ssd1331
>  
> +  width:
> +    default: 96
> +
> +  height:
> +    default: 64
> +
>  required:
>    - compatible
>    - reg
>  
> -allOf:
> -  - $ref: solomon,ssd-common.yaml#
> -
> -  - properties:
> -      width:
> -        default: 96
> -      height:
> -        default: 64
> -
>  unevaluatedProperties: false
>  
>  examples:
>
> The properties stuff doesn't need to be in the allOf. Although, I took

Ok.

> the opportunity to look at ssd-common.yaml. How do the height/width here
> differ from the vendor prefixed versions in that file?

Oh! That is an error in the schema that I introduced when adding the
binding for the SSD132x family in commit 2d23e7d6bacb ("dt-bindings:
display: Add SSD132x OLED controllers"), and I just copied it to this
binding as well making the same mistake...

I'll fix that with a preparatory patch to use "solomon,{width,height}"
everywhere in v3 and also include your suggested changes for this patch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

