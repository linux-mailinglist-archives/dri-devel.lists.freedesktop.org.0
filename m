Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1C165A578
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 16:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7845D10E094;
	Sat, 31 Dec 2022 15:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDECB10E094
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672499819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6RyrBHhoHlZmqLHt8ucRNR/9+JKL/9Ujqhw74hbHi4=;
 b=YFrxrcYFMxvSrFnxybFXIDIno2mkHhsmXbC+5Vjon9FmmezWtPhIWH24arS9VSQI1jQ4Hb
 71o+xWToYkN7Dl4au3RdjUTsbVj7tYjBgHaeYJTWPTZ/6aKXJJfY2HMPr2xono4Ol5zOXr
 /IAUxZsrnNgtH/sNceUM1gfbygeo9H8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-EuwokblvMIae0QN0uEG7hg-1; Sat, 31 Dec 2022 10:16:55 -0500
X-MC-Unique: EuwokblvMIae0QN0uEG7hg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so10695962wmq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 07:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6RyrBHhoHlZmqLHt8ucRNR/9+JKL/9Ujqhw74hbHi4=;
 b=zpiDqV9CAq0RUJQH2UoJY/xUQNQYz1UQLtYFwSc5fLZams1flYAvAoRo2/fe95KMip
 TFXtkcZh5RtNNq2ZDLYjOpQuAaQe2ky3muLr9nABtZIdRx/83hmAQe0N3fOxuMni1jzU
 /BnqUlDndSwmKlwSMXJAidEi4yc9X+X0xxnFo7IlaTO9rzj/4oyin7VJDR5y80egknOp
 rI/zzKeU4wa5PSoJ1fdwB5plLSL1B9pGUrTy52GXxoOmZu283GlMOG0VoOWvqRmlNIKH
 H9R2jtP3Tp+ezagA93Ss7E1TPgEluGyigze+wsdupZ8+856fLg9tZS09EiqIh+YHOyYb
 DmDA==
X-Gm-Message-State: AFqh2kpNuR+N2LpaLLI/SghnrubCQICtxYnppiPMelhEDVMOASuzzKzk
 E8EOKJkN8qsjAlgy8/r3Gdl+E4celsbavHkHhNVplrO9EPOHgRA7C/BSsJt3mnuSYDT79wSTAMX
 BdKLYd1Gt6ot3tFa1tMNHkAiTrmAB
X-Received: by 2002:a05:600c:1c8e:b0:3d2:4234:e8fe with SMTP id
 k14-20020a05600c1c8e00b003d24234e8femr25372389wms.19.1672499814844; 
 Sat, 31 Dec 2022 07:16:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsitUMnyhwKUqPjb9FjXl0iVtKBrfHjUXgucY11XvuCsDRImLpxjUnSq2XfmJiw3lSKKueGOA==
X-Received: by 2002:a05:600c:1c8e:b0:3d2:4234:e8fe with SMTP id
 k14-20020a05600c1c8e00b003d24234e8femr25372380wms.19.1672499814628; 
 Sat, 31 Dec 2022 07:16:54 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b003d974076f13sm28905582wms.3.2022.12.31.07.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Dec 2022 07:16:54 -0800 (PST)
Message-ID: <ec67d635-86b0-1e43-d819-d1716c4f22ae@redhat.com>
Date: Sat, 31 Dec 2022 16:16:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 3/4] MAINTAINERS: Add entry for Himax HX8394 panel
 controller driver
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Kamil_Trzci=c5=84ski?=
 <ayufan@ayufan.eu>, Martijn Braam <martijn@brixit.nl>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-4-javierm@redhat.com>
 <20221230154311.bvgmjlryu5guctyr@core>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221230154311.bvgmjlryu5guctyr@core>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/30/22 16:43, Ondřej Jirman wrote:

[...]

>>  
>> +DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
>> +M:	Javier Martinez Canillas <javierm@redhat.com>
> 
> +M:	Ondrej Jirman <megi@xff.cz>
>

Great! I assume that you also are OK with listing you in the DT
binding doc. I'll include you in both places when posting a v5.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

