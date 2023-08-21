Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFF782A9C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1161A10E253;
	Mon, 21 Aug 2023 13:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1510E253
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692624896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgYCBKJwwlMQi8AzmXE/cpxLIs8JaOLzYg4HzBfwWyc=;
 b=Oq9IF/rUKvsp4Vp8/JjWv8A6tYpG6s8H56fv1NJEhEKIYOb4R3F97xTLdD0eMjJsrpAyn9
 Mft/HNf9vPAD8S905zgI97n/ZyWub5QlkqRcloZxJqbm7AfHkcgmCCfaFfLd6/Xk/MxOQQ
 hr4JkEUGcIAERPer1YsFloaeZ4fHY9o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-5KWLUbsFOxOhwZjxJnVg5A-1; Mon, 21 Aug 2023 09:34:55 -0400
X-MC-Unique: 5KWLUbsFOxOhwZjxJnVg5A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fe517ca810so22255325e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 06:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692624893; x=1693229693;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fgYCBKJwwlMQi8AzmXE/cpxLIs8JaOLzYg4HzBfwWyc=;
 b=C4WOP6dzh5JnkYt/PewkVZNYGoTVozriIqoAO24AQBCT15mAYEMs8jLBJTv5i1DVKm
 MMcqlu3KmAcOMty0YZgUugh+FlFs0hHO06kCpBpjl0Pz9qFQZDUnEf7XuPc1FRTdcMYO
 wbXpiHwwsFpgDQ52h0WSxO7hCiskcGPnlOJBUi06TFqSEBUDuYMi/Fc1IRR3sIKBe9mx
 0O2tJzrD0Dq6zJ1HBTkbkFou4b242MUmXMcQh6/1+kl8dTQfQeTJMPUIza4T26YctOp3
 OTmKrwL4vR3lsl3l43UGjXLj4Wpysm1g7UyFoQdLCzoxIXMBdxaPI4gW5quYKL/n4uby
 Q6xw==
X-Gm-Message-State: AOJu0YwWLd7buptEmS8aD6H+Euybdsjf3lIDncB8WdO1EkAIGwD6nN7I
 ql/ZV82Q+kMkEqxQP7fUo9fQiMjxMzMcZgJ4l7cuf5yGVyVhnp5STA8harbtpeq5wOXPHL9azlv
 DF97i9ZctfEWD/Ji3Hv26+CKxGqyz
X-Received: by 2002:a1c:4c0a:0:b0:3fe:f12d:4d4 with SMTP id
 z10-20020a1c4c0a000000b003fef12d04d4mr2017082wmf.30.1692624893746; 
 Mon, 21 Aug 2023 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZQU9BYWwbQc7CJ1dw5DsX0yr8to6Uc5UhMeqKOGZZocpeeLu4qlqTA/06A/SE0eZc8j2WHg==
X-Received: by 2002:a1c:4c0a:0:b0:3fe:f12d:4d4 with SMTP id
 z10-20020a1c4c0a000000b003fef12d04d4mr2017068wmf.30.1692624893460; 
 Mon, 21 Aug 2023 06:34:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:329d:db81:ed0c:c9cd?
 ([2a01:e0a:d5:a000:329d:db81:ed0c:c9cd])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600c364600b003fee0741b8csm9386956wmq.23.2023.08.21.06.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 06:34:52 -0700 (PDT)
Message-ID: <d37338e6-94cb-0005-3a0c-4bdfcb87141f@redhat.com>
Date: Mon, 21 Aug 2023 15:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com
References: <20230809192514.158062-1-jfalempe@redhat.com>
 <3182767.5fSG56mABF@nerdopolis2>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3182767.5fSG56mABF@nerdopolis2>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/08/2023 04:20, nerdopolis wrote:
> On Wednesday, August 9, 2023 3:17:27 PM EDT Jocelyn Falempe wrote:
>> This introduces a new drm panic handler, which displays a message when a panic occurs.
>> So when fbcon is disabled, you can still see a kernel panic.
>>
>> This is one of the missing feature, when disabling VT/fbcon in the kernel:
>> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
>> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
>>
>> This is a proof of concept, and works only with simpledrm, using the drm_client API.
>> This implementation with the drm client API, allocates new framebuffers, and looks a bit too complex to run in a panic handler.
>> Maybe we should add an API to "steal" the current framebuffer instead, because in a panic handler user-space is already stopped.
>>
>> To test it, make sure you're using the simpledrm driver, and trigger a panic:
>> echo c > /proc/sysrq-trigger
>>
>> There is one thing I don't know how to do, is to unregister the drm_panic when the graphic driver is unloaded.
>> drm_client_register() says it will automatically unregister on driver unload. But then I don't know how to remove it from my linked list, and free the drm_client_dev struct.
>>
>> This is a first draft, so let me know what do you think about it.
> Hi,
> 
> Oh wow, that's my post. I'm sorry about the late reply, I only saw this late yesterday, and I wanted to test it first.
> I had to edit my test QEMU script a bit to use TianoCore for virtual UEFI boot as there is no gfxmode=keep for SimpleDRM to work otherwise when specifying -kernel to qemu AFAIK
> 
> I tested it, and it works! That's pretty cool, although is it possible to show the message, such as "attempted to kill init"?

Thanks for taking time to test it. Yes it's possible to show the panic 
reason, as it's a parameter in the panic callback.
> 
> I like the little ASCII Tux. Maybe an ASCII /!\ or [X] on the belly would make it more obvious to users that it is an error condition.
> Especially for non-English speaking users

That's a good idea. It's also probably possible to re-use the tux boot 
logo, but I didn't try it yet.

But currently, my priority is to see if it can get accepted, and if it 
can work with a wide range of drivers.

> 
> 
> I will tweak my script a bit so I can test it more quickly in the future too.


Best Regards,

-- 

Jocelyn
> 
> Thanks!
>>
>> Best regards,
>>
>>
>>
>>
>> Jocelyn Falempe (2):
>>    drm/panic: Add a drm panic handler
>>    drm/simpledrm: Add drm_panic support
>>
>>   drivers/gpu/drm/Kconfig          |  11 ++
>>   drivers/gpu/drm/Makefile         |   1 +
>>   drivers/gpu/drm/drm_drv.c        |   3 +
>>   drivers/gpu/drm/drm_panic.c      | 286 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/tiny/simpledrm.c |   2 +
>>   include/drm/drm_panic.h          |  26 +++
>>   6 files changed, 329 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>   create mode 100644 include/drm/drm_panic.h
>>
>>
>> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
>>
> 
> 
> 
> 

