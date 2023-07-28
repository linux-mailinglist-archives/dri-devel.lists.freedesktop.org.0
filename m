Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD51766AE9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 12:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605EA10E179;
	Fri, 28 Jul 2023 10:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE6710E179
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690540872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tlHCewzvSlW0mR6Fjwu7Ie5Uhtrz5p9F/D7UaufTpgM=;
 b=fbyg7Y9apclNEgoqFXDqURJO7TBe/zB9WN5cxFH7DTFRzTSs0xVEwjtq8hN7BPhtl06jlR
 +CXcTFGUc5BsNd+GJV/5L/VchSPy9tCm2PiKb6Fptr28YTToiQy33A3cVUzw2ivDbFTR/L
 Lw0seG/NTuhwU7Xr/GkqGMlwGa62PjQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-XQtRCx0aMUW2HLoTYkryzw-1; Fri, 28 Jul 2023 06:41:11 -0400
X-MC-Unique: XQtRCx0aMUW2HLoTYkryzw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4f3932e595dso1878298e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 03:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690540870; x=1691145670;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tlHCewzvSlW0mR6Fjwu7Ie5Uhtrz5p9F/D7UaufTpgM=;
 b=Zklbdot791PSv1jISPuSD6ljEW8B2btcD6zPd9/J/zD239vI0nNssnuwmooBHZjCF2
 VgMpLoLwnk9igh5HrUWMAhWFFoGFPyXT5lC/84mM+ND+eQIHXTbeuP+yqqkfxhUV5H9h
 VYwU/aGq8eD6dF6ec1EN6ANX0vrA0v3kxnPTtWXqdM+tfMq171hKO6rRktdsiGyCiZUF
 th095TyWGruI6ZvthFEyCgWSn8jUKUN60khkkpEZwYR2VOn00gWHGuqfO5SK6EC00Fes
 3387OAX98eJ/0a00HQ14F/aVaXQltIaQMXNN9yTfwEykfK74JH340lO92rhwqBtQLbNx
 bJJg==
X-Gm-Message-State: ABy/qLZc5oYA1JfwzonbGq5dK7PSchOoZ0XkvoqBGFyc9Zw6TPUP2Lzm
 94QLN9/1zyDZVnJzOLw+IBqbCdtGVDrIlPI7e1ZL9g90X5Tq/lrzTRygFtYaSIA62b01vfzdojq
 AHsjC8h2EMHWXGO1UMnx66B0tLpY7
X-Received: by 2002:a05:6512:401e:b0:4f8:5e49:c613 with SMTP id
 br30-20020a056512401e00b004f85e49c613mr1667359lfb.43.1690540869710; 
 Fri, 28 Jul 2023 03:41:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFwTAr8rP1mBj/A7tQRKl1f0LTDyI3oGsszfSpeohzJsLyOaM4G6ToIdqz/ZBBIpq2B2TmzTg==
X-Received: by 2002:a05:6512:401e:b0:4f8:5e49:c613 with SMTP id
 br30-20020a056512401e00b004f85e49c613mr1667342lfb.43.1690540869323; 
 Fri, 28 Jul 2023 03:41:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0030e56a9ff25sm4450716wrl.31.2023.07.28.03.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 03:41:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
In-Reply-To: <c02a7694-00f1-48d2-9299-13c0a40dc0ae@app.fastmail.com>
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
 <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
 <87lef1s5h8.fsf@minerva.mail-host-address-is-not-set>
 <bef940cb-b079-72ce-692c-3b6c6d283265@riseup.net>
 <87v8e5tia8.fsf@minerva.mail-host-address-is-not-set>
 <c02a7694-00f1-48d2-9299-13c0a40dc0ae@app.fastmail.com>
Date: Fri, 28 Jul 2023 12:41:08 +0200
Message-ID: <87r0osxqrf.fsf@minerva.mail-host-address-is-not-set>
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
 Randy Dunlap <rdunlap@infradead.org>, mairacanal@riseup.net,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

[adding Randy Dunlap who also reported the same issue]

Hello Arnd,

> On Thu, Jul 27, 2023, at 18:45, Javier Martinez Canillas wrote:
>> Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net> writes:
>>> On 27/07/23 13:07, Javier Martinez Canillas wrote:
>>>> "Arnd Bergmann" <arnd@arndb.de> writes:
>>>>> Changing the local config should not be required after fixing
>>>>> the Kconfig files.
>>>>>
>>>> 
>>>> CONFIG_VT can only be disabled if CONFIG_EXPERT=y but I also see that it
>>>> does not default to 'y' if !UML. Also FRAMEBUFFER_CONSOLE depends on !UML
>>>> but DRM_FBDEV_EMULATION selects FRAMEBUFFER_CONSOLE if !EXPERT.
>>>> 
>>>> Maybe we should include !UML in that condition to? Something like this:
>>>> 
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index 0d499669d653..734332f222ea 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -135,7 +135,7 @@ config DRM_DEBUG_MODESET_LOCK
>>>>  config DRM_FBDEV_EMULATION
>>>>         bool "Enable legacy fbdev support for your modesetting driver"
>>>>         depends on DRM
>>>> -       select FRAMEBUFFER_CONSOLE if !EXPERT
>>>> +       select FRAMEBUFFER_CONSOLE if (!EXPERT && !UML)
>
> Yes, that should work. Was the original bug report about UML then?
>

By original do you mean Arthur's report or Randy's? But yes, in both cases
CONFIG_UML=y when the issue was seen.

> I'm not actually sure we need the select at all. When I tried
> to narrow down how fbdev is used in the previous
> thread, the answer was pretty much that it could be used
> in any possible way, so there might be users that only want
> the /dev/fb0 interface but not the console, or even just
> the logo.
>

Yes, I agree with you. Maybe then the fix could be to just drop that select?

> Another thing we could do here would be
>
> config DRM_FBDEV_EMULATION
>       select FRAMEBUFFER_CONSOLE if VT
>
> which is simpler and probably just as good. Or if we decide that
> DRM_FBDEV_EMULATION is in fact only useful for FRAMEBUFFER_CONSOLE
> and add 'depends on VT' and removed the "if (...)"
>

As mentioned I don't think thatis only useful with fbcon/vt and there
should be possible to enable the fbdev DRM emulation even without it.

>>>> With that I'm able to run the DRM kunit tests wihtout the mentioned
>>>> problem. But I'm not sure if that is the correct fix or not.
>>>
>>> It works here too, I just don't understand why this commit caused this
>>> bug, as it did not touch this line.
>>
>> Yes, I also don't understand why the FB_CORE split made it more likely to
>> happen since AFAICT the same problem could had happen with just CONFIG_FB.
>
> c242f48433e79 ("drm: Make FB_CORE to be selected if DRM fbdev emulation
> is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB' to
> an effective 'select FB_CORE', so any config that previously had
> DRM=y and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.
>

Ah, right. I see it now. Thanks for the explanation.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

