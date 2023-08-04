Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5BD770090
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 14:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B4010E6EC;
	Fri,  4 Aug 2023 12:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3714910E6EC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 12:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691153631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e38aKOY9ohssU55r1r5yyvxyMVSM82r+WKB1POCd67A=;
 b=JWeVLpLdAFtXr9BeAwPnjZux/SnuPi+icijkUO7TgvSOERn4oYdjNj57uRUFZiGSmOwbuw
 rJGiTmG/IH1AiYHB1Kd1pEHw3l7mFds4+tf+RuoK/C/THbmQWLGW3/qK3pZqQiyyX/Ls+B
 fQovuF+pflDDFLlkIoga/m0NIkb9ea0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-yvX2dKZ6MH6jsGHSiH6asg-1; Fri, 04 Aug 2023 08:53:50 -0400
X-MC-Unique: yvX2dKZ6MH6jsGHSiH6asg-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6b9e6a0c2ffso3359000a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 05:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691153629; x=1691758429;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e38aKOY9ohssU55r1r5yyvxyMVSM82r+WKB1POCd67A=;
 b=PlralyIF2UrKTWe+nKENeePotFZQAw3iBg6kpc8vJsQJ1WQO5AXtoDCyb/oOCwwl0B
 il3ijSR1403RtdUjFNz8LFpRmtHbHUtnZSdBHUyJR9xs3+PSIidsO33s/fV22ZO4nqFY
 8PrA2BxPlbYaQ4wCPI0uLT4w7p9ch/ayf17QNXrD0ukYq8H6PB7GmPBYyD8lARAeF2qG
 Xguqai2Rkx9dw85p9J88zYSmMfl0L1GD/Zx46IrfwAD+17yu5KvPdTk8MjKcaT1TXKZ+
 ay448Ts79ekYOk8WuOqtaCcOrvRgs4K5GjFh9zXOmXJp43Q6JGb+FI7iTRm7y06O/TFL
 xt7A==
X-Gm-Message-State: AOJu0Yyl+WynpWP4VGWIJfsvplwIrk/ajc+cRjCEZ9Tgj2Y9cHbZ4T88
 ta2n1Jot7G2x2iynnr0BqcrbM+yMux31gGtIScs5GNRfejj1fWPjpEnMM7Q5defc9OBAisfkv2f
 rkjcVUOVS8Ot7P+raXGGHwasYtdsIYC/KWgiT
X-Received: by 2002:a05:6830:1094:b0:6b8:958f:36ea with SMTP id
 y20-20020a056830109400b006b8958f36eamr1607056oto.0.1691153629269; 
 Fri, 04 Aug 2023 05:53:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnQC3de5IJkvLrjTLS7w7A1VLS5lu4tBk6Em0Eg0JJaYuDPxfj6QG4wt94kFkzEGRL/72hhA==
X-Received: by 2002:a05:6830:1094:b0:6b8:958f:36ea with SMTP id
 y20-20020a056830109400b006b8958f36eamr1607049oto.0.1691153629039; 
 Fri, 04 Aug 2023 05:53:49 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 d17-20020a9d4f11000000b006af7580c84csm1044554otl.60.2023.08.04.05.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 05:53:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
In-Reply-To: <87r0osxqrf.fsf@minerva.mail-host-address-is-not-set>
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
 <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
 <87lef1s5h8.fsf@minerva.mail-host-address-is-not-set>
 <bef940cb-b079-72ce-692c-3b6c6d283265@riseup.net>
 <87v8e5tia8.fsf@minerva.mail-host-address-is-not-set>
 <c02a7694-00f1-48d2-9299-13c0a40dc0ae@app.fastmail.com>
 <87r0osxqrf.fsf@minerva.mail-host-address-is-not-set>
Date: Fri, 04 Aug 2023 14:53:46 +0200
Message-ID: <871qgjge91.fsf@minerva.mail-host-address-is-not-set>
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> "Arnd Bergmann" <arnd@arndb.de> writes:
>
> [adding Randy Dunlap who also reported the same issue]
>
> Hello Arnd,
>
>> On Thu, Jul 27, 2023, at 18:45, Javier Martinez Canillas wrote:
>>> Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net> writes:
>>>> On 27/07/23 13:07, Javier Martinez Canillas wrote:
>>>>> "Arnd Bergmann" <arnd@arndb.de> writes:
>>>>>> Changing the local config should not be required after fixing
>>>>>> the Kconfig files.
>>>>>>
>>>>> 
>>>>> CONFIG_VT can only be disabled if CONFIG_EXPERT=y but I also see that it
>>>>> does not default to 'y' if !UML. Also FRAMEBUFFER_CONSOLE depends on !UML
>>>>> but DRM_FBDEV_EMULATION selects FRAMEBUFFER_CONSOLE if !EXPERT.
>>>>> 
>>>>> Maybe we should include !UML in that condition to? Something like this:
>>>>> 
>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>> index 0d499669d653..734332f222ea 100644
>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>> @@ -135,7 +135,7 @@ config DRM_DEBUG_MODESET_LOCK
>>>>>  config DRM_FBDEV_EMULATION
>>>>>         bool "Enable legacy fbdev support for your modesetting driver"
>>>>>         depends on DRM
>>>>> -       select FRAMEBUFFER_CONSOLE if !EXPERT
>>>>> +       select FRAMEBUFFER_CONSOLE if (!EXPERT && !UML)
>>
>> Yes, that should work. Was the original bug report about UML then?
>>
>
> By original do you mean Arthur's report or Randy's? But yes, in both cases
> CONFIG_UML=y when the issue was seen.
>
>> I'm not actually sure we need the select at all. When I tried
>> to narrow down how fbdev is used in the previous
>> thread, the answer was pretty much that it could be used
>> in any possible way, so there might be users that only want
>> the /dev/fb0 interface but not the console, or even just
>> the logo.
>>
>
> Yes, I agree with you. Maybe then the fix could be to just drop that select?
>

I've posted a patch [0] doing this as suggested by Arnd. Let me know what
you think.

[0]: https://lists.freedesktop.org/archives/dri-devel/2023-August/417565.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

