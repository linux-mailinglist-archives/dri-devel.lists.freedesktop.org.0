Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4380081A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 11:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD7610E099;
	Fri,  1 Dec 2023 10:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D67410E0C5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701426068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Bh0vGQqG6k9jMrVj2KcvFrOUEDKVV6QIbcGZMpO/NE=;
 b=J1+V+4W4LLmIbxtTmtBzIj7pq3d36TYPKa/DX9rNj/0CK1A6T81LTubmJGE20qiK+e9mT7
 ZrZQyYHR2lnBabqkTHmNbuGRr+Fo5zqGnr2eFqqyofiEc3FYyfEnbGTz9daEzZ+UQRUArZ
 6TfbwplsIubmtY25J2Uf0UD++NrGKno=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-EfVsTJhROlyJVN7mtr1-5Q-1; Fri, 01 Dec 2023 05:21:04 -0500
X-MC-Unique: EfVsTJhROlyJVN7mtr1-5Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40b443d698eso12965485e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 02:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701426064; x=1702030864;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Bh0vGQqG6k9jMrVj2KcvFrOUEDKVV6QIbcGZMpO/NE=;
 b=MmqRSX/1s/lUvzXM5wrpCOoF8g9CmPhRhx3kBtmLv+g01RBU6oAZW8U2WViVOpGSXu
 cg2Boh1rKjV9ggeS1L4o4keiyVr1hXt3meyftUlI6XOnu2kO7b/io+yYKeVZ85sxnkaQ
 5wIJ0N+TKJdEIUjaK3AeHgKyp3b5g4NsU9xum9slTdi1996H82mC5v8q7yl7/HuxX0bM
 yM2AA4GYDjBx3h+ymT7L7B0PPFaO2r2cRazhdzsyUvVBHYOqp6YM+qfjX8wtHjXr2XMo
 NpPEJ25oqWXfj5F4le/pDEwFv84RIMLFMsl/kxe1zQfk+gjLHeYeQ9x4x4/TFeYGlcGN
 CrSA==
X-Gm-Message-State: AOJu0YxjKQ9VlEkSjagTZsli2/iNQ1vrrBP9lrZXH431dHwYLdrWlpMG
 GgqcquXmxy1J4lXErUSgMHhYvoaw18JORt/NSzl3thLO0Iw0jjp6r7TVGppiqBpaRZ3Kmls4cnw
 IOrfxEmVa2FPlgcMtpiw+w/rY5yk9
X-Received: by 2002:a05:600c:4504:b0:40b:5e21:d366 with SMTP id
 t4-20020a05600c450400b0040b5e21d366mr314301wmo.111.1701426063770; 
 Fri, 01 Dec 2023 02:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH48dNlPqlwgO2N+pjIvLSQ7hASCsvohHOe8o2Sdt8EJlyAAewTySsrbSEPww2SelJYsI4ukw==
X-Received: by 2002:a05:600c:4504:b0:40b:5e21:d366 with SMTP id
 t4-20020a05600c450400b0040b5e21d366mr314294wmo.111.1701426063464; 
 Fri, 01 Dec 2023 02:21:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h7-20020adf9cc7000000b0032d8eecf901sm3859764wre.3.2023.12.01.02.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 02:21:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel
 <ardb@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
In-Reply-To: <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
 <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
Date: Fri, 01 Dec 2023 11:21:02 +0100
Message-ID: <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 18.11.23 um 12:10 schrieb Javier Martinez Canillas:
>> Ard Biesheuvel <ardb@kernel.org> writes:
>> 
>> Hello Ard,
>> 
>>> On Fri, 17 Nov 2023 at 00:09, Rob Herring <robh@kernel.org> wrote:
>> 
>> [...]
>> 
>>>>>>
>>>>>> This could also lead to an interesting scenario. As simple-framebuffer
>>>>>> can define its memory in a /reserved-memory node, but that is ignored
>>>>>> in EFI boot. Probably would work, but only because EFI probably
>>>>>> generates its memory map table from the /reserved-memory nodes.
>>>>>>
>>>>>
>>>>> I see. So what would be the solution then? Ignoring creating a platform
>>>>> device for "simple-framebuffer" if booted using EFI and have an EFI-GOP?
>>>>
>>>> Shrug. I don't really know anything more about EFI FB, but I would
>>>> guess it can't support handling resources like clocks, power domains,
>>>> regulators, etc. that simple-fb can. So if a platform needs those, do
>>>> we say they should not setup EFI-GOP? Or is there a use case for
>>>> having both? Clients that don't muck with resources can use EFI-GOP
>>>> and those that do use simple-fb. For example, does/can grub use
>>>> EFI-GOP, but not simple-fb?
>>>>
>>>
>>> The EFI GOP is just a dumb framebuffer, and it is not even generally
>>> possible to cross reference the GOP with a particular device in the
>>> device hierarchy unless you e.g., compare the BARs of each device with
>>> the region described by the GOP protocol.
>>>
>>> GRUB for EFI will use the GOP and nothing else, but only at boot time
>>> (the GOP protocol is more than a magic linear memory region, it also
>>> implements a Blt() abstraction that permits the use of framebuffers
>>> that are not mapped linearly into the address space at all, and GRUB
>>> makes use of this)
>>>
>>> The EFI stub will only expose GOPs to the kernel if they are in fact
>>> linear framebuffers, but has zero insight into whether the hardware
>>> needs clocks and regulators, and whether or not the framebuffer needs
>>> IOMMU pass through (which might be the case if the scanout is using
>>> DMA into system memory)
>>>
>>> So calling EFI GOP 'source of truth' is rather generous, and I think
>>> it makes sense to prioritize more accurate descriptions of the
>>> underlying framebuffer over EFI GOP.
>>>
>> 
>> That was my opinion as well and the reason why I called the DTB the
>> single source of truth.
>> 
>>> However, making 'simple-framebuffer' magic in this regard doesn't seem
>>> like a great approach to me. Is there a better way we could get the
>>> resource conflict to be decided in a way where the EFI GOP gets
>>> superseded if its resources are claimed by another device?
>>>
>> 
>> There is an aperture [0] framework that is used by the fbdev and DRM
>> subsystems to allow native drivers to remove any conflicting devices
>> that share the same framebuffer aperture.
>> 
>> But it only makes sense for native drivers to use that I think, but
>> in this case is about two drivers that attempt to use the same frame
>> buffer provided by the firmware but getting it from different places.
>> 
>> I don't have a better idea than this patch but maybe Thomas or Sima do?
>
> At SUSE, we've carried such a patch in our repos for some time. It works 
> around the double-framebuffer problem in a similar way. [1]
>

Thanks for the information. I see that your patch is basically mine but
doing it unconditionally while this one only does the sysfb_disable() if
a "simple-framebuffer" DT node has been found.

> As Javier mentioned, we do track the framebuffer ranges for EFI/VESA/OF 
> framebuffers in the graphics aperture helpers. Fbdev has done this for 
> decades, and the current codebase extends and harmonizes this 
> functionality among fbdev and DRM drivers.
>
> WRT DT vs EFI: AFAIK the EFI support on affected platforms looks at the 
> DT to set up the EFI framebuffer. So IMHO the DT is the authoritative 
> source on the framebuffer.
>

Agreed. Sima Vetter also mentioned on IRC that they think this patch is
the least bad option. Rob, Ard any thoughts? Maybe we can land this as
a fix and then figure how this could be better handled in the long term?

> Best regards
> Thomas
>
> [1] https://bugzilla.suse.com/show_bug.cgi?id=1204315
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

