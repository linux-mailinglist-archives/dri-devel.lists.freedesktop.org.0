Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4778B2449
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D6811A4E3;
	Thu, 25 Apr 2024 14:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QJNrwg+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C11E11A4E1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714056316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZubHCtXDSlDiNjtbhlVfa47NJZTf/QQgEF9HNNRnrpc=;
 b=QJNrwg+Jvuwlw0vs8/GNmo+/19+VW2c/Yar2+lfOTbAunn9r6/gh1+kfFwVJZ99bWDF/m2
 xKmNJ933bIqo/CBqAYwRkD8BJkc0weQmSvUPEGqWESF+lzpgi9E8fMbaPuib81ns8/8Cd8
 dQXcvYZ7Zcqo7SfVc37TvXK9DJdfLdk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-8Hq2BqozPZqSD1nwJXdVsw-1; Thu, 25 Apr 2024 10:45:11 -0400
X-MC-Unique: 8Hq2BqozPZqSD1nwJXdVsw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2dd1dbde466so9402901fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714056308; x=1714661108;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZubHCtXDSlDiNjtbhlVfa47NJZTf/QQgEF9HNNRnrpc=;
 b=vHNuNwbLU0af6eDsMxalgcezChNvhNdUg0teZct/kkJPXGZjoVO4j2IbBp7TVv91ld
 1NZ+rGWg3uGkTOU6hj0BobgRnI9r74P+qRa9jUp/rQZwHTkCCGDM4rfpGxb/wUjAp7I5
 0RjNhL4ve+8xEtL71GZsPuD1TwnK55tESVWRBjbav4q3IEqxKNJ+7X/nt75Iim7qSz9Q
 rDNSLuCbKuYF5xB8z1B729GlMRkey2vtWcC+e5d/+tChx57TMa91hz3kmR7T3TNa0QS9
 F2uXr37qT+cH223W+SVwOKTHSkJJ2taaH51hPJGjAUvE8ICsrJkAC/XYmvk5TGO3wT+Q
 2SsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTN8Wr4TB1T1xx9xEw4edmV543SVm1ziLyYY1y3xWMgvsUvrqEgt9io/+Ver9Ci8eqWZUsKpj8L8iB8sA0E39b2MWnEVMa282TlNwmV6Hi
X-Gm-Message-State: AOJu0YwypGMUOqCFIfAvt+6xfBO8MSAV38OKmLz3RpJxU1kBfpl2JlXy
 s1JR03J5oKi7LxMH9zBSwX5jcvLk7QpMKq5zf2rT4gEA/n2hhOyOGvuLTLpf5OFhyCetA0A1cd7
 zfMPd9OmYyexv/VRc9Wnai7eu4jtZdS5It8s7ZrysAlvKmM6RytPgLiqOc1pg02p9ng==
X-Received: by 2002:a2e:8346:0:b0:2da:bbf4:81b8 with SMTP id
 l6-20020a2e8346000000b002dabbf481b8mr3523046ljh.14.1714056307861; 
 Thu, 25 Apr 2024 07:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2uHszwgcgWYNWC1sA6fA2CDpWKf9lvVT0t3YBkpRT8qSW7BlgzlOt4c00AAdz79TQEB56HA==
X-Received: by 2002:a2e:8346:0:b0:2da:bbf4:81b8 with SMTP id
 l6-20020a2e8346000000b002dabbf481b8mr3523014ljh.14.1714056307207; 
 Thu, 25 Apr 2024 07:45:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c470b00b0041a963bf2cdsm11668719wmo.36.2024.04.25.07.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 07:45:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Steven Price <steven.price@arm.com>, Andy Yan <andyshrk@163.com>,
 boris.brezillon@collabora.com
Cc: daniel@ffwll.ch, airlied@gmail.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Andy Yan
 <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/panthor: Add defer probe for firmware load
In-Reply-To: <501d18c9-3116-4cd1-8091-b9f552e9fb5a@arm.com>
References: <20240413114938.740631-1-andyshrk@163.com>
 <54e4a174-dea7-4588-b8a6-0310c210ffce@arm.com>
 <87frv9zthu.fsf@minerva.mail-host-address-is-not-set>
 <501d18c9-3116-4cd1-8091-b9f552e9fb5a@arm.com>
Date: Thu, 25 Apr 2024 16:45:06 +0200
Message-ID: <87y1918psd.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Steven Price <steven.price@arm.com> writes:

> Hi Javier,
>
> On 25/04/2024 10:22, Javier Martinez Canillas wrote:
>> Steven Price <steven.price@arm.com> writes:
>> 
>> Hello Steven,
>> 
>>> On 13/04/2024 12:49, Andy Yan wrote:
>>>> From: Andy Yan <andy.yan@rock-chips.com>
>>>>
>>>> The firmware in the rootfs will not be accessible until we
>>>> are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
>>>> that point.
>>>> This let the driver can load firmware when it is builtin.
>>>
>>> The usual solution is that the firmware should be placed in the
>>> initrd/initramfs if the module is included there (or built-in). The same
>>> issue was brought up regarding the powervr driver:
>>>
>>> https://lore.kernel.org/dri-devel/20240109120604.603700-1-javierm@redhat.com/T/
>>>
>>> I'm not sure if that ever actually reached a conclusion though. The
>>> question was deferred to Greg KH but I didn't see Greg actually getting
>>> involved in the thread.
>>>
>> 
>> Correct, there was not conclusion reached in that thread.
>
> So I think we need a conclusion before we start applying point fixes to
> individual drivers.
>

Agreed.

[...]

>> 
>> In the thread you referenced I suggested to add that logic in request_firmware()
>> (or add a new request_firmware_defer() helper function) that changes the request
>> firmare behaviour to return -EPROBE_DEFER instead of -ENOENT.
>
> That would seem like a good feature if it's agreed that deferring on
> request_firmware is a good idea.
>

Yeah. I didn't attempt to type that patch because didn't get an answer
from Greg and didn't want to spent the time writing and testing a patch
to just be nacked.

>> Since as you mentioned, this isn't specific to panthor and an issue that I also
>> faced with the powervr driver.
>
> I'm not in any way against the idea of deferring the probe until the
> firmware is around - indeed it seems like a very sensible idea in many
> respects. But I don't want panthor to be 'special' in this way.
>
> If the consensus is that the firmware should live with the module (i.e.
> either both in the initramfs or both in the rootfs) then the code is
> fine as it is. That seemed to be the view of Sima in that thread and
> seems reasonable to me - why put the .ko in the initrd if you can't
> actually use it until the rootfs comes along?
>

That's indeed a sensible position for me as well and is what I answered to
the user who reported the powervr issue.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

