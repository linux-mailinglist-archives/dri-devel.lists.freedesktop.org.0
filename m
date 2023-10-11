Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBF7C4AC4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 08:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751AA10E467;
	Wed, 11 Oct 2023 06:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02D010E467
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 06:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697006344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2AQICOphbR/iChM23xva2V4U+VZ5WTSVXUiRAK42TaU=;
 b=P3YpTGs54C/FVG/c3UEdcQWA+zzZNDNLjrqfcThgTJxWP8cnDrDe4siIviab3u0Vz/584Y
 0sX4bbh4tvr1/q0/xi3GM+5tFhMLGLiPIMno6JNjcR8AuMb3eqdndO5kT9vyc48jyPmMdu
 dD8eeeycgVO3FBgV0nYLLMpiEcncGiE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-SHDEa3gENWuPmG3j84usBg-1; Wed, 11 Oct 2023 02:39:03 -0400
X-MC-Unique: SHDEa3gENWuPmG3j84usBg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32320b9d671so4670413f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 23:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697006341; x=1697611141;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2AQICOphbR/iChM23xva2V4U+VZ5WTSVXUiRAK42TaU=;
 b=fmAF2NEUi+R8AFkWPpxSZXCUFcaFY/HpyY2SiEqzFF24xcavvWxsx0XGC1xCNEWOAW
 +zp3ZNsK1FlXsFHL1srUNw/98kces5KpIIqjgozs+EYeW6U5Xm0q3Sx64zHp7d6+zQs4
 bQLv38BbsR3n8E8FZ5ej4J1WEhcg9+se4tJ6OZrZy0f5XyHmy4EvaM2khUuqewzUqX+W
 aZz69qRe7q92JfVdPCK/zrugYzigtyMVbd4+DOXhgIdXFsQ8nFFeaWDstH/ZwqVSgGTm
 vJvpSX7gQAuf+CB1PgFFsojj1N4z1WOx0s8YUT1I6NdJ2QxYVPzZsK1G6xHytxDDVosL
 EYsA==
X-Gm-Message-State: AOJu0Yz7tUukLRYdciL6ZpVwLcVYMhPkMhPhYRquk7GdWIt1l8uw2C1q
 J8SUbxGxezGPu1kGwUDVxuOeOM+A1ToofN0aSVnL8+cuHTgE28MeFtoBWk800cbx6YY2PbX4fZn
 jE3CYZZuG3ZiW/TAyHXRnH0EzI7jKaBX6jHQX
X-Received: by 2002:adf:fc09:0:b0:31c:7ada:5e05 with SMTP id
 i9-20020adffc09000000b0031c7ada5e05mr15801539wrr.51.1697006341653; 
 Tue, 10 Oct 2023 23:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP8vt8qsdEsiFmwa873YPkNT/MZf/VyaBdGjVbnmKBvLnf6NE1iPBeouliki4SV7iFb1ottA==
X-Received: by 2002:adf:fc09:0:b0:31c:7ada:5e05 with SMTP id
 i9-20020adffc09000000b0031c7ada5e05mr15801526wrr.51.1697006341282; 
 Tue, 10 Oct 2023 23:39:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n9-20020adff089000000b0031ad2f9269dsm14433335wro.40.2023.10.10.23.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 23:39:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 8/8] dt-bindings: display: Add SSD132x OLED controllers
In-Reply-To: <20231010165838.GA1039918-robh@kernel.org>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-9-javierm@redhat.com>
 <20231010165838.GA1039918-robh@kernel.org>
Date: Wed, 11 Oct 2023 08:39:00 +0200
Message-ID: <87v8bdslx7.fsf@minerva.mail-host-address-is-not-set>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

Hello Rob,

Thanks a lot for your feedback.

> On Mon, Oct 09, 2023 at 08:34:22PM +0200, Javier Martinez Canillas wrote:
>> Add a Device Tree binding schema for the OLED panels based on the Solomon
>> SSD132x family of controllers.
>
> Looks like the same binding as solomon,ssd1307fb.yaml. Why a different 
> binding? Why does that binding need a slew of custom properties and here 
> you don't?
>

It's a sub-set of it. Because only the minimum required properties are
defined. But also, is a clean slate schema because the old ssd1307fb fbdev
driver only supports the Solomon SSD130x family, so there is no need to
follow the existing solomon,ssd1307fb.yaml nor the need for backward compat.

[...]

>> +  solomon,height:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Height in pixel of the screen driven by the controller.
>> +      The default value is controller-dependent.
>> +
>> +  solomon,width:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Width in pixel of the screen driven by the controller.
>> +      The default value is controller-dependent.
>
> Don't define the same properties twice. Either share the binding or 
> split out the common properties into their own schema file.
>

Agreed. I'll do that in v2.

> Rob
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

