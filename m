Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7BC817AD0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9124F10E3A5;
	Mon, 18 Dec 2023 19:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEE310E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702926982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aE81s+rpsMUIps3Hpsmx+/hY64xiBrpWlJ3caeLyXLg=;
 b=douxQ76Ppi6UfwpmCDQdKw8Ih8a/T7jJcsOMIKA9Zs1ZPkVY/1rZMDhdzZD6t5mWXPjMYR
 dEkL4nXn/LSxc/suMY3fmbsxWuuxquzGGN74OYo4cS/HZokQLWQNdOGzJSdyQX0E7WMVvm
 jfJP97AH8YxvqH4j6VUzdfvZldJaEbU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-DW98PkkkOlO8w3fa3DtXXQ-1; Mon, 18 Dec 2023 03:42:30 -0500
X-MC-Unique: DW98PkkkOlO8w3fa3DtXXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40c1d2b1559so21667745e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 00:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702888950; x=1703493750;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aE81s+rpsMUIps3Hpsmx+/hY64xiBrpWlJ3caeLyXLg=;
 b=v1ZBKw42nf5idpHQlqQH25ezQnOZLqG6libmaRaHyW8pYyflnJn/AC9bZRlZiQoBv/
 OL2mzIiHW7FXKbTtr3GMxk878qu7AtXDK+BQUafS8gzbxW+eB4td1SOoN+K4ACv8DWXS
 2tgOnZj6AeHsAQj+hCHJgAjbDHP7fUhbpght51eOQhvmFqw9MG9cJTxyQwdluzjdn2/X
 7Fnz2nM4q7tiLqR2rhjWRg5LKrjQTasXiRJOTw6vistCxcVtEHXry5WhFw+zawPiIvCa
 6n+vJgHQTDvVqu+yCfYTsjQglhLCcWZYx1DsQVm5Ljx+iga/ZUapiB1jrCbmtyDNUaNq
 FPQA==
X-Gm-Message-State: AOJu0YwZr8tUZ/P7ephSXeIbajKWrCgQLiCzz1ZDNDNZwAz+zEFE6qq2
 zF/PXPH+MSFqCnvex6vmaBZ6AGOarR02hJi/V+7qmdbPuOI8FeRSDxaKoMLArywU/B8D4avMu+n
 5wiRTsbcvohvvafrIKySPeveWbJyz
X-Received: by 2002:a05:600c:480a:b0:40c:5971:615a with SMTP id
 i10-20020a05600c480a00b0040c5971615amr4700441wmo.13.1702888949865; 
 Mon, 18 Dec 2023 00:42:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDbJozhTIyhGKsrROqfZ9kJ86y/4TSXjAJ9EZdeOE+d+zYkSPgYGAJdd9a/HPYX6i0fLLHDw==
X-Received: by 2002:a05:600c:480a:b0:40c:5971:615a with SMTP id
 i10-20020a05600c480a00b0040c5971615amr4700420wmo.13.1702888949543; 
 Mon, 18 Dec 2023 00:42:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b0040d1746f672sm5439115wmq.14.2023.12.18.00.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:42:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
In-Reply-To: <3d1fb191-5ef2-4569-962f-1d727c1499c5@linaro.org>
References: <20231217100741.1943932-1-javierm@redhat.com>
 <20231217100741.1943932-2-javierm@redhat.com>
 <3d1fb191-5ef2-4569-962f-1d727c1499c5@linaro.org>
Date: Mon, 18 Dec 2023 09:42:28 +0100
Message-ID: <871qbjnbpn.fsf@minerva.mail-host-address-is-not-set>
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
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

Hello Krzysztof,

> On 17/12/2023 11:07, Javier Martinez Canillas wrote:
>>> +  - if:
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
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>
> Use 4 spaces for example indentation.
>

Sure, I'll change it in v2.

> Best regards,
> Krzysztof
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

