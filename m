Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263434F2965
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 11:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A754D10EB07;
	Tue,  5 Apr 2022 09:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE610EB07
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649150359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vwp/klJZ6w8cqXIRnQlGelnzUBW3VqC3Y+5RomljZNo=;
 b=MjQJSvsI2wbKdmJkikJ0evhVBP6WiqX2asBtMKas+DTL2aRWshouAiOtJ/ZEQLXKMuPvbK
 4NxfkDDAEuf8rG6yByLlgPS3LYxCiT9VkpaJhhV8aa63zokKYHXrc+ZOkiR4+ukyEcfWYR
 L0x59QVywBskzEputCAakyGE0cTLsyo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-xO-oceHIMt-PpLZvY5bssg-1; Tue, 05 Apr 2022 05:19:18 -0400
X-MC-Unique: xO-oceHIMt-PpLZvY5bssg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f19-20020a7bcd13000000b0038c01defd5aso984591wmj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 02:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vwp/klJZ6w8cqXIRnQlGelnzUBW3VqC3Y+5RomljZNo=;
 b=4Q9iAz4zIrF5MQmXBn7coQAjqft2G5f4CetjJf9Qc3N5u0VglBZzXvsv+mPgpNjDIz
 Cw5mp1WDD1oOEZoBpRwSKZEBF1xRU3LhE5Ho7WmrkQueQ21EtWDzGukYW6lmSoJrEC8H
 AMig/WTbECuLMLPpCyEbM0l5MH0GYeo0eq5yRew4Ih5NCJQmk8LqN8Hi2aFLlhXBt++4
 E0Y9d/2akZ2iMm5DfN8p1SRFEBJflfhJHpCAb80w2J2cz1N/pxGkKj2JJf2J5/7seoSp
 BnKiShxgP/h7vdri3poQjYpLtRWx5lFay9/v3V2J5ArEdtdG1eGahidpDYU0QHBAAsfA
 pr9Q==
X-Gm-Message-State: AOAM531miAXcnWAFdx8svAkIwhTRWxHvLBblvwUBCufbGmXeoS7R3z9q
 jy0q8RcNfSokAe23tX0yK8rjuJLsExe0rhgOit4E2JiVnDvY8idFRuY5/jKbUq536y/diNHOtW/
 olt1pzCfbhxwU7RtdvGXIpCKxjKtB04Dx9mhcXrITYMJk6HhCQq65WgAZ+HMbuGkEy+icOlEzj7
 hWpNY=
X-Received: by 2002:a05:6000:1d9d:b0:206:1cf4:f9a6 with SMTP id
 bk29-20020a0560001d9d00b002061cf4f9a6mr1914993wrb.492.1649150356506; 
 Tue, 05 Apr 2022 02:19:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLhZGbdLpNdT/GdxUoAqjrwvfb3mcQPDAmjPtZRUifF4rT2Th6dQMMAa/mHgAToD3JKo/uLg==
X-Received: by 2002:a05:6000:1d9d:b0:206:1cf4:f9a6 with SMTP id
 bk29-20020a0560001d9d00b002061cf4f9a6mr1914957wrb.492.1649150356175; 
 Tue, 05 Apr 2022 02:19:16 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a5d53c2000000b0020604b2667asm12159724wrw.81.2022.04.05.02.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 02:19:15 -0700 (PDT)
Message-ID: <408ffe9b-f09f-dc7e-7f5e-a93b311a06fa@redhat.com>
Date: Tue, 5 Apr 2022 11:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zackr@vmware.com>,
 Hans de Goede <hdegoede@redhat.com>, Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Jones <pjones@redhat.com>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
 <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local> <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 4/5/22 10:40, Daniel Vetter wrote:
> On Tue, Apr 05, 2022 at 10:36:35AM +0200, Daniel Vetter wrote:
>> On Wed, Feb 09, 2022 at 01:19:26AM +0100, Javier Martinez Canillas wrote:
>>> On 2/8/22 22:08, Daniel Vetter wrote:
>>>> This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.
>>>>
>>>> With
>>>>
>>>> commit 27599aacbaefcbf2af7b06b0029459bbf682000d
>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Date:   Tue Jan 25 10:12:18 2022 +0100
>>>>
>>>>     fbdev: Hot-unplug firmware fb devices on forced removal
>>>>
>>>> this should be fixed properly and we can remove this somewhat hackish
>>>> check here (e.g. this won't catch drm drivers if fbdev emulation isn't
>>>> enabled).
>>>>
>>>
>>> Unfortunately this hack can't be reverted yet. Thomas' patch solves the issue
>>> of platform devices matched with fbdev drivers to be properly unregistered if
>>> a DRM driver attempts to remove all the conflicting framebuffers.
>>>
>>> But the problem that fb561bf9abde ("fbdev: Prevent probing generic drivers if
>>> a FB is already registered") worked around is different. It happens when the
>>> DRM driver is probed before the {efi,simple}fb and other fbdev drivers, the
>>> kicking out of conflicting framebuffers already happened and these drivers
>>> will be allowed to probe even when a DRM driver is already present.
>>>
>>> We need a clearer way to prevent it, but can't revert fb561bf9abde until that.
>>
>> Yeah that entire area is a mess still, ideally we'd have something else
>> creating the platform devices, and efifb/offb and all these would just
>> bind against them.
>>
>> Hm one idea that just crossed my mind: Could we have a flag in fb_info for
>> fw drivers, and check this in framebuffer_register? Then at least all the
>> logic would be in the fbdev core.
>

I can't answer right away since I've since forgotten this part of the code
and will require to do a detailed read to refresh my memory.

I'll answer later but preferred to mention the other question ASAP.
 
> Ok coffee just kicked in, how exactly does your scenario work?
> 
> This code I'm reverting here is in the platform_dev->probe function.
> Thomas' patch removes the platform_dev. How exactly can you still probe
> against a platform dev if that platform dev is gone?
>

Because the platform was not even registered by the time the DRM driver
probed and all the devices for the conflicting drivers were unregistered.
 
> Iow, now that I reponder your case after a few weeks I'm no longer sure
> things work like you claim.
>

This is how I think that work, please let me know if you see something
wrong in my logic:

1) A PCI device of OF device is registered for the GPU, this attempt to
   match a registered driver but no driver was registered that match yet.

2) The efifb driver is built-in, will be initialized according to the link
   order of the objects under drivers/video and the fbdev driver is registered.

   There is no platform device or PCI/OF device registered that matches.

3) The DRM driver is built-in, will be initialized according to the link
   order of the objects under drivers/gpu and the DRM driver is registered.
   
   This matches the device registered in (1) and the DRM driver probes.

4) The DRM driver .probe kicks out any conflicting DRM drivers and pdev
   before registering the DRM device.

   There are no conflicting drivers or platform device at this point.

5) Latter at some point the drivers/firmware/sysfb.c init function is
   executed, and this registers a platform device for the generic fb.

   This device matches the efifb driver registered in (2) and the fbdev
   driver probes.
   
   Since that happens *after* the DRM driver already matched, probed
   and registered the DRM device, that is a bug and what the reverted
   patch worked around.

So we need to prevent (5) if (1) and (3) already happened. Having a flag
set in the fbdev core somewhere when remove_conflicting_framebuffers()
is called could be a solution indeed.

That is, the fbdev core needs to know that a DRM driver already probed
and make register_framebuffer() fail if info->flag & FBINFO_MISC_FIRMWARE

I can attempt to write a patch for that.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

