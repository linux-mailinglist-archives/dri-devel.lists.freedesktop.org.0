Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93853BD4B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A78510FA93;
	Thu,  2 Jun 2022 17:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DF710FF78
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654190493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkWLRL2btcOuYEbOqP+XTrwGTww6RFdHa8AA7224PiA=;
 b=L0Sc3XwLHtmf/ByS8Sq2Rm4rIaSIBFcAGQZLCrs5WT3zg8iwXEByhX2+EqYG76+VIRu9SO
 +AggepLfeq1oH4+M0JFOneFclW52Fl6MUiB83BpyAp9/weP/ZE04+0f6gRPeh+sk6DsFpz
 oeATSMIt/tNJ7f1EpYpZ2acI+mVikeY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-GMwcxT_ePDmHSkFh2XaJeQ-1; Thu, 02 Jun 2022 13:21:31 -0400
X-MC-Unique: GMwcxT_ePDmHSkFh2XaJeQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c4fc300b003946a9764baso5461187wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 10:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bkWLRL2btcOuYEbOqP+XTrwGTww6RFdHa8AA7224PiA=;
 b=06YIx68tKlWFCH2j7DnzAR3mQaBDYef3lSud/yxChr13H1RcIBF9nq6ifcyfBGfGml
 7sOFlI3E1hGBG3ZMT6fVDoitOwd+Tdp+aiwJG+4/u7QIsev9I/8uFKKHtZFt96WeLE/f
 bW8PV3RilxZ0EPTujdjSTAgYezv17Qt13tDMnZkWUthVlZDkQjodjz3/xceYXFFFXzb2
 QeU4QkqS45yfrXnW3iDRYB7Fqi3qk3/X1ig1m5z9k32sioUUwysQMUmV5yeWNnSrwyx9
 ybsvAZ5Ar5uzWi+oervJnV1gkxhYkUACdQZEjbOHm/yAYWb3UP5ahMZHL2871vJ6iwH/
 KUNw==
X-Gm-Message-State: AOAM5318HWwsQYhPGbUV+c8Q87DRXwKcjeszqfEXQsdDqADDedDLMEfE
 NI3uFZ/CrKRiT3V2W09R7V+wYcY5U0cCSntk+Nz4ePm2qKz5OAZBOWykBwaLdyEX1Xob1tEh2p4
 Cnn4/yGkxr+wIyYkvGadyLY409+lw
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr34805611wmi.67.1654190490151; 
 Thu, 02 Jun 2022 10:21:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfb60ZuTiGga+Bjp8S2I84M/UXb4TC42fVW3h9HcsF2pfLSR34C0NgiuM41gBgcWb82UUXcA==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr34805587wmi.67.1654190489891; 
 Thu, 02 Jun 2022 10:21:29 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s8-20020a5d69c8000000b002102b16b9a4sm4963168wrw.110.2022.06.02.10.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 10:21:29 -0700 (PDT)
Message-ID: <195c6865-d6f7-fbc4-6ee5-784c5c49d243@redhat.com>
Date: Thu, 2 Jun 2022 19:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: David Gow <davidgow@google.com>
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
 <20220530102017.471865-2-jose.exposito89@gmail.com>
 <e26de140-afb7-7b1b-4826-6ac4f3a4fe02@redhat.com>
 <CABVgOSkCxu2xBnxwc6mO2AQaqzTbDf53PJzT2QvZNyLeumt5hg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CABVgOSkCxu2xBnxwc6mO2AQaqzTbDf53PJzT2QvZNyLeumt5hg@mail.gmail.com>
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 Daniel Latypov <dlatypov@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello David,

On 6/2/22 19:07, David Gow wrote:
> On Thu, Jun 2, 2022 at 9:27 AM Javier Martinez Canillas

[snip]

>>
>> And doing that will also allow you to get rid of this, since just selecting
>> CONFIG_DRM_KUNIT_TEST=y would be enough for the tests built and run by KUnit.
>>
> 
> This is definitely something other KUnit tests (apparmor, elf, etc)
> are doing, and it's generally fine. You do lose the ability to build
> the tests as a separate module, though. (This is not usually a big
> problem, but there are some cases where it's useful.)
> 
> That being said, I don't think 'select' is enough of a problem that
> you should feel the need to refactor in this way just to avoid it.

Oh, yes I didn't want to imply that this was the main reason but just
pointed out that wouldn't even be needed if done that way. And it is
something that we want to do anyway IMO, since as mentioned it would
allow to test the static functions, which are the majority the format
helpers in that file.

> Given most of the other DRM drivers (as well as DRM_DEBUG_SELFTEST)
> are select-ing DRM_KMS_HELPER, it seems like a sensible enough thing
> to continue doing for the KUnit test. As Daniel pointed out, as a
> hidden option it was clearly always meant to be select-ed anyway.
>

Yes, it can be done from the DRM_KUNIT_TEST symbol or just have it set
(and any other needed DRM helper libraries tested by other suites) in
the .kunitconfig file.

I don't think is that important, since at the end that dependency will
have to be maintained in some place.
 
> Cheers,
> -- David
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

