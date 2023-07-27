Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D27476590E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908DC10E5CC;
	Thu, 27 Jul 2023 16:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0510E5C8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690476339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=INHmiJp8wO40pvVcUsi3WpzRCjp1N/tJHyVUw4nw9gs=;
 b=FEw2b5chNMzzx18vZRV60NjZf6BxzBwur/oz8Y/iqfbaXDJHybEqux2exTT9Y+OHu9b3Yo
 lb6ldUFUKbOO9pXmnOofOba/LNJ631V4gLkMJ4z4D41riOIgXbkvYjJXuVqbOb3CCfYKPS
 4YYLUcVmir6Q95MtG0zkPFzoBOkhpio=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-vmR43iyzM6277ZFZiDrmeQ-1; Thu, 27 Jul 2023 12:45:38 -0400
X-MC-Unique: vmR43iyzM6277ZFZiDrmeQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fd2d33fd93so6877025e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690476337; x=1691081137;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INHmiJp8wO40pvVcUsi3WpzRCjp1N/tJHyVUw4nw9gs=;
 b=Cr5iipTtVJgUtAJEYND9q/0MoTK5X5VSrDt/Rckwuq8h7xU+oX0JuFCB6rpuJWZ66A
 hd+LUbMqecFOGV3Wg1vNviC5w9i7fAREMHf5/UzQdhikhRJYweDW4/gWUgZKvdCJyKP3
 u8/1s/LTr890+Wf+2Fc3UXtPT6hAZDc75EJ8avtd2I0/0CQsUSTkqeHOMMioIXG9WYee
 teDHh+6Sr1qEYO/SzTKiNl0G4mUNmtjR8lDyWCl3uFT0GkL0ToayOQalN2iZgHwVrsZF
 tzmQ84qTB3sMBdb2MpZiKy3nTawB5SpWSLP1G27qV1A24HQIeItHmToYWiYx52p4FI+i
 wnXA==
X-Gm-Message-State: ABy/qLbT3JWY+86X6PhGy9WF/npuuhdhn1wspzhV1HMY+0VK5NVFAdBD
 deiO4MIe5bm5fRJl61auhCIy1FCLwLgiV8Y2Iec9nVSXDIlEdCzSwnUQsv1WcfO9Om6RCmUAKU3
 4Mkscsp0x3r3RxwbyU0Q9oVs0+jDh
X-Received: by 2002:a7b:c44e:0:b0:3fc:4ee:12b4 with SMTP id
 l14-20020a7bc44e000000b003fc04ee12b4mr2246344wmi.32.1690476336965; 
 Thu, 27 Jul 2023 09:45:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFObyz90QPmHabmLZWSVeEkRAES6yRf0D2GvoXEwebDXSVWCTXOc2wQUVe7gBUT6FdvejEEIQ==
X-Received: by 2002:a7b:c44e:0:b0:3fc:4ee:12b4 with SMTP id
 l14-20020a7bc44e000000b003fc04ee12b4mr2246324wmi.32.1690476336643; 
 Thu, 27 Jul 2023 09:45:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l14-20020a5d668e000000b003140fff4f75sm2544439wru.17.2023.07.27.09.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:45:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>, Arnd Bergmann
 <arnd@arndb.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
In-Reply-To: <bef940cb-b079-72ce-692c-3b6c6d283265@riseup.net>
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
 <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
 <87lef1s5h8.fsf@minerva.mail-host-address-is-not-set>
 <bef940cb-b079-72ce-692c-3b6c6d283265@riseup.net>
Date: Thu, 27 Jul 2023 18:45:35 +0200
Message-ID: <87v8e5tia8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: tales.aparecida@gmail.com, Helge Deller <deller@gmx.de>,
 mairacanal@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net> writes:

Hello Arthur,

> On 27/07/23 13:07, Javier Martinez Canillas wrote:
>> "Arnd Bergmann" <arnd@arndb.de> writes:
>> 

[...]

>>> Changing the local config should not be required after fixing
>>> the Kconfig files.
>>>
>> 
>> CONFIG_VT can only be disabled if CONFIG_EXPERT=y but I also see that it
>> does not default to 'y' if !UML. Also FRAMEBUFFER_CONSOLE depends on !UML
>> but DRM_FBDEV_EMULATION selects FRAMEBUFFER_CONSOLE if !EXPERT.
>> 
>> Maybe we should include !UML in that condition to? Something like this:
>> 
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 0d499669d653..734332f222ea 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -135,7 +135,7 @@ config DRM_DEBUG_MODESET_LOCK
>>  config DRM_FBDEV_EMULATION
>>         bool "Enable legacy fbdev support for your modesetting driver"
>>         depends on DRM
>> -       select FRAMEBUFFER_CONSOLE if !EXPERT
>> +       select FRAMEBUFFER_CONSOLE if (!EXPERT && !UML)
>>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>>         default y
>>         help
>> 
>> 
>> With that I'm able to run the DRM kunit tests wihtout the mentioned
>> problem. But I'm not sure if that is the correct fix or not.
>
> It works here too, I just don't understand why this commit caused this
> bug, as it did not touch this line.

Yes, I also don't understand why the FB_CORE split made it more likely to
happen since AFAICT the same problem could had happen with just CONFIG_FB.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

