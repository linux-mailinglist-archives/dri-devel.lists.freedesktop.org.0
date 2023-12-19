Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C448681863C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 12:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B503210E092;
	Tue, 19 Dec 2023 11:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDB410E092
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702984864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vrHI+C/8N+6WMywKa2Mtsu2yooelBSjntgs3OJkiMbU=;
 b=FbsilIYeF3RsncUdVN7rQ3di0eQk8hVAJJDzNv7MySQyfdMY7QEVxBDkgzoWsa8ms0f5X3
 ukmM1GdDKN8y9K3ad5uKVYezC6cBpJL1mebK3+NMwifRXWRvrZx0aMlZglTtmULSHA+1gl
 ckkpQdbNTknDle359NwcyH4a7Z8pHfM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-c3Ikp-UGN1iRCRl8UH6ZhA-1; Tue, 19 Dec 2023 06:21:00 -0500
X-MC-Unique: c3Ikp-UGN1iRCRl8UH6ZhA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33676de86b9so9313f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 03:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702984859; x=1703589659;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vrHI+C/8N+6WMywKa2Mtsu2yooelBSjntgs3OJkiMbU=;
 b=p5WdgRl+mcd7oaVeaask1oQGqEsIZ6bNZzfSquhIeVJgHE/0nUjYEJSIbioRMJwenm
 T8hJ728ox4PcpDl4kwneSfRNLPOSK5EMhD+CVt70s2LuUVNsHv0deXDuVn3O50JnuzOq
 gsdQB6imMAY1Yq/r/7cUH+DOc1vI1/ilU9/5XfRfdZ4NmWMSrWuPondDYKOyEZaTBnAS
 cM7sNCy87adeNQ3tdBgLVLyH1rBeFICcYF70cnC3+EaufKSn/bskIRBqbI1TiTY/COeF
 L1vtnvISnDGCFeAR0ncvsUlCobjuZAHPppjykFj0kwBfnGf+ycMTV/iJG5/s06jR1Uf3
 586g==
X-Gm-Message-State: AOJu0Yzbj6In69cbIjkLA0rsqWKLRXc8utKTtlChNsuQJy/Cz0hiX3Wc
 JRe4uu2xwrkEYJnvwVOXugRBB7RibQ6HaAo20u8YYeetVyNES8r+pjTJ+bqa9cQYb/V6dc0Gi7u
 HFc+Z9zmwR+gVwo3lbGteRVL9PQ0y
X-Received: by 2002:a5d:4d05:0:b0:336:58fb:f458 with SMTP id
 z5-20020a5d4d05000000b0033658fbf458mr2986536wrt.36.1702984858887; 
 Tue, 19 Dec 2023 03:20:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm9OABKgWalersq3dWUQ+/G4ZU/EwjszYlINMkbd4HSl17b3TLGC/tl0msGG4gFGtypoj4iA==
X-Received: by 2002:a5d:4d05:0:b0:336:58fb:f458 with SMTP id
 z5-20020a5d4d05000000b0033658fbf458mr2986525wrt.36.1702984858527; 
 Tue, 19 Dec 2023 03:20:58 -0800 (PST)
Received: from localhost (127.red-79-152-77.dynamicip.rima-tde.net.
 [79.152.77.127]) by smtp.gmail.com with ESMTPSA id
 h15-20020a5d504f000000b00336566b885csm11182577wrt.87.2023.12.19.03.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 03:20:58 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add SSD133x OLED controllers
In-Reply-To: <20231218-example-envision-b41ca8efa251@spud>
References: <20231218132045.2066576-1-javierm@redhat.com>
 <20231218132045.2066576-2-javierm@redhat.com>
 <20231218-example-envision-b41ca8efa251@spud>
Date: Tue, 19 Dec 2023 12:20:57 +0100
Message-ID: <87il4u5tgm.fsf@minerva.mail-host-address-is-not-set>
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
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

Hello Conor,

> On Mon, Dec 18, 2023 at 02:20:35PM +0100, Javier Martinez Canillas wrote:

[...]

>> +allOf:
>> +  - $ref: solomon,ssd-common.yaml#
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

This part worked correctly...

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

...but when trying move the default for the "solomon,width" and
"solomon,height" to the properties section, make dt_binding_check
complains as follows:

  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
/home/javier/devel/linux/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml: properties:solomon,height: 'oneOf' conditional failed, one must be fixed:
        'type' is a required property
                hint: A vendor boolean property can use "type: boolean"
        'description' is a required property
                hint: A vendor boolean property can use "type: boolean"
        Additional properties are not allowed ('default' was unexpected)
                hint: A vendor boolean property can use "type: boolean"
        /home/javier/devel/linux/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml: properties:solomon,height: 'oneOf' conditional failed, one must be fixed:
                'enum' is a required property
                'const' is a required property
                hint: A vendor string property with exact values has an implicit type
                from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
        /home/javier/devel/linux/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml: properties:solomon,height: 'oneOf' conditional failed, one must be fixed:
                '$ref' is a required property
                'allOf' is a required property
                hint: A vendor property needs a $ref to types.yaml
                from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
        hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
        from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/home/javier/devel/linux/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml: properties:solomon,width: 'oneOf' conditional failed, one must be fixed:
        'type' is a required property
                hint: A vendor boolean property can use "type: boolean"
        'description' is a required property
                hint: A vendor boolean property can use "type: boolean"
        Additional properties are not allowed ('default' was unexpected)
                hint: A vendor boolean property can use "type: boolean"
        /home/javier/devel/linux/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml: properties:solomon,width: 'oneOf' conditional failed, one must be fixed:
                'enum' is a required property
                'const' is a required property
                hint: A vendor string property with exact values has an implicit type
                from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
        /home/javier/devel/linux/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml: properties:solomon,width: 'oneOf' conditional failed, one must be fixed:
                '$ref' is a required property
                'allOf' is a required property
                hint: A vendor property needs a $ref to types.yaml
                from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
        hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
        from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTEX    Documentation/devicetree/bindings/display/solomon,ssd133x.example.dts
/home/javier/.local/bin/dt-extract-example:75: SyntaxWarning: invalid escape sequence '\s'
  root_node = re.search('/\s*{', ex)
/home/javier/.local/bin/dt-extract-example:79: SyntaxWarning: invalid escape sequence '\s'
  int_val = re.search('\sinterrupts\s*=\s*<([0-9a-zA-Z |()_]+)>', ex).group(1)
  DTC_CHK Documentation/devicetree/bindings/display/solomon,ssd133x.example.dtb

The warning goes away if I follow the hints and add a type and description
to the properties, i.e:

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
index 880c71fdec68..0f4d9ca7456b 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
@@ -17,6 +17,20 @@ properties:
     enum:
       - solomon,ssd1331
 
+  solomon,width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
+    default: 96
+
+  solomon,height:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Height in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
+    default: 64
+
 required:
   - compatible
   - reg

But that would duplicate information that is already present in the
included solomon,ssd-common.yaml schema. Do you know what is the proper
way to do this?

Or maybe should I just drop the default values for the width and height
properties? I just think that is good information to have in the schema.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

