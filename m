Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDCB4F18D1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E952510E021;
	Mon,  4 Apr 2022 15:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786EB10E021
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649087298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACaAB1t0vMWb3pX2ELgBqL+jg9CnsBzljXi5Wr6J60o=;
 b=ahQIZJveoaR+Y6dsDE5k2DBuix4glwxgmWuUbkU0t6K4znyfEdZbQU0DnSa5F71Xd5sait
 JYdGNQBlf25YwkWQPb2M6fY5lX/sqaQucXMv7nxKHSdttWiCSza4IweLIWkf7wOz7rCqeN
 W5yW13uy+n5yMyAAHFYJZPiq4Sals0o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-310k7deENWWewKJHLA3v3w-1; Mon, 04 Apr 2022 11:48:17 -0400
X-MC-Unique: 310k7deENWWewKJHLA3v3w-1
Received: by mail-wm1-f72.google.com with SMTP id
 m35-20020a05600c3b2300b0038c90ef2dceso7091632wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ACaAB1t0vMWb3pX2ELgBqL+jg9CnsBzljXi5Wr6J60o=;
 b=kgpNGKMcYIZKBl0FF0Xt89GqjRUl68M0MN4cZNz25ixWp8RzBksCVfPCLJWEj67bON
 NqoKknAyv0RCswJa50JAgO3wjXd51mnAqhC53EYVbrrGIVcMQT2L2MWPn1fAeqRg7Obb
 tYQ5PeebSpjF5kw7+GsaBbMqhzJUQ6v5mfg9fqvJm9AH9oaK2uRsRryZGmyyKqSAVhbp
 BjxDSk+jT5UzTClyONrRUWh91AvMtQw+R/bq2USPlUHQF1hQ9biX9QQJpkMY8mUxKjYD
 xyU9EInsVfhzL2rzu8aWJTCaR9/Z+qM1GR8qGtfTEdn0ZSJiS9LhU9XIKfGpzPZg777j
 8nHQ==
X-Gm-Message-State: AOAM533YMZrlZp6yNeb2L84MJgBPCfoHuzAIye0c7AESwo9Jn4D9gJK2
 F0aXI92LIfRNQfv7UlJ2OT4x8f4BWbfmHfrkh4A3Br/U8QQRrlKB9mCMEfC1kNKmYOweBe87RRO
 sZTz5vDFuy+Y87wIx24ydqV0Ju/x+
X-Received: by 2002:adf:f188:0:b0:206:e20:1b65 with SMTP id
 h8-20020adff188000000b002060e201b65mr259496wro.363.1649087296378; 
 Mon, 04 Apr 2022 08:48:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+jBXSnytEUbHzPD7PrJYBhDtVRIkCeBYl9hIqrrHNXMn+EkEqSV4Kzkt4zlwuYyU9ugLZaA==
X-Received: by 2002:adf:f188:0:b0:206:e20:1b65 with SMTP id
 h8-20020adff188000000b002060e201b65mr259479wro.363.1649087296112; 
 Mon, 04 Apr 2022 08:48:16 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm9737099wmj.34.2022.04.04.08.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:48:15 -0700 (PDT)
Message-ID: <92a46ea2-e23e-b7c8-ea5f-35d458ee1b76@redhat.com>
Date: Mon, 4 Apr 2022 17:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] dt-bindings: display: ssd1307fb: Add entry for SINO
 WEALTH SH1106
To: wens@kernel.org, Javier Martinez Canillas <javier@dowhile0.org>
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-3-wens@kernel.org>
 <CABxcv==csvqsxM46ce2LecDh4E-UxxD2DG+3E-hCFoyrdtRv7A@mail.gmail.com>
 <CAGb2v64VQPjan=EUkd8UhRZfV0g1GqBwPqhxQakS=7YhgvVDQA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAGb2v64VQPjan=EUkd8UhRZfV0g1GqBwPqhxQakS=7YhgvVDQA@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chen-Yu,

On 4/4/22 17:06, Chen-Yu Tsai wrote:

[snip]

>>>      enum:
>>> +      - sinowealth,sh1106-i2c
>>
>> I like that you didn't include a "fb" suffix for this, the existing
>> ones are cargo culting from the previous fbdev driver to make existing
>> DTBs compatible with the DRM driver.
>>
>> I've been thinking if I should post a patch to compatible strings
>> without the "fb" and mark the current ones as deprecated...
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> I also thought about dropping the "-i2c" suffix, but then thought
> there might be a case where someone wanted to search the device
> tree specifically for an I2C connected node using said compatible
> string.
> 
> What do you think?
> 
>

tl; dr: unfortunately we can't do it due how SPI and I2C report module
aliases. Otherwise module auto loading will not work. I wrote a much
longer explanation with some details not so long ago:

https://patchwork.kernel.org/project/dri-devel/patch/20220209091204.2513437-1-javierm@redhat.com/#24730793

BTW, I bought a SSD1306 SPI controller and go it working this weekend.

I plan to post the patches once yours land, to avoid in-flight series
that may conflict. And what I did is mark the -fb as deprecated, then
added "ssd130x-i2c" and "ssd130x-spi" compatibles strings.

The WIP patches can be found here in case you are interested:

https://github.com/martinezjavier/linux/tree/drm-ssd130x-spi

> ChenYu
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

