Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0865698E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 11:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EAE10E032;
	Tue, 27 Dec 2022 10:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCB810E032
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672137972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7BDaLx2vlolGs3dmZXimAfrXQipJ0Z8+AKbW5eVyvk=;
 b=RAAk/KJu7YC/n/xGRUh1XqMPtQEJ12tEBo+9EXPwOcaAIG2qpYfcq718N1bb486DTvAyKT
 8PkvSHa7CNLrUe0Vcd1A39gMiokxCluTYe7Bx8itz51tmsA0KA9KpQ+BwPs7vADRIgy4iy
 D4/GTeV40QwX0Ev6vfzbOso7XVsDCfk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-GXVtiVydPCqoMeiuSEH4FA-1; Tue, 27 Dec 2022 05:46:11 -0500
X-MC-Unique: GXVtiVydPCqoMeiuSEH4FA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so200167wms.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 02:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7BDaLx2vlolGs3dmZXimAfrXQipJ0Z8+AKbW5eVyvk=;
 b=1XOYQWvPBuPSU6uokpO21JY7pNvm2i2nAzrhpUqOP1mwL3/ghdJfrV0fVa/mT/7q1f
 lV3dF0R7owxRww7ZUHzk/QYyU7dU/wPOpEDrtCsmi5KuKvHg6VgS6eSTxv4+J8CTcgH0
 S1N0+vMEi+1LQZxSXdGrybzEdS9KgRABNqYVr5R4LXjTb3IyX4ugC36AyEoCkoAXqX11
 OGe5C/mKskqYbnP9xUMWGbFn2/wnYrjnhnsvz+aAXFv524sHQApEASmW0S8ru9GQ1VgO
 zeE+XxTW8f5sdc4ahZdLDA4TrIDF8wj/lwQ+HnthNzIsDMjEevktsFmXl7tc7hkK8kcl
 MUyA==
X-Gm-Message-State: AFqh2koHpTUxTPAT3FocNCZKOKX9Vc0lJ8rTjNvZbRRPu9TrlG5+yo4W
 dJpyWHHPt0lbwBgU/rPc6QVYV2zUk8/D9GavIuXL2LLdg5dJC5mjRMoV4svIOqENoPX3HmNVXf1
 iKzCJkAPL5n/YHwXQKxG+O18dgv9w
X-Received: by 2002:a5d:460d:0:b0:242:69f4:cb6a with SMTP id
 t13-20020a5d460d000000b0024269f4cb6amr11958145wrq.9.1672137970225; 
 Tue, 27 Dec 2022 02:46:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvQS7Awi2feDRmYhRXXpgGINwihRjB8yjUFZf6u1fv0XYA4KBECYdgHzXt8AN8JgFECUhOuKA==
X-Received: by 2002:a5d:460d:0:b0:242:69f4:cb6a with SMTP id
 t13-20020a5d460d000000b0024269f4cb6amr11958131wrq.9.1672137970031; 
 Tue, 27 Dec 2022 02:46:10 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z13-20020adff74d000000b002366f9bd717sm14444667wrp.45.2022.12.27.02.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 02:46:09 -0800 (PST)
Message-ID: <1848f28f-6c6e-4a1c-b58b-ccd52ae723f8@redhat.com>
Date: Tue, 27 Dec 2022 11:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] dt-bindings: display: Add Himax HX8394 panel
 controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20221226134909.2822179-1-javierm@redhat.com>
 <20221226134909.2822179-3-javierm@redhat.com>
 <f47cab97-2c8c-a3d5-b362-774f970dffd3@linaro.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <f47cab97-2c8c-a3d5-b362-774f970dffd3@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>, dri-devel@lists.freedesktop.org,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, Martijn Braam <martijn@brixit.nl>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

On 12/27/22 08:44, Krzysztof Kozlowski wrote:

[...]

>> +required:
>> +  - compatible
>> +  - vcc-supply
>> +  - iovcc-supply
>> +  - port
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>

Indeed. I did test in v1 but forgot to do it after addressing your
comments for v2. I have fixed the example snippet now and done it:

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTEX    Documentation/devicetree/bindings/display/panel/himax,hx8394.example.dts
  DTC_CHK Documentation/devicetree/bindings/display/panel/himax,hx8394.example.dtb

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat 

