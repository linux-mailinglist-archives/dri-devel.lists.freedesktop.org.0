Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F56640B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 13:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933110E064;
	Tue, 10 Jan 2023 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B47E10E064
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673354597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VuDZQoNTvLCMWUBdjBX9vJZBiOLiogy0J+gwEg2h85o=;
 b=KdmgrvoVnR7zcttSWL1XCoM76cTJXFdfWyKBPOmIcr1BTOZ43BDndMDZDoASNaxRC1LC/V
 aFXOxaxkK7kVvHJ2+sUPLDwr1x2StJxWvQST8hCt/sVI3819WoPkELlTjt9dSB/Gn7ZobC
 ymr9vmQ9vRJxcOeVTs9NPHRI6jDLFGI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-328-t9tJwDp9PQeW_UuRO8BE-w-1; Tue, 10 Jan 2023 07:43:16 -0500
X-MC-Unique: t9tJwDp9PQeW_UuRO8BE-w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so6252416wma.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 04:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VuDZQoNTvLCMWUBdjBX9vJZBiOLiogy0J+gwEg2h85o=;
 b=QqpAu9xyeIROx5RWrzWd6u1jGyG8GGq0IzBC0YLbMG3QsdIzmyWK76azzNXie0lZgn
 B8zYIQ+dC7UZC6HrlX29Bm6nEosTSu8eTPSHPXqUiUHyfdrvMPwOTswbszASGrW+04VJ
 6jaZo1ot4FLwj4sQdcB2LS6+xCC9NAQ72jO+L/rlMWRk31F9BfTLascGAk7/zKTOdCBG
 HE/WWw/4llb7OErvstSeREEVQD9JUZMviwtjTkDY/KlrAViYD0UTLraoxBhQ6O9xl3xK
 6nI5/lGfIp+aBEg9uB5GWyFunmB2trfAefZ6ISpGZgOy0ilvaGHVI/0EYa2KWkaZJ8Em
 5RyQ==
X-Gm-Message-State: AFqh2kq5thC9D/s6h8B9AdWydbN/yFdeYXXwejj52dJj+TUCoKpaTJ93
 L9yPtsJluFJ2GarTkTwp5tBiOZKGZI4BPVUqRmHhhtSz/yHS+PBrfpV/OZ3IVcHiPaSNVKruQOL
 WV/EviA8plb7S95Xz4lr90dMCwpre
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr53008452wmk.23.1673354595116; 
 Tue, 10 Jan 2023 04:43:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsUjqCcKs3belwDW02YrGwAd9dYstg2utsYF/y82Y5pSf2VIgSmVGXcb1vaHM0wcgRqsAjR+g==
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr53008439wmk.23.1673354594930; 
 Tue, 10 Jan 2023 04:43:14 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm14375160wmj.36.2023.01.10.04.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 04:43:14 -0800 (PST)
Message-ID: <383d4eba-9e3f-04e2-31bf-93b1f3dcdd93@redhat.com>
Date: Tue, 10 Jan 2023 13:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 0/3] Add PinePhone Pro display support
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230102230733.3506624-1-javierm@redhat.com>
 <CACRpkdadwiG=OMMHFUKYHyr1zRpeZzVR9pkmsBEBxqZzN2H53g@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CACRpkdadwiG=OMMHFUKYHyr1zRpeZzVR9pkmsBEBxqZzN2H53g@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus,

On 1/10/23 13:30, Linus Walleij wrote:
> On Tue, Jan 3, 2023 at 12:07 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> 
>> This series adds support for the display present in the PinePhone Pro.
>>
>> Patch #1 adds a devicetree binding schema for panels based on the Himax
>> HX8394 controller, such as the HSD060BHW4 720x1440 TFT LCD panel present
>> in the PinePhone Pro. Patch #2 adds the panel driver for this controller
>> and finally patch #3 adds an entry for the driver in MAINTAINERS file.
>>
>> This version doesn't include the DTS changes, since Ondrej mentioned that
>> there are still things to sort out before enabling it. The DTS bits will
>> be proposed as a follow-up patch series.
>>
>> This allows for example the Fedora distro to support the PinePhone Pro with
>> a DTB provided by the firmware.
>>
>> This is a v5 of the patch-set that addresses issues pointed out in v4:
> 
> I looked over the patches a last time. This driver looks great.
> Acks by Krzysztof and Sam are in place.
> Patches applied to drm-misc-next!
>

Awesome. Thanks a lot!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

