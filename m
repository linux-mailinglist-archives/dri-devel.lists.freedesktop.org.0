Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929CA72BF4E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9C710E1F3;
	Mon, 12 Jun 2023 10:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9510E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686566426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=75rPdiK8vy0+hfZPm4hKQMMWAw1iiTrCWzbw47oqQ3o=;
 b=hpjS4R0mz7ZW9HCzwujHh1+u2VbvD4XGfIc6sXJKmMfRigl9/OPVSA2EJaYKTpzHxvxINH
 l4ZwDDhAgiHSxwp1U83uP1Bwcn97jq5A2lOW8cUzweUi/TE9sd9RDNkPHk+G9y7w9jW6K+
 rY5qIKYq5cDfBOvaNppqYWeDqNA4ut4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-DJxsfdbQO9COPfzWMy-7VQ-1; Mon, 12 Jun 2023 06:40:22 -0400
X-MC-Unique: DJxsfdbQO9COPfzWMy-7VQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f81dda24d3so10544355e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 03:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686566421; x=1689158421;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=75rPdiK8vy0+hfZPm4hKQMMWAw1iiTrCWzbw47oqQ3o=;
 b=OD0nHuxJ4lKhFvEiMBo3Mwv4odOQmH1vkoZwA2F7PvbNb6cUqQactlCpz6FIak5qdZ
 Uyy/Sl4wmMC2BVq4j9t/+JpDhZEOwa1BkqU+Q2Tm09OAvOOfXmVrmFl8G7HA7Z5DhpOQ
 AwhRo6EwbwZR12FTLRP9rOwCVx69fhXY81yPmQFnSYXh2kij0bdnkJsifrRO0MNihm2e
 bV6l7/IDP5r5R9hkT6XGmDDC2JhAfFEuG9YPjXynHxkmzxU27xm/JnkE2FmGCaI3w0yB
 muXvW1RFR3jed76MhOSnLWHTUcwRPqz8LWhagK50P7EtezpHtNfdl8zUYSQX8nt9Bdh1
 C5cw==
X-Gm-Message-State: AC+VfDzP8ri84i/DXwHzijvHdGWv6JEBZmTrdvkZn5pPJxTqz5PTk52q
 2CvmtnjRZ4QD4kRqlg86ldv3nhQXcb3frxAvFoS/RjgB8hpYDwL/jrkzhyhN566uCYwZytBfpwX
 fVfQ2iBT85BFkzpL0QZnLsCqRna1a
X-Received: by 2002:a7b:ca51:0:b0:3f8:1e00:5a62 with SMTP id
 m17-20020a7bca51000000b003f81e005a62mr1113946wml.38.1686566421734; 
 Mon, 12 Jun 2023 03:40:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MsqRGgveHsuNkfrpDC1Y5y2oZ/Wv2tvp//EQrR0fI03+Glf+TK6KJrHQIoCgU/ovDWpctCw==
X-Received: by 2002:a7b:ca51:0:b0:3f8:1e00:5a62 with SMTP id
 m17-20020a7bca51000000b003f81e005a62mr1113932wml.38.1686566421434; 
 Mon, 12 Jun 2023 03:40:21 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o7-20020adfeac7000000b002fed865c55esm12153178wrn.56.2023.06.12.03.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 03:40:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from
 refcount
In-Reply-To: <7f62aa10-bc6f-96e2-d2cc-d42f0fad9e32@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-23-tzimmermann@suse.de>
 <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
 <7f62aa10-bc6f-96e2-d2cc-d42f0fad9e32@suse.de>
Date: Mon, 12 Jun 2023 12:40:20 +0200
Message-ID: <87mt152cbv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 08.06.23 um 00:22 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Detect registered instances of fb_info by reading the reference
>>> counter from struct fb_info.read. Avoids looking at the dev field
>>> and prepares fbdev for making struct fb_info.dev optional.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Steve Glendinning <steve.glendinning@shawell.net>
>>> ---
>>>   drivers/video/fbdev/smscufx.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
>>> index 17cec62cc65d..adb2b1fe8383 100644
>>> --- a/drivers/video/fbdev/smscufx.c
>>> +++ b/drivers/video/fbdev/smscufx.c
>>> @@ -1496,7 +1496,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
>>>   	u8 *edid;
>>>   	int i, result = 0, tries = 3;
>>>   
>>> -	if (info->dev) /* only use mutex if info has been registered */
>>> +	if (refcount_read(&info->count)) /* only use mutex if info has been registered */
>> 
>> The struct fb_info .count refcount is protected by the registration_lock
>> mutex in register_framebuffer(). I think this operation isn't thread safe ?
>
> It's an atomic read.
>
> https://elixir.bootlin.com/linux/latest/source/include/linux/refcount.h#L147
>

Yes, is an atomic read but by reading [0] my understanding is that does
not provide memory ordering guarantees. Maybe I misunderstood though...

[0]: https://www.kernel.org/doc/html/latest/core-api/refcount-vs-atomic.html

> And that function is only being called from the USB probe callback 
> before registering the framebuffer. It's not clear to me how the value 
> could be anything but zero. I'd best leave it as is with the ref counter.
>

Yes, I'm OK with that and as mentioned I don't think that's less safe
than the previous info->dev check with regard to race conditions.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

